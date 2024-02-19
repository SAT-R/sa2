#include "global.h"
#include "game/game.h"
#include "game/stage/camera.h"

static ALIGNED(8) u32 gUnknown_3000410[3];
static ALIGNED(8) u32 gUnknown_3000420[3];

s32 sub_801EF94(s32 p0, s32 p1, s32 layer);

// TODO: Fix this register mess!
// (100.00%) https://decomp.me/scratch/xGy3C
s32 sub_801EE64(s32 p0in, s32 p1in, s32 p2in, u8 *p3in)
{
#ifndef NON_MATCHING
    register u32 r0 asm("r0");
    register u32 r1 asm("r1");
    register s32 r3 asm("r3");
    register s32 p0 asm("r4") = p0in;
    register s32 p1 asm("r5") = p1in;
    register s32 r6 asm("r6");
    register s32 p2 asm("r8") = p2in;
    u32 r7;
    register s32 sb asm("sb");
    register u8 *p3 asm("sl") = p3in;
    register s32 res asm("r4");
    register u8 *hm asm("r1");
#else
    u32 r0;
    u32 r1;
    s32 r3;
    s32 p0 = p0in;
    s32 p1 = p1in;
    s32 r6;
    s32 p2 = p2in;
    u32 r7;
    s32 sb;
    u8 *p3 = p3in;
    s32 res;
    u8 *hm;
#endif
    u8 rotation;

    if (p1 >= 0) {
        r0 = gUnknown_030059C8->pxWidth;
        r1 = r0 - 1;
        r0 = p1;
        if (r0 > r1) {
            r0 = r1;
        }
    } else {
        r0 = 0;
    }
    p1 = r0;
    // _0801EE92 + 2

    if (p0 >= 0) {
        r0 = gUnknown_030059C8->pxHeight;
        r1 = r0 - 1;
        r0 = p0;
        if (r0 > r1) {
            r0 = r1;
        }
    } else {
        r0 = 0;
    }
    p0 = r0;
    // _0801EEB2 + 2

    sb = 1;

    res = sub_801EF94(p1, p0, p2 & sb);
    r7 = 0x3FF;
    r7 &= res;

    r6 = 0x7;
    r3 = r6;
    r3 &= p1;

    r0 = 0x400;
    r0 &= res;
    if (r0) {
        r3 = r6 - r3;
    }
    // _0801EEDC

    // r3 = tileHeight
    r3 = gUnknown_030059C8->height_map[(r7 << 3) + r3];

    if ((r3 >>= 4) == -8) {
        r3 = 8;
    }
    // _0801EEF8

    if (p2 & 0x80) {
        s32 flags = gUnknown_030059C8->flags[r7 / 8u];

        // 2: one tile's flags' bit-width
        flags >>= ((r7 & r6) * 2);

        if (flags & sb) {
            r3 = 0;
        }
    }
    // _0801EF1E

    if (res & 0x800) {
        if ((r3 != 8) && (r3 != 0)) {
            r0 = r3 + 8;
            r0 = (r3 > 0) ? r3 - 8 : r0;

        } else {
            r0 = r3;
        }
        r3 = r0;
    }
    // _0801EF48

    rotation = gUnknown_030059C8->tile_rotation[r7];

    if (p0 & 0x400) {
        rotation = -rotation;
    }

    if (p0 & 0x800) {
        u8 v;
        if (r3 != 0) {
            u32 v2 = (-0x80) - rotation;
            v = v2;
        } else {
            v = rotation;
        }
        rotation = v;
    }
    // _0801EF7E

    {
#ifndef NON_MATCHING
        register u8 *r1p asm("r1") = p3;
        *r1p = rotation;
#else
        *p3in = rotation;
#endif
    }

    return r3;
}

// Parameter 'layer' should ONLY be 0 or 1.
// TODO: Fix this register mess!
// (100.00%) https://decomp.me/scratch/nh7WN
s32 sub_801EF94(s32 p0, s32 p1, s32 layer)
{
    s32 r0;
#ifndef NON_MATCHING
    register s32 r1 asm("r1");
    register s32 r3 asm("r3");
    register s32 r4 asm("r4");
    register s32 r5 asm("r5");
    register s32 r6 asm("r6") = p1;
    s32 r7;
    register s32 r8 asm("r8");
    register u16 **layers asm("r1");
#else
    s32 r1;
    s32 r3;
    s32 r4;
    s32 r5;
    s32 r6 = p1;
    s32 r7;
    s32 r8;
    u16 **layers;
#endif
    const Collision *coll;
    u16 *map;
    u32 mapIndex;
    u32 mapIndex2;
    u32 mtIndex;
    s32 i;
    void *pMeta;
    u16 result;

    r4 = p0 >> 3;

    if (gUnknown_3000410[0] == r4) {
        r7 = gUnknown_3000410[2];
        r0 = gUnknown_3000410[1];
    } else {
        s32 divRes = Div(r4, TILES_PER_METATILE_AXIS);
        r1 = r4 - (divRes * TILES_PER_METATILE_AXIS);

        gUnknown_3000410[0] = r4;
        gUnknown_3000410[1] = divRes;
        gUnknown_3000410[2] = r1;

        r7 = gUnknown_3000410[2];
        r0 = gUnknown_3000410[1];
    }
    r8 = r0;
    // _0801EFCC

    r4 = p1 >> 3;
    if (gUnknown_3000420[0] == r4) {
        r5 = gUnknown_3000420[2];
        r3 = gUnknown_3000420[1];
    } else {
        s32 divRes = Div(r4, TILES_PER_METATILE_AXIS);
        r1 = r4 - (divRes * TILES_PER_METATILE_AXIS);

        r3 = divRes;
        gUnknown_3000420[0] = r4;
        gUnknown_3000420[1] = r3;
        gUnknown_3000420[2] = r1;

        r5 = r1;
    }

    coll = gUnknown_030059C8;
    mtIndex = ((u16 *)coll->map[layer])[(r3 * coll->levelX) + r8];

#ifndef NON_MATCHING
    // ((r5 << 3) + (r5 << 2)) == r5 * TILES_PER_METATILE_AXIS
    r1 = ((r5 << 3) + (r5 << 2) + r7);

    asm("" ::"r"(r5));

    r3 = mtIndex * 256;
    mtIndex *= 32;
    i = r1 * 2;
    pMeta = (void *)coll->metatiles;
    pMeta += r3;
    pMeta += mtIndex;
    pMeta += i;
    result = *(u16 *)pMeta;
#else
    mtIndex = mtIndex * 288 + i;
    result = coll->metatiles[mtIndex];
#endif

    return result;
}

void sub_801F044(void)
{
    DmaFill32(3, 0, &gUnknown_3000410, sizeof(gUnknown_3000410));
    DmaFill32(3, 0, &gUnknown_3000420, sizeof(gUnknown_3000420));
}

s32 sub_801F07C(s32 p0, s32 p1, s32 p2, s32 p3, u8 *data, Func801F07C func)
{
    u8 dummy[4];
    u8 *dummy_p;

    s32 result;
    s32 funcRes;
    u8 *data1;

    if (data == NULL)
        data = dummy;

    dummy_p = &dummy[0];
    dummy_p++;
    data1 = dummy_p;

    funcRes = func(p0, p1, p2, data1);

    if (funcRes == 0) {
        if (p3 > 0) {
            result = 8 - (p0 % 8u);
        } else {
            result = (p0 % 8u) + 1;
        }
    } else if (funcRes == 8) {
        *data = *data1;

        if (p3 > 0) {
            result = ~(p0 % 8u);
        } else {
            result = (-8) | p0;
        }
    } else {
        *data = *data1;

        if (funcRes > 0) {
            funcRes--;
            result = funcRes - (p0 % 8u);
        } else {
            result = funcRes + (p0 % 8u);
        }
    }

    return result;
}

s32 sub_801F100(s32 p0, s32 p1, s32 p2, s32 p3, Func801F100 func)
{
    s32 result;
    s32 funcRes = func(p0, p1, p2);

    if (funcRes == 0) {
        if (p3 > 0) {
            result = 8 - (p0 % 8u);
        } else {
            result = (p0 % 8u) + 1;
        }
    } else if (funcRes == 8) {
        if (p3 > 0) {
            result = ~(p0 % 8u);
        } else {
            result = (-8) | p0;
        }
    } else if (funcRes > 0) {
        funcRes--;
        result = funcRes - (p0 % 8u);
    } else {
        result = funcRes + (p0 % 8u);
    }

    return result;
}
