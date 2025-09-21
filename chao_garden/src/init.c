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
    u8 filler[0xb];
    u32 unk64;
    u8 unk68;
    u8 pad[0x7FE];
}; /* size:0x858 according to sub_02000248 */

extern struct GameConfig gUnknown_02000008;

// TCG = Tiny Chao Garden
#define TCG_FIRST_SAVE_SECTOR 10
#define TCG_SAVE_SECTOR_COUNT 6

extern struct TCG_SaveSectorData gUnknown_03003B80;

void sub_02011e9c(void);

s16 sub_0200185c(s8 *a, s32 b);

extern u32 gUnknown_03000080;
extern u32 gUnknown_03000084;
extern u8 gUnknown_03003BD8[2];

extern void sub_02001528(u32);
extern u32 gUnknown_03005274;

void sub_0200043c(void);

// https://decomp.me/scratch/rGp3q
// void sub_02000248(void)
// {
//     u32 i;
//     s8 min = -1;
//     u32 p = 0;
//     IdentifyFlash();
//     SetFlashTimerIntr(2, gIntrTable[1]);

//     for (i = 0; i < 6; i++) {
//         ReadFlash(i + 10, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
//         if (gUnknown_03003B80.header.unk2 == 0x1965) {
//             s16 checksum = sub_0200185c(&gUnknown_03003B80.header.unk2, sizeof(struct TCG_SaveSectorData) - sizeof(u16));
//             if (checksum == gUnknown_03003B80.header.checksum) {
//                 if (min < 0) {
//                     min = i;
//                     p = gUnknown_03003B80.header.unk4;
//                 } else if (p < gUnknown_03003B80.header.unk4) {
//                     min = i;
//                     p = gUnknown_03003B80.header.unk4;
//                 }
//             }
//         }
//     }

//     if (min < 0) {
//         gUnknown_03000080 = 6;
//         gUnknown_03000084 = 0;
//         sub_0200043c();
//         gUnknown_03003B80.unk59 = 0;
//         gUnknown_03003B80.unk1F = 0x58;
//         gUnknown_03003B80.unk20 = 0x68;
//     } else {
//         gUnknown_03000080 = min;
//         gUnknown_03000084 = p;
//         ReadFlash(min + 10, 0, &gUnknown_03003B80, sizeof(struct TCG_SaveSectorData));
//         sub_02001528(gUnknown_03003B80.unk18);
//     }
//     gUnknown_03005274 = gUnknown_03003B80.unkC;
//     gUnknown_03003B80.unk64 = gUnknown_03003B80.unkC << 0x18 | (gUnknown_03003B80.unkC & 0xFF00 << 8)
//         | (gUnknown_03003B80.unkC & 0xFF0000) >> 8 | gUnknown_03003B80.unkC >> 0x18;
//     gUnknown_03003B80.unk68 = 0;
// }
