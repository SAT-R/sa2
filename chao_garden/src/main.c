#include "global.h"
#include "m4a.h"

struct GameConfig {
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

struct UNK_03003330 {
    void (*unk0)(void);
    u32 filler4;
    u32 unk8;
    u16 unkC;
    u8 unkE;
    u8 unkF;
    u8 unk10;
};

extern struct GameConfig gUnknown_02000008;
extern struct UNK_03003330 gUnknown_03003330;

void sub_020000c4(void);

void sub_020018c8(void);
void sub_02000bd0(void);


extern struct UNK_03003330 gUnknown_03003330;

extern void sub_02001528(u32);
extern void sub_0200019c(void);
extern void sub_02000248(void);
extern void sub_02000480(void);
extern void sub_02000c6c(void);
extern void sub_0200be24(void);
extern void sub_0200d27c(void);
extern void sub_020018a0(void);

void sub_020000c4(void) {
    switch (gUnknown_02000008.unk4) {
        default:
        case 0:
            gUnknown_03003330.unk10 = 0;
            break;
        case 1:
            gUnknown_03003330.unk10 = 1;
            break;
        case 2:
            gUnknown_03003330.unk10 = 2;
            break;
        case 3:
            gUnknown_03003330.unk10 = 3;
            break;
        case 4:
            gUnknown_03003330.unk10 = 4;
            break;
    }

    sub_02001528(gUnknown_02000008.unk8);
    sub_0200019c();
    sub_02000248();
    sub_02000480();
    sub_02000c6c();
    sub_020018a0();
    sub_0200be24();
    sub_0200d27c();
    gUnknown_03003330.unkF = 0;
    gUnknown_03003330.unkC = 0;
    gUnknown_03003330.unk8 = 0;
    gUnknown_03003330.unkE = 0;
}

void AgbMain() {
    sub_020000c4();
    gUnknown_03003330.unk0 = sub_020018c8;
    while (TRUE) {
        VBlankIntrWait();
        sub_02000bd0();
        gUnknown_03003330.unk0();
        m4aSoundMain();
        gUnknown_03003330.unk8++;
        gUnknown_03003330.unkE = 1;
    }
}
