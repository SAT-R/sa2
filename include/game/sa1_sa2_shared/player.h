#ifndef GUARD_SAKIT_PLAYER_H
#define GUARD_SAKIT_PLAYER_H

#include "core.h"
#include "constants/move_states.h"

#define PLAYER_IS_ALIVE  (!(gPlayer.moveState & MOVESTATE_DEAD))
#define IS_ALIVE(player) (!(player->moveState & MOVESTATE_DEAD))

typedef struct {
    /*0x00 */ SpriteTransform transform;
    /*0x0C */ Sprite s;
    /*0x3C */ Hitbox reserved; // TODO: Maybe 3 hitboxes (Player, Action, Shield)?
} PlayerSpriteInfo; /* size: 0x44 */

extern PlayerSpriteInfo gPlayerLimbsPSI;
extern PlayerSpriteInfo gPlayerBodyPSI;

// TODO: Better name.
//       This is used for an apparent around the value Cream uses for flying duration
typedef struct {
    /* 0xAC */ u8 flags;
    /* 0xAD */ s8 unkAD;
    /* 0xAE */ u16 unkAE;
    /* 0xB0 */ u16 unkB0;
} SonicFlags;

typedef struct {
    /* 0xAC */ s16 flyingDuration;
    /* 0xAE */ u16 unkAE;
    /* 0xB0 */ s8 unkB0;
} CreamFlags;

typedef struct {
    /* 0xAC */ u8 flags;
    /* 0xAD */ s8 shift;
    /* 0xAE */ s8 unkAE;
    /* 0xAF */ s8 unkAF;

    // NOTE: For some reason this is a 4-byte value, while Cream's is a 2-byte
    /* 0xB0 */ s32 flyingDuration;
} TailsFlags;

typedef struct {
    /* 0xAC */ u8 flags;
    /* 0xAD */ s8 shift; // TODO: Name
    /* 0xAE */ s8 unkAE;
} KnucklesFlags;

typedef struct {
    /* 0xAC */ u8 unkAC;
} AmyFlags;

#define PLAYER_ITEM_EFFECT__NONE            0x00
#define PLAYER_ITEM_EFFECT__SHIELD_NORMAL   0x01
#define PLAYER_ITEM_EFFECT__INVINCIBILITY   0x02
#define PLAYER_ITEM_EFFECT__SPEED_UP        0x04
#define PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC 0x08
#define PLAYER_ITEM_EFFECT__MP_SLOW_DOWN    0x10
#define PLAYER_ITEM_EFFECT__20              0x20
#define PLAYER_ITEM_EFFECT__CONFUSION       0x40
#define PLAYER_ITEM_EFFECT__TELEPORT        0x80

#define HAS_SHIELD(p) ((p)->itemEffect & (PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL))

#define PLAYER_LAYER__FRONT 0x00
#define PLAYER_LAYER__BACK  0x01
#define PLAYER_LAYER__MASK  0x01
#define PLAYER_LAYER__80    0x80

#define PLAYER_1 0
#define PLAYER_2 1
#define PLAYER_3 2
#define PLAYER_4 3

#if (GAME == GAME_SA1)
#define GET_SP_PLAYER_V0(index) ((index == 0) ? &gPlayer : &gPartner)
#define GET_SP_PLAYER_V1(index) ((index != 0) ? &gPartner : &gPlayer)
#elif (GAME == GAME_SA2)
// NOTE: Ignores index, in SA2 you only ever have 1 player char in single player mode
#define GET_SP_PLAYER_V0(index) (&gPlayer)
#define GET_SP_PLAYER_V1(index) (&gPlayer)
#elif (GAME == GAME_SA3)
#define GET_SP_PLAYER_V0(index) ((index == PLAYER_1) ? &gPlayers[gStageData.playerIndex] : &gPlayers[p->charFlags.partnerIndex])
#define GET_SP_PLAYER_V1(index) ((index != PLAYER_1) ? &gPlayers[p->charFlags.partnerIndex] : &gPlayers[gStageData.playerIndex])
#endif

// Declared beforehand because it's used inside Player struct
struct Player_;
typedef void (*PlayerCallback)(struct Player_ *);

typedef struct Player_ {
    /* 0x00 */ PlayerCallback callback;
    /* 0x04 */ u16 unk4;

    /* 0x08 */ s32 qWorldX;
    /* 0x0C */ s32 qWorldY;

    /* 0x10 */ s16 qSpeedAirX;
    /* 0x12 */ s16 qSpeedAirY;
    /* 0x14 */ s16 qSpeedGround;

    // The player sprite's position is actually at the middle of its graphics,
    // this offset denotes the difference to the ground.
    /* 0x16 */ s8 spriteOffsetX;
    /* 0x17 */ s8 spriteOffsetY;
    /* 0x18 */ u8 filler18[8];

    // set/compare to values in "include/constants/move_states.h"
    /* 0x20 */ u32 moveState;

    /* 0x24 */ u8 rotation;
    /* 0x25 */ u8 unk25;
    /* 0x26 */ s16 spindashAccel;
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 unk29;
    /* 0x2A */ s16 unk2A;
    /* 0x2C */ s16 timerInvulnerability;
    /* 0x2E */ s16 timerInvincibility;
    /* 0x30 */ u16 timerSpeedup;
    /* 0x32 */ u16 confusionTimer;
    /* 0x34 */ u16 itemEffect20Timer;
    /* 0x36 */ s8 disableTrickTimer;
    /* 0x37 */ u8 itemEffect; // bitfield
    /* 0x38 */ u8 layer; // bitfield(?), 0x1 determines layer
    /* 0x3C */ void *stoodObj; // the object player collides with this frame?
    /* 0x40 */ s32 maxSpeed; // top speed the player can go period
    /* 0x44 */ s32 topSpeed; // top speed the player can accelerate to
    /* 0x48 */ s32 acceleration;
    /* 0x4C */ s32 deceleration;
    /* 0x50 */ u16 rollingDeceleration;
    /* 0x52 */ u16 boostThreshold;
    /* 0x54 */ u16 walkAnim;
    /* 0x56 */ u16 unk56;
    /* 0x58 */ s16 boostSpeed;
    /* 0x5A */ bool8 isBoosting;
    /* 0x5B */ u8 trickDir;
    /* 0x5C */ u16 heldInput;
    /* 0x5E */ u16 frameInput;
    /* 0x60 */ s8 playerID;
    /* 0x61 */ s8 unk61;
    /* 0x62 */ u8 unk62;
    /* 0x63 */ u8 unk63;
    /* 0x64 */ s16 charState; // charState values appear to be a default behavior to transition into another animation
    /* 0x66 */ s16 prevCharState;
    /* 0x68 */ AnimId anim;
    /* 0x6A */ u16 variant;
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
    // unk72 appears to be a duration timer for side-forward trick animations + Homing Attack
    /* 0x72 */ s16 unk72;
    /* 0x74 */ s16 checkPointX;
    /* 0x76 */ s16 checkPointY;
    /* 0x78 */ u32 checkpointTime;
    /* 0x7C */ u16 unk7C;
    /* 0x7E */ u16 unk7E;
    /* 0x80 */ s16 unk80;
    /* 0x82 */ s16 unk82;

    // Denotes how many points the player should get after defeating an enemy.
    // (see stage/enemy_defeat_score.c and stage/entity_manager.c for usage)
    /* 0x84 */ s8 defeatScoreIndex;

    /* 0x85 */ s8 character;
    /* 0x86 */ s8 secondsUntilDrown;
    /* 0x87 */ s8 framesUntilDrownCountDecrement;
    /* 0x88 */ s8 unk88;
    /* 0x88 */ u8 filler88[3];
    /* 0x8C */ struct Task *spriteTask;
    /* 0x90 */ PlayerSpriteInfo *spriteInfoBody; // for character sprites
    /* 0x94 */ PlayerSpriteInfo *spriteInfoLimbs; // SpriteInfo for Tails' tails / Cream's ears, when rolling
#if PORTABLE
    // NOTE: There's a copy in player.c's 'InitializePlayer' that
    //       copies via a (u32 *) to unk99.
    //
    //       Since it is offset originally, platforms only writing words
    //       aligned (or crash when trying to write to an odd pointer) will
    //       not have the memory initialized properly.
    //
    //       Ironically this is a non-crashing bug on GBA as well.
    /* 0x99 */ s8 unk99[16];
    /* 0x98 */ u8 unk98; // Multiplayer var. TODO: check sign!
#else
    /* 0x98 */ u8 unk98; // Multiplayer var. TODO: check sign!
    /* 0x99 */ s8 unk99[16];
#endif
    /* 0x9A */ u8 fillerA9[0x3];

    // Cream's framecounter for flying
    // TODO/HACK: I guess this is actually part of a union per character?
    //            When the player selected Tails, player->unk6D is actually some x-offset
    //            when jumping.
    /* 0xAC */
    union {
        SonicFlags sf;
        CreamFlags cf;
        TailsFlags tf;
        KnucklesFlags kf;
        AmyFlags af;
    } w;
} Player;

extern Player gPlayer;

// TODO: fill

#endif // GUARD_SAKIT_PLAYER_H
