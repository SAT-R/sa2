#include "global.h"
#include "core.h"
#include "flags.h"

void sub_8007958(u8 param0, u8 param1, u8 param2, s16 param3, s8 param4, u16 param5,
                 u16 param6)
{
    u16 *cursor;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[param0 * 4];
    gUnknown_03002A80 = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[param1 * 2];

    while (param1 < param2) {
        *cursor = (param3 + param5) & 0x1FF;
        cursor++;
        *cursor = param6;
        *cursor++;

        param3 = -(param3 + param4);
        param4 = -param4;

        param1++;
    }
}

// NOTE: sub_8007AC0 might be able to be inlined in this proc
void sub_8007A08(u8 param0, u8 param1, u8 param2, u8 param3, u8 param4)
{
    u8 *cursor;

    gFlags |= FLAGS_4;

    if (param0 >= 2) {
        gUnknown_03002A80 = 4;

        if (param0 & 1) {
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

        if (param0 & 1) {
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

void sub_8007AC0(u8 param0, u8 param1, u8 param2)
{
    u16 *cursor;
    u16 affine;
    void **ptr;
    u32 param = param0;

    gFlags |= FLAGS_4;

    ptr = &gUnknown_03002878;

    param *= 16;
#ifndef NON_MATCHING
    asm("sub %0, #0x20" ::"r"(param));
#else
    param -= 0x20;
#endif
    *ptr = (void *)(REG_ADDR_BG2PA + param);

    gUnknown_03002A80 = 2;

    cursor = &((u16 *)gBgOffsetsHBlank)[param1];

    affine = gBgAffineRegs[param0].pa;

    while (param1 < param2) {
        *cursor = affine + ((param2 - param1) * 4);

        cursor++;
        param1++;
    }
}