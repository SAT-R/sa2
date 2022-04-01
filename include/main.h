#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

// extern void sub_8001404(void);
extern void InitMain(void);

extern char gUnknown_0300188C;
extern s32 gUnknown_03001840;
extern s32 gUnknown_03001884;
extern s32 gUnknown_03004D54;
extern s32 gUnknown_030022C0;
extern s32 gUnknown_030022AC;

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

extern char gUnknown_030053B4;
extern int gUnknown_03001840;
extern char gUnknown_030026F4;
extern char gUnknown_03001954;
extern int gUnknown_03001950;
extern int gUnknown_03002790;

int sub_8000420(union MultiSioData* a, union MultiSioData b[4], int c);
void sub_8002724();
void sub_80019A0();
void sub_8001C90();
void sub_80019A0();
void sub_8001D78();

void GetInput(void);
void ClearOamBufferCpuSet(void);
void MainLoop(void);

#endif
