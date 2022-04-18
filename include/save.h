#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "global.h"

// TODO: Work out what this is
struct SectorDataUnk2A4 {
    u8 filler0[4];
    u16 unk4;
    u8 filler6[10];
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
};

struct SaveGameUnk2C {
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

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

    // Could also be a struct
    u16 unk20[6];

    struct SaveGameUnk2C unk2C;

    u16 unk34[0x13C];
    struct SectorDataUnk2A4 unk2AC[10];

    u32 unk374;
};

struct SaveSectorHeader {
    u32 security, version;
};

struct SaveSectorData {
    struct SaveSectorHeader header;
    u32 unk8;

    u16 unkC[6];

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
    u16 unk2C[0x13C];

    struct SectorDataUnk2A4 unk2A4[10];

    u32 unk36C;

    u32 unk370;
    u32 checksum;
};

// If the sector's security field is not this value then the sector is either invalid or empty.
#define SECTOR_SECURITY_NUM 0x4547474D
#define SECTOR_CHECKSUM_OFFSET offsetof(struct SaveSectorData, checksum)
#define NUM_SAVE_SECTORS 10

// Some sort of save data?
extern struct SaveGame* gLoadedSaveGame;

bool16 sub_8063940_SaveGameExists(void);
void sub_80723C4_SaveInit(void);
s16 sub_8072474_LoadSaveGame(void);
void sub_80724C0_LoadCompletedSaveGame(void);

#endif
