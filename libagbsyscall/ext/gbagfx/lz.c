// Copyright (c) 2015 YamaArashi

#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)                                                                                                           \
    do {                                                                                                                                   \
        fprintf(stderr, format, __VA_ARGS__);                                                                                              \
        exit(1);                                                                                                                           \
    } while (0)

#define UNUSED

#else

#define FATAL_ERROR(format, ...)                                                                                                           \
    do {                                                                                                                                   \
        fprintf(stderr, format, ##__VA_ARGS__);                                                                                            \
        exit(1);                                                                                                                           \
    } while (0)

#define UNUSED __attribute__((__unused__))

#endif // _MSC_VER

void LZDecompressUnsafe(unsigned char *src, unsigned char *dest, int *uncompressedSize)
{
    int destSize = (src[3] << 16) | (src[2] << 8) | src[1];

    if (dest == NULL)
        goto fail;

    int srcPos = 4;
    int destPos = 0;

    for (;;) {
        unsigned char flags = src[srcPos++];

        for (int i = 0; i < 8; i++) {
            if (flags & 0x80) {
                int blockSize = (src[srcPos] >> 4) + 3;
                int blockDistance = (((src[srcPos] & 0xF) << 8) | src[srcPos + 1]) + 1;

                srcPos += 2;

                int blockPos = destPos - blockDistance;

                // Some Ruby/Sapphire tilesets overflow.
                if (destPos + blockSize > destSize) {
                    blockSize = destSize - destPos;
                    fprintf(stderr, "Destination buffer overflow.\n");
                }

                if (blockPos < 0)
                    goto fail;

                for (int j = 0; j < blockSize; j++)
                    dest[destPos++] = dest[blockPos + j];
            } else {
                if (destPos >= destSize)
                    goto fail;

                dest[destPos++] = src[srcPos++];
            }

            if (destPos == destSize) {
                *uncompressedSize = destSize;
                return;
            }

            flags <<= 1;
        }
    }

fail:
    FATAL_ERROR("Fatal error while decompressing LZ file.\n");
}
