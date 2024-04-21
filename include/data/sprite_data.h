#ifndef GUARD_DATA_ANIMATIONS_H
#define GUARD_DATA_ANIMATIONS_H

#include "core.h"
#include "animation_commands.h"
#include "sprite.h"

#define NUM_SPRITE_ANIMATIONS 1133

extern const ACmd **const gAnimations[NUM_SPRITE_ANIMATIONS];
extern const SpriteOffset *const gSpriteDimensions[NUM_SPRITE_ANIMATIONS];
extern const OamDataShort *const gSpriteOamData[NUM_SPRITE_ANIMATIONS];
extern const u16 gSpritePalettes[];

#endif
