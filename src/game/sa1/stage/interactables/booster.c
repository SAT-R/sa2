#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
} Booster;

void Task_Booster(void);
void TaskDestructor_Booster(Task *);

void CreateEntity_Booster(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOOSTER);
    s->graphics.anim = SA1_ANIM_BOOSTER;
    s->variant = 0;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void CreateEntity_Booster_SlightLeft(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_BOOSTER, 2);
    s->graphics.anim = SA1_ANIM_BOOSTER;
    s->variant = 2;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void CreateEntity_Booster_SlightRight(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_BOOSTER, 2);
    s->graphics.anim = SA1_ANIM_BOOSTER;
    s->variant = 1;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void CreateEntity_Booster_Wall(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOOSTER_VERT);
    s->graphics.anim = SA1_ANIM_BOOSTER_VERT;
    s->variant = 0;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void CreateEntity_Booster_Steep(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOOSTER_STEEP_COUNTER_CLOCKWISE);
    s->graphics.anim = SA1_ANIM_BOOSTER_STEEP_COUNTER_CLOCKWISE;
    s->variant = 0;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void CreateEntity_Booster_Steep2(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Booster, sizeof(Booster), 0x2000, 0, TaskDestructor_Booster);
    Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;

    booster->base.regionX = regionX;
    booster->base.regionY = regionY;
    booster->base.me = me;
    booster->base.meX = me->x;
    booster->base.id = id;

    booster->unk3C = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOOSTER_STEEP_CLOCKWISE);
    s->graphics.anim = SA1_ANIM_BOOSTER_STEEP_CLOCKWISE;
    s->variant = 0;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (booster->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }
}

void Task_Booster(void)
{
    CamCoord worldX, worldY;
    Sprite *s;
    MapEntity *me;
    Booster *booster;
    s32 i;

    booster = TASK_DATA(gCurTask);
    s = &booster->s;
    me = booster->base.me;

    worldX = TO_WORLD_POS(booster->base.meX, booster->base.regionX);
    worldY = TO_WORLD_POS(me->y, booster->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), (1 - PLAYER(i).spriteOffsetY), +(PLAYER(i).spriteOffsetX + 5),
                          (PLAYER(i).spriteOffsetY - 1) };

            if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(PLAYER(i).qWorldX), I(PLAYER(i).qWorldY), (*((Rect8 *)&arr)))) {
                if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                    m4aSongNumStart(SE_BOOSTER);

                    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                        if (PLAYER(i).charState == CHARSTATE_BRAKE) {
                            PLAYER(i).charState = CHARSTATE_WALK_A;
                        }

                        if ((PLAYER(i).charState != CHARSTATE_SPINATTACK) && (PLAYER(i).charState != CHARSTATE_SPINDASH)
                            && (PLAYER(i).charState != CHARSTATE_7)) {
                            PLAYER(i).charState = CHARSTATE_WALK_A;
                        }
                        PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                        if (PLAYER(i).qSpeedGround > -Q(9)) {
                            PLAYER(i).qSpeedGround = -Q(12);
                            PLAYER(i).qSpeedAirX = -Q(12);
                        }

                        PLAYER(i).SA2_LABEL(unk62) = 0;
                    } else {
                        if (PLAYER(i).charState == CHARSTATE_BRAKE) {
                            PLAYER(i).charState = CHARSTATE_WALK_A;
                        }

                        if ((PLAYER(i).charState != CHARSTATE_SPINATTACK) && (PLAYER(i).charState != CHARSTATE_SPINDASH)
                            && (PLAYER(i).charState != CHARSTATE_7)) {
                            PLAYER(i).charState = CHARSTATE_WALK_A;
                        }

                        PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;

                        if (PLAYER(i).qSpeedGround < +Q(9)) {
                            PLAYER(i).qSpeedGround = +Q(12);
                            PLAYER(i).qSpeedAirX = +Q(12);
                        }

                        PLAYER(i).SA2_LABEL(unk62) = 0;
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, booster->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_Booster(Task *t)
{
    Booster *booster = TASK_DATA(t);
    VramFree(booster->s.graphics.dest);
}
