#include "global.h"
#include "sakit/globals.h"
#include "sakit/input_buffer.h"
#include "sakit/player.h"

#include "constants/characters.h"

/* TODO: Merge this file with input_buffer.c once sub_800DF8C matches */

// (100.00%) https://decomp.me/scratch/WjLUa
void sub_800E0C0(u16 param0, u16 param1)
{
    u32 r3 = param1 % 4u;
    u16 r2 = ((param1 & 0x100) >> 6);
    u32 r5;

    r3 |= r2;
    param1 = 0xF0;
    asm("" ::"r"(param1));
    r5 = param0;
    r5 &= param1;
    r5 = (r5) | r3;
    gUnknown_030055D8 = (gUnknown_030055D8 + 1) % 4u;
    gUnknown_030055D0[gUnknown_030055D8] = r5;
    r5 |= gUnknown_030055D0[(gUnknown_030055D8 - 1) % 4u];
    r5 |= gUnknown_030055D0[(gUnknown_030055D8 - 2) % 4u];
    r5 &= param0;

#ifndef NON_MATCHING
    asm("lsl r0, %0, #24\n"
        "lsr %0, r0, #24\n"
        : "=r"(r5)
        : "r"(r5));
#endif

    if ((gNewInputCounters[gNewInputCountersIndex].unk0 == r5)
        && (gNewInputCounters[gNewInputCountersIndex].unk1 != 0xFF)) {
        gNewInputCounters[gNewInputCountersIndex].unk1++;
    } else {
        gNewInputCountersIndex = (gNewInputCountersIndex + 1) % 32u;
        gNewInputCounters[gNewInputCountersIndex].unk0 = r5;
        gNewInputCounters[gNewInputCountersIndex].unk1 = 0;
    }
}

void InitNewInputCounters()
{
    gNewInputCountersIndex = 0;
    DmaFill32(3, 0, gNewInputCounters, sizeof(gNewInputCounters) - 4);
}
