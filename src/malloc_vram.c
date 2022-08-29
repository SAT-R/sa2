#include "global.h"
#include "data.h"
#include "malloc_vram.h"

u16 gVramHeap[256];

void* VramMalloc(u32 size) {
    u16 i, j;
    u32 target = size;
    target = (target + 3) >> 2;

    for (i = 0; i < gVramMaxEntities / 4; i++) {
        if (gVramHeap[i] == 0) {
            for (j = 0; j < target; j++) {
                if (i + j >= (gVramMaxEntities / 4)) {
                    return gUnknown_020226D0;
                }
                if (gVramHeap[i + j] != 0) {
                    break;
                }
            }

            if (j == target) {
                gVramHeap[i] = target;
                return (void*)(gVramHeapStartAddr + i * 0x80);
            }
        } else {
            i = 0xFFFF + gVramHeap[i] + i;
        }
    }
    return gUnknown_020226D0;
}

void VramResetHeap(void) {
    DmaFill16(3, 0, gVramHeap, sizeof(gVramHeap));
}

void VramFree(void* addr) {
    if (gUnknown_020226D0 != addr) {
        u32 segment = ((u32)(addr - gVramHeapStartAddr) * 0x200) >> 0x10;
        gVramHeap[segment] = 0;
    }
}
