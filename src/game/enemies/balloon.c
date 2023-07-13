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
    /* 0x58 */ s32 unk58;
    /* 0x5C */ u8 unk5C;
    /* 0x5D */ u8 unk5D;
    /* 0x5E */ u8 unk5E;
} Sprite_Balloon; /* size: 0x60 */

void Task_BalloonMain(void);

void CreateEntity_Balloon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        ENTITY_INIT(Sprite_Balloon, balloon, Task_BalloonMain, 0x4040, 0,
                    TaskDestructor_80095E8);
        ENEMY_SET_SPAWN_POS_FLYING(balloon, me);

        balloon->unk54 = Q_24_8(0.5);
        balloon->unk58 = Q_24_8(0.0);
        balloon->unk5E = 120;
        balloon->unk5C = me->d.uData[2] * 4;
        balloon->unk5D = me->d.uData[3] * 4;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT_EXCEPT_POS(s, 10, SA2_ANIM_BALLOON, 0, 0x480, 2);
    }
}