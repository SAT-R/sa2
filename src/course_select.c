#include "course_select.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "save.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "task.h"
#include "malloc_vram.h"

struct CourseSelectionScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 unkC;
    struct Unk_03002400 unk4C;
    struct UNK_0808B3FC_UNK240 unk8C;
    struct UNK_0808B3FC_UNK240 unkBC[8];
    struct UNK_0808B3FC_UNK240 unk23C[2];
    struct UNK_0808B3FC_UNK240 unk29C;
    struct UNK_0808B3FC_UNK240 unk2CC;
    struct UNK_0808B3FC_UNK240 unk2FC;
    struct UNK_0808B3FC_UNK240 unk32C[8];
    u32 unk4AC;
    s32 unk4B0;
    s32 unk4B4;
    u8 filler4B8[2];
    u8 unk4BA;
    u8 unk4BB;
    u8 unk4BC;
    u8 unk4BD;
    u8 unk4BE;
    u8 unk4BF;
    u8 unk4C0;
    u8 filler4C1[3];
};

extern const s16 gUnknown_080D7358[16][2];
extern const u8 gUnknown_080D7478[16];

// TODO: These sizes are wrong
extern const u16 gUnknown_080D72B8[37][3];
extern const u16 gUnknown_080D72E8[5][3];

extern const u16 gUnknown_080D7458[8][2];

void sub_8034D70(void);
void sub_8034E78(void);
void sub_8036040(struct Task* t);

void CreateCourseSelectionScreen(u8 unknown1, u8 availableCourses, u8 unknown2) {
    struct Task* t;
    struct UNK_802D4CC_UNK270* fadeTransition;
    struct Unk_03002400* background;
    struct UNK_0808B3FC_UNK240* element = NULL;
    struct CourseSelectionScreen* coursesScreen;

    u8 i;
    
    u8 temp1;
    u8 temp2;
    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;

    if (unknown2 == 2) {
        gLoadedSaveGame->unk1A = 2;
        WriteSaveGame();
    }

    if (IsMultiplayer() && availableCourses > 0x1A) {
        availableCourses = 0x1A;
    }

    if (availableCourses != 0x1C) {
        if (availableCourses < 0x1D) {
            availableCourses++;
        } else {
            if (gLoadedSaveGame->unk1A != 0 && gSelectedCharacter == 0) {
                availableCourses = 0x1D;
            } else {
                availableCourses = 0x1C;
            }
        }
    }
        
    if (availableCourses == 0x1C) {
        m4aSongNumStart(MUS_COURSE_SELECTION_2);
    } else {
        if (availableCourses == 0x1D) {
            m4aSongNumStart(MUS_COURSE_SELECTION_3);
        } else {
            m4aSongNumStart(MUS_TA_COURSE_SELECTION);
        }
    }

    if (!IsMultiplayer() && (Mod(availableCourses, 4) & 2)) {
        availableCourses &= 0xFC;
    }

    gDispCnt = 0x1340;

    gBgCntRegs[1] = 0x1C0E;
    gBgCntRegs[0] = 0x5003;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    if (unknown2 & 3 && !IsMultiplayer()) {
        t = TaskCreate(sub_8034E78, sizeof(struct CourseSelectionScreen), 0x3100, 0, sub_8036040);
    } else {
        t = TaskCreate(sub_8034D70, sizeof(struct CourseSelectionScreen), 0x3100, 0, sub_8036040);
    }

    coursesScreen = TaskGetStructPtr(t);
    coursesScreen->unk4AC = 0;

    temp1 = ((unknown1 >> 2) << 1) | (unknown1 & 1);
    coursesScreen->unk4B0 = gUnknown_080D7358[temp1][0] << 8;
    coursesScreen->unk4B4 = gUnknown_080D7358[temp1][1] << 8;
    coursesScreen->unk4BB = temp1;
    coursesScreen->unk4BE = 0;
    coursesScreen->unk4C0 = 0;

    temp2 = (((availableCourses >> 2) << 0x19) >> 0x18) | (availableCourses & 1);

    if (unknown2 & 3) {
        coursesScreen->unk4BF = temp2;
    }

    coursesScreen->unk4BA = gUnknown_080D7478[temp2];
    if (unknown2 & 3 && coursesScreen->unk4BA != 0) {
        coursesScreen->unk4BA--;
    }

    coursesScreen->unk4BD = unknown2;
    coursesScreen->unk4BC = temp2;

    fadeTransition = &coursesScreen->unk0;
    fadeTransition->unk0 = 0;
    fadeTransition->unk4 = 0;
    fadeTransition->unk2 = 2;
    fadeTransition->unk6 = 0x180;
    fadeTransition->unk8 = 0xFF;
    fadeTransition->unkA = 0;
    sub_802D4CC(fadeTransition);

    background = &coursesScreen->unk4C;
    background->unk4 = BG_SCREEN_ADDR(24);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;

    if (!IsMultiplayer()) {
        background->unk1C = gSelectedCharacter + 100;
    } else {
        background->unk1C = gUnknown_03005500[0] + 100;   
    }
    
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    background = &coursesScreen->unkC;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(16);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x69;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x3C;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    element =&coursesScreen->unk8C;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x2F7;
    if (!IsMultiplayer()) {
        element->unk20 = gSelectedCharacter;
    } else {
        element->unk20 = gUnknown_03005500[0];
    }
    element->unk1A = 0xC0;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < 8; i++) {
        element =&coursesScreen->unkBC[i];
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk4 = VramMalloc(gUnknown_080D72B8[i][0]);
        if ((unknown2 & 3) && coursesScreen->unk4BA == i) {
            element->unkA = gUnknown_080D72E8[i][1];
            element->unk20 = gUnknown_080D72E8[i][2];
        } else {
            element->unkA =  gUnknown_080D72B8[i][1];
            element->unk20 = gUnknown_080D72B8[i][2];
        }
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
    }

    for (i = 0; i < 2; i++) {
        element =&coursesScreen->unk23C[i];
        element->unk16 = i * 0x20 + 0xB8;
        element->unk18 = 0;
        element->unk4 = VramMalloc(4);
        element->unkA = 0x2F6;
        element->unk20 = 0;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &coursesScreen->unk29C;
    element->unk16 = 0x80;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x1A);
    element->unkA = 0x2F5;
    element->unk20 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &coursesScreen->unk2CC;
    element->unk16 = 0xF0;
    element->unk18 = 0x18;
    element->unk4 = VramMalloc(0x26);
    element->unkA = 0x2F9;
    element->unk20 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &coursesScreen->unk2FC;
    element->unk16 = 0;
    element->unk18 = 0;
    if (gLoadedSaveGame->unk6 == LANG_JAPANESE) {
        element->unk4 = VramMalloc(0x18);
        element->unkA = 0x2FB;
        if (!IsMultiplayer()) {
#ifndef NONMATCHING
            s8 var = gSelectedCharacter;
            if (var) var = gSelectedCharacter;
            var = gSelectedCharacter;
#endif
            element->unk20 = gSelectedCharacter;
        } else {
            element->unk20 = gUnknown_03005500[0];
        }
    } else {
        element->unk4 = VramMalloc(0x1C);
        element->unkA = 0x2FC;
        if (!IsMultiplayer()) {
            element->unk20 = gSelectedCharacter;
        } else {
            element->unk20 = gUnknown_03005500[0];
        }
    }
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < 8; i++) {
        element = &coursesScreen->unk32C[i];
        element->unk16 = 0;
        element->unk18 = 0x88;
        element->unk4 = (void*)OBJ_VRAM0 + (i * 0x120);
        element->unkA = gUnknown_080D7458[i][0];
        element->unk20 = gUnknown_080D7458[i][1];
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
    }
}
