#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

void GameInit(void);
extern void InitMain(void);

extern char gUnknown_0300188C;
extern s32 gUnknown_03001840;
extern u8* gUnknown_03001884;
extern u8* gUnknown_03004D54;
extern u8* gUnknown_030022C0;
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

extern union MultiSioData gUnknown_03002860; // gMultiSioSend
extern union MultiSioData gUnknown_03001890[4]; // gMultiSioRecv

extern int gUnknown_03001840;
extern int gUnknown_03001950;
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
extern u16 gUnknown_03002830[4][2];  // gBgScrollRegs
extern short gUnknown_030017F4[2];
extern short gUnknown_03002840;  // gDispCnt
extern struct Unk_03002EC0 gUnknown_030027A0[];
extern u8 gUnknown_030018F0;
extern u8 gUnknown_03002AE0;
extern int gUnknown_03004D90;
extern OamData gUnknown_030022D0[];
extern u8 gUnknown_03001850[];
extern u8 gUnknown_03004D60[];
extern u16 gUnknown_03002060[0x100];  // gObjPalette
extern u16 gUnknown_03002880[0x100];  // gBgPalette
extern struct BgAffineRegs gUnknown_03001920; // gBgAffineRegs
extern short gUnknown_03001944;
extern short gUnknown_030017F0;
extern short gUnknown_03005394;
extern short gUnknown_03002A8C;
extern short gUnknown_03004D58;
extern short gUnknown_0300194C;
extern short gUnknown_03002820;
extern short gUnknown_03005398;
extern u16 gUnknown_03002270[6];  // gWinRegs
extern u8 gUnknown_03002A80;
extern u32 gUnknown_03002878;

extern struct BlendRegs gUnknown_030018E8;  // gBldRegs
extern u16 gUnknown_030026D0;
extern int gUnknown_030053B8;
extern u32 gUnknown_030053B0;
extern u32 gUnknown_03002264;
extern u8 gUnknown_03001B60[2][0x280];
extern u8 gUnknown_03002700[];
extern u8 gUnknown_03002850[];
extern s32 gUnknown_03001840;

extern u8 gUnknown_030053B4;
extern short gUnknown_03001888;
extern int gUnknown_03001940;

extern int gUnknown_030007C4;
extern int gUnknown_03001950;
extern u8 gUnknown_03001954;
extern int gUnknown_0203B000;
extern u8 gUnknown_030026E0[];
extern u8 gUnknown_03001948;
extern u8 gUnknown_03001870[];
extern u8 gUnknown_030053A0[];

extern IntrFunc gUnknown_030007F0;
extern IntrFunc const gIntrTableTemplate[];
extern IntrFunc gIntrTable[];

extern void sub_80952A8(void);
extern void sub_8095844(int a);
extern void sub_8007CC8(void);
extern u16 sub_8096C9C(void);
extern void sub_8096884(int a, int* b);
extern void sub_8002504(void);
extern void sub_8007B2C(void);
extern void sub_800032C(int a);

int sub_8000420(union MultiSioData* a, union MultiSioData b[4], int c);
void sub_8002724();
void sub_80019A0();
void sub_8001C90();
void sub_8001D78();

void GetInput(void);
void ClearOamBufferCpuSet(void);
void GameLoop(void);

#endif
