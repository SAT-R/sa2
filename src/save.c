#include "global.h"
#include "agb_flash_512k.h"
#include "malloc_ewram.h"
#include "data.h"
#include "flags.h"
#include "save.h"
#include "m4a.h"

// Only used in here;
extern struct GameData* gUnknown_03005B60;
extern u32* gUnknown_03005B68;

extern s16 sub_80721A4(void);
extern s16 sub_8071944(void);
extern s16 sub_8071E28(void);
extern void sub_80717EC(struct GameData*);
extern void sub_8071898(u32*);

// Could be random?
extern u16 sub_80854DC(void);

static bool16 sub_80724D4(void);

u16 sub_8072244(u16 sectorNum) {
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
    gFlags &= 0xfffffffb;
    
    DmaStop(0);
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);

    result = EraseFlashSector(sectorNum);
    
    REG_IE = preIE;
    REG_IME = preIME;
    REG_DISPSTAT = preDISPSTAT;

    m4aSoundVSyncOn();
    gFlags = gFlags & 0xffff7fff;

    return result;
}

void sub_807234C(struct GameData* data) {
    s16 i;
    
    if (data->unk0 == 0) {
        // id?
        data->unk0 = (sub_80854DC() << 0x10 | sub_80854DC());
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

// InitSaveData
void sub_80723C4(void) {
    gUnknown_03005B64 = EwramMalloc(0x378);
    gUnknown_03005B60 = EwramMalloc(0x378);
    gUnknown_03005B68 = EwramMalloc(0x378);

    sub_80717EC(gUnknown_03005B64);
    sub_80717EC(gUnknown_03005B60);
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

        if (data[i * 2] ==  0x4547474d) {
            return TRUE;
        }
    } 

    return FALSE;
}

s32 sub_8072474(void) {
    return sub_8071E28();
}

u32 sub_8072484(void) {
    if (!sub_80724D4() && gUnknown_03005B64->unk0) {
        return 1;
    } else {
        return sub_8071944();
    }
}


s32 sub_80724B0(void) {
    s16 result = sub_80721A4();

    return result;
}

// Initialise a completed game state
void sub_80724C0(void) {
    sub_807234C(gUnknown_03005B64);
}

// Returns true if 2 arrays have a different value
// not yet sure what these arrays relate to
static bool16 sub_80724D4(void) {
    u16* pArrayB64 = (u16*)gUnknown_03005B64;
    u16* pArrayB60 = (u16*)gUnknown_03005B60;

    u32 index = 0;
    s32 compare = 444;
    u32 previousIndex;
    
     do {
        if (*pArrayB64 == *pArrayB60) {
            previousIndex = index << 0x10;
            index = 0x10000;
            previousIndex += index;
             
            pArrayB64 = pArrayB64 + 1;
            pArrayB60 = pArrayB60 + 1;
            // Something to do with swapping between signed
            // and 16 and 32bit integers
            index = previousIndex >> 0x10;
        } else {
           return TRUE;
        }
    } while (((s32)previousIndex >> 0x10) < compare);

    return FALSE;
}

// Get the checksum of the given data
UNUSED u32 sub_8072514(u8* data) {
    u32 sum = 0; 
    u32 i;

    for (i = 0; i < 0x374; i += 4) {
        sum += *(u32*)&data[i];
    }

    return sum;
}

// Read flash data at given sector into data
// and verify integrity
bool32 sub_8072538(u8 *data, u16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, data, 0x378);
    expected = (u32*)&data[0x374];
  
    sum = 0;
    for (i = 0; i < 0x374; i += 4) {
        sum += *(u32 *)&data[i];
    }

    if (*expected != sum) {
        return FALSE;
    }
    
    return TRUE;
}
