#include "global.h"
#include "backgrounds.h"

struct UNK_808DB78 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
    u8 unk8;

    u16 filler9;

    u8 unkC[BG_PLTT_SIZE];
};

UNUSED void sub_808DB78(u32 a, u16 b, u8 c, u8 d, u8 e, struct UNK_808DB78* f) {
    f->unk0 = 0;
    f->unk1 = 0;
    f->unk2 = b;
    f->unk4 = 0;
    f->unk6 = c;
    f->unk7 = d;
    f->unk8 = e;
    CpuFastCopy((void*)BG_PLTT, &f->unkC, BG_PLTT_SIZE);
}
