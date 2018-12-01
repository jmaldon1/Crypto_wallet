/*
 * Company:
 * Author: B. Silver
 *
 * Create Date: 11/29/2018
 * Module Name: wallet_bip39.h
 * Revision:
 * Description: Header file defintions of system status
 */

#ifndef __WALLET_BIP39_H__
#define __WALLET_BIP39_H__

#include "alt_types.h"
//#include "..\Include\wallet_bip39_list.h"

#define BIP39_PBKDF2_ROUNDS 2048


const char* FchrMnemonicGenerate(alt_32 P32Strength);

const char *FchrMnemonicFromData(const alt_u8 *u08DataPtr, alt_32 len);
//void mnemonic_to_seed(const char *mnemonic, const char *passphrase, uint8_t seed[512 / 8]/*, void (*progress_callback)(uint32_t current, uint32_t total)*/);

#endif
