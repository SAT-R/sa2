#include "core.h"
#include "task.h"
#include "malloc_vram.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/spawn_positions.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiplayer/mp_player.h"
#include "game/stage/player.h"
#include "game/stage/item_tasks.h"

#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/multiplayer/mp_attack_1_effect.h"
#if (GAME == GAME_SA1)
#include "game/multiplayer/chao.h"
#include "constants/sa2_char_states.h"
#elif (GAME == GAME_SA2)
#include "game/multiplayer/mp_attack_2_effect.h"
#endif
#include "game/multiplayer/multipak_connection.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/move_states.h"
#include "constants/songs.h"

// TODO: Names
#if (GAME == GAME_SA1)
#define IS_SPECIFIC_TAILS_ANIM                                                                                                             \
    (s->graphics.anim != SA1_ANIM_CHAR(TAILS, 58) && s->graphics.anim != SA1_ANIM_CHAR(TAILS, 57)                                          \
     && s->graphics.anim != SA1_ANIM_CHAR(TAILS, 56))
#define IS_SPECIFIC_KNUCKLES_ANIM                                                                                                          \
    (s->graphics.anim != SA1_ANIM_CHAR(KNUCKLES, 62) && s->graphics.anim != SA1_ANIM_CHAR(KNUCKLES, 63)                                    \
     && s->graphics.anim != SA1_ANIM_CHAR(KNUCKLES, 64))
#elif (GAME == GAME_SA2)
#define IS_SPECIFIC_TAILS_ANIM                                                                                                             \
    (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_22, CHARACTER_TAILS)                                                                  \
     && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_TAILS)                                                               \
     && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_TAILS))
#define IS_SPECIFIC_KNUCKLES_ANIM                                                                                                          \
    (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_KNUCKLES)                                                               \
     && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_20, CHARACTER_KNUCKLES)                                                            \
     && s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_21, CHARACTER_KNUCKLES))
#endif

u32 unused_3005838 = 0;
bool8 gShouldSpawnMPAttack2Effect = FALSE;

void Task_CreateMultiplayerPlayer(void);
void TaskDestructor_MultiplayerPlayer(struct Task *);

void SA2_LABEL(sub_8016D20)(void);
void SA2_LABEL(sub_801707C)(void);
void SA2_LABEL(sub_8017670)(void);
void SA2_LABEL(sub_8017C28)(void);
void SA2_LABEL(sub_8017F34)(void);
void SA2_LABEL(sub_8018120)(void);
u32 SA2_LABEL(sub_80181E0)(void);
bool32 SA2_LABEL(sub_8018300)(void);
void LaunchPlayer(s16);

#if COLLECT_RINGS_ROM
// Can't be sure this was defined here, but it works as it
// may have something to do with the characters
const u16 gUnknown_02015B18[] = { 0x55, 0x59, 0x5D, 0x61 };
#endif

void CreateMultiplayerPlayer(u8 id)
{
    struct Task *t = TaskCreate(Task_CreateMultiplayerPlayer, sizeof(MultiplayerPlayer), 0x2000, 0, TaskDestructor_MultiplayerPlayer);
    MultiplayerPlayer *mpp = TASK_DATA(t);
    Sprite *s;
    SpriteTransform *tf;
    u16 *p;
    u32 pid;
    mpp->unk56 = id;
#if (GAME == GAME_SA1)
    mpp->unk54 = 0x0;
#elif (GAME == GAME_SA2)
    mpp->unk54 = 0x40;
#endif
    mpp->unk44 = 0;
    mpp->unk48 = 0;
    mpp->unk66 = 0;
    mpp->unk68 = 0;
    mpp->unk6A = 0;

    if (id != SIO_MULTI_CNT->id) {
        mpp->unk60 = 30;
    } else {
        mpp->unk60 = 0;
    }

    mpp->unk57 = 128;
    mpp->unk61 = 0;
    mpp->unk5C = 0;
    mpp->unk64 = mpp->unk56;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        mpp->unk5C |= 2;
    }

    mpp->pos.x = 0;
    mpp->pos.y = 0;

#if (GAME == GAME_SA1)
#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER || gGameMode == GAME_MODE_RACE || gGameMode == GAME_MODE_MULTI_PLAYER) {
        mpp->pos.x = gSpawnPositions[gCurrentLevel][0];
        mpp->pos.y = gSpawnPositions[gCurrentLevel][1];
    } else if (gGameMode == GAME_MODE_CHAO_HUNT) {
        u32 pid = SIO_MULTI_CNT->id;
        mpp->pos.x = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][pid][0];
        mpp->pos.y = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][pid][1];
    } else if (gGameMode == GAME_MODE_TEAM_PLAY) {
        pid = SIO_MULTI_CNT->id;
        if (gCurrentLevel == 16) {
            mpp->pos.x = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][SIO_MULTI_CNT->id][0];
            mpp->pos.y = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][SIO_MULTI_CNT->id][1];
        } else {
            u32 r4;
            u32 i;
            u32 outerBit = (gMultiplayerConnections & (0x10 << pid)) >> (pid + 4);

            r4 = 0;
            for (i = 0; i < pid; i++) {
                bool32 innerBit = (gMultiplayerConnections & (0x10 << i)) >> (i + 4);
                if (innerBit == outerBit) {
                    r4++;
                }
            }

            if (outerBit == 0) {
                r4 = -r4;
            }

            mpp->pos.x = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][outerBit][0] + r4 * 24;
            mpp->pos.y = gSpawnPositions_Modes_4_and_5[gCurrentLevel - NUM_LEVEL_IDS_SP][outerBit][1];
        }
    } else
#endif // COLLECT_RINGS_ROM
    {
        switch (SIO_MULTI_CNT->id) {
            case 0: {
                mpp->pos.x = 232;
                mpp->pos.y = 829;
                break;
            }
            case 1: {
                mpp->pos.x = 1585;
                mpp->pos.y = 926;
                break;
            }
            case 2: {
                mpp->pos.x = 232;
                mpp->pos.y = 348;
                break;
            }
            case 3: {
                mpp->pos.x = 1585;
                mpp->pos.y = 279;
                break;
            }
        }
    }
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (IS_SINGLE_PLAYER || gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY) {
        mpp->pos.x = gSpawnPositions[gCurrentLevel][0];
        mpp->pos.y = gSpawnPositions[gCurrentLevel][1];
    } else
#endif
    {
        switch (SIO_MULTI_CNT->id) {
            case 0: {
                mpp->pos.x = 232;
                mpp->pos.y = 829;
                break;
            }
            case 1: {
                mpp->pos.x = 1585;
                mpp->pos.y = 279;
                break;
            }
            case 2: {
                mpp->pos.x = 1585;
                mpp->pos.y = 926;
                break;
            }
            case 3: {
                mpp->pos.x = 232;
                mpp->pos.y = 348;
                break;
            }
        }
    }
#endif

    s = &mpp->s;
    tf = &mpp->transform;
#if (GAME == GAME_SA1)
    if (mpp->unk56 != SIO_MULTI_CNT->id) {
        s->graphics.dest = VramMalloc(64);
    } else {
        s->graphics.dest = (void *)OBJ_VRAM0;
    }
#endif
    s->oamFlags = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
#if (GAME == GAME_SA1)
    s->palId = 0;
#elif (GAME == GAME_SA2)
    s->palId = mpp->unk56;
#endif
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s->graphics.anim = 0;
    s->variant = 0;
    s->x = 0;
    s->y = 0;

    tf->qScaleY = 256;

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    s->graphics.anim = gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]];
#endif // COLLECT_RINGS_ROM

    if (mpp->unk56 != SIO_MULTI_CNT->id) {
        s->graphics.dest = VramMalloc(64);
        s->frameFlags |= SPRITE_FLAG_MASK_MOSAIC;
    } else {
        s->graphics.dest = (void *)OBJ_VRAM0;
    }

    UpdateSpriteAnimation(s);
#endif // (GAME == GAME_SA2)

    gMultiplayerPlayerTasks[mpp->unk56] = t;
}

#if (GAME == GAME_SA1)

// TODO: Match and merge the SA1 and SA2 versions.
// (89.44%) https://decomp.me/scratch/ldYoR
NONMATCH("asm/non_matching/game/multiplayer/sa1_mp_player__Task_CreateMultiplayerPlayer.inc", void Task_CreateMultiplayerPlayer())
{
    SpriteTransform *tf;
    MultiplayerPlayer *sp4;
    s32 sp8;
    MultiplayerPlayer *sp14;
    s32 temp_r4_2;
    s32 var_sl;
    struct Task **var_r5_2;
    u16 temp_r1;
    u16 temp_r1_3;
    u16 temp_r1_4;
    u16 var_r1_2;
    AnimId someAnim;
    u8 var_r1;
    s8 var_r3_2;
    u32 var_r4;
    u8 temp_r1_5;
    u8 temp_r2_6;
    u32 temp_r3_4;
    u8 temp_r4_4;
    union MultiSioData *send_recv;
    RoomEvent_Unknown *temp_r0_8;

    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    MultiplayerPlayer *temp_r5;

    tf = &mpp->transform;
    send_recv = &gMultiSioRecv[mpp->unk56];
    if (gMultiSioStatusFlags & (1 << mpp->unk56)) {
        mpp->unk61 = 0;
    }
    if ((gMultiSioStatusFlags & (1 << mpp->unk56)) && (send_recv->pat0.unk0 == 0x1000)) {
        mpp->unk61 = 0;
        mpp->unk44 = send_recv->pat4.x - mpp->pos.x;
        mpp->unk48 = send_recv->pat4.y - mpp->pos.y;
        mpp->pos.x = send_recv->pat4.x;
        mpp->pos.y = send_recv->pat4.y;

        if ((ABS(mpp->unk44) > 0x40) || (ABS(mpp->unk48) > 0x40)) {
            mpp->unk66 = 0;
            mpp->unk68 = 0;
        } else {
            mpp->unk66 = Q(mpp->unk44);
            mpp->unk68 = Q(mpp->unk48);
        }

        temp_r4_2 = ~mpp->unk57 & send_recv->pat4.unkA;
        if (temp_r4_2 & 2) {
            CreateItemTask_Invincibility(mpp->unk56);
        }
        if (1 & temp_r4_2) {
            CreateItemTask_Shield_Normal(mpp->unk56);
        }
        if (temp_r4_2 & 8) {
            CreateItemTask_Shield_Magnetic(mpp->unk56);
        }
        if (temp_r4_2 & 0x50) {
            CreateItemTask_Confusion(mpp->unk56);
        }

        mpp->unk57 = send_recv->pat4.unkA;
        mpp->unk54 = send_recv->pat0.unk8[0];
        if (SIO_MULTI_CNT->id != mpp->unk56) {
            mpp->unk64 = (u8)((u32)(0x600 & send_recv->pat0.unk8[0]) >> 9);
        } else {
            if (SIO_MULTI_CNT->id != mpp->unk64) {
                temp_r5 = TASK_DATA(gMultiplayerPlayerTasks[mpp->unk64]);
                if (SIO_MULTI_CNT->id == temp_r5->unk64) {
                    mpp->unk64 = (u8)SIO_MULTI_CNT->id;
                    gPlayer.moveState &= ~8;
                    gPlayer.moveState &= ~0x20;
                    gPlayer.moveState &= ~4;
                    gPlayer.moveState &= ~0x10;
                    gPlayer.moveState |= 2;
                    gPlayer.moveState &= ~0x400;
                    gPlayer.moveState &= ~0x100;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                    gPlayer.SA2_LABEL(unk61) = 0;
                    gPlayer.SA2_LABEL(unk62) = 0;
                    gPlayer.charState = 4;
                    gPlayer.timerInvulnerability = 60;
                    gPlayer.moveState &= 0xFFBFFFFF;
                    mpp->unk5C &= ~4;
                    if (temp_r5->unk5C & 4) {
                        gPlayer.moveState &= 0xFFBFFFFF;
                        temp_r5->unk5C &= ~4;
                    }
                }
            }
        }
        if (gGameMode == 6) {
            u16 unk6 = send_recv->pat1.unk6;
            temp_r3_4 = send_recv->pat5.filler3[0];
            gMultiplayerCharRings[mpp->unk56] = I(unk6);
            mpp->unk6A = (u16)temp_r3_4;
            if (mpp->unk56 == 3) {
                if (mpp->unk6A == 8) {
                    someAnim = 0x188;
                } else if (mpp->unk6A == 0x12) {
                    someAnim = 0x189;
                } else {
                    goto block_x;
                }
            } else {
            block_x:
                someAnim = gPlayerCharacterIdleAnims[mpp->unk56] + mpp->unk6A;
            }
        } else if ((gGameMode == 4) || (gGameMode == 5)) {
            sp8 = 0;
            someAnim = 0x3FF & send_recv->pat1.unk6;
            if (SIO_MULTI_CNT->id != mpp->unk56) {
                mpp->unk5C |= (send_recv->pat1.unk6 >> 0xC) << 0x10;
            }

            for (var_r1 = 0; var_r1 < 3; var_r1++) {
                if (mpp->unk5C & (0x10000 << var_r1)) {
                    sp8++;
                }
            }

            gMultiplayerCharRings[mpp->unk56] = sp8;
        } else {
            someAnim = send_recv->pat1.unk6;
        }
        temp_r4_4 = 7 & send_recv->pat4.unkB;
        if ((s->graphics.anim != someAnim) || (s->variant != temp_r4_4)) {
            s->hitboxes[0].index = -1;
            mpp->reserved.index = -1;
        }
        if (4 & mpp->unk54) {
            Player *p = &gPlayer;
            if (mpp->unk5C & 4) {
                p->moveState &= 0xFFBFFFFF;
                mpp->unk5C &= ~4;
            }
            if ((8 & p->moveState) && (p->stoodObj == s)) {
                p->moveState = (p->moveState & ~8) | 2;
            }
        }
        s->graphics.anim = someAnim;
        s->variant = temp_r4_4;
        mpp->unk58[0] = ((s8)send_recv->pat4.unkB >> 3);
        s->animSpeed = send_recv->pat4.unkC;
        tf->rotation = send_recv->pat4.unkD * 4;

    } else {
        mpp->pos.x += I(mpp->unk66);
        mpp->pos.y += I(mpp->unk68);

        if (mpp->unk61++ > 30) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            sa2__gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
#ifndef NON_MATCHING
            // NOTE: MultiPakCommunicationError() does NOT take any arguments, neither in SA1 nor the others.
            *(volatile u8 *)&gGameMode;
#endif
            MultiPakCommunicationError();
            return;
        }
    }

block_57:
    for (var_r3_2 = NUM_CHARACTERS - 1; var_r3_2 >= 0; var_r3_2--) {
        if ((s16)gPlayerCharacterIdleAnims[var_r3_2] <= mpp->s.graphics.anim) {
            break;
        }
    }

    s->x = mpp->pos.x - gCamera.x;
    s->y = mpp->pos.y - gCamera.y;
    tf->x = mpp->pos.x - gCamera.x;
    tf->y = mpp->pos.y - gCamera.y;
    if (0x800 & mpp->unk54) {
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        mpp->reserved.index = -1;
    }
    UpdateSpriteAnimation(&mpp->s);
    sp4 = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    if (((gGameMode == 3) || (gGameMode == 5)) && (sa2__gUnknown_030054B4[SIO_MULTI_CNT->id] == -1)) {
        var_sl = 1;
        for (var_r4 = 0; var_r4 < 4 && (gMultiplayerPlayerTasks[var_r4] != NULL); var_r4++) {
            u32 connection = gMultiplayerConnections;
            sp14 = TASK_DATA(gMultiplayerPlayerTasks[var_r4]);
            if ((((s32)((0x10 << var_r4) & connection) >> (var_r4 + 4))
                 == ((s32)((0x10 << SIO_MULTI_CNT->id) & connection) >> (SIO_MULTI_CNT->id + 4)))
                && !(0x100 & sp14->unk54)) {
                var_sl = 0;
            }
        }
        if (var_sl != 0) {
            RoomEvent_GoalReached *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;
        }
    }
    if (!(1 & gStageFlags) && !(4 & mpp->unk54) && !(0x80 & sp4->unk57)) {
        if (0x80 & gPlayer.itemEffect) {
            goto block_106;
        }
        if (!(0x80 & mpp->unk57) && !(sp4->unk5C & 1) && (gPlayer.timerInvulnerability == 0) && !(gPlayer.moveState & 0x80)) {
            if (gGameMode != 6) {
                temp_r1_5 = mpp->unk56;
                if (temp_r1_5 != SIO_MULTI_CNT->id) {
                    switch (gMultiplayerCharacters[mpp->unk56]) {

                        case CHARACTER_SONIC:
#if ((GAME == GAME_SA2) || (GAME == GAME_SA3))
                        case CHARACTER_CREAM:
#endif
                            SA2_LABEL(sub_8016D20)();
                            break;
                        case CHARACTER_TAILS:
                            SA2_LABEL(sub_801707C)();
                            break;
                        case CHARACTER_KNUCKLES:
                            SA2_LABEL(sub_8017670)();
                            break;
                        case CHARACTER_AMY:
                            SA2_LABEL(sub_8017C28)();
                            break;
                    }
                }
            } else if (mpp->unk56 != SIO_MULTI_CNT->id) {
                SA2_LABEL(sub_8018120)();
            }
        } else {
            goto block_101;
        }
    } else {
    block_101:
        if ((0x80 & gPlayer.itemEffect) || (0x80 & mpp->unk57) || (gPlayer.timerInvulnerability != 0) || (gPlayer.moveState & 0x80)
            || (sa2__gUnknown_030054B4[mpp->unk56] != -1)) {
        block_106:
            if (gGameMode != 6) {
                if (mpp->unk56 != SIO_MULTI_CNT->id) {
                    if (gMultiplayerCharacters[mpp->unk56] < 3) {
                        s8 count = 1;
                        if (gMultiplayerCharacters[mpp->unk56] >= count) {
                            if (4 & mpp->unk5C) {
                                mpp->unk5C &= ~4;
                                if (!(0x80 & gPlayer.itemEffect)) {
                                    gPlayer.moveState &= 0xFFBFFFFF;
                                }
                                temp_r0_8 = CreateRoomEvent();
                                temp_r0_8->type = ROOMEVENT_TYPE_8;
                                temp_r0_8->unk1 = mpp->unk56;
                                temp_r0_8->unk2 = 0;
                            }
                        }
                    }
                }
                if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
                    gPlayer.moveState = (gPlayer.moveState & ~8) | 2;
                    asm("");
                    mpp->unk60 = 0x1E;
                }
            } else if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
                gPlayer.moveState = (gPlayer.moveState & ~8) | 2;
                mpp->unk60 = 0x1E;
            }
        }
    }
    if (1 & mpp->unk54) {
        s->frameFlags &= ~0x1F;
        s->frameFlags |= (SA2_LABEL(gUnknown_030054B8)++ | 0x20);
        if (2 & mpp->unk54) {
            tf->qScaleX = -Q(1.0);
        } else {
            tf->qScaleX = +Q(1.0);
        }
        if (8 & mpp->unk54) {
            tf->qScaleX = -tf->qScaleX;
        }
        TransformSprite(&mpp->s, tf);
    } else {
        s->frameFlags &= ~0x20;
        if (2 & mpp->unk54) {
            s->frameFlags |= 0x400;
        } else {
            s->frameFlags &= ~0x400;
        }

        if (8 & mpp->unk54) {
            s->frameFlags |= 0x800;
        } else {
            s->frameFlags &= ~0x800;
        }
    }

    s->frameFlags &= 0xFFFFCFFF;
    s->frameFlags |= (((0x30 & mpp->unk54) >> 4) << SPRITE_FLAG_SHIFT_PRIORITY);

    if (0x40 & mpp->unk54) {
        return;
    }

    if ((gStageTime & 2) || (0x20 & mpp->unk57) || (((1 & mpp->unk5C) != 0)) || (sa2__gUnknown_030054B4[mpp->unk56] != -1)
        || ((mpp->unk60 == 0) && !(4 & mpp->unk54) && !(mpp->unk5C & 2))) {
        s->oamFlags = (mpp->unk54 & 0x80) ? 0x440 : 0x400;
        s->frameFlags &= ~0x180;

        if (0x20 & mpp->unk57) {
            s32 connection;
            u8 mode;
            if ((((gGameMode != 3) && (gGameMode != 5))
                 || (connection = gMultiplayerConnections,
                     (((0x10 << mpp->unk56) & connection) >> (mpp->unk56 + 4))
                         != ((s32)(connection & (0x10 << SIO_MULTI_CNT->id)) >> (SIO_MULTI_CNT->id + 4))))
                || (mode = gGameMode, (mode != 3) && (mode != 5))) {
                if (mpp->unk60 == 0) {
                    if (mpp->unk56 != SIO_MULTI_CNT->id) {
                        s->frameFlags |= 0x100;
                        gDispCnt |= 0x8000;
                        gWinRegs[5] = 0x83F;
                    }
                }
            }
        }
        DisplaySprite(s);
    }
}
END_NONMATCH

#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
// around 70%: https://decomp.me/scratch/KNjEN
NONMATCH("asm/non_matching/game/multiplayer/mp_player__Task_CreateMultiplayerPlayer.inc", void Task_CreateMultiplayerPlayer(void))
#else
NONMATCH("asm/non_matching/game/multiplayer/mp_player__Task_CreateMultiplayerPlayer__CollectRings.inc",
         void Task_CreateMultiplayerPlayer(void))
#endif
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    SpriteTransform *transform = &mpp->transform;
    s32 id = mpp->unk56;
    union MultiSioData *recv = &gMultiSioRecv[id];

    u32 i;

    if ((gMultiSioStatusFlags & MULTI_SIO_RECV_ID(id))) {
        mpp->unk61 = 0;
        if (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(id) && recv->pat0.unk0 == 0x5000) {
            s32 x;
            mpp->unk61 = 0;
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                mpp->unk44 = recv->pat4.x - mpp->pos.x;
                mpp->unk48 = recv->pat4.y - mpp->pos.y;
                mpp->pos.x = recv->pat4.x;
                mpp->pos.y = recv->pat4.y;

            } else {
                mpp->unk44 = recv->pat4.x - mpp->pos.x;
                mpp->unk48 = recv->pat4.y - mpp->pos.y;
                x = ABS(mpp->unk44);

                if (x > 15) {
                    x = ABS(mpp->unk48);
                    if (mpp->unk44 > 0 && mpp->unk48 > 0) {
                        mpp->unk44 = recv->pat4.x - mpp->pos.x - 1440;
                        mpp->unk48 = recv->pat4.y - mpp->pos.y - 864;
                    } else {
                        if (mpp->unk44 < 0 && mpp->unk48 < 0) {
                            mpp->unk44 = recv->pat4.x - mpp->pos.x - 1440;
                            mpp->unk48 = recv->pat4.y - mpp->pos.y - 864;
                        }
                    }
                }
                mpp->pos.x = recv->pat4.x;
                mpp->pos.y = recv->pat4.y;
            }
            if (ABS(mpp->unk44) < 0x41) {
                if (ABS(mpp->unk48) >= 0x40) {
                    mpp->unk66 = Q(mpp->unk44);
                    mpp->unk68 = Q(mpp->unk48);
                } else {
                    mpp->unk66 = 0;
                    mpp->unk68 = 0;
                }
            } else {
                mpp->unk66 = 0;
                mpp->unk68 = 0;
            }
            {
                u8 val = recv->pat4.unk10 & ~mpp->unk57;
                if (SIO_MULTI_CNT->id == mpp->unk56) {
                    if (val & 2 && !(mpp->unk57 & 2)) {
                        CreateItemTask_Invincibility(mpp->unk56);
                    }
                    if (val & 0x50 && !(mpp->unk57 & 2)) {
                        CreateItemTask_Confusion(mpp->unk56);
                    }
                }
            }
            mpp->unk57 = recv->pat4.unk10;
            // TODO: not pat4
            mpp->unk54 = recv->pat4.unk8;

            if (SIO_MULTI_CNT->id != mpp->unk56) {
                mpp->unk64 = ((recv->pat4.unk8) & 0x600) >> 9;
            } else {
                if (SIO_MULTI_CNT->id != mpp->unk64) {
                    MultiplayerPlayer *mpp2 = TASK_DATA(gMultiplayerPlayerTasks[mpp->unk64]);
                    if (SIO_MULTI_CNT->id == mpp2->unk64) {
                        mpp2->unk64 = SIO_MULTI_CNT->id;
                        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        gPlayer.moveState &= ~MOVESTATE_20;
                        gPlayer.moveState &= ~MOVESTATE_4;
                        gPlayer.moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        gPlayer.moveState &= ~MOVESTATE_400;
                        gPlayer.moveState &= ~MOVESTATE_100;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                        gPlayer.SA2_LABEL(unk61) = 0;
                        gPlayer.SA2_LABEL(unk62) = 0;

                        gPlayer.charState = CHARSTATE_WALK_A;
                        gPlayer.moveState |= MOVESTATE_800000;
                        gPlayer.callback = Player_TouchGround;
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        mpp->unk5C &= ~4;
                        if (mpp2->unk5C & 4) {
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            mpp2->unk5C &= ~4;
                        }
                    }
                }
            }

            {
                u32 anim;
                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    gMultiplayerCharRings[mpp->unk56] = I(recv->pat4.unk6);
                    mpp->unk6A = recv->pat4.unk6;
                    anim = gPlayerCharacterIdleAnims[mpp->unk6A];
                } else {
                    anim = recv->pat4.unk6;
                }

                if (s->graphics.anim != anim || s->variant != (recv->pat4.unkB % 16)) {
                    s->hitboxes[0].index = -1;
                    s->hitboxes[1].index = -1;
                }

                if (mpp->unk54 & 4) {
                    if (mpp->unk5C & 4) {
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        mpp->unk5C &= ~4;
                    }

                    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                    }
                }

                s->graphics.anim = anim;
                s->variant = recv->pat4.unk6;
                mpp->unk58[0] = recv->pat4.unkB >> 4;
                s->animSpeed = recv->pat4.unkC;
                transform->rotation = recv->pat4.unkD << 2;
            }
        } else {
            goto thing;
            // mpp->pos.x += I(mpp->unk66);
            // mpp->pos.y += I(mpp->unk68);

            // if (mpp->unk61++ > 30) {
            //     // TODO: macro this
            //     TasksDestroyAll();
            //     PAUSE_BACKGROUNDS_QUEUE();
            //     gUnknown_03005390 = 0;
            //     PAUSE_GRAPHICS_QUEUE();
            //     LinkCommunicationError();
            //     return;
            // }
        }
    } else {
    thing:
        mpp->pos.x += I(mpp->unk66);
        mpp->pos.y += I(mpp->unk68);

        if (mpp->unk61++ > 30) {
            // TODO: macro this
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }
    }

    {
        s8 i;
        for (i = 3; i >= 0; i--) {
            if (s->graphics.anim >= gPlayerCharacterIdleAnims[i]) {
                break;
            }
        }

        s->x = mpp->pos.x - gCamera.x;
        s->y = mpp->pos.y - gCamera.y;
        transform->x = mpp->pos.x - gCamera.x;
        transform->y = mpp->pos.y - gCamera.y;

        if (mpp->unk54 & 0x800) {
            s->prevVariant = -1;
            s->hitboxes[0].index = -1;
            s->hitboxes[1].index = -1;
        }
        UpdateSpriteAnimation(s);
    }

    if (gGameMode == GAME_MODE_TEAM_PLAY && gUnknown_030054B4[SIO_MULTI_CNT->id] == -1) {
        u32 someBool = TRUE;
        for (i = 0; i < 4; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }

            {
                MultiplayerPlayer *mpp2 = TASK_DATA(gMultiplayerPlayerTasks[i]);
                if ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)
                    && !(mpp2->unk54 & 0x100)) {

                    someBool = FALSE;
                    break;
                }
            }
        }

        if (someBool) {
            ((RoomEvent *)CreateRoomEvent())->type = 7;
        }
    }

    if (!(gStageFlags & 1) && !(mpp->unk54 & 0x80000004)) {
        if (!(gPlayer.itemEffect & 0x80)) {
            if (!(mpp->unk5C & 1) && (gPlayer.timerInvulnerability == 0)
                && !(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD))) {
                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (mpp->unk56 != SIO_MULTI_CNT->id) {
                        switch (gMultiplayerCharacters[mpp->unk56]) {

                            case CHARACTER_SONIC:
                            case CHARACTER_CREAM:
                                SA2_LABEL(sub_8016D20)();
                                break;
                            case CHARACTER_TAILS:
                                SA2_LABEL(sub_801707C)();
                                break;
                            case CHARACTER_KNUCKLES:
                                SA2_LABEL(sub_8017670)();
                                break;
                            case CHARACTER_AMY:
                                SA2_LABEL(sub_8017C28)();
                                break;
                        }
                    }
                } else {
                    if (mpp->unk56 != SIO_MULTI_CNT->id) {
                        SA2_LABEL(sub_8018120)();
                    }
                }
            }
        }
    } else {
        if ((gPlayer.itemEffect & PLAYER_ITEM_EFFECT__TELEPORT) || (mpp->unk57 & 0x80) || gPlayer.timerInvincibility == 0
            || !PLAYER_IS_ALIVE || gUnknown_030054B4[mpp->unk56] != -1) {
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (mpp->unk56 == SIO_MULTI_CNT->id && gMultiplayerCharacters[mpp->unk56] == CHARACTER_TAILS
                    && gMultiplayerCharacters[mpp->unk56] == CHARACTER_KNUCKLES && mpp->unk5C & 4) {
                    mpp->unk5C &= ~0x6;
                    if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__TELEPORT)) {
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                    }
                    {
                        RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_UNKNOWN;
                        roomEvent->unk1 = mpp->unk56;
                        roomEvent->unk2 = 0;
                    }
                }
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                    gPlayer.moveState &= ~(MOVESTATE_STOOD_ON_OBJ | MOVESTATE_FACING_LEFT);
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 30;
                }
            } else {
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                    gPlayer.moveState &= ~(MOVESTATE_FLIP_WITH_MOVE_DIR | MOVESTATE_IN_AIR);
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    mpp->unk60 = 30;
                }
            }
        }
    }

    if (mpp->unk54 & 1) {
        s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
        s->frameFlags = gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE;
        if (mpp->unk54 & 2) {
            transform->qScaleX = -256;
        } else {
            transform->qScaleX = +256;
        }

        if (mpp->unk54 & 8) {
            transform->qScaleX = -transform->qScaleX;
        }
        TransformSprite(s, transform);
    } else {
        s->frameFlags &= ~0x30;
        if (mpp->unk54 & 2) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        }
        if (mpp->unk54 & 8) {
            s->frameFlags |= SPRITE_FLAG_MASK_Y_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }
    }

    s->frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    s->frameFlags |= (mpp->unk54 & 0x30) << 8;

    if (!(mpp->unk54 & 0x40)
        && ((gStageTime & 2 || mpp->unk57 & 0x20 || mpp->unk5C & 1 || gUnknown_030054B4[mpp->unk56] != -1)
            || (mpp->unk60 == 0 && !(mpp->unk54 & 4) && !(mpp->unk5C & 2)))) {
        s->oamFlags = SPRITE_OAM_ORDER(16);
        if (mpp->unk54 & 0x80) {
            s->oamFlags |= 0x40;
        }

        s->frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        if (mpp->unk57 & 0x20
            && (gGameMode != GAME_MODE_TEAM_PLAY
                || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
                    != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
            && mpp->unk60 == 0 && mpp->unk56 != SIO_MULTI_CNT->id) {
            s->frameFlags |= SPRITE_FLAG(OBJ_MODE, 2);
            gDispCnt |= DISPCNT_OBJWIN_ON;
            gWinRegs[WINREG_WINOUT] = (WINOUT_WINOBJ_BG3 | WINOUT_WIN01_ALL);
        }

        if ((u16)(s->x + 63) < (DISPLAY_WIDTH + 127) && (s->y > -64 && s->y < DISPLAY_HEIGHT + 64)) {
            DisplaySprite(s);
        } else if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            if ((gCamera.x + s->x) < 0x3C1) {
                s->x += 0x5A0;
                transform->x += 0x5A0;
                s->y += 0x360;
                transform->y += 0x360;
            } else {
                s->x -= 0x5A0;
                transform->x -= 0x5A0;
                s->y -= 0x360;
                transform->y -= 0x360;
            }

            if ((u16)(s->x + 63) < (DISPLAY_WIDTH + 127) && (s->y > -64 && s->y < DISPLAY_HEIGHT + 64)) {
                if (mpp->unk54 & 1) {
                    TransformSprite(s, transform);
                }
                DisplaySprite(s);
            }
        }
    }

    if (gShouldSpawnMPAttackEffect != FALSE) {
        CreateMPAttackEffect();
        gShouldSpawnMPAttackEffect = FALSE;
    }

    if (gShouldSpawnMPAttack2Effect != FALSE) {
        CreateMPAttack2Effect();
        gShouldSpawnMPAttack2Effect = FALSE;
    }
}
END_NONMATCH
#endif // (GAME == GAME_SA1)

#ifndef COLLECT_RINGS_ROM
// Sonic/Cream
void SA2_LABEL(sub_8016D20)(void)
{
    Sprite *sprPlayer = &gPlayer.spriteInfoBody->s;
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    SpriteTransform *transform = &mpp->transform;
    u32 val;
    u8 *modePtr;
    u8 *vModePtr;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        SA2_LABEL(sub_8017F34)();
    }

#if (GAME == GAME_SA1)
    // Checks twice for gGameMode 3, 5 !
    if (((gGameMode == 3 || gGameMode == 5)
         && ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
             != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
        || (gGameMode != 3 && gGameMode != 5))
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
#endif
    {
        if (!SA2_LABEL(sub_8018300)()) {
            return;
        }

        if (!(mpp->unk4C & MOVESTATE_20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (mpp->unk60 == 0) {
        if (SA2_LABEL(sub_80181E0)() != 0) {
            if (mpp->unk4C & MOVESTATE_20) {
                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
            }

#if (GAME == GAME_SA1)
            if (s->graphics.anim != CHARSTATE_18)
#elif (GAME == GAME_SA2)
            if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SONIC))
#endif
            {
                return;
            }

            gPlayer.charState = CHARSTATE_WALK_A;
#if (GAME == GAME_SA2)
            gPlayer.callback = Player_TouchGround;
#endif
            gPlayer.SA2_LABEL(unk61) = 0;
            gPlayer.SA2_LABEL(unk62) = 0;

            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = Q_8_8(12);
                gPlayer.qSpeedAirX = Q_8_8(12);
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = -Q_8_8(12);
                gPlayer.qSpeedAirX = -Q_8_8(12);
            }
            mpp->unk60 = 30;
        } else {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
                return;
            }

            if (gPlayer.SA2_LABEL(unk61) != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }

            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & MOVESTATE_20 && !(val & MOVESTATE_20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }

            mpp->unk4C = val;

            if (val & MOVESTATE_IGNORE_INPUT) {
                mpp->unk60 = 30;
            }

            if (!(val & (MOVESTATE_10000 | MOVESTATE_20 | MOVESTATE_STOOD_ON_OBJ))) {
                return;
            }

#if (GAME == GAME_SA1)
            if (s->graphics.anim != CHARSTATE_18)
#elif (GAME == GAME_SA2)
            if (s->graphics.anim != SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_DASH, CHARACTER_SONIC))
#endif
            {
                return;
            }
            gPlayer.charState = CHARSTATE_WALK_A;
#if (GAME == GAME_SA2)
            gPlayer.callback = Player_TouchGround;
#endif
            gPlayer.SA2_LABEL(unk61) = 0;
            gPlayer.SA2_LABEL(unk62) = 0;

            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y) {
                mpp->unk60 = 30;
                return;
            } else if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = Q(12);
                gPlayer.qSpeedAirX = Q(12);
            } else {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.moveState &= ~MOVESTATE_20;
                gPlayer.qSpeedGround = -Q(12);
                gPlayer.qSpeedAirX = -Q(12);
            }
            mpp->unk60 = 30;
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
        return;
    }
}

#define SOME_INVERTED_GRAVITY_MACRO (!GRAVITY_IS_INVERTED != !(mpp->unk54 & 8) || !(mpp->unk5C & 0x100) != !GRAVITY_IS_INVERTED)

// Tails
void SA2_LABEL(sub_801707C)(void)
{

    Sprite *playerSprite, *s;
    MultiplayerPlayer *mpp;

    bool8 someBool;
    u32 moveStateVal, val;
    s32 result;
    u8 unusedByte;

    playerSprite = &gPlayer.spriteInfoBody->s;
    someBool = FALSE;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;
    moveStateVal = (gPlayer.moveState >> 5) & 1;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        SA2_LABEL(sub_8017F34)();
        someBool = TRUE;
    }

#if (GAME == GAME_SA1)
    // Checks twice for gGameMode 3, 5 !
    if (((gGameMode == 3 || gGameMode == 5)
         && ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
             != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
        || (gGameMode != 3 && gGameMode != 5))
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
#endif
    {
        if (SA2_LABEL(sub_8018300)() == 0) {
            return;
        }

        if (!(mpp->unk4C & MOVESTATE_20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (gPlayer.SA2_LABEL(unk61) != 0 && gPlayer.character == CHARACTER_KNUCKLES) {
        return;
    }

    if (mpp->unk60 == 0 || (mpp->unk5C & 4)) {
        u32 someOtherBool;

        mpp->unk60 = 0;

        if (IS_SPECIFIC_TAILS_ANIM) {
            if (SA2_LABEL(sub_80181E0)()) {
                if (!(mpp->unk4C & 0x20)) {
                    return;
                }

                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
                return;
            }
        }

        if (IS_SPECIFIC_TAILS_ANIM && HITBOX_IS_ACTIVE(playerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            return;
        }

        someOtherBool = (gPlayer.moveState >> 1) & 1;
        val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

        if ((mpp->unk4C & 0x20) && !(val & 0x20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;

        if (val & 0x200000) {
            mpp->unk60 = 30;
        }

        if (!(mpp->unk5C & 4)) {
            if ((someOtherBool || someBool) && (val & 0x10028 && !IS_SPECIFIC_TAILS_ANIM && (!!GRAVITY_IS_INVERTED != !(mpp->unk54 & 8)))) {

                s32 y;
                if (!GRAVITY_IS_INVERTED) {
                    result = SA2_LABEL(sub_801E4E4)(MAX(I(gPlayer.qWorldY), mpp->pos.y) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX),
                                                    gPlayer.layer, 8, &unusedByte, SA2_LABEL(sub_801EE64));
                } else {
                    result = SA2_LABEL(sub_801E4E4)(MIN(I(gPlayer.qWorldY), mpp->pos.y) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX),
                                                    gPlayer.layer, -8, &unusedByte, SA2_LABEL(sub_801EE64));
                }

                if (result - gPlayer.spriteOffsetY > 0) {
                    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;

                    mpp->unk5C |= 4;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);

                    {
                        RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_8;
                        roomEvent->unk1 = mpp->unk56;
                        roomEvent->unk2 = 1;
                    }

                    if (!GRAVITY_IS_INVERTED) {
                        mpp->unk5C &= ~0x100;
                    } else {
                        mpp->unk5C |= 0x100;
                    }
                }
            }

            if (!(mpp->unk5C & 4)) {
                return;
            }
        }

#if (GAME > GAME_SA1)
        gPlayer.charState = CHARSTATE_IDLE;
        gPlayer.callback = Player_TouchGround;
#else
        gPlayer.charState = CHARSTATE_38;
#endif
        gPlayer.moveState |= MOVESTATE_IN_AIR;
        gPlayer.SA2_LABEL(unk61) = 0;
        gPlayer.SA2_LABEL(unk62) = 0;

        if (Player_TryJump(&gPlayer)) {
            mpp->unk60 = 30;
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            mpp->unk5C &= ~4;

        } else {
            if (IS_SPECIFIC_TAILS_ANIM || I(gPlayer.qWorldX) <= gCamera.minX || I(gPlayer.qWorldX) >= gCamera.maxX
                || SOME_INVERTED_GRAVITY_MACRO || moveStateVal != 0) {
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~4;
                gPlayer.charState = CHARSTATE_IDLE;
#if (GAME > GAME_SA1)
                gPlayer.callback = Player_TouchGround;
#endif
                if (SOME_INVERTED_GRAVITY_MACRO) {
                    gPlayer.timerInvulnerability = 60;
                }
            } else {
                if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
                    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                    mpp->unk5C &= ~4;
                } else {
                    s32 x, y;
                    bool32 invertedGravity = GRAVITY_IS_INVERTED;
                    mpp->unk5C |= 4;
                    x = Q(mpp->pos.x);

                    // TODO: potential macro
                    if (!invertedGravity) {
#if (GAME == GAME_SA1)
                        y = Q(mpp->pos.y + (s->hitboxes[0].b.bottom) + 17);
#elif (GAME == GAME_SA2)
                        y = Q(mpp->pos.y + (s->hitboxes[0].bottom) + 17);
#endif
                        result = SA2_LABEL(sub_801E4E4)(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8,
                                                        &unusedByte, SA2_LABEL(sub_801EE64));

                        if (result < 0) {
                            y += Q(result);
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            gPlayer.moveState |= MOVESTATE_IN_AIR;
                            mpp->unk5C &= ~4;
                        }

                    } else {
#if (GAME == GAME_SA1)
                        y = Q(mpp->pos.y + (s->hitboxes[0].b.top) - 17);
#elif (GAME == GAME_SA2)
                        y = Q(mpp->pos.y + (s->hitboxes[0].top) - 17);
#endif
                        result = SA2_LABEL(sub_801E4E4)(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8,
                                                        &unusedByte, SA2_LABEL(sub_801EE64));

                        if (result < 0) {
                            y -= Q(result);
                            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                            gPlayer.moveState |= MOVESTATE_IN_AIR;
                            mpp->unk5C &= ~4;
                        }
                    }
                    gPlayer.qWorldX = x;
                    gPlayer.qWorldY = y;
                    if (mpp->unk5C & 4) {
#ifndef NON_MATCHING
                        // thanks pidgey
                        u32 speed = 0;
                        gPlayer.qSpeedAirX = speed;
                        invertedGravity = GRAVITY_IS_INVERTED;
                        if (!invertedGravity) {
                            invertedGravity = FALSE;
                        } else {
                            invertedGravity = FALSE;
                        }
                        gPlayer.qSpeedAirY = speed;
                        asm("" ::: "r2");
#else
                        gPlayer.qSpeedAirX = 0;
                        gPlayer.qSpeedAirY = 0;
#endif

                        gPlayer.moveState &= ~MOVESTATE_20;
                    }
                }
            }
        }

        if (!(mpp->unk5C & 4)) {
            RoomEvent_Unknown *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_8;
            roomEvent->unk1 = mpp->unk56;
            roomEvent->unk2 = 0;
        }

        if (!GRAVITY_IS_INVERTED) {
            mpp->unk5C &= ~0x100;
        } else {
            mpp->unk5C |= 0x100;
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
    }
}

// Knuckles
// NOTE: Matches in SA2!
// (99.36%) https://decomp.me/scratch/cjmw6
#if (GAME == GAME_SA1)
NONMATCH("asm/non_matching/game/multiplayer/sa1_mp_player__sa2__sub_8017670.inc", void SA2_LABEL(sub_8017670)(void))
#else
void SA2_LABEL(sub_8017670)(void)
#endif
{
    Sprite *playerSprite, *s;
    MultiplayerPlayer *mpp;

    u32 moveStateVal, val;
    s32 result;
    u8 unusedByte;

    playerSprite = &gPlayer.spriteInfoBody->s;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;
    moveStateVal = (gPlayer.moveState >> 5) & 1;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        SA2_LABEL(sub_8017F34)();
    }

#if (GAME == GAME_SA1)
    // Checks twice for gGameMode 3, 5 !
    if (((gGameMode == 3 || gGameMode == 5)
         && ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
             != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
        || (gGameMode != 3 && gGameMode != 5))
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
#endif
    {
        if (!SA2_LABEL(sub_8018300)()) {
            return;
        }

        if (!(mpp->unk4C & 0x20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (gPlayer.SA2_LABEL(unk61) != 0 && gPlayer.character == CHARACTER_TAILS) {
        return;
    }

    if (mpp->unk60 == 0 || (mpp->unk5C & 4)) {
        mpp->unk60 = 0;
        if (IS_SPECIFIC_KNUCKLES_ANIM) {
            if (SA2_LABEL(sub_80181E0)()) {
                if (!(mpp->unk4C & 0x20)) {
                    return;
                }
                gPlayer.moveState &= ~MOVESTATE_20;
                mpp->unk4C = 0;
                return;
            }

            if (IS_SPECIFIC_KNUCKLES_ANIM && HITBOX_IS_ACTIVE(playerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
                return;
            }
        }

        {
            s8 rect[4] = { -gPlayer.spriteOffsetX, -gPlayer.spriteOffsetY, gPlayer.spriteOffsetX, gPlayer.spriteOffsetY };
            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }

            mpp->unk4C = val;

            if (val & 0x200000) {
                mpp->unk60 = 30;
            }

            if (Coll_Player_Entity_RectIntersection(s, mpp->pos.x, mpp->pos.y, &gPlayer, (Rect8 *)rect)) {
                u8 temp = ((mpp->unk54 >> 7) & 1);
                if ((temp == gPlayer.layer) && !IS_SPECIFIC_KNUCKLES_ANIM && !GRAVITY_IS_INVERTED == !(mpp->unk54 & 8)) {
                    if ((!GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) > mpp->pos.y)
                        || (GRAVITY_IS_INVERTED && I(gPlayer.qWorldY) < mpp->pos.y)) {
                        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                        gPlayer.qSpeedGround = 0;
                        gPlayer.qSpeedAirX = 0;
                        gPlayer.charState = CHARSTATE_IDLE;
                        gPlayer.SA2_LABEL(unk61) = 0;
                        gPlayer.SA2_LABEL(unk62) = 0;
                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                        } else {
                            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                        }
                        if (!(mpp->unk5C & 4)) {
                            {
                                RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                                roomEvent->type = ROOMEVENT_TYPE_8;
                                roomEvent->unk1 = mpp->unk56;
                                roomEvent->unk2 = 1;
                            }
                            if (!GRAVITY_IS_INVERTED) {
                                mpp->unk5C &= ~0x100;
                            } else {
                                mpp->unk5C |= 0x100;
                            }
                        }
                        mpp->unk5C |= 4;
                    }
                }
            }

            if (!(mpp->unk5C & 4)) {
                return;
            }

            if (Player_TryJump(&gPlayer) != 0) {
                mpp->unk60 = 30;
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~0x4;
                return;
            }

            if (IS_SPECIFIC_KNUCKLES_ANIM || I(gPlayer.qWorldX) <= gCamera.minX || I(gPlayer.qWorldX) >= gCamera.maxX
                || SOME_INVERTED_GRAVITY_MACRO || moveStateVal != 0) {
                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                mpp->unk5C &= ~4;
                gPlayer.charState = CHARSTATE_IDLE;
                if (SOME_INVERTED_GRAVITY_MACRO) {
                    mpp->unk60 = 30;
                }

                return;
            }
            {
                s32 x, y;
                s32 playerUnk17 = gPlayer.spriteOffsetY;
                bool32 gravityInverted = GRAVITY_IS_INVERTED;
                // mpp->unk5C |= 4;
                x = QS(mpp->pos.x);

                // TODO: potential macro
                if (!(gravityInverted)) {
#if (GAME == GAME_SA1)
                    y = QS((mpp->pos.y + (s->hitboxes[0].b.top)) - rect[3]);
                    result = SA2_LABEL(sub_801F100)((mpp->pos.y + (s->hitboxes[0].b.top) - rect[3]) - playerUnk17, I(x), gPlayer.layer, -8,
                                                    SA2_LABEL(sub_801EC3C));
#elif (GAME == GAME_SA2)
                    y = QS((mpp->pos.y + (s->hitboxes[0].top)) - rect[3]);
                    result = SA2_LABEL(sub_801F100)((mpp->pos.y + (s->hitboxes[0].top) - rect[3]) - playerUnk17, I(x), gPlayer.layer, -8,
                                                    SA2_LABEL(sub_801EC3C));
#endif

                    if (result < 0) {
                        y -= QS(result);
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk5C &= ~4;
                    }
                } else {
#if (GAME == GAME_SA1)
                    y = QS(mpp->pos.y + (s->hitboxes[0].b.bottom) + rect[3]);
                    result = SA2_LABEL(sub_801F100)(((mpp->pos.y + (s->hitboxes[0].b.bottom) + rect[3]) + playerUnk17), I(x), gPlayer.layer,
                                                    8, SA2_LABEL(sub_801EC3C));
#elif (GAME == GAME_SA2)
                    y = QS(mpp->pos.y + (s->hitboxes[0].bottom) + rect[3]);
                    result = SA2_LABEL(sub_801F100)(((mpp->pos.y + (s->hitboxes[0].bottom) + rect[3]) + playerUnk17), I(x), gPlayer.layer,
                                                    8, SA2_LABEL(sub_801EC3C));
#endif

                    if (result < 0) {
                        y += QS(result);
                        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk5C &= ~4;
                    }
                }
                gPlayer.qWorldX = x;
                gPlayer.qWorldY = y;
            }

            if ((mpp->unk5C & 4)) {
                gPlayer.moveState |= MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState &= ~MOVESTATE_4;
                gPlayer.moveState &= ~MOVESTATE_IN_AIR;

                gPlayer.stoodObj = s;
                gPlayer.qSpeedAirY = 0;

                if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                }
            }

            if (!(mpp->unk5C & 4)) {
                RoomEvent_Unknown *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_8;
                roomEvent->unk1 = mpp->unk56;
                roomEvent->unk2 = 0;
            }

            if (!GRAVITY_IS_INVERTED) {
                mpp->unk5C &= ~0x100;
            } else {
                mpp->unk5C |= 0x100;
            }
        }
    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if ((mpp->unk4C & MOVESTATE_20) && !(val & MOVESTATE_20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        mpp->unk4C = val;
    }
}
#if (GAME == GAME_SA1)
END_NONMATCH
#endif

void SA2_LABEL(sub_8017C28)(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    u32 val;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        SA2_LABEL(sub_8017F34)();
    }

#if (GAME == GAME_SA1)
    // Checks twice for gGameMode 3, 5 !
    if (((gGameMode == 3 || gGameMode == 5)
         && ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
             != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
        || (gGameMode != 3 && gGameMode != 5))
#elif (GAME == GAME_SA2)
    if (gGameMode != GAME_MODE_TEAM_PLAY
        || ((gMultiplayerConnections & (0x10 << (mpp->unk56))) >> ((mpp->unk56 + 4))
            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)))
#endif
    {
        if (!SA2_LABEL(sub_8018300)()) {
            return;
        }

        if (!(mpp->unk4C & 0x20)) {
            return;
        }

        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
        return;
    }

    if (mpp->unk60 == 0) {
        if (!HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            if (gPlayer.SA2_LABEL(unk61) != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }

            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
            mpp->unk4C = val;
            return;
        } else {
            if (gPlayer.SA2_LABEL(unk61) != 0 && (gPlayer.character == CHARACTER_TAILS || gPlayer.character == CHARACTER_KNUCKLES)) {
                return;
            }
            val = SA2_LABEL(sub_800DA4C)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            if ((val & 2) && !(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.rotation == 0) {
#if (GAME == GAME_SA1)
                if (s->graphics.anim == SA1_ANIM_CHAR(AMY, BOOSTLESS_ATTACK))
#elif (GAME == GAME_SA2)
                if (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOSTLESS_ATTACK, CHARACTER_AMY))
#endif
                {
                    LaunchPlayer(-Q_8_8(7.5));
#ifndef NON_MATCHING
                    goto lab;
#else
                    mpp->unk60 = 30;
                    return;
#endif
                }

#if (GAME == GAME_SA1)
                if (s->graphics.anim == SA1_ANIM_CHAR(AMY, SA2_19))
#elif (GAME == GAME_SA2)
                if (s->graphics.anim == SA2_ANIM_CHAR(SA2_CHAR_ANIM_19, CHARACTER_AMY))
#endif
                {
                    LaunchPlayer(-Q_8_8(10.5));
#ifndef NON_MATCHING
                    goto lab;
#else
                    mpp->unk60 = 30;
                    return;
#endif
                }
            }

            if ((val & 1)) {
                if ((val & 0x20000)) {
                    if (gPlayer.qSpeedAirX > 0) {
                        gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                        gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                    }
                } else if ((val & 0x40000)) {
                    if (gPlayer.qSpeedAirX < 0) {
                        gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                        gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                    }
                }

                if (val & 0x100000 && gPlayer.qSpeedAirY > 0) {
                    gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
                }
#ifndef NON_MATCHING
            lab:
#endif
                mpp->unk60 = 30;
                return;
            } else {
                val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 1);

                if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                    gPlayer.moveState &= ~MOVESTATE_20;
                }

                mpp->unk4C = val;
                return;
            }
        }

    } else {
        mpp->unk60--;

        if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
            return;
        }

        if (gPlayer.stoodObj != s) {
            return;
        }

        val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

        if (mpp->unk4C & 0x20 && !(val & 0x20)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }
        mpp->unk4C = val;
    }
}

void SA2_LABEL(sub_8017F34)(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    MultiplayerPlayer *otherMpp;
    s32 result;

    if ((ABS(mpp->unk44) > 0x80) || (ABS(mpp->unk48) > 0x80)) {
        gPlayer.moveState &= ~0x8;
        gPlayer.moveState |= 2;
        mpp->unk60 = 30;
        return;
    }

#if (GAME == GAME_SA2)
    otherMpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    if ((otherMpp->unk54 & 0x80) != (mpp->unk54 & 0x80)) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.stoodObj = (void *)-1;
        mpp->unk64 = mpp->unk56;
        return;
    }
#endif

    gPlayer.qWorldX += Q(mpp->unk44);
    if (!GRAVITY_IS_INVERTED) {
        gPlayer.qWorldY += Q(mpp->unk48) + Q(1);
    } else {
        gPlayer.qWorldY += Q(mpp->unk48) - Q(2);
    }

    if (mpp->unk48 < 0) {
        result = SA2_LABEL(sub_801F100)(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8,
                                        SA2_LABEL(sub_801EC3C));
        if (result < 0) {
            gPlayer.qWorldY -= Q(result);
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            mpp->unk60 = 30;
        }
    } else if (mpp->unk48 > 0) {
        result = SA2_LABEL(sub_801F100)(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8,
                                        SA2_LABEL(sub_801EC3C));
        if (result < 0) {
            gPlayer.qWorldY += Q(result);
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            mpp->unk60 = 30;
        }
    }

    if (mpp->unk44 < 0) {
        result = SA2_LABEL(sub_801F100)(I(gPlayer.qWorldX) - gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, -8,
                                        SA2_LABEL(sub_801EB44));
        if (result < 0) {
            gPlayer.qWorldX -= Q(result);
        }
        return;
    } else if (mpp->unk44 > 0) {
        result = SA2_LABEL(sub_801F100)(I(gPlayer.qWorldX) + gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, 8,
                                        SA2_LABEL(sub_801EB44));
        if (result < 0) {
            gPlayer.qWorldX += Q(result);
        }
        return;
    }
}
#endif // COLLECT_RINGS_ROM

#if (GAME == GAME_SA2)
// This function is at the bottom of the file in SA1!
void SA2_LABEL(sub_8018120)(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        MultiplayerPlayer *otherMpp;
        gPlayer.qWorldX += Q(mpp->unk44);
        gPlayer.qWorldY += Q(mpp->unk48) + Q(1);

#if (GAME == GAME_SA2)
        otherMpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

        if ((otherMpp->unk54 & 0x80) != (mpp->unk54 & 0x80)) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.stoodObj = (void *)-1;
            mpp->unk64 = mpp->unk56;
        }
#endif
    }

    if (SA2_LABEL(sub_8018300)() && (mpp->unk4C & 0x20)) {
        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
    }
}
#endif // (GAME == GAME_SA2)

#ifndef COLLECT_RINGS_ROM
bool32 SA2_LABEL(sub_80181E0)(void)
{
    Sprite *sprPlayer = &gPlayer.spriteInfoBody->s;
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;

    u32 val;

    if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
        val = SA2_LABEL(sub_800DA4C)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);

        if ((val & 1)) {
            if (gPlayer.SA2_LABEL(unk61) == 0 && (val & 0x20000)) {
                if (gPlayer.qSpeedAirX > 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            } else if (gPlayer.SA2_LABEL(unk61) == 0 && (val & 0x40000)) {
                if (gPlayer.qSpeedAirX < 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            }

            if (val & 0x100000 && gPlayer.qSpeedAirY > 0) {
                gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
            }
            mpp->unk60 = 30;
            return TRUE;
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.moveState |= MOVESTATE_IN_AIR;
    }
    return FALSE;
}
#endif

bool32 SA2_LABEL(sub_8018300)(void)
{
    MultiplayerPlayer *mpp;
    MultiplayerPlayer *otherMPP;
    Sprite *s;
    Sprite *sprPlayer;
    u32 val;

    sprPlayer = &gPlayer.spriteInfoBody->s;
    mpp = TASK_DATA(gCurTask);
    s = &mpp->s;
#if (GAME == GAME_SA1)
    // spC
    otherMPP = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
#endif

    if (mpp->unk60 == 0) {
        u32 val2 = SA2_LABEL(sub_800DA4C)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
#if (GAME == GAME_SA2)
        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && !(val2 & 3)) {
            if (mpp->pos.x > 960) {
                val2 = SA2_LABEL(sub_800DA4C)(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            } else {
                val2 = SA2_LABEL(sub_800DA4C)(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1);
            }
        }
#endif

        if (val2 & 1) {
            if (gPlayer.SA2_LABEL(unk61) == 0 && (val2 & 0x20000)) {
                if (gPlayer.qSpeedAirX > 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            } else if (gPlayer.SA2_LABEL(unk61) == 0 && (val2 & 0x40000)) {
                if (gPlayer.qSpeedAirX < 0) {
                    gPlayer.qSpeedAirX = -gPlayer.qSpeedAirX;
                    gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
                }
            }

            if (val2 & 0x100000 && gPlayer.qSpeedAirY > 0) {
                gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
            }
            mpp->unk60 = 30;

            if (!(val2 & 2)) {
                return TRUE;
            }
        }
        if (val2 & 2) {
#if (GAME == GAME_SA1)
            if ((gGameMode == 3) || (gGameMode == 5)) {
                if (gMultiplayerCharacters[mpp->unk56] == 3) {
                    if (s->graphics.anim == SA1_ANIM_CHAR(AMY, BOOSTLESS_ATTACK) || s->graphics.anim == SA1_ANIM_CHAR(AMY, 56)) {
                        gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
                        gPlayer.timerSpeedup = ZONE_TIME_TO_INT(0, 10);
                        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
                        CreateItemTask_Confusion(gPlayer.character);
                        m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(0.5));
                    }
                }
            }
#endif
#ifndef COLLECT_RINGS_ROM
            if (val2 & 1) {
                if (mpp->pos.x < I(gPlayer.qWorldX)) {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                }
                SA2_LABEL(sub_800DE44)(&gPlayer);
            } else
#endif
            {
                if (mpp->pos.x < I(gPlayer.qWorldX)) {
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                } else {
                    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                }
                SA2_LABEL(sub_800DD54)(&gPlayer);
            }

            mpp->unk60 = 30;

#if (GAME == GAME_SA1)
            if ((gGameMode == GAME_MODE_CHAO_HUNT) || (gGameMode == GAME_MODE_TEAM_PLAY)) {
                if (otherMPP->unk5C & 0x70000) {
                    u32 i;
                    for (i = 0; i < ARRAY_COUNT(gChaoTasks); i++) {
                        if (otherMPP->unk5C & (0x10000 << i)) {
                            break;
                        }
                    }
                    otherMPP->unk5C &= ~(0x10000 << i);

                    {
                        ChaoTask *chao = TASK_DATA(gChaoTasks[i]);
                        chao->unk41 = mpp->unk56;
                        {
                            RoomEvent_ChaoCollected *roomEvent = CreateRoomEvent();
                            roomEvent->type = ROOMEVENT_TYPE_CHAO_COLLECTED;
                            roomEvent->id1 = i;
                            roomEvent->id2 = mpp->unk56;
                        }
                    }
                }
            }
#endif
            return TRUE;
        }

        if (!HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && !HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            u32 existingMoveState = gPlayer.moveState;
            Sprite *existingS = gPlayer.stoodObj;
            s16 x, y;

#if (GAME == GAME_SA1)
            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, 0);
#elif (GAME == GAME_SA2)
            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val2 & 2);
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && val == 0) {
                gPlayer.moveState = existingMoveState;
                gPlayer.stoodObj = existingS;

                if (mpp->pos.x > 960) {
                    val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1,
                                                 val);
                } else {
                    val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1,
                                                 val);
                }
            }
#endif

            if (mpp->unk4C & 0x20 && !(val & 0x20)) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
            mpp->unk4C = val;
            if ((val & 0x200000)) {
                mpp->unk60 = 30;
            }
        } else {
            if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (mpp->unk4C & 0x20) {
                gPlayer.moveState &= ~MOVESTATE_20;
            }
        }
        return FALSE;
    }

    mpp->unk60--;

    if (!(gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ)) {
        return FALSE;
    }

    if (gPlayer.stoodObj != s) {
        return FALSE;
    }

    val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x, mpp->pos.y, mpp->unk66, mpp->unk68, mpp->unk54 >> 7 & 1, 0);

#if (GAME == GAME_SA2)
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && val == 0) {
        if (mpp->pos.x > 960) {
            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x - 1440, mpp->pos.y - 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
        } else {
            val = SA2_LABEL(sub_800D0A0)(s, mpp->pos.x + 1440, mpp->pos.y + 864, mpp->unk66, mpp->unk68, (mpp->unk54 >> 7) & 1, val);
        }
    }
#endif

    if (mpp->unk4C & 0x20 && !(val & 0x20)) {
        gPlayer.moveState &= ~MOVESTATE_20;
    }
    mpp->unk4C = val;

    if ((val & 0x200000)) {
        mpp->unk60 = 30;
    }

    return FALSE;
}

#ifndef COLLECT_RINGS_ROM
void Task_HandleLaunchPlayer(void)
{
    PlayerSpriteInfo *psi = gPlayer.spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (sprPlayer->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        s16 *airSpeed = TASK_DATA(gCurTask);
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.moveState &= ~MOVESTATE_800000;
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.moveState |= MOVESTATE_IN_AIR;
        gPlayer.moveState &= ~MOVESTATE_100;
        gPlayer.charState = CHARSTATE_SPRING_B;
        sprPlayer->prevVariant = -1;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
        m4aSongNumStart(SE_SPRING);
        gPlayer.qSpeedAirY = *airSpeed;
        TaskDestroy(gCurTask);
        return;
    }

    if (gPlayer.charState != CHARSTATE_AMY_SA1_JUMP) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.moveState &= ~MOVESTATE_800000;
        TaskDestroy(gCurTask);
    }
}
#endif

#if (GAME == GAME_SA2)
void SA2_LABEL(sub_8018818)(void)
{
    u32 i;
    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }
            mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
            mpp->unk5C &= ~2;
        }

        gPlayer.timerInvulnerability = 120;
        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
    }
}
#endif

void TaskDestructor_MultiplayerPlayer(struct Task *t)
{
    MultiplayerPlayer *mpp = TASK_DATA(t);
    gMultiplayerPlayerTasks[mpp->unk56] = NULL;
    VramFree(mpp->s.graphics.dest);
}

#ifndef COLLECT_RINGS_ROM
void LaunchPlayer(s16 airSpeedY)
{
    struct Task *t = TaskCreate(Task_HandleLaunchPlayer, sizeof(s16), 0x2000, 0, NULL);
    s16 *airSpeed = TASK_DATA(t);
    *airSpeed = airSpeedY;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPlayer.heldInput = 0;
    gPlayer.charState = CHARSTATE_AMY_SA1_JUMP;
    gPlayer.moveState |= MOVESTATE_800000;
}
#endif

#if (GAME == GAME_SA1)
// This function is about 300 lines further up in SA2!
// Sadly, you cannot use an inline function to match
void SA2_LABEL(sub_8018120)(void)
{
    MultiplayerPlayer *mpp = TASK_DATA(gCurTask);
    Sprite *s = &mpp->s;
    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        MultiplayerPlayer *otherMpp;
        gPlayer.qWorldX += Q(mpp->unk44);
        gPlayer.qWorldY += Q(mpp->unk48) + Q(1);

#if (GAME == GAME_SA2)
        otherMpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

        if ((otherMpp->unk54 & 0x80) != (mpp->unk54 & 0x80)) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.stoodObj = (void *)-1;
            mpp->unk64 = mpp->unk56;
        }
#endif
    }

    if (SA2_LABEL(sub_8018300)() && (mpp->unk4C & 0x20)) {
        gPlayer.moveState &= ~MOVESTATE_20;
        mpp->unk4C = 0;
    }
}
#endif // (GAME == GAME_SA1)
