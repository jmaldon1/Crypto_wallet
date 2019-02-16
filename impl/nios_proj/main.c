#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>

/*libbtc includes*/
#include <btc.h>
#include <tx.h>

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_sys_wrappers.h"
#include "alt_types.h"

#include "uart_usb.h"
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

void hdgenmaster(char* masterkey, size_t sizeout)
{
//	size_t sizeout = 128;
//	char masterkey[sizeout];

	/* generate a new hd master key */
	hd_gen_master(chain, masterkey, sizeout);
//	printf("masterkey: %s\n", masterkey);
}

int hdderive(char* pkey, char* keypath, char* p2pkh_address)
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
		}
	}
	else {
		if (!hd_derive(chain, pkey, keypath, newextkey, sizeout))
			return showError("Deriving child key failed\n");
		else
			hd_print_node(chain, newextkey, p2pkh_address);
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
//	/* free the memory allocated */
//
//	free (res);
}


int main()
{
	/* start ECC context */
	btc_ecc_start();

    initialize();
//    create_priv_key();
//    void *memory_test = malloc(1024 * 1024 * 10);
//    printf("SDRAM malloc returned 0x%08lx\n", (alt_u32)memory_test);


//	PutStrUart("FPGA Cryptocurreny Wallet\n");

	alt_u8 data[32];
	getRandomBuffer(&(data[0]), 32);


//	const char *mnemonic_phrase = mnemonic_generate(128);
//	printf("MNEMONIC PHRASE: %s\n", mnemonic_phrase);

	char buffer[2048];

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

	alt_u8 count = 0;
	alt_u32 randVal;
	char buf[BUF_SIZE] = {'\0'};
	char *key;
	char *val;
	char **res;
	size_t sizeout = 128;
	char masterkey[sizeout];
	char p2pkh_address[sizeout];

    while(1)
    {
    	uartGetLine(&buf);
    	if (strlen(buf) > 0) {
    		printf("Buf: %s", buf);
    		res = parseData(buf);
    		key = res[0];
    		val = res[1];
    		/* remove the \n from the end of the string */
    		val[strcspn(val, "\n")] = 0;
//    		printf("%d", strlen(val));

    		if(!strcmp(key, "masterkey")){
    			if(masterkey[0] == '\0'){
    				hdgenmaster(masterkey, sizeout);
//    				append(masterkey, '\n');
//    				PutStrUart(masterkey);
    				printf("masterkey len: %d", strlen(masterkey));
    				printf("created master key: %s\n", masterkey);
    			}
    			printf("keypath: %s\n", val);
    			hdderive("tprv8ZgxMBicQKsPenpKWDfinxYMdQQS2HxdvqaXhy6mNdY2R56XQ6dhCGBdEquDR7QHM4tBbCRzFadMW3TB9sQB8rE5iMCvJ6fhF2FEgYDjeMw", "m/44h/1h/0h/0/0", p2pkh_address);
    			append(p2pkh_address, '\n');
    			PutStrUart(p2pkh_address);
//    			printf("derive FIRST HD child node: %s\n", val);
//    			PutStrUart("FIRST Address\n");

    		}else if(!strcmp(key, "keypath")){
    			hdderive(masterkey, val, p2pkh_address);
    			append(p2pkh_address, '\n');
    			PutStrUart(p2pkh_address);
//    			printf("derive FOLLOWING HD child node: %s\n", val);
//    			PutStrUart("FOLLOWING Address\n");
    		}

    		/* free the memory allocated */
    		free(res);
    		memset(buf, 0, BUF_SIZE);
//    		memset(masterkey, 0, strlen(masterkey));
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

