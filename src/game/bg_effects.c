#include "global.h"
#include "game/bg_effects.h"

struct UNK_808DB78 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    s8 unk6;
    s8 unk7;
    s8 unk8;

    u16 unkA;

    u16 unkC[BG_PLTT_SIZE / sizeof(u16)];
};

struct BackgroundEffects gBgEffects = {};

UNUSED void sub_808D8A0(struct UNK_808DB78 *unk0)
{
    u16 i;
    u16 array[BG_PLTT_SIZE / sizeof(u16)];
    u16 *colors = unk0->unkC;
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

UNUSED void sub_808D988(int_vcount vcount)
{
    u8 i;
    u16 palette[16];

    struct BgEffectState *unk0 = gBgEffects.state;

    if (vcount == unk0->unk13 + unk0->vcountStart) {
        if (unk0->unk0 == 0) {
            CpuFastSet((void *)BG_PLTT, unk0->palBuffer, 1);
            unk0->unk0 = 1;
        }
        if (unk0->cursor == 0) {
            CpuFastSet(unk0->palBuffer, (u16 *)BG_PLTT + (unk0->bgPalId * 8), 1);
        } else {
            for (i = 0; i < 16; i++) {
                u16 temp5 = 0;
                s16 temp2 = (unk0->palBuffer[i] & 0x1F) + unk0->unkF;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2;

                temp2 = ((unk0->palBuffer[i] & 0x3E0) >> 5) + unk0->unk10;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2 << 5;

                temp2 = ((unk0->palBuffer[i] & 0x7C00) >> 10) + unk0->unk11;
                if (temp2 > 0x1F) {
                    temp2 = 0x1F;
                }
                temp5 |= temp2 << 10;

                palette[i] = temp5;
            }
            CpuFastCopy(palette, (u16 *)BG_PLTT + unk0->bgPalId * 8, sizeof(u16) * 2);
        }

        unk0->unkF += unk0->unkC;
        unk0->unk10 += unk0->unkD;
        unk0->unk11 += unk0->unkE;
        unk0->unk13 += unk0->unk12;

        unk0->cursor++;

        if (unk0->pattern[unk0->cursor] == 0xFF) {
            unk0->cursor = 0;
        }
    }

    if (vcount == 0x9F) {
        unk0->cursor = 0;
        unk0->unkF = 0;
        unk0->unk10 = 0;
        unk0->unk11 = 0;
        unk0->unk13 = 0;
    }
}

UNUSED void sub_808DAC8(u8 a, const u8 *b, const void *c, struct BgEffectState *d)
{
    d->unk0 = 0;
    d->cursor = 0;
    d->unkC = 0;
    d->unkD = 0;
    d->unkE = 0;

    d->vcountStart = 0;
    d->bgPalId = a;
    d->pattern = b;
    d->palette = c;
    gBgEffects.state = d;
}

UNUSED void sub_808DAEC(u8 a, u8 b, u8 c, u8 d, u32 e, struct BgEffectState *f)
{
    f->unk0 = 1;
    f->cursor = 0;
    f->unkC = b;
    f->unkD = c;
    f->unkE = d;

    f->unkF = 0;
    f->unk10 = 0;
    f->unk11 = 0;
    f->unk13 = 0;

    f->vcountStart = 0;
    f->bgPalId = a;
    f->pattern = NULL;
    f->palette = NULL;

    CpuFastCopy((u16 *)BG_PLTT, f->palBuffer, sizeof(u16) * 2);
    gBgEffects.state = f;
}

void BgEffectPaletteSwap(int_vcount vcount)
{
    struct BgEffectState *state = gBgEffects.state;

    if (vcount >= (DISPLAY_HEIGHT - 1)) {
        state->cursor = 0;
        return;
    }

    if (vcount < state->pattern[state->cursor] + state->vcountStart) {
        return;
    }

    CpuFastCopy(&state->palette[state->cursor * 16], (u16 *)BG_PLTT + (state->bgPalId * 16), sizeof(u16) * 2);

    state->cursor++;
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
