#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER    0
#define GAME_MODE_TIME_ATTACK      1
#define GAME_MODE_BOSS_TIME_ATTACK 2

#define GAME_MODE_MULTI_PLAYER               3
#define GAME_MODE_TEAM_PLAY                  4
#define GAME_MODE_MULTI_PLAYER_COLLECT_RINGS 5

#include "global.h"
#include "sprite.h"
#include "multi_sio.h"
#include "task.h"

#include "constants/move_states.h"

#define ZONE_TIME_TO_INT(minutes, seconds)                                              \
    (((minutes * 60) + seconds) * GBA_FRAMES_PER_SECOND)
#define MAX_COURSE_TIME (ZONE_TIME_TO_INT(10, 0))

#define TIME_RECORDS_PER_COURSE 3
#define NUM_MULTIPLAYER_SCORES  10

#define MAX_PLAYER_NAME_LENGTH 6
#define MAX_MULTIPLAYER_SCORE  99

#define CHARACTER_SONIC    0
#define CHARACTER_CREAM    1
#define CHARACTER_TAILS    2
#define CHARACTER_KNUCKLES 3
#define CHARACTER_AMY      4

#define NUM_CHARACTERS 5

#define CHARACTER_BIT(character) (1 << (character))

#define MAIN_CHARACTERS                                                                 \
    (CHARACTER_BIT(CHARACTER_SONIC) | CHARACTER_BIT(CHARACTER_CREAM)                    \
     | CHARACTER_BIT(CHARACTER_TAILS) | CHARACTER_BIT(CHARACTER_KNUCKLES))

struct ButtonConfig {
    u16 jump;
    u16 attack;
    u16 trick;
};

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

#define IS_SINGLE_PLAYER                                                                \
    ((gGameMode == GAME_MODE_SINGLE_PLAYER) || (gGameMode == GAME_MODE_TIME_ATTACK)     \
     || (gGameMode == GAME_MODE_BOSS_TIME_ATTACK))

#define IS_MULTI_PLAYER (!(IS_SINGLE_PLAYER))

extern s8 gCurrentLevel;
extern s8 gSelectedCharacter;

extern u8 gMultiplayerLanguage;
extern struct Task *gUnknown_030059D8;
extern struct Task *gGameStageTask;

typedef struct {
    s8 unk0;
    u8 filler1[3];
    struct Task *t;
} UNK_30059D0;

extern UNK_30059D0 gUnknown_030059D0;

// Sometimes loaded as s16, but as u16 most of the time.
// If you encounter it being loaded as s16, please cast it.
extern u16 gRingCount;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u16 unk6;
} UNK_30054A8; /* size: 8 */

extern UNK_30054A8 gUnknown_030054A8;
extern u32 gCourseTime;

// Collected Special Rings in current stage?
extern u8 gSpecialRingCount;

// TODO: Types not checked yet!
extern s32 gUnknown_030054E0;
extern s32 gUnknown_030054FC;

extern u16 gUnknown_03005440;
extern u16 gUnknown_030054BC;
extern u8 gRandomItemBox;
extern u8 gUnknown_030053E0;

// Copies of BG control regs for Multiplayer(?)
typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
} MultiPlayerBgCtrlRegs; /* size: 8 */
extern MultiPlayerBgCtrlRegs *gUnknown_03005840;

typedef struct {
    /*0x00 */ u16 unk0[6]; // might be [5]
    /*0x0C */ Sprite s;
    /*0x3C */ Hitbox reserved;
} UNK_3005A70; /* 0x30 */

extern UNK_3005A70 gUnknown_03005AA0;
extern UNK_3005A70 gUnknown_03005AF0;

extern u8 gUnknown_0300543C;

extern struct Task *gEntitesManagerTask;
extern u8 gSmallAirBubbleCount;

extern u8 gUnknown_030054E4;

#define EXTRA_STATE__CLEAR              0x0000
#define EXTRA_STATE__ACT_START          0x0001 // Turns timer off, likely other effects?
#define EXTRA_STATE__2                  0x0002
#define EXTRA_STATE__4                  0x0004
#define EXTRA_STATE__10                 0x0010
#define EXTRA_STATE__DISABLE_PAUSE_MENU 0x0020
#define EXTRA_STATE__DEMO_RUNNING       0x0040 // TODO: Check accuracy of name
#define EXTRA_STATE__GRAVITY_INVERTED   0x0080
#define EXTRA_STATE__100                0x0100 // Set during stage's "loading screen"
#define EXTRA_STATE__TURN_OFF_TIMER     0x0200
#define EXTRA_STATE__TURN_OFF_HUD       0x0400
// "Extra State" (see above #defines for states)
// TODO: Find better name. Put somewhere else?
extern u16 gUnknown_03005424;
extern u16 gUnknown_0300544C;

#define DIFFICULTY_NORMAL 0
#define DIFFICULTY_EASY   1
extern u8 gDifficultyLevel;

extern s8 gTrappedAnimalVariant;

extern u8
    gUnknown_030055B0; // TODO: Boss ID in XX-Stage? But it's used in checkpointc.c ...
extern u8 gUnknown_030054F8;

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;

    // Following here might be a Sprite (incl. unk4C-unk53)?
    /* 0x08 */ u8 filler8[0x34];
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s8 unk50;
    /* 0x51 */ s8 unk51;
    /* 0x52 */ s8 unk52;
    /* 0x53 */ s8 unk53;
} UNK_30056A4; /* size: unknown */
extern UNK_30056A4 *gUnknown_030056A4; // might be a Task* ?

// Incremented by 1 every frame if the game is not paused.
extern u32 gStageTime;

extern u32 gUnknown_030054A0;

extern u32 gCheckpointTime; // Checkpoint timer?

extern u8 gUnknown_03005438;
extern u8 gUnknown_030055BC;

struct MultiplayerPlayer {
    // TODO: Verify that this is Sprite!
    //       (Used in Task_Item_Invincibility @ 0x0802AC60)
    Sprite s;

    u8 filler[0x20];
    // x
    s16 unk50;
    s16 unk52;
    u16 unk54;
    u8 unk56;
    u8 unk57;
    u8 unk58[4];
    u32 unk5C;
};

extern struct Task *gMultiplayerPlayerTasks[4];
extern s8 gMultiplayerCharacters[4];
extern s8 gUnknown_030054B4[4];
extern u8 gUnknown_030054B8;

extern u8 gMultiplayerMissingHeartbeats[4];

// Some sort of unused task variable
extern struct Task *gUnknown_03005844;

// Declared beforehand because it's used inside Player struct
struct Player_;
typedef void (*PlayerCallback)(struct Player_ *);

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

#define PLAYER_ITEM_EFFECT__NONE            0x00
#define PLAYER_ITEM_EFFECT__SHIELD_NORMAL   0x01
#define PLAYER_ITEM_EFFECT__INVINCIBILITY   0x02
#define PLAYER_ITEM_EFFECT__SPEED_UP        0x04
#define PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC 0x08
#define PLAYER_ITEM_EFFECT__10              0x10
#define PLAYER_ITEM_EFFECT__20              0x20
#define PLAYER_ITEM_EFFECT__40              0x40
#define PLAYER_ITEM_EFFECT__80              0x80
#define FLAG_PLAYER_x38__LAYER_FOREGROUND   0x00
#define FLAG_PLAYER_x38__LAYER_BACKGROUND   0x01
#define FLAG_PLAYER_x38__80                 0x80
// Not sure what these are yet
typedef struct Player_ {
    /* 0x00 */ PlayerCallback callback;
    /* 0x04 */ u32 filler4;

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
    /* 0x28 */ u8 unk29;
    /* 0x2A */ s16 unk2A;
    /* 0x2C */ s16 unk2C;
    /* 0x2E */ u16 timerInvincibility;
    /* 0x30 */ u16 timerSpeedup;
    /* 0x32 */ u16 unk32;
    /* 0x34 */ u8 filler34[2];
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
    /* 0x56 */ u8 filler56[0x2];
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
    /* 0x90 */ UNK_3005A70 *unk90;

    // TODO: Only used for Cream/Tails?
    //       Alternatively, some of the following data might be a union
    /* 0x94 */ UNK_3005A70 *unk94;
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

struct UNK_80D62D8 {
    u8 unk0[28];
    u32 unk1C;
    u32 unk20;
    u8 unk24[12];
};

typedef void (*CameraMain)(s32, s32);

#define CAM_MODE_SPECTATOR 4

struct Camera {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 shiftX;
    /* 0x1C */ s32 shiftY;
    /* 0x20 */ s32 unk20;
    /* 0x24 */ s32 unk24;
    /* 0x28 */ s32 unk28;
    /* 0x2c */ s32 unk2C;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
    /* 0x38 */ s32 unk38;
    /* 0x3c */ s32 unk3C;
    /* 0x40 */ s16 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4c */ s32 unk4C;

    // 0x4 = spectator
    // mode
    /* 0x50 */ u16 unk50;

    /* 0x52 */ u16 unk52;
    /* 0x54 */ u16 unk54;
    /* 0x56 */ s16 unk56;
    /* 0x58 */ CameraMain unk58;
    /* 0x5C */ struct Task *movementTask;
    /* 0x60 */ s16 unk60;
    /* 0x62 */ s16 unk62;
    /* 0x64 */ s16 unk64;
    /* 0x66 */ u8 spectatorTarget;
}; /* size 0x80 */

extern struct Camera gCamera;

#define PLAYER_IS_ALIVE     (!(gPlayer.moveState & MOVESTATE_DEAD))
#define IS_ALIVE(player)    (!(player->moveState & MOVESTATE_DEAD))
#define GRAVITY_IS_INVERTED (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)

#define TILE_WIDTH       8
#define CAM_REGION_WIDTH 256

#define TO_WORLD_POS(pos, region) ((pos)*TILE_WIDTH + (region)*CAM_REGION_WIDTH)

#define CAM_BOUND_X ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH))
#define CAM_BOUND_Y ((DISPLAY_HEIGHT) + ((CAM_REGION_WIDTH) / 2))

// TODO: Merge all these into one!
#define IS_OUT_OF_RANGE_2(x, y, radiusX, radiusY)                                       \
    ((x < -(radiusX)) || (x > DISPLAY_WIDTH + (radiusX)) || (y < -(radiusY))            \
     || (y > DISPLAY_HEIGHT + (radiusY)))

// No idea on this one
#define IS_OUT_OF_RANGE_3(x, y, radiusX, radiusY)                                       \
    ((x < -(radiusX)) || (x > DISPLAY_WIDTH + (radiusX)) || ((y) + (radiusY) < 0)       \
     || (y > DISPLAY_HEIGHT + (radiusY)))

// TODO: Merge all these into one!
#define IS_OUT_OF_RANGE_(UNUSED, x, y, radius) IS_OUT_OF_RANGE_2(x, y, radius, radius)

#define IS_OUT_OF_RANGE_OLD(castType, x, y, dim)                                        \
    (((castType)(x + (dim / 2)) > DISPLAY_WIDTH + dim) || (y + (dim / 2) < 0)           \
     || (y > DISPLAY_HEIGHT + (dim / 2)))

#define IS_OUT_OF_RANGE IS_OUT_OF_RANGE_OLD

// @NOTE/INVESTIGATE: Some places match with u16, some with u32,
// but u16 is more common, so it's the default.
#define IS_OUT_OF_CAM_RANGE(_x, _y) IS_OUT_OF_RANGE(u16, _x, _y, CAM_REGION_WIDTH)
#define IS_OUT_OF_CAM_RANGE_TYPED(castType, _x, _y)                                     \
    IS_OUT_OF_RANGE(castType, _x, _y, CAM_REGION_WIDTH)

#define IS_OUT_OF_DISPLAY_RANGE(_x, _y)                                                 \
    ((_x) > gCamera.x + (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))                        \
     || (_x) < gCamera.x - (CAM_REGION_WIDTH / 2) || (_y) > gCamera.y + CAM_BOUND_Y     \
     || (_y) < gCamera.y - (CAM_REGION_WIDTH / 2))

// TODO: Remove macro and replace calls of it with 'IS_OUT_OF_RANGE' once rewritten.
#define IS_OUT_OF_GRAV_TRIGGER_RANGE(x, y)                                              \
    IS_OUT_OF_RANGE_(u16, x, y, (CAM_REGION_WIDTH / 2))

#define IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)                                              \
    IS_OUT_OF_RANGE_3(x, y, (CAM_REGION_WIDTH / 2), (CAM_REGION_WIDTH / 2))

typedef struct {
    /* 0x00 */ s32 someDistanceSquared;
    /* 0x04 */ struct Task *t;
} SomeStruct_3005498; /* size: unknown (but >= 0x8) */
extern SomeStruct_3005498 gUnknown_03005498;

typedef struct {
    u16 pal[16 * 16];
} WaterData;

// Seems to be belonging to water effect
typedef struct {
    /* 0x00 */ bool8 isActive;
    /* 0x01 */ u8 unk1;
    /* 0x01 */ u8 unk2;
    /* 0x01 */ u8 unk3;
    /* 0x04 */ s16 currentWaterLevel;
    /* 0x06 */ s16 targetWaterLevel;
    /* 0x08 */ u32 unk8;
    /* 0x0C */ u32 mask;

    // t -> u16 palette[16*16] (additional "palette memory" for GUI stuff?)
    /* 0x10 */ struct Task *t; /* size: 0x400 */
    /* 0x14 */ Sprite s;
} Water;

extern Water gWater;

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerUnlockedLevels;
extern u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX];
extern u16 gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

extern u32 gMultiplayerPseudoRandom;

extern s32 gLevelScore;
extern u8 gNumLives;
extern u8 gUnknown_030054B0;

typedef struct {
    s32 unk0;
    u16 unk4;
} Struct_30054C0;
extern Struct_30054C0 gUnknown_030054C0;

extern u8 gMultiplayerConnections;

extern struct ButtonConfig gPlayerControls;

// Only set after the player passed it, used to determine extra score
extern s32 gStageGoalX;

// TODO: find out what task is parent to IA
typedef struct {
    u8 filler0[0x18];
    struct Task *unk18; // UNK_807C5F8
} UNK_807C5F8_Parent;

typedef struct {
    Sprite sprite1;
    Sprite sprite2;
    u16 unk60;
    u16 unk62;
} UNK_807C5F8;

extern u8 gUnknown_03005428[4];
extern u8 gUnknown_030053E8[4];

// Some Multiplayer struct
struct UNK_3005510 {
    u8 unk0;
    u8 unk1; // regionX (truncated)
    u8 unk2; // regionY (truncated)
    u8 unk3; // spriteY (truncated) as per sub_800EDF8
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
}; /* 0x8 */

// TODO: Move this into the module sub_8011C98 gets defined in, once it's decomped
typedef struct {
    /* 0x00 */ s32 px[5];
    /* 0x14 */ s32 py[5];
    /* 0x28 */ u16 unk28;
    /* 0x2C */ Sprite s;
} TaskStrc_8011C98; /* size: 0x5C */

typedef struct {
    s32 x;
    s32 y;
} TrickBoundPos;

extern void sub_80157C8(TrickBoundPos *pos, u8 index);

extern struct UNK_3005510 gUnknown_03005510[16];

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern struct Backgrounds gStageBackgroundsRam;
extern const u32 *gUnknown_030059C8;

// rodata
extern const AnimId gPlayerCharacterIdleAnims[NUM_CHARACTERS];

// Some unused rom thing?
extern const u8 gUnknown_08C88408[0x8000];

// Obj vram (only 0x5000 used)
extern const u8 gUnknown_08C90408[0x8000];

// Backgrounds?
extern const u8 gUnknown_08C92208[0x8000];

extern const u8 gUnknown_08CA6760[0x6A7C];
extern const u8 gUnknown_08CAD1DC[0x6fe4];
extern const u8 gUnknown_08CB41C0[0x6a44];

extern const u8 gUnknown_08CBAC04[];

// Possibly CreateGameStageAtSelectedCourse
void GameStageStart(void);

// TODO: Might need to be moved out of this header?
void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

void sub_802EFDC(u32);
void sub_802E164(s32, u16);

// ApplyGamePlaySettings
void ApplyGameStageSettings(void);

void CreateTrueArea53Intro(void);

void CreateGameStage(void);
// Sweep anim
void sub_802E044(s32, u16);

u16 CreateStageResults(u32, u16, u8);

void sub_8019F08(void);
struct Task *CreateStageGoalBonusPointsAnim(s32, s32, u16);
extern void Task_801F214(void);
void sub_801F550(struct Task *);

void sub_80218E4(Player *);
void sub_8023B5C(Player *, s8);
void sub_8023260(Player *);

// HandlePlayerDestroy?
extern bool32 sub_800C4FC(Sprite *, s32, s32, u8);

extern void sub_80122DC(s32, s32);

// HandleHitPlayer
extern u32 sub_800C84C(Sprite *, s32, s32);

typedef s32 (*Func801F100)(s32, s32, s32);
extern s32 sub_801EB44(s32, s32, s32);
extern s32 sub_801EC3C(s32, s32, s32);
extern s32 sub_801ED24(s32, s32, s32);
extern s32 sub_801EE64(s32, s32, s32);

// ground collision clamp functions
s32 sub_801E4E4(s32, s32, u32, s32, void *, Func801F100);
s32 sub_801E6D4(s32, s32, s32, s32, void *, Func801F100);
s32 sub_801F07C(s32, s32, s32, s32, void *, Func801F100);

s32 sub_801F100(s32, s32, s32, s32, Func801F100);

// TODO: Include header this belongs to
u32 sub_800C944(Sprite *, s32, s32);

// TODO: Include header this belongs to
bool32 sub_800CA20(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C320(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C418(Sprite *s, s32 x, s32 y, u16 p3, Player *p);

// Lose rings?
bool32 sub_800CBA4(Player *);

// TODO: Move this into the module sub_801F15C gets defined in, once it's decomped
typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ u8 fillerC[0x4];
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u16 unk12;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ AnimId playerAnim;
    /* 0x18 */ u16 playerVariant;
    /* 0x1A */ u8 unk1A;
    /* 0x1C */ Sprite s;
    /* 0x4C */ SpriteTransform transform;
} TaskStrc_801F15C; /* size: 0x58 */

extern struct Task *sub_801F15C(s16, s16, u16, s8, TaskMain, TaskDestructor);
extern void TaskDestructor_801F550(struct Task *);

extern void sub_801F78C(void);

extern void sub_802C668(s32 *x, s32 *y);

extern void sub_8021350(void);

// NOTE: Proc type should be the same as SetStageSpawnPosInternal!
extern void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *player);

#define INCREMENT_SCORE_A(incVal)                                                       \
    {                                                                                   \
        s32 divResA, divResB;                                                           \
        s32 oldScore = gLevelScore;                                                     \
        gLevelScore += incVal;                                                          \
                                                                                        \
        divResA = Div(gLevelScore, 50000);                                              \
        divResB = Div(oldScore, 50000);                                                 \
                                                                                        \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {           \
            u16 lives = divResA - divResB;                                              \
            lives += gNumLives;                                                         \
                                                                                        \
            gNumLives = ({                                                              \
                if (lives > 255)                                                        \
                    lives = 255;                                                        \
                lives;                                                                  \
            });                                                                         \
        }                                                                               \
    }

#define INCREMENT_SCORE(incVal)                                                         \
    {                                                                                   \
        s32 divResA, divResB;                                                           \
        s32 oldScore = gLevelScore;                                                     \
        gLevelScore += incVal;                                                          \
                                                                                        \
        divResA = Div(gLevelScore, 50000);                                              \
        divResB = Div(oldScore, 50000);                                                 \
                                                                                        \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {           \
            u16 lives = divResA - divResB;                                              \
            lives += gNumLives;                                                         \
                                                                                        \
            gNumLives = ({                                                              \
                if (lives > 255)                                                        \
                    lives = 255;                                                        \
                lives;                                                                  \
            });                                                                         \
                                                                                        \
            gUnknown_030054A8.unk3 = 16;                                                \
        }                                                                               \
    }

#endif // GUARD_GAME_H
