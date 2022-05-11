/**
 * Used to store unknown globals defined in iwram and ewram
 * until we can find a better place for them
 */
#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"

// Mostly used in `main.c`
extern u32* gUnknown_03001884;
extern u32* gUnknown_03004D54;
extern u32* gUnknown_030022C0;
extern u32* gUnknown_030022AC;
extern u32 gUnknown_03001B60[2][160];

// set in init.c
extern u32* gUnknown_03002794;
extern u32 gUnknown_030059D8;
extern u32 gUnknown_03005848;
extern u32 gUnknown_030059D0[];
extern u8 gUnknown_0300543C;
extern u8 gUnknown_030054CC;
extern u32 gUnknown_030054DC;
extern u8 gUnknown_03005B34;
extern u8 gUnknown_030054C8;
extern u8 gUnknown_030054E4;
extern u16 gUnknown_03005424;
extern u8 gUnknown_030055B4;
extern u8 gUnknown_030054F0;
extern u16 gUnknown_0300544C;

extern u32 gUnknown_030055A0[4];
extern u8 gUnknown_03005500[4];
extern u8 gUnknown_030054B4[4];
extern u8 gUnknown_030054D4[4];


extern u16 gObjPalette[0x100];
extern u16 gBgPalette[0x100];

struct BgAffineRegs {
    u16 bg2pa;
    u16 bg2pb;
    u16 bg2pc;
    u16 bg2pd;
    u32 bg2x;
    u32 bg2y;
    u16 bg3pa;
    u16 bg3pb;
    u16 bg3pc;
    u16 bg3pd;
    u32 bg3x;
    u32 bg3y;
};

extern struct BgAffineRegs gBgAffineRegs;

// Not sure what these are yet
struct SomeStruct_59E0 {
    u8 filler[140];
    u32 unkA8;
};

extern struct SomeStruct_59E0 gUnknown_030059E0;

struct SomeStruct_5960 {
    u8 filler[92];
    u32 unk5C;
};

extern struct SomeStruct_5960 gUnknown_03005960;

struct SomeStruct_5660 {
    u8 filler[16];
    u32 unk10;
};

extern struct SomeStruct_5660 gUnknown_03005660;

// Used for the two background layers.
struct MapHeader {
    u16 X_Tiles; // Tiles inside Metatiles, usually 12 (0x0C)
    u16 Y_Tiles; // Tiles inside Metatiles, usually 12 (0x0C)
    u16 unk4;
    u8 unk6;
    u8 unk7;
    void * Tileset;
    u16 unkC;
    u16 unkD;
    u16 * Palette;
    u16 unk14;
    u16 unk16;
    const u16 * Metatiles;
    const u16 * Map;
}; /* size = 0x20 */

struct MapHeader_Full {
    struct MapHeader unk0;
    u16 Map_Width;  // in Metatiles
    u16 Map_Height; // in Metatiles
};

union __attribute__((transparent_union)) Unk_03002E60 {
    struct LevelInfo_1A0 *x;
    struct LevelInfo_1A0_Full *y;
};

struct BlendRegs {
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
};

extern u8 gUnknown_03002A84;
extern u8 gUnknown_0300287C;

// Pointer to gUnknown_080D5CE4
extern union Unk_03002E60 *gUnknown_03002260;

extern OamData gOamBuffer[];
extern u16 gBgCntRegs[4];
extern OamData gUnknown_030022D0[];
extern u16 gWinRegs[6];
extern struct BlendRegs gBldRegs;
extern u16 gDispCnt;  // gDispCnt
extern s16 gBgScrollRegs[4][2];  // gBgScrollRegs

#endif
