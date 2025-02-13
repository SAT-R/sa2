#ifndef GUARD_SA2_PLATFORM_H
#define GUARD_SA2_PLATFORM_H

#include "gba/types.h"

/* NOTE:
 * "Unsafe" versions included for compatibility.
 * This is just here so if someone accidentally calls
 * LZUnCompWram, LZUnCompVram, RLUnCompWram orRLUnCompVram, it doesn't fail.
 *
 * Please do NOT call them directly if you know the size of the compressed data!
 * Use Platform_LZDecompress and Platform_RLDecompress instead, and also
 * make sure to call Platform_LZFree, Platform_RLFree once the data is not needed
 * anymore.
 */
#define ENABLE_RL_LZ_LOGGING 1
extern unsigned char *Platform_LZDecompress(unsigned char *src, int srcSize);
extern unsigned char *Platform_RLDecompress(unsigned char *src, int srcSize);
extern void Platform_LZFree(unsigned char *dest);
extern void Platform_RLFree(unsigned char *dest);
extern void Platform_LZDecompressUnsafe(unsigned char *src, unsigned char *dest);
extern void Platform_RLDecompressUnsafe(unsigned char *src, unsigned char *dest);

extern void Platform_QueueAudio(const void *data, u32 numBytes);

extern void Platform_SioSend(void);

#endif // GUARD_SA2_PLATFORM_H
