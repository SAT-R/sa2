#ifndef GUARD_SAKIT_PLAYER_H
#define GUARD_SAKIT_PLAYER_H

#include "core.h"
#include "constants/move_states.h"

#define PLAYER_IS_ALIVE  (!(gPlayer.moveState & MOVESTATE_DEAD))
#define IS_ALIVE(player) (!(player->moveState & MOVESTATE_DEAD))

typedef struct {
    /*0x00 */ u16 unk0[6]; // might be [5]
    /*0x0C */ Sprite s;
    /*0x3C */ Hitbox reserved;
} PlayerSpriteInfo; /* 0x30 */

extern PlayerSpriteInfo gUnknown_03005AA0;
extern PlayerSpriteInfo gUnknown_03005AF0;

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
    /* 0xAC */ u8 unkAC;
    /* 0xAD */ u8 unkAD;
    /* 0xAE */ u8 unkAE;
} KnucklesFlags;

typedef struct {
    /* 0xAC */ u8 unkAC;
} AmyFlags;

// Declared beforehand because it's used inside Player struct
struct Player_;
typedef void (*PlayerCallback)(struct Player_ *);

#define PLAYER_ITEM_EFFECT__NONE            0x00
#define PLAYER_ITEM_EFFECT__SHIELD_NORMAL   0x01
#define PLAYER_ITEM_EFFECT__INVINCIBILITY   0x02
#define PLAYER_ITEM_EFFECT__SPEED_UP        0x04
#define PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC 0x08
#define PLAYER_ITEM_EFFECT__10              0x10
#define PLAYER_ITEM_EFFECT__20              0x20

// Confusion
#define PLAYER_ITEM_EFFECT__40 0x40

// Teleport
#define PLAYER_ITEM_EFFECT__80 0x80

#define FLAG_PLAYER_x38__LAYER_FOREGROUND 0x00
#define FLAG_PLAYER_x38__LAYER_BACKGROUND 0x01
#define FLAG_PLAYER_x38__80               0x80

// Not sure what these are yet
typedef struct Player_ {
    /* 0x00 */ PlayerCallback callback;
    /* 0x04 */ u16 unk4;

    /* 0x08 */ s32 x;
    /* 0x0C */ s32 y;

    /* 0x10 */ s16 speedAirX; // Q_8_8
    /* 0x12 */ s16 speedAirY; // Q_8_8
    /* 0x14 */ s16 speedGroundX; // Q_8_8

    // The player sprite's position is actually at the middle of its graphics,
    // this offset denotes the difference to the ground.
    // spriteOffsetX
    /* 0x16 */ s8 unk16;
    // spriteOffsetY
    /* 0x17 */ s8 unk17;
    /* 0x18 */ u8 filler18[8];

    // set/compare to values in "include/constants/move_states.h"
    /* 0x20 */ u32 moveState;

    /* 0x24 */ u8 rotation;
    /* 0x25 */ u8 unk25;
    /* 0x26 */ s16 spindashAccel;
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 unk29;
    /* 0x2A */ s16 unk2A;
    /* 0x2C */ s16 unk2C;
    /* 0x2E */ u16 timerInvincibility;
    /* 0x30 */ u16 timerSpeedup;
    /* 0x32 */ u16 unk32;
    /* 0x34 */ u16 unk34;
    /* 0x36 */ s8 unk36;
    /* 0x37 */ u8 itemEffect; // bitfield
    /* 0x38 */ u8 unk38; // bitfield(?), 0x1 determines layer
    /* 0x39 */ u8 unk39;
    /* 0x3A */ u16 unk3A;
    /* 0x3C */ void *unk3C; // the object player collides with this frame?
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48; // acceleration?
    /* 0x4C */ s32 unk4C; // deceleration?
    /* 0x50 */ u16 unk50;
    /* 0x52 */ u16 unk52;
    /* 0x54 */ u16 unk54; // some other anim-variant?
    /* 0x56 */ u16 unk56;
    /* 0x58 */ s16 unk58;
    /* 0x5A */ bool8 unk5A; // boost?
    /* 0x5B */ u8 unk5B;
    /* 0x5C */ u16 unk5C; // input
    /* 0x5E */ u16 unk5E; // new input on this frame?
    /* 0x60 */ s8 unk60;
    /* 0x61 */ s8 unk61;
    /* 0x62 */ u8 unk62;
    /* 0x63 */ u8 unk63;
    /* 0x64 */ s16 unk64; // Character Anim? (TODO: shouldn't this be unsigned?)
    /* 0x66 */ s16 unk66; // Character Anim, too? But if these were cAnims, why do some
                          // procs recalculate them?
    /* 0x68 */ AnimId anim;
    /* 0x6A */ u16 variant;
    /* 0x6C */ u8 unk6C;
    // 0x6D Some player state, cleared after usage
    //  0x01 = PlayerCB_80124D0
    //  0x05 = Set by IA ClearPipe_End if data[1] is set (also in GermanFlute IA), by
    //  PlayerCB_80126B0

    // use constants/player_transitions.h
    /* 0x6D */ u8 transition;
    /* 0x6E */ u8 unk6E; // Parameter for transition(?)
    /* 0x6F */ u8 prevTransition;
    /* 0x70 */ u8 unk70;
    /* 0x71 */ u8 unk71;
    // unk72 appears to be a duration timer for side-forward trick animations (in
    // frames?)
    /* 0x72 */ s16 unk72;
    /* 0x74 */ s16 checkPointX;
    /* 0x76 */ s16 checkPointY;
    /* 0x78 */ u32 checkpointTime;
    /* 0x7C */ u16 unk7C;
    /* 0x7E */ u16 unk7E;
    /* 0x80 */ u16 unk80;
    /* 0x82 */ u16 unk82;

    // Denotes how many points the player should get after defeating an enemy.
    // (see stage/enemy_defeat_score.c and stage/entity_manager.c for usage)
    /* 0x84 */ s8 defeatScoreIndex;

    /* 0x85 */ s8 character;
    /* 0x86 */ u8 unk86;
    /* 0x87 */ u8 unk87;
    /* 0x88 */ u8 unk88;
    /* 0x88 */ u8 filler88[3];
    /* 0x8C */ struct Task *spriteTask;
    /* 0x90 */ PlayerSpriteInfo *unk90;

    // TODO: Only used for Cream/Tails?
    //       Alternatively, some of the following data might be a union
    /* 0x94 */ PlayerSpriteInfo *unk94;
    /* 0x98 */ u8 unk98; // Multiplayer var. TODO: check sign!
    /* 0x99 */ s8 unk99[15];
    /* 0xA8 */ u8 unkA8;
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
