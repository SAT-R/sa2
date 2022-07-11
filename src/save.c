#include "global.h"
#include "agb_flash.h"
#include "malloc_ewram.h"
#include "data.h"
#include "flags.h"
#include "save.h"
#include "m4a.h"
#include "random.h"
#include "constants/text.h"
#include "time.h"

struct SaveSectorHeader {
    u32 security, version;
};

struct SaveSectorData {
    struct SaveSectorHeader header;
    u32 unk8;

    u16 playerName[MAX_PLAYER_NAME_LENGTH];

    u8 language;
    u8 gamePlayOptions;

    u8 unk1A;

    u8 unlocks;

    u8 jumpControl;
    u8 attackControl;
    u8 trickControl;

    u8 unlockedCourses[NUM_CHARACTERS];
    u8 unk24[NUM_CHARACTERS];

    u8 multiplayerWins;
    u8 multiplayerLoses;
    u8 multiplayerDraws;

    // timeRecords
    struct TimeRecords timeRecords;

    struct MultiplayerScore multiplayerScores[NUM_MULTIPLAYER_SCORES];

    u32 id;

    u32 unk370;
    u32 checksum;
};

// TODO: Move refernce these in iwram
// TODO: make static, only used here
struct SaveGame* gLastWrittenSaveGame;

// TODO: reference this iwram, but not static
struct SaveGame* gLoadedSaveGame;

// TODO: make static, only used here
struct SaveSectorData* gSaveSectorDataBuffer;

static s16 FindNewestSaveGameSector(void);
static s16 FindOldestSaveGameSector(void);

static bool16 UnpackSaveSectorData(struct SaveGame* gameState, struct SaveSectorData* save);
static bool16 PackSaveSectorData(struct SaveSectorData* save, struct SaveGame* gameState);

static bool16 ReadSaveSectorAndVerifyChecksum(struct SaveSectorData* save, s16 sectorNum);
static u16 WriteToSaveSector(struct SaveSectorData* data, s16 sectorNum);
static u16 EraseSaveSector(s16 sectorNum);
static bool16 HasChangesToSave(void);

#define CalcChecksum(save) ({ \
    u32 j, checksum = 0; \
    for (j = 0; j < SECTOR_CHECKSUM_OFFSET; j += sizeof(u32)) { \
        checksum += *(u32*)((u32)(save) + j); \
    } \
    checksum; \
})

#define UNLOCK_FLAG_CREAM 1 << 0
#define UNLOCK_FLAG_TAILS 1 << 1
#define UNLOCK_FLAG_KNUCKLES 1 << 2
#define UNLOCK_FLAG_AMY 1 << 3
#define UNLOCK_FLAG_BOSS_TA 1 << 4
#define UNLOCK_FLAG_SOUND_TEST 1 << 5
#define UNLOCK_FLAG_CHAO_GARDEN 1 << 6

#define GAME_PLAY_OPTION_DIFFICULTY_EASY 1
#define GAME_PLAY_OPTION_TIME_LIMIT_ENABLED 2

#define PACKED_A_BUTTON 1
#define PACKED_B_BUTTON 2
#define PACKED_R_BUTTON 4

// If the sector's security field is not this value then the sector is either invalid or empty.
#define SECTOR_SECURITY_NUM 0x4547474D
#define SECTOR_CHECKSUM_OFFSET offsetof(struct SaveSectorData, checksum)
#define NUM_SAVE_SECTORS 10

static void GenerateNewSaveGame(struct SaveGame* gameState) {
    s16 i, *record;
    struct MultiplayerScore* p2;
    struct ButtonConfig* p3;
    
    memset(gameState, 0, sizeof(struct SaveGame));
    
    gameState->unk0 = 0;
    gameState->unk13 = CHARACTER_UNLOCKED_BIT(CHARACTER_SONIC);
    gameState->unk4 = 0;
    gameState->unk5 = 0;
    gameState->unk6 = LANG_ENGLISH;
    gameState->unk20[0] = PLAYER_NAME_END_CHAR;

    p3 = &gameState->unk2C;
    
    p3->unk0 = 1;
    p3->unk2 = 2;
    p3->unk4 = 0x100;

    record = (u16*)gameState->unk34.table;
    for (i = 0; i < NUM_TIME_RECORD_ROWS; i++, record++) {
        *record = MAX_COURSE_TIME;
    }

    gameState->unk1C = 0;
    gameState->unk1D = 0;
    gameState->unk1E = 0;

    p2 = gameState->unk2AC;
    for (i = 0; i < NUM_MULTIPLAYER_SCORES; i++, p2++) {
        p2->unk10 = FALSE;
        p2->unk11 = 0;
        p2->unk12 = 0;
        p2->unk13 = 0;
        p2->unk4[0] = PLAYER_NAME_END_CHAR;
    }

    gameState->unk374 = 0;
    gameState->unk19 = 0;
    gameState->unk1A = 0;
    gameState->unk1B = 0;

    gameState->unk15 = 0;
    gameState->unk16 = 0;
    gameState->unk17 = 0;
    gameState->unk18 = 0;
}

static void InitSaveGameSectorData(struct SaveSectorData* save) {
    s16 i, *record;
    struct MultiplayerScore* p2;
    
    memset(save, 0, sizeof(struct SaveSectorData));
    
    save->header.security = SECTOR_SECURITY_NUM;
    save->header.version = 0;
    save->unk8 = 0;
    save->playerName[0] = PLAYER_NAME_END_CHAR;
    save->language = LANG_ENGLISH;
    save->unlocks = 0;
    save->unk1A = 0;
    save->gamePlayOptions = 0;
    save->jumpControl = 1;
    save->attackControl = 2;
    save->trickControl = 4;
    save->multiplayerWins = 0;
    save->multiplayerLoses = 0;
    save->multiplayerDraws = 0;

    record = (u16*)save->timeRecords.table;
    for (i = 0; i < NUM_TIME_RECORD_ROWS; i++, record++) {
        *record = MAX_COURSE_TIME;
    }

    p2 = save->multiplayerScores;
    for (i = 0; i < 10; i++, p2++) {
        p2->unk10 = FALSE;
        p2->unk11 = 0;
        p2->unk12 = 0;
        p2->unk13 = 0;
        p2->unk4[0] = PLAYER_NAME_END_CHAR;
    }

    save->unk370 = 0;
}

static s16 TryWriteSaveGame(void) {
    s16 sectorToWrite, flashError;
    
    struct SaveGame *lastWrittenGameState, *gameState;
    struct SaveSectorData *save;

    gameState = gLoadedSaveGame;
    lastWrittenGameState = gLastWrittenSaveGame;
    save = gSaveSectorDataBuffer;

    if (gameState->unk0 == 0) {
        gameState->unk0 = Random32();
    }

    // Keep a copy of the last game state
    memcpy(lastWrittenGameState, gameState, sizeof(struct SaveGame));
    PackSaveSectorData(save, lastWrittenGameState);

    // Only write if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        sectorToWrite = FindOldestSaveGameSector();
        
        // Couldn't find an oldest sector
        if (sectorToWrite == -1) {
            sectorToWrite = 0;
        }

        flashError = WriteToSaveSector(save, sectorToWrite);

        if (!flashError) {
            return TRUE;
        }
    }
   
    return FALSE;   
}

static bool16 PackSaveSectorData(struct SaveSectorData* save, struct SaveGame* gameState) {
    s16 i;
    u32 checksum, version;

    version = save->header.version;
    memset(save, 0, sizeof(struct SaveSectorData));
    
    save->header.security = SECTOR_SECURITY_NUM;
    save->header.version = version + 1;

    save->unk8 = gameState->unk0;
    memcpy(save->playerName, gameState->unk20, sizeof(gameState->unk20));
    save->language = gameState->unk6;

    save->gamePlayOptions = 0;
    if (gameState->unk4 != 0) {
        save->gamePlayOptions |= GAME_PLAY_OPTION_DIFFICULTY_EASY;
    }

    if (gameState->unk5) {
        save->gamePlayOptions |= GAME_PLAY_OPTION_TIME_LIMIT_ENABLED;
    }

    save->unk1A = 0;
    if (gameState->unk19) {
        save->unk1A |= 1;
    }
    if (gameState->unk1A) {
        save->unk1A |= (gameState->unk1A << 1) & 6;
    }
    if (gameState->unk1B) {
        save->unk1A |= 8;
    }
    if (gameState->unk15) {
        save->unk1A |= 0x10;
    }
    if (gameState->unk16) {
        save->unk1A |= 0x20;
    }
    if (gameState->unk17) {
        save->unk1A |= 0x40;
    }
    if (gameState->unk18) {
        save->unk1A |= 0x80;
    }

    save->unlocks = 0;
    if ((gameState->unk13 & CHARACTER_UNLOCKED_BIT(CHARACTER_CREAM))) {
        save->unlocks |= UNLOCK_FLAG_CREAM;
    }
    if ((gameState->unk13 & CHARACTER_UNLOCKED_BIT(CHARACTER_TAILS))) {
        save->unlocks |= UNLOCK_FLAG_TAILS;
    }
    if ((gameState->unk13 & CHARACTER_UNLOCKED_BIT(CHARACTER_KNUCKLES))) {
        save->unlocks |= UNLOCK_FLAG_KNUCKLES;
    }
    if ((gameState->unk13 & CHARACTER_UNLOCKED_BIT(CHARACTER_AMY))) {
        save->unlocks |= UNLOCK_FLAG_AMY;
    }
    if (gameState->unk11) {
        save->unlocks |= UNLOCK_FLAG_SOUND_TEST;
    }
    if (gameState->unk12) {
        save->unlocks |= UNLOCK_FLAG_BOSS_TA;
    }
    if (gameState->unk14) {
        save->unlocks |= UNLOCK_FLAG_CHAO_GARDEN;
    }

    switch (gameState->unk2C.unk0) {
        case B_BUTTON:
            save->jumpControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->jumpControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->jumpControl = PACKED_R_BUTTON;
            break;
    }

    switch (gameState->unk2C.unk2) {
        case B_BUTTON:
            save->attackControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->attackControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->attackControl = PACKED_R_BUTTON;
            break;
    }

    switch (gameState->unk2C.unk4) {
        case B_BUTTON:
            save->trickControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->trickControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->trickControl = PACKED_R_BUTTON;
            break;
    }

    for (i = 0; i < NUM_CHARACTERS; i++) {
        save->unlockedCourses[i] = gameState->unk7[i];
    }

    for (i = 0; i < NUM_CHARACTERS; i++) {
        save->unk24[i] = gameState->unkC[i];
    }

    save->multiplayerWins = gameState->unk1C;
    save->multiplayerLoses = gameState->unk1D;
    save->multiplayerDraws = gameState->unk1E;

    memcpy(&save->timeRecords, &gameState->unk34, sizeof(gameState->unk34));
    memcpy(save->multiplayerScores, gameState->unk2AC, sizeof(gameState->unk2AC));

    save->id = Random32();
    save->unk370 = gameState->unk374;

    // Not sure why they chose to rewrite the checksum logic here
    
    checksum = CalcChecksum(save);
    save->checksum = checksum;

    return TRUE;
}

static s16 FindOldestSaveGameSector(void) {
    struct SaveSectorHeader sectors[10];
    s16 i;
    u32 maxVersion = 0, minVersion = 0xffffffff;
    s16 bestSector = 0xffff;

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));
        
        if (sectors[i].security != SECTOR_SECURITY_NUM) {
            // If this sector is empty, use it
            return i;
        }
        
        if (sectors[i].version > maxVersion) {
            maxVersion = sectors[i].version;
        }
        
        if (sectors[i].version < minVersion) {
            bestSector = i;
            minVersion = sectors[i].version;
        }
    } 

    if (maxVersion != ~0) {
        return bestSector;
    }
    
    minVersion = 0xffff0000;
    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        if (minVersion > 0xffff0000 && sectors[i].version < minVersion) {
            bestSector = i;
            minVersion = sectors[i].version;
        }
    }

    if (minVersion != 0xffff0000) {
        return bestSector;
    }

    // Could not find a suitable sector
    return -1;
}

static u16 WriteToSaveSector(struct SaveSectorData* data, s16 sectorNum) {
    u32 preIE;
    u32 preIME;
    u32 preDISPSTAT;
    u16 result;
    
    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    gFlags |= 0x8000;
    
    preIE = REG_IE;
    preIME = REG_IME;
    preDISPSTAT = REG_DISPSTAT;

    REG_IE = 0;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    gFlags &= ~4;
    
    DmaStop(0);
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);

    result = ProgramFlashSectorAndVerifyNBytes(sectorNum, data, sizeof(struct SaveSectorData));
    
    REG_IE = preIE;
    REG_IME = preIME;
    REG_DISPSTAT = preDISPSTAT;

    m4aSoundVSyncOn();
    gFlags &= ~0x8000;

    return result;
}

static bool16 TryLoadLatestSaveGame(void) {
    s16 sectorNum, i, successfulRead;
    
    struct SaveGame *lastSavedData, *gameState;
    struct SaveSectorData *save;

    gameState = gLoadedSaveGame;
    lastSavedData = gLastWrittenSaveGame;
    save = gSaveSectorDataBuffer;

    i = 0;

    // Keep a copy of the last game state
    memcpy(lastSavedData, gameState, sizeof(struct SaveGame));

    // Only read if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        // Get the last sector num where there is save data
        sectorNum = FindNewestSaveGameSector();
        do {
            successfulRead = ReadSaveSectorAndVerifyChecksum(save, sectorNum);
            if (!successfulRead) {
                i++;
                EraseSaveSector(sectorNum);
                // If we reach the first sector
                // loop back around so we get a 
                // chence to try them all
                if (sectorNum == 0) {
                    sectorNum = 9;
                } else {
                    sectorNum--;
                };
            } else {
                // We had a success reading the data
                // to we can continue with the copied save data
                break;
            } 
        } while (i < 10);

        if (successfulRead) {
            UnpackSaveSectorData(gameState, save);
            memcpy(lastSavedData, gameState, sizeof(struct SaveGame));
            return TRUE;
        }
    }
   
    return FALSE;   
}

// When a save is made, we write to a new sector
// and keep the old save. Incase a save sector
// becomes corrupted we can always use the
// previous save instead
static s16 FindNewestSaveGameSector(void) {
    // Thanks to jiang for the match on this one    
    struct SaveSectorHeader sectors[10];
    s16 i;
    u32 maxVersion = 0, minVersion = 0xffffffff;
    s16 bestSector = 0;

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));
        // If the value we just read was this
        if (sectors[i].security == SECTOR_SECURITY_NUM) {
          if (sectors[i].version > maxVersion) {
            bestSector = i;
            maxVersion = sectors[i].version;
          }

          if (sectors[i].version < minVersion) {
            minVersion = sectors[i].version;
          }
        }
    } 

    if (minVersion > 0) {
        return bestSector;
    }

    // if we found a min version number of 0
    // look through all the sectors for the highest
    // version number until we get to a version number
    // of <= 0xffff
    maxVersion = 0;
    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        if (maxVersion <= 0xFFFF && sectors[i].version > maxVersion) {
            bestSector = i;
            maxVersion = sectors[i].version;
        }
    }

    return bestSector;
}

static bool16 UnpackSaveSectorData(struct SaveGame* gameState, struct SaveSectorData* save) {
    s16 i;

    memset(gameState, 0, sizeof(struct SaveGame));
    memcpy(gameState->unk20, save->playerName, sizeof(save->playerName));
    
    gameState->unk0 = save->unk8;
    gameState->unk6 = save->language;

    if (save->gamePlayOptions & GAME_PLAY_OPTION_DIFFICULTY_EASY) {
        gameState->unk4 = 1;
    }

    if (save->gamePlayOptions & GAME_PLAY_OPTION_TIME_LIMIT_ENABLED) {
        gameState->unk5 = TRUE;
    }

    if ((save->unk1A & 1)) {
        gameState->unk19 = 1;
    }
    if ((save->unk1A & 6)) {
        gameState->unk1A = (save->unk1A & 6) >> 1;
    }
    if ((save->unk1A & 8)) {
        gameState->unk1B = 1;
    }
    if ((save->unk1A & 0x10)) {
        gameState->unk15 = 1;
    }
    if ((save->unk1A & 0x20)) {
        gameState->unk16 = 1;
    }
    if ((save->unk1A & 0x40)) {
        gameState->unk17 = 1;
    }
    if ((save->unk1A & 0x80)) {
        gameState->unk18 = 1;
    }

    gameState->unk13 = CHARACTER_UNLOCKED_BIT(CHARACTER_SONIC);

    if (save->unlocks & UNLOCK_FLAG_CREAM) {
        gameState->unk13 |= CHARACTER_UNLOCKED_BIT(CHARACTER_CREAM);
    }
    if (save->unlocks & UNLOCK_FLAG_TAILS) {
        gameState->unk13 |= CHARACTER_UNLOCKED_BIT(CHARACTER_TAILS);
    }
    if (save->unlocks & UNLOCK_FLAG_KNUCKLES) {
        gameState->unk13 |= CHARACTER_UNLOCKED_BIT(CHARACTER_KNUCKLES);
    }
    if (save->unlocks & UNLOCK_FLAG_AMY) {
        gameState->unk13 |= CHARACTER_UNLOCKED_BIT(CHARACTER_AMY);
    }

    if (save->unlocks & UNLOCK_FLAG_SOUND_TEST) {
        gameState->unk11 = TRUE;
    } else {
        gameState->unk11 = FALSE;
    }

    if (save->unlocks & UNLOCK_FLAG_BOSS_TA) {
        gameState->unk12 = TRUE;
    } else {
        gameState->unk12 = FALSE;
    }

    if (save->unlocks & UNLOCK_FLAG_CHAO_GARDEN) {
        gameState->unk14 = TRUE;
    } else {
        gameState->unk14 = FALSE;
    }

     switch (save->jumpControl) {
        case PACKED_R_BUTTON:
            gameState->unk2C.unk0 = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->unk2C.unk0 = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->unk2C.unk0 = A_BUTTON;
            break;
    }
    switch (save->attackControl) {
        case PACKED_R_BUTTON:
            gameState->unk2C.unk2 = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->unk2C.unk2 = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->unk2C.unk2 = A_BUTTON;
            break;
    }
    switch (save->trickControl) {
        case PACKED_R_BUTTON:
            gameState->unk2C.unk4 = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->unk2C.unk4 = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->unk2C.unk4 = A_BUTTON;
            break;
    }
    
    for (i = 0; i < NUM_CHARACTERS; i++) {
        gameState->unk7[i] = save->unlockedCourses[i];
    }

    for (i = 0; i < 5; i++) {
        gameState->unkC[i] = save->unk24[i];
    }

    gameState->unk1C = save->multiplayerWins;
    gameState->unk1D = save->multiplayerLoses;
    gameState->unk1E = save->multiplayerDraws;
    memcpy(&gameState->unk34, &save->timeRecords, sizeof(save->timeRecords));
    memcpy(gameState->unk2AC, save->multiplayerScores, sizeof(save->multiplayerScores));
    gameState->unk374 = save->unk370;
    return TRUE;
}

static s16 CreateAndTryWriteNewSaveGame(void) {
    s16 i;
    u16 flashError;
    
    struct SaveGame *gameState = gLoadedSaveGame;
    struct SaveGame *lastWrittenGameState = gLastWrittenSaveGame;
    struct SaveSectorData *save = gSaveSectorDataBuffer;
    
    u8 language = gameState->unk6;
    u32 prevUnk374 = gameState->unk374;

    GenerateNewSaveGame(gameState);

    gameState->unk6 = language;
    gameState->unk374 = prevUnk374;

    memcpy(lastWrittenGameState, gameState, sizeof(struct SaveGame));

    if ((gFlags & FLAGS_NO_FLASH_MEMORY)) {
        return 0;
    }

    save->header.version = 0;

    PackSaveSectorData(save, lastWrittenGameState);

    // Write to sector 0, and erase other
    // flash sectors so we know this save will be used
    flashError = WriteToSaveSector(save, 0);
    if (flashError) {
        return 0;
    }

    for (i = 1; i < NUM_SAVE_SECTORS; i++) {
        flashError = EraseSaveSector(i);
        if (flashError) {
            return 0;
        }
    }

    return 1;
}

static u16 EraseSaveSector(s16 sectorNum) {
    u32 preIE;
    u32 preIME;
    u32 preDISPSTAT;
    u16 result;
    
    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    gFlags |= 0x8000;
    
    preIE = REG_IE;
    preIME = REG_IME;
    preDISPSTAT = REG_DISPSTAT;

    REG_IE = 0;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    gFlags &= ~4;
    
    DmaStop(0);
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);

    result = EraseFlashSector(sectorNum);
    
    REG_IE = preIE;
    REG_IME = preIME;
    REG_DISPSTAT = preDISPSTAT;

    m4aSoundVSyncOn();
    gFlags &= ~0x8000;

    return result;
}

static void GenerateCompletedSaveGame(struct SaveGame* gameState) {
    s16 i;
    
    if (gameState->unk0 == 0) {
        // id?
        gameState->unk0 = Random32();
    }
    
    gameState->unk374 = 0;
    
    for (i = 0; i < 5; i++) {
        gameState->unk7[i] = i == 0 ? 0x1e : 0x1d;
        gameState->unkC[i] = 0xff;
    }

    gameState->unk13 = 
        CHARACTER_UNLOCKED_BIT(CHARACTER_SONIC) | 
        CHARACTER_UNLOCKED_BIT(CHARACTER_CREAM) | 
        CHARACTER_UNLOCKED_BIT(CHARACTER_TAILS) | 
        CHARACTER_UNLOCKED_BIT(CHARACTER_KNUCKLES) | 
        CHARACTER_UNLOCKED_BIT(CHARACTER_AMY);
    gameState->unk11 = TRUE;
    gameState->unk12 = TRUE;
    gameState->unk14 = TRUE;

    gameState->unk19 = 1;
    gameState->unk1A = 2;
    gameState->unk1B = 1;
    gameState->unk15 = 1;
    gameState->unk16 = 1;
    gameState->unk17 = 1;
    gameState->unk18 = 1;
}

// Exported functions

void SaveInit(void) {
    gLoadedSaveGame = EwramMallocStruct(struct SaveGame);
    gLastWrittenSaveGame = EwramMallocStruct(struct SaveGame);
    gSaveSectorDataBuffer =  EwramMallocStruct(struct SaveSectorData);

    // Why not just generate for 1 and copy...
    GenerateNewSaveGame(gLoadedSaveGame);
    GenerateNewSaveGame(gLastWrittenSaveGame);
    InitSaveGameSectorData(gSaveSectorDataBuffer);
}

// Check if the any of the first 10 sectors of flash
// data contain a save
bool16 SaveGameExists(void) {
    // Not sure why this is 16 long
    struct SaveSectorHeader sectors[16];
    s16 i;

    if (gFlags & FLAGS_NO_FLASH_MEMORY) {
        return FALSE;
    };

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));

        if (sectors[i].security == SECTOR_SECURITY_NUM) {
            return TRUE;
        }
    } 

    return FALSE;
}

s16 LoadSaveGame(void) {
    return TryLoadLatestSaveGame();
}

bool32 WriteSaveGame(void) {
    if (!HasChangesToSave() && gLoadedSaveGame->unk0) {
        return TRUE;
    } else {
        return TryWriteSaveGame();
    }
}

s16 NewSaveGame(void) {
    return CreateAndTryWriteNewSaveGame();
}

// Initialise a completed game state
void LoadCompletedSaveGame(void) {
    GenerateCompletedSaveGame(gLoadedSaveGame);
}

// End of exported functions

// Check if we need to save any changes
static bool16 HasChangesToSave(void) {
    u16* pCurrent = (u16*)gLoadedSaveGame;
    u16* pSaved = (u16*)gLastWrittenSaveGame;

    s16 i = 0;
    u16 size = sizeof(struct SaveGame) / sizeof(u16);
    
    do {
        if (*pCurrent == *pSaved) {
            i++, pCurrent++, pSaved++;
        } else {
           return TRUE;
        }
    } while (i < size);

    return FALSE;
}

UNUSED static u32 CalculateChecksum(void* data) {
    return CalcChecksum(data);
}

// Read flash data at given sector into data
// and verify integrity
static bool16 ReadSaveSectorAndVerifyChecksum(struct SaveSectorData* save, s16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, save, sizeof(struct SaveSectorData));
    expected = &save->checksum;
  
    sum = CalcChecksum(save);

    if (*expected != sum) {
        return 0;
    }
    
    return 1;
}
