#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player_controls.h"
#include "constants/zones.h"
#include "constants/characters.h"

#define PLAYER_NAME_END_CHAR 0xFFFF

#define NUM_MULTIPLAYER_SCORES 10
#define MAX_MULTIPLAYER_SCORE  99

#define TIME_RECORDS_PER_COURSE 3

#if (GAME == GAME_SA1)
typedef u8 PlayerNameChar;
typedef u32 TimeRecord;
#elif (GAME == GAME_SA2)
typedef u16 PlayerNameChar;
typedef u16 TimeRecord;
#endif

#if (GAME == GAME_SA1)
struct TimeRecords {
    TimeRecord table[NUM_CHARACTERS][NUM_LEVEL_IDS][TIME_RECORDS_PER_COURSE];
};

struct MultiplayerScore {
    u32 playerId;
    // TODO/NOTE: Only 6 chars are displayed, but the string is treated 8-char wide
    PlayerNameChar playerName[MAX_PLAYER_NAME_LENGTH + 2];

    u8 wins;
    u8 losses;
    u8 draws;
};

#define NUM_TIME_RECORD_ROWS (NUM_CHARACTERS * NUM_LEVEL_IDS * TIME_RECORDS_PER_COURSE)

typedef struct SaveGame {
    /* 0x000 */ u8 filler0[0x4];
    /* 0x004 */ s32 unk4;
    /* 0x008 */ u16 unk8[4];
    /* 0x010 */ PlayerNameChar playerName[MAX_PLAYER_NAME_LENGTH];
    /* 0x016 */ u8 unk16;
    /* 0x017 */ u8 unk17;
    /* 0x018 */ u8 unk18;
    /* 0x019 */ u8 unk19;
    /* 0x01A */ u8 language;
    /* 0x01B */ u8 unk1B;
    /* 0x01C */ u8 unk1C;
    /* 0x020 */ struct TimeRecords timeRecords;
    /* 0x2AC */ struct MultiplayerScore multiplayerScores[NUM_MULTIPLAYER_SCORES];
    /* 0x420 */ u32 unk420;
    /* 0x424 */ u8 filler424[0x4];
    /* 0x428 */ u32 score;
    /* 0x42C */ u8 filler42C[0x4];
} SaveGame; /* 0x430 */

// NOTE: Not a pointer in SA1!
extern struct SaveGame gLoadedSaveGame;
#elif (GAME == GAME_SA2)
struct TimeRecords {
    TimeRecord table[NUM_CHARACTERS][NUM_TIME_ATTACK_ZONES][ACTS_PER_ZONE][TIME_RECORDS_PER_COURSE];
};

#define NUM_TIME_RECORD_ROWS (NUM_TIME_ATTACK_ZONES * ACTS_PER_ZONE * NUM_CHARACTERS * TIME_RECORDS_PER_COURSE)

struct MultiplayerScore {
    u32 playerId;
    PlayerNameChar playerName[MAX_PLAYER_NAME_LENGTH];

    bool8 slotFilled;

    u8 wins;
    u8 losses;
    u8 draws;
};

typedef struct SaveGame {
    /* 0x000 */ u32 id;

    /* 0x004 */ u8 difficultyLevel;
    /* 0x005 */ bool8 timeLimitDisabled;
    /* 0x006 */ u8 language;

    /* 0x007 */ u8 unlockedLevels[NUM_CHARACTERS];
    /* 0x00C */ u8 chaosEmeralds[NUM_CHARACTERS];

    /* 0x011 */ bool8 soundTestUnlocked;
    /* 0x012 */ bool8 bossTimeAttackUnlocked;

    /* 0x013 */ u8 unlockedCharacters;
    /* 0x014 */ bool8 chaoGardenUnlocked;

    /* 0x015 */ bool8 completedCharacters[NUM_CHARACTERS];

    /* 0x01A */ u8 extraZoneStatus;
    /* 0x01B */ bool8 extraEndingCreditsPlayed;

    /* 0x01C */ u8 multiplayerWins;
    /* 0x01D */ u8 multiplayerLoses;
    /* 0x01E */ u8 multiplayerDraws;

    /* 0x020 */ u16 playerName[MAX_PLAYER_NAME_LENGTH];

    /* 0x02C */ struct ButtonConfig buttonConfig;
    /* 0x034 */ struct TimeRecords timeRecords;
    /* 0x2AC */ struct MultiplayerScore multiplayerScores[NUM_MULTIPLAYER_SCORES];
    /* 0x374 */ u32 score;
} SaveGame;

extern struct SaveGame *gLoadedSaveGame;
#endif

#if (GAME == GAME_SA1)
#define LOADED_SAVE (&gLoadedSaveGame)
#elif (GAME == GAME_SA2)
#define LOADED_SAVE (gLoadedSaveGame)
#endif

#define MULTIPLAYER_RESULT_WIN  0
#define MULTIPLAYER_RESULT_LOSS 1
#define MULTIPLAYER_RESULT_DRAW 2

void InsertMultiplayerProfile(u32 playerId, u16 *name);
void RecordOwnMultiplayerResult(s16 result);
void RecordMultiplayerResult(u32 id, u16 *name, s16 result);

void SaveInit(void);
bool16 SaveGameExists(void);
s16 NewSaveGame(void);
s16 LoadSaveGame(void);
void LoadCompletedSaveGame(void);
bool32 WriteSaveGame(void);

#endif
