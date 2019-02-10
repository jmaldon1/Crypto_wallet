#ifndef __BIP39_H__
#define __BIP39_H__

#include "alt_types.h"


const char *mnemonic_generate(int strength);

const char *mnemonic_from_data(const alt_u8 *data, int len);

#endif
