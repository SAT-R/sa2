#include "global.h"
#include "agb_flash_512k.h"
#include "malloc_ewram.h"
#include "data.h"
#include "flags.h"
#include "save.h"
#include "m4a.h"
#include "random.h"

// Only used in here;
extern struct GameData* gUnknown_03005B60;
extern struct SaveData* gUnknown_03005B68;

extern s16 sub_8071944(void);
extern void sub_80717EC_InitNewGameData(struct GameData*);
extern void sub_80719D0_PackSave(struct SaveData*, struct GameData*);
extern u32 sub_8071D24_WriteSave(struct SaveData* data, s16 sectorNum);
extern void sub_8071898(struct SaveData*);


// todo make static
s16 sub_8071EE0(void);
bool16 sub_8072538_ReadSaveAndVerifyChecksum(void *saveBuf, s16 sectorNum);
bool16 sub_8071F8C_UnpackSave(struct GameData* gameState, struct SaveData* save);
u16 sub_8072244_EraseSaveSector(s16 sectorNum);
static bool16 sub_80724D4(void);

bool16 sub_8071E28_ReadSaveToGameData(void) {
    s16 sectorNum, i, successfulRead;
    
    struct GameData *lastSavedData, *gameData;
    struct SaveData *saveData;

    gameData = gUnknown_03005B64;
    lastSavedData = gUnknown_03005B60;
    saveData = gUnknown_03005B68;

    i = 0;

    // Keep a copy of the last game state
    memcpy(lastSavedData, gameData, sizeof(struct GameData));

    // Only read if we actually have game flash
    if (!(gFlags & FLAGS_NO_GAME_FLASH)) {
        // Get the last sector num where there is save data
        sectorNum = sub_8071EE0();
        do {
            successfulRead = sub_8072538_ReadSaveAndVerifyChecksum(saveData, sectorNum);
            if (!successfulRead) {
                i++;
                sub_8072244_EraseSaveSector(sectorNum);
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
            sub_8071F8C_UnpackSave(gameData, saveData);
            memcpy(lastSavedData, gameData, sizeof(struct GameData));
            return TRUE;
        }
    }
   
    return FALSE;   
}

ASM_FUNC("asm/non_matching/sub_8071EE0.inc", s16 sub_8071EE0(void));

bool16 sub_8071F8C_UnpackSave(struct GameData* gameState, struct SaveData* save) {
    s16 i;

    memset(gameState, 0, sizeof(struct GameData));
    memcpy(gameState->unk20, &save->unkC, 12);
    
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
            gameState->unk2C = 0x100;
            break;
        case 2:
            gameState->unk2C = 2;
            break;
        case 1:
            gameState->unk2C = 1;
            break;
    }
    switch (save->unk1D) {
        case 4:
            gameState->unk2E = 0x100;
            break;
        case 2:
            gameState->unk2E = 2;
            break;
        case 1:
            gameState->unk2E = 1;
            break;
    }
    switch (save->unk1E) {
        case 4:
            gameState->unk30 = 0x100;
            break;
        case 2:
            gameState->unk30 = 2;
            break;
        case 1:
            gameState->unk30 = 1;
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
    memcpy(gameState->unk34, save->unk2C, 0x278);
    memcpy(gameState->unk2AC, save->unk2A4, 200);
    gameState->unk374 = save->unk370;
    return TRUE;
}

// Resets and writes save
s16 sub_80721A4_CreateAndWriteNewSave(void) {
    s16 i;
    u16 flashError;
    
    struct GameData *gd4 = gUnknown_03005B64;
    struct GameData *gd0 = gUnknown_03005B60;
    struct SaveData *gd8 = gUnknown_03005B68;
    
    u8 prevUnk6 = gd4->unk6;
    u32 prevUnk374 = gd4->unk374;

    // Initialise the data structure
    sub_80717EC_InitNewGameData(gd4);

    gd4->unk6 = prevUnk6;
    gd4->unk374 = prevUnk374;

    memcpy(gd0, gd4, 0x378);

    if ((gFlags & FLAGS_NO_GAME_FLASH)) {
        return 0;
    }

    gd8->version = 0;

    // Most likely write gd0 to gd8;
    sub_80719D0_PackSave(gd8, gd0);

    flashError = sub_8071D24_WriteSave(gd8, 0);
    if (flashError) {
        return 0;
    }

    // Erase flash sectors 1 -> 9
    for (i = 1; i < 10; i++) {
        flashError = sub_8072244_EraseSaveSector(i);
        if (flashError) {
            return 0;
        }
    }

    return 1;
}

u16 sub_8072244_EraseSaveSector(s16 sectorNum) {
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

void sub_807234C(struct GameData* data) {
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

// SaveDataInit
void sub_80723C4_SaveInit(void) {
    gUnknown_03005B64 = EwramMalloc(0x378);
    gUnknown_03005B60 = EwramMalloc(0x378);
    gUnknown_03005B68 = EwramMalloc(0x378);

    sub_80717EC_InitNewGameData(gUnknown_03005B64);
    sub_80717EC_InitNewGameData(gUnknown_03005B60);
    sub_8071898(gUnknown_03005B68);
}

// Check if the first 10 sectors of flash
// data contain the bytes 0x4547474d
bool16 sub_8063940_SaveExists(void) {
    u32 data[32];
    s16 i;

    if (gFlags & FLAGS_NO_GAME_FLASH) {
        return FALSE;
    };

    for (i = 0; i < 10; i++) {
        ReadFlash(i, 0, &data[i * 2], 8);

        if (data[i * 2] == 0x4547474d) {
            return TRUE;
        }
    } 

    return FALSE;
}

s16 sub_8072474_LoadSave(void) {
    return sub_8071E28_ReadSaveToGameData();
}

u32 sub_8072484(void) {
    if (!sub_80724D4() && gUnknown_03005B64->unk0) {
        return 1;
    } else {
        return sub_8071944();
    }
}


s16 sub_80724B0_NewSave(void) {
    return sub_80721A4_CreateAndWriteNewSave();
}

// Initialise a completed game state
void sub_80724C0_LoadCompletedGame(void) {
    sub_807234C(gUnknown_03005B64);
}

// Check if we need to save any changes
static bool16 sub_80724D4(void) {
    u16* pCurrent = (u16*)gUnknown_03005B64;
    u16* pSaved = (u16*)gUnknown_03005B60;

    s16 i = 0;
    u16 size = sizeof(struct GameData) / sizeof(u16);
    
    do {
        if (*pCurrent == *pSaved) {
            i++, pCurrent++, pSaved++;
        } else {
           return TRUE;
        }
    } while (i < size);

    return FALSE;
}

// Get the checksum of the given data
UNUSED u32 CalculateChecksum(void* data) {
    u32 i;
    u32 sum = 0; 

    for (i = 0; i < offsetof(struct SaveData, checksum); i += sizeof(u32)) {
        sum += *(u32*)(data + i);
    }

    return sum;
}

// Read flash data at given sector into data
// and verify integrity
bool16 sub_8072538_ReadSaveAndVerifyChecksum(void *saveBuf, s16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, saveBuf, sizeof(struct SaveData));
    expected = &((struct SaveData*)saveBuf)->checksum;
  
    sum = 0;
    for (i = 0; i < offsetof(struct SaveData, checksum); i += sizeof(u32)) {
        sum += *(u32*)(saveBuf + i);
    }

    if (*expected != sum) {
        return 0;
    }
    
    return 1;
}
