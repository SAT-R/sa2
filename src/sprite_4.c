#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

/* TODO: Rename this module to something background-related */
#include "sprite_4.h"

void sub_8007738(u8 bg, u8 minY, u8 maxY, u16 param3, u8 param4, u8 param5, u16 param6,
                 u8 param7, u8 param8, s16 param9, s16 param10)
{
    u16 *cursor;
    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gUnknown_03002A80 = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY * 2];

    while (minY < maxY) {
        *cursor = (((SIN(param3 & ONE_CYCLE) * param4) >> 14) + param9) & 0x1FF;
        cursor++;
        *cursor = (((SIN(param6 & ONE_CYCLE) * param7) >> 14) + param10) & 0x1FF;
        cursor++;

        param3 += param5;
        param6 += param8;

        minY++;
    }
}

void sub_8007858(u8 param0, u8 param1, u8 param2, u16 param3, u16 param4)
{
    u16 *cursor;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[param0 * 4];
    gUnknown_03002A80 = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[param1 * 2];

    param4 = (param4 - param1) & 0x1FF;
    param3 &= 0x1FF;

    while (param1 < param2) {
        *cursor = param3;
        cursor++;
        *cursor = param4--;
        cursor++;

        param1++;
    }
}

void sub_80078D4(u8 bg, int_vcount minY, int_vcount maxY, u16 offsetEven, u16 offsetOdd)
{
    u16 *cursor;
    u32 fillSize;
    s32 fillVal;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gUnknown_03002A80 = 4;

    if (minY < maxY) {
        fillVal = (offsetEven %= 512u) | ((offsetOdd % 512u) << 16);

        DmaFill32(3, fillVal, &((u16 *)gBgOffsetsHBlank)[minY * 2], (maxY - minY) * 4);
    }
}

void sub_8007958(u8 bg, int_vcount minY, int_vcount maxY, s16 param3, s8 param4,
                 u16 param5, u16 param6)
{
    u16 *cursor;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gUnknown_03002A80 = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY * 2];

    while (minY < maxY) {
        *cursor = (param3 + param5) & 0x1FF;
        cursor++;
        *cursor = param6;
        *cursor++;

        param3 = -(param3 + param4);
        param4 = -param4;

        minY++;
    }
}

void sub_8007A08(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4)
{
    u8 *cursor;

    gFlags |= FLAGS_4;

    if (bg >= 2) {
        gUnknown_03002A80 = 4;

        if (bg & 1) {
            cursor = &((u8 *)gBgOffsetsHBlank)[2];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        } else {
            cursor = &((u8 *)gBgOffsetsHBlank)[0];
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    } else {
        // _08007A5C
        gUnknown_03002A80 = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gUnknown_03002878 = (void *)&REG_WIN1H;
        } else {
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    }

    cursor += param2 * gUnknown_03002A80;
    while (param2 < param4) {
#ifndef NON_MATCHING
        register u8 v asm("r0");
#else
        u8 v;
#endif
        u8 *p;
        *cursor = param3;
        cursor++;

        *cursor = param1;

        v = gUnknown_03002A80;
#ifndef NON_MATCHING
        asm("add %0, %0, %2" : "=r"(p) : "r"(v), "r"(cursor));
#else
        p = v + cursor;
#endif
        cursor = p - 1;

        param2++;
    }
}

void sub_8007AC0(u8 affineBg, int_vcount minY, int_vcount maxY)
{
    u16 *cursor;
    u16 affine;
    void **ptr;
    u32 bg = affineBg;

    gFlags |= FLAGS_4;

    ptr = &gUnknown_03002878;

    bg *= 16;
#ifndef NON_MATCHING
    asm("sub %0, #0x20" ::"r"(bg));
#else
    bg -= 0x20;
#endif
    *ptr = (void *)(REG_ADDR_BG2PA + bg);

    gUnknown_03002A80 = 2;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY];

#ifdef NON_MATCHING
    assert(affineBg < NUM_AFFINE_BACKGROUNDS)
#endif

        affine
        = gBgAffineRegs[affineBg].pa;

    while (minY < maxY) {
        *cursor = affine + ((maxY - minY) * 4);

        cursor++;
        minY++;
    }
}