#include "global.h"
#include "game/game.h"
#include "game/stage/camera.h"

static ALIGNED(8) u32 gUnknown_3000410[3];
static ALIGNED(8) u32 gUnknown_3000420[3];

#if 0
s32 sub_801EF94(s32 p0, s32 p1, s32 p2)
{
    s32 r1, r3, r5, r7, r8;

    p0 >>= 3;

    if(gUnknown_3000410[0] == p0) {
        r7 = gUnknown_3000410[2];
        r8 = gUnknown_3000410[1];
    } else {
        s32 divRes = Div(p0, 12);
        r1 = p0 - (divRes * 12);

        gUnknown_3000410[0] = p0;
        gUnknown_3000410[1] = divRes;
        gUnknown_3000410[2] = r1;

        r8 = divRes;
        r7 = r1;
    }
    // _0801EFCC

    p1 >>= 3;
    if(gUnknown_3000420[0] == p1) {
        r5 = gUnknown_3000420[2];
        r3 = gUnknown_3000420[1];
    } else {
        s32 divRes = Div(p1, 12);
        r1 = p1 - (divRes * 12);
        
        gUnknown_3000410[0] = p1;
        gUnknown_3000410[1] = divRes;
        gUnknown_3000410[2] = r1;

        r3 = divRes;
        r5 = r1;
    }

    gUnknown_030059C8
}
#endif

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
