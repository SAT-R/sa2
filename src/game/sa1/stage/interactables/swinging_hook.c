#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h" // gPlayerControls
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s1;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ Sprite s3;
    /* 0x9C */ SpriteTransform transform;
    /* 0xA8 */ s32 qUnkA8;
    /* 0xAC */ s32 qUnkAC;
    /* 0xB0 */ u8 unkB0[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0xB2 */ u16 unkB2;
    /* 0xB4 */ u8 unkB4;
} SwingingHook;

void Task_SwingingHook(void);
void TaskDestructor_SwingingHook(Task *t);

void CreateEntity_SwingingHook(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_SwingingHook, sizeof(SwingingHook), 0x2000, 0, TaskDestructor_SwingingHook);
    SwingingHook *hook = TASK_DATA(t);
    Sprite *s1 = &hook->s1;
    Sprite *s2 = &hook->s2;
    Sprite *s3 = &hook->s3;
    SpriteTransform *tf = &hook->transform;
    CamCoord worldX, worldY;

    hook->base.regionX = regionX;
    hook->base.regionY = regionY;
    hook->base.me = me;
    hook->base.meX = me->x;
    hook->base.id = id;

    hook->unkB4 = 0;
    hook->qUnkA8 = 0;
    hook->qUnkAC = 0;
    hook->unkB0[0] = 0;
    hook->unkB0[1] = 0;

    if (me->d.sData[0] != 0) {
        hook->unkB2 = 0x100;
    } else {
        hook->unkB2 = 0;
    }

    {
        s1->x = TO_WORLD_POS(me->x, regionX) - gCamera.x;
        s1->y = TO_WORLD_POS(me->y, regionY) - gCamera.y;

        SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);

        s1->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_HOOK_RAIL_2, 1);
        s1->oamFlags = SPRITE_OAM_ORDER(18);
        s1->graphics.size = 0;
        s1->graphics.anim = SA1_ANIM_HOOK_RAIL_2;
        s1->variant = 1;
        s1->animCursor = 0;
        s1->qAnimDelay = Q(0);
        s1->prevVariant = -1;
        s1->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s1->palId = 0;
        s1->hitboxes[0].index = HITBOX_STATE_INACTIVE;

        if (me->d.sData[0]) {
            s1->frameFlags = SPRITE_FLAG(PRIORITY, gOamMatrixIndex++) | SPRITE_FLAG_ENABLE_ROTATION(30);
        } else {
            s1->frameFlags = SPRITE_FLAG(PRIORITY, gOamMatrixIndex++) | SPRITE_FLAG_ENABLE_ROTATION(31);
        }
    }

    {
        s3->x = TO_WORLD_POS(me->x, regionX) - gCamera.x;
        s3->y = TO_WORLD_POS(me->y, regionY) - gCamera.y - 8;

        s3->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_ANCHOR_HANDLES, 2);
        s3->oamFlags = SPRITE_OAM_ORDER(18);
        s3->graphics.size = 0;
        s3->graphics.anim = SA1_ANIM_ANCHOR_HANDLES;
        s3->variant = 2;
        s3->animCursor = 0;
        s3->qAnimDelay = Q(0);
        s3->prevVariant = -1;
        s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s3->palId = 0;
        s3->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    {
        s2->x = TO_WORLD_POS(me->x, regionX) - gCamera.x;
        s2->y = TO_WORLD_POS(me->y, regionY) - gCamera.y;

        s2->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_ANCHOR_HANDLES, 1);
        s2->oamFlags = SPRITE_OAM_ORDER(18);
        s2->graphics.size = 0;
        s2->graphics.anim = SA1_ANIM_ANCHOR_HANDLES;
        s2->variant = 1;
        s2->animCursor = 0;
        s2->qAnimDelay = Q(0);
        s2->prevVariant = -1;
        s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s2->palId = 0;
        s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    worldX = TO_WORLD_POS(hook->base.meX, hook->base.regionX);
    worldY = TO_WORLD_POS(me->y, hook->base.regionY);

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;

    UpdateSpriteAnimation(s3);
    UpdateSpriteAnimation(s2);
}

// (93.44%) https://decomp.me/scratch/7o7Wd
NONMATCH("asm/non_matching/game/sa1/stage/interactables/hook__Task_SwingingHook.inc", void Task_SwingingHook(void))
{
    SpriteTransform *tf;
    CamCoord worldX, worldY;
    SwingingHook *hook;
    Sprite *s1;
    Sprite *s2;
    Sprite *s3;
    s32 sp18;
    s32 sp1C;
    u32 modRes;
    s32 sinVal;
    MapEntity *me;
    CamCoord worldX2, worldY2;
    s32 cosVal;
    s32 i;
    s8 r2;

    hook = TASK_DATA(gCurTask);
    s1 = &hook->s1;
    tf = &hook->transform;
    s2 = &hook->s2;
    s3 = &hook->s3;
    me = hook->base.me;

    sp18 = 0;
    sp1C = 0;

    worldX = TO_WORLD_POS(hook->base.meX, hook->base.regionX);
    worldY = TO_WORLD_POS(me->y, hook->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    modRes = Mod(Div(gStageTime * 8, 3) + hook->unkB2, Q(2));

    if (modRes > Q(1)) {
        modRes -= Q(1);
        modRes = Q(1) - modRes;

        r2 = +(SIN(modRes * 2) >> 8);
    } else {
        // _080879FC
        r2 = -(SIN(modRes * 2) >> 8);
    }
    // _08087A10

    modRes = SIN(((modRes - 0x7E) & 0x1FF) * 2) >> 7;
    modRes &= 0x1FF;

    if (modRes < Q(1)) {
        modRes >>= 1;
    } else {
        modRes = (Q(2) - ((Q(2) - modRes) >> 1));
    }
    // _08087A3E

    modRes <<= 1;

    sinVal = (SIN(modRes & ONE_CYCLE) + r2);
    cosVal = (COS(modRes & ONE_CYCLE) + r2);

    s1->x = worldX - gCamera.x;
    s1->y = worldY - gCamera.y;

    s3->x = worldX - gCamera.x;
    s3->y = worldY - gCamera.y - 8;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s1->x, s1->y)) {
        // _08087B00
        i = 0;
        do {
            // _08087B14_loop

            if (PLAYER_I_ON_SPRITE(i, s1)) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).stoodObj = NULL;
                PLAYER(i).qSpeedAirX = Q(0);
                PLAYER(i).qSpeedGround = Q(0);
                PLAYER(i).qSpeedAirY = Q(0);

                if (PLAYER(i).character != CHARACTER_AMY) {
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                } else {
                    // _08087C5C
                    PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).charState = CHARSTATE_85;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                }
            }
        } while (++i < gNumSingleplayerCharacters);
        // _08087CC0

        SET_MAP_ENTITY_NOT_INITIALIZED(me, hook->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        // _08087CE4
        DisplaySprite(s3);

        {
            u8 i;
            for (i = 0; i < 3; i++) {
                // _08087CF6_loop
                sp18 += Div(sinVal * 90, 100);
                sp1C += Div(cosVal * 90, 100);

                s2->x = worldX - gCamera.x + (sp18 >> 10);
                s2->y = worldY - gCamera.y + (sp1C >> 10);

                if (i == 4) {
                    // TODO: Unreachable?
                    s2->oamFlags = SPRITE_OAM_ORDER(3);
                } else {
                    s2->oamFlags = SPRITE_OAM_ORDER(18);
                }

                DisplaySprite(s2);
            }
        }
        // _08087D48 + 0x14

        sp18 += Div(sinVal * 110, 100);
        sp1C += Div(cosVal * 110, 100);

        i = 0;
        do {
            // _08087D88_loop
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (GetBit(hook->unkB4, i)) {
                    // _08087DB2
                    PLAYER(i).qWorldX = Q(worldX + Div(sp18, 780) - 4);
                    // _08087DD0
                    if (PLAYER(i).moveState & MOVESTATE_FACING_LEFT) {
                        PLAYER(i).qWorldX += Q(10);
                    }
                    // _08087E00

                    PLAYER(i).qWorldY = Q(worldY + Div(sp1C, 680) + 2);
                    PLAYER(i).rotation = 0;
                    // _08087E2A

                    if (PLAYER(i).frameInput & gPlayerControls.jump) {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                        PLAYER(i).moveState |= MOVESTATE_100;
                        PLAYER(i).qSpeedAirY = -Q(5);
                        PLAYER(i).stoodObj = NULL;
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        // _08087EEA

                        PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

                        if (PLAYER(i).heldInput & (DPAD_LEFT | DPAD_RIGHT)) {
                            // _08087F1E
                            if (PLAYER(i).heldInput & DPAD_LEFT) {
                                PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                                PLAYER(i).qSpeedAirX = -Q(2);
                                PLAYER(i).qSpeedGround = -Q(2);
                            } else {
                                // _08087F70
                                PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                                PLAYER(i).qSpeedAirX = +Q(2);
                                PLAYER(i).qSpeedGround = +Q(2);
                            }
                        } else {
                            // _08087FB0
                            PLAYER(i).qSpeedAirX = Q(0);
                            PLAYER(i).qSpeedGround = Q(0);
                        }
                        // _08087FC8

                        if (PLAYER(i).character != CHARACTER_AMY) {
                            // _08087FEA
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                        } else {
                            // _08088048
                            // PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).charState = CHARSTATE_85;
                            PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                        }
                        // _08088084

                        hook->unkB0[i] = 20;
                        ClearBit(hook->unkB4, i);
                    } else {
                        // !(PLAYER(i).frameInput & gPlayerControls.jump)
                        PLAYER(i).qSpeedAirY = Q(0);
                    }
                } else {
                    // !GetBit(hook->unkB4, i)
                    // _080880B2
                    if (hook->unkB0[i]) {
                        hook->unkB0[i]--;
                    } else {
                        // _080880C4

                        if ((worldX + Div(sp18, 950) - 16 <= I(PLAYER(i).qWorldX)) && (worldX + Div(sp18, 950) + 16 >= I(PLAYER(i).qWorldX))
                            && (worldY + Div(sp1C, 950) - 16 <= I(PLAYER(i).qWorldY))
                            && (worldY + Div(sp1C, 950) + 16 >= I(PLAYER(i).qWorldY))) {
                            // _08088176
                            SetBit(hook->unkB4, i);
                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                            PLAYER(i).stoodObj = s1;
                            PLAYER(i).moveState |= MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                            PLAYER(i).qSpeedAirX = Q(0);
                            PLAYER(i).qSpeedGround = Q(0);
                            PLAYER(i).qSpeedAirY = Q(0);
                            // _080881F8

                            PLAYER(i).charState = CHARSTATE_38;
                            PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                            // _08088230
                        } else {
                        }
                    }
                }
            } else if (GetBit(hook->unkB4, i)) {
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                hook->unkB0[i] = 20;
                ClearBit(hook->unkB4, i);
                PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            }
        } while (++i < gNumSingleplayerCharacters);
        // _080882A4

        tf->rotation = 0x3FF & ~(0x3FF & modRes);
        tf->qScaleX = Q(1);
        tf->qScaleY = Q(1);
        tf->x = worldX - gCamera.x + (sp18 >> 10);
        tf->y = worldY - gCamera.y + (sp1C >> 10);

        if (me->d.sData[0]) {
            s1->frameFlags = SPRITE_FLAG(PRIORITY, gOamMatrixIndex++) | SPRITE_FLAG_ENABLE_ROTATION(30);
        } else {
            s1->frameFlags = SPRITE_FLAG(PRIORITY, gOamMatrixIndex++) | SPRITE_FLAG_ENABLE_ROTATION(31);
        }

#ifndef BUG_FIX
        // BUG: UpdateSpriteAnimation() sets s1->dimensions,
        //      so it has to be called first,
        //      otherwise it's a nullpointer on the first call.
        TransformSprite(s1, tf);
        UpdateSpriteAnimation(s1);
#else
        UpdateSpriteAnimation(s1);
        TransformSprite(s1, tf);
#endif

        // TODO: Do we need to call this twice?
        //       I don't think the Hook needs to be flipped?
        DisplaySprite(s1);
        s1->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        DisplaySprite(s1);
        s1->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
    }
}
END_NONMATCH

void TaskDestructor_SwingingHook(Task *t)
{
    SwingingHook *hook = TASK_DATA(t);
    VramFree(hook->s1.graphics.dest);
    VramFree(hook->s2.graphics.dest);
    VramFree(hook->s3.graphics.dest);
}
