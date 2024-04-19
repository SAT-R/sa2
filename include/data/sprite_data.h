#ifndef GUARD_DATA_ANIMATIONS_H
#define GUARD_DATA_ANIMATIONS_H

#include "gba/types.h"
#include "animation_commands.h"
#include "sprite.h"

#define NUM_SPRITE_ANIMATIONS 1133

extern const ACmd **const gAnimations[NUM_SPRITE_ANIMATIONS];
extern const SpriteOffset *const gSpriteDimensions[NUM_SPRITE_ANIMATIONS];
extern const OamDataShort *const gSpriteOamData[NUM_SPRITE_ANIMATIONS];
extern const u16 gSpritePalettes[];

struct SpriteTables {
    /* 0x00 */ const ACmd **const *animations;
    /* 0x04 */ const SpriteOffset *const *dimensions;
    /* 0x08 */ const u16 **const oamData;
    /* 0x0C */ const u16 *const palettes;
    /* 0x10 */ const u8 *const tiles_4bpp;
    /* 0x14 */ const u8 *const tiles_8bpp;
};
extern const struct SpriteTables *gUnknown_03002794;

#endif
