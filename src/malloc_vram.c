#include "global.h"
#include "data.h"
#include "malloc_vram.h"

// TODO: make static
u16 sVramHeapState[256];

void* VramMalloc(u32 numTiles) {
    u16 i, j;
    u32 count = numTiles;
    count = (count + (VRAM_TILE_SLOTS_PER_SEGMENT - 1)) / VRAM_TILE_SLOTS_PER_SEGMENT; // round up

    for (i = 0; i < gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT; i++) {
        if (sVramHeapState[i] == 0) {
            for (j = 0; j < count; j++) {
                if (i + j >= (gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT)) {
                    return ewram_end;
                }
                if (sVramHeapState[i + j] != 0) {
                    break;
                }
            }

            if (j == count) {
                sVramHeapState[i] = count;
                return (void*)(gVramHeapStartAddr + i * VRAM_HEAP_SEGMENT_SIZE);
            }
        } else {
            i = (sVramHeapState[i] - 1) + i; // next slot to check, -1 because of ++i
        }
    }
    return ewram_end;
}

void VramResetHeapState(void) {
    DmaFill16(3, 0, sVramHeapState, sizeof(sVramHeapState));
}

void VramFree(void* addr) {
    u32 segmentId;
    if (ewram_end != addr) {
        // (addr - gVramHeapStartAddr) / VRAM_HEAP_SEGMENT_SIZE;
        segmentId = ((u32)(addr - gVramHeapStartAddr) * 0x200) >> 0x10;
        sVramHeapState[segmentId] = 0;
    }
}
