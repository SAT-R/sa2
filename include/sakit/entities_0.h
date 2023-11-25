#ifndef GUARD_STAGE_ENTITIES_0_H
#define GUARD_STAGE_ENTITIES_0_H

#include "core.h"
#include "sakit/player.h"

// TODO: Include header this belongs to
u32 sub_800C944(Sprite *, s32, s32);

// TODO: Include header this belongs to
bool32 sub_800CA20(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C320(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C418(Sprite *s, s32 x, s32 y, u16 p3, Player *p);

// Lose rings?
bool32 sub_800CBA4(Player *);

#endif // GUARD_STAGE_ENTITIES_0_H
