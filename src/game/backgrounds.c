#include "global.h"
#include "game/backgrounds.h"

struct UNK_3005B80_UNK4_UNK8 {
    s8 unk0;
    u8 unk1;
    u16 unk2;

    u16 unk4;
    s8 unk6;

    s8 unk7;
    s8 unk8;
    s8 unk9;
    s8 unkA;

    u8 unkB;

    u8 unkC[BG_PLTT_SIZE];
};

struct UNK_808DB78 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
    u8 unk8;

    u16 filler9;

    u8 unkC[BG_PLTT_SIZE];
};

struct UNK_3005B80 gUnknown_03005B80 = {};

UNUSED void sub_808D8A0(struct UNK_3005B80_UNK4_UNK8 *unk0)
{
    u16 i;
    u16 array[BG_PLTT_SIZE / sizeof(u16)];
    u16 *colors = (u16 *)unk0->unkC;
    u16 temp5;
    s16 temp2;
    u16 color;

    for (i = 0; i < (BG_PLTT_SIZE / sizeof(u16)); i++) {
        if (i & 1)
            color = colors[i];
        else
            color = colors[i];
        temp2 = (color & 0x1F) + unk0->unk6 * unk0->unk1;
        if (temp2 > 0x1F) {
            temp2 = 0x1F;
        }

        if (temp2 < 0) {
            temp2 = 0;
        }
        temp5 = temp2;

        temp2 = ((color & 0x3E0) >> 5) + (unk0->unk7 * unk0->unk1);
        if (temp2 > 0x1F) {
            temp2 = 0x1F;
        }

        if (temp2 < 0) {
            temp2 = 0;
        }

        temp5 |= temp2 << 5;

        temp2 = ((color & 0x7C00) >> 10) + (unk0->unk8 * unk0->unk1);
        if (temp2 > 0x1F) {
            temp2 = 0x1F;
        }

        if (temp2 < 0) {
            temp2 = 0;
        }

        temp5 |= temp2 << 10;
        array[i] = temp5;
    }

    CpuFastSet(array, (void *)BG_PLTT, (sizeof(array) / 4));
    unk0->unk4 += unk0->unk2;
    unk0->unk1 = unk0->unk4 >> 8;
}

UNUSED void sub_808D988(u8 vcount)
{
    u8 i;
    u16 array[16];

    struct UNK_3005B80_UNK4 *unk0 = gUnknown_03005B80.unk0;

    if (vcount == unk0->unk13 + unk0->unk34) {
        if (unk0->unk0 == 0) {
            CpuFastSet((void *)BG_PLTT, unk0->unk14, 1);
            unk0->unk0 = 1;
        }
        if (unk0->unk2 == 0) {
            CpuFastSet(unk0->unk14, (void *)BG_PLTT + (unk0->unk1 * 16), 1);
        } else {
            for (i = 0; i < 16; i++) {
                u16 temp5 = 0;
                s16 temp2 = (unk0->unk14[i] & 0x1F) + unk0->unkF;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2;

                temp2 = ((unk0->unk14[i] & 0x3E0) >> 5) + unk0->unk10;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2 << 5;

                temp2 = ((unk0->unk14[i] & 0x7C00) >> 10) + unk0->unk11;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2 << 10;

                array[i] = temp5;
            }
            CpuFastSet(array, (void *)BG_PLTT + unk0->unk1 * 16, 1);
        }

        unk0->unkF += unk0->unkC;
        unk0->unk10 += unk0->unkD;
        unk0->unk11 += unk0->unkE;
        unk0->unk13 += unk0->unk12;

        unk0->unk2++;

        if (unk0->unk4[unk0->unk2] == 0xFF) {
            unk0->unk2 = 0;
        }
    }

    if (vcount == 0x9F) {
        unk0->unk2 = 0;
        unk0->unkF = 0;
        unk0->unk10 = 0;
        unk0->unk11 = 0;
        unk0->unk13 = 0;
    }
}

UNUSED void sub_808DAC8(u8 a, const u8 *b, const void *c, struct UNK_3005B80_UNK4 *d)
{
    d->unk0 = 0;
    d->unk2 = 0;
    d->unkC = 0;
    d->unkD = 0;
    d->unkE = 0;

    d->unk34 = 0;
    d->unk1 = a;
    d->unk4 = b;
    d->unk8 = c;
    gUnknown_03005B80.unk0 = d;
}

UNUSED void sub_808DAEC(u8 a, u8 b, u8 c, u8 d, u32 e, struct UNK_3005B80_UNK4 *f)
{
    f->unk0 = 1;
    f->unk2 = 0;
    f->unkC = b;
    f->unkD = c;
    f->unkE = d;

    f->unkF = 0;
    f->unk10 = 0;
    f->unk11 = 0;
    f->unk13 = 0;

    f->unk34 = 0;
    f->unk1 = a;
    f->unk4 = NULL;
    f->unk8 = NULL;

    CpuFastSet((void *)BG_PLTT, &f->unk14, 1);
    gUnknown_03005B80.unk0 = f;
}

void sub_808DB2C(int_vcount vcount)
{
    struct UNK_3005B80_UNK4 *unk0 = gUnknown_03005B80.unk0;

    if (vcount >= 159) {
        unk0->unk2 = 0;
        return;
    }

    if (vcount < (unk0->unk4[unk0->unk2]) + unk0->unk34) {
        return;
    }

    CpuFastSet(unk0->unk8 + (unk0->unk2 * 32), (void *)BG_PLTT + (unk0->unk1 * 32), 1);
    unk0->unk2++;
}

UNUSED void sub_808DB78(u32 a, u16 b, u8 c, u8 d, u8 e, struct UNK_808DB78 *f)
{
    f->unk0 = 0;
    f->unk1 = 0;
    f->unk2 = b;
    f->unk4 = 0;
    f->unk6 = c;
    f->unk7 = d;
    f->unk8 = e;
    CpuFastCopy((void *)BG_PLTT, &f->unkC, BG_PLTT_SIZE);
}
