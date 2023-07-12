#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x8];
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;
    /* 0x54 */ bool8 clampParam; // TODO: Better name!
    /* 0x56 */ s16 speedX;
} Sprite_PikoPiko; /* size: 0x58 */

static void Task_PikoPiko(void);
static void TaskDestructor_PikoPiko(struct Task *);

#define ENEMY_SPEED_PIKOPIKO Q_24_8(1.0)

void CreateEntity_PikoPiko(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    if ((gGameMode == GAME_MODE_TIME_ATTACK) || (gDifficultyLevel != 1)) {
        ENTITY_INIT(Sprite_PikoPiko, piko, Task_PikoPiko, 0x4080, 0,
                    TaskDestructor_PikoPiko);

        if (me->d.sData[1] != 0) {
            piko->clampParam = TRUE;
        } else {
            piko->clampParam = FALSE;
        }

        piko->speedX = -ENEMY_SPEED_PIKOPIKO;

        ENEMY_SET_SPAWN_POS_GROUND(piko, me);

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT_EXCEPT_POS(s, 30, SA2_ANIM_PIKOPIKO, 0, 0x480, 2);
    }
}

static void Task_PikoPiko(void)
{
    Sprite_PikoPiko *piko = TaskGetStructPtr(gCurTask);
    Sprite *s = &piko->s;
    MapEntity *me = piko->base.me;
    Vec2_32 pos;

    piko->offsetX += piko->speedX;

    ENEMY_CLAMP_TO_GROUND(piko, piko->clampParam);
    ENEMY_UPDATE_POSITION(piko, s, pos.x, pos.y);

    if (!(sub_800CA20(s, pos.x, pos.y, 1, &gPlayer) == TRUE)) {
        ENEMY_DESTROY_IF_PLAYER_HIT(s, pos);
    }

    ENEMY_DESTROY_IF_INVISIBLE(piko, me, s);

    if (ENEMY_CROSSED_LEFT_BORDER(piko, me) && (piko->speedX < 0)) {
        NEGATE(piko->speedX);
    } else if (ENEMY_CROSSED_RIGHT_BORDER(piko, me) && (piko->speedX > 0)) {
        NEGATE(piko->speedX);
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

static void TaskDestructor_PikoPiko(struct Task *t)
{
    Sprite_PikoPiko *piko = TaskGetStructPtr(t);
    VramFree(piko->s.graphics.dest);
}