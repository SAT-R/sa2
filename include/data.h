/**
 * Used to store unknown globals defined in iwram and ewram
 * until we can find a better place for them
 */
#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "global.h"

// Mostly used in `main.c`
extern u8* gUnknown_03001884;
extern u8* gUnknown_03004D54;
extern u8* gUnknown_030022C0;

// Something task related
extern u32 gUnknown_03001840;

extern u8 gUnknown_03001B60[2][0x280];

// Used in ewram malloc 
extern void *gUnknown_020226D0;

// set in init.c
extern u32* gUnknown_03002260;
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
extern u16 gUnknown_0300544C;

extern u32 gUnknown_030055A0[4];
extern u8 gUnknown_03005500[4];
extern u8 gUnknown_030054B4[4];
extern u8 gUnknown_030054D4[4];



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

#endif
