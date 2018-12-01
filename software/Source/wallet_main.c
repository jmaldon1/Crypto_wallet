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
<<<<<<< HEAD
#include "..\Include\wallet_bip39.h"
=======
#include "..\Include\bip39.h"
>>>>>>> f5969070a85ee9c951bcafd19094333b8dea23b1
#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

#include <stdlib.h>
#include <stdio.h>

void niosTest()
{
<<<<<<< HEAD
	void *lots_of_memory = malloc(1024 * 1024 * 10);	// attempt to allocate 10MB
    printf("SDRAM malloc returned 0x%08lx\n", (alt_u32)lots_of_memory);

    alt_u8	count = 0;
    alt_u16 delay;
    alt_u8	buttons;
    alt_u8	switches;
    alt_u8	leds;
=======
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
>>>>>>> f5969070a85ee9c951bcafd19094333b8dea23b1

    // main loop
    while(1)
    {
    	buttons = IORD_ALTERA_AVALON_PIO_DATA(PI_KEY_BASE);
		switches =IORD_ALTERA_AVALON_PIO_DATA(PI_SW_BASE);
		leds = switches;
//		leds = (((switches & 0xF) << 4) | ((buttons & 0x3) << 2) | (count & 0x3));
        IOWR_ALTERA_AVALON_PIO_DATA(PO_LED_BASE, leds);
        delay = 0;
        while(delay < 200000)
        {
            delay++;
        }
        count++;
    }
}

int main()
{
	printf("----------------------------------------------------------------\n");
	printf("Hardware Cryptocurrency Wallet on an FPGA\n");
	printf("Software Build: %d.%d.%d\n\n", SOFTWARE_VERSION_MAJOR, SOFTWARE_VERSION_MINOR, SOFTWARE_VERSION_REV);
	printf("----------------------------------------------------------------\n");

	const char * CchrPhrase = FchrMenomicGenerate(256);
	printf("Generated Mnemonic Phrase: %s\n", CchrPhrase);
	return 0;
}
