#ifndef GUARD_SA2_PLATFORM_H
#define GUARD_SA2_PLATFORM_H
#if PORTABLE

void Platform_LZDecompress(unsigned char *src, unsigned char *dest);
void Platform_RLDecompress(unsigned char *src, unsigned char *dest);

#endif // PORTABLE
#endif // GUARD_SA2_PLATFORM_H