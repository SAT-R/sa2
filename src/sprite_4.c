#include <string.h>

#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

/* TODO: Rename this module to something background-related */
#include "sprite_4.h"

extern u16 gUnknown_080984F4[];

typedef struct {
    s16 x;
    s16 y;
} Unknown;

#if 01
// When this function is called, the background layer that is
// "lightened" by spot lights is fully lit.
// This function filters out all non-lit parts to display them normally.
// TODO: validate type of param1!
// (73.98%) https://decomp.me/scratch/oY3s7
void sub_800724C(u8 bg, Param1 *param1)
{
    Unknown *u;
    Unknown sp00[5];
    u8 *cursor;
    u32 r0, r1;
    u8 sb, r4;
    int_vcount sp14[2]; // TODO: type might be inaccurate? Find out whether this is
                        // display resolutions
    u8 sp18;
    s32 temp;
    s16 *sp;

    memcpy(&sp00[1], &gUnknown_080984F4, sizeof(sp00[1]));
    cursor = (u8 *)&sp00[3];
    memset(cursor, 0, sizeof(sp00[3]));
    memset(&sp00[4], 01, sizeof(sp00[4]));

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
        gUnknown_03002A80 = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gUnknown_03002878 = (void *)&REG_WIN1H;
        } else {
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    }

    r0 = param1->unk5;
    r1 = r0;
    if (r0 > param1->unk1) {
        r0 = param1->unk1;
    }
    r4 = r0;

    sb = r0;
    if (sb < param1->unk1) {
        r1 = param1->unk1;
    }
    sp18 = r1;

    cursor += (r4 * gUnknown_03002A80);

    sp00[0].x = param1->unk2 - param1->unk0;
    sp00[1].x = param1->unk3 - param1->unk1;

    u = &sp00[3];
    u->x = abs(sp00[0].x) * 2;
    sp00[4].x = abs(sp00[1].x) * 2;

    // _08007352 + 6
    sp00[0].y = param1->unk6 - param1->unk4;
    sp00[1].y = param1->unk7 - param1->unk5;

    sp00[3].y = abs(sp00[0].y) * 2;
    sp00[4].y = abs(sp00[1].y) * 2;

    // _08007388+6
    sp14[0] = param1->unk0;
    sp14[1] = param1->unk4;

    sp00[2].x = -sp00[1].x;
    sp00[2].y = -sp00[1].y;

    if (r4 != sp18) {
        // _080073B6
        if (bg < sb) {
            while (r4 < sp18) {
                // _080073C0
                cursor[0] = DISPLAY_WIDTH;
                cursor[1] = sp14[0];

                sp00[2].x += sp00[3].x;

                r4++;

                while (sp00[2].x >= 0) {
                    if (sp00[0].x > 0) {
                        sp14[0]++;
                        sp00[2].x -= sp00[4].x;
                        asm("");
                    } else {
                        // _0800740C
                        sp14[0]--;
                        sp00[2].x -= sp00[4].x;
                    }

                    if (sp00[2].x >= 0) {
                        cursor[1] = sp14[0];
                    }
                }
                // _08007430

                cursor += gUnknown_03002A80;
            }
        } else {
            // _08007448

            while (r4 < sp18) {
                // _08007450
                cursor[0] = sp14[0];
                cursor[1] = 0;

                sp00[2].y += sp00[3].y;

                sb = ++r4;

                while (sp00[2].y >= 0) {
                    if (sp00[0].y > 0) {
                        sp14[1]++;
                        sp00[2].y -= sp00[4].y;

                        if (sp00[2].y >= 0) {
                            *cursor = sp14[1] + 1;
                        }
                    } else {
                        // _0800749E
                        sp14[1]--;
                        sp00[2].y -= sp00[4].y;
                    }
                    // _080074AC
                }
                // _080074B6
                cursor += gUnknown_03002A80;
            }
        }
    }
    // _080074C8

    r0 = param1->unk7;
    r1 = param1->unk3;

    if (r0 > r1) {
        r0 = r1;
    }

    sp18 = r0;

    for (; sb < sp18; sb++) {
        Unknown *sp0;
        Unknown *sp2;
        Unknown *sp4;
        // _080074E0
        cursor[0] = sp14[1];
        cursor[1] = sp14[0];

        sp00[2].x += sp00[3].x;
        sp00[2].y += sp00[3].y;

        while (sp00[2].x >= 0) {
            if (sp00[0].x > 0) {
                sp14[0]++;
                sp00[2].x -= sp00[4].x;
            } else {
                // _08007530
                sp14[0]--;
                sp00[2].x -= sp00[4].x;

                if (sp00[2].x >= 0) {
                    cursor[1] = sp14[0];
                }
            }
        }
        // _08007558

        sp4 = &sp00[4];
        sp2 = &sp00[2];
        while (sp2->y >= 0) {
            sp0 = &sp00[0];
            if (sp0->y > 0) {
                sp14[1]++;
                sp2->y -= sp4->y;

                if (sp2->y >= 0) {
                    cursor[0] = sp14[1] + 1;
                }
            } else {
                // _08007590
                sp14[1]--;
                sp2->y -= sp4->y;
            }
        }
        // _080075A8
        cursor += gUnknown_03002A80;
    }
    // _080075BA
}
#endif

void sub_80075D0(u8 bg, u8 param1, u8 param2, s16 param3, u16 param4, u16 param5)
{
    int_vcount *cursor;
    s16 r1;
    u16 sb = (param5 * param5);

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
        gUnknown_03002A80 = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gUnknown_03002878 = (void *)&REG_WIN1H;
        } else {
            gUnknown_03002878 = (void *)&REG_WIN0H;
        }
    }

    r1 = param4;

    if ((r1 - param1) > param5) {
        param1 = (param4 - param5);
    }

    if ((param2 - r1) > param5) {
        param2 = (param4 + param5);
    }

    cursor += (gUnknown_03002A80 * param1);

    for (; param1 < param2; param1++) {
        s16 num = param1 - param4;
        s16 sqrtRes;

        num = num * num;
        sqrtRes = Sqrt(sb - num);

        r1 = param3 + sqrtRes;
        if (r1 < 0) {
            *cursor = 0;
            cursor++;
        } else if (r1 > DISPLAY_WIDTH) {
            *cursor = DISPLAY_WIDTH;
            cursor++;
        } else {
            *cursor = r1;
            cursor++;
        }

        r1 = param3 - sqrtRes;
        if (r1 > DISPLAY_WIDTH) {
            *cursor = DISPLAY_WIDTH;
            cursor++;
        } else if (r1 < 0) {
            *cursor = 0;
            cursor++;
        } else {
            *cursor = r1;
            cursor++;
        }

        cursor += (gUnknown_03002A80 - 2);
    }
}

void sub_8007738(u8 bg, int_vcount minY, int_vcount maxY, u16 param3, u8 param4,
                 u8 param5, u16 param6, u8 param7, u8 param8, s16 param9, s16 param10)
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

void sub_8007858(u8 param0, int_vcount minY, int_vcount maxY, u16 param3, u16 param4)
{
    u16 *cursor;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&((u8 *)&REG_BG0HOFS)[param0 * 4];
    gUnknown_03002A80 = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY * 2];

    param4 = (param4 - minY) & 0x1FF;
    param3 &= 0x1FF;

    while (minY < maxY) {
        *cursor = param3;
        cursor++;
        *cursor = param4--;
        cursor++;

        minY++;
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