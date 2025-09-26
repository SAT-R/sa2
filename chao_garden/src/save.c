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
        ReadFlash(i + 10, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
        if (gUnknown_03003B80.header.unk2 == 0x1965) {
            u16 checksum = sub_0200185c((void *)&gUnknown_03003B80.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
            if (checksum == gUnknown_03003B80.header.checksum) {
                if (sector < 0) {
                    sector = i;
                    p = gUnknown_03003B80.header.unk4;
                } else if (gUnknown_03003B80.header.unk4 > p) {
                    sector = i;
                    p = gUnknown_03003B80.header.unk4;
                }
            }
        }
    }

    if (sector < 0) {
        gSaveSectorNum = TCG_SAVE_SECTOR_COUNT;
        gSaveVersion = 0;
        InitGameState();
        gUnknown_03003B80.unk59 = 0;
        gUnknown_03003B80.unk1F = 0x58;
        gUnknown_03003B80.unk20 = 0x68;
    } else {
        gSaveSectorNum = sector;
        gSaveVersion = p;
        ReadFlash(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
        sub_02001528(gUnknown_03003B80.unk18);
    }
    if (gUnknown_03003B80.unk8 >= gUnknown_02000008.unk0) {
        gUnknown_03005274 = gUnknown_03003B80.unkC;
    } else {
        p = gUnknown_03003B80.unkC + (gUnknown_02000008.unk0 - gUnknown_03003B80.unk8);
        if (p > 0x1869F) {
            p = 0x1869F;
        }
        gUnknown_03005274 = p;
        gUnknown_03003B80.unk8 = gUnknown_02000008.unk0;
    }
    gUnknown_03003B80.unk64 = (gUnknown_03005274 & 0xFF) << 24 | ((gUnknown_03005274 & 0xFF00) << 8) | (gUnknown_03005274 & 0xFF0000) >> 8
        | gUnknown_03005274 >> 24;
    gUnknown_03003B80.unk68 = 0;
}

void SaveGameState(void)
{
    s32 i;
    gUnknown_03003B80.header.unk2 = 0x1965;
    gSaveVersion++;
    gUnknown_03003B80.header.unk4 = gSaveVersion;
    gUnknown_03003B80.unkC = gUnknown_03005274;
    gUnknown_03003B80.unk18 = sub_0200151c();
    gUnknown_03003B80.header.checksum
        = sub_0200185c((void *)&gUnknown_03003B80.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
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

        failure = ProgramFlashSectorAndVerifyNBytes(gSaveSectorNum + TCG_FIRST_SAVE_SECTOR, &gUnknown_03003B80,
                                                    sizeof(struct TCG_SaveSectorData));

        if (!failure) {
            break;
        }
    }
    m4aSoundVSyncOn();
    VBlankIntrWait();
}

// void InitGameState(void)
// {
//     u32 i = 0;
//     u8 *p = (u8*)&gUnknown_03003B80.unk8;
//     u8 *p2;
//     for (i = 0; i < 0x50; i++) {
//         *p = 0;
//         p++;
//     }

//     p2 = &gUnknown_03003B80.unk68;
//     while ((u32)p2 < (u32)&gUnknown_03003B80 + sizeof(gUnknown_03003B80)) {
//         p2 = 0;
//     }
//     gUnknown_03003B80.unk10 = sub_02008810();
//     gUnknown_03003B80.unk1C = -1;
// }
