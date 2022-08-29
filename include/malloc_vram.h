#ifndef GUARD_MALLOC_VRAM_H
#define GUARD_MALLOC_VRAM_H

#include "global.h"

void* VramMalloc(u32);
void VramResetHeap(void);
void VramFree(void*);

extern void *gUnknown_020226D0;

#endif // GUARD_MALLOC_VRAM_H
