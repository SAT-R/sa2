#include "global.h"
#include "flags.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"

void sub_80047A0(u16 angle, s16 p1, s16 p2, u16 affineIndex)
{
    u16 *affine = &gOamBuffer[affineIndex * 4].all.affineParam;
    s16 res;

    res = Div(0x10000, p1);
    affine[0] = Q_24_8_TO_INT(COS_24_8(angle) * res);

    res = Div(0x10000, p1);
    affine[4] = Q_24_8_TO_INT(SIN_24_8(angle) * res);

    res = Div(0x10000, p2);
    affine[8] = Q_24_8_TO_INT((-(SIN(angle)) >> 6) * res);

    res = Div(0x10000, p2);
    affine[12] = Q_24_8_TO_INT(COS_24_8(angle) * res);
}

// Similar to sub_8004ABC and sub_8004E14
// (52.72%) https://decomp.me/scratch/mCDYD
NONMATCH("asm/non_matching/sub_8004860.inc",
         void sub_8004860(Sprite *s, SpriteTransform *transform))
{
    // sp24 = s
    SpriteOffset *dimensions = s->dimensions;

    u16 sp00[8];

    if (dimensions != (SpriteOffset *)-1) {
        s16 res;
        s32 sp10, sp14; // posX, posY
        s16 sp18[2][2];
        s32 affineIndex = s->unk10 & 0x1F; // sp20
        u16 *affine = &gOamBuffer[affineIndex * 4].all.affineParam;

        sp00[4] = COS_24_8(transform->rotation & ONE_CYCLE);
        sp00[5] = SIN_24_8(transform->rotation & ONE_CYCLE);

        sp00[6] = transform->width;
        sp00[7] = transform->height;

        res = Div(0x10000, sp00[6]);
        affine[0] = Q_8_8_TO_INT(((sp00[4] << 16) >> 16) * res);

        res = Div(0x10000, sp00[6]);
        affine[4] = Q_24_8_TO_INT(sp00[5] * res);

        res = Div(0x10000, sp00[7]);
        affine[8] = Q_24_8_TO_INT(-sp00[4] * res);

        res = Div(0x10000, sp00[7]);
        affine[12] = Q_24_8_TO_INT(sp00[5] * res);

        if (transform->height < 0)
            sp00[6] = -transform->height;

        if (transform->width < 0)
            sp00[7] = -transform->width;

        // _0800497A
        sp00[0] = Q_24_8_TO_INT(sp00[4] * sp00[6]);
        sp00[1] = Q_24_8_TO_INT(-sp00[5] * sp00[6]);
        sp00[2] = Q_24_8_TO_INT(sp00[5] * sp00[7]);
        sp00[3] = Q_24_8_TO_INT(sp00[6] * sp00[7]);

        sp18[0][0] = 0x100;
        sp18[0][1] = 0;
        sp18[1][0] = 0;
        sp18[1][1] = 0x100;

        sp10 = transform->x;
        sp14 = transform->y;

        // _08004A20
        {
            s16 r3;
            s32 r0, r1, r2, r4;
            u32 r5;

            if (transform->width > 0) {
                r4 = dimensions->offsetX;
                r2 = dimensions->width;
            } else {
                r4 = dimensions->width - dimensions->offsetX;
                r2 = dimensions->width;
            }

            // _08004A2E
            r3 = transform->height;

            if (r3 > 0) {
                r3 = dimensions->offsetY;
                r5 = dimensions->height;
            } else {
                // _08004A3E
                r3 = dimensions->height - dimensions->offsetY;
                r5 = dimensions->height;
            }

            // _08004A4C
            r0 = sp00[0];
            r4 -= dimensions->width / 2;
            r1 = r0;
            r1 *= r4;
            r0 = sp00[1];
            r5 >>= 1;
            r3 -= r5;
            r0 *= r3;
            r1 += r0;
            r1 += (r2 << 8);
            r1 >>= 8;
            sp10 -= r1;

            // __080004A7E
            r1 = sp00[2];
            r1 *= r4;
            r0 = sp00[7];
            r0 *= r3;
            r1 += r0;
            r1 += Q_24_8(r5);
            r1 >>= 8;

            sp14 -= r1;

            s->x = sp10;
            s->y = sp14;
        }
    }
}
END_NONMATCH
