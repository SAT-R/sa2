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
extern struct GameData* gUnknown_03005B68;

extern s16 sub_8071944(void);
extern s16 sub_8071E28(void);
extern void sub_80717EC_ResetSave(struct GameData*);
extern void sub_80719D0_PrepareSave(struct GameData*, struct GameData*);
extern u32 sub_8071D24_WriteSave(struct GameData* data, s16 sectorNum);
extern void sub_8071898(struct GameData*);


// todo make static
u16 sub_8072244_EraseSaveSector(s16 sectorNum);
static bool16 sub_80724D4(void);

// Resets and writes save
s16 sub_80721A4(void) {
    s16 i;
    u16 flashError;
    
    struct GameData *gd4 = gUnknown_03005B64;
    struct GameData *gd0 = gUnknown_03005B60;
    struct GameData *gd8 = gUnknown_03005B68;
    
    u8 prevUnk6 = gd4->unk6;
    u32 prevChecksum = gd4->checksum;

    // Initialise the data structure
    sub_80717EC_ResetSave(gd4);

    gd4->unk6 = prevUnk6;
    gd4->checksum = prevChecksum;

    memcpy(gd0, gd4, 0x378);

    if ((gFlags & FLAGS_NO_GAME_FLASH)) {
        return 0;
    }

    // TODO: work out what this is achieving
    *(u32 *)&gd8->unk4 = 0;

    // Most likely write gd0 to gd8;
    sub_80719D0_PrepareSave(gd8, gd0);

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
    
    data->checksum = 0;
    
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
void sub_80723C4(void) {
    gUnknown_03005B64 = EwramMalloc(0x378);
    gUnknown_03005B60 = EwramMalloc(0x378);
    gUnknown_03005B68 = EwramMalloc(0x378);

    sub_80717EC_ResetSave(gUnknown_03005B64);
    sub_80717EC_ResetSave(gUnknown_03005B60);
    sub_8071898(gUnknown_03005B68);
}

// Check if the first 10 sectors of flash
// data contain the bytes 0x4547474d
bool16 sub_8063940_HasProfile(void) {
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

s16 sub_8072474(void) {
    return sub_8071E28();
}

u32 sub_8072484(void) {
    if (!sub_80724D4() && gUnknown_03005B64->unk0) {
        return 1;
    } else {
        return sub_8071944();
    }
}


s16 sub_80724B0(void) {
    return sub_80721A4();
}

// Initialise a completed game state
void sub_80724C0(void) {
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

    for (i = 0; i < offsetof(struct GameData, checksum); i += sizeof(u32)) {
        sum += *(u32*)(data + i);
    }

    return sum;
}

// Read flash data at given sector into data
// and verify integrity
bool32 sub_8072538_ReadSaveAndVerify(void *data, u16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, data, sizeof(struct GameData));
    expected = &((struct GameData*)data)->checksum;
  
    sum = 0;
    for (i = 0; i < offsetof(struct GameData, checksum); i += sizeof(u32)) {
        sum += *(u32*)(data + i);
    }

    if (*expected != sum) {
        return 0;
    }
    
    return 1;
}
