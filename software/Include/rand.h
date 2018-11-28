#ifndef __RAND_H__
#define __RAND_H__

#include <stdint.h>
#include <stdlib.h>

uint32_t random32(void);
void random_buffer(uint8_t *buf, size_t len);

#endif