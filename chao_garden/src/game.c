#include "global.h"

void sub_02001290(void);
extern u8 gUnknown_03000606;
extern u8 gUnknown_03000607;
extern u8 gUnknown_03000608;

typedef void (*CallbackFunc)(void *);

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    s8 unk5;
    s8 unk6;
    u8 unk7;
} UNK_30005C0_UNK10;

typedef struct {
    CallbackFunc unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    UNK_30005C0_UNK10 *unk10;
    u16 unk14;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u16 unk1A;
    s8 unk1C;
    u32 unk20;
} UNK_30005C0;

typedef struct {
    u16 *unk0;
    u16 *unk4;
    u8 unk8;
    u8 unk9;
    u16 unkA;
} UNK_30013D8;

extern UNK_30005C0 gUnknown_03004400[72];
extern UNK_30005C0 gUnknown_03000610[72];

extern u8 gUnknown_03001076;
extern u8 gUnknown_03001077;
extern u8 gUnknown_03001078;

extern s8 gUnknown_03005270;

u8 gUnknown_03001030[0x45];
u8 gUnknown_030005C0[0x45];

extern s8 gUnknown_03001120[32];
extern u8 gUnknown_03001140;
extern u8 gUnknown_03001141;
extern u8 gUnknown_03001142;
extern u16 gUnknown_03001280[128];
extern s8 gUnknown_03001380[32];
extern u8 gUnknown_030013A0;
extern u8 gUnknown_030013A1;
extern u8 gUnknown_030013A2;

extern u16 gUnknown_03004E70[128][4];
extern u8 gUnknown_03001088[4][2];

extern u8 gUnknown_03001080[4];
extern u8 gUnknown_0300111C;
extern u8 gUnknown_03001148[10][2];
extern u8 gUnknown_030011D8[10];
extern u8 gUnknown_0300127A;
extern u8 gUnknown_03004E20[10];

extern u32 gUnknown_030013A8;
extern UNK_30013D8 gUnknown_030013D8[10];
extern u8 gUnknown_030014F8;

void sub_020013DC(UNK_30005C0 *);
void DummyCallback(UNK_30005C0 *);

void sub_02000c90(void)
{
    s32 i;

    sub_02001290();
    gUnknown_03004400[0].unk0 = (void *)sub_020013DC;
    gUnknown_03004400[0].unk5 = 0;
    gUnknown_03004400[0].unk4 = 0;
    gUnknown_03004400[0].unk6 = 1;
    gUnknown_03004400[1].unk0 = (void *)DummyCallback;
    gUnknown_03004400[1].unk4 = 1;
    gUnknown_03004400[1].unk6 = 0;
    gUnknown_03004400[1].unk5 = 0;

    for (i = 0; i < 70; i++) {
        gUnknown_030005C0[i] = i + 2;
    }

    gUnknown_03000606 = gUnknown_03000607 = gUnknown_03000608 = gUnknown_03005270 = 0;
}

UNK_30005C0 *sub_02000d04(CallbackFunc arg0, UNK_30005C0 *arg1, u8 arg2)
{
    u8 idx;
    UNK_30005C0 *r2;

    if (gUnknown_03000606 > 69) {
        return NULL;
    }

    idx = gUnknown_030005C0[gUnknown_03000607++];
    if (gUnknown_03000607 > 69) {
        gUnknown_03000607 = 0;
    }
    r2 = &gUnknown_03004400[idx];
    r2->unk0 = arg0;
    r2->unk4 = idx;

    if (arg2 != 0) {
        r2->unk5 = arg1->unk5;
        r2->unk6 = arg1->unk4;
        gUnknown_03004400[arg1->unk5].unk6 = idx;
        arg1->unk5 = idx;
    } else {
        r2->unk5 = arg1->unk4;
        r2->unk6 = arg1->unk6;
        gUnknown_03004400[arg1->unk6].unk5 = idx;
        arg1->unk6 = idx;
    }

    r2->unk19 = 0;
    r2->unk18 = 0;
    r2->unk17 = 0;
    r2->unk16 = 0;
    r2->unkC = 0;
    r2->unk8 = 0;
    r2->unk7 = 0;
    r2->unk1C = -1;
    gUnknown_03000606++;
    return r2;
}

void sub_02000f34(void);

void sub_02000db0(void)
{
    s16 i;

    sub_02000f34();
    CpuCopy32(&gUnknown_03004400, &gUnknown_03000610, sizeof(gUnknown_03004400));

    for (i = 0; i < 70; i++) {
        gUnknown_03001030[i] = gUnknown_030005C0[i];
    }
    gUnknown_03001076 = gUnknown_03000606;
    gUnknown_03001077 = gUnknown_03000607;
    gUnknown_03001078 = gUnknown_03000608;
}

void sub_02000fd4(void);

void sub_02000e28(void)
{
    s16 i;

    sub_02000fd4();
    CpuCopy32(&gUnknown_03000610, &gUnknown_03004400, sizeof(gUnknown_03004400));

    for (i = 0; i < 70; i++) {
        gUnknown_030005C0[i] = gUnknown_03001030[i];
    }
    gUnknown_03000606 = gUnknown_03001076;
    gUnknown_03000607 = gUnknown_03001077;
    gUnknown_03000608 = gUnknown_03001078;
    gUnknown_03005270 = 0;
}

void sub_02000eac(void)
{
    u8 i = 0;
    do {
        gUnknown_03004400[i].unk0(&gUnknown_03004400[i]);
        i = gUnknown_03004400[i].unk6;
    } while (i != 0);
}

void sub_02000ed4(UNK_30005C0 *arg0)
{
    gUnknown_03004400[arg0->unk5].unk6 = arg0->unk6;
    gUnknown_03004400[arg0->unk6].unk5 = arg0->unk5;

    gUnknown_030005C0[gUnknown_03000608++] = arg0->unk4;

    if (gUnknown_03000608 > 69) {
        gUnknown_03000608 = 0;
    }
    gUnknown_03000606--;
}

void DummyCallback(UNK_30005C0 *arg0) { }

void sub_02000f34(void)
{
    s16 i = 0;
#ifndef NON_MATCHING
    u8 *ip = &gUnknown_030013A0;
    u8 *r5 = &gUnknown_03001140;
    u8 *r8 = &gUnknown_030013A1;
#endif

    for (; i < 128; i++) {
        gUnknown_03001280[i] = gUnknown_03004E70[i][3];
    }

    for (i = 0; i < 32; i++) {
        gUnknown_03001380[i] = gUnknown_03001120[i];
    };

#ifndef NON_MATCHING
    *ip = *r5;
    *r8 = gUnknown_03001141;
#else
    gUnknown_030013A0 = gUnknown_03001140;
    gUnknown_030013A1 = gUnknown_03001141;
#endif
    gUnknown_030013A2 = gUnknown_03001142;
}

// 89%: https://decomp.me/scratch/INK5D
// Functional match but needs the permuter on it. Possibly some lost logging side effects here
NONMATCH("asm/non_matching/sub_02000fd4.inc", void sub_02000fd4())
{
    s16 i;
    for (i = 0; i < 128; i++) {
        gUnknown_03004E70[i][0] = 512;
        gUnknown_03004E70[i][3] = gUnknown_03001280[i];
    };

    for (i = 0; i < 32; i++) {
        gUnknown_03001120[i] = gUnknown_03001380[i];
    };

    gUnknown_03001140 = gUnknown_030013A0;
    gUnknown_03001141 = gUnknown_030013A1;
    gUnknown_03001142 = gUnknown_030013A2;
}
END_NONMATCH

void sub_02001088(void)
{
    u16 *r5;
    s32 ip;
    u8 r0, r6;
    UNK_30005C0 *r4;
    UNK_30005C0_UNK10 *r3;

    r5 = gUnknown_03004E70[0];
    r6 = 0x80;
    ip = 0;
    while (ip < 4) {
        r0 = gUnknown_03001088[ip][0];
        while (r0 != 0) {
            r4 = &gUnknown_03004400[gUnknown_03001088[r0][1]];
            r3 = r4->unk10;
            while (TRUE) {
                *r5 = ((r3->unk2 | r4->unk16) << 8) | ((r3->unk6 + r4->unkE) & 0xFF);
                r5++;
                *r5 = (((r3->unk3 | r4->unk17) << 8) | ((r3->unk5 + r4->unkA) & 0x1FF));
                r5++;
                *r5 = (((r3->unk4 | r4->unk18) << 8) | (r3->unk0 + r4->unk14));
                r6 -= 1;

                if (r6 == 0) {
                    return;
                }

                r5 += 2;

                if (r3->unk7 == 0) {
                    break;
                }
                r3++;
            }
            r0 = gUnknown_03001088[r0][0];
        }
        ip += 1;
    }

    while (--r6 != (u8)-1) {
        *r5 = 512;
        r5 += 4;
    }
}

void sub_0200117c(void)
{
    s32 i;

    gUnknown_03005270 = gUnknown_0300127A;
    if (gUnknown_0300127A != 0) {
        for (i = 0; i < gUnknown_0300127A; i++) {
            gUnknown_030011D8[gUnknown_03001148[i][0]]++;
        }

        for (i = 0; i <= DISPLAY_HEIGHT; i++) {
            u8 *p = &gUnknown_030011D8[i];
            p[1] += p[0];
        }

        for (i = gUnknown_0300127A - 1; i >= 0; i--) {
            gUnknown_03004E20[--gUnknown_030011D8[gUnknown_03001148[i][0]]] = gUnknown_03001148[i][1];
        }

        for (i = gUnknown_0300127A - 1; i >= 0; i--) {
            u8 val = gUnknown_03004E20[i];
            gUnknown_03001088[gUnknown_03001080[3]][0] = gUnknown_0300111C;
            gUnknown_03001088[gUnknown_0300111C][1] = val;
            gUnknown_03001080[3] = gUnknown_0300111C++;
        }
    }
}

void sub_02001254(s8 p0, u8 p1)
{
    gUnknown_03001088[gUnknown_03001080[p1]][0] = gUnknown_0300111C;
    gUnknown_03001088[gUnknown_0300111C][1] = p0;
    gUnknown_03001080[p1] = gUnknown_0300111C++;
}

void sub_02001290(void)
{
    s32 i;
#ifndef NON_MATCHING
    register u8 *r5 asm("r5") = &gUnknown_03001140;
    register u8 *r4 asm("r4") = &gUnknown_03001141;
#endif

    for (i = 0; i < 128; i++) {
        gUnknown_03004E70[i][0] = 0x200;
    }

    for (i = 0; i < 32; i++) {
        gUnknown_03001120[i] = i * 2;
    }

    gUnknown_03001142 = 0;
#ifndef NON_MATCHING
    *r4 = 0;
    *r5 = 0;
#else
    gUnknown_03001141 = 0;
    gUnknown_03001140 = 0;
#endif
}

void sub_020012e0(void) { CpuFastCopy(gUnknown_03004E70, (void *)OAM, sizeof(gUnknown_03004E70)); }

s8 sub_020012f8(void)
{
    s8 ret;

    if (gUnknown_03001140 > 0x1F) {
        return -1;
    }

    ret = gUnknown_03001120[gUnknown_03001141++];
    gUnknown_03001141 = gUnknown_03001141 & 0x1F;
    gUnknown_03001140 += 1;
    return ret;
}

void sub_0200133c(s8 arg0)
{
    gUnknown_03001120[gUnknown_03001142++] = arg0;
    gUnknown_03001142 &= 0x1F;
    gUnknown_03001140 -= 1;
}

void sub_02001374(void)
{
    s32 i;
    for (i = 0; i <= DISPLAY_HEIGHT + 1; i++) {
        gUnknown_030011D8[i] = 0;
    }
    gUnknown_0300127A = 0;
}

void sub_02001398(u8 arg0, u8 arg1)
{
    if (arg1 > DISPLAY_HEIGHT + 48) {
        arg1 = 0;
    } else if (arg1 > DISPLAY_HEIGHT + 1) {
        arg1 = DISPLAY_HEIGHT + 1;
    }
    gUnknown_03001148[gUnknown_0300127A][0] = arg1;
    gUnknown_03001148[gUnknown_0300127A++][1] = arg0;
}

void sub_020013DC(UNK_30005C0 *unused)
{
    s32 var_r2;

    for (var_r2 = 0; var_r2 < 4; var_r2++) {
        gUnknown_03001080[var_r2] = var_r2;
        gUnknown_03001088[var_r2][0] = 0;
    }

    gUnknown_0300111C = var_r2;

    for (; var_r2 <= 0x49; var_r2++) {
        gUnknown_03001088[var_r2][0] = 0;
    }
}

void sub_02001420(void)
{
    u16 *p, *unk0;
    s32 j;

    while (gUnknown_030014F8 != 0) {
        gUnknown_030014F8 -= 1;
        unk0 = gUnknown_030013D8[gUnknown_030014F8].unk0;
        if (unk0 == NULL) {
            if (gUnknown_030013D8[gUnknown_030014F8].unk8 != (u8)-1) {
                u16 *r2 = gUnknown_030013D8[gUnknown_030014F8].unk4;
                u8 r4 = gUnknown_030013D8[gUnknown_030014F8].unk8;
                u8 i = gUnknown_030013D8[gUnknown_030014F8].unk9;
                u16 r5 = gUnknown_030013D8[gUnknown_030014F8].unkA;
                while (--i != (u8)-1) {
                    p = r2;
                    for (j = 0; j < r4; j++) {
                        *p++ = r5;
                    }
                    r2 += 32;
                }
            } else {
                CpuFastFill(gUnknown_030013D8[gUnknown_030014F8].unkA, gUnknown_030013D8[gUnknown_030014F8].unk4, 0x800);
            }
        } else {
            u16 *r2 = gUnknown_030013D8[gUnknown_030014F8].unk4;
            u8 temp_r5 = gUnknown_030013D8[gUnknown_030014F8].unk8;
            u8 i = gUnknown_030013D8[gUnknown_030014F8].unk9;
            u16 r7 = gUnknown_030013D8[gUnknown_030014F8].unkA;
            while (--i != (u8)-1) {
                p = r2;
                for (j = 0; j < temp_r5; j++) {
                    *p++ = r7 + *unk0++;
                }
                r2 += 32;
            }
        }
    }
}

// Random?
u32 sub_0200151c(void) { return gUnknown_030013A8; }

void sub_02001528(u32 val) { gUnknown_030013A8 = val; }

u32 sub_02001534(void)
{
    gUnknown_030013A8 = gUnknown_030013A8 * 0x41c64e6d + 0x3039;
    return (gUnknown_030013A8 * 2) >> 0x11;
}

s16 sub_02001554(u16 arg0)
{
    u32 temp_r0;
    gUnknown_030013A8 = (gUnknown_030013A8 * 0x41C64E6D) + 0x3039;
    temp_r0 = gUnknown_030013A8 * 2;
    return Mod(temp_r0 >> 0x11, arg0);
}

u8 sub_02001588(s32 p0, u8 *arg1, u8 arg2)
{
    s32 i;
    u8 r0;

    arg1 += arg2;
    i = arg2;
    while (i > 0) {
#if !PORTABLE
        register u32 rem asm("r1");
#endif
        if (p0 <= 9) {
            *--arg1 = p0;
            break;
        }
        p0 = Div(p0, 10);
#if PORTABLE
        *--arg1 = Mod(p0, 10);
#else
        *--arg1 = rem;
#endif
        i -= 1;
    }

    r0 = 0;
    while (i > 1) {
        *--arg1 = 0;
        r0++;
        i -= 1;
    }

    return r0;
}

void sub_020015cc(s32 p0, u8 *arg1, u8 arg2, u8 arg3)
{
    s32 i, j;
    u8 r0;
    u8 *arr;

    arr = arg1;
    arr += arg2;
    i = arg2;
    while (i > 0) {
#if !PORTABLE
        register u32 rem asm("r1");
#endif
        if (p0 <= 9) {
            *--arr = p0;
            break;
        }
        p0 = Div(p0, 10);
#if PORTABLE
        *--arr = Mod(p0, 10);
#else
        *--arr = rem;
#endif
        i -= 1;
    }

    r0 = 0;
    while (i > 1) {
        *--arr = 0;
        r0++;
        i -= 1;
    }

    arg1 += r0;
    for (j = 0; j < arg2 - r0; j++) {
        *arg1 += arg3;
        arg1 += 1;
    }
}
