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
struct UNK_8063730 {
    u8 filler0[0x358];
    u8 unk358;
    u8 unk359[7];
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
