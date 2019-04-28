#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>

/*libbtc includes*/
#include <btc.h>
#include <tx.h>
#include <bip32.h>
#include <base58.h>
#include <ecc.h>
#include <tool.h>
#include <utils.h>

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_sys_wrappers.h"
#include "alt_types.h"

#include "hashmap.h"
#include "uart_usb.h"
#include "rand.h"
//#include "bip39.h"

#define BUF_SIZE 1024 * 1024

const btc_chainparams* chain = &btc_chainparams_test;

void initialize()
{
	/* initialize hardware random number generator */
	alt_u32 randSeed = 0x12345678;
    initRandom(randSeed);

    /* initialize uart to usb */
    initUart();
}


static bool showError(const char* er)
{
    printf("Error: %s\n", er);
    btc_ecc_stop();
    return 1;
}


void create_priv_key()
{
	size_t sizeout = 128;
	char newprivkey_wif[sizeout];
	char newprivkey_hex[sizeout];

	/* generate a new private key */
	gen_privatekey(chain, newprivkey_wif, sizeout, newprivkey_hex);
	printf("privatekey WIF: %s\n", newprivkey_wif);
	printf("privatekey HEX: %s\n", newprivkey_hex);
	memset(newprivkey_wif, 0, strlen(newprivkey_wif));
	memset(newprivkey_hex, 0, strlen(newprivkey_hex));
}

btc_bool hdgenmaster(char* masterkey, size_t sizeout)
{
	btc_hdnode node;
	alt_u8 seed[32];
	getRandomBuffer(&(seed[0]), 32);
	btc_hdnode_from_seed(seed, 32, &node);
	memset(seed, 0, 32);
	btc_hdnode_serialize_private(&node, chain, masterkey, sizeout);
	memset(&node, 0, sizeof(node));
	return true;
}

btc_bool hd_save_node(const btc_chainparams* chain, const char* nodeser, map_t keymap)
{
	btc_hdnode node;
	if (!btc_hdnode_deserialize(nodeser, chain, &node))
		return false;

	/* Make Public Key */
	size_t strsize = 128;
	char str[strsize];
	btc_hdnode_get_p2pkh_address(&node, chain, str, strsize);

	/* Make Private Key */
	size_t privkey_wif_size_bin = 34;
	uint8_t pkeybase58c[privkey_wif_size_bin];
	pkeybase58c[0] = chain->b58prefix_secret_address;
	pkeybase58c[33] = 1; /* always use compressed keys */
	size_t privkey_wif_size = 128;
	char privkey_wif[privkey_wif_size];
	memcpy(&pkeybase58c[1], node.private_key, BTC_ECKEY_PKEY_LENGTH);
	assert(btc_base58_encode_check(pkeybase58c, privkey_wif_size_bin, privkey_wif, privkey_wif_size) != 0);

	/* make copies of variables to store into hashmap */
	char* pubaddr_copy = malloc(sizeof(char) * strsize);
	char* privkey_wif_copy = malloc(sizeof(char) * privkey_wif_size);
	strcpy(pubaddr_copy, str);
	strcpy(privkey_wif_copy, privkey_wif);

	if (btc_hdnode_has_privkey(&node)) {
		printf("pubkey: %s\n", str);
		printf("privatekey WIF: %s\n", privkey_wif);

		/* Store Pubkey and Privkey into hashmap */
		hashmap_put(keymap, pubaddr_copy, privkey_wif_copy);
	}
	return true;
}

int hdderive(char* pkey, char* keypath, char* p2pkh_address, map_t keymap)
{
	if (!pkey)
		return showError("Missing extended key (use -p)");
	if (!keypath)
		return showError("Missing keypath (use -m)");
	size_t sizeout = 128;
	char newextkey[sizeout];

	//check if we derive a range of keys
	unsigned int maxlen = 1024;
	int posanum = -1;
	int posbnum = -1;
	int end = -1;
	uint64_t from;
	uint64_t to;

	static char digits[] = "0123456789";
	for (unsigned int i = 0; i<strlen(keypath); i++) {
		if (i > maxlen) {
			break;
		}
		if (posanum > -1 && posbnum == -1) {
			if (keypath[i] == '-') {
				if (i-posanum >= 9) {
					break;
				}
				posbnum = i+1;
				char buf[9] = {0};
				memcpy (buf, &keypath[posanum], i-posanum);
				from = strtoull(buf, NULL, 10);
			}
			else if (!strchr(digits, keypath[i])) {
				posanum = -1;
				break;
			}
		}
		else if (posanum > -1 && posbnum > -1) {
			if (keypath[i] == ']' || keypath[i] == ')') {
				if (i-posbnum >= 9) {
					break;
				}
				char buf[9] = {0};
				memcpy (buf, &keypath[posbnum], i-posbnum);
				to = strtoull(buf, NULL, 10);
				end = i+1;
				break;
			}
			else if (!strchr(digits, keypath[i])) {
				posbnum = -1;
				posanum = -1;
				break;
			}
		}
		if (keypath[i] == '[' || keypath[i] == '(') {
			posanum = i+1;
		}
	}

	if (end > -1 && from <= to) {
		for (uint64_t i = from; i <= to; i++) {
			char keypathnew[strlen(keypath)+16];
			memcpy(keypathnew, keypath, posanum-1);
			char index[9] = {0};
			sprintf(index, "%lld", i);
			memcpy(keypathnew+posanum-1, index, strlen(index));
			memcpy(keypathnew+posanum-1+strlen(index), &keypath[end], strlen(keypath)-end);


			if (!hd_derive(chain, pkey, keypathnew, newextkey, sizeout))
				return showError("Deriving child key failed\n");
			else
				hd_print_node(chain, newextkey, p2pkh_address);
				hd_save_node(chain, newextkey, keymap);
		}
	}
	else {
		if (!hd_derive(chain, pkey, keypath, newextkey, sizeout))
			return showError("Deriving child key failed\n");
		else
			hd_print_node(chain, newextkey, p2pkh_address);
			hd_save_node(chain, newextkey, keymap);
	}
	return 0;
}

int sign_tx(btc_tx *tx, char* txhex, char* scripthex, char* pkey, uint64_t amount, int inputindex, int sighashtype, char* signed_txhex)
{
	if(!txhex || !scripthex) {
		return showError("Missing tx-hex or script-hex (use -x, -s)\n");
	}

	if (strlen(txhex) > 1024*100) { //don't accept tx larger then 100kb
		return showError("tx too large (max 100kb)\n");
	}
	printf("PRIVKEY INSIDE SIGN: %s\n", pkey);
	size_t privkey_wif_size = 128;
	char* pkey_wif = malloc(sizeof(char) * privkey_wif_size);
	strcpy(pkey_wif, pkey);

	//deserialize transaction
//	btc_tx* tx = btc_tx_new();
	uint8_t* data_bin = btc_malloc(strlen(txhex) / 2 + 1);
	int outlen = 0;
	utils_hex_to_bin(txhex, data_bin, strlen(txhex), &outlen);
	/* Only deserialize on the first iteration of the loop */
	if(inputindex == 0){
		if (!btc_tx_deserialize(data_bin, outlen, tx, NULL, true)) {
			free(data_bin);
			btc_tx_free(tx);
			return showError("Invalid tx hex");
		}
	}
	free(data_bin);
	printf("PRIVKEY_WIF AFTER DESERIALIZE: %s\n", pkey_wif);

	if ((size_t)inputindex >= tx->vin->len) {
		btc_tx_free(tx);
		return showError("Inputindex out of range");
	}

	btc_tx_in *tx_in = vector_idx(tx->vin, inputindex);

	uint8_t script_data[strlen(scripthex) / 2 + 1];
	utils_hex_to_bin(scripthex, script_data, strlen(scripthex), &outlen);
	cstring* script = cstr_new_buf(script_data, outlen);

	uint256 sighash;
	memset(sighash, 0, sizeof(sighash));
	btc_tx_sighash(tx, script, inputindex, sighashtype, 0, SIGVERSION_BASE, sighash);

	char *hex = utils_uint8_to_hex(sighash, 32);
	utils_reverse_hex(hex, 64);

	enum btc_tx_out_type type = btc_script_classify(script, NULL);
	printf("script: %s\n", scripthex);
	printf("script-type: %s\n", btc_tx_out_type_to_str(type));
	printf("inputindex: %d\n", inputindex);
	printf("sighashtype: %d\n", sighashtype);
	printf("hash: %s\n", hex);

	// sign
	btc_bool sign = false;
	btc_key key;
	btc_privkey_init(&key);
	if (btc_privkey_decode_wif(pkey_wif, chain, &key)) {
		sign = true;
	}
	else {
		if (strlen(pkey_wif) > 50) {
			btc_tx_free(tx);
			cstr_free(script, true);
			return showError("Invalid wif privkey\n");
		}
		printf("No private key provided, signing will not happen\n");
	}
	free(pkey_wif);
	if (sign) {
		uint8_t sigcompact[64] = {0};
		int sigderlen = 74+1; //&hashtype
		uint8_t sigder_plus_hashtype[75] = {0};
		enum btc_tx_sign_result res = btc_tx_sign_input(tx, script, amount, &key, inputindex, sighashtype, sigcompact, sigder_plus_hashtype, &sigderlen);
		cstr_free(script, true);

		if (res != BTC_SIGN_OK) {
			printf("!!!Sign error:%s\n", btc_tx_sign_result_to_str(res));
		}

		char sigcompacthex[64*2+1] = {0};
		utils_bin_to_hex((unsigned char *)sigcompact, 64, sigcompacthex);

		char sigderhex[74*2+2+1]; //74 der, 2 hashtype, 1 nullbyte
		memset(sigderhex, 0, sizeof(sigderhex));
		utils_bin_to_hex((unsigned char *)sigder_plus_hashtype, sigderlen, sigderhex);

		printf("\nSignature created:\n");
		printf("signature compact: %s\n", sigcompacthex);
		printf("signature DER (+hashtype): %s\n", sigderhex);

		cstring* signed_tx = cstr_new_sz(1024);
		btc_tx_serialize(signed_tx, tx, true);

		char signed_tx_hex[signed_tx->len*2+1];
		utils_bin_to_hex((unsigned char *)signed_tx->str, signed_tx->len, signed_tx_hex);
//		printf("signed TX: %s\n", signed_tx_hex);
		strcpy(signed_txhex, signed_tx_hex);
		cstr_free(signed_tx, true);

	}
	return 0;
}

char **parseData(char *str)
{
	char ** res  = NULL;
	char *  p    = strtok (str, ":");
	int n_spaces = 0, i;

	/* split string and append tokens to 'res' */
	while (p) {
	  res = realloc (res, sizeof (char*) * ++n_spaces);

	  if (res == NULL)
	    exit (-1); /* memory allocation failed */

	  res[n_spaces-1] = p;

	  p = strtok (NULL, ":");
	}

	/* realloc one extra element for the last NULL */
	res = realloc (res, sizeof (char*) * (n_spaces+1));
	res[n_spaces] = 0;

	/* print the result */
	for (i = 0; i < (n_spaces+1); ++i)
	  printf ("res[%d] = %s\n", i, res[i]);

	return res;
}


int main()
{
	/* start ECC context */
	printf("Setting up...\n");
	btc_ecc_start();
	printf("Done!\n");

    initialize();

    //Create Hash Table
	map_t keymap;
	keymap = hashmap_new();

//    void *memory_test = malloc(1024 * 1024 * 10);
//    printf("SDRAM malloc returned 0x%08lx\n", (alt_u32)memory_test);


//	PutStrUart("FPGA Cryptocurreny Wallet\n");

//	alt_u8 data[32];
//	getRandomBuffer(&(data[0]), 32);


//	const char *mnemonic_phrase = mnemonic_generate(128);
//	printf("MNEMONIC PHRASE: %s\n", mnemonic_phrase);

//	char buffer[2048];

//	sprintf(buffer, "Random Buffer:\n");
//	PutStrUart((char *)&(buffer[0]));
//
//	for(int i = 0; i < 32; ++i)
//	{
//		sprintf(buffer, "0x%02x\n", data[i]);
//		PutStrUart((char *)&(buffer[0]));
//	}

//	sprintf(buffer, "Menmonic phrase: %s\n", mnemonic_phrase);
//	PutStrUart((char *)&(buffer[0]));

	//Hardcoding some addresses that have value in them
	hashmap_put(keymap, "mx97R1ymecapsDH8t7jVNH9henf8vxzuGD", "cRGz9MNtZHKPQ4Y1hvz5ncXHj3zzup7W6G4LCFw728JrHtnYKa6P");
	hashmap_put(keymap, "mp8hL5KPhy71XU8Q1HfaYtJYJHcBMciFKN", "cNMfHuYtJRePmTnzeaDKXZ64wu9DMJWnu1f8S7s96vDrnnZozjw2");

	alt_u8 count = 0;
	alt_u32 randVal;
	char buf[BUF_SIZE] = {'\0'};
	char *key;
	char *val;
	char **res;
	const size_t sizeout = 128;
	char masterkey[sizeout];
	masterkey[0] = '\0';
	char p2pkh_address[sizeout];
	char* txhex;
	char* script;
	char* pub_addr;
	int input_idx;
	char* signed_txhex;
	size_t privkey_wif_size = 128;
	char* privkey_wif = malloc(sizeof(char) * privkey_wif_size);
	btc_tx* tx;

    while(1)
    {
    	uartGetLine(&buf);
    	if (strlen(buf) > 0) {
    		printf("Buf: %s\n", buf);
//    		int test = hashmap_length(keymap);
//    		printf("Length of hashtable: %d\n", test);
    		res = parseData(buf);
    		key = res[0];
    		val = res[1];
    		/* remove the \n from the end of the string */
    		val[strcspn(val, "\n")] = 0;
//    		printf("%d", strlen(val));

    		if(!strcmp(key, "masterkey")){
    			if(masterkey[0] == '\0'){
    				hdgenmaster(masterkey, sizeout);
    			}
    			hdderive(masterkey, val, p2pkh_address, keymap);
    			PutStrUart(p2pkh_address, 1000);
    		}else if(!strcmp(key, "keypath")){
    			if(masterkey[0] == '\0'){
					hdgenmaster(masterkey, sizeout);
				}
    			hdderive(masterkey, val, p2pkh_address, keymap);
    			PutStrUart(p2pkh_address, 1000);
    		}else if(!strcmp(key, "sign")){
    			txhex = res[1];
    			script = res[2];
    			pub_addr = res[3];
    			input_idx = atoi(res[4]);
    			hashmap_get(keymap, pub_addr, (void**)(&privkey_wif));
    			printf("privkey: %s\n", privkey_wif);

    			tx = btc_tx_new();
				for(int i = 0; i < input_idx; i++){
					sign_tx(tx, txhex, script, privkey_wif, 0, i, 1, signed_txhex);
				}
				PutStrUart(signed_txhex, 1000);

				/* Free memory */
				btc_tx_free(tx);
    		}
    		/* free the memory allocated */
    		free(res);
    		memset(buf, 0, BUF_SIZE);
    	}

		count++;
		if ((count % 1000000000) == 0)
		{
	    	randVal = u32getRandom();
	    	IOWR_ALTERA_AVALON_PIO_DATA(PO_LED_BASE, randVal & 0xFF);
//	    	sprintf(buffer, "Random value: 0x%08x\n", randVal);
//	    	PutStrUart((char *)&(buffer[0]));
		}
		ALT_USLEEP(100);
    }

    closeUart();
    btc_ecc_stop();

    return 0;
}

