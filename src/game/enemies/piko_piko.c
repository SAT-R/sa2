#include "global.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"

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

#define ENEMY_SPEED_PIKOPIKO Q(1.0)

void CreateEntity_PikoPiko(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        struct Task *t = TaskCreate(Task_PikoPiko, sizeof(Sprite_PikoPiko), 0x4080, 0, TaskDestructor_PikoPiko);
        Sprite_PikoPiko *piko = TASK_DATA(t);
        Sprite *s = &piko->s;
        piko->base.regionX = spriteRegionX;
        piko->base.regionY = spriteRegionY;
        piko->base.me = me;
        piko->base.spriteX = me->x;
        piko->base.id = spriteY;

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

        SPRITE_INIT(s, 30, SA2_ANIM_PIKOPIKO, 0, 18, 2);
    }
}

static void Task_PikoPiko(void)
{
    Sprite_PikoPiko *piko = TASK_DATA(gCurTask);
    Sprite *s = &piko->s;
    MapEntity *me = piko->base.me;
    Vec2_32 pos;

    piko->offsetX += piko->speedX;

    ENEMY_CLAMP_TO_GROUND(piko, piko->clampParam);
    ENEMY_UPDATE_POSITION(piko, s, pos.x, pos.y);

    if (!(Coll_Player_Enemy(s, pos.x, pos.y, 1, &gPlayer) == TRUE)) {
        ENEMY_DESTROY_IF_PLAYER_HIT(s, pos);
    }

    ENEMY_DESTROY_IF_OFFSCREEN(piko, me, s);

    if (ENEMY_CROSSED_LEFT_BORDER(piko, me) && (piko->speedX < 0)) {
        NEGATE(piko->speedX);
    } else if (ENEMY_CROSSED_RIGHT_BORDER(piko, me) && (piko->speedX > 0)) {
        NEGATE(piko->speedX);
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

static void TaskDestructor_PikoPiko(struct Task *t)
{
    Sprite_PikoPiko *piko = TASK_DATA(t);
    VramFree(piko->s.graphics.dest);
}