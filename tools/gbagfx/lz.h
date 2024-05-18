// Copyright (c) 2015 YamaArashi

#ifndef LZ_H
#define LZ_H

// DO_UNSAFE_CONVERT used for portable code
// LZUnComp*() do not know about the source data size
#ifdef DO_UNSAFE_CONVERT
void LZDecompress(unsigned char *src, unsigned char *dest, int *uncompressedSize);
#else
unsigned char *LZDecompress(unsigned char *src, int srcSize, int *uncompressedSize);
#endif

unsigned char *LZCompress(unsigned char *src, int srcSize, int *compressedSize, const int minDistance);

#endif // LZ_H
