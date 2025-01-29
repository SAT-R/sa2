#include "global.h"
#include "game/bg_palette_effects.h"

struct UNK_808DB78 {
    u8 unk0;
    u8 shiftFactor;
    u16 unk2;
    u16 unk4;
    s8 rShift;
    s8 gShift;
    s8 bShift;
    s8 unk12;

    u8 unk13;

    u16 palBuffer[BG_PLTT_SIZE / sizeof(u16)];
};

BackgroundPaletteEffects gBgPaletteEffects = {};

UNUSED void sub_808D8A0(struct UNK_808DB78 *unk0)
{
    u16 i;
    u16 *colors = unk0->palBuffer;
    u16 palette[ARRAY_COUNT(unk0->palBuffer)];

    u16 newColor;
    s16 component;
    u16 color;

    for (i = 0; i < ARRAY_COUNT(palette); i++) {
        if (i & 1)
            color = colors[i];
        else
            color = colors[i];
        component = (color & 31) + unk0->rShift * unk0->shiftFactor;
        if (component > 31) {
            component = 31;
        }

        if (component < 0) {
            component = 0;
        }
        newColor = component;

        component = ((color & 31 << 5) >> 5) + (unk0->gShift * unk0->shiftFactor);
        if (component > 0x1F) {
            component = 0x1F;
        }

        if (component < 0) {
            component = 0;
        }

        newColor |= component << 5;

        component = ((color & 31 << 10) >> 10) + (unk0->bShift * unk0->shiftFactor);
        if (component > 0x1F) {
            component = 0x1F;
        }

        if (component < 0) {
            component = 0;
        }

        newColor |= component << 10;
        palette[i] = newColor;
    }

    CpuFastCopy(palette, (void *)BG_PLTT, sizeof(palette));
    unk0->unk4 += unk0->unk2;
    unk0->shiftFactor = unk0->unk4 >> 8;
}

UNUSED void sub_808D988(int_vcount vcount)
{
    u8 i;

    BgPaletteEffectState *unk0 = gBgPaletteEffects.state;
    u16 palette[ARRAY_COUNT(unk0->palBuffer)];

    if (vcount == unk0->unk13 + unk0->offset) {
        if (unk0->unk0 == 0) {
            CpuFastCopy((void *)BG_PLTT, unk0->palBuffer, sizeof(u16) * 2);
            unk0->unk0 = 1;
        }
        if (unk0->cursor == 0) {
            CpuFastCopy(unk0->palBuffer, (u16 *)BG_PLTT + (unk0->bgPalId * 8), sizeof(u16) * 2);
        } else {
            for (i = 0; i < ARRAY_COUNT(unk0->palBuffer); i++) {
                u16 color = 0;
                s16 component = (unk0->palBuffer[i] & 31) + unk0->rShift;
                if (component > 31) {
                    component = 31;
                }
                color |= component;

                component = ((unk0->palBuffer[i] & (31 << 5)) >> 5) + unk0->gShift;
                if (component > 31) {
                    component = 31;
                }
                color |= component << 5;

                component = ((unk0->palBuffer[i] & 31 << 10) >> 10) + unk0->bShift;
                if (component > 31) {
                    component = 31;
                }
                color |= component << 10;

                palette[i] = color;
            }
            CpuFastCopy(palette, (u16 *)BG_PLTT + unk0->bgPalId * 8, sizeof(u16) * 2);
        }

        unk0->rShift += unk0->unkC;
        unk0->gShift += unk0->unkD;
        unk0->bShift += unk0->unkE;
        unk0->unk13 += unk0->unk12;

        unk0->cursor++;

        if (unk0->pattern[unk0->cursor] == 0xFF) {
            unk0->cursor = 0;
        }
    }

    if (vcount == (DISPLAY_HEIGHT - 1)) {
        unk0->cursor = 0;
        unk0->rShift = 0;
        unk0->gShift = 0;
        unk0->bShift = 0;
        unk0->unk13 = 0;
    }
}

UNUSED void sub_808DAC8(u8 a, const u8 *b, const void *c, BgPaletteEffectState *d)
{
    d->unk0 = 0;
    d->cursor = 0;
    d->unkC = 0;
    d->unkD = 0;
    d->unkE = 0;

    d->offset = 0;
    d->bgPalId = a;
    d->pattern = b;
    d->palette = c;
    gBgPaletteEffects.state = d;
}

UNUSED void sub_808DAEC(u8 a, u8 b, u8 c, u8 d, u32 e, BgPaletteEffectState *f)
{
    f->unk0 = 1;
    f->cursor = 0;
    f->unkC = b;
    f->unkD = c;
    f->unkE = d;

    f->rShift = 0;
    f->gShift = 0;
    f->bShift = 0;
    f->unk13 = 0;

    f->offset = 0;
    f->bgPalId = a;
    f->pattern = NULL;
    f->palette = NULL;

    CpuFastCopy((u16 *)BG_PLTT, f->palBuffer, sizeof(u16) * 2);
    gBgPaletteEffects.state = f;
}

void BgPaletteEffectGradient(int_vcount vcount)
{
    BgPaletteEffectState *state = gBgPaletteEffects.state;

    if (vcount >= (DISPLAY_HEIGHT - 1)) {
        state->cursor = 0;
        return;
    }

    if (vcount < state->pattern[state->cursor] + state->offset) {
        return;
    }

    CpuFastCopy(&state->palette[state->cursor * 16], (u16 *)BG_PLTT + (state->bgPalId * 16), sizeof(u16) * 2);

    state->cursor++;
}

UNUSED void sub_808DB78(u32 a, u16 b, u8 c, u8 d, u8 e, struct UNK_808DB78 *f)
{
    f->unk0 = 0;
    f->shiftFactor = 0;
    f->unk2 = b;
    f->unk4 = 0;
    f->rShift = c;
    f->gShift = d;
    f->bShift = e;
    CpuFastCopy((void *)BG_PLTT, &f->palBuffer, BG_PLTT_SIZE);
}
