// Copyright (c) 2016 YamaArashi

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

void RLDecompressUnsafe(unsigned char *src, unsigned char *dest, int *uncompressedSize)
{
    int destSize = (src[3] << 16) | (src[2] << 8) | src[1];

    if (dest == NULL)
        goto fail;

    int srcPos = 4;
    int destPos = 0;

    for (;;) {
        unsigned char flags = src[srcPos++];
        bool compressed = ((flags & 0x80) != 0);

        if (compressed) {
            int length = (flags & 0x7F) + 3;
            unsigned char data = src[srcPos++];

            if (destPos + length > destSize)
                goto fail;

            for (int i = 0; i < length; i++)
                dest[destPos++] = data;
        } else {
            int length = (flags & 0x7F) + 1;

            if (destPos + length > destSize)
                goto fail;

            for (int i = 0; i < length; i++)
                dest[destPos++] = src[srcPos++];
        }

        if (destPos == destSize) {
            *uncompressedSize = destSize;
            return;
        }
    }

fail:
    FATAL_ERROR("Fatal error while decompressing RL file.\n");
}
