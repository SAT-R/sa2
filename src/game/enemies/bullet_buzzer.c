#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/game.h"
#include "game/stage/entities_manager.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite_UNK28 reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ u16 unk58;
    /* 0x5A */ u8 unk5A;
    /* 0x5B */ u8 unk5B;
    /* 0x5C */ u8 unk5C;
    /* 0x5C */ u8 unk5D;
    /* 0x5C */ u8 unk5E;
} Sprite_BulletBuzzer; /* size: 0x60 */

void Task_BulletBuzzerMain(void);

void CreateEntity_BulletBuzzer(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                               u8 spriteY)
{
    struct Task *t = TaskCreate(Task_BulletBuzzerMain, sizeof(Sprite_BulletBuzzer),
                                0x4040, 0, TaskDestructor_80095E8);
    Sprite_BulletBuzzer *bbuzzer = TaskGetStructPtr(t);
    Sprite *s = &bbuzzer->s;
    bbuzzer->base.regionX = spriteRegionX;
    bbuzzer->base.regionY = spriteRegionY;
    bbuzzer->base.me = me;
    bbuzzer->base.spriteX = me->x;
    bbuzzer->base.spriteY = spriteY;

    ENEMY_SET_SPAWN_POS_FLYING(bbuzzer, me);

    bbuzzer->unk54 = Q_24_8(0.0);
    bbuzzer->unk5A = me->d.uData[2] * 4;
    bbuzzer->unk5B = me->d.uData[3] * 4;
    bbuzzer->unk5C = 0;
    bbuzzer->unk5E = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_WITH_FLAGS(s, 24, SA2_ANIM_BULLETBUZZER, 0, 0x480, 2, SPRITE_FLAG_MASK_X_FLIP);
}