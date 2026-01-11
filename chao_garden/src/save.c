#include "global.h"
#include "agb_flash.h"
#include "m4a.h"
#include "save.h"

// TCG = Tiny Chao Garden
#define TCG_FIRST_SAVE_SECTOR 10
#define TCG_SAVE_SECTOR_COUNT 6

// CRC?
extern s16 sub_0200185c(void *a, s32 b);
extern u32 sub_02008810(void);

extern u32 sub_0200151c(void);

void InitGameState(void);

void LoadGameState(void)
{
    s32 i;
    u32 p;
    s8 sector;
    IdentifyFlash();
    SetFlashTimerIntr(2, &gIntrTable[2]);

    p = 0;
    sector = -1;

    for (i = 0; i < 6; i++) {
        ReadFlash(i + 10, 0, &gSaveGameState, sizeof(struct TCG_SaveSectorData));
        if (gSaveGameState.header.unk2 == 0x1965) {
            u16 checksum = sub_0200185c((void *)&gSaveGameState.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
            if (checksum == gSaveGameState.header.checksum) {
                if (sector < 0) {
                    sector = i;
                    p = gSaveGameState.header.unk4;
                } else if (gSaveGameState.header.unk4 > p) {
                    sector = i;
                    p = gSaveGameState.header.unk4;
                }
            }
        }
    }

    if (sector < 0) {
        gSaveSectorNum = TCG_SAVE_SECTOR_COUNT;
        gSaveVersion = 0;
        InitGameState();
        gSaveGameState.unk59 = 0;
        gSaveGameState.unk1F = 0x58;
        gSaveGameState.unk20 = 0x68;
    } else {
        gSaveSectorNum = sector;
        gSaveVersion = p;
        ReadFlash(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, 0, &gSaveGameState, sizeof(struct TCG_SaveSectorData));
        sub_02001528(gSaveGameState.unk18);
    }
    if (gSaveGameState.unk8 >= gUnknown_02000008.unk0) {
        gUnknown_03005274 = gSaveGameState.unkC;
    } else {
        p = gSaveGameState.unkC + (gUnknown_02000008.unk0 - gSaveGameState.unk8);
        if (p > 99999) {
            p = 99999;
        }
        gUnknown_03005274 = p;
        gSaveGameState.unk8 = gUnknown_02000008.unk0;
    }
    gSaveGameState.unk64 = (gUnknown_03005274 & 0xFF) << 24 | ((gUnknown_03005274 & 0xFF00) << 8) | (gUnknown_03005274 & 0xFF0000) >> 8
        | gUnknown_03005274 >> 24;
    gSaveGameState.unk68 = 0;
}

void SaveGameState(void)
{
    s32 i;
    gSaveGameState.header.unk2 = 0x1965;
    gSaveVersion++;
    gSaveGameState.header.unk4 = gSaveVersion;
    gSaveGameState.unkC = gUnknown_03005274;
    gSaveGameState.unk18 = sub_0200151c();
    gSaveGameState.header.checksum = sub_0200185c((void *)&gSaveGameState.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
    m4aMPlayAllStop();
    m4aSoundMain();
    VBlankIntrWait();
    m4aSoundVSyncOff();

    for (i = 0; i < TCG_SAVE_SECTOR_COUNT - 1; i++) {
        u32 failure;
        gSaveSectorNum++;
        if (gSaveSectorNum >= TCG_SAVE_SECTOR_COUNT) {
            gSaveSectorNum = 0;
        }

        failure
            = ProgramFlashSectorAndVerifyNBytes(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, &gSaveGameState, sizeof(struct TCG_SaveSectorData));

        if (!failure) {
            break;
        }
    }
    m4aSoundVSyncOn();
    VBlankIntrWait();
}

void InitGameState(void)
{
    u8 *p;
    s32 i;

    p = (u8 *)&gSaveGameState.unk8;
    for (i = 0; i < (uintptr_t)&gSaveGameState.unk58 - (uintptr_t)&gSaveGameState.unk8; i++) {
        *p++ = 0;
    }

    for (i = 0; i < 18; i++) {
        ((u8 *)&gSaveGameState.unk58)[i] = 0xff;
    }

    gSaveGameState.unk10 = sub_02008810();
    gSaveGameState.unk1C = 0xFF;
}
