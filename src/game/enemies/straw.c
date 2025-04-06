#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"

#include "game/entity.h"
#include "game/enemies/straw.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 unk55;
} Sprite_Straw; /* 0x58 */

void sub_8056AF4(void);
void Task_StrawMain(void);

#define NUM_TILES_STRAW 12

void CreateEntity_Straw(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        s32 rand;
        struct Task *t = TaskCreate(Task_StrawMain, sizeof(Sprite_Straw), 0x4040, 0, TaskDestructor_80095E8);
        Sprite_Straw *straw = TASK_DATA(t);
        Sprite *s = &straw->s;
        straw->base.regionX = spriteRegionX;
        straw->base.regionY = spriteRegionY;
        straw->base.me = me;
        straw->base.spriteX = me->x;
        straw->base.id = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(straw, me);

        rand = CLAMP_SIN_PERIOD(PseudoRandom32());
        straw->unk4C = COS(rand) >> 5;
        straw->unk50 = SIN(rand) >> 5;
        straw->unk54 = 100;
        straw->unk55 = 5;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, NUM_TILES_STRAW, SA2_ANIM_STRAW, 0, 18, 1);
    }
}

void sub_80567F8(void)
{
    Sprite_Straw *straw = TASK_DATA(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos = {
        .x = I(straw->spawnX + straw->offsetX),
        .y = I(straw->spawnY + straw->offsetY),
    };

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (Coll_Player_Enemy_Attack(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(straw, me, s);

    if (--straw->unk54 == 0) {
        s32 rand = CLAMP_SIN_PERIOD(PseudoRandom32());
        straw->unk4C = COS(rand) >> 5;
        straw->unk50 = SIN(rand) >> 5;
        straw->unk54 = 100;
        gCurTask->main = Task_StrawMain;
    }

    ENEMY_UPDATE(s, pos.x, pos.y);
}

void Task_StrawMain(void)
{
    Sprite_Straw *straw = TASK_DATA(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos;

    straw->offsetX += straw->unk4C;
    straw->offsetY += straw->unk50;

    ENEMY_UPDATE_POSITION(straw, s, pos.x, pos.y);

    if (gPlayer.qWorldX < QS(pos.x)) {
        straw->unk4C -= 0x10;
    } else {
        straw->unk4C += 0xB;
    }

    if (gPlayer.qWorldY < QS(pos.y)) {
        straw->unk50 -= 0x10;
    } else {
        straw->unk50 += 0xB;
    }

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(straw, me, s);

    if (--straw->unk54 == 0) {
        if ((--straw->unk55 % 256) == 0) {
            gCurTask->main = sub_8056AF4;
        } else {
            gCurTask->main = sub_80567F8;
        }
        straw->unk54 = 30;
    }

    ENEMY_UPDATE_EX(s, pos.x, pos.y, ENEMY_TURN_TO_PLAYER(Q(pos.x), s))
}

void sub_8056AF4(void)
{
    Sprite_Straw *straw = TASK_DATA(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos;

    straw->offsetX += straw->unk4C;
    straw->offsetY += straw->unk50;

    ENEMY_UPDATE_POSITION(straw, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(straw, me, s);

    ENEMY_UPDATE(s, pos.x, pos.y);
}
