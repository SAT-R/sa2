#include "global.h"
#include "m4a.h"

void sub_020000c4(void);

void sub_020018c8(void);
void sub_02000bd0(void);

struct UNK_03003330 {
    void (*unk0)(void);
    u32 filler4;
    u32 unk8;
    u16 fillerC;
    u8 unkE;
};

extern struct UNK_03003330 gUnknown_03003330;

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
