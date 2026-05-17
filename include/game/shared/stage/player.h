#ifndef GUARD_STAGE_PLAYER_H
#define GUARD_STAGE_PLAYER_H

#include "core.h"

#if (GAME == GAME_SA1)
// TODO: merge these
#include "constants/sa1/characters.h"
//#include "game/shared/parameters/characters.h"

#include "constants/sa1/characters.h" // for NUM_CHARACTERS
#include "constants/sa1/move_states.h"
#elif (GAME == GAME_SA2)
#include "constants/sa2/move_states.h"

// TODO: merge these
#include "constants/sa2/characters.h"
#endif

#include "game/shared/parameters/characters.h"

#define PLAYER_IS_ALIVE  (!(gPlayer.moveState & MOVESTATE_DEAD))
#define IS_ALIVE(player) (!((player)->moveState & MOVESTATE_DEAD))

#define PLAYER_ON_SPRITE(p, s)   (((p).moveState & MOVESTATE_STOOD_ON_OBJ) && ((p).stoodObj == (s)))
#define PLAYER_I_ON_SPRITE(i, s) ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == (s)))

typedef struct {
    /*0x00 */ SpriteTransform transform;
    /*0x0C */ Sprite s;
    /*0x3C */ Hitbox reserved; // TODO: Maybe 3 hitboxes (Player, Action, Shield)?
} PlayerSpriteInfo; /* size: 0x44 */

#if (GAME != GAME_SA1)
extern PlayerSpriteInfo gPlayerLimbsPSI;
#endif
extern PlayerSpriteInfo gPlayerBodyPSI;
#if (GAME == GAME_SA1)
extern PlayerSpriteInfo gPartnerBodyPSI;
#endif

// TODO: Better name.
//       This is used for an apparent around the value Cream uses for flying duration
typedef struct {
    /* 0x80|0xAC */ u8 flags;
    /* 0x81|0xAD */ s8 SA2_LABEL(unkAD);
    /* 0x82|0xAE */ u16 SA2_LABEL(unkAE);
    /* 0x84|0xB0 */ u16 SA2_LABEL(unkB0);
} SonicFlags;

#if (GAME != GAME_SA1)
typedef struct {
    /* 0x80|0xAC */ s16 flyingDuration;
    /* 0x82|0xAE */ u16 SA2_LABEL(unkAE);
    /* 0x93|0xB0 */ s8 SA2_LABEL(unkB0);
} CreamFlags;
#endif

typedef struct {
    /* 0x80|0xAC */ u8 flags;
    /* 0x81|0xAD */ s8 shift;
    /* 0x82|0xAE */ s8 SA2_LABEL(unkAE);
    /* 0x83|0xAF */ s8 SA2_LABEL(unkAF);

    // NOTE: For some reason this is a 4-byte value, while Cream's is a 2-byte
    /* 0x84|0xB0 */ s32 flyingDuration;
} TailsFlags;

typedef struct {
    /* 0x80|0xAC */ u8 flags;
    /* 0x81|0xAD */ s8 shift; // TODO: Name
    /* 0x82|0xAE */ s8 SA2_LABEL(unkAE);
} KnucklesFlags;

typedef struct {
    /* 0xAC */ u8 flags;
} AmyFlags;

#define PLAYER_ITEM_EFFECT__NONE            0x00
#define PLAYER_ITEM_EFFECT__SHIELD_NORMAL   0x01
#define PLAYER_ITEM_EFFECT__INVINCIBILITY   0x02
#define PLAYER_ITEM_EFFECT__SPEED_UP        0x04
#define PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC 0x08
#define PLAYER_ITEM_EFFECT__MP_SLOW_DOWN    0x10
#define PLAYER_ITEM_EFFECT__20              0x20
#define PLAYER_ITEM_EFFECT__CONFUSION       0x40
#define PLAYER_ITEM_EFFECT__TELEPORT        0x80 // The name doesn't seem right...

#define HAS_SHIELD(p) ((p)->itemEffect & (PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL))

// Confusion
#define PLAYER_ITEM_EFFECT__40 0x40

// Teleport in SA2... Grinding in SA1?
#define PLAYER_ITEM_EFFECT__80 0x80

#define PLAYER_LAYER__FRONT 0x00
#define PLAYER_LAYER__BACK  0x01
#define PLAYER_LAYER__MASK  0x01
#define PLAYER_LAYER__80    0x80

#define PLAYER_1 0
#define PLAYER_2 1
#define PLAYER_3 2
#define PLAYER_4 3

#if (GAME == GAME_SA1)

#ifndef NON_MATCHING
// Previously called GET_SP_PLAYER_V0/PLAYER
#define PLAYER_V0(index) ((index == 0) ? gPlayer : gPartner)
#define PLAYER(index)    (((index) != 0) ? gPartner : gPlayer)

#define PLAYER_SPR_INFO(index) ((index != 0) ? gPartnerBodyPSI : gPlayerBodyPSI)
#else
// Modern GCC does not accept the pointerless macro as l-value,
// but even though agbcc does, it generates non-matching code, so we have to account for that.
#define PLAYER_V0(index) (*(((index) == 0) ? &gPlayer : &gPartner))
#define PLAYER(index)    (*(((index) != 0) ? &gPartner : &gPlayer))

#define PLAYER_SPR_INFO(index) (*((index != 0) ? &gPartnerBodyPSI : &gPlayerBodyPSI))
#endif

#define PLAYER_SPR_INFO_HITBOX(index, hbIndex)                                                                                             \
    ((index != 0) ? (&gPartnerBodyPSI.s.hitboxes[hbIndex]) : (&gPlayerBodyPSI.s.hitboxes[hbIndex]))

#elif (GAME == GAME_SA2)
// NOTE: Ignores index, in SA2 you only ever have 1 player char in single player mode
#define PLAYER_V0(index) (gPlayer)
#define PLAYER(index)    (gPlayer)
#elif (GAME == GAME_SA3)
#define PLAYER_V0(index) ((index == PLAYER_1) ? gPlayers[gStageData.playerIndex] : gPlayers[p->charFlags.partnerIndex])
#define PLAYER(index)    ((index != PLAYER_1) ? gPlayers[p->charFlags.partnerIndex] : gPlayers[gStageData.playerIndex])
#endif

// Declared beforehand because it's used inside Player struct
struct Player_;
typedef void (*PlayerCallback)(struct Player_ *);

// NOTE: struct offset labels are for SA1
typedef struct Player_ {
#if (GAME != GAME_SA1)
    /* 0x00 */ PlayerCallback callback;
    /* 0x04 */ u16 unk4;
#endif
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;

    /* 0x08 */ s16 qSpeedAirX;
    /* 0x0A */ s16 qSpeedAirY;
    /* 0x0C */ s16 qSpeedGround;

    // The player sprite's position is actually at the middle of its graphics,
    // this offset denotes the difference to the ground.
    /* 0x0E */ s8 spriteOffsetX;
    /* 0x0F */ s8 spriteOffsetY;
#if (GAME != GAME_SA1)
    /* 0x18 */ u8 filler18[8];
#endif

    // set/compare to values in "include/constants/move_states.h"
    /* 0x10 */ u32 moveState;

    /* 0x14 */ u8 rotation;
    /* 0x15 */ u8 SA2_LABEL(unk25);
    /* 0x16 */ s16 qSpindashAccel;
    /* 0x18 */ u8 SA2_LABEL(unk28);
    /* 0x19 */ u8 SA2_LABEL(unk29);
    /* 0x1A */ s16 SA2_LABEL(unk2A);
    /* 0x1C */ s16 timerInvulnerability;
    /* 0x1E */ s16 timerInvincibility;
    /* 0x20 */ s16 timerSpeedup; // Also used for the MP slowdown item
    /* 0x22 */ u16 timerConfusion;
    /* 0x24 */ u16 itemEffect20Timer;
#if (GAME != GAME_SA1)
    /* 0x36 */ s8 disableTrickTimer;
#endif
    /* 0x26 */ u8 itemEffect;
    /* 0x27 */ u8 layer; // TODO: Double-Check the name!
    /* 0x28 */ Sprite *stoodObj; // TODO: Change name!
    /* 0x2C */ s32 maxSpeed; // TODO: Rename qMaxSpeed,SA2 has 'maxSpeed' and 'topSpeed', which is this?
#if (GAME != GAME_SA1)
    /* 0x44 */ s32 topSpeed; // top speed the player can accelerate to
#endif
    /* 0x30 */ s32 acceleration; // TODO: Rename qAcceletation
    /* 0x34 */ s32 deceleration; // TODO: Rename qDeceletation
#if (GAME != GAME_SA1)
    /* 0x50 */ u16 rollingDeceleration;
    /* 0x52 */ u16 boostThreshold;
    /* 0x54 */ u16 walkAnim;
    /* 0x56 */ u16 unk56;
    /* 0x58 */ s16 boostSpeed;
    /* 0x5A */ bool8 isBoosting;
    /* 0x5B */ u8 trickDir;
#endif
    /* 0x38 */ u16 heldInput;
    /* 0x3A */ u16 frameInput;
    /* 0x3C */ s8 playerID;
    /* 0x3D */ s8 SA2_LABEL(unk61);
    /* 0x3E */ s8 SA2_LABEL(unk62);
    /* 0x3F */ s8 SA2_LABEL(unk63);
#if (GAME == GAME_SA1)
    /* 0x40 */ s8 charState;
    /* 0x41 */ s8 prevCharState;
#else
    /* 0x64 */ s16 charState; // charState values appear to be a default behavior to transition into another animation
    /* 0x66 */ s16 prevCharState;
#endif
    /* 0x42 */ AnimId anim;
    /* 0x44 */ u16 variant;
#if (GAME != GAME_SA1)
    /* 0x6C */ bool8 unk6C;

    // 0x6D Some player state, cleared after usage
    //  0x01 = Player_Sonic_HomingAttack
    //  0x05 = Set by IA ClearPipe_End if data[1] is set (also in GermanFlute IA), by
    //  Player_Cream_Flying
    //
    // use constants/player_transitions.h
    /* 0x6D */ u8 transition;
    /* 0x6E */ u8 unk6E; // Parameter for transition(?)
    /* 0x6F */ u8 prevTransition;
    /* 0x70 */ bool8 unk70;
    /* 0x71 */ u8 unk71;
#endif
    // unk72 appears to be a duration timer for side-forward trick animations + Homing Attack
    /* 0x46 */ s16 SA2_LABEL(unk72);
    /* 0x48 */ s16 checkPointX; // TODO: Make their type CamCoord ?
    /* 0x4A */ s16 checkPointY; // TODO: Make their type CamCoord ?
    /* 0x4C */ u32 checkpointTime;

    // TODO: Could these be a matrix?
    /* 0x50 */ u16 SA2_LABEL(unk7C);
    /* 0x52 */ u16 SA2_LABEL(unk7E);
    /* 0x54 */ s16 SA2_LABEL(unk80);
    /* 0x56 */ s16 SA2_LABEL(unk82);

    // Denotes how many points the player should get after defeating an enemy.
    // (see stage/enemy_defeat_score.c and stage/entity_manager.c for usage)
    /* 0x58 */ s8 defeatScoreIndex;

    /* 0x59 */ s8 character;
    /* 0x5A */ s8 secondsUntilDrown;
    /* 0x5B */ s8 framesUntilDrownCountDecrement;
    /* 0x5C */ s8 framesUntilWaterSurfaceEffect;

    /* 0x60 */ Task *spriteTask;
    /* 0x64 */ PlayerSpriteInfo *spriteInfoBody; // for character sprites
    /* 0x68 */ PlayerSpriteInfo *spriteInfoLimbs; // SpriteInfo for Tails' tails / Cream's ears, when rolling

#ifdef BUG_FIX
    // NOTE: There's a copy in player.c's 'InitializePlayer' that
    //       copies via a (u32 *) to unk99.
    //
    //       Since it is offset originally, platforms only writing words
    //       aligned (or crash when trying to write to an odd pointer) will
    //       not have the memory initialized properly.
    //
    //       Ironically this is a non-crashing bug on GBA as well.
    /* 0x6C */ s8 ALIGNED(4) SA2_LABEL(unk99)[16];
    /* 0x7C */ u8 SA2_LABEL(unk98); // Multiplayer var. TODO: check sign!
#else
    /* 0x6C */ u8 SA2_LABEL(unk98); // Multiplayer var. TODO: check sign!
    /* 0x6D */ s8 SA2_LABEL(unk99)[16];
#endif

    /* 0xAC */
    union {
        SonicFlags sf;
#if (GAME != GAME_SA1)
        CreamFlags cf;
#endif
        TailsFlags tf;
        KnucklesFlags kf;
        AmyFlags af;
    } w;
#if (GAME == GAME_SA1)
    /* 0x88 */ u8 filler88[0x8];
#endif
} Player;

typedef struct {
    /* 0x00 */ s8 pid;
    /* 0x04 */ u32 unk4; // TODO: Check the type!
} player_0_Task; /* size: 0x8 */

#if (GAME == GAME_SA1)
typedef struct {
    /* 0x00 */ player_0_Task unk0;
    /* 0x08 */ s32 unk8; // counter of some kind
    /* 0x0C */ s32 qXs[16];
    /* 0x0C */ s32 qYs[16];
} MaybeSuperSonic; /* size: 0x8C */
#endif

void CreatePlayer(u32 UNUSED characterId, u32 levelId, Player *player);
s32 SA2_LABEL(sub_8022F58)(u8 param0, Player *p);

extern Player gPlayer;
#if (GAME == GAME_SA1)
// "Cheat Code" Tails
extern Player gPartner;
#endif

// In SA2 tricks stop all characters when the buttons are pressed.
// Set this to TRUE to behave more like SA3.
#define DISABLE_TRICK_AIR_WAIT !TRUE

// Actual type of 'type8029A28' currently unknown, rename once it is
typedef s32 type8029A28;

void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

void InitializePlayer(Player *p);
#if (GAME == GAME_SA1)
bool32 Player_TrySpindash(Player *p);
#endif
void DestroyPlayerTasks(Player *player);
void Player_TransitionCancelFlyingAndBoost(Player *p);
void Player_HandleSpriteYOffsetChange(Player *, s32);

#if (GAME == GAME_SA1)
void SA2_LABEL(sub_8022190)(Player *p);
void SA2_LABEL(sub_8022318)(Player *p);
void SA2_LABEL(sub_8022838)(Player *p);
void SA2_LABEL(sub_8022D6C)(Player *p);
void SA2_LABEL(sub_80231C0)(Player *p);
#endif

void SA2_LABEL(sub_8023260)(Player *);
void SA2_LABEL(sub_80232D0)(Player *p);

void Player_AirInputControls(Player *);
void Player_TouchGround(Player *p);
void Player_Uncurl(Player *p);
void Player_HandlePhysicsWithAirInput(Player *p);

void SA2_LABEL(sub_8028204)(Player *p);
void SA2_LABEL(sub_80282EC)(Player *p);
void SA2_LABEL(sub_80283C4)(Player *p);
void SA2_LABEL(sub_8029C84)(Player *p);
void SA2_LABEL(sub_8029CA0)(Player *p);
void SA2_LABEL(sub_8029D14)(Player *p);
void SA2_LABEL(sub_8029ED8)(Player *p);
void SA2_LABEL(sub_8029FA4)(Player *p);

#if (GAME == GAME_SA1)
// TODO: move to super sonic
void sub_804A8A8(s32 qX, s32 qY, s32 param2);
#endif

void Player_DisableInputAndBossTimer(void);
void Player_DisableInputAndBossTimer_FinalBoss(void);

#if (GAME == GAME_SA1)
void Player_8043DDC(Player *p); // SA1 addr
bool32 Player_8044250(Player *p); // SA1 addr
void Player_8044670(Player *p); // SA1 addr
void Player_8044750(Player *p);
void Player_8044F7C(Player *p); // SA1 addr
void Player_80470AC(Player *p); // SA1 addr
void sub_80472B8(Player *p); // SA1 addr
void Player_804726C(Player *p); // SA1 addr
void Player_8047224(Player *p); // SA1 addr
void Player_8047280(Player *p); // SA1 addr
void sub_8047714(Player *p); // SA1 addr
#endif

void Player_UpdatePosition(Player *p);
void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p);

// NOTE: Proc type should be the same as SetStageSpawnPosInternal!
void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *player);
void CallSetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p);

#if (GAME == GAME_SA1)
// Task -> (MultiplayerSpriteTask *)
Task *Player_Tails_InitGfxMarbleTrack(Player *p);
#endif

void SA2_LABEL(sub_8021BE0)(Player *p);
s32 SA2_LABEL(sub_8029B88)(Player *player, u8 *p1, s32 *out);
s32 SA2_LABEL(sub_8029AC0)(Player *player, u8 *p1, s32 *out);
s32 SA2_LABEL(sub_8029B0C)(Player *player, u8 *p1, s32 *out);

type8029A28 SA2_LABEL(sub_8029A28)(Player *player, u8 *p1, type8029A28 *out);
type8029A28 SA2_LABEL(sub_8029A74)(Player *player, u8 *p1, type8029A28 *out);

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
