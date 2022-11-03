#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"
#include "zones.h"
#include "player.h"
#include "time.h"

#define TIME_RECORDS_PER_COURSE 3
#define NUM_MULTIPLAYER_SCORES 10

#define MAX_PLAYER_NAME_LENGTH 6
#define PLAYER_NAME_END_CHAR 0xFFFF
#define MAX_MULTIPLAYER_SCORE 99

struct MultiplayerScore {
    // playerId
    u32 unk0;

    // playerName
    u16 unk4[MAX_PLAYER_NAME_LENGTH];

    // slotFilled
    bool8 unk10;

    // wins
    u8 unk11;
    
    // loses
    u8 unk12;

    // draws
    u8 unk13;
};

struct ButtonConfig {
    // jump
    u16 unk0;
    // attack
    u16 unk2;
    // trick
    u16 unk4;
};

struct TimeRecords {
    u16 table[NUM_CHARACTERS][NUM_COURSE_ZONES][ACTS_PER_ZONE][TIME_RECORDS_PER_COURSE];
};

#define NUM_TIME_RECORD_ROWS NUM_COURSE_ZONES * ACTS_PER_ZONE * NUM_CHARACTERS * TIME_RECORDS_PER_COURSE

struct SaveGame {
    u32 unk0;

    // difficultyLevel
    u8 unk4;

    // timeLimitEnabled
    bool8 unk5;
    
    // Language
    u8 unk6;

    // unlockedLevels
    u8 unk7[NUM_CHARACTERS];

    u8 unkC[5];

    // soundTestUnlocked
    bool8 unk11;

    // bossTimeAttackUnlocked
    bool8 unk12;

    // unlocked characters
    u8 unk13;

    // chaoGardenUnlocked
    bool8 unk14;
    
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;

    // extraZoneStatus
    u8 unk1A;
    
    u8 unk1B;

    // multiplayerWins
    u8 unk1C;
    // multiplayerLoses
    u8 unk1D;
    // multiplayerDraws
    u8 unk1E;

    u8 unk1F;

    // playerName
    u16 unk20[MAX_PLAYER_NAME_LENGTH];

    // buttonConfig
    struct ButtonConfig unk2C;

    // timeRecords
    struct TimeRecords unk34;

    // multiplayerScores
    struct MultiplayerScore unk2AC[NUM_MULTIPLAYER_SCORES];

    u32 unk374;
};

#define MULTIPLAYER_RESULT_WIN 0
#define MULTIPLAYER_RESULT_LOSS 1
#define MULTIPLAYER_RESULT_DRAW 2

extern struct SaveGame* gLoadedSaveGame;

void InsertMultiplayerProfile(u32 playerId, u16* name);
void RecordOwnMultiplayerResult(s16 result);
void RecordMultiplayerResult(u32 id, u16* name, s16 result);

void SaveInit(void);
bool16 SaveGameExists(void);
s16 NewSaveGame(void);
s16 LoadSaveGame(void);
void LoadCompletedSaveGame(void);
bool32 WriteSaveGame(void);

#endif
