#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"
#include "game/globals.h"

#include "constants/zones.h"
#include "constants/sa1/characters.h"

#define PLAYER_NAME_END_CHAR 0xFFFF

#define NUM_MULTIPLAYER_SCORES 10
#define MAX_MULTIPLAYER_SCORE  99

#define TIME_RECORDS_PER_COURSE 3

typedef u8 PlayerNameChar;
typedef u32 TimeRecord;

struct TimeRecords {
    TimeRecord table[NUM_CHARACTERS][NUM_LEVEL_IDS][TIME_RECORDS_PER_COURSE];
};

// This is split off because of some code accessing the data as an array.
// Modern compilers don't like that (for good reason!)
typedef struct MultiplayerScoreDataSplit {
    // TODO/NOTE: Only 6 chars are displayed, but the string is treated 8-char wide
    PlayerNameChar playerName[MAX_PLAYER_NAME_LENGTH + 2];

    u8 wins;
    u8 losses;
    u8 draws;
} MultiplayerScoreDataSplit;

typedef union {
    MultiplayerScoreDataSplit split;
    u8 raw[sizeof(MultiplayerScoreDataSplit)];
} MultiplayerScoreData;

struct MultiplayerScore {
    u32 playerId;
    MultiplayerScoreData data;
};

#define NUM_TIME_RECORD_ROWS (NUM_TIME_ATTACK_ZONES * ACTS_PER_ZONE * NUM_CHARACTERS * TIME_RECORDS_PER_COURSE)

#define BTNCONFIG_NORMAL  0
#define BTNCONFIG_REVERSE 1

typedef struct SaveGame {
    /* 0x000 */ u32 security; // Save Sector Magic Number
    /* 0x004 */ s32 unk4;
    /* 0x008 */ u16 unlockedLevels[NUM_CHARACTERS];
    /* 0x010 */ PlayerNameChar playerName[MAX_PLAYER_NAME_LENGTH + 2];
    /* 0x018 */ u8 difficultyLevel;
    /* 0x019 */ u8 uiLanguage;
    /* 0x01A */ u8 language;
    /* 0x01B */ u8 timeLimitDisabled;
    /* 0x01C */ u8 btnConfig;
    /* 0x01D */ u8 chaosEmeralds;
    /* 0x020 */ struct TimeRecords timeRecords;
    /* 0x380 */ struct MultiplayerScore multiplayerScores[NUM_MULTIPLAYER_SCORES];
    /* 0x420 */ u32 unk420;
    /* 0x424 */ u8 unk424;
    /* 0x425 */ u8 unk425;
    /* 0x426 */ u8 unk426;
    /* 0x427 */ u8 unk427;
    /* 0x428 */ u32 score;
    /* 0x42C */ u32 checksum;
} SaveGame; /* 0x430 */

// NOTE: Not a pointer in SA1!
extern struct SaveGame gLoadedSaveGame;

#define LOADED_SAVE (&gLoadedSaveGame)

#define MULTIPLAYER_RESULT_WIN  0
#define MULTIPLAYER_RESULT_LOSS 1
#define MULTIPLAYER_RESULT_DRAW 2

void InsertMultiplayerProfile(u32 playerId, u16 *name);
void RecordOwnMultiplayerResult(s16 result);
void RecordMultiplayerResult(u32 id, u16 *name, s16 result);

bool32 RegisterTimeRecord(TimeRecord newRecord);

void SaveInit(void);
bool32 SaveGameExists(void);
u16 WriteSaveGame(void);
s16 NewSaveGame(void);
s16 LoadSaveGame(void);
void LoadCompletedSaveGame(void);

#endif
