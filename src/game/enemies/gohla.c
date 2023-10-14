#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/enemies/gohla.h"
#include "malloc_vram.h"
#include "sprite.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ s32 spawnX;
    /* 0x78 */ s32 spawnY;
    /* 0x7C */ s32 unk7C;
    /* 0x80 */ s32 unk80;
    /* 0x84 */ s32 unk84;
    /* 0x88 */ s16 unk88;
    /* 0x8A */ s16 unk8A;
    /* 0x8C */ u8 unk8C;
} Sprite_Gohla; /* size: 0x90 */

void sub_8051928(void);

void sub_8051E20(struct Task *);

void CreateEntity_Gohla(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gDifficultyLevel != 1) {
        struct Task *t
            = TaskCreate(sub_8051928, sizeof(Sprite_Gohla), 0x4040, 0, sub_8051E20);
        Sprite_Gohla *gohla = TaskGetStructPtr(t);
        Sprite *s = &gohla->s;
        gohla->base.regionX = spriteRegionX;
        gohla->base.regionY = spriteRegionY;
        gohla->base.me = me;
        gohla->base.spriteX = me->x;
        gohla->base.spriteY = spriteY;

        if (me->d.sData[1]) {
            gohla->unk8C = 1;
        } else {
            gohla->unk8C = 0;
        }

        gohla->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
        gohla->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
        gohla->unk7C = 0;
        gohla->unk80 = Q_24_8(sub_801F07C(Q_24_8_TO_INT(gohla->spawnY),
                                          Q_24_8_TO_INT(gohla->spawnX), gohla->unk8C, 8,
                                          NULL, sub_801EE64));
        gohla->unk84 = 0;
        gohla->unk88 = 0;
        gohla->unk8A = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);
        SPRITE_INIT(s, 9, SA2_ANIM_GOHLA, 0, 18, 2);

        s = &gohla->s2;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 6, SA2_ANIM_GOHLA_PROJ, 0, 17, 2);
    }
}
