#ifndef __BIP39_H__
#define __BIP39_H__

#include <stdint.h>

#define BIP39_PBKDF2_ROUNDS 2048

const char *mnemonic_generate(int strength);	// strength in bits

char *mnemonic_from_data(const uint8_t *data, int len);

// passphrase must be at most 256 characters or code may crash
void mnemonic_to_seed(const char *mnemonic, const char *passphrase, uint8_t seed[512 / 8], void (*progress_callback)(uint32_t current, uint32_t total));

int mnemonic_to_entropy(const char *mnemonic, uint8_t *entropy);

#endif
