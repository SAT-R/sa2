#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ bool8 clampParam;
    /* 0x51 */ u8 unk51;
} Sprite_Madillo; /* size: 0x54 */ 

void Task_MadilloMain(void);
void Task_8056230(void);
void TaskDestructor_80095E8(struct Task*);

void CreateEntity_Madillo(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    ENTITY_INIT(Sprite_Madillo, madillo, Task_MadilloMain, 0x4040, 0, TaskDestructor_80095E8);

    if(me->d.sData[1] != 0) {
        madillo->clampParam = TRUE;
    } else {
        madillo->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_GROUND(madillo, me);

    madillo->unk4C = -Q_24_8(1.5);
    madillo->unk51 = 120;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_EXCEPT_POS(s, 16, SA2_ANIM_MADILLO, 0, 0x480, 2);
}

#if 0
void Task_MadilloMain(void)
{
    Sprite_Madillo *madillo = TaskGetStructPtr(gCurTask);
    MapEntity *me = madillo->base.me;
    Sprite *s = &madillo->s;
    Vec2_32 pos;
    s32 delta;

    // TODO: Merge with ENEMY_CLAMP_TO_GROUND macro
    delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam);
    if(delta < 0) {
        madillo->offsetY += Q_24_8(delta);
        delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam);
    }

    if(delta > 0) {
        madillo->offsetY += Q_24_8(delta);
    }
    
    ENEMY_UPDATE_POSITION(madillo, s, pos.x, pos.y);
    
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_INVISIBLE(madillo, me, s);
    asm("");

    if(((pos.y - 50) < gPlayer.y)
    || ((pos.y + 50) > gPlayer.y)) {
        if(((pos.x - 50) > gPlayer.x)
        || ((pos.x - 120) < gPlayer.x)) {
            if(Q_24_8_TO_INT(madillo->offsetX)) {
                // TODO: Correctness check of this if
                if(Q_24_8_TO_INT(madillo->offsetX) > me->d.sData[0] * me->d.uData[2]) {
                    gCurTask->main = Task_8056230;
                    s->graphics.anim = SA2_ANIM_MADILLO;
                    s->variant = 1;
                    s->unk21 = -1;
                }
                SPRITE_FLAG_CLEAR(s, X_FLIP);
            }
        } else {
            // _080561BC
            if(Q_24_8(pos.x + 120) > gPlayer.x) {
                if(Q_24_8_TO_INT(madillo->offsetX) < me->d.sData[0] * me->d.uData[2]) {
                    gCurTask->main = Task_8056230;
                    s->graphics.anim = SA2_ANIM_MADILLO;
                    s->variant = 1;
                    s->unk21 = -1;
                SPRITE_FLAG_SET(s, X_FLIP);
                }
            }
        }

    }

    ENEMY_UPDATE(s, pos.x, pos.y);

}
#endif