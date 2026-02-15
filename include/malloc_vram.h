#ifndef GUARD_MALLOC_VRAM_H
#define GUARD_MALLOC_VRAM_H

#include "global.h"

#define VRAM_HEAP_TILE_SIZE         TILE_SIZE_4BPP
#define VRAM_HEAP_SEGMENT_SIZE      (4 * VRAM_HEAP_TILE_SIZE)
#define VRAM_TILE_SLOTS_PER_SEGMENT (VRAM_HEAP_SEGMENT_SIZE / VRAM_HEAP_TILE_SIZE)

// TODO: Find out where these numbers come from
#if (ENGINE == ENGINE_1)
#define VRAM_TILE_SEGMENTS   156
#define VRAM_HEAP_TILE_COUNT 112
#elif (ENGINE == ENGINE_2)
#if COLLECT_RINGS_ROM
#define VRAM_TILE_SEGMENTS   128
#define VRAM_HEAP_TILE_COUNT 0
#else
#define VRAM_TILE_SEGMENTS   140
#define VRAM_HEAP_TILE_COUNT 48
#endif
#endif

void *VramMalloc(u32);
void VramResetHeapState(void);
void VramFree(void *);

#endif // GUARD_MALLOC_VRAM_H
