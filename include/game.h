#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER 0
#define GAME_MODE_TIME_ATTACK 1
#define GAME_MODE_BOSS_TIME_ATTACK 2

// May be multiplayer time attack
#define GAME_MODE_MULTI_PLAYER 3
#define GAME_MODE_TEAM_PLAY 4

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
extern s16 gUnknown_030053F0;
extern u8 gUnknown_030054A8;

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

// multiplayer values
extern struct Task* gUnknown_030055A0[4];
// gMultiplayerCharacters
extern s8 gMultiplayerCharacters[4];
extern s8 gUnknown_030054B4[4];
extern u8 gUnknown_030054B8;

// Time since heartbeat
extern u8 gUnknown_030054D4[4];

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
    s32 unk8;
    s32 unkC;
    u32 filler10;
    u16 unk14;
    u8 filler16[10];
    u32 unk20;
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
    u8 unk6D;
    u8 filler66[30];
    u32 unk8C;
    struct UNK_3005A70* unk90;
};

// gPlayer
extern struct SomeStruct_59E0 gUnknown_030059E0;

struct SomeStruct_5960 {
    u32 unk0;
    u32 unk4;
    u8 filler[92 - 8];
    u32 unk5C;
    u8 filler60[0x20];
}; /* size 0x80 */

extern struct SomeStruct_5960 gUnknown_03005960;

struct SomeStruct_5660 {
    u8 filler[16];
    u32 unk10;
};

extern struct SomeStruct_5660 gUnknown_03005660;

// gMultiplayerUnlockedCharacters
extern u8 gUnknown_03005594;
extern u8 gUnknown_030054D8;
extern u32 gUnknown_03005410[MULTI_SIO_PLAYERS_MAX];

// gMultiplayerNames
extern u16 gUnknown_03005460[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

extern u32 gUnknown_03005434;

// gMultiplayerConnections
extern u8 gUnknown_030055B8;

struct UNK_3005B38 {
    u16 unk0;
    u16 unk2;
};

extern struct UNK_3005B38 gUnknown_03005B38;

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

// CreateTrueArea53
void sub_8036C54(void);

// Sweep anim
void sub_802E044(u16, u16);

#endif // GUARD_GAME_H
