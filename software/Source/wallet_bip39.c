#include "..\Include\wallet_bip39.h"
#include "..\Include\wallet_bip39_list.h"

#include <string.h>
/*
const char* FchrMnemonicGenerate(alt_32 P32Strength)
{
    if (P32Strength % 32 || P32Strength < 128 || P32Strength > 256)
    {
        return 0;
    }

}*/

const char *FchrMnemonicFromData(const alt_u8 *u08DataPtr, alt_32 len)
{
    if (len % 4 || len < 16 || len > 32)
    {
        return 0;
    }

    static char mnemonic[240];
    alt_u8 bits[33];

    memcpy(bits, u08DataPtr, len);
    alt_u32 u32PhraseLen = len * 3 / 4;

    alt_u32 i, j, idx;
    char *p = mnemonic;
    for (i = 0; i< u32PhraseLen; i++)
    {
    	idx = 0;
    	for (j = 0; j < 11; j++)
    	{
    		idx <<= 1;
            idx += (bits[(i * 11 + j) / 8] & (1 << (7 - ((i * 11 + j) % 8)))) > 0;
    	}
    	strcpy(p, CchrMnemonicWorldListArrPtr[idx]);
    	p += strlen(CchrMnemonicWorldListArrPtr[idx]);
    	*p = (i < u32PhraseLen - 1) ? ' ' : 0;
    	p++;
    }
    //memzero!!!!
   	return mnemonic;
}