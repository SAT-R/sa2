#include <stdio.h>
#include <string.h>
#include "global.h"
#include "platform/shared/dma.h"

// safe unaligned access for MIPS
static inline void dma_copy32(void *dst, const void *src)
{
    u32 tmp;
    memcpy(&tmp, src, 4);
    memcpy(dst, &tmp, 4);
}

static inline void dma_copy16(void *dst, const void *src)
{
    u16 tmp;
    memcpy(&tmp, src, 2);
    memcpy(dst, &tmp, 2);
}

struct DMATransfer DMAList[DMA_COUNT] = { 0 };

void RunDMAs(DmaStartTypes type)
{
    for (int dmaNum = 0; dmaNum < DMA_COUNT; dmaNum++) {
        struct DMATransfer *dma = &DMAList[dmaNum];
#if !USE_NEW_DMA
        // Regular GBA order
        u32 dmaCntReg = (&REG_DMA0CNT)[dmaNum * 3];
#else
        // "64 bit" order
        u32 dmaCntReg = (&REG_DMA0CNT)[dmaNum];
#endif
        if (!((dmaCntReg >> 16) & DMA_ENABLE)) {
            dma->control &= ~DMA_ENABLE;
        }

        if ((dma->control & DMA_ENABLE) && (((dma->control & DMA_START_MASK) >> 12) == type)) {
            // printf("DMA%d src=%p, dest=%p, control=%d\n", dmaNum, dma->src, dma->dst, dma->control);
            for (int i = 0; i < dma->size; i++) {
                if ((dma->control) & DMA_32BIT)
                    dma_copy32(dma->dst, dma->src);
                else
                    dma_copy16(dma->dst, dma->src);

                // process destination pointer changes
                if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_INC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32++;
                    else
                        dma->dst16++;
                } else if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_DEC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32--;
                    else
                        dma->dst16--;
                } else if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_RELOAD) // TODO
                {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32++;
                    else
                        dma->dst16++;
                }

                // process source pointer changes
                if (((dma->control) & DMA_SRC_MASK) == DMA_SRC_INC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->src32++;
                    else
                        dma->src16++;
                } else if (((dma->control) & DMA_SRC_MASK) == DMA_SRC_DEC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->src32--;
                    else
                        dma->src16--;
                }
            }

            if (dma->control & DMA_REPEAT) {
                // NOTE: If we change dma->size anywhere above, we need to reset its value here.

                if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_RELOAD) {
#if !USE_NEW_DMA
                    dma->dst = (void *)(uintptr_t)(&REG_DMA0DAD)[dmaNum * 3];
#else
                    dma->dst = (void *)(uintptr_t)(&REG_DMA0DAD)[dmaNum];
#endif
                }
            } else {
                dma->control &= ~DMA_ENABLE;
            }
        }
    }
}

#ifdef DmaSet
#undef DmaSet
#endif
void DmaSet(int dmaNum, const void *src, void *dest, u32 control)
{
    if (dmaNum >= DMA_COUNT) {
        fprintf(stderr, "DmaSet with invalid DMA number: dmaNum=%d, src=%p, dest=%p, control=%d\n", dmaNum, src, dest, control);
        return;
    }

#if !USE_NEW_DMA
    // Regular GBA order
    (&REG_DMA0SAD)[dmaNum * 3] = (uintptr_t)src;
    (&REG_DMA0DAD)[dmaNum * 3] = (uintptr_t)dest;
    (&REG_DMA0CNT)[dmaNum * 3] = (size_t)control;
#else
    // "64 bit" order
    (&REG_DMA0SAD)[dmaNum] = (uintptr_t)src;
    (&REG_DMA0DAD)[dmaNum] = (uintptr_t)dest;
    (&REG_DMA0CNT)[dmaNum] = (size_t)control;
#endif

    struct DMATransfer *dma = &DMAList[dmaNum];
    dma->src = src;
    dma->dst = dest;
    dma->size = control & 0x1ffff;
    dma->control = control >> 16;

    // printf("\nDMA%d: S:%p %p -> %p\n", dmaNum, src, dest, dest + dma->size);

    RunDMAs(DMA_NOW);
}

void DmaStop(int dmaNum)
{
#if !USE_NEW_DMA
    (&REG_DMA0CNT)[dmaNum * 3] &= ~((DMA_ENABLE | DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT) << 16);
#else
    (&REG_DMA0CNT)[dmaNum] &= ~((DMA_ENABLE | DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT) << 16);
#endif

    struct DMATransfer *dma = &DMAList[dmaNum];
    dma->control &= ~(DMA_ENABLE | DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT);
}

void DmaWait(int dmaNum)
{
    vu32 *ctrlRegs = &REG_DMA0CNT;
#if !USE_NEW_DMA
    while (ctrlRegs[dmaNum * 3] & (DMA_ENABLE << 16))
        ;
#else
    while (ctrlRegs[dmaNum] & (DMA_ENABLE << 16))
        ;
#endif
}
