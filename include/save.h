#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"
#include "zones.h"
#include "player.h"

#define ZONE_TIME_TO_INT(minutes, seconds) (((minutes * 60) + seconds) * GBA_FRAMES_PER_SECOND)
#define MAX_COURSE_TIME (ZONE_TIME_TO_INT(10, 0))
#define TIME_RECORDS_PER_COURSE 3

#define MAX_PLAYER_NAME_LENGTH 6
#define PLAYER_NAME_END_CHAR 0xFFFF

// TODO: Work out what this is
struct MultiplayerScore {
    u8 filler0[4];
    // playerName
    u16 unk4[MAX_PLAYER_NAME_LENGTH];

    // slotFilled
    u8 unk10;

    // wins
    u8 unk11;
    
    // loses
    u8 unk12;

    // draws
    u8 unk13;
};

struct ButtonConfig {
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

struct TimeRecords {
    u16 table[NUM_CHARACTERS][NUM_ZONES][ACTS_PER_ZONE][TIME_RECORDS_PER_COURSE];
};

#define NUM_TIME_RECORD_ROWS NUM_ZONES * ACTS_PER_ZONE * NUM_CHARACTERS * TIME_RECORDS_PER_COURSE

struct SaveGame {
    u32 unk0;

    u8 unk4;
    u8 unk5;
    
    // Language
    u8 unk6;

    // character unlocked courses
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
    u8 unk1A;
    u8 unk1B;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 unk1F;

    // playerName
    u16 unk20[MAX_PLAYER_NAME_LENGTH];

    // buttonConfig
    struct ButtonConfig unk2C;

    // timeRecords
    struct TimeRecords unk34;

    struct MultiplayerScore unk2AC[10];

    u32 unk374;
};

struct SaveSectorHeader {
    u32 security, version;
};

struct SaveSectorData {
    struct SaveSectorHeader header;
    u32 unk8;

    u16 playerName[MAX_PLAYER_NAME_LENGTH];

    u8 language;
    u8 unk19;

    u8 unk1A;

    u8 unlocks;

    u8 unk1C;
    u8 unk1D;
    u8 unk1E;

    u8 unlockedCourses[5];
    u8 unk24[5];

    u8 unk29;
    u8 unk2A;
    u8 unk2B;

    // timeRecords
    struct TimeRecords timeRecords;

    struct MultiplayerScore multiplayerScores[10];

    u32 id;

    u32 unk370;
    u32 checksum;
};

// If the sector's security field is not this value then the sector is either invalid or empty.
#define SECTOR_SECURITY_NUM 0x4547474D
#define SECTOR_CHECKSUM_OFFSET offsetof(struct SaveSectorData, checksum)
#define NUM_SAVE_SECTORS 10

// Some sort of save data?
struct SaveGame* gLoadedSaveGame;

void SaveInit(void);
bool16 SaveGameExists(void);
s16 NewSaveGame(void);
s16 LoadSaveGame(void);
void LoadCompletedSaveGame(void);
bool32 WriteSaveGame(void);

#endif
