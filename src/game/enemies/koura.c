#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/enemies/koura.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 offsetX;
    /* 0x40 */ s32 offsetY;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;

    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;

    /* 0x54 */ u8 unk54;
    /* 0x56 */ s16 unk56;
    /* 0x58 */ u16 unk58;
} Sprite_Koura; /* size: 0x5C */

void Task_MadilloMain(void);
void Task_8056230(void);
void Task_80564BC(void);

void sub_8054224(void);

extern const u16 gUnknown_080D8F38[][2];

void CreateEntity_Koura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{

    struct Task *t = TaskCreate(sub_8054224, 0x5C, 0x40B0, 0, TaskDestructor_80095E8);
    Sprite_Koura *koura = TaskGetStructPtr(t);
    Sprite *s = &koura->s;
    koura->base.regionX = spriteRegionX;
    koura->base.regionY = spriteRegionY;
    koura->base.me = me;
    koura->base.spriteX = me->x;
    koura->base.spriteY = spriteY;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[1] == 1) {
            koura->unk54 = 1;
        } else if (me->d.sData[1] == 0) {
            koura->unk54 = 0;
        } else {
            koura->unk54 = 2;
        }

        koura->unk56 = -128;
        koura->unk58 = 0;
    } else {
        koura->unk54 = 3;
        koura->unk56 = 0;
        koura->unk58 = -128;
    }

    ENEMY_SET_SPAWN_POS_STATIC(koura, me);
    koura->unk4C = 0;
    if (koura->unk54 < 2) {
        koura->unk50 = Q_24_8_NEW(sub_801F07C(Q_24_8_TO_INT(koura->spawnY),
                                              Q_24_8_TO_INT(koura->spawnX), koura->unk54,
                                              8, NULL, sub_801EE64));
    } else {
        koura->unk50 = 0;
    }

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    SPRITE_INIT(s, 30, gUnknown_080D8F38[koura->unk54 & 2][0],
                gUnknown_080D8F38[koura->unk54 & 2][1], 18, 2);
}
