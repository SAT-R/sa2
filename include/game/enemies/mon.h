#ifndef GUARD_ENEMY_MON_H
#define GUARD_ENEMY_MON_H

#include "global.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 x;
    /* 0x40 */ s32 y;
    /* 0x44 */ s32 deltaY;
    /* 0x48 */ s32 speedY;
} Sprite_Mon; /* 0x4C */

void initSprite_Enemy_Mon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY);

#endif // GUARD_ENEMY_MON_H
