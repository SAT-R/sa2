#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;

    u8 filler6C[0x10];

    /* 0x7C */ Vec2_32 positions[64];
    /* 0x27C */ u8 unk27C;
    /* 0x27D */ u8 unk27D;
    /* 0x27E */ u8 unk27E;
} Sprite_GejiGeji; /* size: 0x280*/

#if 0
void CreateEntity_GejiGeji(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{

}
#endif