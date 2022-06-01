#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"

extern u8 gNumHBlankCallbacks;

extern u16 gPhysicalInput;


extern u8 gUnknown_03004D50;
extern u8 gNumHBlankIntrs;

extern HBlankFunc gHBlankIntrs[4];

struct Unk_020382A0_8_0
{
    u32 unk00;
    u8 unk04;
    u8 filler[3]; // must be here for matching
};

struct Unk_020382A0_8_1
{
    u16 unk00;
    u8 unk02;
    u16 unk04;
};

union Unk_020382A0_8
{
    struct Unk_020382A0_8_0 pat0;
    struct Unk_020382A0_8_1 pat1;
};

struct MultiSioData_0_0 {
    u8 unk0;
    u8 unk1;
    u16 hword[6];
    u8 unkE;
    u32 unk10;
};

struct MultiSioData_0_1 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4[0x10];
};

struct MultiSioData_0_2 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    union Unk_020382A0_8 unk4;
    u16 unkC;
    u8 unkE;
    u32 unk10;
};

union MultiSioData {
    struct MultiSioData_0_0 pat0;
    struct MultiSioData_0_1 pat1;
    struct MultiSioData_0_2 pat2;
}; /* size = MULTI_SIO_BLOCK_SIZE */

extern union MultiSioData gMultiSioSend; // gMultiSioSend
extern union MultiSioData gMultiSioRecv[4]; // gMultiSioRecv

extern u32 gMultiSioStatusFlags;

extern u8 gUnknown_030026F4;
extern u8 gUnknown_03002280[16];
extern u8 gUnknown_03004D80[16];
extern u16 gUnknown_030017F4[2];


extern u8 gUnknown_030018F0;
extern u8 gUnknown_03002AE0;
extern u32 gUnknown_03004D90;
extern u8 gUnknown_03001850[];
extern u8 gUnknown_03004D60[];

extern u16 gUnknown_03001944;
extern u16 gUnknown_030017F0;
extern u16 gUnknown_03005394;
extern u16 gUnknown_03002A8C;
extern u16 gUnknown_03004D58;
extern u16 gUnknown_0300194C;
extern u16 gUnknown_03002820;
extern u16 gUnknown_03005398;

extern u8 gUnknown_03002A80;
extern void* gUnknown_03002878;

extern s16 gUnknown_030026D0;
extern u32 gUnknown_030053B8;

extern u32 gFrameCount;


extern u16 gUnknown_03001888;
extern u32 gUnknown_03001940;

// likely `gMultiSioEnabled`
extern u8 gUnknown_03001954;

extern u32 gUnknown_0203B000;
extern HBlankFunc gHBlankCallbacks[4];
extern u8 gUnknown_03001948;
extern FuncType_030053A0 gUnknown_03001870[4];
extern FuncType_030053A0 gUnknown_030053A0[4];
extern u8 gUnknown_03002874;

extern IntrFunc gIntrTable[16];
extern u32 gIntrMainBuf[0x80];

extern void sub_8007CC8(void);

#endif
