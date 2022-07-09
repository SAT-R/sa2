#include "global.h"
#include "agb_flash.h"
#include "malloc_ewram.h"
#include "data.h"
#include "flags.h"
#include "save.h"
#include "m4a.h"
#include "random.h"

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

static bool16 ReadSaveSectorAndVerifyChecksum(void *saveBuf, s16 sectorNum);
static u16 WriteToSaveSector(struct SaveSectorData* data, s16 sectorNum);
static u16 EraseSaveSector(s16 sectorNum);
static bool16 HasChangesToSave(void);

static void GenerateNewSaveGame(struct SaveGame* gameState) {
    s16 i, *record;
    struct MultiplayerScore* p2;
    struct ButtonConfig* p3;
    
    memset(gameState, 0, sizeof(struct SaveGame));
    
    gameState->unk0 = 0;
    gameState->unk13 = 1;
    gameState->unk4 = 0;
    gameState->unk5 = 0;
    gameState->unk6 = 2;
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
    for (i = 0; i < 10; i++, p2++) {
        p2->unk10 = 0;
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

static void InitSaveGameSectorData(struct SaveSectorData* saveData) {
    s16 i, *record;
    struct MultiplayerScore* p2;
    
    memset(saveData, 0, sizeof(struct SaveSectorData));
    
    saveData->header.security = SECTOR_SECURITY_NUM;
    saveData->header.version = 0;
    saveData->unk8 = 0;
    saveData->unkC[0] = PLAYER_NAME_END_CHAR;
    saveData->unk18 = 2;
    saveData->unk1B = 0;
    saveData->unk1A = 0;
    saveData->unk19 = 0;
    saveData->unk1C = 1;
    saveData->unk1D = 2;
    saveData->unk1E = 4;
    saveData->unk29 = 0;
    saveData->unk2A = 0;
    saveData->unk2B = 0;

    record = (u16*)saveData->unk2C.table;
    for (i = 0; i < NUM_TIME_RECORD_ROWS; i++, record++) {
        *record = MAX_COURSE_TIME;
    }

    p2 = saveData->unk2A4;
    for (i = 0; i < 10; i++, p2++) {
        p2->unk10 = 0;
        p2->unk11 = 0;
        p2->unk12 = 0;
        p2->unk13 = 0;
        p2->unk4[0] = PLAYER_NAME_END_CHAR;
    }

    saveData->unk370 = 0;
}

static s16 TryWriteSaveGame(void) {
    s16 sectorToWrite, flashError;
    
    struct SaveGame *lastWrittenSaveGame, *saveGame;
    struct SaveSectorData *saveData;

    saveGame = gLoadedSaveGame;
    lastWrittenSaveGame = gLastWrittenSaveGame;
    saveData = gSaveSectorDataBuffer;

    if (saveGame->unk0 == 0) {
        saveGame->unk0 = Random32();
    }

    // Keep a copy of the last game state
    memcpy(lastWrittenSaveGame, saveGame, sizeof(struct SaveGame));
    PackSaveSectorData(saveData, lastWrittenSaveGame);

    // Only write if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        sectorToWrite = FindOldestSaveGameSector();
        
        // Couldn't find an oldest sector
        if (sectorToWrite == -1) {
            sectorToWrite = 0;
        }

        flashError = WriteToSaveSector(saveData, sectorToWrite);

        if (!flashError) {
            return TRUE;
        }
    }
   
    return FALSE;   
}

static bool16 PackSaveSectorData(struct SaveSectorData* save, struct SaveGame* gameState) {
    s16 i;
    u32 j, checksum, version;

    version = save->header.version;
    memset(save, 0, sizeof(struct SaveSectorData));
    
    save->header.security = SECTOR_SECURITY_NUM;
    save->header.version = version + 1;

    save->unk8 = gameState->unk0;
    memcpy(save->unkC, &gameState->unk20, 12);
    save->unk18 = gameState->unk6;

    save->unk19 = 0;
    if (gameState->unk4) {
        save->unk19 = 1;
    }

    if (gameState->unk5) {
        save->unk19 |= 2;
    }
    save->unk1A = 0;
    if (gameState->unk19) {
        save->unk1A = 1;
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
    save->unk1B = 0;
    if ((gameState->unk13 & 2)) {
        save->unk1B = 1;
    }
    if ((gameState->unk13 & 4)) {
        save->unk1B |= 2;
    }
    if ((gameState->unk13 & 8)) {
        save->unk1B |= 4;
    }
    if ((gameState->unk13 & 0x10)) {
        save->unk1B |= 8;
    }
    if (gameState->unk11) {
        save->unk1B |= 0x20;
    }
    if (gameState->unk12) {
        save->unk1B |= 0x10;
    }
    if (gameState->unk14) {
        save->unk1B |= 0x40;
    }

    switch (gameState->unk2C.unk0) {
        case 2:
            save->unk1C = 2;
            break;
        case 1:
            save->unk1C = 1;
            break;
        case 0x100:
            save->unk1C = 4;
            break;
    }

    switch (gameState->unk2C.unk2) {
        case 2:
            save->unk1D = 2;
            break;
        case 1:
            save->unk1D = 1;
            break;
        case 0x100:
            save->unk1D = 4;
            break;
    }

    switch (gameState->unk2C.unk4) {
        case 2:
            save->unk1E = 2;
            break;
        case 1:
            save->unk1E = 1;
            break;
        case 0x100:
            save->unk1E = 4;
            break;
    }

    for (i = 0; i < 5; i++) {
        save->unk1F[i] = gameState->unk7[i];
    }

    for (i = 0; i < 5; i++) {
        save->unk24[i] = gameState->unkC[i];
    }

    save->unk29 = gameState->unk1C;
    save->unk2A = gameState->unk1D;
    save->unk2B = gameState->unk1E;

    memcpy(&save->unk2C, &gameState->unk34, sizeof(gameState->unk34));
    memcpy(save->unk2A4, gameState->unk2AC, 200);

    save->unk36C = Random32();
    save->unk370 = gameState->unk374;

    // Not sure why they chose to rewrite the checksum logic here
    checksum = 0;
    for (j = 0; j < SECTOR_CHECKSUM_OFFSET; j += sizeof(u32)) {
        checksum += *(u32*)((u32)save + j);
    }
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
    
    struct SaveGame *lastSavedData, *gameData;
    struct SaveSectorData *saveData;

    gameData = gLoadedSaveGame;
    lastSavedData = gLastWrittenSaveGame;
    saveData = gSaveSectorDataBuffer;

    i = 0;

    // Keep a copy of the last game state
    memcpy(lastSavedData, gameData, sizeof(struct SaveGame));

    // Only read if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        // Get the last sector num where there is save data
        sectorNum = FindNewestSaveGameSector();
        do {
            successfulRead = ReadSaveSectorAndVerifyChecksum(saveData, sectorNum);
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
            UnpackSaveSectorData(gameData, saveData);
            memcpy(lastSavedData, gameData, sizeof(struct SaveGame));
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
    memcpy(gameState->unk20, save->unkC, 12);
    
    gameState->unk0 = save->unk8;
    gameState->unk6 = save->unk18;

    if ((save->unk19 & 1)) {
        gameState->unk4 = 1;
    }

    if ((save->unk19 & 2)) {
        gameState->unk5 = 1;
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

    gameState->unk13 = 1;

    if ((save->unk1B & 1)) {
        gameState->unk13 = 3;
    }
    if ((save->unk1B & 2)) {
        gameState->unk13 |= 4;
    }
    if ((save->unk1B & 4)) {
        gameState->unk13 |= 8;
    }
    if ((save->unk1B & 8)) {
        gameState->unk13 |= 0x10;
    }

    if ((save->unk1B & 0x20)) {
        gameState->unk11 = 1;
    } else {
        gameState->unk11 = 0;
    }

    if ((save->unk1B & 0x10)) {
        gameState->unk12 = 1;
    } else {
        gameState->unk12 = 0;
    }

    if ((save->unk1B & 0x40)) {
        gameState->unk14 = 1;
    } else {
        gameState->unk14 = 0;
    }

     switch (save->unk1C) {
        case 4:
            gameState->unk2C.unk0 = 0x100;
            break;
        case 2:
            gameState->unk2C.unk0 = 2;
            break;
        case 1:
            gameState->unk2C.unk0 = 1;
            break;
    }
    switch (save->unk1D) {
        case 4:
            gameState->unk2C.unk2 = 0x100;
            break;
        case 2:
            gameState->unk2C.unk2 = 2;
            break;
        case 1:
            gameState->unk2C.unk2 = 1;
            break;
    }
    switch (save->unk1E) {
        case 4:
            gameState->unk2C.unk4 = 0x100;
            break;
        case 2:
            gameState->unk2C.unk4 = 2;
            break;
        case 1:
            gameState->unk2C.unk4 = 1;
            break;
    }
    
    for (i = 0; i < 5; i++) {
        gameState->unk7[i] = save->unk1F[i];
    }

    for (i = 0; i < 5; i++) {
        gameState->unkC[i] = save->unk24[i];
    }

    gameState->unk1C = save->unk29;
    gameState->unk1D = save->unk2A;
    gameState->unk1E = save->unk2B;
    memcpy(&gameState->unk34, &save->unk2C, sizeof(save->unk2C));
    memcpy(gameState->unk2AC, save->unk2A4, 200);
    gameState->unk374 = save->unk370;
    return TRUE;
}

static s16 CreateAndTryWriteNewSaveGame(void) {
    s16 i;
    u16 flashError;
    
    struct SaveGame *gd4 = gLoadedSaveGame;
    struct SaveGame *gd0 = gLastWrittenSaveGame;
    struct SaveSectorData *gd8 = gSaveSectorDataBuffer;
    
    u8 prevUnk6 = gd4->unk6;
    u32 prevUnk374 = gd4->unk374;

    GenerateNewSaveGame(gd4);

    gd4->unk6 = prevUnk6;
    gd4->unk374 = prevUnk374;

    memcpy(gd0, gd4, sizeof(struct SaveGame));

    if ((gFlags & FLAGS_NO_FLASH_MEMORY)) {
        return 0;
    }

    gd8->header.version = 0;

    // Most likely write gd0 to gd8;
    PackSaveSectorData(gd8, gd0);

    // Write to sector 0, and erase other
    // flash sectors so we know this save will be used
    flashError = WriteToSaveSector(gd8, 0);
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

static void GenerateCompletedSaveGame(struct SaveGame* data) {
    s16 i;
    
    if (data->unk0 == 0) {
        // id?
        data->unk0 = Random32();
    }
    
    data->unk374 = 0;
    
    for (i = 0; i < 5; i++) {
        data->unk7[i] = i == 0 ? 0x1e : 0x1d;
        data->unkC[i] = 0xff;
    }

    data->unk13 = 0x1f;
    data->unk11 = 1;
    data->unk12 = 1;
    data->unk14 = 1;
    data->unk19 = 1;
    data->unk1A = 2;
    data->unk1B = 1;
    data->unk15 = 1;
    data->unk16 = 1;
    data->unk17 = 1;
    data->unk18 = 1;
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
    u32 i;
    u32 sum = 0; 

    for (i = 0; i < SECTOR_CHECKSUM_OFFSET; i += sizeof(u32)) {
        sum += *(u32*)(data + i);
    }

    return sum;
}

// Read flash data at given sector into data
// and verify integrity
static bool16 ReadSaveSectorAndVerifyChecksum(void *saveBuf, s16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, saveBuf, sizeof(struct SaveSectorData));
    expected = &((struct SaveSectorData*)saveBuf)->checksum;
  
    sum = 0;
    for (i = 0; i < SECTOR_CHECKSUM_OFFSET; i += sizeof(u32)) {
        sum += *(u32*)(saveBuf + i);
    }

    if (*expected != sum) {
        return 0;
    }
    
    return 1;
}
