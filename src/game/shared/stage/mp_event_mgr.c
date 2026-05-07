#include "core.h"
#include "lib/m4a/m4a.h"

#include "game/globals.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/item_tasks.h"

#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/mp_finish.h"
#include "game/shared/stage/mp_player.h"

#if (GAME == GAME_SA1)
#include "game/sa1/stage/mp_unk_0.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/mp_attack_1_effect.h"
#include "constants/sa2/char_states.h"
#include "constants/sa2/songs.h"
#include "constants/sa2/zones.h"
#endif

typedef void (*RoomEventHandler)(union MultiSioData *recv, u8 i);

void ReceiveRoomEvent_ReachedStageGoal(union MultiSioData *recv, u8 i);
void ReceiveRoomEvent_ItemEffect(union MultiSioData *recv, u8 i);
#if (GAME == GAME_SA1)
void ReceiveRoomEvent_CollectChao(union MultiSioData *recv, u8 i);
#endif

// TODO: Improve names
#if (GAME == GAME_SA1)
#define MPEVTMGR_RECV_MASK 0x1000
#elif (GAME == GAME_SA2)
#define MPEVTMGR_RECV_MASK 0x5000
#endif

#if (GAME == GAME_SA1)
#define ITEM_EFFECT_ID_TELEPORT 4
#elif (GAME == GAME_SA2)
#define ITEM_EFFECT_ID_TELEPORT 1
#endif

const RoomEventHandler gRoomEventHandlers[] = {
    [ROOMEVENT_TYPE_PLATFORM_CHANGE - 1] = ReceiveRoomEvent_PlatformChange,
    [ROOMEVENT_TYPE_ITEMBOX_BREAK - 1] = ReceiveRoomEvent_ItemBoxBreak,
    [ROOMEVENT_TYPE_ENEMY_DESTROYED - 1] = ReceiveRoomEvent_EnemyDestroyed,
    [ROOMEVENT_TYPE_PLAYER_RING_LOSS - 1] = ReceiveRoomEvent_PlayerRingLoss,
    [ROOMEVENT_TYPE_MYSTERY_ITEMBOX_BREAK - 1] = ReceiveRoomEvent_MysteryItemBoxBreak,
    [ROOMEVENT_TYPE_ITEMEFFECT_APPLIED - 1] = ReceiveRoomEvent_ItemEffect,
#ifndef COLLECT_RINGS_ROM
    [ROOMEVENT_TYPE_REACHED_STAGE_GOAL - 1] = ReceiveRoomEvent_ReachedStageGoal,
    [ROOMEVENT_TYPE_8 - 1] = ReceiveRoomEvent_8,
#endif
#if (GAME == GAME_SA1)
    [ROOMEVENT_TYPE_CHAO_COLLECTED - 1] = ReceiveRoomEvent_CollectChao,
#endif
    NULL,
};

void Task_MultiplayerEventMgr_Send(void)
{
    u8 id = SIO_MULTI_CNT->id;
    struct MultiSioData_0_0 *send = &gMultiSioSend.pat0;
    u32 something = send->unk8[0] & (0x1000 << id);

    u8 i;

    for (i = 0; i < 4 && CONNECTION_REGISTERED(i); i++) {
        struct MultiSioData_0_0 *recv;
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
            return;
        } else {
            recv = &gMultiSioRecv[i].pat0;
            if (MPEVTMGR_RECV_MASK == recv->unk0 && (something == 0) != (!(recv->unk8[0] & (0x1000 << id)))) {
                return;
            }
        }
    }

    if (gRoomEventQueueWritePos == gRoomEventQueueSendPos) {
        DmaFill16(3, 0, &gMultiSioSend.pat0.unk8[3], sizeof(RoomEvent) - 1);
    } else {
        DmaCopy16(3, &gRoomEventQueue[gRoomEventQueueSendPos], &gMultiSioSend.pat0.unk8[3], sizeof(RoomEvent) - 1);
        gRoomEventQueueSendPos = (gRoomEventQueueSendPos + 1) & 0xF;
        send->unk8[0] ^= (0x1000 << id);
    }
}

void Task_MultiplayerEventMgr_Receive(void)
{
    u8 id = SIO_MULTI_CNT->id;
    struct MultiSioData_0_0 *send = &gMultiSioSend.pat0;

    u8 i;

    for (i = 0; i < 4; i++) {
        union MultiSioData *recv;
        if (i == id) {
            continue;
        }
        if (!CONNECTION_REGISTERED(i)) {
            break;
        }

        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
            continue;
        }

        recv = &gMultiSioRecv[i];
        if (recv->pat0.unk0 == MPEVTMGR_RECV_MASK && (recv->pat0.unk8[0] & (0x1000 << i)) != (send->unk8[0] & (0x1000 << i))) {
            if (recv->pat0.unkE > 0 && recv->pat0.unkE < ARRAY_COUNT(gRoomEventHandlers)) {
                gRoomEventHandlers[recv->pat0.unkE - 1](recv, i);
            }
            send->unk8[0] ^= (0x1000 << i);
        }
    }
}

void ReceiveRoomEvent_ItemEffect(union MultiSioData *recv, u8 i)
{
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
    MultiplayerPlayer *us = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

    if (!(us->unk5C & 1) && PLAYER_IS_ALIVE && gMultiplayerRanks[SIO_MULTI_CNT->id] == -1) {
        switch (recv->pat0.unkF) {
#ifndef COLLECT_RINGS_ROM
            case 0: {
                if (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id)) {
                    gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__CONFUSION;
                    gPlayer.timerConfusion = TIME(0, 10);
                    CreateItemTask_Confusion(gPlayer.character);
#if (GAME == GAME_SA2)
                    m4aSongNumStart(SE_ITEM_CONFUSION);
#endif
                }
                break;
            }
#if (GAME == GAME_SA1)
            case 1: {
                if (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id)) {
                    u8 rings = 0;
                    u8 i;

                    for (i = 0; (i < 4); i++) {
                        if (gMultiplayerPlayerTasks[i] == NULL) {
                            break;
                        }

                        rings += gMultiplayerCharRings[i];
                    }

                    if ((mpp->unk5C & 0x70000) || (us->unk5C & 0x70000) || (rings == 0)) {
                        sub_801C704();
                    }
                }

            } break;
#endif
            case ITEM_EFFECT_ID_TELEPORT: {
                if ((u8)recv->pat0.unk10 == SIO_MULTI_CNT->id && !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__TELEPORT)) {
#if (GAME == GAME_SA1)
                    u32 prevMoveState = gPlayer.moveState & (MOVESTATE_IGNORE_INPUT | MOVESTATE_IA_OVERRIDE);
#else
                    u32 prevMoveState = gPlayer.moveState & (MOVESTATE_IN_SCRIPTED | MOVESTATE_IGNORE_INPUT | MOVESTATE_IA_OVERRIDE);
#endif
                    if (!(prevMoveState)) {
                        InitializePlayer(&gPlayer);
                        gPlayer.qWorldX = QS(mpp->pos.x);
                        gPlayer.qWorldY = QS(mpp->pos.y - (s8)mpp->unk58[0]);
                        m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(1.0));
                        gPlayer.moveState = prevMoveState;
                        SPRITE_FLAG_CLEAR(&gPlayer.spriteInfoBody->s, PRIORITY);
                        SPRITE_FLAG_SET_VALUE(&gPlayer.spriteInfoBody->s, PRIORITY, 2);

                        SPRITE_FLAG_CLEAR(&gPlayer.spriteInfoLimbs->s, PRIORITY);
                        SPRITE_FLAG_SET_VALUE(&gPlayer.spriteInfoLimbs->s, PRIORITY, 2);

                        gCamera.SA2_LABEL(unk50) &= ~3;
                        gPlayer.layer = (mpp->unk54 >> 7) & 1;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk60 = 30;
                        gPlayer.timerInvulnerability = TIME(0, 2);
                        gCamera.x = (I(gPlayer.qWorldX) + gCamera.shiftX) - DISPLAY_CENTER_X;
                        gCamera.y = (I(gPlayer.qWorldY) + gCamera.shiftY) - DISPLAY_CENTER_Y;
#if (GAME == GAME_SA2)
                        m4aSongNumStart(SE_218);
#endif
                    }
                }
                break;
            }

            case 2: {
#if (GAME == GAME_SA2)
                if (!(gPlayer.moveState & MOVESTATE_IN_SCRIPTED) && (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id))) {
                    gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;

                    gPlayer.timerSpeedup = TIME(0, 10);
                    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
                    CreateItemTask_Confusion(gPlayer.character);
                    m4aSongNumStart(SE_ITEM_CONFUSION);
                    m4aMPlayTempoControl(&gMPlayInfo_BGM, 128);
                }
#endif
                break;
            }

#if (GAME == GAME_SA2)
            case 3: {
                if (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id)) {
                    gShouldSpawnMPAttackEffect = TRUE;
                    m4aSongNumStart(SE_219);
                }
                break;
            }
#endif
#if (GAME == GAME_SA1)
            case 5: {
                if (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id)) {
                    gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
                    gPlayer.timerSpeedup = TIME(0, 10);
                    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
                    CreateItemTask_Confusion(gPlayer.character);
                    m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(0.5));
                }
                break;
            }
            case 3: {
                gSpikesUnknownTimer = 30;
            } break;
#endif
#endif
#if (GAME == GAME_SA2)
            case 4: {
                if (!IS_TEAM_PLAY || !IS_SAME_TEAM(i, SIO_MULTI_CNT->id)) {
                    gShouldSpawnMPAttack2Effect = TRUE;
                    m4aSongNumStart(SE_216);
                }
                break;
            }
#endif
        }
    }
}

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA1)
// (96.15%) https://decomp.me/scratch/LMpNt
NONMATCH("asm/non_matching/game/shared/stage/evt_mgr__ReceiveRoomEvent_ReachedStageGoal_sa1.inc",
         void ReceiveRoomEvent_ReachedStageGoal(union MultiSioData *recv, u8 i))
#else
void ReceiveRoomEvent_ReachedStageGoal(union MultiSioData *recv, u8 i)
#endif
{
    u32 j;
    MultiplayerPlayer *mpp;

    s32 count2 = 0;
    s32 count3 = 0;
    s32 count = 0;
    bool8 somebool = FALSE;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

    for (j = 0; j < 4; j++) {
        // u32 id = SIO_MULTI_CNT->id;
        MultiplayerPlayer *mpp2;
        if (gMultiplayerPlayerTasks[j] == NULL) {
            break;
        }
        count++;
        mpp2 = TASK_DATA(gMultiplayerPlayerTasks[j]);
        if (!IS_TEAM_PLAY) {
#if (GAME == GAME_SA1)
            if (mpp2->unk5C & 1)
#else
            if (mpp2->unk5C & 1 && gMultiplayerRanks[j] != -1)
#endif
            {
                count2++;
                count3++;
            }
        } else {
            if (!IS_SAME_TEAM(j, SIO_MULTI_CNT->id) && gMultiplayerRanks[j] == 0) {
                count2 = 1;
            }
        }
    }

    if (gMultiplayerRanks[i] == -1) {
        CreateMultiplayerFinishResult(i, count2);
    } else {
        somebool = 1;
    }

    if (IS_TEAM_PLAY) {
        for (j = 0; j < 4 && gMultiplayerPlayerTasks[j] != NULL; j++) {
            if (j != i && gMultiplayerRanks[j] == -1 && IS_SAME_TEAM(j, i)) {
                CreateMultiplayerFinishResult(j, count2);
                if (j == SIO_MULTI_CNT->id) {
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
                    gPlayer.SA2_LABEL(unk61) = 0;
                    gPlayer.SA2_LABEL(unk62) = 0;
                    gPlayer.qSpeedGround = 0;
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                    gPlayer.heldInput = 0;
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
#if (GAME == GAME_SA1)
                    gPlayer.charState = CHARSTATE_ACT_CLEAR_B;
#elif (GAME == GAME_SA2)
                    gPlayer.charState = CHARSTATE_ACT_CLEAR_A;
#endif
                    gPlayer.moveState |= MOVESTATE_800000;
                }
            }
        }
    }

    mpp->unk5C |= 1;

    if (count2 == 0 && !(gStageFlags & 1)) {
        gStageFlags |= 4;
        gCourseTime = TIME(1, 0);
    };

    if ((count3 + 1) >= (u32)(count - 1) || IS_TEAM_PLAY) {
        for (j = 0; j < 4; j++) {
            MultiplayerPlayer *mpp2;

            if (gMultiplayerPlayerTasks[j] == NULL) {
                break;
            }

            mpp2 = TASK_DATA(gMultiplayerPlayerTasks[j]);
#if (GAME == GAME_SA1)
            if (j == i) {
                continue;
            }
#endif
            if (gMultiplayerRanks[j] == -1) {
                if (IS_TEAM_PLAY) {
                    CreateMultiplayerFinishResult(j, 1);
                } else {
                    u32 temp;
                    RoomEvent *roomEvent;
                    CreateMultiplayerFinishResult(j, count - 1);
#if (GAME == GAME_SA2)
                    mpp2->unk5C |= 1;
#endif
                    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                    gPlayer.heldInput = 0;

#if (GAME == GAME_SA2)
                    temp = gRoomEventQueueWritePos;
                    roomEvent = &gRoomEventQueue[temp];
                    gRoomEventQueueWritePos++;
                    gRoomEventQueueWritePos &= 0xF;

                    roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;
#endif
                }
            }
        }

        if (!somebool) {
            CreateMultiplayerFinishHandler();
        }
    }
}
#if (GAME == GAME_SA1)
END_NONMATCH
#endif
#endif

struct Task *CreateMultiplayerSendEventMgr(void)
{
    struct Task *t = TaskCreate(Task_MultiplayerEventMgr_Send, 0, -2, 0, NULL);
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));
    DmaFill32(3, 0, &gRoomEventQueue, sizeof(gRoomEventQueue));
    gRoomEventQueueWritePos = gRoomEventQueueSendPos = 0;
    return t;
}

struct Task *CreateMultiplayerReceiveEventMgr(void)
{
    struct Task *t = TaskCreate(Task_MultiplayerEventMgr_Receive, 0, 1, 0, NULL);
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));
    DmaFill32(3, 0, &gRoomEventQueue, sizeof(gRoomEventQueue));
    gRoomEventQueueSendPos = 0;
    gRoomEventQueueWritePos = 0;
    return t;
}
