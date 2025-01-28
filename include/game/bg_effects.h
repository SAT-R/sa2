#ifndef GUARD_BACKGROUNDS_H
#define GUARD_BACKGROUNDS_H

#include "global.h"
#include "sprite.h"

struct BgEffectState {
    u8 unk0;
    u8 bgPalId;
    u8 cursor;

    const u8 *pattern;

    const u16 *palette;

    u8 unkC;
    u8 unkD;
    u8 unkE;

    s8 unkF;
    s8 unk10;
    s8 unk11;
    s8 unk12;

    u8 unk13;

    u16 palBuffer[32 / sizeof(u16)];

    s16 vcountStart;
    u8 unk36;
};

struct BackgroundEffects {
    struct BgEffectState *state;
    Background *background;
};

// Used outside of this module I think, so declared here
extern struct BackgroundEffects gBgEffects;

void BgEffectPaletteSwap(int_vcount vcount);

#endif // GUARD_BACKGROUNDS_H
