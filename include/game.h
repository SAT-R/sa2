#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER 0
#define GAME_MODE_TIME_ATTACK 1

// May be multiplayer time attack
#define GAME_MODE_MULTI_PLAYER 3
#define GAME_MODE_TEAM_PLAY 4

#include "global.h"
#include "task.h"

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

extern u8 gCurrentLevel;
extern s8 gSelectedCharacter;

extern u32 gUnknown_030059D8;
extern u32 gUnknown_03005848;
extern u32 gUnknown_030059D0[2];
extern u8 gUnknown_0300543C;

extern u32 gUnknown_030054DC;
extern u8 gUnknown_03005B34;

extern u8 gUnknown_030054E4;
extern u16 gUnknown_03005424;
extern u16 gUnknown_0300544C;

// multiplayer values
extern u32 gUnknown_030055A0[4];
extern s8 gUnknown_03005500[4];
extern s8 gUnknown_030054B4[4];

// Time since heartbeat
extern u8 gUnknown_030054D4[4];

// Some sort of unused task variable
extern struct Task *gUnknown_03005844;

// Not sure what these are yet
struct SomeStruct_59E0 {
    u8 filler[140];
    u32 unkA8;
};

extern struct SomeStruct_59E0 gUnknown_030059E0;

struct SomeStruct_5960 {
    u8 filler[92];
    u32 unk5C;
};

extern struct SomeStruct_5960 gUnknown_03005960;

struct SomeStruct_5660 {
    u8 filler[16];
    u32 unk10;
};

extern struct SomeStruct_5660 gUnknown_03005660;

// Possibly CreateGameStageAtSelectedCourse
void sub_801A770(void);

#endif // GUARD_GAME_H
