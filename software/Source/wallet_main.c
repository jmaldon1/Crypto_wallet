/*
 * Company:
 * Author: B. Silver
 *
 * Create Date: 11/25/2018
 * Module Name: wallet_main.c
 * Revision:
 * Description: Main source file
 */

#include "..\Include\wallet_main.h"
#include "..\Include\wallet_status.h"
#include "..\Include\bip39.h"
#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

#include <stdlib.h>
#include <stdio.h>


int main()
{
	printf("Hello World from NIOS II hol\n");
	printf("Software Version: %d.%d.%d\n\n", SOFTWARE_VERSION_MAJOR, SOFTWARE_VERSION_MINOR, SOFTWARE_VERSION_REV);

	void *lots_of_memory = malloc(1024 * 1024 * 10);	// attempt to allocate 10MB
    printf("SDRAM malloc returned 0x%08lx\n", (alt_u32)lots_of_memory);

    uint8_t seed[64];

    const char *mnemonic_phrase = mnemonic_generate(128);
    printf("MNEMONIC PHRASE: %s", mnemonic_phrase);

    mnemonic_to_seed(mnemonic_phrase, "TEST", seed, 0);

	printf("Seed: ");
	for(int i = 0; i < 64; i++){
		printf("%x", seed[i]);
	}
	printf("\n");


    int count = 0;
    int delay;

    // main loop
    while(1)
    {
        IOWR_ALTERA_AVALON_PIO_DATA(PO_LED_BASE, count & 0xFF);
        delay = 0;
        while(delay < 200000)
        {
            delay++;
        }
        count++;
    }

	return 0;
}
