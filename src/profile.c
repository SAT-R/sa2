#include "global.h"
#include "profile.h"
#include "m4a.h"
#include "task.h"
#include "input.h"
#include "save.h"
#include "malloc_ewram.h"
#include "random.h"
#include "constants/songs.h"

extern void* gUnknown_03005B50;
extern u32 gUnknown_03005B54;

struct UNK_8063730_UNK0 {
    u16 unk0[6];

    u16 unkC[0x13C];
    struct SectorDataUnk2A4 unk284[10];

    u8 unk34C;
    u8 unk34D;
    u8 unk34E;

    u8 filler34F;

    struct SaveGameUnk2C unk350; /* size 0x8 */
};

struct UNK_8063730 {
    struct UNK_8063730_UNK0 unk0;

    u8 unk358;
    u8 unk359;
    u8 unk35A;
    u8 unk35B;
    u8 unk35C;
    u8 unk35D;
    u8 unk35E;

    u8 filler35F;

    u16 unk360;
    u8 filler362[0X41E];
    u8 unk780;
    u8 unk781;
    u8 unk782;
    u8 unk783;
    u8 filler784[4];
}; /* size 0x788 */

// CharacterSelection stuff
extern void sub_806A75C(void);
extern void sub_806A758(struct Task*);
extern void sub_8063B38(struct UNK_8063730*);

// CreateOptionsScreen
void sub_8063730(u16 p1) {
    struct Task* t;
    struct UNK_8063730* optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(sub_806A75C, 0x788, 0x1000, 4, sub_806A758);
    optionsScreen = TaskGetStructPtr(t, optionsScreen);

    sub_8063B38(optionsScreen);

    optionsScreen->unk358 = p1;
    optionsScreen->unk360 = 0;
    optionsScreen->unk781 = 0;
    optionsScreen->unk783 = 0;
    optionsScreen->unk780 = 0;
    optionsScreen->unk782 = 0xFF;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
}

struct UNK_80637EC {
    u8 filler0[0x1FC];
    u32 unk1FC;
    u16* unk200;
    u8 filler204[0x500];
    u8 unk704;
    u8 unk705;
    u8 unk706;
    u8 unk707;
    u8 unk708;
    u8 unk709;
    u8 unk70A[5];
    u8 unk70F;
    u8 unk710;
    u8 unk711;
    u8 filler712[2];
}; /* size 0x714 */

extern void sub_806B5A4(void);
extern void sub_8068640(void);

extern void sub_8068700(struct UNK_80637EC*);
extern void sub_80687BC(struct UNK_80637EC*);

// CreateZoneSectionScreen
void sub_80637EC(u16 p1, u16 p2) {
    s16 i;
    struct Task* t;
    struct UNK_80637EC* config;

    t = TaskCreate(sub_806B5A4, 0x714, 0x2000, 4, 0);
    config = TaskGetStructPtr(t, config);

    for (i = 1; i < 5; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    config->unk1FC = 0;
    config->unk200 = (u16*)EwramMalloc(0x278);
    config->unk704 = p2;
    config->unk705 = 0;
    config->unk706 = 0;
    config->unk707 = 0;
    config->unk708 = 0;
    config->unk709 = i;

    for (i = 0; i < 5; i++) {
        config->unk70A[i] = gLoadedSaveGame->unk7[i];
    }

    config->unk70F = gLoadedSaveGame->unk6 - 1;
    config->unk710 = p1;
    config->unk711 = 2;

    if (config->unk70F > 5) {
        config->unk70F = 1;
    }

    memcpy(config->unk200, gLoadedSaveGame->unk34, 0x278);

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_8068640();
    sub_8068700(config);
    sub_80687BC(config);
    m4aSongNumStart(MUS_ZONE_SELECTION);
}

struct UNK_8063940 {
    u8 filler0[0x1FC];
    u32 unk1FC;
    u8 unk200;
    u8 unk201;
    u8 unk202[2];
}; /* size 0x204 */

extern void sub_806B0D8(void);
extern void sub_80668A8(struct UNK_8063940*);
extern void sub_806B0AC(struct UNK_8063940*);
extern void sub_8066930(struct UNK_8063940*);

void sub_8063940_CreateProfileScreen(void) {
    struct Task* t;
    struct UNK_8063940* config;

    // Reseed the rng, might be a macro
    u32 rand1, rand2, rand3;
    rand1 ^= (Random() << 16);
    rand1 ^= Random();
    rand3 ^= rand1;
    SeedRng(rand2, rand3);
    rand1 ^= (Random() << 16);
    rand1 ^= Random();
    rand2 ^= rand1;
    SeedRng(rand2, rand3);

    t = TaskCreate(sub_806B0D8, 0x204, 0x2000, 4, 0);
    config = TaskGetStructPtr(t, config);

    config->unk1FC = 0;
    config->unk200 = gLoadedSaveGame->unk6 - 1;
    config->unk201 = 1;
    if (config->unk200 > 5) {
        config->unk200 = 1;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_80668A8(config);
    sub_806B0AC(config);
    sub_8066930(config);
}

struct UNK_8063A00 {
    u8 filler0[0x14C];

    u32 unk14C;

    u8 filler150[0x100];

    u16 unk250;
    u8 unk252;
    u8 unk253;

    u8 filler254[342];

    u16 unk3AA;

    u16 unk3AC[6];

    u16 unk3B8;
    u8 unk3BA;
    u8 unk3BB;
}; /* size 0x3BC */

extern void sub_806B354(void);
extern void sub_8067420(u8);

extern void sub_8067484(struct UNK_8063A00*);
extern void sub_806751C(struct UNK_8063A00*);
extern void sub_8067610(struct UNK_8063A00*);
extern void sub_8067710(struct UNK_8063A00*);

// CreateProfileNameScreen
void sub_8063A00(s16 p1) {
    struct Task* t;
    struct UNK_8063A00* config;
    s16 i;
    u8 temp;
    t = TaskCreate(sub_806B354, 0x3BC, 0x2000, 4, 0);
    config = TaskGetStructPtr(t, config);

    config->unk14C = 0;
    config->unk3BA = gLoadedSaveGame->unk6 - 1;
    
    config->unk3BB = p1 == 1 ? 2 : 1;
    config->unk252 = 0;

    if (config->unk3BA == 0) {
        config->unk3B8 = 0;
        config->unk253 = 0;
        config->unk250 = 0;
    } else {
        config->unk3B8 = 99;
        config->unk253 = 0;
        config->unk250 = 99;
    }

    if (config->unk3BA > 5) {
        config->unk3BA = 1;
    }

    for (i = 0; i < 6; i++) {
        config->unk3AC[i] = 0xFFFF;
    }

    config->unk3AA = 0;
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_8067420(config->unk3BA);
    sub_8067484(config);
    sub_806751C(config);
    sub_8067610(config);
    sub_8067710(config);
}

// InitOptionsProfileData
void sub_8063B38(struct UNK_8063730* optionsScreen) {
    s16 i;
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct UNK_8063730_UNK0* profile = &optionsScreen->unk0;

    memcpy(profile->unk0, saveGame->unk20, 12);
    memcpy(profile->unkC, saveGame->unk34, 0x278);
    memcpy(profile->unk284, saveGame->unk2AC, 200);

    profile->unk34C = saveGame->unk1C;
    profile->unk34D = saveGame->unk1D;
    profile->unk34E = saveGame->unk1E;

    memcpy(&profile->unk350, &saveGame->unk2C, 8);

    optionsScreen->unk359 = saveGame->unk4;
    optionsScreen->unk35A = saveGame->unk5;
    optionsScreen->unk35B = saveGame->unk6 - 1;
    optionsScreen->unk35C = saveGame->unk11;
    optionsScreen->unk35D = saveGame->unk12;
    optionsScreen->unk35E = saveGame->unk13;

    for (i = 0; i < 6; i++) {
        if (profile->unk0[i] == 0xFFFF) {
            break;
        }
    }

    for (; i < 6; i++) {
        profile->unk0[i] = 0xFFFF;
    }

    if (optionsScreen->unk359 > 1) {
        optionsScreen->unk359 = 0;
    }

    if (optionsScreen->unk35A > 1) {
        optionsScreen->unk35A = 0;
    }

    if (optionsScreen->unk35B > 5) {
        optionsScreen->unk35B = 1;
    }

    if (optionsScreen->unk35C > 1) {
        optionsScreen->unk35C = 0;
    }

    if (optionsScreen->unk35D > 1) {
        optionsScreen->unk35D = 0;
    }
}

