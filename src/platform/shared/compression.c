#if ENABLE_RL_LZ_LOGGING
#include <stdio.h>
#endif
#include "platform/platform.h"
#include "platform/ext/gbagfx/global.h"
#include "platform/ext/gbagfx/lz.h"
#include "platform/ext/gbagfx/rl.h"

unsigned char *Platform_LZDecompress(unsigned char *src, int srcSize)
{
    int uncompressedSize = 0;
    unsigned char *dest = LZDecompress(src, srcSize, &uncompressedSize);
#if ENABLE_RL_LZ_LOGGING
    printf("LZDecompress(%p, %p) stored 0x%X bytes.\n", src, dest, uncompressedSize);
#endif

    return dest;
}

unsigned char *Platform_RLDecompress(unsigned char *src, int srcSize)
{
    int uncompressedSize = 0;
    unsigned char *dest = RLDecompress(src, srcSize, &uncompressedSize);
#if ENABLE_RL_LZ_LOGGING
    printf("RLDecompress(%p, %p) stored 0x%X bytes.\n", src, dest, uncompressedSize);
#endif

    return dest;
}

void Platform_LZFree(unsigned char *dest) { free(dest); }

void Platform_RLFree(unsigned char *dest) { free(dest); }

/* NOTE:
 * "Unsafe" versions included for compatibility.
 * This is just here so it doesn't fail if someone accidentally calls
 * LZUnCompWram, LZUnCompVram, RLUnCompWram or RLUnCompVram.
 *
 * Please do NOT call them directly if you know the size of the compressed data!
 * (Use Platform_LZDecompress and Platform_RLDecompress instead!)
 */
void Platform_LZDecompressUnsafe(unsigned char *src, unsigned char *dest)
{
    int uncompressedSize = 0;
    LZDecompressUnsafe(src, dest, &uncompressedSize);
#if ENABLE_RL_LZ_LOGGING
    printf("LZDecompress(%p, %p) stored 0x%X bytes.\n", src, dest, uncompressedSize);
#endif
}

void Platform_RLDecompressUnsafe(unsigned char *src, unsigned char *dest)
{
    int uncompressedSize = 0;
    RLDecompressUnsafe(src, dest, &uncompressedSize);
#if ENABLE_RL_LZ_LOGGING
    printf("RLDecompress(%p, %p) stored 0x%X bytes.\n", src, dest, uncompressedSize);
#endif
}
