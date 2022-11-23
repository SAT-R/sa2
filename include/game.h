#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER    0
#define GAME_MODE_TIME_ATTACK      1
#define GAME_MODE_BOSS_TIME_ATTACK 2

// May be multiplayer time attack
#define GAME_MODE_MULTI_PLAYER 3
#define GAME_MODE_TEAM_PLAY    4

#include "global.h"
#include "multi_sio.h"
#include "save.h"
#include "task.h"

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

extern s8 gCurrentLevel;
extern s8 gSelectedCharacter;

extern u8 gUnknown_030053EC;
extern u32 gUnknown_030059D8;
extern u32 gUnknown_03005848;
extern u32 gUnknown_030059D0[2];

// might be wrong
extern s16 gCourseTime;

extern u8 gUnknown_030054A8;
extern u32 gUnknown_03005490;
extern u8 gUnknown_030054F4;

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

extern u8 gUnknown_0300543C;

extern u32 gUnknown_030054DC;
extern u8 gUnknown_03005B34;

extern u8 gUnknown_030054E4;
extern u16 gUnknown_03005424;
extern u16 gUnknown_0300544C;

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

struct UNK_3005A70 {
    u8 unk0[0x31];
    u8 unk31;
};

// Not sure what these are yet
struct SomeStruct_59E0 {
    u32 filler0;
    u32 filler4;

    // x
    s32 unk8;
    // y
    s32 unkC;

    u32 filler10;
    u16 unk14;
    u8 filler16[10];
    u32 unk20; // moveState - set/compare to values in "include/constants/move_states.h"
    u8 unk24;
    u8 filler24[0x12];
    u8 unk37;
    u8 filler38[100 - 0x14 - 0x24 - 8];
    u16 unk5C;
    u8 filler5E[6];
    u16 unk64;
    u16 unk66;
    u16 unk68;
    u16 unk6A;
    u8 unk6C;
    /* 0x6D Some player state, cleared after usage
     *  0x0A = Player cleared the stage (only for Acts, not Bosses?)
     *  0x0E = Hit an up-spring
     * */
    u8 unk6D;
    // 0x6E = Parameter for 0x6D-state(?)
    u8 unk6E;
    u8 filler6F[29];
    u32 unk8C;
    struct UNK_3005A70 *unk90;
};

extern struct SomeStruct_59E0 gPlayer;


struct Camera {
    s32 unk0; // x
    s32 unk4; // y
    u8 filler[92 - 8];
    u32 unk5C;
    u8 filler60[0x20];
}; /* size 0x80 */

extern struct Camera gCamera;

#define TILE_WIDTH       8
#define CAM_REGION_WIDTH 256
#define SpriteGetScreenPos(spritePos, regionPos)                                        \
    ((spritePos)*TILE_WIDTH + (regionPos)*CAM_REGION_WIDTH)

#define CAM_BOUND_X ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH))
#define CAM_BOUND_Y ((DISPLAY_HEIGHT) + ((CAM_REGION_WIDTH) / 2))

// NOTE(Jace): The u16-cast is u32 in SA3(?)
#define IS_OUT_OF_RANGE(x, y, dim)                                                      \
    (((u16)(x + (dim / 2)) > DISPLAY_WIDTH + dim) || (y + (dim / 2) < 0)                \
     || (y > DISPLAY_HEIGHT + (dim / 2)))

#define IS_OUT_OF_CAM_RANGE(x, y) IS_OUT_OF_RANGE(x, y, CAM_REGION_WIDTH)


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
extern u8 gUnknown_03005448;

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

#define IsMultiplayer() (gGameMode >= GAME_MODE_MULTI_PLAYER)

// Possibly CreateGameStageAtSelectedCourse
void sub_801A770(void);

void sub_802EFDC(u32);
void sub_802E164(u16, u16);

// ApplyGamePlaySettings
void sub_801A6D8(void);

void CreateTrueArea53(void);

// Sweep anim
void sub_802E044(u16, u16);

#endif // GUARD_GAME_H
