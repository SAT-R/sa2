#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "malloc_vram.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ s32 spawnX;
    /* 0x70 */ s32 spawnY;
    /* 0x74 */ s32 offsetX;
    /* 0x78 */ s32 offsetY;
    /* 0x7C */ s32 positions[2][64];
    /* 0x27C */ u8 unk27C;
    /* 0x27D */ u8 unk27D;
    /* 0x27E */ u8 unk27E;
} Sprite_GejiGeji; /* size: 0x280*/

void sub_8057F80(void);
void sub_8058480(struct Task *);

extern const TileInfo gUnknown_080D8F50[4];

void CreateEntity_GejiGeji(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    u8 i;
    struct Task *t = TaskCreate(sub_8057F80, 0x280, 0x4040, 0, sub_8058480);
    Sprite_GejiGeji *gg = TaskGetStructPtr(t);

    Sprite *s = &gg->s;
    gg->base.regionX = spriteRegionX;
    gg->base.regionY = spriteRegionY;
    gg->base.me = me;
    gg->base.spriteX = me->x;
    gg->base.spriteY = spriteY;

    gg->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    gg->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
    gg->offsetX = 0;
    gg->offsetY = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        gg->unk27C = 0;
    } else {
        gg->unk27C = 1;
    }

    gg->unk27D = 0;
    gg->unk27E = 0;

    for (i = 0; i < 64; i++) {
        gg->positions[0][i] = Q_24_8_TO_INT(gg->spawnX);
        gg->positions[1][i] = Q_24_8_TO_INT(gg->spawnY);
    }

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, gUnknown_080D8F50[gg->unk27C].numTiles,
                gUnknown_080D8F50[gg->unk27C].anim,
                gUnknown_080D8F50[gg->unk27C].variant, 0x480, 2);

    s = &gg->s2;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, gUnknown_080D8F50[gg->unk27C + 2].numTiles,
                gUnknown_080D8F50[gg->unk27C + 2].anim,
                gUnknown_080D8F50[gg->unk27C + 2].variant, 0x500, 2);
}
