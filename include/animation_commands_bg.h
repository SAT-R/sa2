#ifndef GUARD_ANIMATION_COMMANDS_EXTRA_H
#define GUARD_ANIMATION_COMMANDS_EXTRA_H

#include "gba/types.h"
#include "sprite.h"

void UpdateBgAnimationTiles(Background *);

s32 RenderText(void *dest, const void *font, u16 x, u16 y, u8 bg, const char *text, u8 palette);

#endif // GUARD_ANIMATION_COMMANDS_EXTRA_H
