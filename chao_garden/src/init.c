#include "global.h"
#include "agb_flash.h"
#include "m4a.h"

extern IntrFunc gIntrTable[4];

// TCG = Tiny Chao Garden
struct TCG_SaveSectorHeader {
    u16 checksum;
    u16 unk2;
    u32 unk4;
};

struct TCG_SaveSectorData {
    struct TCG_SaveSectorHeader header;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 unk1F;
    u8 unk20;
    u8 filler21[0x38];
    u8 unk59;
    u8 filler[0xA];
    u32 unk64;
    u8 unk68;
    u8 unk69;
    u8 pad[0x7EE];
}; /* size:0x858 according to sub_02000248 */

struct GameConfig {
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

extern struct GameConfig gUnknown_02000008;

// TCG = Tiny Chao Garden
#define TCG_FIRST_SAVE_SECTOR 10
#define TCG_SAVE_SECTOR_COUNT 6

extern struct TCG_SaveSectorData gUnknown_03003B80;

void sub_02011e9c(void);

s16 sub_0200185c(s8 *a, s32 b);

extern u8 gUnknown_03000080;
extern u32 gUnknown_03000084;
extern u8 gUnknown_03003BD8[2];

extern void sub_02001528(u32);
extern u32 gUnknown_03005274;
u32 sub_0200151c(void);

void sub_0200043c(void);

void sub_02000248(void)
{
    s32 i;
    u32 p;
    s8 min;
    IdentifyFlash();
    SetFlashTimerIntr(2, &gIntrTable[2]);

    p = 0;
    min = -1;

    for (i = 0; i < 6; i++) {
        ReadFlash(i + 10, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
        if (gUnknown_03003B80.header.unk2 == 0x1965) {
            u16 checksum = sub_0200185c((void *)&gUnknown_03003B80.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
            if (checksum == gUnknown_03003B80.header.checksum) {
                if (min < 0) {
                    min = i;
                    p = gUnknown_03003B80.header.unk4;
                } else if (gUnknown_03003B80.header.unk4 > p) {
                    min = i;
                    p = gUnknown_03003B80.header.unk4;
                }
            }
        }
    }

    if (min < 0) {
        gUnknown_03000080 = 6;
        gUnknown_03000084 = 0;
        sub_0200043c();
        gUnknown_03003B80.unk59 = 0;
        gUnknown_03003B80.unk1F = 0x58;
        gUnknown_03003B80.unk20 = 0x68;
    } else {
        gUnknown_03000080 = min;
        gUnknown_03000084 = p;
        ReadFlash(gUnknown_03000080 + 10, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
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
    gUnknown_03003B80.unk64 = (u8)gUnknown_03005274 << 0x18 | ((gUnknown_03005274 & 0xFF00) << 8) | (gUnknown_03005274 & 0xFF0000) >> 8
        | gUnknown_03005274 >> 0x18;
    gUnknown_03003B80.unk68 = 0;
}

void sub_020003ac(void)
{
    s32 i;
    gUnknown_03003B80.header.unk2 = 0x1965;
    gUnknown_03000084++;
    gUnknown_03003B80.header.unk4 = gUnknown_03000084;
    gUnknown_03003B80.unkC = gUnknown_03005274;
    gUnknown_03003B80.unk18 = sub_0200151c();
    gUnknown_03003B80.header.checksum
        = sub_0200185c((void *)&gUnknown_03003B80.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
    m4aMPlayAllStop();
    m4aSoundMain();
    VBlankIntrWait();
    m4aSoundVSyncOff();

    for (i = 0; i < 5; i++) {
        u32 failure;
        gUnknown_03000080++;
        if (gUnknown_03000080 > 5) {
            gUnknown_03000080 = 0;
        }

        failure = ProgramFlashSectorAndVerifyNBytes(gUnknown_03000080 + 10, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));

        if (!failure) {
            break;
        }
    }
    m4aSoundVSyncOn();
    VBlankIntrWait();
}

u32 sub_02008810(void);

// void sub_0200043c(void)
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
