#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/mp_finish.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/parameters/characters.h"
#include "game/shared/stage/player.h"
#include "game/sa1/ui/stage_results.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ s8 unk3E;
} StageGoal;

void Task_StageGoal(void);
void Task_StageGoal2(void);
void Task_StageGoal3(void);
void Task_StageGoal4(void);
void Task_StageGoal5(void);
void Task_StageGoal6(void);
void Task_ShowResults(void);
void TaskDestructor_EntityShared(struct Task *t);

void CreateEntity_StageGoal(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if (me->d.sData[1] == 0) {
        if (IS_SINGLE_PLAYER) {
            return;
        }
    } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
        if (IS_MULTI_PLAYER) {
            return;
        }
    }

    {
        struct Task *t = TaskCreate(Task_StageGoal, sizeof(StageGoal), 0x2000, 0, TaskDestructor_EntityShared);
        StageGoal *goal = TASK_DATA(t);
        Sprite *s = &goal->shared.s;

        goal->shared.base.regionX = regionX;
        goal->shared.base.regionY = regionY;
        goal->shared.base.me = me;
        goal->shared.base.meX = me->x;
        goal->shared.base.id = id;

        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_GOAL);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_GOAL;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        UpdateSpriteAnimation(s);
    }
}

// (91.49%) https://decomp.me/scratch/VAW5A
NONMATCH("asm/non_matching/game/sa1/stage/interactables/stage_goal__Task_StageGoal.inc", void Task_StageGoal(void))
{
    StageGoal *goal;
    Sprite *s;
#ifndef BUG_FIX
    MultiplayerPlayer *mpp;
#else
    // NOTE: This is moreso to increase debugability, rather than a "fix".
    MultiplayerPlayer *mpp = NULL;
#endif
    CamCoord worldX, worldY;
    MapEntity *me;
    u8 i;

    if (IS_MULTI_PLAYER) {
        mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    }

    goal = TASK_DATA(gCurTask);
    s = &goal->shared.s;
    me = goal->shared.base.me;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
        bool32 sp08 = TRUE;

        if (I(gPlayer.qWorldX) > worldX) {
            // _0801F336

            if ((gCurrentLevel != LEVEL_INDEX(ZONE_4, ACT_2)) || I(gPlayer.qWorldY) <= worldY - DISPLAY_CENTER_Y) {
                // _0801F34C
                if (IS_MULTI_PLAYER) {
                    if ((gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) && (I(gPlayer.qWorldY) < worldY)) {
                        goto _0801F3D2;
                    } else {
                        goto _0801F3C4;
                    }
                } else {
                    // _0801F380
                    // TODO: Use RECT_COLLISION macro?
                    if ((gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1))
                        || (RECT_LEFT(I(gPlayer.qWorldX), &gPlayer.spriteInfoBody->s.hitboxes[0].b) > worldX)
                        || (RECT_RIGHT(I(gPlayer.qWorldX), &gPlayer.spriteInfoBody->s.hitboxes[0].b) < worldX)
                        || (RECT_TOP(I(gPlayer.qWorldY), &gPlayer.spriteInfoBody->s.hitboxes[0].b) > worldY)
                        || (RECT_BOTTOM(I(gPlayer.qWorldY), &gPlayer.spriteInfoBody->s.hitboxes[0].b) < worldY)) {
                    _0801F3C4:
                        if ((gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) || (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))) {
#if 1
                            goto _0801F4B8;
#else
                            gCamera.maxX = gRefCollision->pxWidth;
                            mpp->unk5C &= ~0x1;
#endif
                        }
                    }
                }
            }
        _0801F3D2:
            mpp->unk5C |= 0x1;
            gCamera.maxX = worldX + DISPLAY_CENTER_X;

            i = 0;
            if (gMultiplayerPlayerTasks[i] != NULL) {
                for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i] != NULL; i++) {
                    MultiplayerPlayer *mpp; // TODO: Extra decl. might not be necessary?
                    if (i != SIO_MULTI_CNT->id) {
                        s32 r2, r3;
                        mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                        r2 = (gMultiplayerConnections & (0x10 << i)) >> (i + 4);
                        r3 = (gMultiplayerConnections & (0x10 << SIO_MULTI_CNT->id)) >> (SIO_MULTI_CNT->id + 4);

                        if (r2 == r3) {
                            if (!(mpp->unk54 & 0x100)) {
                                sp08 = FALSE;
                            }
                        }
                    }
                    // _0801F44C: continue
                }
            }
            // _0801F460

            if (sp08) {
                if (gMultiplayerRanks[SIO_MULTI_CNT->id] != -1) {
                    // _0801F482
                    s->variant = 1;
                    gCurTask->main = Task_StageGoal3;
                    // goto _0801F606;
                    gCurTask->main();
                    return;
                } else {
                    goto _0801F5DA;
                }
                // _0801F5DA
            }
        } else {
        _0801F4B8:
            gCamera.maxX = gRefCollision->pxWidth;
            mpp->unk5C &= ~0x1;
        }
    } else if (I(gPlayer.qWorldX) > worldX) {
        // _0801F4D8 + 0x10
        // _0801F4E6
        if ((gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2) && (I(gPlayer.qWorldY) > worldY - DISPLAY_CENTER_Y))
            || (((IS_MULTI_PLAYER && (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1) && I(gPlayer.qWorldY) < worldY))
                 || (IS_SINGLE_PLAYER
                     && ((gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))
                         && ((RECT_LEFT(I(gPlayer.qWorldX), &gPlayer.spriteInfoBody->s.hitboxes[0].b) <= worldX)
                             && (RECT_RIGHT(I(gPlayer.qWorldX), &gPlayer.spriteInfoBody->s.hitboxes[0].b) >= worldX)
                             && (RECT_TOP(I(gPlayer.qWorldY), &gPlayer.spriteInfoBody->s.hitboxes[0].b) <= worldY)
                             && (RECT_BOTTOM(I(gPlayer.qWorldY), &gPlayer.spriteInfoBody->s.hitboxes[0].b) >= worldY))))))
            || !((gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) || (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)))) {
            if (IS_MULTI_PLAYER) {
                if (gMultiplayerRanks[SIO_MULTI_CNT->id] != -1) {
                    goto _30C;
                }
            } else {
                // _0801F5A4
                if (gMultiplayerRanks[0] != -1) {
                _30C:
                    s->variant = 1;
                    gCurTask->main = Task_StageGoal3;
                    gCurTask->main();
                    return;
                } else {
                    gStageFlags |= (FLAGS_UPDATE_BACKGROUND_PALETTES | FLAGS_UPDATE_SPRITE_PALETTES);
                }
            }

        _0801F5DA:
            if (gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) {
                // Don't play the goal SFX in Egg Rocket, because it's not the Goal Post.
                m4aSongNumStart(SE_GOAL);
            }
            // _0801F5EA

            goal->unk3C = 0;
            goal->unk3E = 0;

            s->variant = 1;
            gCurTask->main = Task_StageGoal2;
            gCurTask->main();
            return;
        }
    }
    // _0801F572

    {
        //_0801F620:
        if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, goal->shared.base.meX);
            TaskDestroy(gCurTask);
            return;
        } else if (me->d.sData[0] != 0) {
            DisplaySprite(s);
        }
    }
}
END_NONMATCH

void Task_StageGoal2(void)
{
    StageGoal *goal = TASK_DATA(gCurTask);
    Sprite *s = &goal->shared.s;
    MapEntity *me = goal->shared.base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_SINGLE_PLAYER) {
        // Singleplayer
        if (gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) {
            gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
            gPlayer.heldInput = DPAD_RIGHT;

            if (gCamera.shiftY > -56)
                gCamera.shiftY--;

            if (gPlayer.qSpeedGround > Q(PLAYER_POST_GOAL_RUN_SPEED))
                gPlayer.qSpeedGround = Q(PLAYER_POST_GOAL_RUN_SPEED);

        } else {
            gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
            m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
        }

        if ((gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) && (goal->unk3C > 30) && (goal->unk3E == 0)) {
            goal->unk3E = 1;
            TaskCreate(Task_ShowResults, 0, 0x2000, 0, NULL);
        }

        gMultiplayerRanks[0] = 0;

        if (goal->unk3C++ > 120) {
            if ((gPlayer.charState == CHARSTATE_28) || (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))) {
                TaskDestroy(gCurTask);

                CreateStageResults(gRingCount, gCourseTime);
                return;
            }
        }
    } else if (gGameMode == GAME_MODE_RACE) {
        // MP Race
        s32 count = 0;
        u32 i;
        struct Task **mppTasks = &gMultiplayerPlayerTasks[0];
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
        gPlayer.itemEffect &= ~(PLAYER_ITEM_EFFECT__CONFUSION);
        gPlayer.timerConfusion = count;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i]; i++) {
            MultiplayerPlayer *mppLoop = TASK_DATA(gMultiplayerPlayerTasks[i]);

            if (mppLoop->unk5C & 0x1) {
                ++count;
            }
        }

        CreateMultiplayerFinishResult(SIO_MULTI_CNT->id, count);
        mpp->unk5C |= 0x1;

        if (count == 0) {
            gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
            gCourseTime = TIME(1, 0);
        }

        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput = DPAD_RIGHT;

        {
            RoomEvent *roomEvent;
            roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;
        }

        gCurTask->main = Task_StageGoal4;

        gCamera.SA2_LABEL(unk50) |= 0x4;
        return;
    } else {
        // MP Other
        s32 r8 = 0;
        u32 i;
        s32 r2, r3;
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

        gPlayer.itemEffect &= ~(PLAYER_ITEM_EFFECT__CONFUSION);
        gPlayer.timerConfusion = r8;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i] != NULL; i++) {
            mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

            r2 = (gMultiplayerConnections & (0x10 << i)) >> (i + 4);
            r3 = (gMultiplayerConnections & (0x10 << SIO_MULTI_CNT->id)) >> (SIO_MULTI_CNT->id + 4);

            if (r2 != r3) {
                if (gMultiplayerRanks[i] == 0) {
                    r8 = 1;
                    break;
                }
            }
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            struct Task *t = gMultiplayerPlayerTasks[i];
            if (t == NULL)
                break;

            if (gMultiplayerRanks[i] == -1) {
                mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                r2 = (gMultiplayerConnections & (0x10 << i)) >> (i + 4);
                r3 = (gMultiplayerConnections & (0x10 << SIO_MULTI_CNT->id)) >> (SIO_MULTI_CNT->id + 4);

                if (r2 == r3) {
                    CreateMultiplayerFinishResult(i, r8);
                } else {
                    CreateMultiplayerFinishResult(i, (r8 ^ 0x1));
                }
            }
        }

        gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
        gCourseTime = TIME(1, 0);

        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput = DPAD_RIGHT;

        {
            RoomEvent *roomEvent;
            roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;
        }

        gCurTask->main = Task_StageGoal4;

        gCamera.SA2_LABEL(unk50) |= 0x4;
        return;
    }

    if (me->d.sData[0] != 0) {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_StageGoal3(void)
{
    StageGoal *goal = TASK_DATA(gCurTask);
    Sprite *s = &goal->shared.s;
    MapEntity *me = goal->shared.base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (me->d.sData[0] != 0) {
        if (IS_MULTI_PLAYER && ((worldX + 32) <= I(gPlayer.qWorldX))) {
            s->variant = 2;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

// TODO: Fake-match
void Task_StageGoal4(void)
{
    s32 sioId;
    StageGoal *goal;
    s32 sp04;
    s8 sp08;
    Sprite *s;
    MapEntity *me;
    CamCoord worldX, worldY;
    s16 r4;
    s32 r6;
    u32 i;

    sioId = SIO_MULTI_CNT->id;
    sp04 = 0;
    goal = TASK_DATA(gCurTask);
    s = &goal->shared.s;
    me = goal->shared.base.me;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (gMultiplayerRanks[sioId] == -1) {
        return;
    }

    r6 = gMultiplayerRanks[sioId];

    if (gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
        s32 count = 0;
        u32 i;
        s32 r2, r3;
        struct Task **mppTasks;
        MultiplayerPlayer *mpp;
        mppTasks = &gMultiplayerPlayerTasks[0];

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i] && i != sioId; i++) {
            mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

            r2 = (gMultiplayerConnections & (0x10 << i)) >> (i + 4);
            r3 = (gMultiplayerConnections & (0x10 << SIO_MULTI_CNT->id)) >> (SIO_MULTI_CNT->id + 4);

            if (r2 == r3) {
                r6++;
            }
        }
    }

    r4 = (r6 + 1) * 32;

    if (me->d.sData[0] != 0) {
        if (worldX + 32 <= I(gPlayer.qWorldX)) {
            s->variant = 2;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (gPlayer.qSpeedAirX > Q(0)) {
        MultiplayerPlayer *mpp;
        s32 zero;
        gPlayer.heldInput = DPAD_RIGHT;

        if (worldX + r4 < I(gPlayer.qWorldX)) {
            gPlayer.qWorldX = Q(worldX + r4);
            Player_TransitionCancelFlyingAndBoost(&gPlayer);

            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState &= ~MOVESTATE_20;
            gPlayer.moveState &= ~MOVESTATE_SPIN_ATTACK;
            gPlayer.moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            gPlayer.moveState &= ~MOVESTATE_SPINDASH;
            gPlayer.moveState &= ~MOVESTATE_100;

            gPlayer.charState = CHARSTATE_HIT_AIR;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

#ifndef NON_MATCHING
            asm("mov %0, #0" : "=r"(zero) : "r"(&gPlayer.SA2_LABEL(unk61)));
#else
            zero = 0;
#endif
            gPlayer.SA2_LABEL(unk61) = zero;
            gPlayer.SA2_LABEL(unk62) = gPlayer.SA2_LABEL(unk61);

            gPlayer.qSpeedGround = zero;
            gPlayer.qSpeedAirX = zero;

            gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
            gPlayer.heldInput = zero;
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;

            gPlayer.charState = CHARSTATE_ACT_CLEAR_B;
            gPlayer.moveState |= MOVESTATE_800000;

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[i]; i++) {
                struct Task *t = gMultiplayerPlayerTasks[i];
                if (t == NULL)
                    break;

                mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                if (mpp->unk54 & 0x100) {
                    sp04++;
                }
            }

            if (sp04 >= (i - 1) || gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
                u32 j;
                for (j = 0; j < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[j]; j++) {
                    struct Task *t = gMultiplayerPlayerTasks[j];
                    if (t == NULL)
                        break;

                    mpp = TASK_DATA(gMultiplayerPlayerTasks[j]);

                    if (!(mpp->unk5C & 0x1) && (gGameMode != GAME_MODE_MULTI_PLAYER) && (gGameMode != GAME_MODE_TEAM_PLAY)) {
                        CreateMultiplayerFinishResult(j, i - 1);
                        mpp->unk5C |= 0x1;

                        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                        gPlayer.heldInput = 0;
                    }
                }

                goal->unk3C = 0;
                gCurTask->main = Task_StageGoal6;
                CreateMultiplayerFinishTransition();
            } else {
                gCurTask->main = Task_StageGoal5;
            }
        }
    } else {
        gPlayer.heldInput = DPAD_LEFT;

        if (worldX + r4 > I(gPlayer.qWorldX)) {
            gPlayer.heldInput = DPAD_RIGHT;
        }
    }
}

void Task_StageGoal5(void)
{
    StageGoal *goal = TASK_DATA(gCurTask);
    Sprite *s = &goal->shared.s;
    MapEntity *me = goal->shared.base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (me->d.sData[0] != 0) {
        DisplaySprite(s);
    }
}

void Task_StageGoal6(void)
{
    StageGoal *goal = TASK_DATA(gCurTask);
    Sprite *s = &goal->shared.s;
    MapEntity *me = goal->shared.base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(goal->shared.base.meX, goal->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, goal->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (me->d.sData[0] != 0) {
        if ((worldX + 32) <= I(gPlayer.qWorldX)) {
            s->variant = 2;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_ShowResults(void)
{
    if (!(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.qSpeedGround >= Q(2.25)) {
        SA2_LABEL(sub_8021BE0)(&gPlayer);
        gPlayer.charState = CHARSTATE_28;
        gPlayer.moveState |= MOVESTATE_800000;
        TaskDestroy(gCurTask);
        return;
    }
}