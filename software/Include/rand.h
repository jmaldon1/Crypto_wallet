#ifndef __RAND_H__
#define __RAND_H__

#include <stdlib.h>
#include "alt_types.h"

alt_u32 random32(void);

void random_buffer(alt_u8 *buf, size_t len);

#endif
