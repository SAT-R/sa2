#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER    0
#define GAME_MODE_TIME_ATTACK      1
#define GAME_MODE_BOSS_TIME_ATTACK 2
#define GAME_MODE_IS_SINGLE_PLAYER(mode)                                                \
    (((mode) == GAME_MODE_SINGLE_PLAYER) || ((mode) == GAME_MODE_TIME_ATTACK)           \
     || ((mode) == GAME_MODE_BOSS_TIME_ATTACK))

// May be multiplayer time attack
#define GAME_MODE_MULTI_PLAYER               3
#define GAME_MODE_TEAM_PLAY                  4
#define GAME_MODE_MULTI_PLAYER_COLLECT_RINGS 5

#include "global.h"
#include "sprite.h"
#include "multi_sio.h"
#include "save.h"
#include "task.h"

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

extern s8 gCurrentLevel;
extern s8 gSelectedCharacter;

extern u8 gMultiplayerLanguage;
extern u32 gUnknown_030059D8;
extern struct Task *gGameStageTask;
extern u32 gUnknown_030059D0[2];

// might be wrong
extern s16 gRingCount;

extern u8 gUnknown_030054A8[8];
extern u32 gUnknown_03005490;
extern u8 gUnknown_030054F4;
extern u16 gUnknown_03005440;
extern u16 gUnknown_030054BC;
extern u8 gUnknown_030054E8;
extern u8 gUnknown_030053E0;

struct UNK_3005A44 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
};
extern struct UNK_3005A44 gUnknown_03005A44;

typedef struct {
    u8 filler0[0x22];
    s16 unk22;
    s16 unk24;
} UNK_03005A70; /* 0x30 */

typedef struct {
    UNK_03005A70 *unk0;
} UNK_03005A70_Wrapper;

extern UNK_03005A70_Wrapper gUnknown_03005A70;

extern u8 gUnknown_0300543C;

extern u32 gUnknown_030054DC;
extern u8 gUnknown_03005B34;

extern u8 gUnknown_030054E4;

#define EXTRA_STATE__CLEAR              0x0000
#define EXTRA_STATE__ACT_START          0x0001 // Turns timer off, likely other effects?
#define EXTRA_STATE__DISABLE_PAUSE_MENU 0x0020
#define EXTRA_STATE__GRAVITY_INVERTED   0x0080
#define EXTRA_STATE__100                0x0100 // Set during stage's "loading screen"
#define EXTRA_STATE__TURN_OFF_TIMER     0x0200
#define EXTRA_STATE__TURN_OFF_HUD       0x0400
// "Extra State" (see above #defines for states)
// TODO: Find better name. Put somewhere else?
extern u16 gUnknown_03005424;
extern u16 gUnknown_0300544C;

extern u8 gUnknown_030054EC;

extern u8 gUnknown_03005444;

extern u8 gUnknown_030055B0;
extern u8 gUnknown_030054F8;

typedef struct {
    s32 posX;
    s32 posY;
} UNK_30056A4; /* size: unknown */
extern UNK_30056A4 *gUnknown_030056A4;
extern u32 gUnknown_03005590;

extern u32 gUnknown_030054A0;

extern u32 gUnknown_030053E4; // Checkpoint timer?

extern u8 gUnknown_0300540C;

extern u8 gUnknown_03005430;
extern u8 gUnknown_0300542C;
extern u8 gUnknown_030055BC;

struct MultiplayerPlayer {
    u8 filler[0x50];
    // x
    s16 unk50;
};

extern struct Task *gMultiplayerPlayerTasks[4];
extern s8 gMultiplayerCharacters[4];
extern s8 gUnknown_030054B4[4];
extern u8 gUnknown_030054B8;

extern u8 gMultiplayerMissingHeartbeats[4];

// Some sort of unused task variable
extern struct Task *gUnknown_03005844;

// Maybe .unk1C is a bitfield, not flags?
#define FLAG_3005A70_x1C__1000 0x1000
#define FLAG_3005A70_x1C__2000 0x2000
struct UNK_3005A70 {
    /* 0x00 */ u8 filler0[0x1C];
    /* 0x1C */ u32 unk1C;
    /* 0x20 */ u8 filler20[0x10];
    /* 0x30 */ u8 filler30;
    /* 0x31 */ u8 unk31;
};

#define FLAG_PLAYER_x38__LAYER_FOREGROUND 0x00
#define FLAG_PLAYER_x38__LAYER_BACKGROUND 0x01
// Not sure what these are yet
typedef struct {
    /* 0x00 */ u32 filler0;
    /* 0x04 */ u32 filler4;

    /* 0x08 */ s32 x;
    /* 0x0C */ s32 y;

    /* 0x10 */ s16 speedAirX;
    /* 0x12 */ s16 speedAirY;
    /* 0x14 */ s16 speedGroundX;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ s8 unk17;
    /* 0x18 */ u8 filler18[8];
    /* 0x20 */ u32
        moveState; // set/compare to values in "include/constants/move_states.h"
    /* 0x24 */ u8 unk24;
    /* 0x25 */ u8 filler25[7];
    /* 0x2C */ s16 unk2C;
    /* 0x2E */ u8 filler2E[2];
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 filler32[4];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
    /* 0x38 */ u8 unk38; // bitfield(?), 0x1 determines layer
    /* 0x39 */ u8 unk39;
    /* 0x3A */ u8 filler3A[2];
    /* 0x3C */ void *unk3C; // the object player collides with this frame?
    /* 0x40 */ u8 filler40[0x1A];
    /* 0x5A */ u8 unk5A;
    /* 0x5B */ u8 unk5B;
    /* 0x5C */ u16 unk5C;
    /* 0x5E */ u16 unk5E; // input ?
    /* 0x61 */ u8 unk60;
    /* 0x61 */ s8 unk61;
    /* 0x62 */ u8 unk62;
    /* 0x63 */ u8 unk63;
    /* 0x64 */ s16 unk64;
    /* 0x66 */ u16 unk66;
    /* 0x68 */ u16 unk68; // anim?
    /* 0x6A */ u16 unk6A; // variant?
    /* 0x6C */ u8 unk6C;
    /* 0x6D Some player state, cleared after usage
     *  0x05 = Set by IA ClearPipe_End if data[1] is set
     *  0x0A = Player cleared the stage (only for Acts, not Bosses?)
     *  0x0E = Hit an up-spring
     *  0x16 = Set in IA Ramp
     *  0x17 = Used in Interactable 044
     *  0x18 = Dash Ring
     *  0x1C = Set by IA ClearPipe_End if data[1] is 0
     * */
    /* 0x6D */ u8 unk6D;
    /* 0x6E */ u8 unk6E; // Parameter for 0x6D-state(?)
    /* 0x6F */ u8 filler6F[3];
    /* 0x72 */ u16 unk72;
    /* 0x74 */ u16 checkPointX;
    /* 0x76 */ u16 checkPointY;
    /* 0x78 */ u32 checkpointTime;
    /* 0x7C */ u8 filler7C[8];
    /* 0x84 */ u8 filler84;
    /* 0x85 */ s8 unk85;
    /* 0x86 */ u8 filler86[6];
    /* 0x8C */ u32 unk8C;
    /* 0x90 */ struct UNK_3005A70 *unk90;
} Player;

extern Player gPlayer;

struct UNK_80D62D8 {
    u8 unk0[28];
    u32 unk1C;
    u32 unk20;
    u8 unk24[12];
};

typedef void (*CameraMain)(s32, s32);

struct Camera {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    s32 unk8;
    s32 unkC;
    s32 unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    s32 unk38;
    s32 unk3C;
    s16 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    /* 0x50 */ u16 unk50;
    u16 unk52;
    u16 unk54;
    s16 unk56;
    CameraMain unk58;
    /* 0x5C */ struct Task *unk5C;
    s16 unk60;
    s16 unk62;
    s16 unk64;
    u8 unk66;
}; /* size 0x80 */

extern struct Camera gCamera;

#define TILE_WIDTH       8
#define CAM_REGION_WIDTH 256
#define SpriteGetScreenPos(spritePos, regionPos)                                        \
    ((spritePos)*TILE_WIDTH + (regionPos)*CAM_REGION_WIDTH)

#define CAM_BOUND_X ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH))
#define CAM_BOUND_Y ((DISPLAY_HEIGHT) + ((CAM_REGION_WIDTH) / 2))

// TODO: Merge all these into one!
#define IS_OUT_OF_RANGE_(UNUSED, x, y, radius)                                          \
    ((x < -(radius)) || (x > DISPLAY_WIDTH + (radius)) || (y < -(radius))               \
     || (y > DISPLAY_HEIGHT + (radius)))

#define IS_OUT_OF_RANGE_OLD(castType, x, y, dim)                                        \
    (((castType)(x + (dim / 2)) > DISPLAY_WIDTH + dim) || (y + (dim / 2) < 0)           \
     || (y > DISPLAY_HEIGHT + (dim / 2)))

#define IS_OUT_OF_RANGE IS_OUT_OF_RANGE_OLD

// @NOTE/INVESTIGATE: Some places match with u16, some with u32,
// but u16 is more common, so it's the default.
#define IS_OUT_OF_CAM_RANGE(x, y) IS_OUT_OF_RANGE(u16, x, y, CAM_REGION_WIDTH)
#define IS_OUT_OF_CAM_RANGE_TYPED(castType, x, y)                                       \
    IS_OUT_OF_RANGE(castType, x, y, CAM_REGION_WIDTH)

// TODO: Remove macro and replace calls of it with 'IS_OUT_OF_RANGE' once rewritten.
#define IS_OUT_OF_GRAV_TRIGGER_RANGE(x, y)                                              \
    IS_OUT_OF_RANGE_(u16, x, y, (CAM_REGION_WIDTH / 2))

struct SomeStruct_5660 {
    u8 filler[16];
    u32 unk10;
};

extern struct SomeStruct_5660 gUnknown_03005660;

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerUnlockedLevels;
extern u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX];
extern u16 gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

extern u32 gUnknown_03005434;

extern u32 gUnknown_03005450;
extern u8 gNumLives;
extern u8 gUnknown_030054B0;

extern u8 gMultiplayerConnections;

extern struct ButtonConfig gPlayerControls;

extern u8 gUnknown_03005428[4];
extern u8 gUnknown_030053E8[4];

// rodata
extern const u16 gUnknown_080D672C[5];
extern const u16 gUnknown_080D713C[5][3];
extern const u16 gUnknown_080D715A[5][3];
extern const u16 gUnknown_080D7178[11][3];

// collect rings data
extern const u8 gUnknown_08C88408[0x8000];
extern const u8 gUnknown_08C90408[0x8000];
extern const u8 gUnknown_08C92208[0x8000];
extern const u8 gUnknown_08CA6760[0x6A7C];
extern const u8 gUnknown_08CAD1DC[0x6fe4];
extern const u8 gUnknown_08CB41C0[0x6a44];
extern const u8 gUnknown_08CBAC04[0x8000];
extern const u8 gUnknown_08CC2C04[0x8000];
extern const u8 gUnknown_08CCAC04[0x8900];

// Possibly CreateGameStageAtSelectedCourse
void GameStageStart(void);

void sub_802EFDC(u32);
void sub_802E164(u16, u16);

// ApplyGamePlaySettings
void ApplyGameStageSettings(void);

void CreateTrueArea53Intro(void);

void CreateGameStage(void);
// Sweep anim
void sub_802E044(u16, u16);

void sub_80304DC(u32, u16, u8);

#endif // GUARD_GAME_H
