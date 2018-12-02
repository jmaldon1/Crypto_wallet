/*
 * Company:
 * Author: B. Silver, J.Maldonado
 *
 * Create Date: 11/25/2018
 * Module Name: wallet_main.c
 * Revision:
 * Description: Main source file
 */

#include "..\Include\wallet_main.h"
#include "..\Include\wallet_status.h"
//#include "..\Include\bip39.h"
#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

#include <stdlib.h>
#include <stdio.h>

#include "..\Include\rand.h"


int main()
{
	printf("Hello World from NIOS II\n");
	printf("Software Version: %d.%d.%d\n\n", SOFTWARE_VERSION_MAJOR, SOFTWARE_VERSION_MINOR, SOFTWARE_VERSION_REV);

//	int delay = 0;
//	while(delay < 2000000)
//	{
//		delay++;
//	}
	uint32_t rand_val = random32();
	printf("Random value: 0x%08lx\n", rand_val);

//	uint8_t seed[64];

//    const char *mnemonic_phrase = mnemonic_generate(128);
//    printf("MNEMONIC PHRASE: %s", mnemonic_phrase);

//    mnemonic_to_seed(mnemonic_phrase, "TEST", seed, 0);
//
//	printf("Seed: ");
//	for(int i = 0; i < 64; i++){
//		printf("%x", seed[i]);
//	}
//	printf("\n");
	while(1){}
	return 0;
}
