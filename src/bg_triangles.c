#include <stdlib.h> // abs()
#include <string.h>

#include "global.h"
#include "core.h"
#include "trig.h"
#include "flags.h"

/* TODO: Rename this module to something background-related */
#include "bg_triangles.h"

#ifndef COLLECT_RINGS_ROM
const u16 gUnknown_080984F4[] = {
    // Zone 1
    0x0001,
    0x0001,
    0x2430,
    0x0000,

    // Zone 2
    0x0004,
    0x0024,
    0x0300,
    0x0080,

    // Zone 3
    0x0200,
    0x0098,
    0x2430,
    0x0000,

    // Zone 4
    0x0004,
    0x0024,
    0x0300,
    0x0080,

    // Zone 5
    0x0200,
    0x0098,
    0x2430,
    0x0000,

    // Zone 6
    0x0004,
    0x0024,
    0x0300,
    0x0080,

    // Zone 7
    0x0200,
    0x0098,
    0x2430,
    0x0000,

    // Zone Extra
    0x0004,
    0x0024,
    0x0300,
    0x0080,

    // Dummies?
    0x0200,
    0x0098,
};

typedef struct {
    s16 x;
    s16 y;
} Unknown;

NONMATCH("asm/non_matching/engine/unused_sub_8005C54.inc", void sub_8005C54()) { }
END_NONMATCH

NONMATCH("asm/non_matching/engine/unused_sub_8005FB4.inc", void sub_8005FB4()) { }
END_NONMATCH

void sub_8006228(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5)
{
    int_vcount *cursor;
    s16 r1, r2, r4, r5, r7, r8;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (bg >= 2) {
        gHBlankCopySize = sizeof(winreg_t) * 2;

        if (bg & 1) {
            cursor = (int_vcount *)gBgOffsetsHBlank + sizeof(winreg_t);
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        } else {
            cursor = (int_vcount *)gBgOffsetsHBlank;
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    } else {
        volatile winreg_t *reg;
        gHBlankCopySize = sizeof(winreg_t);
        cursor = (int_vcount *)gBgOffsetsHBlank;

        // Required for match
        reg = &REG_WIN1H;
        if (bg & 1) {
            gHBlankCopyTarget = (void *)reg;
        } else {
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    }

    r1 = (param3 - param1);
    r4 = (param4 - param2);
    r5 = (param4 - param2);

    r2 = r1;
    r8 = ABS(r2) * 2;
    r7 = ABS(r4) * 2;

    cursor += (gHBlankCopySize * param2);

    if (ABS(r2) > ABS(r4)) {
        // _0800630A+8
        r4 = -r2;

        if (r2 > 0) {
            cursor[1] = param5;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1++;
                r4 += r7;

                if (r4 >= 0) {
                    r4 = ((r4 << 16) >> 16) - r8;
                    cursor[0] = param1;
                    cursor += gHBlankCopySize;
                    cursor[1] = param5;
                }
            }
            cursor[0] = param1;
        } else {
            cursor[0] = param1;
            cursor++;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1--;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= r8;
                    *cursor = param5;
                    cursor = ({
                        uintptr_t r0 = (gHBlankCopySize);
                        r0 += (uintptr_t)cursor;
                        (void *)(r0 - 1);
                    });
                    *cursor = param1;
#ifndef NON_MATCHING
                    asm("" : "=r"(cursor));
#endif
                    cursor++;
                }
            }
            *cursor = param5;
        }

    } else {
        r4 = -r4;
        // _080063DC
        if (r2 > 0) {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                // _080063F6
                *cursor = param1 + 1;
                cursor++;
                *cursor = param5;
                cursor = ({
                    uintptr_t r0 = (gHBlankCopySize);
                    r0 += (uintptr_t)cursor;
                    (void *)(r0 - 1);
                });

                r4 += r8;

                if (r4 >= 0) {
                    param1++;
                    r4 -= r7;
                }
            }
        } else {
            // _08006450
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param1 + 1;
                cursor++;
                *cursor = param5;

                cursor = ({
                    uintptr_t r0 = (gHBlankCopySize);
                    r0 += (uintptr_t)cursor;
                    (void *)(r0 - 1);
                });

                r4 += r8;

                if (r4 >= 0) {
                    param1--;
                    r4 -= r7;
                }
            }
        }
    }
}

void sub_80064A8(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4, u8 param5)
{
    int_vcount *cursor;
    s16 r1, r2, r4, r5, r7, r8;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (bg >= 2) {
        gHBlankCopySize = sizeof(winreg_t) * 2;

        if (bg & 1) {
            cursor = (int_vcount *)gBgOffsetsHBlank + sizeof(winreg_t);
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        } else {
            cursor = (int_vcount *)gBgOffsetsHBlank;
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    } else {
        volatile winreg_t *reg;
        gHBlankCopySize = sizeof(winreg_t);
        cursor = (int_vcount *)gBgOffsetsHBlank;

        // Required for match
        reg = &REG_WIN1H;
        if (bg & 1) {
            gHBlankCopyTarget = (void *)reg;
        } else {
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    }

    r1 = (param3 - param1);
    r4 = (param4 - param2);
    r5 = (param4 - param2);

    r2 = r1;
    r8 = ABS(r2) * 2;
    r7 = ABS(r4) * 2;

    cursor += (gHBlankCopySize * param2);

    if (ABS(r2) > ABS(r4)) {
        r4 = -r2;

        if (r2 > 0) {
            cursor[1] = param1;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1++;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= r8;
                    cursor[0] = param5;
                    cursor += gHBlankCopySize;
                    cursor[1] = param1;
                }
            }
            cursor[0] = param5;
        } else {
            cursor[0] = param5;
            cursor++;

            for (r2 = 0; r2 < ABS(r1); r2++) {
                param1--;
                r4 += r7;

                if (r4 >= 0) {
                    r4 -= r8;
                    *cursor = param1;
                    cursor = ({
                        uintptr_t r0 = (gHBlankCopySize);
                        r0 += (uintptr_t)cursor;
                        (void *)(r0 - 1);
                    });
                    *cursor = param5;
#ifndef NON_MATCHING
                    asm("" : "=r"(cursor));
#endif
                    cursor++;
                }
            }
            *cursor = param1;
        }

    } else {
        r4 = -r4;
        if (r2 > 0) {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param5;
                cursor++;
                *cursor = param1;
                cursor = ({
                    uintptr_t r0 = (gHBlankCopySize);
                    r0 += (uintptr_t)cursor;
                    (void *)(r0 - 1);
                });

                r4 += r8;

                if (r4 >= 0) {
                    param1++;
                    r4 -= r7;
                }
            }
        } else {
            for (r2 = 0; r2 < ABS(r5); r2++) {
                *cursor = param5;
                cursor++;
                *cursor = param1;

                cursor = ({
                    uintptr_t r0 = (gHBlankCopySize);
                    r0 += (uintptr_t)cursor;
                    (void *)(r0 - 1);
                });

                r4 += r8;

                if (r4 >= 0) {
                    param1--;
                    r4 -= r7;
                }
            }
        }
    }
}

NONMATCH("asm/non_matching/engine/unused_sub_800672C.inc", void sub_800672C()) { }
END_NONMATCH

NONMATCH("asm/non_matching/engine/unused_sub_8006DB4.inc", void sub_8006DB4()) { }
END_NONMATCH

// When this function is called, the background layer that is
// "lightened" by spot lights is fully lit.
// This function filters out all non-lit parts to display them normally.
// TODO: validate type of param1!
// (84.94%) https://decomp.me/scratch/00RIv
NONMATCH("asm/non_matching/engine/sub_800724C.inc", void sub_800724C(u8 bg, TriParam1 *param1))
{
    s16 sp00[2];
    s16 sp04[2];
    s16 sp8[2];
    s16 spC[2];
    Unknown sp10;
    s8 sp14[2];
    u8 sp18;
    s16 *sp1C;
    u8 var_r4;
    void *var_r0;
    void *cursor;

    memcpy(&sp04, &gUnknown_080984F4, sizeof(sp04));
    memset(&spC, 0, 4);
    memset(&sp10, 0, 4);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (bg > 1U) {
        gHBlankCopySize = 2 * sizeof(u16);
        if (bg & 0x1) {
            cursor = gBgOffsetsHBlank + 2;
        } else {
            cursor = gBgOffsetsHBlank;
        }

        gHBlankCopyTarget = (void *)&REG_WIN0H;
    } else {
        gHBlankCopySize = 1 * sizeof(u16);
        cursor = gBgOffsetsHBlank;
        if (bg & 0x1) {
            gHBlankCopyTarget = (void *)&REG_WIN1H;
        } else {
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    }

    var_r4 = (param1->unk5 > param1->unk1) ? param1->unk1 : param1->unk5;
    sp18 = (param1->unk5 < param1->unk1) ? param1->unk1 : param1->unk5;
    cursor += (var_r4 * gHBlankCopySize);
    sp00[0] = param1->unk2 - param1->unk0;
    sp04[0] = param1->unk3 - param1->unk1;
    spC[0] = ABS(sp00[0]) * 2;
    sp10.x = ABS(sp04[0]) * 2;
    sp00[1] = param1->unk6 - param1->unk4;
    sp04[1] = param1->unk7 - param1->unk5;
    spC[1] = ABS(sp00[1]) * 2;
    sp10.y = ABS(sp04[1]) * 2;
    sp14[0] = param1->unk0;
    sp14[1] = param1->unk4;
    sp8[0] = -sp04[0];
    sp8[1] = -sp04[1];

    if (var_r4 == sp18) {

    } else if (param1->unk1 < param1->unk5) {
        for (; var_r4 < sp18; var_r4++) {
            ((u8 *)cursor)[0] = 240;
            ((u8 *)cursor)[1] = sp14[0];
            sp8[0] += spC[0];
            while (sp8[0] >= 0) {
                if (sp00[0] > 0) {
                    sp14[0]++;
                    sp8[0] -= sp10.x;
                } else {
                    sp14[0]--;
                    sp8[0] -= sp10.x;
                    if (sp8[0] >= 0) {
                        ((u8 *)cursor)[1] = sp14[0];
                    }
                }
            }
            cursor += gHBlankCopySize;
        }
    } else {
        for (; var_r4 < sp18; var_r4++) {
            ((u8 *)cursor)[0] = sp14[1];
            ((u8 *)cursor)[1] = 0;
            sp8[1] += spC[1];

            while (sp8[1] >= 0) {
                if (sp00[1] > 0) {
                    sp14[1]++;
                    sp8[1] -= sp10.y;
                    if (sp8[1] >= 0) {
                        ((u8 *)cursor)[0] = (sp14[1] + 1);
                    }
                } else {
                    sp14[1]--;
                    sp8[1] -= sp10.y;
                }
            }
            cursor += gHBlankCopySize;
        }
    }

    sp18 = (param1->unk7 > param1->unk3) ? param1->unk3 : param1->unk7;
    for (; var_r4 < sp18; var_r4++) {
        ((u8 *)cursor)[0] = sp14[1];
        ((u8 *)cursor)[1] = sp14[0];

        sp8[0] += spC[0];
        sp8[1] += spC[1];

        if (sp8[0] >= 0) {
            while (sp8[0] >= 0) {
                sp1C = &sp8[0];
                if (sp00[0] > 0) {
                    sp14[0]++;
                    sp8[0] -= sp10.x;
                } else {
                    sp14[0]--;
                    *sp1C -= sp10.x;
                    if (*sp1C >= 0) {
                        ((u8 *)cursor)[1] = sp14[0];
                    }
                }
            }
        }

        while (sp8[1] >= 0) {
            if (sp00[1] > 0) {
                sp14[1]++;
                sp8[1] -= sp10.y;
                if (sp8[1] >= 0) {
                    ((u8 *)cursor)[0] = (sp14[1] + 1);
                }
            } else {
                sp14[1]--;
                sp8[1] = ((u16)sp8[1] - sp10.y);
            }
        }
        cursor += gHBlankCopySize;
    }
}
END_NONMATCH

// TODO: param2 might be horizontal
void sub_80075D0(u8 bg, u8 param1, u8 param2, s16 param3, s16 param4, u16 param5)
{
    int_vcount *cursor;
    s16 r1;
    u16 sb = (param5 * param5);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (bg >= 2) {
        gHBlankCopySize = 4;

        if (bg & 1) {
            cursor = &((int_vcount *)gBgOffsetsHBlank)[2];
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        } else {
            cursor = &((int_vcount *)gBgOffsetsHBlank)[0];
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    } else {
        gHBlankCopySize = 2;
        cursor = &((int_vcount *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gHBlankCopyTarget = (void *)&REG_WIN1H;
        } else {
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    }

    r1 = param4;

    if ((r1 - param1) > param5) {
        param1 = (param4 - param5);
    }

    if ((param2 - r1) > param5) {
        param2 = (param4 + param5);
    }

    cursor += (gHBlankCopySize * param1);

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

        cursor += (gHBlankCopySize - 2);
    }
}

void sub_8007738(u8 bg, int_vcount minY, int_vcount maxY, u16 param3, u8 param4, u8 param5, u16 param6, u8 param7, u8 param8, s16 param9,
                 s16 param10)
{
    u16 *cursor;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gHBlankCopySize = 4;

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

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&((u8 *)&REG_BG0HOFS)[param0 * 4];
    gHBlankCopySize = 4;

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
#endif

void sub_80078D4(u8 bg, int_vcount minY, int_vcount maxY, u16 offsetEven, u16 offsetOdd)
{
    s32 fillVal;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gHBlankCopySize = 4;

    if (minY < maxY) {
        fillVal = (offsetEven %= 512u) | ((offsetOdd % 512u) << 16);

        DmaFill32(3, fillVal, &((u16 *)gBgOffsetsHBlank)[minY * 2], (maxY - minY) * 4);
    }
}

#ifndef COLLECT_RINGS_ROM
void sub_8007958(u8 bg, int_vcount minY, int_vcount maxY, s16 param3, s8 param4, u16 param5, u16 param6)
{
    u16 *cursor;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&((u8 *)&REG_BG0HOFS)[bg * 4];
    gHBlankCopySize = 4;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY * 2];

    while (minY < maxY) {
        *cursor = (param3 + param5) & 0x1FF;
        cursor++;
        *cursor = param6;
        cursor++;

        param3 = -(param3 + param4);
        param4 = -param4;

        minY++;
    }
}

void sub_8007A08(u8 bg, u8 param1, u8 param2, u8 param3, u8 param4)
{
    u8 *cursor;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    if (bg >= 2) {
        gHBlankCopySize = 4;

        if (bg & 1) {
            cursor = &((u8 *)gBgOffsetsHBlank)[2];
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        } else {
            cursor = &((u8 *)gBgOffsetsHBlank)[0];
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    } else {
        gHBlankCopySize = 2;
        cursor = &((u8 *)gBgOffsetsHBlank)[0];

        if (bg & 1) {
            gHBlankCopyTarget = (void *)&REG_WIN1H;
        } else {
            gHBlankCopyTarget = (void *)&REG_WIN0H;
        }
    }

    cursor += param2 * gHBlankCopySize;
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

        v = gHBlankCopySize;
#ifndef NON_MATCHING
        asm("add %0, %0, %2" : "=r"(p) : "r"(v), "r"(cursor));
#else
        p = v + cursor;
#endif
        cursor = p - 1;

        param2++;
    }
}

#if ((GAME == GAME_SA1) || (GAME == GAME_SA2))
void sub_8007AC0(u8 affineBg, int_vcount minY, int_vcount maxY)
{
    u16 *cursor;
    u16 affine;
    void **ptr;
    u32 bg = affineBg;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    ptr = &gHBlankCopyTarget;

    bg *= 16;
#ifndef NON_MATCHING
    asm("sub %0, #0x20" ::"r"(bg));
#else
    bg -= 0x20;
#endif
    *ptr = (void *)(REG_ADDR_BG2PA + bg);

    gHBlankCopySize = 2;

    cursor = &((u16 *)gBgOffsetsHBlank)[minY];

#ifdef NON_MATCHING
    // assert(affineBg < NUM_AFFINE_BACKGROUNDS);
#endif

    affine = gBgAffineRegs[affineBg].pa;

    while (minY < maxY) {
        *cursor = affine + ((maxY - minY) * 4);

        cursor++;
        minY++;
    }
}
#endif
#endif
