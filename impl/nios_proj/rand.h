#ifndef __RAND_H__
#define __RAND_H__

#include "alt_types.h"

void initRandom(alt_u32 seed);

alt_u32 u32getRandom();

alt_u8 u08getRandom();

void getRandomBuffer(alt_u8 *buffer, alt_u32 len);

#endif
