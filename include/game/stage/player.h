#ifndef GUARD_STAGE_PLAYER_H
#define GUARD_STAGE_PLAYER_H

// TODO: Merge this file with this one!!!
#include "game/sa1_sa2_shared/player.h"

// TODO: merge these
#include "constants/characters.h"
#include "game/parameters/characters.h"

// In SA2 tricks stop all characters when the buttons are pressed.
// Set this to TRUE to behave more like SA3.
#define DISABLE_TRICK_AIR_WAIT !TRUE

// Actual type of 'type8029A28' currently unknown, rename once it is
typedef s32 type8029A28;

void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

void InitializePlayer(Player *p);
void DestroyPlayerTasks(Player *player);
void Player_TransitionCancelFlyingAndBoost(Player *p);
void Player_HandleSpriteYOffsetChange(Player *, s32);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void Player_AirInputControls(Player *);
void Player_TouchGround(Player *p);
void Player_Uncurl(Player *p);
void Player_HandlePhysicsWithAirInput(Player *p);
void sub_8028204(Player *p);
void sub_80282EC(Player *p);
void sub_80283C4(Player *p);
void sub_8029C84(Player *p);
void sub_8029FA4(Player *p);

void Player_DisableInputAndBossTimer(void);
void Player_DisableInputAndBossTimer_FinalBoss(void);

// NOTE: Proc type should be the same as SetStageSpawnPosInternal!
void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *player);
void CallSetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p);

s32 sub_8029B88(Player *player, u8 *p1, s32 *out);
s32 sub_8029AC0(Player *player, u8 *p1, s32 *out);
s32 sub_8029B0C(Player *player, u8 *p1, s32 *out);

type8029A28 sub_8029A28(Player *player, u8 *p1, type8029A28 *out);
type8029A28 sub_8029A74(Player *player, u8 *p1, type8029A28 *out);

bool32 Player_TryJump(Player *);
bool32 Player_TryAttack(Player *);

#ifndef COLLECT_RINGS_ROM
#define GET_CHARACTER_ANIM(player) (player->anim - gPlayerCharacterIdleAnims[player->character])
#else
#define GET_CHARACTER_ANIM(player) (player->anim - gPlayerCharacterIdleAnims[0])
#endif

#define PLAYERFN_SET(proc)          gPlayer.callback = proc;
#define PLAYERFN_CALL(proc, player) proc(player);
#define PLAYERFN_SET_AND_CALL(proc, player)                                                                                                \
    {                                                                                                                                      \
        PLAYERFN_SET(proc);                                                                                                                \
        PLAYERFN_CALL(proc, player);                                                                                                       \
    }

#define PLAYERFN_SET_SHIFT_OFFSETS(player, x, y)                                                                                           \
    {                                                                                                                                      \
        (player)->spriteOffsetX = x;                                                                                                       \
        (player)->spriteOffsetY = y;                                                                                                       \
    }
#define PLAYERFN_CHANGE_SHIFT_OFFSETS(player, x, y)                                                                                        \
    {                                                                                                                                      \
        Player_HandleSpriteYOffsetChange(player, y);                                                                                       \
        PLAYERFN_SET_SHIFT_OFFSETS(player, x, y)                                                                                           \
    }

// TODO: This is unaligned in-ROM.
//       Can we somehow change this to be using a struct instead?
extern const u16 sCharStateAnimInfo[][2];
extern const AnimId gPlayerCharacterIdleAnims[];

#endif // GUARD_STAGE_PLAYER_H
