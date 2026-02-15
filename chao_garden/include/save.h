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
    u8 filler21[0xF];
    u8 unk30[3][2];
    u8 unk36[16][2];
    u8 unk56;
    u8 unk57;
    u8 unk58;
    u8 unk59;
    u8 unk5A[4];
    u8 unk5E;
    u8 unk5F;
    u8 unk60;
    u8 unk61;
    u8 unk62;
    u8 unk63;
    u32 unk64;
    u8 unk68;
    u8 unk69;

    // size: 0x7EE
    // Probably something special from now on
    u8 unk6A[6];
    u8 unk70;
    u8 unk71;
    u8 unk72;
    u8 unk73;
    u8 unk74;
    u8 filler75[0xB];
    u8 unk80[15];
    u8 filler90[0x49];

    // size: 0x780
    // Another break?
    u8 unkD8[0x10];
    u8 unkE8;
    u8 unkE9;
    u8 unkEA;
    u8 unkEB;
    u8 unkEC;
    u8 unkED;
    u8 unkEE;
    u8 unkEF;
    u8 unkF0;
    u8 unkF1;
    u8 unkF2;
    u8 unkF3;
    u8 unkF4;
    u8 unkF5;
    u8 unkF6;
    u8 unkF7;
    u8 unkF8;
    u8 unkF9;
    u8 unkFA;
    u8 unkFB;
    u8 fillerFC[0x36];
    u8 unk132;
    u8 filler133[0x3b9];
    u8 unk4EC[4][2];
    u8 filler4ED[0x34];
    u8 unk528;
    u8 unk529;
    u8 filler52A[0x32E];
}; /* size:0x858 according to LoadGameState */

extern struct TCG_SaveSectorData gSaveGameState;

void LoadGameState(void);

#endif // GUARD_TCG_SAVE_H
