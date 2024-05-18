// Copyright (c) 2016 YamaArashi

#ifndef RL_H
#define RL_H

// DO_UNSAFE_CONVERT used for portable code
// RLUnComp*() do not know about the source data size
#ifdef DO_UNSAFE_CONVERT
void RLDecompress(unsigned char *src, unsigned char *dest, int *uncompressedSize);
#else
unsigned char *RLDecompress(unsigned char *src, int srcSize, int *uncompressedSize);
#endif

unsigned char *RLCompress(unsigned char *src, int srcSize, int *compressedSize);

#endif // RL_H
