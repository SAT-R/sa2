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
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s32 unk5C;
    /* 0x60 */ s32 unk60;
    /* 0x64 */ u16 unk64;
    /* 0x66 */ u16 unk66;
    /* 0x68 */ u8 unk68;
} Sprite_Buzzer; /* size: 0x6C */

void Task_BuzzerMain(void);
void TaskDestructor_Buzzer(struct Task *);

void CreateEntity_Buzzer(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY_AND_ZONE_IS_NOT_1) {
        struct Task *t = TaskCreate(Task_BuzzerMain, sizeof(Sprite_Buzzer), 0x4030, 0,
                                    TaskDestructor_Buzzer);
        Sprite_Buzzer *buzzer = TaskGetStructPtr(t);
        Sprite *s = &buzzer->s;
        buzzer->base.regionX = spriteRegionX;
        buzzer->base.regionY = spriteRegionY;
        buzzer->base.me = me;
        buzzer->base.spriteX = me->x;
        buzzer->base.spriteY = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(buzzer, me);

        buzzer->unk54 = Q_24_8(0.0);
        buzzer->unk58 = 0;
        buzzer->unk60 = 0;
        buzzer->unk64 = 0;
        buzzer->unk66 = 0;
        buzzer->unk5C = 0;
        buzzer->unk68 = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 20, SA2_ANIM_BUZZER, 0, 0x480, 2);
    }
}