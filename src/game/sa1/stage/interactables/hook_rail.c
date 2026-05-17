#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 qAcceleration;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 qStartX;
    /* 0x4C */ s32 qVelocity;
    /* 0x50 */ bool8 hitLowerRail;
} HookRail;

void Task_HookRail_Type0(void);
void Task_HookRail_Type1(void);
void Task_HookRail_Type0_2(void);
void Task_HookRail_Type1_2(void);
void Task_HookRail_Type2_0(void);
void Task_HookRail_Type2_1(void);
void Task_HookRail_Type2(void);
void Task_HookRail_Shared0(void);
void Task_HookRail_Shared1(void);
void TaskDestructor_HookRail(Task *t);

#define HOOK_PLAYER_OFFSET_X       (+6)
#define HOOK_PLAYER_OFFSET_T1_2_X  (+5)
#define HOOK_PLAYER_OFFSET_T2_0_X  (+4)
#define HOOK_PLAYER_OFFSET_Y       (+36)
#define HOOK_PLAYER_OFFSET_2_Y     (+38)
#define HOOK_RAIL_TYPES_1_2_LENGTH 480

void CreateEntity_HookRail(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    TaskMain taskFunc;
    Task *t;
    Sprite *s;
    HookRail *hookRail;

    if (me->d.sData[0] == 1) {
        t = TaskCreate(Task_HookRail_Type1, sizeof(HookRail), 0x2000, 0, TaskDestructor_HookRail);
    } else if (me->d.sData[0] == 2) {
        t = TaskCreate(Task_HookRail_Type2, sizeof(HookRail), 0x2000, 0, TaskDestructor_HookRail);
    } else {
        t = TaskCreate(Task_HookRail_Type0, sizeof(HookRail), 0x2000, 0, TaskDestructor_HookRail);
    }

    hookRail = TASK_DATA(t);
    s = &hookRail->s;

    hookRail->base.regionX = regionX;
    hookRail->base.regionY = regionY;
    hookRail->base.me = me;
    hookRail->base.meX = me->x;
    hookRail->base.id = id;

    hookRail->unk3C = 0;
    hookRail->qAcceleration = 0;
    hookRail->unk44 = 0;
#ifdef BUG_FIX
    hookRail->qStartX = 0;
#endif
    hookRail->qVelocity = 0;
    hookRail->hitLowerRail = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_4) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_HOOK_RAIL_3);
        s->graphics.anim = SA1_ANIM_HOOK_RAIL_3;
        s->variant = 0;
    } else {
        s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_HOOK_RAIL_2, 0);
        s->graphics.anim = SA1_ANIM_HOOK_RAIL_2;
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

void Task_HookRail_Type1(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (PLAYER_IS_ALIVE) {
        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) || (gPlayer.stoodObj == s)) {
            if (Coll_Player_Entity_Intersection(s, worldX, worldY, &gPlayer)) {
                Player_TransitionCancelFlyingAndBoost(&gPlayer);

                gPlayer.moveState = MOVESTATE_IA_OVERRIDE;
                gPlayer.qSpeedAirY = Q(0);
                gPlayer.charState = CHARSTATE_38;

                gPlayer.qWorldY = Q(worldY + HOOK_PLAYER_OFFSET_Y);
                gPlayer.qWorldX = Q(worldX - HOOK_PLAYER_OFFSET_X);

                hookRail->qAcceleration = ABS(gPlayer.qSpeedGround);

                if (hookRail->qAcceleration < Q(1)) {
                    hookRail->qAcceleration = Q(1);
                }
                hookRail->unk44 = 0;
                hookRail->qStartX = gPlayer.qWorldX;

                gPlayer.rotation = 0;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                m4aSongNumStart(SE_HOOK_RAIL);

                gCurTask->main = Task_HookRail_Type1_2;

                // NOTE(Jace): |= not needed for matching *here*, but I feel
                //             like they used a macro.
                gPlayer.moveState |= gPlayer.moveState | MOVESTATE_STOOD_ON_OBJ;
                gPlayer.stoodObj = s;

                // |= Needed for matching
                gPlayer.itemEffect |= gPlayer.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

// (95.41%) https://decomp.me/scratch/YaCLF
NONMATCH("asm/non_matching/game/sa1/stage/interactables/hook_rail__Task_HookRail_Type1_2.inc", void Task_HookRail_Type1_2(void))
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s32 qWorldX, qWorldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    if (PLAYER_IS_ALIVE) {
        // _080868D8

        if (gPlayer.charState != CHARSTATE_38) {
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.charState = CHARSTATE_38;
        }

        gPlayer.qSpeedAirY = 0;
        if (I(gPlayer.qWorldX - hookRail->qStartX) > HOOK_RAIL_TYPES_1_2_LENGTH) {
            s32 rotation;
            m4aSongNumStop(SE_HOOK_RAIL);
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.charState = CHARSTATE_WALK_A;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

            gCurTask->main = Task_HookRail_Shared0;

            gPlayer.qSpeedGround = hookRail->qAcceleration;

            gPlayer.qWorldY -= Q(10);
            gPlayer.rotation = 0;
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                gPlayer.stoodObj = NULL;
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } else {
            // _08086984
            hookRail->qAcceleration += Q(16. / 256.);
            hookRail->qVelocity += hookRail->qAcceleration;

            qWorldX = Q(worldX);
            qWorldX -= Q(HOOK_PLAYER_OFFSET_X);
            gPlayer.qWorldX = qWorldX + hookRail->qVelocity;
            qWorldY = (Q(worldY) + Q(HOOK_PLAYER_OFFSET_Y));
            gPlayer.qWorldY = qWorldY + (hookRail->qVelocity >> 1);
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.charState = CHARSTATE_38;
        }

        if (IS_MULTI_PLAYER) {
            struct MultiSioData_0_4 *sioData = &gMultiSioRecv[SIO_MULTI_CNT->id].pat4;
            s->x = (sioData->x - gCamera.x) + HOOK_PLAYER_OFFSET_T1_2_X;
            s->y = (sioData->y - gCamera.y) - HOOK_PLAYER_OFFSET_Y;
        } else {
            // _08086A0C
            s->x = I(gPlayer.qWorldX) - gCamera.x + HOOK_PLAYER_OFFSET_T1_2_X;
            s->y = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
        }

        screenX = I(gPlayer.qWorldX) - gCamera.x + HOOK_PLAYER_OFFSET_T1_2_X;
        screenY = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
    } else {
        // _08086A50
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }
        // _08086A68

        hookRail->qAcceleration += Q(16. / 256.);
        hookRail->qVelocity += hookRail->qAcceleration;

        s->x = (worldX + (I(hookRail->qVelocity))) - gCamera.x;
        s->y = (worldY + (I(hookRail->qVelocity) >> 1)) - gCamera.y;

        screenX = s->x;
        screenY = s->y;

        if (I(hookRail->qVelocity) > Q(1.875)) {
            m4aSongNumStop(SE_HOOK_RAIL);
            gCurTask->main = Task_HookRail_Shared0;

            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                gPlayer.stoodObj = NULL;
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        }
    }
    // _08086AD2

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}
END_NONMATCH

void Task_HookRail_Type0(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    screenX = s->x;
    screenY = s->y;

    if (PLAYER_IS_ALIVE) {
        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) || (gPlayer.stoodObj == s)) {
            if (Coll_Player_Entity_Intersection(s, worldX, worldY, &gPlayer)) {
                hookRail->qAcceleration = -ABS(gPlayer.qSpeedGround);
                hookRail->unk44 = 0;

                gPlayer.qWorldY = Q(worldY + HOOK_PLAYER_OFFSET_Y);
                gPlayer.qWorldX = Q(worldX);
                hookRail->qStartX = gPlayer.qWorldX;

                Player_TransitionCancelFlyingAndBoost(&gPlayer);

                gPlayer.moveState = MOVESTATE_IA_OVERRIDE;

                gPlayer.rotation = 0;
                gPlayer.qSpeedAirY = Q(0);
                gPlayer.charState = CHARSTATE_38;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                m4aSongNumStart(SE_HOOK_RAIL);

                gCurTask->main = Task_HookRail_Type0_2;

                // |= Needed for matching
                gPlayer.moveState |= gPlayer.moveState | MOVESTATE_STOOD_ON_OBJ;
                gPlayer.stoodObj = s;

                // |= Needed for matching
                gPlayer.itemEffect |= gPlayer.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

// (95.02%) https://decomp.me/scratch/YVBaR
NONMATCH("asm/non_matching/game/sa1/stage/interactables/hook_rail__Task_HookRail_Type0_2.inc", void Task_HookRail_Type0_2(void))
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    if (PLAYER_IS_ALIVE) {
        s32 qWorldX, qWorldY;
        if (gPlayer.charState != CHARSTATE_38) {
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.charState = CHARSTATE_38;
        }

        gPlayer.qSpeedAirY = 0;

        if (hookRail->hitLowerRail) {
            hookRail->qAcceleration += Q(20. / 256.);
            hookRail->qVelocity += hookRail->qAcceleration;

            qWorldX = Q(worldX);
            qWorldX -= Q(6);
            gPlayer.qWorldX = qWorldX + hookRail->qVelocity;
            qWorldY = Q(worldY + 276);
            qWorldY += (hookRail->qVelocity >> 1);
            gPlayer.qWorldY = qWorldY;
            s->y = worldY + I(hookRail->qVelocity >> 1) - gCamera.y + (240);

            if (I(hookRail->qVelocity) > 2) {
                m4aSongNumStop(SE_HOOK_RAIL);
                Player_TransitionCancelFlyingAndBoost(&gPlayer);
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                gPlayer.charState = CHARSTATE_WALK_A;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                gCurTask->main = Task_HookRail_Shared0;

                gPlayer.qSpeedGround = hookRail->qAcceleration;

                gPlayer.qWorldY -= Q(10);
                s->y = worldY + I(hookRail->qVelocity >> 1) - gCamera.y + 120;
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

                if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                    gPlayer.stoodObj = NULL;
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                }
            }
        } else {
            s32 qWorldX, qWorldY;
            hookRail->qAcceleration -= Q(9. / 256.);

            if (hookRail->qAcceleration < -Q(6)) {
                hookRail->qAcceleration = -Q(6);
            }

            hookRail->qVelocity += hookRail->qAcceleration;

            qWorldX = Q(worldX);
            qWorldX -= Q(6);
            qWorldX += hookRail->qVelocity;
            gPlayer.qWorldX = qWorldX;
            qWorldY = Q(worldY + 38);
            qWorldY -= (hookRail->qVelocity >> 1);
            gPlayer.qWorldY = qWorldY;
            s->y = worldY - I(hookRail->qVelocity >> 1) - gCamera.y;

            if (I(gPlayer.qWorldX - hookRail->qStartX) < -244) {
                hookRail->hitLowerRail = TRUE;
            }
        }

        if (IS_MULTI_PLAYER) {
            struct MultiSioData_0_4 *sioData = &gMultiSioRecv[SIO_MULTI_CNT->id].pat4;
            s->x = (sioData->x - gCamera.x) + HOOK_PLAYER_OFFSET_T1_2_X;
            s->y = (sioData->y - gCamera.y) - HOOK_PLAYER_OFFSET_Y;
        } else {
            s->x = I(gPlayer.qWorldX) - gCamera.x + HOOK_PLAYER_OFFSET_T1_2_X;
            s->y = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
        }

        screenX = I(gPlayer.qWorldX) - gCamera.x + HOOK_PLAYER_OFFSET_T1_2_X;
        screenY = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
    } else {
        if (hookRail->hitLowerRail) {
            hookRail->qAcceleration += Q(20. / 256.);
            hookRail->qVelocity += hookRail->qAcceleration;

            s->y = (worldY + (I(hookRail->qVelocity) >> 1)) - gCamera.y + 240;

            if (I(hookRail->qVelocity) > 2) {
                m4aSongNumStop(SE_HOOK_RAIL);
                gCurTask->main = Task_HookRail_Shared1;

                if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                    gPlayer.stoodObj = NULL;
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                }
            }

        } else {
            hookRail->qAcceleration -= Q(9. / 256.);

            if (hookRail->qAcceleration < -Q(6)) {
                hookRail->qAcceleration = -Q(6);
            }

            hookRail->qVelocity += hookRail->qAcceleration;

            if (I(Q(worldX) + hookRail->qVelocity - hookRail->qStartX) < -(244)) {
                hookRail->hitLowerRail = TRUE;
            }

            screenX = s->x;
            screenY = s->y;
            s->y = worldY - I(hookRail->qVelocity >> 1) - gCamera.y;
        }

        s->x = worldX + I(hookRail->qVelocity) - gCamera.x;

        screenX = s->x;
        screenY = s->y;
    }

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}
END_NONMATCH

void Task_HookRail_Shared0(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x + 480;
    s->y = worldY - gCamera.y + 240;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_HookRail_Shared1(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + 240;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_HookRail_Type2(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (PLAYER_IS_ALIVE) {
        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) || (gPlayer.stoodObj == s)) {
            if (Coll_Player_Entity_Intersection(s, worldX, worldY, &gPlayer)) {
                hookRail->qAcceleration = +ABS(gPlayer.qSpeedGround);
                hookRail->unk44 = 0;

                gPlayer.qWorldY = Q(worldY + HOOK_PLAYER_OFFSET_2_Y);
                gPlayer.qWorldX = Q(worldX);
                hookRail->qStartX = gPlayer.qWorldX;
                gPlayer.rotation = 0;

                Player_TransitionCancelFlyingAndBoost(&gPlayer);

                gPlayer.moveState = (MOVESTATE_IA_OVERRIDE | MOVESTATE_FACING_LEFT);
                gPlayer.qSpeedAirY = Q(0);
                gPlayer.charState = CHARSTATE_38;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                m4aSongNumStart(SE_HOOK_RAIL);

                gCurTask->main = Task_HookRail_Type2_0;

                // NOTE(Jace): |= not needed for matching *here*, but I feel
                //             like they used a macro.
                gPlayer.moveState |= gPlayer.moveState | MOVESTATE_STOOD_ON_OBJ;
                gPlayer.stoodObj = s;

                // |= Needed for matching
                gPlayer.itemEffect |= gPlayer.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_HookRail_Type2_0(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s32 qWorldX, qWorldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    if (PLAYER_IS_ALIVE) {
        if (gPlayer.charState != CHARSTATE_38) {
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.charState = CHARSTATE_38;
        }

        gPlayer.qSpeedAirY = 0;
        if (I(hookRail->qStartX - gPlayer.qWorldX) > HOOK_RAIL_TYPES_1_2_LENGTH) {
            s32 rotation;
            m4aSongNumStop(SE_HOOK_RAIL);
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_WALK_A;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

            gCurTask->main = Task_HookRail_Type2_1;

            gPlayer.qSpeedGround = -hookRail->qAcceleration;

            gPlayer.qWorldY -= Q(2);
            gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                gPlayer.stoodObj = NULL;
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } else {
            hookRail->qAcceleration += Q(16. / 256.);
            hookRail->qVelocity += hookRail->qAcceleration;

            qWorldX = Q(worldX + HOOK_PLAYER_OFFSET_X);
            gPlayer.qWorldX = qWorldX - hookRail->qVelocity;
            qWorldY = (Q(worldY) + Q(HOOK_PLAYER_OFFSET_2_Y));
            gPlayer.qWorldY = qWorldY + (hookRail->qVelocity >> 1);
            Player_TransitionCancelFlyingAndBoost(&gPlayer);
            gPlayer.charState = CHARSTATE_38;
        }

        if (IS_MULTI_PLAYER) {
            struct MultiSioData_0_4 *sioData = &gMultiSioRecv[SIO_MULTI_CNT->id].pat4;
            s->x = (sioData->x - gCamera.x) - HOOK_PLAYER_OFFSET_T2_0_X;
            s->y = (sioData->y - gCamera.y) - 36;
        } else {
            s->x = I(gPlayer.qWorldX) - gCamera.x - HOOK_PLAYER_OFFSET_T2_0_X;
            s->y = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
        }

        screenX = I(gPlayer.qWorldX) - gCamera.x - HOOK_PLAYER_OFFSET_T2_0_X;
        screenY = I(gPlayer.qWorldY) - gCamera.y - HOOK_PLAYER_OFFSET_Y;
    } else {
        hookRail->qAcceleration += Q(16. / 256.);
        hookRail->qVelocity += hookRail->qAcceleration;

        s->x = (worldX - (I(hookRail->qVelocity))) - gCamera.x;
        s->y = (worldY + (I(hookRail->qVelocity) >> 1)) - gCamera.y;

        screenX = s->x;
        screenY = s->y;

        if (I(hookRail->qStartX - (Q(worldX) - hookRail->qVelocity)) > 480) {
            m4aSongNumStop(SE_HOOK_RAIL);
            gCurTask->main = Task_HookRail_Type2_1;

            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                gPlayer.stoodObj = NULL;
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_HookRail_Type2_1(void)
{
    HookRail *hookRail = TASK_DATA(gCurTask);
    Sprite *s = &hookRail->s;
    MapEntity *me = hookRail->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;

    worldX = TO_WORLD_POS(hookRail->base.meX, hookRail->base.regionX);
    worldY = TO_WORLD_POS(hookRail->base.me->y, hookRail->base.regionY);

    s->x = worldX - gCamera.x - 480;
    s->y = worldY - gCamera.y + 240;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.stoodObj = NULL;
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hookRail->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void TaskDestructor_HookRail(Task *t)
{
    HookRail *hookRail = TASK_DATA(t);
    VramFree(hookRail->s.graphics.dest);
};