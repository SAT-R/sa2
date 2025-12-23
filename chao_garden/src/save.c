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
        ReadFlash(i + 10, 0, &gGameState, sizeof(struct TCG_SaveSectorData));
        if (gGameState.header.unk2 == 0x1965) {
            u16 checksum = sub_0200185c((void *)&gGameState.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
            if (checksum == gGameState.header.checksum) {
                if (sector < 0) {
                    sector = i;
                    p = gGameState.header.unk4;
                } else if (gGameState.header.unk4 > p) {
                    sector = i;
                    p = gGameState.header.unk4;
                }
            }
        }
    }

    if (sector < 0) {
        gSaveSectorNum = TCG_SAVE_SECTOR_COUNT;
        gSaveVersion = 0;
        InitGameState();
        gGameState.unk59 = 0;
        gGameState.unk1F = 0x58;
        gGameState.unk20 = 0x68;
    } else {
        gSaveSectorNum = sector;
        gSaveVersion = p;
        ReadFlash(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, 0, &gGameState, sizeof(struct TCG_SaveSectorData));
        sub_02001528(gGameState.unk18);
    }
    if (gGameState.unk8 >= gUnknown_02000008.unk0) {
        gUnknown_03005274 = gGameState.unkC;
    } else {
        p = gGameState.unkC + (gUnknown_02000008.unk0 - gGameState.unk8);
        if (p > 0x1869F) {
            p = 0x1869F;
        }
        gUnknown_03005274 = p;
        gGameState.unk8 = gUnknown_02000008.unk0;
    }
    gGameState.unk64 = (gUnknown_03005274 & 0xFF) << 24 | ((gUnknown_03005274 & 0xFF00) << 8) | (gUnknown_03005274 & 0xFF0000) >> 8
        | gUnknown_03005274 >> 24;
    gGameState.unk68 = 0;
}

void SaveGameState(void)
{
    s32 i;
    gGameState.header.unk2 = 0x1965;
    gSaveVersion++;
    gGameState.header.unk4 = gSaveVersion;
    gGameState.unkC = gUnknown_03005274;
    gGameState.unk18 = sub_0200151c();
    gGameState.header.checksum = sub_0200185c((void *)&gGameState.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
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

        failure = ProgramFlashSectorAndVerifyNBytes(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, &gGameState, sizeof(struct TCG_SaveSectorData));

        if (!failure) {
            break;
        }
    }
    m4aSoundVSyncOn();
    VBlankIntrWait();
}

NONMATCH("asm/non_matching/InitGameState.inc", void InitGameState(void))
{
    u8 *p, *p2;
    u32 r1, i;
    p = (u8 *)(&gGameState.unk8);

    i = 0;
    r1 = 0x50;
    for (i = 0; i < r1; i++) {
        *p = 0;
        p++;
    }

    p = (u8 *)&gGameState.unk58;
    r1 = 0xFF;
    p2 = p + 0x11;
    do {
        *p2-- = r1;
    } while ((s32)p2 >= (s32)p);

    gGameState.unk10 = sub_02008810();
    gGameState.unk1C = 0xFF;
}
END_NONMATCH
