#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

extern void sub_8001404(void);
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
extern u16 gInput;  // gInput
extern u16 gPressedKeys;  // gPressedKeys
extern u16 gReleasedKeys;  // gReleasedKeys
extern u16 gPrevInput;  // gPrevInput
extern u16 gUnknown_030022B8;
extern u16 gUnknown_03001880;
extern struct Unk_03006CB0 gUnknown_030053C0;



extern OamData gUnknown_03004D90[];
extern char gUnknown_03004D50;

extern u8 gUnknown_030018E0;
extern HBlankFunc gUnknown_03002AF0[0xa0];
#endif
