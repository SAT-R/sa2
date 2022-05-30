#include "global.h"
#include "profile.h"
#include "m4a.h"
#include "task.h"
#include "input.h"
#include "save.h"
#include "malloc_ewram.h"
#include "random.h"
#include "sprite.h"
#include "constants/songs.h"
#include "data.h"

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

// OptionsScreen
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

    s16 unk360;
    s16 unk362;
    struct Unk_03002400 unk364;
    struct Unk_03002400 unk3A4;
    struct UNK_0808B3FC_UNK240 unk3E4;
    struct UNK_0808B3FC_UNK240 unk414[8];
    struct UNK_0808B3FC_UNK240 unk594[4];
    struct UNK_0808B3FC_UNK240 unk654[6];
    struct UNK_802D4CC_UNK270 unk774;
    s8 unk780;
    s8 unk781;
    s8 unk782;
    s8 unk783;
    s8 unk784;

    u8 filler785[3];
}; /* size 0x788 */

// CreateOptionsScreen stuff
extern void sub_806A75C(void);
extern void sub_806A758(struct Task*);
static void sub_8063B38(struct UNK_8063730*);

// CreateOptionsScreen
void sub_8063730(u16 p1) {
    struct Task* t;
    struct UNK_8063730* optionsScreen;
    s16 i;

    m4aSongNumStart(MUS_OPTIONS);

    t = TaskCreate(sub_806A75C, 0x788, 0x1000, TASK_x0004, sub_806A758);
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

    t = TaskCreate(sub_806B5A4, 0x714, 0x2000, TASK_x0004, 0);
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

// Language Selection Screen
struct UNK_8063940 {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60[6];
    struct UNK_0808B3FC_UNK240 unk180;
    u8 filler1B0[64];
    struct UNK_802D4CC_UNK270 unk1F0;
    // option screen
    struct UNK_8063730* unk1FC;
    // language
    s8 unk200;
    u8 unk201;
    u8 unk202[2];
}; /* size 0x204 */

extern void sub_806B0D8(void);
void sub_80668A8(struct UNK_8063940*);
extern void sub_806B0AC(struct UNK_8063940*);
void sub_8066930(struct UNK_8063940*);

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

    t = TaskCreate(sub_806B0D8, 0x204, 0x2000, TASK_x0004, 0);
    config = TaskGetStructPtr(t, config);

    config->unk1FC = NULL;
    config->unk200 = gLoadedSaveGame->unk6 - 1;
    config->unk201 = 1;
    if ((u8)config->unk200 > 5) {
        config->unk200 = 1;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_80668A8(config);
    sub_806B0AC(config);
    sub_8066930(config);
}


struct UNK_8063A00 {
    struct Unk_03002400 unk0[3];
    struct Unk_03002400 unkC0;
    struct Unk_03002400 unk100;
    
    struct UNK_802D4CC_UNK270 unk140;
    struct UNK_8064A40* unk14C;

    struct Unk_03002400 unk150[3];
    struct Unk_03002400 unk210;
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
extern void sub_8067420(s16);

extern void sub_8067484(struct UNK_8063A00*);
extern void sub_806751C(struct UNK_8063A00*);
extern void sub_8067610(struct UNK_8063A00*);
extern void sub_8067710(struct UNK_8063A00*);

// CreateProfileNameScreen
void sub_8063A00(s16 p1) {
    struct Task* t = TaskCreate(sub_806B354, 0x3BC, 0x2000, TASK_x0004, 0);
    struct UNK_8063A00* config = TaskGetStructPtr(t, config);
    s16 i;

    config->unk14C = NULL;
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

// GetProfileData
static void sub_8063B38(struct UNK_8063730* optionsScreen) {
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

// SetProfileData
void sub_8063C7C(struct UNK_8063730* optionsScreen) {
    struct SaveGame* saveGame = gLoadedSaveGame;
    struct UNK_8063730_UNK0* profile = &optionsScreen->unk0;

    memcpy(saveGame->unk20, profile->unk0, 12);
    memcpy(saveGame->unk34, profile->unkC, 0x278);

    memcpy(&saveGame->unk2AC[0], &profile->unk284[0], 0x14);

    saveGame->unk1C = profile->unk34C;
    saveGame->unk1D = profile->unk34D;
    saveGame->unk1E = profile->unk34E;

    memcpy(&saveGame->unk2C, &profile->unk350, 8);

    saveGame->unk4 = optionsScreen->unk359;
    saveGame->unk5 = optionsScreen->unk35A;
    saveGame->unk6 = optionsScreen->unk35B + 1;
    saveGame->unk11 = optionsScreen->unk35C;
    saveGame->unk12 = optionsScreen->unk35D;
}

void sub_8063D20(struct UNK_8063730* optionsScreen, s16 p2) {
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    if (!p2) {
        gBgScrollRegs[2][0] = 0xFF28;
    } else {
        gBgScrollRegs[2][0] = 0;
    }

    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    if (!p2) {
        unk774->unk0 = 0;
        unk774->unk2 = 2;
        unk774->unk4 = 0;
        unk774->unk6 = 0x100;
        unk774->unkA = 0;
        unk774->unk8 = 0xFF;

        sub_802D4CC(unk774);
    }
}

struct UNK_080D95E8 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
};

struct UNK_806B908 {
    u32 unk0;
    u16 unk4;
    u16 unk6;
};

extern const struct UNK_080D95E8 gUnknown_080D95E8[6];
extern const struct UNK_080D95E8 gUnknown_080D9618[6][8];
extern const struct UNK_080D95E8 gUnknown_080D9798[6][2];
extern const struct UNK_080D95E8 gUnknown_080D97F8[6][2];
extern const struct UNK_080D95E8 gUnknown_080D9858[6];

extern void sub_806A568(struct UNK_0808B3FC_UNK240 *, u8, u32, u16, u32, s16, s16, u16, u8, u8);
extern struct UNK_806B908 sub_806B908(u16);

void sub_8063DCC(struct UNK_8063730* optionsScreen, s16 p2) {
    s16 i;
    s16 temp0;
    struct UNK_806B908 local48;
    u8 language = optionsScreen->unk35B;
    struct UNK_0808B3FC_UNK240 *option3E4 = &optionsScreen->unk3E4;
    struct UNK_0808B3FC_UNK240 *options414 = optionsScreen->unk414;
    struct UNK_0808B3FC_UNK240 *options594 = optionsScreen->unk594;
    struct UNK_0808B3FC_UNK240 *options654 = optionsScreen->unk654;
    s16 itemPos;

    {
        const struct UNK_080D95E8 *itemText = &gUnknown_080D95E8[language];
        sub_806A568(
            option3E4, 
            0, 
            itemText->unk4,
            itemText->unk0,
            0x3000,
            0, 
            0xF,
            0xF,
            itemText->unk2,
            0
        );
    }
    {
        i = 0;
        itemPos = 0x1E;
        while (i < 8) {
            if (optionsScreen->unk35C || i != 5) {
                const struct UNK_080D95E8 *itemText = &gUnknown_080D9618[language][i];
                if (optionsScreen->unk780 == i)
                    temp0 = 0x20;
                else
                    temp0 = 0x28;
                if (p2 == 1 && i == 0) {
                    temp0 = -0xB8;
                }
                sub_806A568(
                    options414, 
                    0, 
                    itemText->unk4,
                    itemText->unk0,
                    0x3000,
                    temp0, 
                    itemPos,
                    0xD,
                    itemText->unk2,
                    0
                );
                itemPos += 15;
            }
            ++i;
            ++options414;
        }
    }
    {
        temp0 = !optionsScreen->unk780 ? 0x98 : 0xa0;
        if (p2 == 1) {
            temp0 = -0x40;
        }
        sub_806A568(
            options594, 
            0, 
            0x12,
            0x3BA,
            0x3000,
            temp0, 
            0x1E,
            0xC,
            0,
            0
        );
        ++options594;
    }
    {
        const struct UNK_080D95E8 *itemText = &gUnknown_080D9798[language][optionsScreen->unk359];
        temp0 = optionsScreen->unk780 == 1 ? 0x98 : 0xa0;
    
        sub_806A568(
            options594, 
            0, 
            itemText->unk4,
            itemText->unk0,
            0x3000,
            temp0, 
            0x2D,
            10,
            itemText->unk2,
            0
        );
        ++options594;
    }
    {
        const struct UNK_080D95E8 *itemText = &gUnknown_080D97F8[language][optionsScreen->unk35A];
        temp0 = optionsScreen->unk780 == 2 ? 0x98 : 0xa0;
    
        sub_806A568(
            options594, 
            0, 
            itemText->unk4,
            itemText->unk0,
            0x3000,
            temp0, 
            0x3C,
            10,
            itemText->unk2,
            0
        );
        ++options594;
    }
    {
        const struct UNK_080D95E8 *itemText = &gUnknown_080D9858[language];
        temp0 = optionsScreen->unk780 == 3 ? 0x98 : 0xa0;
    
        sub_806A568(
            options594, 
            0, 
            itemText->unk4,
            itemText->unk0,
            0x3000,
            temp0, 
            0x4B,
            10,
            itemText->unk2,
            0
        );
    }
    {
        u32 bVar1;
        u16 var4;
        temp0 = optionsScreen->unk780 == 0 ? 0xA3 : 0xAB;
        if (p2 == 1 && i == 0) {
            temp0 = -0x35;
        }
        i = 0;
        itemPos = 0x26;
        bVar1 = 0;
        while (i < 6) {
            if (bVar1) {
                var4 = 0x11;
            } else {
                var4 = optionsScreen->unk0.unk0[i];
            }
            if (var4 == 0xFFFF) {
                var4 = 0x11;
                bVar1 = 1;
            }
            local48 = sub_806B908(var4);
            sub_806A568(
                options654, 
                0, 
                local48.unk0,
                local48.unk4,
                0x3000,
                temp0, 
                itemPos,
                10,
                local48.unk6,
                0
            );
            options654->unk25 = optionsScreen->unk780 == 0 ? 7 : 8;
            ++i;
            ++options654;
            temp0 += 0xa;
        }
    }
    {
        options594 = optionsScreen->unk594;
        options414 = optionsScreen->unk414;
        for (i = 0; i < 8; i++) {        
            if (optionsScreen->unk780 == i) {
                options414->unk25 = 0;
            } else {
                options414->unk25 = 1;
            }
            ++options414;
            if (i > 3) continue;
            if (optionsScreen->unk780 == i) {
                options594->unk25 = 0;
            } else {
                options594->unk25 = 1;
            }
            ++options594;
        }
    }
    {
        sub_806A568(NULL, 0, 0, 0x3c4, 0, 0, 0, 0, 0, 0);
        sub_806A568(NULL, 0, 0, 0x3c4, 0, 0, 0, 0, 1, 0);
        sub_806A568(NULL, 0, 0, 0x3c3, 0, 0, 0, 0, 0xc, 0);
        sub_806A568(NULL, 0, 0, 0x3c3, 0, 0, 0, 0, 0xd, 0);
    }
}


void sub_80649A4(void);
void sub_806A99C(void);
void sub_806A8EC(void);
void sub_806AA4C(void);
void sub_806ACF0(void);
void sub_806A814(void);
static void sub_8064304(void);

void sub_80641B0(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    sub_80649A4();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        switch(optionsScreen->unk780) {
            case 3:
                sub_806A8EC();
                return;
            case 5:
                sub_806A99C();
                return;
            case 6:
                sub_806AA4C();
                return;
            case 7:
                sub_806ACF0();
                return;
            default:
                sub_806A814();
                return;
            
        }
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806ACF0();
        return;
    }

    if (gRepeatedKeys & DPAD_DOWN) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        optionsScreen->unk781 = optionsScreen->unk780;

        if (optionsScreen->unk780 > 6) {
            optionsScreen->unk780 = 0;
        } else {
            optionsScreen->unk780++;
        }

        if (optionsScreen->unk35C == 0 && optionsScreen->unk780 == 5) {
           optionsScreen->unk780++; 
        }
        optionsScreen->unk783 = 0;
        gCurTask->main = sub_8064304;
        return;
        
    }

    if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        optionsScreen->unk781 = optionsScreen->unk780;
        if (optionsScreen->unk780 < 1) {
            optionsScreen->unk780 = 7;
        } else {
            optionsScreen->unk780--;
        }

        if (optionsScreen->unk35C == 0 && optionsScreen->unk780 == 5) {
            optionsScreen->unk780--;
        }  
        
        optionsScreen->unk783 = 0;
        gCurTask->main = sub_8064304;
    }
}

extern const s8 gUnknown_080D9540[2][8];

static inline void sub_8064304_A(struct UNK_8063730* optionsScreen, s8 val) {
    s16 temp0;
    struct UNK_0808B3FC_UNK240* item;

    optionsScreen->unk360 = val;
    temp0 = val;

    item = &optionsScreen->unk414[optionsScreen->unk780];
    item->unk16 = temp0 + 0x20;
    item->unk25 = 0;

    if (optionsScreen->unk780 < 4) {
        item = &optionsScreen->unk594[optionsScreen->unk780];
        item->unk16 = temp0 + 0x98;
        item->unk25 = 0;

        if (optionsScreen->unk780 == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item = optionsScreen->unk654;
            
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = temp0 + (i * 10 + 0xA3);
                item->unk25 = 7;                    
            }
        }
    }

    temp0 = - 0xD8 - temp0 ;
    gBgScrollRegs[2][0] = temp0;    
}

static inline void sub_8064304_B(struct UNK_8063730* optionsScreen, s8 temp1) {
    struct UNK_0808B3FC_UNK240* item;
    
    item = &optionsScreen->unk414[optionsScreen->unk781];

    item->unk16 = temp1 + 0x20;
    item->unk25 = 1;

    if (optionsScreen->unk781 < 4) {
        item = &optionsScreen->unk594[optionsScreen->unk781];
        item->unk16 = temp1 + 0x98;
        item->unk25 = 1;

        if (optionsScreen->unk781 == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item = optionsScreen->unk654;
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = temp1 + (i * 10 + 0xA3);
                item->unk25 = 8;
            }
        }
    }
} 

static void sub_8064304(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    s16 unk783 = optionsScreen->unk783;
    
    sub_8064304_A(optionsScreen, gUnknown_080D9540[0][unk783]);
    sub_8064304_B(optionsScreen, gUnknown_080D9540[1][unk783]);

    sub_80649A4();

    if (++optionsScreen->unk783 > 7) {
        gCurTask->main = sub_80641B0;
    }
}

void sub_806A8A8(void);

extern const s16 gUnknown_080D9550[8];

static inline void sub_80644C4_A(struct UNK_8063730* optionsScreen, const s16* data) {
    s16 temp0;
    struct UNK_0808B3FC_UNK240* item;

    temp0 = optionsScreen->unk360 = data[optionsScreen->unk783];

    item = &optionsScreen->unk414[optionsScreen->unk780];
    item->unk16 = temp0 + 0x20;
    item->unk25 = 0;

    if (optionsScreen->unk780 < 4) {
        struct UNK_0808B3FC_UNK240* item;
        item = &optionsScreen->unk594[optionsScreen->unk780];
        item->unk16 = temp0 + 0x98;
        item->unk25 = 0;

        if (optionsScreen->unk780 == 0) {
            s16 i;
            struct UNK_0808B3FC_UNK240* item;
            item = optionsScreen->unk654;
            
            for (i = 0; i < 6; i++, item++) {
                item->unk16 = temp0 + (i * 10 + 0xA3);
                item->unk25 = 7;                    
            }
        }
    }

    temp0 = - 0xD8 - temp0 ;
    gBgScrollRegs[2][0] = temp0; 
}

void sub_80644C4(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9550);
    sub_80649A4();

    if (++optionsScreen->unk783 > 15) {
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_806A8A8;
    }
}

extern const s16 gUnknown_080D9570[8];

void sub_80641B0(void);

void sub_80645E0(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    
    sub_80644C4_A(optionsScreen, gUnknown_080D9570);

    sub_80649A4();

    if (++optionsScreen->unk783 > 15) {
        gUnknown_03005B54 = 0;
        gCurTask->main = sub_80641B0;
    }
}

void sub_8063DCC(struct UNK_8063730* optionsScreen, s16 p2);
void sub_8063D20(struct UNK_8063730* optionsScreen, s16 p2);
void sub_806A968(void);
void sub_806B854(struct Unk_03002400*, u32, u32, u32, u32, u32, u32, u32, u32, u32);

void sub_80646FC(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    s8 unk784 = optionsScreen->unk784;
    if (unk784) {
        return;
    }
    
    // TODO make this section a macro or a inline func
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = unk784;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);
    
    unk774->unk0 = unk784;
    unk774->unk2 = 2;
    unk774->unk4 = unk784;
    unk774->unk6 = 0x100;
    unk774->unkA = unk784;
    unk774->unk8 = 0xFF;

    gCurTask->main = sub_806A968;
}

void sub_806AA18(void);

void sub_80647C8(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    s8 unk784 = optionsScreen->unk784;
    if (unk784) {
        return;
    }
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = unk784;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);

    unk774->unk0 = unk784;
    unk774->unk2 = 2;
    unk774->unk4 = unk784;
    unk774->unk6 = 0x100;
    unk774->unkA = unk784;
    unk774->unk8 = 0xFF;

    m4aSongNumStart(MUS_OPTIONS);
    gCurTask->main = sub_806AA18;
}

void sub_806AAC8(void);

void sub_806489C(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    u8 unk35B = optionsScreen->unk35B;

    if (optionsScreen->unk784 == 1) {
        return;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    if (!optionsScreen->unk784) {
        sub_8063B38(optionsScreen);
    }

    optionsScreen->unk35B = unk35B;

    sub_8063D20(optionsScreen, 0);
    sub_806B854(&optionsScreen->unk364,0,7,0x85,0x1e,0x14,0,0,0,0);
    sub_806B854(&optionsScreen->unk3A4,1,0xe,0x86,0x1e,0x14,0,1,0,0);
    sub_8063DCC(optionsScreen, 0);

    unk774->unk0 = 0;
    unk774->unk2 = 2;
    unk774->unk4 = 0;
    unk774->unk6 = 0x100;
    unk774->unkA = 0;
    unk774->unk8 = 0xFF;

    if (!optionsScreen->unk784) {
        m4aSongNumStart(MUS_OPTIONS);
    }

    optionsScreen->unk784 = 0;
    gCurTask->main = sub_806AAC8;
}

void sub_80649A4(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_0808B3FC_UNK240 *option3E4 = &optionsScreen->unk3E4;
    struct UNK_0808B3FC_UNK240 *options414 = optionsScreen->unk414;
    struct UNK_0808B3FC_UNK240 *options594 = optionsScreen->unk594;
    struct UNK_0808B3FC_UNK240 *options654 = optionsScreen->unk654;
    s16 i;

    sub_80051E8(option3E4);

    for (i = 0; i < 8; i++, options414++) {
        if ((optionsScreen->unk35C || i != 5) && (sub_80051E8(options414), i < 4)) {
            sub_80051E8(options594);
            options594++;
        }
    }

    for (i = 0; i < 6; i++, options654++) {
        sub_80051E8(options654);
    }
}

// PlayerDataMenu
struct UNK_8064A40 {
    // Header and Footer UI
    struct UNK_0808B3FC_UNK240 unk0[2];
    // MenuItems
    struct UNK_0808B3FC_UNK240 unk60[4];
    // FocusOutline
    struct UNK_0808B3FC_UNK240 unk120;

    struct UNK_802D4CC_UNK270 unk150;
    
    // optionScreen
    struct UNK_8063730* unk15C;
    s8 unk160;
    s8 unk161;
    s8 unk162;
    s8 unk163;
}; /* size 0x164 */

void sub_8064C44(void);
static void sub_8064AC0(struct UNK_8064A40*);


void sub_8064A40(struct UNK_8063730* optionsScreen) {
    struct Task* t;
    struct UNK_8064A40* state;
    s16 temp;

    t = TaskCreate(sub_8064C44, 0x164, 0x2000, TASK_x0004, 0);
    state = TaskGetStructPtr(t, state);

    
    if (optionsScreen->unk782 != -1) {
        temp = optionsScreen->unk782; 
    } else {
        temp = 0;
    }

    state->unk15C = optionsScreen;
    state->unk160 = temp;
    state->unk161 = 0;
    state->unk162 = optionsScreen->unk35B;

    sub_8064AC0(state);
}

extern const struct UNK_080D95E8 gUnknown_080D9C30[6];
extern const struct UNK_080D95E8 gUnknown_080D9C60[6];
extern const struct UNK_080D95E8 gUnknown_080D9C90[6][4];

// CreatePlayerDataMenuUI
static void sub_8064AC0(struct UNK_8064A40* state) {
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk120 = &state->unk120;
    
    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D9C30[state->unk162];
    const struct UNK_080D95E8 *itemText2 = &gUnknown_080D9C60[state->unk162];
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D9C90[state->unk162];
    
    s16 unk360 = state->unk15C->unk360;
    s16 unk160 = state->unk160;

    s16 i;
    s16 itemPos;

    // Title
    sub_806A568(
        &unk0[0], 
        1, 
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336, 
        0x20,
        8,
        itemText1->unk2,
        0
    );
        
    // Controls
    sub_806A568(
        &unk0[1], 
        1, 
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 336, 
        0x84,
        8,
        itemText2->unk2,
        0
    );

    // Menu items
    i = 0;
    itemPos = 0x2E;
    while (i < 4) {
        sub_806A568(
            unk60, 
            1, 
            itemText3->unk4,
            itemText3->unk0,
            0x1000,
            unk360 + 256, 
            itemPos,
            8,
            itemText3->unk2,
            0
        );

        // Interesting to note that gcc
        // uses some trickery here to set this
        // and the actual logic is `(u32)(-temp0 | temp0) >> 31;`
        unk60->unk25 = !!(unk160 ^ i);

        i++;
        unk60++;
        itemText3++;            
        itemPos += 19;
    }

    sub_806A568(
        unk120,
        1,
        0x3f,
        0x3bd,
        0x1000,
        unk360 + 254,
        unk160 * 0x13 + 0x2E,
        7,
        5,
        0
    );
}

void sub_806AD98(void);
static void sub_8064CEC(void);

void sub_8064C44(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk120 = &state->unk120;
    
    s16 unk360 = state->unk15C->unk360;
    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        unk0->unk16 = unk360 + 0x150; 
    }

    for (i = 0; i < 4; i++, unk60++) {
        unk60->unk16 = unk360 + 0x100;
    }
    
    unk120->unk16 = unk360 + 0xFE;

    sub_806AD98();

    if (++state->unk161 > 0xF) {
        state->unk161 = 0;
        gCurTask->main = sub_8064CEC;
    }
}

void sub_806ABC4(void);
void sub_806AAFC(void);
void sub_806AC28(void);
static void sub_8064E6C(void);

// Task_OptionsPlayerDataMenuMain
static void sub_8064CEC(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk120 = &state->unk120;
    struct UNK_8063730* unk15C = state->unk15C;
    s16 i;

    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        // Move the cursor up and down
        if (gRepeatedKeys & DPAD_UP) {
            if (state->unk160 != 0) {
                state->unk160--;
            } else {
                state->unk160 = 3;
            }
        } else if (gRepeatedKeys & DPAD_DOWN) {
            if (state->unk160 < 3) {
                state->unk160++;
            } else {
                state->unk160 = 0;
            }
        }

        for (i = 0; i < 4; i++, unk60++) {
            unk60->unk25 = !!(state->unk160 ^ i);
        }
        unk120->unk18 = state->unk160 * 0x13 + 0x2E;
    }

    sub_806AD98();
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        switch(state->unk160) {
            case 0:
                sub_806AAFC();
                return;
            case 1:
                sub_806ABC4();
                return;
            case 2:
                sub_806AC28();
                return;
            case 3:
                unk15C->unk784 = 0;
                gCurTask->main = sub_8064E6C;
                return;
            default:
                return;
        }
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        unk15C->unk784 = 0;
        gCurTask->main = sub_8064E6C;
    }
}

static void sub_8064E6C(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk120 = &state->unk120;
    
    s16 unk360 = state->unk15C->unk360;
    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        unk0->unk16 = unk360 + 0x150; 
    }

    for (i = 0; i < 4; i++, unk60++) {
        unk60->unk16 = unk360 + 0x100;
    }
    
    unk120->unk16 = unk360 + 0xFE;

    if (++state->unk161 < 0xF) {
        sub_806AD98();
    } else {
        TaskDestroy(gCurTask);
    }
}

void sub_806AB90(void);

static inline void sub_8064F1C_A(struct UNK_8064A40* state, struct UNK_802D4CC_UNK270* unk150) {
    struct UNK_8063730* unk15C;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_8063D20(state->unk15C, 1);
    
    unk15C = state->unk15C;
    sub_806B854(&unk15C->unk364,0,7,0x85,0x1E,0x14,0,0,0,0);
    sub_806B854(&unk15C->unk3A4,1,0xE, 0x86,0x1E,0x14,0,1,0,0);
    
    sub_8063DCC(state->unk15C, 1);
    sub_8064AC0(state);

    unk150->unk0 = 0;
    unk150->unk2 = 2;
    unk150->unk4 = 0;
    unk150->unk6 = 0x100;
    unk150->unkA = 0;
    unk150->unk8 = 0xFF;

    state->unk15C->unk784 = 1;
}

void sub_8064F1C(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk150 = &state->unk150;

    if (state->unk163 == 0) {
        sub_8064F1C_A(state, unk150);
        gCurTask->main = sub_806AB90;
    }
}

void sub_8068198(struct UNK_8064A40*);
void sub_8068524(struct UNK_8064A40*);
static void sub_806508C(void);

void sub_8065004(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk150 = &state->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        if (state->unk15C->unk35D) {
            sub_8068198(state);
        } else {
            sub_8068524(state);
        }
        state->unk163 = 1;
        state->unk15C->unk784 = 2;

        gCurTask->main = sub_806508C;
    }
}

void sub_806ABF4(void);

static void sub_806508C(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk150 = &state->unk150;
    struct UNK_8063730* unk15C;

    if (state->unk163 == 0) {
        sub_8064F1C_A(state, unk150);
        gCurTask->main = sub_806ABF4;
    }
}

void sub_806ACBC(void);

void sub_8065174(void) {
    struct UNK_8064A40* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk150 = &state->unk150;
    struct UNK_8063730* unk15C;

    if (state->unk163 == 0) {
        sub_8064F1C_A(state, unk150);
        gCurTask->main = sub_806ACBC;
    }
}

struct UNK_0806ADF4 {
    struct UNK_8063730* unk0;
    struct UNK_0808B3FC_UNK240 unk4[2];
    struct UNK_0808B3FC_UNK240 unk64[2];
    struct UNK_0808B3FC_UNK240 unkC4;
    s8 unkF4;
    s8 unkF5;
    s8 unkF6;
    u8 unkF7;
}; /* size 0xF8 */

extern const struct UNK_080D95E8 gUnknown_080D9888[6];
extern const struct UNK_080D95E8 gUnknown_080D98B8[6];

void sub_806525C(struct UNK_0806ADF4* state) {
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D9888[state->unkF6];
    const struct UNK_080D95E8 *itemText2 = &gUnknown_080D98B8[state->unkF6];
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D9798[state->unkF6];
    
    s16 unk360 = state->unk0->unk360;
    s16 unkF4 = state->unkF4;
    s16 i;

    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x32,
        8,
        itemText1->unk2,
        0
    );

    unk4++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 336,
        0x74,
        8,
        itemText2->unk2,
        0
    );
    
    sub_806A568(
        unk64,
        1,
        itemText3->unk4,
        itemText3->unk0,
        0x1000,
        unk360 + 0x112,
        0x4C,
        8,
        itemText3->unk2,
        0
    );

    unk64++;
    itemText3++;
    sub_806A568(
        unk64,
        1,
        itemText3->unk4,
        itemText3->unk0,
        0x1000,
        unk360 + 0x14E,
        0x4C,
        8,
        itemText3->unk2,
        0
    );

    sub_806A568(
        unkC4,
        1,
        0x12,
        0x3b8,
        0x1000,
        unkF4 * 0x3C + 0x110,
        0x4c,
        7,
        3,
        0
    );

    for (i = 0, unk64 = state->unk64; i < 2; i++, unk64++) {
        unk64->unk25 = !!(unkF4 ^ i);
    }
} 

void sub_806AE54(void);
void sub_806548C(void);

void sub_80653E4(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;
    
    s16 unk360 = state->unk0->unk360;
    s16 i;

    for (i = 0; i < 2; i++, unk4++) {
        unk4->unk16 = unk360 + 0x150;
    }

    unk64->unk16 = unk360 + 0x112;
    unk64++;
    unk64->unk16 = unk360 + 0x14E;
    
    unkC4->unk16 = unk360 + (state->unkF4 * 0x3C + 0x110);
    sub_806AE54();

    if (++state->unkF5 > 0xF) {
        state->unkF5 = 0;
        gCurTask->main = sub_806548C;
    }
}

void sub_80655FC(void);

void sub_806548C(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* menuItem = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;
    struct UNK_8063730* parent = state->unk0;

    s16 unk360 = parent->unk360;
    s16 language = state->unkF6;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        state->unkF4 = state->unkF4 == 0;

        i = 0;
        while (i < 2) {
            menuItem->unk25 = !!(state->unkF4 ^ i);
            i++;
            menuItem++;
        }

        unkC4->unk16 = unk360 + (state->unkF4 * 0x3C + 0x110);
    }

    sub_806AE54();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *itemText3 = &gUnknown_080D9798[language][state->unkF4];
        menuItem = &parent->unk594[1];
        
        menuItem->unk20 = itemText3->unk2;
        menuItem->unkA = itemText3->unk0;
        sub_8004558(menuItem);
        m4aSongNumStart(SE_SELECT);
        parent->unk359 = state->unkF4;
        parent->unk784 = 0;
        gCurTask->main = sub_80655FC;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        parent->unk784 = 0;
        gCurTask->main = sub_80655FC;
    }
}

void sub_80655FC(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    s16 unk360 = state->unk0->unk360;
    s16 i = 0;

    while (i < 2) {
        unk4->unk16 = unk360 + 0x150;
        i++;
        unk4++;
    }

    unk64->unk16 = unk360 + 0x112;
    unk64++;
    unk64->unk16 = unk360 + 0x14E;

    unkC4->unk16 = state->unkF4 * 0x3C + 0x110 + unk360;

    if (++state->unkF5 < 0xF) {
        sub_806AE54();
    } else {
        TaskDestroy(gCurTask);
    }
}

extern const struct UNK_080D95E8 gUnknown_080D98E8[6];
extern const struct UNK_080D95E8 gUnknown_080D9918[6];

void sub_80656B0(struct UNK_0806ADF4* state) {
    // same function as sub_806525C
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D98E8[state->unkF6];
    const struct UNK_080D95E8 *itemText2 = &gUnknown_080D9918[state->unkF6];
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D97F8[state->unkF6];

    s16 unk360 = state->unk0->unk360;
    s16 unkF4 = state->unkF4;
    s16 i;
    

    // TODO: can these be a macro?
    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x32,
        8,
        itemText1->unk2,
        0
    );

    unk4++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 336,
        0x74,
        8,
        itemText2->unk2,
        0
    );
    
    sub_806A568(
        unk64,
        1,
        itemText3->unk4,
        itemText3->unk0,
        0x1000,
        unk360 + 0x112,
        0x4C,
        8,
        itemText3->unk2,
        0
    );

    unk64++;
    itemText3++;
    sub_806A568(
        unk64,
        1,
        itemText3->unk4,
        itemText3->unk0,
        0x1000,
        unk360 + 0x14E,
        0x4C,
        8,
        itemText3->unk2,
        0
    );

    sub_806A568(
        unkC4,
        1,
        0x12,
        0x3b8,
        0x1000,
        unkF4 * 0x3C + 0x110,
        0x4c,
        7,
        3,
        0
    );

    for (i = 0, unk64 = state->unk64; i < 2; i++, unk64++) {
        unk64->unk25 = !!(unkF4 ^ i);
    }
}

void sub_806AF10(void);
void sub_80658E0(void);

void sub_8065838(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;
    
    s16 unk360 = state->unk0->unk360;
    s16 i;

    for (i = 0; i < 2; i++, unk4++) {
        unk4->unk16 = unk360 + 0x150;
    }

    unk64->unk16 = unk360 + 0x112;
    unk64++;
    unk64->unk16 = unk360 + 0x14E;
    
    unkC4->unk16 = unk360 + (state->unkF4 * 0x3C + 0x110);
    sub_806AF10();

    if (++state->unkF5 > 0xF) {
        state->unkF5 = 0;
        gCurTask->main = sub_80658E0;
    }
}

void sub_8065A50(void);

void sub_80658E0(void) {
    // Same as sub_806548C
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* menuItem = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;
    struct UNK_8063730* parent = state->unk0;

    s16 unk360 = parent->unk360;
    s16 language = state->unkF6;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        state->unkF4 = state->unkF4 == 0;

        i = 0;
        while (i < 2) {
            menuItem->unk25 = !!(state->unkF4 ^ i);
            i++;
            menuItem++;
        }

        unkC4->unk16 = unk360 + (state->unkF4 * 0x3C + 0x110);
    }

    sub_806AF10();

    if ((gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT))) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        const struct UNK_080D95E8 *itemText3 = &gUnknown_080D97F8[language][state->unkF4];
        // Except this is different
        menuItem = &parent->unk594[2];
        
        menuItem->unk20 = itemText3->unk2;
        menuItem->unkA = itemText3->unk0;
        sub_8004558(menuItem);
        m4aSongNumStart(SE_SELECT);
        // and this
        parent->unk35A = state->unkF4;
        parent->unk784 = 0;
        gCurTask->main = sub_8065A50;
    } else if ((gPressedKeys & B_BUTTON)) {
        m4aSongNumStart(SE_RETURN);
        parent->unk784 = 0;
        gCurTask->main = sub_8065A50;
    }
}

void sub_8065A50(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    s16 unk360 = state->unk0->unk360;
    s16 i;

    for (i = 0; i < 2; i++, unk4++) {
        unk4->unk16 = unk360 + 0x150;
    }

    unk64->unk16 = unk360 + 0x112;
    unk64++;
    unk64->unk16 = unk360 + 0x14E;

    unkC4->unk16 = state->unkF4 * 0x3C + 0x110 + unk360;

    if (++state->unkF5 < 0xF) {
        sub_806AF10();
    } else {
        TaskDestroy(gCurTask);
    }
}

struct UNK_8065B04 {
    struct UNK_8063730* unk0;
    struct UNK_0808B3FC_UNK240 unk4[6];
    struct UNK_0808B3FC_UNK240 unk124[3];
    struct UNK_0808B3FC_UNK240 unk1B4[2];
    struct UNK_0808B3FC_UNK240 unk214;
    u8 unk244;
    u8 unk245;
    u8 unk246;
    u8 unk247;
    s8 unk248;
    s8 unk249;
}; /* size 0x24C */

void sub_8065F04(void);
void sub_8065C28(struct UNK_8065B04*);

void sub_8065B04(struct UNK_8063730* optionsScreen) {
    struct Task* t = TaskCreate(sub_8065F04, 0x24C, 0x2000, 4, 0);
    struct UNK_8065B04* state = TaskGetStructPtr(t, state);

    state->unk0 = optionsScreen;
    
    switch(optionsScreen->unk0.unk350.unk0) {
        case 1:
            state->unk244 = 0;
            break;
        case 2:
            state->unk245 = 0;
            break;
        case 0x100:
            state->unk246 = 0;
            break;
    }

    switch(optionsScreen->unk0.unk350.unk2) {
        case 1:
            state->unk244 = 1;
            break;
        case 2:
            state->unk245 = 1;
            break;
        case 0x100:
            state->unk246 = 1;
            break;
    }

    switch(optionsScreen->unk0.unk350.unk4) {
        case 1:
            state->unk244 = 2;
            break;
        case 2:
            state->unk245 = 2;
            break;
        case 0x100:
            state->unk246 = 2;
            break;
    }

    state->unk247 = 0;
    state->unk248 = 0;
    state->unk249 = optionsScreen->unk35B;
    sub_8065C28(state);
}

extern const struct UNK_080D95E8 gUnknown_080D9948[6][3];
extern const struct UNK_080D95E8 gUnknown_080D99D8[3];
extern const struct UNK_080D95E8 gUnknown_080D99F0[6][3];

void sub_8065C28(struct UNK_8065B04* state) {
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;

    const struct UNK_080D95E8 *itemText1 = gUnknown_080D9948[state->unk249];
    const struct UNK_080D95E8 *itemText2 = gUnknown_080D99D8;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[state->unk249];

    s16 unk360 = state->unk0->unk360;

    s16 i;

    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x1C,
        8,
        itemText1->unk2,
        0
    );
    unk4++;
    itemText1++;
    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x7A,
        8,
        itemText1->unk2,
        0
    );
    unk4++;
    itemText1++;
    sub_806A568(
        unk4,
        1,
        itemText1->unk4,
        itemText1->unk0,
        0x1000,
        unk360 + 336,
        0x87,
        8,
        itemText1->unk2,
        0
    );

    unk4++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x35,
        8,
        itemText2->unk2,
        0
    );
    unk4++;
    itemText2++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x4D,
        8,
        itemText2->unk2,
        0
    );
    unk4++;
    itemText2++;
    sub_806A568(
        unk4,
        1,
        itemText2->unk4,
        itemText2->unk0,
        0x1000,
        unk360 + 264,
        0x65,
        8,
        itemText2->unk2,
        0
    );

    sub_806A568(
        unk124,
        1,
        itemText3[state->unk244].unk4,
        itemText3[state->unk244].unk0,
        0x1000,
        unk360 + 0x14C,
        0x2D,
        8,
        itemText3[state->unk244].unk2,
        0
    );
    unk124++;
    sub_806A568(
        unk124,
        1,
        itemText3[state->unk245].unk4,
        itemText3[state->unk245].unk0,
        0x1000,
        unk360 + 0x14C,
        0x45,
        8,
        itemText3[state->unk245].unk2,
        0
    );
    unk124++;
    sub_806A568(
        unk124,
        1,
        itemText3[state->unk246].unk4,
        itemText3[state->unk246].unk0,
        0x1000,
        unk360 + 0x14C,
        0x5D,
        8,
        itemText3[state->unk246].unk2,
        0
    );

    sub_806A568(
        unk214,
        1,
        0x42,
        0x3B6,
        0x1000,
        unk360 + 0xFC,
        0x2A,
        6,
        7,
        0
    );
    
    sub_806A568(
        unk1B4,
        1,
        2,
        0x3B6,
        0x1000,
        unk360 + 0x143,
        0x35,
        6,
        8,
        0
    );
    unk1B4++;
    sub_806A568(
        unk1B4,
        1,
        2,
        0x3B6,
        0x1000,
        unk360 + 0x19D,
        0x35,
        6,
        9,
        0
    );
}

void sub_8066818(void);
void sub_8066004(void);

void sub_8065F04(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;

    s16 unk360 = state->unk0->unk360;
    s16 i;

    for (i = 0; i < 3; i++, unk4++) {
        unk4->unk16 = unk360 + 0x150;
    }

    for (;i < 6; i++, unk4++) {
        unk4->unk16 = unk360 + 0x108;
    }

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unk16 = unk360 + 0x14C;
    }

    unk214->unk16 = unk360 + 0xFC;
    unk1B4->unk16 = unk360 + 0x143;
    unk1B4++;
    unk1B4->unk16 = unk360 + 0x19D;
    
    sub_8066818();

    if (++state->unk248 > 0xF) {
        state->unk248 = 0;
        gCurTask->main = sub_8066004;
    }
}

void sub_806AFAC(void);
void sub_8066718(void);
void sub_80665D8(void);

void sub_8066004(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[state->unk249];
    const struct UNK_080D95E8 *itemText4;

    sub_8066818();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & (DPAD_LEFT)) {
            if (state->unk244 != 0) {
                state->unk244--;
            } else {
                state->unk244 = 2;
            }
        } else {
            if (state->unk244 < 2) {
                state->unk244++;
            } else {
                state->unk244 = 0;
            }
        }

        itemText4 = &itemText3[state->unk244];
        unk124->unkA = itemText4->unk0;
        unk124->unk20 = itemText4->unk2;
        sub_8004558(&unk124[0]);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (state->unk244 == state->unk245) {
            while (state->unk244 == state->unk245 || state->unk244 == state->unk246) {
                if (state->unk245 < 2) {
                    state->unk245++;
                } else {
                    state->unk245 = 0;
                }
            }
            unk124 = &state->unk124[1];
            unk124->unkA = itemText3[state->unk245].unk0;
            unk124->unk20 = itemText3[state->unk245].unk2;
            
            sub_8004558(unk124);
        }

        if (state->unk244 == state->unk246) {
            while (state->unk244 == state->unk246 || state->unk245 == state->unk246) {
                if (state->unk246 < 2) {
                    state->unk246++;
                } else {
                    state->unk246 = 0;
                }
            }

            unk124 = &state->unk124[2];
            unk124->unkA = itemText3[state->unk246].unk0;
            unk124->unk20 = itemText3[state->unk246].unk2;
            sub_8004558(unk124);
        }

        state->unk247 = 1;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = sub_806AFAC;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        state->unk248 = 0;
        state->unk0->unk784 = 0;
        gCurTask->main = sub_8066718;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

void sub_806AFEC(void);
void sub_806AF6C(void);

void sub_8066220(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[state->unk249];
    const struct UNK_080D95E8 *itemText4;
    u8 unk245;

    sub_8066818();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            do {
                if (state->unk245 > 0) {
                    state->unk245--;
                } else {
                   state->unk245 = 2;
                }
            } while (state->unk244 == state->unk245);
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            do {
                if (state->unk245 < 2) {
                    state->unk245++;
                } else {
                    state->unk245 = 0;
                }
            } while (state->unk244 == state->unk245);
        }
        
        // Who knows why this has to be assigned first
        unk245 = state->unk245;
        
        unk124 = &state->unk124[1];
        itemText4 = &itemText3[unk245];
        unk124->unkA = itemText4->unk0;
        unk124->unk20 = itemText4->unk2;
        sub_8004558(unk124);
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (state->unk244 == state->unk246 || state->unk245 == state->unk246) {
            while (state->unk244 == state->unk246 || state->unk245 == state->unk246) {
                if (state->unk246 < 2) {
                    state->unk246++;
                } else {
                    state->unk246 = 0;
                }
            }
            unk124 = &state->unk124[2];
            unk124->unkA = itemText3[state->unk246].unk0;
            unk124->unk20 = itemText3[state->unk246].unk2;
            
            sub_8004558(unk124);
        }

        state->unk247 = 2;
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = sub_806AFEC;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        if (state->unk244 == state->unk245 || state->unk245 == state->unk246) {
            while (state->unk244 == state->unk245 || state->unk245 == state->unk246) {
                if (state->unk245 < 2) {
                    state->unk245++;
                } else {
                    state->unk245 = 0;
                }
            }
            unk124 = &state->unk124[1];
            unk124->unkA = itemText3[state->unk245].unk0;
            unk124->unk20 = itemText3[state->unk245].unk2;
            
            sub_8004558(unk124);
        }
        m4aSongNumStart(SE_RETURN);
        state->unk247 = 0;
        gCurTask->main = sub_806AF6C;
        return;
    }

    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

static inline void sub_8066478_Unpack(struct UNK_8065B04* state, struct UNK_8063730* unk0) {
     switch (state->unk244) {
        case 0:
            unk0->unk0.unk350.unk0 = 1;
            break;
        case 1:
            unk0->unk0.unk350.unk2 = 1;
            break;
        case 2:
            unk0->unk0.unk350.unk4 = 1;
            break;
    }

    switch (state->unk245) {
        case 0:
            unk0->unk0.unk350.unk0 = 2;
            break;
        case 1:
            unk0->unk0.unk350.unk2 = 2;
            break;
        case 2:
            unk0->unk0.unk350.unk4 = 2;
            break;
    }

    switch (state->unk246) {
        case 0:
            unk0->unk0.unk350.unk0 = 0x100;
            break;
        case 1:
            unk0->unk0.unk350.unk2 = 0x100;
            break;
        case 2:
            unk0->unk0.unk350.unk4 = 0x100;
            break;
    }
}

void sub_8066478(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_8063730* unk0 = state->unk0;

    sub_8066818();

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
    
        sub_8066478_Unpack(state, unk0);
    
        state->unk248 = 0;
        state->unk0->unk784 = 0;
        gCurTask->main = sub_8066718;
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        state->unk247 = 0;
        gCurTask->main = sub_806AFAC;
        return;
    }
    
    if (gPressedKeys & SELECT_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_80665D8();
    }
}

void sub_80665D8(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_8063730* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    const struct UNK_080D95E8 *itemText3 = gUnknown_080D99F0[state->unk249];
    s16 i;

    state->unk244 = 0;
    state->unk245 = 1;
    state->unk246 = 2;

    sub_8066478_Unpack(state, unk0);

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unkA = itemText3[i].unk0;
        unk124->unk20 = itemText3[i].unk2;
        sub_8004558(unk124);
    }

    gCurTask->main = sub_806AF6C;
}

void sub_8066818(void);

void sub_8066718(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;

    s16 unk360 = state->unk0->unk360;
    s16 i;

    for (i = 0; i < 3; i++, unk4++) {
        unk4->unk16 = unk360 + 0x150;
    }

    for (; i < 6; i++, unk4++) {
        unk4->unk16 = unk360 + 0x108;
    }

    for (i = 0; i < 3; i++, unk124++) {
        unk124->unk16 = unk360 + 0x14C;
    }

    unk214->unk16 = unk360 + 0xFC;
    unk1B4->unk16 = unk360 + 0x143;
    unk1B4++;
    unk1B4->unk16 = unk360 + 0x19D;

    if (++state->unk248 < 0xF) {
        sub_8066818();
    } else {
        TaskDestroy(gCurTask);
    }
}

void sub_8066818(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk124 = state->unk124;
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    s16 i;

    for (i = 0; i < 6; i++, unk4++) {
        sub_80051E8(unk4);
    }

    for (i = 0; i < 3; i++, unk124++) {
        sub_80051E8(unk124);
    }
    
    for (i = 0; i < 2; i++, unk1B4++) {
        sub_8004558(unk1B4);
        sub_80051E8(unk1B4);
    }
    
    sub_80051E8(unk214);
}

void sub_80668A8(struct UNK_8063940* config) {
    struct UNK_802D4CC_UNK270* unk1F0 = &config->unk1F0;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    unk1F0->unk0 = 0;
    unk1F0->unk2 = 2;
    unk1F0->unk4 = 0;
    unk1F0->unk6 = 0x100;
    unk1F0->unkA = 0;
    unk1F0->unk8 = 0xFF;

    sub_802D4CC(&config->unk1F0);
}

extern const struct UNK_080D95E8 gUnknown_080D9A80[6];
extern const struct UNK_080D95E8 gUnknown_080D9AE0[6];
extern const struct UNK_080D95E8 gUnknown_080D9B10[6];
extern const struct UNK_080D95E8 gUnknown_080D9AB0[6];

s16 sub_806B8D4(const struct UNK_080D95E8*, u8);

void sub_8066930(struct UNK_8063940* config) {
    s16 unk200 = config->unk200;
    struct UNK_0808B3FC_UNK240* unk0 = config->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = config->unk60;
    struct UNK_0808B3FC_UNK240* unk180 = &config->unk180;

    const struct UNK_080D95E8* a80 = gUnknown_080D9A80;
    const struct UNK_080D95E8* b10 = gUnknown_080D9B10;
    const struct UNK_080D95E8* ae0;

    s16 var1;
    s16 var2;
    s16 i;
    s16 pos;

    if (config->unk201 == 0) {
        ae0 = gUnknown_080D9AB0;
    } else {
        ae0 = gUnknown_080D9AE0;
    }

    var1 = sub_806B8D4(a80, 6);
    var2 = sub_806B8D4(ae0, 6);

    a80 = &a80[unk200];
    ae0 = &ae0[unk200];
    
    sub_806A568(
        unk0,
        0,
        var1,
        a80->unk0,
        0x3000,
        0x78,
        0x1A,
        0xD,
        a80->unk2,
        0
    );
    unk0++;
    sub_806A568(
        unk0,
        0,
        var2,
        ae0->unk0,
        0x3000,
        0x78,
        0x8A,
        0xD,
        ae0->unk2,
        0
    );

    for (i = 0, pos = 0x28; i < 6; i++, unk60++, b10++, pos+= 0xF) {
        sub_806A568(
            unk60,
            0,
            b10->unk4,
            b10->unk0,
            0x3000,
            0x28,
            pos,
            0xD,
            b10->unk2,
            0
        );
        unk60->unk25 = !!(unk200 ^ i);
    }

    sub_806A568(
        unk180,
        0,
        0x3F,
        0x3BD,
        0x3000,
        0x26,
        (unk200 * 0xF) + 0x28,
        0xC,
        5,
        0
    );

    sub_806A568(
        0, 
        0, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0
    );
    sub_806A568(
        0, 
        0, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        1, 
        0
    );
    sub_806A568(
        0, 
        0, 
        0, 
        0x3C3, 
        0, 
        0, 
        0, 
        0, 
        0xC, 
        0
    );
}

void sub_806B1B8(void);
void sub_8066C2C(void);
void sub_806B1F8(void);
void sub_806B110(void);

// Task_ProfileLanguageMenuMain
void sub_8066B0C(void) {
    struct UNK_8063940* state = TaskGetStructPtr(gCurTask, state);
    sub_806B1B8();

    if (gRepeatedKeys & (DPAD_DOWN)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (state->unk200 > 4) {
           state->unk200 = 0;
        } else {
           state->unk200++;
        }
        sub_8066C2C();
    } else if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (state->unk200 < 1) {
            state->unk200 = 5;
        } else {
            state->unk200--;
        }
        sub_8066C2C();
    }

    sub_806B1F8();

    if ((gRepeatedKeys & (DPAD_DOWN | DPAD_UP))) {
        return;
    }

    if (state->unk201 != 0) {
        if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
            m4aSongNumStart(SE_SELECT);
            gLoadedSaveGame->unk6 = state->unk200 + 1;
            sub_806B110();
        }
        return;
    }
    
    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        state->unk1FC->unk35B = state->unk200;
        sub_806B110();
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806B110();
    }
}

void sub_8066C2C(void) {
    struct UNK_8063940* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk0 = state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unk180 = &state->unk180;

    const struct UNK_080D95E8* a80 = &gUnknown_080D9A80[state->unk200];
    const struct UNK_080D95E8* ae0;
    s16 i;

    if (state->unk201 != 1) {
        ae0 = &gUnknown_080D9AB0[state->unk200];
    } else {
        ae0 = &gUnknown_080D9AE0[state->unk200];
    }

    unk180->unk18 = state->unk200 * 0xF + 0x28;

    for (i = 0; i < 6; i++, unk60++) {
        unk60->unk25 = !!(state->unk200 ^ i);
    }

    unk0->unk20 = a80->unk2;
    unk0->unkA = a80->unk0;
    sub_8004558(unk0);

    unk0++;
    unk0->unk20 = ae0->unk2;
    unk0->unkA = ae0->unk0;
    sub_8004558(unk0);
}

void sub_806B280(void);

struct UNK_8066CFC {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30;
    struct UNK_0808B3FC_UNK240 unk60[2];
    struct UNK_0808B3FC_UNK240 unkC0;
    u8 fillerF0[64];
    struct UNK_802D4CC_UNK270 unk130;
    struct UNK_8063730* unk13C; 
    s8 unk140;
    u8 unk141;
    s8 unk142;
    s8 unk143;
}; /* 0x144 */

void sub_8066D90(struct UNK_8066CFC*);
void sub_806B258(struct UNK_8066CFC*);
void sub_8066E18(struct UNK_8066CFC*);

void sub_8066CFC(struct UNK_8063730* optionsScreen) {
    struct Task* t = TaskCreate(sub_806B280, 0x144, 0x2000, TASK_x0004, 0);
    struct UNK_8066CFC* config = TaskGetStructPtr(t, config);

    config->unk13C = optionsScreen;
    config->unk140 = 1;
    config->unk141 = 0;
    config->unk142 = optionsScreen->unk35B;
    config->unk143 = 0;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_8066D90(config);
    sub_806B258(config);
    sub_8066E18(config);
}

void sub_8066D90(struct UNK_8066CFC* config) {
    struct UNK_802D4CC_UNK270* unk130 = &config->unk130;

    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[2] = 0x4E05;
    gBgCntRegs[3] = 0xDC0E;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0xFFFD;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);

    unk130->unk0 = 0;
    unk130->unk2 = 2;
    unk130->unk4 = 0;
    unk130->unk6 = 0x100;
    unk130->unkA = 0;
    unk130->unk8 = 0xFF;

    sub_802D4CC(&config->unk130);
}

extern const struct UNK_080D95E8 gUnknown_080D9B40[6];
extern const struct UNK_080D95E8 gUnknown_080D9BA0[6];
extern const struct UNK_080D95E8 gUnknown_080D9BD0[6][2];

void sub_8066E18(struct UNK_8066CFC* config) {
    s16 unk142 = config->unk142;
    struct UNK_0808B3FC_UNK240* unk60 = config->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &config->unkC0;
    const struct UNK_080D95E8* b40 = &gUnknown_080D9B40[unk142];
    const struct UNK_080D95E8* ba0 = &gUnknown_080D9BA0[unk142];
    const struct UNK_080D95E8* bd0 = gUnknown_080D9BD0[unk142];

    s16 unk140 = config->unk140;
    
    sub_806A568(
        &config->unk0,
        0,
        b40->unk4,
        b40->unk0,
        0x3000,
        0x78,
        0x32,
        0xD,
        b40->unk2,
        0
    );
    sub_806A568(
        &config->unk30,
        0,
        ba0->unk4,
        ba0->unk0,
        0x3000,
        0x78,
        0x74,
        0xD,
        ba0->unk2,
        0
    );
    sub_806A568(
        unk60,
        0,
        bd0->unk4,
        bd0->unk0,
        0x3000,
        0x3A,
        0x4C,
        0xD,
        bd0->unk2,
        0
    );

    unk60->unk25 = 1;
    unk60++;
    bd0++;
    sub_806A568(
        unk60,
        0,
        bd0->unk4,
        bd0->unk0,
        0x3000,
        0x76,
        0x4C,
        0xD,
        bd0->unk2,
        0
    );

    sub_806A568(
        unkC0,
        0,
        0x12,
        0x3B8,
        0x3000,
        (unk140 * 60) + 56,
        0x4C,
        0xC,
        3,
        0
    );

    sub_806A568(
        0, 
        0, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0
    );
    sub_806A568(
        0, 
        0, 
        0, 
        0x3C4, 
        0, 
        0, 
        0, 
        0, 
        1, 
        0
    );
    sub_806A568(
        0, 
        0, 
        0, 
        0x3C3, 
        0, 
        0, 
        0, 
        0, 
        0xC, 
        0
    );
}

void sub_806B2F8(void);
void sub_806709C(void);
void sub_806B2B4(void);

void sub_8066FAC(void) {
    struct UNK_8066CFC* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &state->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        state->unk140 = state->unk140 == 0;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(state->unk140 ^ i);
        }
        unkC0->unk16 = state->unk140 * 0x3C + 0x38;
    }

    sub_806B2F8();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        if (state->unk140 == 0) {
            gCurTask->main = sub_806709C;
        } else {
            gCurTask->main = sub_806B2B4;
        }
    } else {
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = sub_806B2B4;
        }
    }
}

extern const struct UNK_080D95E8 gUnknown_080D9B70[6];

void sub_8067148(void);

void sub_806709C(void) {
    struct UNK_8066CFC* state = TaskGetStructPtr(gCurTask, state);

    struct UNK_0808B3FC_UNK240* unk0 = &state->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &state->unkC0;
    const struct UNK_080D95E8* b70 = &gUnknown_080D9B70[state->unk142];
    s16 i;

    unk0->unk20 = b70->unk2;
    unk0->unkA = b70->unk0;

    sub_8004558(unk0);

    state->unk140 = 1;

    for (i = 0; i < 2; i++, unk60++) {
        unk60->unk25 = !!(state->unk140 ^ i);
    }

    unkC0->unk16 = state->unk140 * 0x3C + 0x38;

    sub_806B2F8();
    gCurTask->main = sub_8067148;
}

void sub_8067148(void) {
    struct UNK_8066CFC* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk60 = state->unk60;
    struct UNK_0808B3FC_UNK240* unkC0 = &state->unkC0;
    s16 i;

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        state->unk140 = state->unk140 == 0;

        for (i = 0; i < 2; i++, unk60++) {
            unk60->unk25 = !!(state->unk140 ^ i);
        }
        unkC0->unk16 = state->unk140 * 0x3C + 0x38;
    }

    sub_806B2F8();

    if (gRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        if (state->unk140 == 0) {
            state->unk143 = 1;
            m4aSongNumStart(220);
        } else {
            m4aSongNumStart(SE_SELECT);
        }
        gCurTask->main = sub_806B2B4;
        return;
    } else {
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = sub_806B2B4;
        }
    }
}

void sub_806723C(void) {
    struct UNK_8066CFC* state = TaskGetStructPtr(gCurTask, state);

    if (!sub_802D4CC(&state->unk130)) {
        sub_806B2F8();
        return;
    }

    if (state->unk143) {
        sub_8063C7C(state->unk13C);
        NewSaveGame();
        state->unk13C->unk784 = 0;
    } else {
        state->unk13C->unk784 = 2;
    }

    TaskDestroy(gCurTask);
}

void sub_80672BC(struct UNK_8064A40* playerDataMenu) {
    struct Task* t = TaskCreate(sub_806B354, 0x3BC, 0x2000, 4, 0);
    struct UNK_8063A00* config = TaskGetStructPtr(t, config);
    s16 i;

    config->unk14C = playerDataMenu;
    config->unk3BA = playerDataMenu->unk162;
    config->unk3BB = 0;
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

    for (i = 0; i < 6; i++) {
        config->unk3AC[i] = playerDataMenu->unk15C->unk0.unk0[i];
        if (config->unk3AC[i] == 0xFFFF) {
            break;
        }
    }
    
    config->unk3AA = i;

    for (;i < 6; i++) {
        config->unk3AC[i] = 0xFFFF;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    sub_8067420(config->unk3BA);
    sub_8067484(config);
    sub_806751C(config);
    sub_8067610(config);
    sub_8067710(config);
}

void sub_8067420(s16 p) {
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x701;
    gBgCntRegs[1] = 0x9606;
    gBgCntRegs[2] = 0x1F0F;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0xFFE8;
    
    if (!p) {
        gBgScrollRegs[1][1] = 0xFFD9;
    } else {
        gBgScrollRegs[1][1] = 0x69;
    }

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

void sub_8067484(struct UNK_8063A00* config) {
    struct UNK_802D4CC_UNK270* unk140 = &config->unk140;

    unk140->unk0 = 0;
    unk140->unk2 = 2;
    unk140->unk4 = 0;
    unk140->unk6 = 0x100;
    unk140->unkA = 0;
    unk140->unk8 = 0xFF;
    
    sub_806B854(
        &config->unkC0, 
        0, 
        7, 
        0x87, 
        0x1E, 
        0x14, 
        0, 
        0, 
        0, 
        0
    );
    sub_806B854(
        &config->unk100, 
        3, 
        0x1F, 
        0x89, 
        0x1E, 
        0x14, 
        0, 
        2, 
        0, 
        0
    );
    sub_806B854(
        &config->unk210, 
        1, 
        0x16, 
        0x88, 
        0x16, 
        0x2C, 
        0, 
        1, 
        0, 
        0
    );
}
