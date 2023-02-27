#include "global.h"
#include "engine/core.h"
#include "malloc_vram.h"

void *VramMalloc(u32 numTiles)
{
    u16 i, j;
    u32 count = numTiles;
    count = (count + (VRAM_TILE_SLOTS_PER_SEGMENT - 1))
        / VRAM_TILE_SLOTS_PER_SEGMENT; // round up

    for (i = 0; i < gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT; i++) {
        if (gVramHeapState[i] == 0) {
            for (j = 0; j < count; j++) {
                if (i + j >= (gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT)) {
                    return ewram_end;
                }
                if (gVramHeapState[i + j] != 0) {
                    break;
                }
            }

            if (j == count) {
                gVramHeapState[i] = count;
                return (void *)(gVramHeapStartAddr + i * VRAM_HEAP_SEGMENT_SIZE);
            }
        } else {
            i = (gVramHeapState[i] - 1) + i; // next slot to check, -1 because of ++i
        }
    }
    return ewram_end;
}

void VramResetHeapState(void)
{
    DmaFill16(3, 0, gVramHeapState, sizeof(gVramHeapState));
}

void VramFree(void *addr)
{
    u16 segmentId;

    if (ewram_end != addr) {
        segmentId = (u32)(addr - gVramHeapStartAddr) / VRAM_HEAP_SEGMENT_SIZE;
        gVramHeapState[segmentId] = 0;
    }
}
