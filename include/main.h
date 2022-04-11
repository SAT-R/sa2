#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"

void GameInit(void);

extern char gUnknown_0300188C;

extern u8* gUnknown_030022AC;

extern u8 gUnknown_030022A0[];
struct Unk_03006CB0 {
    u8 filler0[8];
    u8 unk8;
};
extern void sub_8007DBC(u16);
extern u16 sub_8007D8C(void);

extern u8 gUnknown_03002700[];
extern u8 gUnknown_03002850[];
extern u16 gInput;
extern u16 gPressedKeys;
extern u16 gReleasedKeys;
extern u16 gPrevInput;
extern u16 gUnknown_030022B8;
extern u16 gUnknown_03001880;
extern struct Unk_03006CB0 gUnknown_030053C0;

extern OamData gOamBuffer[];
extern char gUnknown_03004D50;

extern u8 gUnknown_030018E0;
extern HBlankFunc gUnknown_03002AF0[0xa0];
extern u16 gBgCntRegs[4];

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
extern int gUnknown_03002790;
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

struct BlendRegs {
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
};

struct Unk_03002EC0 {
    /* TODO: fixing types breaks sub_081525DC. */
    u32 unk0;  // const void *
    u32 unk4;  // void *
    u16 unk8;
    u8 fillerA[2];
};

extern int gUnknown_03002790;
extern u8 gUnknown_030026F4;
extern u8 gUnknown_03002AE4;
extern u8 gUnknown_0300287C;
extern u8 gUnknown_03005390;
extern u8 gUnknown_03004D5C;
extern u8 gUnknown_03002A84;
extern u8 gUnknown_03002280[];
extern int gUnknown_03004D80;
extern u16 gBgScrollRegs[4][2];  // gBgScrollRegs
extern short gUnknown_030017F4[2];
extern short gDispCnt;  // gDispCnt
extern struct Unk_03002EC0* gUnknown_030027A0[];
extern u8 gUnknown_030018F0;
extern u8 gUnknown_03002AE0;
extern int gUnknown_03004D90;
extern OamData gUnknown_030022D0[];
extern u8 gUnknown_03001850[];
extern u8 gUnknown_03004D60[];
extern u16 gObjPalette[0x100];  // gObjPalette
extern u16 gBgPalette[0x100];  // gBgPalette
extern struct BgAffineRegs gBgAffineRegs; // gBgAffineRegs
extern short gUnknown_03001944;
extern short gUnknown_030017F0;
extern short gUnknown_03005394;
extern short gUnknown_03002A8C;
extern short gUnknown_03004D58;
extern short gUnknown_0300194C;
extern short gUnknown_03002820;
extern short gUnknown_03005398;
extern u16 gWinRegs[6];  // gWinRegs
extern u8 gUnknown_03002A80;
extern u32 gUnknown_03002878;

extern struct BlendRegs gBldRegs;  // gBldRegs
extern s16 gUnknown_030026D0;
extern int gUnknown_030053B8;
extern u32 gUnknown_030053B0;
extern u32 gUnknown_03002264;

extern u8 gUnknown_03002700[];
extern u8 gUnknown_03002850[];

extern u8 gUnknown_030053B4;
extern short gUnknown_03001888;
extern int gUnknown_03001940;

extern int gUnknown_030007C4;
extern u8 gUnknown_03001954;
extern int gUnknown_0203B000;
extern u8 gUnknown_030026E0[];
extern u8 gUnknown_03001948;
extern u8 gUnknown_03001870[];
extern FuncType_030053A0 gUnknown_030053A0[];
extern int gUnknown_03002790;
extern u8 gUnknown_03002874;

extern IntrFunc gUnknown_030007F0;
extern IntrFunc gIntrTable[];

extern void sub_8007CC8(void);
extern void SetFlashTimerIntr(int a, int* b);

void UpdateScreenDma();
void ClearOamBufferDma();
void UpdateScreenCpuSet();

void GetInput(void);
void ClearOamBufferCpuSet(void);
void GameLoop(void);

#endif
