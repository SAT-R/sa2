#include "global.h"
#include "core.h"
#include "malloc_vram.h"

#if COLLECT_RINGS_ROM
#define HEAP_END iwram_end
#else
#define HEAP_END ewram_end
#endif

/* --- HOW THIS WORKS ---
 *
 * gVramHeapState[] represents (or *can* represent) the entire Object Tiles memory range in VRAM (0x06010000 -> 0x06018000).
 * Whereby each u16 word in gVramHeapState contains a reserved number of segments.
 * Each segment in SA2: 4 tiles * size-per-tile = (4 * 0x20 | 0x80) [segment tile-count might vary per game]
 *
 * I say *can*, because in practice, there's a much smaller available heap.
 * In practice it starts at:
 *  0x06013200 in SA1
 *  0x06013A00 in SA2
 *  0x06012C50 in SA3
 *  ( OBJ_VRAM1 - (VRAM_HEAP_TILE_COUNT * TILE_SIZE_4BPP) )
 *
 * Take this representation for example:
 *
 * Imagine every digit being a u16 word.
 * 0000000000000000
 * ^
 * This is basically an entirely empty VRAM heap, so starting with the first byte, some number of segments could be reserved.
 * Note that VramResetHeapState() just clears the entire gVramHeapState[], so anything allocated before would be allocateable by a new
 * VramMalloc() call.
 *
 * Below, each * is a word reserved by the segment-count preceding it, so those cannot be allocated.
 * 6*****4***000000
 * ^     ^
 * |     |
 * +-----+--- 6 allocated segments (24 tiles)
 *       |
 *  4 allocated segments (16 tiles)
 *
 * Note that the count itself is part of the number of allocated segments
 */

void *VramMalloc(u32 numTiles)
{
    u16 i, j;
    u32 segCount = numTiles;
    segCount = (segCount + (VRAM_TILE_SLOTS_PER_SEGMENT - 1)) / VRAM_TILE_SLOTS_PER_SEGMENT; // round up

    for (i = 0; i < gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT; i++) {
        if (gVramHeapState[i] == 0) {
            for (j = 0; j < segCount; j++) {
                if (i + j >= (gVramHeapMaxTileSlots / VRAM_TILE_SLOTS_PER_SEGMENT)) {
                    return HEAP_END;
                }
                if (gVramHeapState[i + j] != 0) {
                    break;
                }
            }

            if (j == segCount) {
                gVramHeapState[i] = segCount;
                return (void *)(gVramHeapStartAddr + i * VRAM_HEAP_SEGMENT_SIZE);
            }
        } else {
            i = (gVramHeapState[i] - 1) + i; // next slot to check, -1 because of ++i
        }
    }
    return HEAP_END;
}

// Clear the entire gVramHeapState[], leading to zero tiles being allocated (even if OBJ_VRAM is populated)
void VramResetHeapState(void) { DmaFill16(3, 0, gVramHeapState, sizeof(gVramHeapState)); }

void VramFree(void *addr)
{
    u16 segmentId;

    if (HEAP_END != addr) {
        segmentId = (u32)(addr - gVramHeapStartAddr) / VRAM_HEAP_SEGMENT_SIZE;
        gVramHeapState[segmentId] = 0;
    }
}
