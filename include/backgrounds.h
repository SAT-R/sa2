#ifndef GUARD_BACKGROUNDS_H
#define GUARD_BACKGROUNDS_H

#include "global.h"
#include "sprite.h"
#include "data.h"

struct UNK_3005B80_UNK4_UNK8 {
    s8 unk0;
    s8 unk1;
    u16 unk2;

    u8 unk4;
    u8 unk5;
    u8 unk6;
    
    s8 unk7;
    s8 unk8;
    s8 unk9;
    s8 unkA;

    u8 unkB;

    u16 unkC[16];
};

struct UNK_3005B80_UNK4 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3;

    const u8* unk4;

    const void* unk8;

    u8 unkC;
    u8 unkD;
    u8 unkE;
    
    s8 unkF;
    s8 unk10;
    s8 unk11;
    s8 unk12;

    u8 unk13;

    u16 unk14[16];

    s16 unk34;
    u8 unk36;
};

struct UNK_3005B80 {
    struct UNK_3005B80_UNK4* unk0;
    struct Unk_03002400* unk4;
};

// Used outside of this module I think, so declared here
extern struct UNK_3005B80 gUnknown_03005B80;

void sub_808DB2C(u8 vcount);

#endif // GUARD_BACKGROUNDS_H
