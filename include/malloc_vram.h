#ifndef GUARD_MALLOC_VRAM_H
#define GUARD_MALLOC_VRAM_H

#include "global.h"

#define VRAM_HEAP_SEGMENT_SIZE      0x80
#define VRAM_TILE_SLOTS_PER_SEGMENT (VRAM_HEAP_SEGMENT_SIZE / TILE_SIZE_4BPP)

void *VramMalloc(u32);
void VramResetHeapState(void);
void VramFree(void *);

#endif // GUARD_MALLOC_VRAM_H
