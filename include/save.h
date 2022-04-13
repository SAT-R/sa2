#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"

bool16 sub_8063940_HasProfile(void);

struct GameData {
    u32 unk0;

    u8 filler4[3];

    u8 unk7[5];
    u8 unkC[5];
    
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;

    u8 filler[856];
    u32 checksum;
};

#endif
