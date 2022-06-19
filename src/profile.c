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
#include "title_screen.h"

extern void* gUnknown_03005B50;
extern void* gUnknown_03005B54;

struct UNK_8063730_UNK0 {
    // playerName
    u16 unk0[6];

    // timeRecords
    struct TimeRecords unkC;
    
    struct SectorDataUnk2A4 unk284[10];

    u8 unk34C;
    u8 unk34D;
    u8 unk34E;

    u8 filler34F;

    struct SaveGameUnk2C unk350; /* size 0x8 */
};

// OptionsScreen
struct UNK_8063730 {
    // profileData
    struct UNK_8063730_UNK0 unk0;

    u8 unk358;
    u8 unk359;
    u8 unk35A;

    // language
    u8 unk35B;
    
    // isSoundTestUnlocked
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
void sub_806A75C(void);
void sub_806A758(struct Task*);
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
    gUnknown_03005B54 = NULL;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
}

struct UNK_80637EC_UNK314 {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60;
    struct UNK_0808B3FC_UNK240 unk90[2];
    struct UNK_0808B3FC_UNK240 unkF0[2];
};

// CourseRecordsScreen
struct UNK_80637EC {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 unkC;
    struct UNK_0808B3FC_UNK240 unk4C[2];
    struct UNK_0808B3FC_UNK240 unkAC[2];
    struct UNK_0808B3FC_UNK240 unk10C;
    struct UNK_0808B3FC_UNK240 unk13C[2];
    struct UNK_0808B3FC_UNK240 unk19C[2];
    // playerProfileMenu
    struct UNK_8064A40* unk1FC;

    // timeRecords
    struct TimeRecords* unk200;
    struct Unk_03002400 unk204;
    struct Unk_03002400 unk244;
    struct UNK_0808B3FC_UNK240 unk284[3];
    struct UNK_80637EC_UNK314 unk314[3];
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

void sub_806B5A4(void);
void sub_8068640(void);

void sub_8068700(struct UNK_80637EC*);
void sub_80687BC(struct UNK_80637EC*);

// The logic for showing TA records
// and selecting a time attack course is the same
// so this is within the profile source.
// CreateTimeAttackCourseScreen
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
    config->unk200 = EwramMallocStruct(struct TimeRecords);
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

    memcpy(config->unk200, &gLoadedSaveGame->unk34, sizeof(struct TimeRecords));

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8068640();
    sub_8068700(config);
    sub_80687BC(config);
    m4aSongNumStart(MUS_TA_COURSE_SELECTION);
}

// Language Selection Screen
struct UNK_8063940 {
    struct UNK_0808B3FC_UNK240 unk0[2];
    struct UNK_0808B3FC_UNK240 unk60[6];
    struct UNK_0808B3FC_UNK240 unk180;
    struct Unk_03002400 unk1B0;
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
void sub_806B0AC(struct UNK_8063940*);
void sub_8066930(struct UNK_8063940*);

void sub_8063940_CreateProfileScreen(void) {
    struct Task* t;
    struct UNK_8063940* config;

    ShuffleRngSeed();

    t = TaskCreate(sub_806B0D8, 0x204, 0x2000, TASK_x0004, 0);
    config = TaskGetStructPtr(t, config);

    config->unk1FC = NULL;
    config->unk200 = gLoadedSaveGame->unk6 - 1;
    config->unk201 = 1;
    if ((u8)config->unk200 > 5) {
        config->unk200 = 1;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_80668A8(config);
    sub_806B0AC(config);
    sub_8066930(config);
}

struct UNK_8063A00_UNK258 {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30[6];

    u16 unk150;
    // inputCursor
    u16 unk152;

    // playerName
    u16 unk154[6];
};

struct UNK_8063A00 {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30[3];
    struct Unk_03002400 unkC0;
    struct Unk_03002400 unk100;
    
    struct UNK_802D4CC_UNK270 unk140;
    struct UNK_8064A40* unk14C;

    struct UNK_0808B3FC_UNK240 unk150[2];
    struct UNK_0808B3FC_UNK240 unk1B0[2];
    struct Unk_03002400 unk210;
    u16 unk250;
    s8 unk252;
    s8 unk253;

    u8 filler254[4];
    
    // nameInputDisplay
    struct UNK_8063A00_UNK258 unk258;

    u16 unk3B8;
    u8 unk3BA;
    u8 unk3BB;
}; /* size 0x3BC */

extern void sub_806B354(void);
extern void sub_8067420(s16);

extern void sub_8067484(struct UNK_8063A00*);
void sub_806751C(struct UNK_8063A00*);
void sub_8067610(struct UNK_8063A00*);
void sub_8067710(struct UNK_8063A00*);

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

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        config->unk258.unk154[i] = PLAYER_NAME_END_CHAR;
    }

    config->unk258.unk152 = 0;
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

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
    memcpy(&profile->unkC, &saveGame->unk34, sizeof(saveGame->unk34));
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

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        if (profile->unk0[i] == PLAYER_NAME_END_CHAR) {
            break;
        }
    }

    for (; i < MAX_PLAYER_NAME_LENGTH; i++) {
        profile->unk0[i] = PLAYER_NAME_END_CHAR;
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
    memcpy(&saveGame->unk34, &profile->unkC, sizeof(profile->unkC));

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

void sub_806A568(struct UNK_0808B3FC_UNK240 *, s8, u32, u16, u32, s16, s16, u16, u8, u8);
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
        bool32 finishedReadingName;
        u16 nameChar;
        temp0 = optionsScreen->unk780 == 0 ? 0xA3 : 0xAB;
        if (p2 == 1 && i == 0) {
            temp0 = -0x35;
        }
        i = 0;
        itemPos = 0x26;
        finishedReadingName = FALSE;
        while (i < MAX_PLAYER_NAME_LENGTH) {
            if (finishedReadingName) {
                nameChar = 0x11;
            } else {
                nameChar = optionsScreen->unk0.unk0[i];
            }
        
            if (nameChar == PLAYER_NAME_END_CHAR) {
                nameChar = 0x11;
                finishedReadingName = TRUE;
            }

            local48 = sub_806B908(nameChar);
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
        gUnknown_03005B54 = NULL;
        gCurTask->main = sub_80641B0;
    }
}

void sub_8063DCC(struct UNK_8063730* optionsScreen, s16 p2);
void sub_8063D20(struct UNK_8063730* optionsScreen, s16 p2);
void sub_806A968(void);
void sub_806B854(struct Unk_03002400*, u32, u32, u8, u32, u32, u32, u32, u32, u32);

void sub_80646FC(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;

    s8 unk784 = optionsScreen->unk784;
    if (unk784) {
        return;
    }
    
    // TODO make this section a macro or a inline func
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

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
    gUnknown_03005B54 = NULL;

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
    gUnknown_03005B54 = NULL;

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

    // language
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
    gUnknown_03005B54 = NULL;

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
    gUnknown_03005B54 = NULL;

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

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        config->unk258.unk154[i] = playerDataMenu->unk15C->unk0.unk0[i];
        if (config->unk258.unk154[i] == PLAYER_NAME_END_CHAR) {
            break;
        }
    }
    
    config->unk258.unk152 = i;

    for (;i < MAX_PLAYER_NAME_LENGTH; i++) {
        config->unk258.unk154[i] = PLAYER_NAME_END_CHAR;
    }

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

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

extern const struct UNK_080D95E8 gUnknown_080D9D50[6];
extern const struct UNK_080D95E8 gUnknown_080D9D80[6];

extern const struct UNK_080D95E8 gUnknown_080D9DB0[2];
extern const struct UNK_080D95E8 gUnknown_080D9DC0[6];

void sub_806751C(struct UNK_8063A00* config) {
    struct UNK_0808B3FC_UNK240* unk0 = &config->unk0;
    struct UNK_0808B3FC_UNK240* unk30 = config->unk30;
    
    u8* unk3BA = &config->unk3BA;
    const struct UNK_080D95E8* db0 = gUnknown_080D9DB0;
    const struct UNK_080D95E8* dc0 = &gUnknown_080D9DC0[*unk3BA];

    const struct UNK_080D95E8* d50;

    if (config->unk258.unk152) {
        d50 = &gUnknown_080D9D80[*unk3BA];
    } else {
        d50 = &gUnknown_080D9D50[*unk3BA];
    }

    sub_806A568(
        unk0, 
        0, 
        d50->unk4,
        d50->unk0,
        0x1000,
        3, 
        0x15,
        0xD,
        d50->unk2,
        0
    );
    
    sub_806A568(
        unk30, 
        0, 
        db0->unk4,
        db0->unk0,
        0x1000,
        0xDB, 
        0x70,
        0xD,
        db0->unk2,
        0
    );
    unk30++;
    db0++;
    sub_806A568(
        unk30, 
        0, 
        db0->unk4,
        db0->unk0,
        0x1000,
        0xDB, 
        0x80,
        0xD,
        db0->unk2,
        0
    );
    unk30++;
    sub_806A568(
       unk30, 
        0, 
        dc0->unk4,
        dc0->unk0,
        0x1000,
        0xDB, 
        0x8F,
        0xD,
        dc0->unk2,
        0
    );
}

extern const struct UNK_080D95E8 gUnknown_080D9DF0[2];

void sub_8067610(struct UNK_8063A00* config) {
    struct UNK_0808B3FC_UNK240* unk150 = config->unk150;
    struct UNK_0808B3FC_UNK240* unk1B0 = config->unk1B0;
    const struct UNK_080D95E8* df0 = gUnknown_080D9DF0;
    struct UNK_806B908 local48;
    
    sub_806A568(
        unk150, 
        0, 
        10,
        0x3BA,
        0x1000,
        0x21, 
        0x2F,
        8,
        7,
        0
    );
    unk150++;
    local48 = sub_806B908(config->unk3B8);
    sub_806A568(
        unk150, 
        0, 
        local48.unk0,
        local48.unk4,
        0x1000,
        0x21, 
        0x2F,
        7,
        local48.unk6,
        0
    );
    
    sub_806A568(
        unk1B0, 
        0, 
        df0->unk4,
        df0->unk0,
        0x1000,
        8, 
        0x2C,
        0xD,
        df0->unk2,
        0
    );
    unk1B0++;
    df0++;
    sub_806A568(
        unk1B0, 
        0, 
        df0->unk4,
        df0->unk0,
        0x1000,
        8, 
        0x82,
        0xD,
        df0->unk2,
        0
    );
}

void sub_8067710(struct UNK_8063A00* config) {
    struct UNK_806B908 local48;
   
    struct UNK_0808B3FC_UNK240* unk30 = config->unk258.unk30;
    struct UNK_0808B3FC_UNK240* unk0 = &config->unk258.unk0;

    s16 i;
    s16 pos; 
    u16 nameChar;

    // Required for match
    u32 temp0 = 0x16;
    for (i = 0, pos = 0xA0; i < MAX_PLAYER_NAME_LENGTH; i++, unk30++, pos += 0xC) {
        nameChar = config->unk258.unk154[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }
        
        local48 = sub_806B908(nameChar);
        sub_806A568(
            unk30, 
            0, 
            local48.unk0,
            local48.unk4,
            0x1000,
            pos, 
            temp0,
            8,
            local48.unk6,
            0
        );
    }

    sub_806A568(
        unk0, 
        0, 
        2,
        0x3BA,
        0x1000,
        config->unk258.unk152 * 12 + 161, 
        0x15,
        5,
        6,
        0
    );
}

void sub_8067F84(void);
u16 sub_8067B90(void);
u16 sub_8067C50(void);

u16 sub_806BA14(s16, u16);
u16 sub_806A664(s16, u16);
u16 sub_806B988(u16*);
void sub_8067E24(void);

void sub_80677EC(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_8063A00_UNK258* unk258 = &state->unk258;

    sub_8067F84();
    
    ShuffleRngSeed();

    if (sub_8067B90()) {
        return;
    }

    if (sub_8067C50()) {
        return;
    }

    if (gRepeatedKeys & A_BUTTON) {
        if (state->unk252 <= 10) {
            if (state->unk3B8 == 10 || state->unk3B8 == 0x15) {
                s16 temp1 = 2;
                if (state->unk3B8 == 10) {
                    temp1 = 1;
                }
                
                if (unk258->unk152 < MAX_PLAYER_NAME_LENGTH) {
                    if (unk258->unk154[unk258->unk152] == PLAYER_NAME_END_CHAR) {
                        m4aSongNumStart(SE_SELECT);
                        if (sub_806BA14(temp1, unk258->unk154[unk258->unk152 - 1])) {
                            unk258->unk154[unk258->unk152 - 1] = sub_806A664(temp1, unk258->unk154[unk258->unk152 - 1]);
                        } else {
                            unk258->unk154[unk258->unk152] = state->unk3B8;
                            if (unk258->unk152 < 5) {
                                unk258->unk152++;                               
                            } else {
                                unk258->unk152 = MAX_PLAYER_NAME_LENGTH;
                                state->unk252 = 11;
                                state->unk253 = MAX_PLAYER_NAME_LENGTH;
                            }
                        }
                    } else {
                        if (sub_806BA14(temp1, unk258->unk154[unk258->unk152])) {
                            m4aSongNumStart(SE_SELECT);
                            unk258->unk154[unk258->unk152] = sub_806A664(temp1, unk258->unk154[unk258->unk152]);
                        } else {
                            m4aSongNumStart(SE_SELECT);
                            unk258->unk154[unk258->unk152] = state->unk3B8;
                        }
                    }
                } else {
                    if (sub_806BA14(temp1, unk258->unk154[unk258->unk152 - 1])) {
                        m4aSongNumStart(SE_SELECT);
                        unk258->unk154[unk258->unk152 - 1] = sub_806A664(temp1, unk258->unk154[unk258->unk152 - 1]);
                    }
                    unk258->unk152 = MAX_PLAYER_NAME_LENGTH;
                    state->unk252 = 11;
                    state->unk253 = MAX_PLAYER_NAME_LENGTH;
                }
            }

            if (unk258->unk152 < MAX_PLAYER_NAME_LENGTH) {
                if (state->unk3B8 != 10 && state->unk3B8 != 0x15) {
                    m4aSongNumStart(SE_SELECT);
                    unk258->unk154[unk258->unk152] = state->unk3B8;
                    if (unk258->unk152 < MAX_PLAYER_NAME_LENGTH - 1) {
                        unk258->unk152++;
                    }
                }
            }
            return;
        }
    
        switch (state->unk253) {
            case 4:
                if (unk258->unk152 == 0) {
                    return;
                }
                unk258->unk152--;
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                break;  
            case 5:
                if (unk258->unk152 > MAX_PLAYER_NAME_LENGTH - 2) {
                    return;
                }
                if (unk258->unk154[unk258->unk152] == PLAYER_NAME_END_CHAR) {
                    unk258->unk154[unk258->unk152] = 0x11;
                }
                unk258->unk152++;
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                return;
            case 6:
                if (sub_806B988(unk258->unk154) == 0) {
                     m4aSongNumStart(SE_RETURN);
                    return;
                }
                m4aSongNumStart(SE_SELECT);
                sub_8067E24();
               
                return;
        }
        return;
    }
    
    if (gPressedKeys & START_BUTTON) {
        // TODO: what's going on here
        if (*(u16*)&state->unk252 == 0x60B) {
            if (sub_806B988(unk258->unk154) == 0) {
                m4aSongNumStart(SE_RETURN);
                return;
            } 
            m4aSongNumStart(SE_SELECT);
            sub_8067E24();
            return;
        } else {
            m4aSongNumStart(SE_SELECT);
            state->unk252 = 0xB;
            state->unk253 = 6;
        }
        return;
    }
    
    if (gRepeatedKeys & B_BUTTON) {
        s16 i;
        m4aSongNumStart(SE_RETURN);
        if ((unk258->unk152 != 0 && unk258->unk154[unk258->unk152] == PLAYER_NAME_END_CHAR) || unk258->unk152 > MAX_PLAYER_NAME_LENGTH - 1) {
            unk258->unk152--;
        }
        
        for (i = unk258->unk152; i < MAX_PLAYER_NAME_LENGTH - 1; i++) {
            unk258->unk154[i] = unk258->unk154[i + 1];
        }
        unk258->unk154[MAX_PLAYER_NAME_LENGTH - 1] = 0xFFFF;
    }
}

u16 sub_806B9C8(u16);

u16 sub_8067B90(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);

    if (gRepeatedKeys & L_BUTTON) {
        if (state->unk258.unk152 != 0) {
            state->unk258.unk152--;
            if (state->unk258.unk152 < MAX_PLAYER_NAME_LENGTH - 1) {
                if (
                    state->unk258.unk154[state->unk258.unk152 + 1] == PLAYER_NAME_END_CHAR &&
                    sub_806B9C8(state->unk258.unk154[state->unk258.unk152]) == 0
                ) {
                    state->unk258.unk154[state->unk258.unk152] = PLAYER_NAME_END_CHAR;    
                }
            }
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
        return 1;
    }

    if (gRepeatedKeys & R_BUTTON) {
        if (state->unk258.unk152 < MAX_PLAYER_NAME_LENGTH - 1) {
            if (state->unk258.unk154[state->unk258.unk152] == PLAYER_NAME_END_CHAR) {
                state->unk258.unk154[state->unk258.unk152] = 0x11;
            }
            state->unk258.unk152++;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
        return 1;
    }

    return 0;
}

u16 sub_8067C50(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);

    if (!(gRepeatedKeys & (DPAD_DOWN | DPAD_UP | DPAD_LEFT | DPAD_RIGHT))) {
        return 0;
    }

    m4aSongNumStart(SE_MENU_CURSOR_MOVE);

    if (gRepeatedKeys & DPAD_UP) {
        if (state->unk252 < 11) {
            if (state->unk253 != 0) {
                state->unk253--;
                return 1;
            } 
    
            if (state->unk250 > 0) {
                gBgScrollRegs[1][1] -= 0x10;
                state->unk250 -= 0xB;
            } else {
                state->unk253 = 6; 
                gBgScrollRegs[1][1] = 0xC9;
                state->unk250 = 0xA5;
            }
        } else {
            if (state->unk253 > 4) {
                state->unk253--;
            } else {
                state->unk253 = 6;
            }
        }
        return 1;
    }

    if (gRepeatedKeys & DPAD_DOWN) {
        if (state->unk252 < 11) {
            if (state->unk253 < MAX_PLAYER_NAME_LENGTH) {
                state->unk253++;
            } else {
                if (state->unk250 < 0xA5) {
                    gBgScrollRegs[1][1] += 0x10;
                    state->unk250 += 0xB;
                } else {
                    gBgScrollRegs[1][1] = 0xFFD9;
                    state->unk253 = 0;
                    state->unk250 = 0;
                }
            }
        } else {
            if (state->unk253 < 6) {
                state->unk253++;
            } else {
                state->unk253 = 4;
            }
        }
        return 1;
    }

    if (gRepeatedKeys & DPAD_LEFT) {
        if (state->unk252 != 0) {
            state->unk252--;
        } else {
            if (state->unk253 < 4) {
                state->unk252 = 10;
            } else {
                state->unk252 = 11;
            }
        }
        return 1;
    }

    if (gRepeatedKeys & DPAD_RIGHT) {
        if (state->unk253 < 4) {
            if (state->unk252 < 10) {
                state->unk252++;
            } else {
                state->unk252 = 0;
            }
        } else {
            if (state->unk252 < 11) {
                state->unk252++;
            } else {
                state->unk252 = 0;
            }
        }
        return 1;
    }

    return 0;
}

void sub_8067EA4(void);

void sub_8067E24(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk140 = &state->unk140;
    struct UNK_8063A00_UNK258* unk258 = &state->unk258;
    u16* optionsScreenPlayerName;
    s16 i;

    // Copy name from input into profile data on the options screen
    if (state->unk3BB == 0) {
        struct UNK_8063730_UNK0* profileData = &state->unk14C->unk15C->unk0;
        for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
            profileData->unk0[i] = unk258->unk154[i];
        }
    }

    unk140->unk0 = 0;
    unk140->unk2 = 1;
    unk140->unk4 = 0;
    unk140->unk6 = 0x100;
    unk140->unkA = 0;
    unk140->unk8 = 0xFF;

    gCurTask->main = sub_8067EA4;
}

void sub_805A1CC(void);

void sub_8067EA4(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_802D4CC_UNK270* unk140 = &state->unk140;
    struct UNK_8063A00_UNK258* unk258 = &state->unk258;
    s16 unk3BB = state->unk3BB;
    s16 i;

    if (!sub_802D4CC(unk140)) {
        sub_8067F84();
        return;
    }

    if (unk3BB == 0) {
        state->unk14C->unk163 = 0;
        TaskDestroy(gCurTask);
        return;
    }
    
    if (unk3BB == 2) {
        NewSaveGame();
    }

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        gLoadedSaveGame->unk20[i] = unk258->unk154[i];
    }
    WriteSaveGame();
    TasksDestroyInPriorityRange(0, 0xFFFF);
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = gUnknown_03002A84;

    if (unk3BB == 1) {
        sub_805A1CC();
    } else {
        CreateTitleScreen();
    }
}

void sub_8067F84(void) {
    struct UNK_8063A00* state = TaskGetStructPtr(gCurTask, state);

    struct UNK_0808B3FC_UNK240* unk0 = &state->unk0;
    struct UNK_0808B3FC_UNK240* unk30 = state->unk30;
    struct UNK_0808B3FC_UNK240* unk150 = state->unk150;
    struct UNK_0808B3FC_UNK240* unk1B0 = state->unk1B0;
    struct UNK_0808B3FC_UNK240* unk258_30 = state->unk258.unk30;
    struct UNK_0808B3FC_UNK240* unk258_0 = &state->unk258.unk0;
    struct UNK_806B908 local48;
    struct UNK_806B908 local28;

    s16 i;
    u16* nameChar;

    sub_80051E8(unk0);

    for (i = 0; i < 3; i++, unk30++) {
        sub_80051E8(unk30);
    }

    if (state->unk252 < 11) {
        unk150->unkA = 0x3BA;
        unk150->unk20 = 7;
        unk150->unk16 = state->unk252 * 0x10 + 0x20;
        unk150->unk18 = state->unk253 * 0x10 + 0x2F;
        sub_8004558(unk150);
        sub_80051E8(unk150);
        unk150++;

        state->unk3B8 = state->unk250 + state->unk253 * 0xB + state->unk252; 
        local48 = sub_806B908(state->unk3B8);
        unk150->unkA = local48.unk4;
        unk150->unk20 = local48.unk6;
        unk150->unk16 = state->unk252 * 0x10 + 0x20;
        unk150->unk18 = state->unk253 * 0x10 + 0x2F;
        sub_8004558(unk150);
        sub_80051E8(unk150);
    } else {
        unk150->unkA = 0x3BA;
        unk150->unk20 = 8;
        unk150->unk16 = 0xCB;
        unk150->unk18 = state->unk253 * 0x10 + 0x27;
        sub_8004558(unk150);
        sub_80051E8(unk150);
    }

    sub_8004558(unk1B0);
    unk1B0++;
    sub_8004558(unk1B0);

    if (state->unk252 < 11) {
        unk1B0 = state->unk1B0;
        if (state->unk3B8 > 10) {
            sub_80051E8(unk1B0);
        }
        unk1B0++;

        if (state->unk3B8 < 0xE7) {
            sub_80051E8(unk1B0);
        }
    }

    if (state->unk258.unk152 < 6) {
        unk258_0->unk16 = state->unk258.unk152 * 0xC + 0xA1;
        sub_80051E8(unk258_0);
    }

    for (i = 0, nameChar = state->unk258.unk154; i < 6 && *nameChar != PLAYER_NAME_END_CHAR; i++, unk258_30++, nameChar++) {
        local28 = sub_806B908(*nameChar);
        unk258_30->unkA = local28.unk4;
        unk258_30->unk20 = local28.unk6;
        sub_8004558(unk258_30);
        sub_80051E8(unk258_30);
    }
}

void sub_806B3F0(void);
void sub_80682AC(void);
void sub_80682EC(struct UNK_80637EC*);
void sub_806834C(struct UNK_80637EC*);

void sub_8068198(struct UNK_8064A40* playerProfileMenu) {
    struct Task* t = TaskCreate(sub_806B3F0, 0x714, 0x2000, 4, 0);
    struct UNK_80637EC* config = TaskGetStructPtr(t, config);
    s16 i;

    for (i = 1; i < 5; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    config->unk1FC = playerProfileMenu;
    config->unk704 = 0;
    config->unk705 = 0;
    config->unk706 = 0;
    config->unk707 = 0;
    config->unk708 = 0;
    config->unk709 = i;

    for (i = 0; i < 5; i++) {
        config->unk70A[i] = gLoadedSaveGame->unk7[i];
    }

    config->unk70F = playerProfileMenu->unk162;
    config->unk710 = 0;
    config->unk711 = 0;
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_80682AC();
    sub_80682EC(config);
    sub_806834C(config);
}

void sub_80682AC(void) {
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[1] = 0xF06;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

void sub_80682EC(struct UNK_80637EC* config) {
    struct UNK_802D4CC_UNK270* unk270 = &config->unk0;
    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;
    sub_806B854(&config->unk204,0,7,0x89,0x1e,0x14,0,0,0,0);
    sub_806B854(&config->unk244,1,0xF,0x8A,0x1e,0x14,0,1,0,0);
}

extern const struct UNK_080D95E8 gUnknown_080D9EB0[6];
extern const struct UNK_080D95E8 gUnknown_080D9EE0[6][2];

void sub_806834C(struct UNK_80637EC* config) {
    struct UNK_0808B3FC_UNK240* unk10C = &config->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = config->unk13C;
    struct UNK_0808B3FC_UNK240* unk4C = config->unk4C;
    const struct UNK_080D95E8 *itemText1 = &gUnknown_080D9EB0[config->unk70F];
    const struct UNK_080D95E8 *itemText2 = gUnknown_080D9EE0[config->unk70F];
    
    // TODO: This X is a fake match, the compiler wants to use 0
    // from a register but won't do it without this
    s32 x = 0x1000;

    ++x; --x;
    sub_806A568(
        unk10C, 
        0, 
        itemText1->unk4,
        itemText1->unk0,
        x,
        4, 
        0x1A,
        5,
        itemText1->unk2,
        0
    );

    sub_806A568(
        unk4C, 
        0, 
        itemText2->unk4,
        itemText2->unk0,
        x,
        0x28, 
        0x54,
        5,
        itemText2->unk2,
        0
    );

    unk4C++;
    itemText2++;
    sub_806A568(
        unk4C, 
        0, 
        itemText2->unk4,
        itemText2->unk0,
        x,
        0x86, 
        0x54,
        5,
        itemText2->unk2,
        0
    );

    sub_806A568(
        unk13C, 
        0, 
        2,
        0x3B6,
        x,
        100, 
        0x4B,
        6,
        8,
        0
    );
    unk13C++;
    sub_806A568(
        unk13C, 
        0, 
        2,
        0x3B6,
        x,
        0x8C, 
        0x4B,
        6,
        9,
        0
    );
}

void sub_806B4F8(void);
void sub_806B498(void);
void sub_806B424(void);

void sub_8068474(void) {
    struct UNK_80637EC* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4C = state->unk4C;
    
    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        state->unk710 = state->unk710 == 0;
        
        if (!state->unk710) {
            unk4C->unk25 = 0;
            unk4C++;
            unk4C->unk25 = 0;
        } else {
            unk4C->unk25 = 1;
            unk4C++;
            unk4C->unk25 = 0xFF;
        }
    }

    sub_806B4F8();

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        sub_806B498();
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806B424();
    }
}

void sub_8068524(struct UNK_8064A40* playerProfileMenu) {
    struct Task* t = TaskCreate(sub_806B5A4, 0x714, 0x2000, 4, 0);
    struct UNK_80637EC* config = TaskGetStructPtr(t, config);
    s16 i;

    for (i = 1; i < 5; i++) {
        if (!GetBit(gLoadedSaveGame->unk13, i)) {
            break;
        }
    };

    config->unk1FC = playerProfileMenu;
    config->unk200 = NULL;
    config->unk704 = 0;
    config->unk705 = 0;
    config->unk706 = 0;
    config->unk707 = 0;
    config->unk708 = 0;
    config->unk709 = i;

    for (i = 0; i < 5; i++) {
        config->unk70A[i] = gLoadedSaveGame->unk7[i];
    }

    config->unk70F = playerProfileMenu->unk162;
    config->unk710 = 0;
    config->unk711 = 1;
    
    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = NULL;

    sub_8068640();
    sub_8068700(config);
    sub_80687BC(config);
}

void sub_8068640(void) {
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x703;
    gBgCntRegs[1] = 0x5606;
    gBgCntRegs[2] = 0x5E09;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0xff58;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0xff58;
    gBgScrollRegs[2][1] = 0x10;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(1), 0x40);

    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 64;

    DmaFill32(3, 0, (void *)BG_CHAR_ADDR(2), 0x40);
}

extern const u16 gUnknown_080D9590[5][2];

void sub_8068700(struct UNK_80637EC* courseRecordsScreen) {
    struct UNK_802D4CC_UNK270* unk270 = &courseRecordsScreen->unk0;
    u8 lang;
    if (courseRecordsScreen->unk704 != 0xFF) {
        lang = courseRecordsScreen->unk704;
    } else {
        lang = 0;
    }

    unk270->unk0 = 0;
    unk270->unk2 = 2;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    sub_806B854(&courseRecordsScreen->unkC,0,7,0x8B,0x1e,0x14,0,0,0,0);
    sub_806B854(&courseRecordsScreen->unk204,1,0x16,gUnknown_080D9590[lang][0],9,0x14,0,1,0,0);
    sub_806B854(&courseRecordsScreen->unk244,2,0x1E,gUnknown_080D9590[lang][1],9,0x14,0,2,0,0);
}

extern const struct UNK_080D95E8 gUnknown_080D9F40[7];
extern const struct UNK_080D95E8 gUnknown_080D9FD0[6][7];
extern const struct UNK_080D95E8 gUnknown_080DA120[6][7];

void sub_80687BC(struct UNK_80637EC* courseRecordsScreen) {
    struct UNK_0808B3FC_UNK240* unk284 = courseRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = courseRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;
    

    u8 unk70F = courseRecordsScreen->unk70F;
    u8 unk705 = courseRecordsScreen->unk705;
    u8 unk706 = courseRecordsScreen->unk706;

    const struct UNK_080D95E8* r4, *r1, *r0;

    s16 temp;

    sub_806A568(unk13C,0,2,0x41A,0x1400,0xE,0x20,2,0,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1000,0x9C,0x20,2,0,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1000,0xD0,0x18,3,1,0);
    unk13C++;
    sub_806A568(unk13C,0,2,0x41A,0x1800,0xD0,0x8C,3,1,0);

    sub_806A568(unk284,0,0x10,0x417,0x1000,4,0x50,5,0xB,0);
    unk284++;
    sub_806A568(unk284,0,0x10,0x417,0x1000,0xC,0x68,5,0xC,0);
    unk284++;
    sub_806A568(unk284,0,0x10,0x417,0x1000,0x14,0x80,5,0xD,0);

// Might not be matching because of somethign to do with the data
#ifndef NON_MATCHING
    r0 = gUnknown_080D9F40;
    temp = sub_806B8D4(r0, 7);
#else
    temp = sub_806B8D4(gUnknown_080D9F40, 7);
#endif
    sub_806A568(unk4C,0,0x14,0x418,0x1000,0x10,0xC,3,0,0);
#ifndef NON_MATCHING
    asm("":"=r"(r0));
#endif

    unk4C++;
    r1 = &gUnknown_080D9F40[unk705];
#ifndef NON_MATCHING
    asm("":::"sl");
#endif
    sub_806A568(unk4C,0,temp,r1->unk0,0x1000,0x5E,0xC,3,r1->unk2,0);

    if (courseRecordsScreen->unk710 == 0) {
        sub_806A568(unkAC,0,0x10,0x418,0x1000,0x4E,0x20,3,1,0);
        unkAC++;
    
        r1 = &gUnknown_080D9F40[unk706];
        sub_806A568(unkAC,0,temp,r1->unk0,0x1000,0x88,0x20,3,r1->unk2,0);
    } else {
        sub_806A568(unkAC,0,0x14,0x418,0x1000,0x4e,0x20,3,9,0);  
    }

    if (courseRecordsScreen->unk710 == 0) {
        r4 = &gUnknown_080D9FD0[unk70F][courseRecordsScreen->unk705];
    } else {
        r4 = &gUnknown_080DA120[unk70F][courseRecordsScreen->unk705];
    }

    temp = sub_806B8D4(r4, 7);
    sub_806A568(unk10C,0,temp, r4->unk0,0x1000,0x9a,0x44,3,r4->unk2,0);
}

extern const struct UNK_080D95E8 gUnknown_080D9F78[11];
extern const u8 gUnknown_080D6B80[60][2];

static inline u16* LoadCourseTimes(struct UNK_80637EC* courseRecordsScreen) {
    u8 unk706;
    
     if (courseRecordsScreen->unk710 == 0) {
        unk706 = courseRecordsScreen->unk706;
    } else {
        unk706 = 2;
    }

    // When the records are loaded from options we have to load the data from the options 
    // screen (though I don't understand why this wasn't done from the gLoadedSaveData)
    if (courseRecordsScreen->unk711 != 2) {
        return courseRecordsScreen->unk1FC->unk15C->unk0.unkC.table[courseRecordsScreen->unk704][courseRecordsScreen->unk705][unk706];
    } else {
        return courseRecordsScreen->unk200->table[courseRecordsScreen->unk704][courseRecordsScreen->unk705][unk706];
    }
}

void sub_8068A94(struct UNK_80637EC* courseRecordsScreen) {
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    s16 FCC = gUnknown_080D9F78[10].unk4;
    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;
    s16 i;

    u16* courseTimes = LoadCourseTimes(courseRecordsScreen);

    for (i = 0; i < 3; i++, unk314++) {
        const struct UNK_080D95E8* F78;
        s16 millis, minutes, seconds;
        u16 timeValue;

        unk0 = unk314->unk0;
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;

        timeValue = courseTimes[i];
        if (timeValue < ZONE_TIME_TO_INT(10, 0)) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            millis = gUnknown_080D6B80[temp][0] * 10;
            millis += gUnknown_080D6B80[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        F78 = &gUnknown_080D9F78[10];
        sub_806A568(unk0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x30),(i * 24 + 84),8,F78->unk2,0);

        unk0++;
        sub_806A568(unk0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x60),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[minutes];
        sub_806A568(unk60,0,FCC,F78->unk0,0x3000,(i * 8 + 0x20),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[seconds / 10];
        sub_806A568(unk90,0,FCC,F78->unk0,0x3000,(i * 8 + 0x40),(i * 24 + 84),8,F78->unk2,0);

        unk90++;
        F78 = &gUnknown_080D9F78[seconds % 10];
        sub_806A568(unk90,0,FCC,F78->unk0,0x3000,(i * 8 + 0x50),(i * 24 + 84),8,F78->unk2,0);

        F78 = &gUnknown_080D9F78[millis / 10];
        sub_806A568(unkF0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x70),(i * 24 + 84),8,F78->unk2,0);
        
        unkF0++;
        F78 = &gUnknown_080D9F78[millis % 10];
        sub_806A568(unkF0,0,FCC,F78->unk0,0x3000,(i * 8 + 0x80),(i * 24 + 84),8,F78->unk2,0);
    }
}

void sub_8068D94(struct UNK_80637EC* courseRecordsScreen) {
    const struct UNK_080D95E8* F78;
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;
    s16 i;
    u16* courseTimes = LoadCourseTimes(courseRecordsScreen);

    for (i = 0; i < 3; i++, unk314++) {
        s16 millis, minutes, seconds;
        u16 timeValue;
        
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;
        unk0 = unk314->unk0;
        
        timeValue = courseTimes[i];
        if (timeValue < ZONE_TIME_TO_INT(10, 0)) {
            s16 temp = timeValue % 60;
            u16 temp2 = timeValue - temp;
            // This logic is the same as the above function but required to be
            // inline instead of split, but required to be split in the other function
            millis = gUnknown_080D6B80[temp][0] * 10 + gUnknown_080D6B80[temp][1];
            seconds = temp2 / 60;
            minutes = seconds / 60;
            seconds += minutes * -60;
        } else {
            millis = 99;
            seconds = 59;
            minutes = 9;
        }

        F78 = &gUnknown_080D9F78[minutes];
        
        unk60->unkA = F78->unk0;
        unk60->unk20 = F78->unk2;
        unk60->unk16 = (i * 8) + 0x110;
        sub_8004558(unk60);
        
        unk0->unk16 = (i * 8) + 0x120;
        unk0++;

        F78 = &gUnknown_080D9F78[seconds / 10];
        unk90->unkA = F78->unk0;
        unk90->unk20 = F78->unk2;
        unk90->unk16 = (i * 8) + 0x130;
        sub_8004558(unk90);

        unk90++;
        F78 = &gUnknown_080D9F78[seconds % 10];
        unk90->unkA = F78->unk0;
        unk90->unk20 = F78->unk2;
        unk90->unk16 = (i * 8) + 0x140;
        sub_8004558(unk90);
    
        unk0->unk16 = (i * 8) + 0x150;

        F78 = &gUnknown_080D9F78[millis / 10];
        unkF0->unkA = F78->unk0;
        unkF0->unk20 = F78->unk2;
        unkF0->unk16 = (i * 8) + 0x160;
        sub_8004558(unkF0);

        unkF0++;
        F78 = &gUnknown_080D9F78[millis % 10];
        unkF0->unkA = F78->unk0;
        unkF0->unk20 = F78->unk2;
        unkF0->unk16 = (i * 8) + 0x170;
        sub_8004558(unkF0);
    }
}

void sub_806979C(u16);
void sub_80690A4(void);

void sub_8068FE8(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    u32 a;

    if (courseRecordsScreen->unk704 != 0xFF) {
        a = courseRecordsScreen->unk704;
    } else {
        a = 0;
    }

    sub_806979C(1);
    gBgScrollRegs[1][0] = 0xFF10;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0xFF10;
    gBgScrollRegs[2][1] = 0x10;

    sub_806B854(&courseRecordsScreen->unk204, 1, 0x16, gUnknown_080D9590[a][0], 9, 0x14, 0, 1, 0, 0);
    sub_806B854(&courseRecordsScreen->unk244, 2, 0x1E, gUnknown_080D9590[a][1], 9, 0x14, 0, 2, 0, 0);

    gCurTask->main = sub_80690A4;
}

void sub_8069110(void);

void sub_80690A4(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);

    if (++courseRecordsScreen->unk707 < 5) {
        gBgScrollRegs[1][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;
    }

    if (courseRecordsScreen->unk707 > 6) {
        gBgScrollRegs[2][0] = (courseRecordsScreen->unk707 - 6) * 0x12 - 0xF0;
    }

    sub_806979C(1);

    if (courseRecordsScreen->unk707 > 9) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8069110;
    }
}

void sub_8069180(s16, s16);
void sub_8069208(void);

void sub_8069110(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    s16 i;

    courseRecordsScreen->unk707++;
    
    for (i = 0; i < 3; i++) {
        sub_8069180(i, courseRecordsScreen->unk707 + i * -8);
    }

    sub_806979C(0);

    if (courseRecordsScreen->unk707 > 0x1F) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8069208;
    }
}

void sub_8069180(s16 a, s16 b) {
    // Not sure why but the struct has to be loaded like this
#ifndef NON_MATCHING
    u32 offsetA = gCurTask->structOffset + (a * sizeof(struct UNK_80637EC_UNK314));
    register u32 offsetB asm("r2") = IWRAM_START + offsetof(struct UNK_80637EC, unk314);
    struct UNK_80637EC_UNK314* unk314 = (struct UNK_80637EC_UNK314*)(offsetA + offsetB);
#else
    struct UNK_80637EC_UNK314* unk314 = &((struct UNK_80637EC*)(IWRAM_START + gCurTask->structOffset))->unk314[a];
#endif

    if (b > 0 && b < 9) {
        struct UNK_0808B3FC_UNK240* unk0 = unk314->unk0;
        struct UNK_0808B3FC_UNK240* unk60 = &unk314->unk60;
        struct UNK_0808B3FC_UNK240* unk90 = unk314->unk90;
        struct UNK_0808B3FC_UNK240* unkF0 = unk314->unkF0;
        
        s16 c = (8 - b) * 0x1E + (a * 8);
        unk60->unk16 = c + 0x20;
        unk0->unk16 = c + 0x30;
        unk0++;
        unk0->unk16 = c + 0x60;

        unk90->unk16 = c + 0x40;
        unk90++;
        unk90->unk16 = c + 0x50;

        unkF0->unk16 = c + 0x70;
        unkF0++;
        unkF0->unk16 = c + 0x80;
    }
}

void sub_806955C(void);
void sub_806B60C(void);
void sub_806B684(void);
void sub_80694F8(void);
void sub_806B730(void);

void sub_8069208(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    s16 unk70A = courseRecordsScreen->unk70A[courseRecordsScreen->unk704];
    s32 var;
    if (unk70A == 0) {
        unk70A = 1;
    }
    // Possibly some macro
    var = (u16)unk70A;
    if (var > 0x1B) {
        unk70A = 0x1B;
    }
    sub_806979C(0);

    if (gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {
        if (courseRecordsScreen->unk711 == 2 && unk70A == 1) {
            return;
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        if (gRepeatedKeys & DPAD_LEFT) {
            if (courseRecordsScreen->unk710 == 0) {
                if (courseRecordsScreen->unk711 == 2) {
                    if (courseRecordsScreen->unk706 == 0) {
                        if (courseRecordsScreen->unk705 != 0) {
                            courseRecordsScreen->unk705--;
                            courseRecordsScreen->unk706 = 1;
                        } else {
                            s16 r1;
                            courseRecordsScreen->unk705 = unk70A >> 2;
                            r1 = unk70A & 3;
                            courseRecordsScreen->unk706 = r1 != TRUE;
                        }
                        gCurTask->main = sub_806955C;
                        return;
                    }
                    courseRecordsScreen->unk706--;
                } else {
                    if (courseRecordsScreen->unk706 == 0) {
                        courseRecordsScreen->unk706 = 1;
                        if (courseRecordsScreen->unk705 != 0) {
                           courseRecordsScreen->unk705--;
                        } else {
                            courseRecordsScreen->unk705 = 6;
                        }
                        gCurTask->main = sub_806955C;
                        return;
                    }
                    else
                        courseRecordsScreen->unk706--;
                }
            }
            else {
                if (courseRecordsScreen->unk705 != 0) {
                    courseRecordsScreen->unk705--;
                } else {
                    courseRecordsScreen->unk705 = 6;
                }
                gCurTask->main = sub_806955C;
                return;
            }
        }
        else if (gRepeatedKeys & DPAD_RIGHT) {
            if (courseRecordsScreen->unk710 == 0) {
                if (courseRecordsScreen->unk711 == 2) {
                    s32 r5;
                    s16 r1;
                    s32 backup = unk70A;
                    unk70A >>= 2;
                    r1 = backup & 3;
                    r5 = r1 != TRUE;
                    if (courseRecordsScreen->unk706 != 0) {
                        courseRecordsScreen->unk706 = 0;
                        if (courseRecordsScreen->unk705 < 6) {
                            courseRecordsScreen->unk705++;
                        } else {
                            courseRecordsScreen->unk705 = 0;
                        }

                        if (courseRecordsScreen->unk705 > unk70A) {
                            courseRecordsScreen->unk705 = 0;
                            courseRecordsScreen->unk706 = 0;
                        }
                    } else {
                        courseRecordsScreen->unk706++;
                        if (courseRecordsScreen->unk705 >= unk70A
                            && courseRecordsScreen->unk706 > r5) {
                            courseRecordsScreen->unk705 = 0;
                            courseRecordsScreen->unk706 = 0;
                            gCurTask->main = sub_806955C;
                            return;
                        }
                        else {
                            gCurTask->main = sub_806B60C;
                            return; 
                        }
                    }
                    gCurTask->main = sub_806955C;
                    return;
                }

                if (courseRecordsScreen->unk706 != 0) {
                    courseRecordsScreen->unk706 = 0;
                    if (courseRecordsScreen->unk705 < 6) {
                        courseRecordsScreen->unk705++;
                    } else {
                         courseRecordsScreen->unk705 = 0;
                    }
                    gCurTask->main = sub_806955C;
                    return;
                } else {
                    courseRecordsScreen->unk706++;
                }
                
            }
            else {
                if (courseRecordsScreen->unk705 < 6) {
                    courseRecordsScreen->unk705++;
                } else {
                     courseRecordsScreen->unk705 = 0;
                }
                gCurTask->main = sub_806955C;
                return;
            }
            
        }
        gCurTask->main = sub_806B60C;
        return;
    } else {
        if (courseRecordsScreen->unk711 != 2) {
            if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
                s16 temp = courseRecordsScreen->unk709 - 1;
                if (temp == 0) {
                    return;
                }
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                if (gRepeatedKeys & DPAD_UP) {
                    if (courseRecordsScreen->unk704 != 0) {
                       courseRecordsScreen->unk704--;
                    } else {
                         courseRecordsScreen->unk704 = temp;
                    }
                } else if (gRepeatedKeys & DPAD_DOWN) {
                    if (courseRecordsScreen->unk704 < temp) {
                        courseRecordsScreen->unk704++;
                    } else {
                        courseRecordsScreen->unk704 = 0;
                    }
                }
    
                courseRecordsScreen->unk707 = 4;
                gCurTask->main = sub_80694F8;
                return;
            }
        }
        else if (gPressedKeys & A_BUTTON) {
            m4aSongNumStart(SE_SELECT);
            sub_806B684();
            return;
        }
        if (gPressedKeys & B_BUTTON) {
            m4aSongNumStart(SE_RETURN);
            sub_806B730();
        }
    }
}

void sub_80694F8(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);

    courseRecordsScreen->unk707--;

    gBgScrollRegs[1][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;
    gBgScrollRegs[2][0] = courseRecordsScreen->unk707 * 0x12 - 0xF0;

    sub_8068D94(courseRecordsScreen);
    sub_806979C(1);

    if (courseRecordsScreen->unk707 == 0) {
        courseRecordsScreen->unk707 = 0;
        gCurTask->main = sub_8068FE8;
    }
}

void sub_806955C(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk7C = &courseRecordsScreen->unk4C[1];
    struct UNK_0808B3FC_UNK240* unkDC = &courseRecordsScreen->unkAC[1];
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;

    u16 unk70F = courseRecordsScreen->unk70F;
    const struct UNK_080D95E8* F40 = &gUnknown_080D9F40[courseRecordsScreen->unk705];
    unk7C->unkA = F40->unk0;
    unk7C->unk20 = F40->unk2;
    
    sub_8004558(unk7C);

    if (courseRecordsScreen->unk710 == 0) {
        F40 = &gUnknown_080D9F40[courseRecordsScreen->unk706];
        unkDC->unkA = F40->unk0;
        unkDC->unk20 = F40->unk2;
        sub_8004558(unkDC);
    }

    if (courseRecordsScreen->unk710 == 0) {
        F40 = &gUnknown_080D9FD0[unk70F][courseRecordsScreen->unk705];
    } else {
        F40 = &gUnknown_080DA120[unk70F][courseRecordsScreen->unk705];
    }

    unk10C->unkA = F40->unk0;
    unk10C->unk20 = F40->unk2;
    sub_8004558(unk10C);
    sub_8068D94(courseRecordsScreen);
    sub_806979C(0);
    courseRecordsScreen->unk707 = 0;
    gCurTask->main = sub_8069110;
}

void sub_803143C(u8, u8);

void sub_8069688(void) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_802D4CC_UNK270* unk0 = &courseRecordsScreen->unk0;
    struct UNK_8064A40* playerProfileMenu = courseRecordsScreen->unk1FC;

    if (sub_802D4CC(unk0) == 0) {
        sub_806979C(0);
    } else {
        u8 unk709;
        u8 r5;
        switch (courseRecordsScreen->unk711) {
            case 0:
                courseRecordsScreen->unk707 = 0;
                courseRecordsScreen->unk710 = 0;
                courseRecordsScreen->unk711 = 0;
                gUnknown_03005B50 = (void*)OBJ_VRAM0;
                gUnknown_03005B54 = NULL;

                sub_80682AC();
                sub_80682EC(courseRecordsScreen);
                sub_806834C(courseRecordsScreen);
                gCurTask->main = sub_806B3F0;
                break;
            case 1:
                playerProfileMenu->unk163 = 0;
                TaskDestroy(gCurTask);
                break;
            case 2:
                r5 = 0;
                unk709 = courseRecordsScreen->unk709;
                if (unk709 == 5) {
                    r5 = 1;
                }
                EwramFree(courseRecordsScreen->unk200);
                TasksDestroyInPriorityRange(0, 0xFFFF);
                gUnknown_03002AE4 = gUnknown_0300287C;
                gUnknown_03005390 = 0;
                gUnknown_03004D5C = gUnknown_03002A84;
                sub_803143C(courseRecordsScreen->unk704, r5);
                break;
        }
    }
}

void sub_806979C(u16 a) {
    struct UNK_80637EC* courseRecordsScreen = TaskGetStructPtr(gCurTask, courseRecordsScreen);
    struct UNK_80637EC_UNK314* unk314 = courseRecordsScreen->unk314;
    struct UNK_0808B3FC_UNK240* unk284 = courseRecordsScreen->unk284;
    struct UNK_0808B3FC_UNK240* unk4C = courseRecordsScreen->unk4C;
    struct UNK_0808B3FC_UNK240* unkAC = courseRecordsScreen->unkAC;
    struct UNK_0808B3FC_UNK240* unk10C = &courseRecordsScreen->unk10C;
    struct UNK_0808B3FC_UNK240* unk13C = courseRecordsScreen->unk13C;

    struct UNK_0808B3FC_UNK240* unk60, *unk90, *unkF0, *unk0;

    s16 temp, i, j;
    s16 unk70A = courseRecordsScreen->unk70A[courseRecordsScreen->unk704];
    if (unk70A == 0) {
        unk70A = 1;
    }

    for (i = 0; i < 3; i++, unk284++) {
        sub_80051E8(unk284);
    }

    for (i = 0; i < 2; i++, unk4C++) {
        sub_80051E8(unk4C);
    }

    j = courseRecordsScreen->unk711 != 2 && a == 0 && courseRecordsScreen->unk709 > 1 ? 4 : 2;
    temp = courseRecordsScreen->unk711 == 2 && unk70A < 2 ? 0 : j;

    for (i = 0; i < temp; i++, unk13C++) {
        sub_8004558(unk13C);
        sub_80051E8(unk13C);
    }

    if (courseRecordsScreen->unk710 == 0) {
        for (i = 0; i < 2; i++, unkAC++) {
            sub_80051E8(unkAC);
        }
    } else {
        sub_80051E8(unkAC);
    }

    sub_80051E8(unk10C);

    for (i = 0; i < 3; i++, unk314++) {
        unk0 = unk314->unk0;
        unk60 = &unk314->unk60;
        unk90 = unk314->unk90;
        unkF0 = unk314->unkF0;

        for (j = 0; j < 2; j++, unk0++) {
            sub_80051E8(unk0);
        }

        sub_80051E8(unk60);

        for (j = 0; j < 2; j++, unk90++) {
            sub_80051E8(unk90);
        }

        for (j = 0; j < 2; j++, unkF0++) {
            sub_80051E8(unkF0);
        }
    }
}

struct UNK_8069978_UNK390_ROW {
    // playerName
    u16 unk0[6];

    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    struct UNK_0808B3FC_UNK240 unk10[6];
    struct UNK_0808B3FC_UNK240 unk130[2];
    struct UNK_0808B3FC_UNK240 unk190[2];
    struct UNK_0808B3FC_UNK240 unk1F0[2];
}; /* size 0x250 */

struct UNK_8069978_UNK390 {
   struct UNK_8069978_UNK390_ROW unk0[10];
}; /* size 0x1720 */

struct UNK_8069978 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;

    struct Unk_03002400 unkC;
    struct Unk_03002400 unk4C;

    struct UNK_0808B3FC_UNK240 unk8C;
    struct UNK_0808B3FC_UNK240 unkBC;
    struct UNK_0808B3FC_UNK240 unkEC[2];
    struct UNK_0808B3FC_UNK240 unk14C[6];
    struct UNK_0808B3FC_UNK240 unk26C[2];
    struct UNK_0808B3FC_UNK240 unk2CC[2];
    struct UNK_0808B3FC_UNK240 unk32C[2];

    struct UNK_8064A40* unk38C;
    struct UNK_8069978_UNK390* unk390;
    u8 unk394;
    u8 unk395;
    u8 unk396;
    u8 unk397;

    // playerName
    u16 unk398[6];

    u8 unk3A4;
    u8 unk3A5;
    u8 unk3A6;

    // language
    u8 unk3A7;
}; /* size 0x3A8 */

void sub_806B760(void);
void sub_8069B40(void);
void sub_8069B88(struct UNK_8069978*);
void sub_8069BF0(struct UNK_8069978*);

void sub_8069978(struct UNK_8064A40* playerDataMenu) {
    struct UNK_8069978_UNK390_ROW* unk390Rows;
    struct UNK_8063730_UNK0* profileData;
    s16 i, j;


    struct Task* t = TaskCreate(sub_806B760, sizeof(struct UNK_8069978), 0x2000, 4, 0);
    struct UNK_8069978* config = TaskGetStructPtr(t, config);
    config->unk390 = EwramMallocStruct(struct UNK_8069978_UNK390);
    config->unk38C = playerDataMenu;

    config->unk394 = 0;
    config->unk3A4 = 0;
    config->unk3A5 = 0;
    config->unk3A6 = 0;
    config->unk3A7 = playerDataMenu->unk162;


    profileData = &playerDataMenu->unk15C->unk0;
    memcpy(config->unk398, profileData->unk0, 12);
    config->unk395 = profileData->unk34C;
    config->unk396 = profileData->unk34D;
    config->unk397 = profileData->unk34E;

    unk390Rows = config->unk390->unk0;
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 6; j++) {
            unk390Rows[i].unk0[j] = profileData->unk284[i].unk4[j];
            if (unk390Rows[i].unk0[j] == PLAYER_NAME_END_CHAR) {
                break;
            }
        }

        for (;j < 6; j++) {
            unk390Rows[i].unk0[j] = PLAYER_NAME_END_CHAR;
        }

        unk390Rows[i].unkC = profileData->unk284[i].unk10;
        unk390Rows[i].unkD = profileData->unk284[i].unk11;
        unk390Rows[i].unkE = profileData->unk284[i].unk12;
        unk390Rows[i].unkF = profileData->unk284[i].unk13;
    }

    gUnknown_03005B50 = (void*)(OBJ_VRAM0);
    gUnknown_03005B54 = NULL;

    sub_8069B40();
    sub_8069B88(config);
    sub_8069BF0(config);
}

void sub_8069B40(void) {
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x701;
    gBgCntRegs[1] = 0x9606;
    gBgCntRegs[2] = 0x1F0F;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

void sub_8069B88(struct UNK_8069978* multiplayerRecordsScreen) {
    multiplayerRecordsScreen->unk0 = 0;
    multiplayerRecordsScreen->unk2 = 2;
    multiplayerRecordsScreen->unk4 = 0;
    multiplayerRecordsScreen->unk6 = 0x100;
    multiplayerRecordsScreen->unkA = 0;
    multiplayerRecordsScreen->unk8 = 0xFF;

    sub_806B854(&multiplayerRecordsScreen->unkC, 0, 7, 0x98, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&multiplayerRecordsScreen->unk4C, 1, 0x16, 0x89, 0x1E, 0x14, 0, 1, 0, 0);
}

struct UNK_080D9E00 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
};

extern const struct UNK_080D9E00 gUnknown_080D9E00[6][2];
extern const struct UNK_080D95E8 gUnknown_080D9E60[10];

// PlayerRecordRow
void sub_8069BF0(struct UNK_8069978* multiplayerRecordsScreen) {
    s16 i, pos, temp;
    struct UNK_806B908 local48;
    s16 unk395, unk396, unk397;

    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unkEC = multiplayerRecordsScreen->unkEC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;

    const struct UNK_080D9E00* E00 = gUnknown_080D9E00[multiplayerRecordsScreen->unk3A7];
    const struct UNK_080D95E8* DF0 = gUnknown_080D9DF0;
    // The data is made into a pointer here but then another pointer is used for
    // the actual reference
    const struct UNK_080D95E8* E60Val, *E60 = gUnknown_080D9E60;

    sub_806A568(unk8C,0,E00->unk4,E00->unk0,0x1000,9,0x12,5,E00->unk2,0);

    E00++;
    sub_806A568(unkBC,0,E00->unk4,E00->unk0,0x1000,0x76,0x26,5,E00->unk2,0);
    
    sub_806A568(unkEC,0,DF0->unk4,DF0->unk0,0x1000,8,0x4E,0xD,DF0->unk2,0);
    unkEC++;
    DF0++;
    sub_806A568(unkEC,0,DF0->unk4,DF0->unk0,0x1000,8,0x88,0xD,DF0->unk2,0);


    for (i = 0, pos = 0x22, temp = 0x3A; i < MAX_PLAYER_NAME_LENGTH; i++, unk14C++, pos+= 0xC) {
        u16 nameChar = multiplayerRecordsScreen->unk398[i];
        if (nameChar == PLAYER_NAME_END_CHAR) {
            nameChar = 0x11;
        }

        local48 = sub_806B908(nameChar);
        sub_806A568(
            unk14C, 
            0, 
            local48.unk0,
            local48.unk4,
            0x1000,
            pos, 
            temp,
            5,
            local48.unk6,
            0
        );
    }

    unk395 = multiplayerRecordsScreen->unk395;
    unk396 = multiplayerRecordsScreen->unk396;
    unk397 = multiplayerRecordsScreen->unk397;

    E60Val = &E60[unk395 / 10];
    sub_806A568(unk26C,0,E60Val->unk4,E60Val->unk0,0x2000,0x7C,0x40,0xD,E60Val->unk2,0);

    unk26C++;
    E60Val = &E60[unk395 % 10];
    sub_806A568(unk26C,0,E60Val->unk4,E60Val->unk0,0x2000,0x84,0x40,0xD,E60Val->unk2,0);

    E60Val = &E60[unk396 / 10];
    sub_806A568(unk2CC,0,E60Val->unk4,E60Val->unk0,0x2000,0xA4,0x40,0xD,E60Val->unk2,0);

    unk2CC++;
    E60Val = &E60[unk396 % 10];
    sub_806A568(unk2CC,0,E60Val->unk4,E60Val->unk0,0x2000,0xAC,0x40,0xD,E60Val->unk2,0);

    E60Val = &E60[unk397 / 10];
    sub_806A568(unk32C,0,E60Val->unk4,E60Val->unk0,0x2000,0xCC,0x40,0xD,E60Val->unk2,0);

    unk32C++;
    E60Val = &E60[unk397 % 10];
    sub_806A568(unk32C,0,E60Val->unk4,E60Val->unk0,0x2000,0xD4,0x40,0xD,E60Val->unk2,0);
}

// OtherRecordsRow
void sub_8069EC4(s16 i) { 
    s16 j, pos;
    s16 unkE, unkF, unkD;
    struct UNK_0808B3FC_UNK240* unk130, *unk190, *unk1F0;

    struct UNK_806B908 local48;

    struct UNK_8069978_UNK390_ROW* row = &((struct UNK_8069978*)(IWRAM_START + gCurTask->structOffset))->unk390->unk0[i];
    const struct UNK_080D95E8 *E60Val, *E60 = gUnknown_080D9E60;

    if (row->unkC) {
        s16 temp1 = i * 18 + 90;
        struct UNK_0808B3FC_UNK240* unk10 = row->unk10;
        
        for (j = 0, pos = 0x22; j < MAX_PLAYER_NAME_LENGTH; j++, unk10++, pos+= 0xC) {
            u16 nameChar = row->unk0[j];
            if (nameChar == PLAYER_NAME_END_CHAR) {
                nameChar = 0x11;
            }

            local48 = sub_806B908(nameChar);
            sub_806A568(
                unk10, 
                0, 
                local48.unk0,
                local48.unk4,
                0x2000,
                pos, 
                temp1,
                5,
                local48.unk6,
                0
            );
        }

        unkD = row->unkD;
        unkE = row->unkE;
        unkF = row->unkF;
        temp1 += 6; 

        E60Val = &E60[unkD / 10];
        sub_806A568(&row->unk130[0],0,E60Val->unk4,E60Val->unk0,0x2000,0x7C,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkD % 10];
        sub_806A568(&row->unk130[1],0,E60Val->unk4,E60Val->unk0,0x2000,0x84,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkE / 10];
        sub_806A568(&row->unk190[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xA4,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkE % 10];
        sub_806A568(&row->unk190[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xAC,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkF / 10];
        sub_806A568(&row->unk1F0[0],0,E60Val->unk4,E60Val->unk0,0x2000,0xCC,temp1,0xD,E60Val->unk2,0);

        E60Val = &E60[unkF % 10];
        sub_806A568(&row->unk1F0[1],0,E60Val->unk4,E60Val->unk0,0x2000,0xD4,temp1,0xD,E60Val->unk2,0);
    }
}

void sub_806A1D0(void);
void sub_806A348(void);
void sub_806B7D0(void);

void sub_806A0F4(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_8069978_UNK390_ROW* rows = multiplayerRecordsScreen->unk390->unk0;

    sub_806A348();
    if (gRepeatedKeys & (DPAD_DOWN | DPAD_UP)) {
        if (gRepeatedKeys & DPAD_UP) {
            if (multiplayerRecordsScreen->unk3A6) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->unk3A5 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A4 = --multiplayerRecordsScreen->unk3A6;

                gCurTask->main = sub_806A1D0;
                return;
            }
        } else if (gRepeatedKeys & DPAD_DOWN) {
            if (multiplayerRecordsScreen->unk3A6 >= 6) {
                return;
            }
            
            rows = &rows[multiplayerRecordsScreen->unk3A6 + 4];
            if (rows->unkC) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                multiplayerRecordsScreen->unk3A4 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A5 = multiplayerRecordsScreen->unk3A6;
                multiplayerRecordsScreen->unk3A6++;

                gCurTask->main = sub_806A1D0;
                return;
            }
        }
    }

    if (gRepeatedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        sub_806B7D0();
    }
}

void sub_806A1D0(void) {
    struct UNK_8069978_UNK390_ROW* row;
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    s16 pos, temp;
    s16 numRows = 5;
    s16 i, j;
    multiplayerRecordsScreen->unk394++;

    if (multiplayerRecordsScreen->unk3A6 < multiplayerRecordsScreen->unk3A5) {
        temp = multiplayerRecordsScreen->unk394 * 2 + 72;
    } else {
        temp = 90 - (multiplayerRecordsScreen->unk394 * 2);
    }
    pos = temp;

    if (multiplayerRecordsScreen->unk394 > 8) {
        pos = 0x5A;
        multiplayerRecordsScreen->unk3A4 = multiplayerRecordsScreen->unk3A6;
    }

    if (multiplayerRecordsScreen->unk3A4 == 6) { 
        numRows--;
    }

    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A4];

    for (i = 0; i < numRows; i++, pos += 18, row++) {
        struct UNK_0808B3FC_UNK240* unk10, *unk130, *unk190, *unk1F0;
        
        unk10 = row->unk10;
        for (j = 0; j < 6; j++, unk10++) {
            unk10->unk18 = pos;
        }

        unk130 = row->unk130;
        for (j = 0; j < 2; j++, unk130++) {
            unk130->unk18 = pos + 6;
        }

        unk190 = row->unk190;
        for (j = 0; j < 2; j++, unk190++) {
            unk190->unk18 = pos + 6;
        }

        unk1F0 = row->unk1F0;
        for (j = 0; j < 2; j++, unk1F0++) {
            unk1F0->unk18 = pos + 6;
        }
    }

    sub_806A348();

    if (multiplayerRecordsScreen->unk394 > 8) {
        multiplayerRecordsScreen->unk394 = 0;
        gCurTask->main = sub_806A0F4;
    }
}

void sub_806A348(void) {
    struct UNK_8069978* multiplayerRecordsScreen = TaskGetStructPtr(gCurTask, multiplayerRecordsScreen);
    struct UNK_0808B3FC_UNK240* unk8C = &multiplayerRecordsScreen->unk8C;
    struct UNK_0808B3FC_UNK240* unkBC = &multiplayerRecordsScreen->unkBC;
    struct UNK_0808B3FC_UNK240* unk14C = multiplayerRecordsScreen->unk14C;
    struct UNK_0808B3FC_UNK240* unk26C = multiplayerRecordsScreen->unk26C;
    struct UNK_0808B3FC_UNK240* unk2CC = multiplayerRecordsScreen->unk2CC;
    struct UNK_0808B3FC_UNK240* unk32C = multiplayerRecordsScreen->unk32C;
    struct UNK_8069978_UNK390* unk390 = multiplayerRecordsScreen->unk390;
    
    struct UNK_8069978_UNK390_ROW* row;
    struct UNK_0808B3FC_UNK240* unkEC;

    s16 i, j;
    s16 numRows = 5;
   

    sub_80051E8(unk8C);
    sub_80051E8(unkBC);

    unkEC = multiplayerRecordsScreen->unkEC;
    sub_8004558(unkEC);
    unkEC++;
    sub_8004558(unkEC);
    unkEC--;

    if (multiplayerRecordsScreen->unk3A6 != 0) {
        sub_80051E8(unkEC);
    }
    unkEC++;
    
    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A6 + 4];
    if (multiplayerRecordsScreen->unk3A6 < 6 && row->unkC) {
        sub_80051E8(unkEC);
    }

    for (i = 0; i < 6; i++, unk14C++) {
        sub_80051E8(unk14C);
    }

    for (i = 0; i < 2; i++, unk26C++) {
        sub_80051E8(unk26C);
    }

    for (i = 0; i < 2; i++, unk2CC++) {
        sub_80051E8(unk2CC);
    }

    for (i = 0; i < 2; i++, unk32C++) {
        sub_80051E8(unk32C);
    }

    if (multiplayerRecordsScreen->unk3A4 == 6) {
        numRows--;
    }

    row = &multiplayerRecordsScreen->unk390->unk0[multiplayerRecordsScreen->unk3A4];

    for (i = 0; i < numRows; i++, row++) {
        if (!row->unkC) {
            continue;
        }

        for (unk14C = row->unk10, j = 0; j < 6; j++, unk14C++) {
            sub_80051E8(unk14C);
        }

        unk26C = row->unk130;
        unk2CC = row->unk190;
        unk32C = row->unk1F0;
        sub_80051E8(unk26C);
        ++unk26C;
        sub_80051E8(unk26C);
        sub_80051E8(unk2CC);
        ++unk2CC;
        sub_80051E8(unk2CC);
        sub_80051E8(unk32C);
        ++unk32C;
        sub_80051E8(unk32C);
    }
}

void sub_806A568(struct UNK_0808B3FC_UNK240* obj, s8 a, u32 b, u16 c, u32 d, s16 e, s16 f, u16 g, u8 h, u8 i) {
    void* temp,*temp2;
    struct UNK_0808B3FC_UNK240 newObj;
    struct UNK_0808B3FC_UNK240* ref;
    ref = &newObj;
   
    if (obj != NULL) {
        ref = obj;
    }

    if (a != 0) {    
        if (gUnknown_03005B54 == NULL) {
            gUnknown_03005B54 = gUnknown_03005B50;
        }
        ref->unk4 = gUnknown_03005B54;
    } else {
        ref->unk4 = gUnknown_03005B50;
    }
    
    ref->unk8 = 0;
    ref->unkA = c;
    ref->unk10 = d;
    ref->unk16 = e;
    ref->unk18 = f;
    ref->unk1A = g << 6;
    ref->unk1C = 0;
    ref->unk1E = 0xffff;
    ref->unk20 = h;
    ref->unk21 = 0xff;
    ref->unk22 = 0x10;
    ref->unk25 = i;
    ref->unk28 = -1;

    sub_8004558(ref);

    switch(a) {
        case 0:
            gUnknown_03005B50 = gUnknown_03005B50 + b * 0x20;
            gUnknown_03005B54 = NULL;
            break;
        case 1:
            gUnknown_03005B54 = gUnknown_03005B54 + b * 0x20;
            break;
    }
}

extern const u16 gUnknown_080D95D2[2];
extern const u16 gUnknown_080D95D6[8];
extern const u16 gUnknown_080D95C4[2];
extern const u16 gUnknown_080D95C8[5];

#ifndef NON_MATCHING
ASM_FUNC("asm/non_matching/sub_806A664.inc", u16 sub_806A664(s16 a, u16 b));
#else
// https://decomp.me/scratch/dyZVp
// something weird in this one which I don't understand
// may get it later
u16 sub_806A664(s16 a, u16 b) {
    u16 unk5D2[2];
    u16 unk5D6[8];
    u16 unk5C4[2];
    u16 unk5C8[5];
    u16* temp;
    u32 temp2;
    s16 i;

    memcpy(unk5D2, gUnknown_080D95D2, 4);
    memcpy(unk5D6, gUnknown_080D95D2, 16);
    memcpy(unk5C4, gUnknown_080D95C4, 4);
    memcpy(unk5C8, gUnknown_080D95C8, 10);

    temp = unk5C4;
    if (a == 1) {
        temp = unk5C8;
        if (b == 2) {
            temp2 = 1; 
        }
    } else {
        while (*temp != 0xFFFF) {
            if (*temp <= b && b <= *temp + 4) {
                temp2 = 1;
                break;
            }
            temp++;
        }
        temp2 = 0;
    }

    if (temp2) {
        if (a == 1) {
            if (b == 2) {
                b = 0x10B;
            } else {
                for (i = 0; i < 4; i++) {
                    if (unk5D6[i * 2] <= b) {
                        unk5D2[0] = unk5D6[i * 2];
                        if (b <= unk5D2[0] + 4) {
                            unk5D2[1] = unk5D6[i * 2 + 1];
                            b = (b + unk5D2[1] - unk5D2[0]);
                            break;
                        }
                    }
                }
            }
        } else if (unk5D2[0] <= b && b <= unk5D2[0] + 4) {
            b = (b + unk5D2[1] - unk5D2[0]);
        }
    }

    return b;
}
#endif

// OptionScreenTaskDestroyHandler
void sub_806A758(struct Task* optionsScreenTask) {
    // unimplemented
}

void sub_806A7E0(void);
static void sub_806A794(struct UNK_8063730*);

void sub_806A75C(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);

    sub_8063D20(optionsScreen, 0);
    sub_806A794(optionsScreen);
    sub_8063DCC(optionsScreen, 0);
    gCurTask->main = sub_806A7E0;
}

static void sub_806A794(struct UNK_8063730* optionsScreen) {
    sub_806B854(&optionsScreen->unk364, 0, 7, 0x85, 0x1E, 0x14, 0, 0, 0, 0);
    sub_806B854(&optionsScreen->unk3A4, 1, 0xE, 0x86, 0x1E, 0x14, 0, 1, 0, 0);
}

void sub_806A7E0(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = sub_80641B0;
    }
}

void sub_806ADF4(struct UNK_8063730*);
void sub_806AEB0(struct UNK_8063730*);

void sub_806A814(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    switch (optionsScreen->unk780) {
        case 0:
            sub_8064A40(optionsScreen);
            break;
        case 1:
            sub_806ADF4(optionsScreen);
            break;
        case 2:
            sub_806AEB0(optionsScreen);
            break;
        case 3:
            break;
        case 4:
            sub_8065B04(optionsScreen);
            break;
        case 5:
        case 6:
        case 7:
            break;
        
    }
    optionsScreen->unk783 = 0;
    gCurTask->main = sub_80644C4;
}

void sub_806A8A8(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    if (optionsScreen->unk784 < 2) {
        sub_80649A4();
    }

    if (optionsScreen->unk784 == 0) {
        optionsScreen->unk783 = 0;
        gCurTask->main = sub_80645E0;
    }
}

void sub_806A91C(void);

/** Menu 1 **/

void sub_806A8EC(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806A91C;
}

void sub_806B02C(struct UNK_8063730*);
void sub_806A91C(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        sub_806B02C(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_80646FC;
    }
}

void sub_806A968(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = sub_80641B0;
    }   
}

void sub_806A9CC(void);

/** Menu 2 **/

void sub_806A99C(void) {
    struct Task* task = gCurTask;

    struct UNK_8063730* optionsScreen = TaskGetStructPtr(task, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806A9CC;
}

void sub_808A258(struct UNK_8063730*);

void sub_806A9CC(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        sub_808A258(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_80647C8;
    }
}

void sub_806AA18(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = sub_80641B0;
    }
}


void sub_806AA7C(void);
/** Menu 3 **/

void sub_806AA4C(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806AA7C;
}

void sub_806AA7C(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        sub_8066CFC(optionsScreen);
        optionsScreen->unk784 = 1;
        gCurTask->main = sub_806489C;
    }
}

void sub_806AAC8(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk774 = &optionsScreen->unk774;
    sub_80649A4();

    if (sub_802D4CC(unk774)) {
        gCurTask->main = sub_80641B0;
    }
}

void sub_806AB2C(void);

/** Player Data Menu 1 **/

void sub_806AAFC(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_806AB2C;
}

void sub_806AB2C(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        sub_80672BC(playerDataMenu);
        playerDataMenu->unk163 = 1;
        playerDataMenu->unk15C->unk784 = 2;
        gCurTask->main = sub_8064F1C;
    }
}

void sub_806AB90(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

/** Player Data Menu 2 **/

void sub_806ABC4(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    gCurTask->main = sub_8065004;
}

void sub_806ABF4(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

void sub_806AC58(void);

/** Player Data Menu 3 **/

void sub_806AC28(void) {
    struct Task* task = gCurTask;

    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(task, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk270 = &playerDataMenu->unk150;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806AC58;
}

void sub_806AC58(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        sub_8069978(playerDataMenu);
        playerDataMenu->unk163 = 1;
        playerDataMenu->unk15C->unk784 = 2;
        gCurTask->main = sub_8065174;
    }
}

void sub_806ACBC(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);
    struct UNK_802D4CC_UNK270* unk150 = &playerDataMenu->unk150;
    sub_806AD98();

    if (sub_802D4CC(unk150)) {
        gCurTask->main = sub_8064C44;
    }
}

void sub_806AD20(void);

/** Menu 4 **/

void sub_806ACF0(void) {
    struct Task* task = gCurTask;

    struct UNK_8063730* optionsScreen = TaskGetStructPtr(task, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    unk270->unk0 = 0;
    unk270->unk2 = 1;
    unk270->unk4 = 0;
    unk270->unk6 = 0x100;
    unk270->unkA = 0;
    unk270->unk8 = 0xFF;

    task->main = sub_806AD20;
}

void sub_8072484(void);

void sub_806AD20(void) {
    struct UNK_8063730* optionsScreen = TaskGetStructPtr(gCurTask, optionsScreen);
    struct UNK_802D4CC_UNK270* unk270 = &optionsScreen->unk774;
    if (!sub_802D4CC(unk270)) {
        sub_80649A4();
    } else {
        sub_8063C7C(optionsScreen);
        WriteSaveGame();
        TasksDestroyInPriorityRange(0, 0xFFFF);
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        CreateTitleScreenAtSinglePlayerMenu();
    }
}

void sub_806AD98(void) {
    struct UNK_8064A40* playerDataMenu = TaskGetStructPtr(gCurTask, playerDataMenu);

    struct UNK_0808B3FC_UNK240* unk0 = playerDataMenu->unk0;
    struct UNK_0808B3FC_UNK240* unk60 = playerDataMenu->unk60;
    struct UNK_0808B3FC_UNK240* unk120 = &playerDataMenu->unk120;

    s16 i;

    for (i = 0; i < 2; i++, unk0++) {
        sub_80051E8(unk0);
    }

    for (i = 0; i < 4; i++, unk60++) {
        sub_80051E8(unk60);
    }

    sub_80051E8(unk120);
}

void sub_806ADF4(struct UNK_8063730* optionsScreen) {
    struct Task* t = TaskCreate(sub_80653E4, 0xF8, 0x2000, 4, 0);
    struct UNK_0806ADF4* state = TaskGetStructPtr(t, state);
    
    state->unk0 = optionsScreen;
    state->unkF4 = optionsScreen->unk359;
    state->unkF6 = optionsScreen->unk35B;
    state->unkF5 = 0;

    sub_806525C(state);
}

void sub_806AE54(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    s16 i;

    for (i = 0; i < 2; i++, unk4++) {
        sub_80051E8(unk4);
    }

    for (i = 0; i < 2; i++, unk64++) {
        sub_80051E8(unk64);
    }

    sub_80051E8(unkC4);
}

void sub_806AEB0(struct UNK_8063730* optionsScreen) {
    struct Task* t = TaskCreate(sub_8065838, 0xF8, 0x2000, 4, 0);
    struct UNK_0806ADF4* state = TaskGetStructPtr(t, state);

    state->unk0 = optionsScreen;
    state->unkF4 = optionsScreen->unk35A;
    state->unkF6 = optionsScreen->unk35B;
    state->unkF5 = 0;
    sub_80656B0(state);
}

void sub_806AF10(void) {
    struct UNK_0806ADF4* state = TaskGetStructPtr(gCurTask, state);
    struct UNK_0808B3FC_UNK240* unk4 = state->unk4;
    struct UNK_0808B3FC_UNK240* unk64 = state->unk64;
    struct UNK_0808B3FC_UNK240* unkC4 = &state->unkC4;

    s16 i;

    for (i = 0; i < 2; i++, unk4++) {
        sub_80051E8(unk4);
    }

    for (i = 0; i < 2; i++, unk64++) {
        sub_80051E8(unk64);
    }

    sub_80051E8(unkC4);
}

void sub_806AF6C(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x2A;
    unk1B4->unk18 = 0x35;
    unk1B4++;
    unk1B4->unk18 = 0x35;

    sub_8066818();
    gCurTask->main = sub_8066004;
}

void sub_806AFAC(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x42;
    unk1B4->unk18 = 0x4D;
    unk1B4++;
    unk1B4->unk18 = 0x4D;

    sub_8066818();
    gCurTask->main = sub_8066220;
}

void sub_806AFEC(void) {
    struct UNK_8065B04* state = TaskGetStructPtr(gCurTask, state);
    
    struct UNK_0808B3FC_UNK240* unk1B4 = state->unk1B4;
    struct UNK_0808B3FC_UNK240* unk214 = &state->unk214;
    
    unk214->unk18 = 0x5A;
    unk1B4->unk18 = 0xB4;
    unk1B4++;
    unk1B4->unk18 = 0xB4;

    sub_8066818();
    gCurTask->main = sub_8066478;
}

void sub_806B02C(struct UNK_8063730* optionScreen) {
    struct Task* t = TaskCreate(sub_806B0D8, 0x204, 0x2000, 4, 0);
    struct UNK_8063940* state = TaskGetStructPtr(t, state);

    state->unk1FC = optionScreen;
    state->unk200 = optionScreen->unk35B;
    state->unk201 = 0;
    gUnknown_03005B50 = (void*)(OBJ_VRAM0);
    gUnknown_03005B54 = 0;

    sub_80668A8(state);
    sub_806B0AC(state);
    sub_8066930(state);
}

void sub_806B0AC(struct UNK_8063940* languageSelectionScreen) {
    sub_806B854(&languageSelectionScreen->unk1B0,0,7,0x86,0x1E,0x14,0,0,0,0);
}
