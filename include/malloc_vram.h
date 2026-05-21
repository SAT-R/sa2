#ifndef GUARD_MALLOC_VRAM_H
#define GUARD_MALLOC_VRAM_H

#include "global.h"

void *VramMalloc(u32);
void VramResetHeapState(void);
void VramFree(void *);

#endif // GUARD_MALLOC_VRAM_H
