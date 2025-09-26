#ifndef GUARD_TCG_SAVE_H
#define GUARD_TCG_SAVE_H

#include "global.h"

// TCG = Tiny Chao Garden
struct TCG_SaveSectorHeader {
    u16 checksum;
    u16 unk2;
    u32 unk4;
};

struct TCG_SaveSectorData {
    struct TCG_SaveSectorHeader header;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 unk1F;
    u8 unk20;
    u8 filler21[0x38];
    u8 unk59;
    u8 filler[0xA];
    u32 unk64;
    u8 unk68;
    u8 unk69;
    u8 pad[0x7EE];
}; /* size:0x858 according to LoadGameState */

extern struct TCG_SaveSectorData gUnknown_03003B80;

void LoadGameState(void);

#endif // GUARD_TCG_SAVE_H
