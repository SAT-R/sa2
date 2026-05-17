#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ Sprite s3;
    /* 0x9C */ u16 unk9C;
    /* 0x9E */ u16 unk9E;
    /* 0xA0 */ s8 playerID;
} CraneClaw;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
#ifndef NON_MATCHING
    /* 0x6C */ Sprite unused;
#endif
    /* 0x9C */ u16 unk9C;
    /* 0x9E */ u16 unk9E;
    /* 0xA0 */ s8 playerID;
} Lift;

void Task_CraneClawMain(void);
void Task_CraneClaw2(void);
void Task_CraneClaw3(void);
void Task_CraneClaw4(void);
void Task_CraneClaw5(void);
void Task_CraneClaw6(void);
void Task_CraneClaw7(void);
void Task_CraneClaw8(void);
void Task_LiftMain(void);
void Task_Lift2(void);
void Task_Lift3(void);
void Task_Lift4(void);
void TaskDestructor_CraneClaw(Task *t);
void TaskDestructor_Lift(Task *t);

void CreateEntity_CraneClaw(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_CraneClawMain, sizeof(CraneClaw), 0x2000, 0, TaskDestructor_CraneClaw);
    CraneClaw *crane = TASK_DATA(t);
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    crane->base.regionX = regionX;
    crane->base.regionY = regionY;
    crane->base.me = me;
    crane->base.meX = me->x;
    crane->base.id = id;

    crane->unk9C = 0;
    crane->unk9E = 0;
    crane->playerID = PLAYER_1;

    SET_MAP_ENTITY_INITIALIZED(me);

    // s->graphics.dest = ALLOC_TILES_MAX(SA1_ANIM_STEAM_EXHAUST, SA1_ANIM_STEAM_EXHAUST_LID);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_CRANE_CLAW_2);
    s->graphics.anim = SA1_ANIM_CRANE_CLAW_2;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_CRANE_CLAW_2, 3);
    s2->graphics.anim = SA1_ANIM_CRANE_CLAW_2;
    s2->variant = 3;
    s2->oamFlags = SPRITE_OAM_ORDER(17);
    s2->graphics.size = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s3->graphics.dest = ALLOC_TILES(SA1_ANIM_ANCHOR_HANDLES);
    s3->graphics.anim = SA1_ANIM_ANCHOR_HANDLES;
    s3->variant = 0;
    s3->oamFlags = SPRITE_OAM_ORDER(17);
    s3->graphics.size = 0;
    s3->animCursor = 0;
    s3->qAnimDelay = Q(0);
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_CraneClawMain(void)
{
    s32 i = 0;
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + 48;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y;

    do {
        Player *p = &PLAYER(i);

        if (Coll_Player_Entity_Intersection(s, worldX, worldY + 48, p)) {
            crane->unk9C = 0;
            crane->playerID = p->playerID;
            s->variant = 1;
            p->moveState |= MOVESTATE_IA_OVERRIDE;
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
            gCurTask->main = Task_CraneClaw2;
            m4aSongNumStart(SE_LIFT);
            break;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y + 24;
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw2(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + 48;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y;

    {
        Player *p = &PLAYER(crane->playerID);

        if (IS_ALIVE(p)) {
            p->qWorldX = Q(worldX);
            p->qWorldY = Q(worldY + 104);
        }

        if (++crane->unk9C >= 4) {
            crane->unk9C = 0;

            if (IS_ALIVE(p)) {
                p->qSpeedAirX = Q(0);
                p->qSpeedGround = Q(0);
                p->qSpeedAirY = Q(0);
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_38;
            }
            gCurTask->main = Task_CraneClaw3;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y + 24;
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw3(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 sp08;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    sp08 = Div((30 - crane->unk9C) * 48, 30);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + sp08;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y;

    {
        Player *p = &PLAYER(crane->playerID);

        if (IS_ALIVE(p)) {
            p->qWorldX = Q(worldX);
            p->qWorldY = Q(worldY + sp08 + 56);
        }

        if (++crane->unk9C > 30) {
            crane->unk9C = 0;

            if (IS_ALIVE(p)) {
                p->qSpeedAirX = Q(0);
                p->qSpeedGround = Q(0);
                p->qSpeedAirY = Q(0);
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_38;
            }
            gCurTask->main = Task_CraneClaw4;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y + (sp08 >> 1);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw4(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s3 = &crane->s3;
    s16 r3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    r3 = (crane->unk9C * 2);
    s->x = worldX - gCamera.x + r3;
    s->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x + r3;
    s3->y = worldY - gCamera.y;

    {
        Player *p = &PLAYER(crane->playerID);

        if (IS_ALIVE(p)) {
            p->qWorldX = Q(worldX + r3);
            p->qWorldY = Q(worldY + 56);
        }

        if (r3 > me->d.uData[2] * TILE_WIDTH) {

            if (IS_ALIVE(p)) {
                p->moveState &= ~MOVESTATE_IA_OVERRIDE;

                p->qSpeedAirX = Q(0);
                p->qSpeedGround = Q(0);
                p->qSpeedAirY = Q(0);
                Player_TransitionCancelFlyingAndBoost(p);
                p->charState = CHARSTATE_18;
            }

            crane->unk9E = 0;
            s->variant = 2;
            m4aSongNumStop(SE_LIFT);

            gCurTask->main = Task_CraneClaw5;
            p->itemEffect &= ~0x80;
        } else {
            crane->unk9C++;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw5(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s3 = &crane->s3;
    s16 r3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    r3 = (crane->unk9C * 2);
    s->x = worldX - gCamera.x + r3;
    s->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x + r3;
    s3->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (++crane->unk9E > 30) {
        gCurTask->main = Task_CraneClaw6;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw6(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s3 = &crane->s3;
    s16 r3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    r3 = (crane->unk9C * 2);
    s->x = worldX - gCamera.x + r3;
    s->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x + r3;
    s3->y = worldY - gCamera.y;

    if (crane->unk9C == 0) {
        gCurTask->main = Task_CraneClaw7;
    } else {
        crane->unk9C--;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw7(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 sp08;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    sp08 = 48 - Div((30 - crane->unk9C) * 48, 30);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + sp08;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y;

    if (++crane->unk9C > 30) {
        crane->unk9C = 0;
        gCurTask->main = Task_CraneClaw8;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y + (sp08 >> 1);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void Task_CraneClaw8(void)
{
    CraneClaw *crane = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = crane->base.me;
    Sprite *s = &crane->s;
    Sprite *s2 = &crane->s2;
    Sprite *s3 = &crane->s3;

    worldX = TO_WORLD_POS(crane->base.meX, crane->base.regionX);
    worldY = TO_WORLD_POS(me->y, crane->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + 48;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;
    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y;

    if (++crane->unk9C > 3) {
        crane->unk9C = 0;
        crane->playerID = PLAYER_1;
        gCurTask->main = Task_CraneClawMain;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, crane->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y + 24;
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    UpdateSpriteAnimation(s3);
    DisplaySprite(s3);
}

void CreateEntity_Lift(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_LiftMain, sizeof(Lift), 0x2000, 0, TaskDestructor_Lift);
    Lift *lift = TASK_DATA(t);
    Sprite *s = &lift->s;
    Sprite *s2 = &lift->s2;

    lift->base.regionX = regionX;
    lift->base.regionY = regionY;
    lift->base.me = me;
    lift->base.meX = me->x;
    lift->base.id = id;

    lift->unk9C = 0;
    lift->unk9E = 0;

    SET_MAP_ENTITY_INITIALIZED(me);

    // s->graphics.dest = ALLOC_TILES_MAX(SA1_ANIM_STEAM_EXHAUST, SA1_ANIM_STEAM_EXHAUST_LID);
    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_LIFT, 1);
    s->graphics.anim = SA1_ANIM_LIFT;
    s->variant = 1;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_LIFT, 0);
    s2->graphics.anim = SA1_ANIM_LIFT;
    s2->variant = 0;
    s2->oamFlags = SPRITE_OAM_ORDER(17);
    s2->graphics.size = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
}

void Task_LiftMain(void)
{
    s32 i = 0;
    Lift *lift = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = lift->base.me;
    Sprite *s = &lift->s;
    Sprite *s2 = &lift->s2;

    worldX = TO_WORLD_POS(lift->base.meX, lift->base.regionX);
    worldY = TO_WORLD_POS(me->y, lift->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y - 16;

    do {
        Player *p = &PLAYER(i);

        if (Coll_Player_Entity_Intersection(s, worldX, worldY, p)) {
            lift->unk9C = 0;
            lift->playerID = p->playerID;
            p->moveState |= MOVESTATE_IA_OVERRIDE;
            p->qSpeedAirX = Q(0);
            p->qSpeedGround = Q(0);
            p->qSpeedAirY = Q(0);
            Player_TransitionCancelFlyingAndBoost(p);
            p->charState = CHARSTATE_38;
            m4aSongNumStart(SE_LIFT);
            p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
            gCurTask->main = Task_Lift2;
            break;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, lift->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);

    DisplaySprite(s2);
    s2->y = worldY - gCamera.y - (48 + (0 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - (48 + (1 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - (48 + (2 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);
}

void Task_Lift2(void)
{
    Lift *lift = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 sp08;
    MapEntity *me = lift->base.me;
    Sprite *s = &lift->s;
    Sprite *s2 = &lift->s2;

    worldX = TO_WORLD_POS(lift->base.meX, lift->base.regionX);
    worldY = TO_WORLD_POS(me->y, lift->base.regionY);

    sp08 = 128 - Div((64 - lift->unk9C) * 128, 64);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - sp08;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y - sp08 - 16;

    {
        Player *p = &PLAYER(lift->playerID);

        if (IS_ALIVE(p)) {
            if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
                p->qWorldX = Q(worldX - 3);
            } else {
                p->qWorldX = Q(worldX + 8);
            }

            p->qWorldY = Q(worldY - sp08 + 26);
        } else {
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        }

        if (++lift->unk9C > 64) {
            lift->unk9C = 0;

            m4aSongNumStop(SE_LIFT);

            gCurTask->main = Task_Lift3;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, lift->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);

    DisplaySprite(s2);
    s2->y = worldY - gCamera.y - sp08 - (48 + (0 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - sp08 - (48 + (1 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - sp08 - (48 + (2 * SA1_ANIM_LIFT_VAR0_HEIGHT));
    DisplaySprite(s2);
}

void Task_Lift3(void)
{
    Lift *lift = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    MapEntity *me = lift->base.me;
    Sprite *s = &lift->s;
    Sprite *s2 = &lift->s2;
    s16 r3;
    s32 sp08 = 0;

    worldX = TO_WORLD_POS(lift->base.meX, lift->base.regionX);
    worldY = TO_WORLD_POS(me->y, lift->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - 0x80;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y - 0x90;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, lift->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        Player *p = &PLAYER(lift->playerID);

        if (IS_ALIVE(p)) {
            if (p->frameInput & gPlayerControls.jump) {
                p->moveState &= ~MOVESTATE_IA_OVERRIDE;
                p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                p->qSpeedAirX = Q(0);
                p->qSpeedGround = Q(0);
                p->qSpeedAirY = -Q(4);
                Player_TransitionCancelFlyingAndBoost(p);
                lift->unk9C = 0;
                lift->unk9E = 60;
                gCurTask->main = Task_Lift4;

                if (p->character != CHARACTER_AMY) {
                    p->charState = CHARSTATE_SPINATTACK;
                } else {
                    p->charState = CHARSTATE_85;
                }

                p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            }
        } else {
            p->moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

            lift->unk9C = 0;
            lift->unk9E = 60;
            gCurTask->main = Task_Lift4;
        }
    }

    DisplaySprite(s);

    // TODO: 160 = DISPLAY_HEIGHT?
    DisplaySprite(s2);
    s2->y = worldY - gCamera.y - sp08 - (160 + (0 * 16));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - sp08 - (160 + (1 * 16));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - sp08 - (160 + (2 * 16));
    DisplaySprite(s2);
}

void Task_Lift4(void)
{
    Lift *lift = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 offsetY;
    MapEntity *me = lift->base.me;
    Sprite *s = &lift->s;
    Sprite *s2 = &lift->s2;

    worldX = TO_WORLD_POS(lift->base.meX, lift->base.regionX);
    worldY = TO_WORLD_POS(me->y, lift->base.regionY);

    offsetY = Div((30 - lift->unk9C) * 128, 30);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - offsetY;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y - offsetY - 16;

    if (lift->unk9E > 0) {
        lift->unk9E--;
    } else if (++lift->unk9C > 30) {
        lift->unk9C = 0;
        lift->playerID = PLAYER_1;
        gCurTask->main = Task_LiftMain;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, lift->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);

    DisplaySprite(s2);
    s2->y = worldY - gCamera.y - offsetY - (48 + (0 * 16));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - offsetY - (48 + (1 * 32));
    DisplaySprite(s2);

    s2->y = worldY - gCamera.y - offsetY - (48 + (2 * 32));
    DisplaySprite(s2);
}

void TaskDestructor_CraneClaw(Task *t)
{
    CraneClaw *crane = TASK_DATA(t);
    VramFree(crane->s.graphics.dest);
    VramFree(crane->s2.graphics.dest);
    VramFree(crane->s3.graphics.dest);
}

void TaskDestructor_Lift(Task *t)
{
    Lift *lift = TASK_DATA(t);
    VramFree(lift->s.graphics.dest);
    VramFree(lift->s2.graphics.dest);
}
