#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40; // TODO: Q() value?
    /* 0x44 */ s32 unk44; // TODO: Q() value?
    /* 0x48 */ s16 unk48;
    /* 0x4C */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
} IronBall;

void Task_IronBallMain(void);
void TaskDestructor_IronBall(Task *);

void CreateEntity_IronBall(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_IronBallMain, sizeof(IronBall), 0x2000, 0, TaskDestructor_IronBall);
    IronBall *ball = TASK_DATA(t);
    Sprite *s = &ball->s;

    ball->base.regionX = regionX;
    ball->base.regionY = regionY;
    ball->base.me = me;
    ball->base.meX = me->x;
    ball->base.id = id;
    ball->unk40 = 0;
    ball->unk44 = 0;
    ball->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            ball->unk48 = 4;
            ball->unk3C = 0;
            ball->unk4A = 0;
        } else {
            ball->unk48 = 4;
            ball->unk3C = 0x80;
            ball->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            ball->unk48 = 0;
            ball->unk4A = 4;
            ball->unk3C = 0;
        } else {
            ball->unk48 = 0;
            ball->unk4A = 4;
            ball->unk3C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_5) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_IRON_BALL_5);
        s->graphics.anim = SA1_ANIM_IRON_BALL_5;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_IRON_BALL);
        s->graphics.anim = SA1_ANIM_IRON_BALL;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_IronBallMain(void)
{
    IronBall *ball = TASK_DATA(gCurTask);
    Sprite *s = &ball->s;
    s16 worldX, worldY;
    MapEntity *me = ball->base.me;
    s32 i;

    if (ball->unk48 != 0) {
        s32 r2 = Q(me->d.uData[2] * TILE_WIDTH);
        ball->unk40 = (r2 * SIN((ball->unk48 * ((gStageTime + ball->unk3C) & 0xFF)) & ONE_CYCLE)) >> 14;
    }

    if (ball->unk4A != 0) {
        s32 r2 = Q(me->d.uData[3] * TILE_WIDTH);
        ball->unk44 = (r2 * SIN((ball->unk4A * ((gStageTime + ball->unk3C) & 0xFF)) & ONE_CYCLE)) >> 14;
    }

    worldX = TO_WORLD_POS(ball->base.meX, ball->base.regionX);
    worldY = TO_WORLD_POS(me->y, ball->base.regionY);

    s->x = (worldX - gCamera.x) + I(ball->unk40);
    s->y = (worldY - gCamera.y) + I(ball->unk44);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (Coll_Player_Entity_Intersection(s, worldX + I(ball->unk40), worldY + I(ball->unk44), &PLAYER(i))) {
                Coll_DamagePlayer(&PLAYER(i));
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ball->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        DisplaySprite(s);
    }
}

void TaskDestructor_IronBall(Task *t)
{
    IronBall *ball = TASK_DATA(t);
    VramFree(ball->s.graphics.dest);
}