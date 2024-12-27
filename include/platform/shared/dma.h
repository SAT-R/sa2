#ifndef GUARD_PLATFORM_SHARED_DMA_H
#define GUARD_PLATFORM_SHARED_DMA_H

#define DMA_DEST_MASK 0x0060
#define DMA_SRC_MASK  0x0180

#define DMA_COUNT 4

struct DMATransfer {
    union {
        const void *src;
        const u16 *src16;
        const u32 *src32;
    };
    union {
        void *dst;
        vu16 *dst16;
        vu32 *dst32;
    };
    u32 size;
    u16 control;
} DMAList[DMA_COUNT];

typedef enum { DMA_NOW, DMA_VBLANK, DMA_HBLANK, DMA_SPECIAL } DmaStartTypes;

void RunDMAs(DmaStartTypes type);

#endif // GUARD_PLATFORM_SHARED_DMA_H