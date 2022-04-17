#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"

// If the sector's security field is not this value then the sector is either invalid or empty.
#define SECTOR_SECURITY_NUM 0x4547474D

bool16 sub_8063940_SaveGameExists(void);

struct SaveGame {
    u32 unk0;

    u8 unk4;
    u8 unk5;
    u8 unk6;

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
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 unk1F;

    u32 unk20[3];

    u16 unk2C;
    u16 unk2E;
    u16 unk30;
    u16 unk32;

    u8 unk34[0x278];
    u8 unk2AC[200];

    u32 unk374;
};

struct SaveSectorHeader {
    u32 securityKey, version;
};

struct SaveSectorData {
    struct SaveSectorHeader header;
    u32 unk8;

    u32 unkC[3];

    u8 unk18;
    u8 unk19;

    u8 unk1A;
    u8 unk1B;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;

    u8 unk1F[5];
    u8 unk24[5];

    u8 unk29;
    u8 unk2A;
    u8 unk2B;

    // Probably some structs
    u8 unk2C[0x278];
    u8 unk2A4[200];

    u32 unk36C;

    u32 unk370;
    u32 checksum;
};

// Some sort of save data?
extern struct SaveGame* gUnknown_03005B64;

#endif
