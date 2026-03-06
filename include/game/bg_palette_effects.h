#ifndef GUARD_BACKGROUNDS_H
#define GUARD_BACKGROUNDS_H

#include "global.h"
#include "core.h" // PALETTE_LEN_4BPP
#include "sprite.h"

typedef struct {
    u8 unk0;
    u8 bgPalId;
    u8 cursor;

    const u8 *pattern;

    const ColorRaw *palette;

    u8 unkC;
    u8 unkD;
    u8 unkE;

    s8 rShift;
    s8 gShift;
    s8 bShift;
    s8 unk12;

    u8 unk13;

    ColorRaw palBuffer[PALETTE_LEN_4BPP];

    s16 offset;
    u8 unk36;
} BgPaletteEffectState;

typedef struct {
    BgPaletteEffectState *state;
    Background *background;
} BackgroundPaletteEffects;

extern BackgroundPaletteEffects gBgPaletteEffects;

void BgPaletteEffectGradient(int_vcount vcount);

#endif // GUARD_BACKGROUNDS_H
