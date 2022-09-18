#include "course_select.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "save.h"
#include "m4a.h"
#include "character_select.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "task.h"
#include "malloc_vram.h"
#include "multiplayer_multipak_connection.h"
#include "trig.h"

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
    s32 unk4AC;
    s32 unk4B0;
    s32 unk4B4;
    u8 filler4B8[2];
    u8 unk4BA;
    u8 currentCourse;
    u8 maxCourse;
    u8 unk4BD;
    u8 unk4BE;
    u8 unk4BF;
    u8 unk4C0;
};

void sub_8034D70(void);
void sub_8034E78(void);
void sub_8036040(struct Task* t);
void sub_8035FCC(struct CourseSelectionScreen* coursesScreen);
void sub_8035124(void);
void sub_80359D4(void);
void sub_8034F64(void);
void sub_8034FF0(void);
bool8 sub_8035B44(struct CourseSelectionScreen*);
void sub_80359D4(void);
void sub_8035E70(void);
void sub_8035554(void);
void sub_8035750(void);
void sub_8035EF0(void);
void sub_8035F60(void);
void sub_803594C(void);
void sub_8035AF0(void);
void sub_8035C00(struct CourseSelectionScreen* coursesScreen);

extern const u16 gUnknown_080D72B8[8][3];
extern const u16 gUnknown_080D72E8[18][3];

extern const s16 gUnknown_080D7358[16][2];
extern const u16 gUnknown_080D7398[0x20][2];
extern const u16 gUnknown_080D7418[0x10][2];
extern const u16 gUnknown_080D7458[8][2];

extern const u8 gUnknown_080D7478[16];

extern const s16 gUnknown_080D7488[0x10];
extern const u16 gUnknown_080D74A8[8][2];

extern const u16 gUnknown_080D74C8[0x10];
extern const u16 gUnknown_080D74E8[0x10];

extern const u8 gUnknown_080D7508[16];

void CreateCourseSelectionScreen(u8 currentLevel, u8 maxLevel, u8 cutScene) {
    struct Task* t;
    struct UNK_802D4CC_UNK270* fadeTransition;
    struct Unk_03002400* background;
    struct UNK_0808B3FC_UNK240* element = NULL;
    struct CourseSelectionScreen* coursesScreen;

    u8 i;
    
    u8 courseIndex, maxCourseIndex;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;

    if (cutScene == COURSE_SELECT_CUT_SCENE_UNLOCK_TRUE_AREA_53) {
        gLoadedSaveGame->unk1A = 2;
        WriteSaveGame();
    }

    if (IsMultiplayer() && maxLevel > TO_LEVEL_INDEX(ZONE_7, ACT_BOSS)) {
        maxLevel = TO_LEVEL_INDEX(ZONE_7, ACT_BOSS);
    }

    if (maxLevel != TO_LEVEL_INDEX(ZONE_FINAL, ACT_1)) {
        if (maxLevel < TO_LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
            maxLevel++;
        } else {
            if (gLoadedSaveGame->unk1A != 0 && gSelectedCharacter == CHARACTER_SONIC) {
                maxLevel = TO_LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE);
            } else {
                maxLevel = TO_LEVEL_INDEX(ZONE_FINAL, ACT_1);
            }
        }
    }
        
    if (maxLevel == TO_LEVEL_INDEX(ZONE_FINAL, ACT_1)) {
        m4aSongNumStart(MUS_COURSE_SELECTION_2);
    } else {
        if (maxLevel == TO_LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
            m4aSongNumStart(MUS_COURSE_SELECTION_3);
        } else {
            m4aSongNumStart(MUS_TA_COURSE_SELECTION);
        }
    }

    if (!IsMultiplayer() && (Mod(maxLevel, ACTS_PER_ZONE + 1) & 2)) {
        maxLevel &= ~0x3;
    }

    gDispCnt = 0x1340;

    gBgCntRegs[1] = 0x1C0E;
    gBgCntRegs[0] = 0x5003;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    if (cutScene & 3 && !IsMultiplayer()) {
        t = TaskCreate(sub_8034E78, sizeof(struct CourseSelectionScreen), 0x3100, 0, sub_8036040);
    } else {
        t = TaskCreate(sub_8034D70, sizeof(struct CourseSelectionScreen), 0x3100, 0, sub_8036040);
    }

    coursesScreen = TaskGetStructPtr(t);
    coursesScreen->unk4AC = 0;

    courseIndex = LEVEL_TO_COURSE_INDEX(currentLevel);
    coursesScreen->unk4B0 = gUnknown_080D7358[courseIndex][0] << 8;
    coursesScreen->unk4B4 = gUnknown_080D7358[courseIndex][1] << 8;
    coursesScreen->currentCourse = courseIndex;
    coursesScreen->unk4BE = 0;
    coursesScreen->unk4C0 = 0;

    maxCourseIndex = LEVEL_TO_COURSE_INDEX(maxLevel);

    if (cutScene & 3) {
        coursesScreen->unk4BF = maxCourseIndex;
    }

    coursesScreen->unk4BA = gUnknown_080D7478[maxCourseIndex];
    if (cutScene & 3 && coursesScreen->unk4BA != 0) {
        coursesScreen->unk4BA--;
    }

    coursesScreen->unk4BD = cutScene;
    coursesScreen->maxCourse = maxCourseIndex;

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
        if ((cutScene & 3) && coursesScreen->unk4BA == i) {
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

void sub_8034D70(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    coursesScreen->unk4AC += 0x300;
    
    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    if (sub_802D4CC(&coursesScreen->unk0) == 1) {
        if (coursesScreen->unk4AC == 0xF000 || coursesScreen->unk4AC >= coursesScreen->unk4B0 - 0x7800) {
            coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;

            if ((coursesScreen->unk4BD & 4) && !IsMultiplayer()) {
                coursesScreen->currentCourse++;
                gCurTask->main = sub_80359D4;
            } else {
                gCurTask->main = sub_8035124;
            }
        }

        
    }

    if (coursesScreen->unk4AC >= coursesScreen->unk4B0 - 0x7800) {
        coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;
        if (coursesScreen->unk4AC < 0) {
            coursesScreen->unk4AC = 0;
        }
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
    return;
}



void sub_8034E78(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;

    element->unk16 -= 0x10;

    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    if (sub_802D4CC(&coursesScreen->unk0) == 1) {
        if (coursesScreen->unk4AC == 0xF000 || coursesScreen->unk4AC >= ((gUnknown_080D7488[coursesScreen->unk4BF] * 0x100) - 0x7800)) {
            coursesScreen->unk4AC = (gUnknown_080D7488[coursesScreen->unk4BF] * 0x100) - 0x7800;
            m4aSongNumStart(SE_MAP_214);
            gCurTask->main = sub_8034F64;
        }
    }
    coursesScreen->unk4AC = (gUnknown_080D7488[coursesScreen->unk4BF] * 0x100) - 0x7800;

    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8034F64(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;
    coursesScreen->unk4BE++;

    element->unk16 -= 0x10;

    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;

    if (sub_8035B44(coursesScreen)) {
        gCurTask->main = sub_8034FF0;
        element->unk16 = 0xF0;
        coursesScreen->unk4BA++;
        coursesScreen->maxCourse++;
    }
}

void sub_8034FF0(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    coursesScreen->unk4AC -= 0x300;
    
    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    if (coursesScreen->unk4AC == 0 || coursesScreen->unk4AC <= coursesScreen->unk4B0 - 0x7800) {
        coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;

        if (coursesScreen->unk4BD & 1) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                coursesScreen->currentCourse++;
            }
            coursesScreen->unk4BE = 0;
            m4aSongNumStart(SE_MAP_MOVE);
            gCurTask->main = sub_80359D4;
        } else {
            if (coursesScreen->maxCourse == 0x10) {
                struct UNK_0808B3FC_UNK240* element;
                
                coursesScreen->maxCourse = 0xF;
                element = &coursesScreen->unkBC[7];
                element->unkA = gUnknown_080D72B8[7][1];
                element->unk20 = gUnknown_080D72B8[7][2];
            }
            gCurTask->main = sub_8035124;            
        }

        if (coursesScreen->unk4AC <= coursesScreen->unk4B0 - 0x7800) {
            coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;
            if (coursesScreen->unk4AC < 0) {
                coursesScreen->unk4AC = 0;
            }
        }
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035124(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;
    struct UNK_802D4CC_UNK270* fadeTransition = &coursesScreen->unk0;
    union MultiSioData* recv, *send;
    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        recv = &gMultiSioRecv[0];
        if(!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && recv->pat1.unk0 > 0x404F) {
            coursesScreen->currentCourse = recv->pat1.unk2;
            coursesScreen->unk4B0 = recv->pat1.unk4 << 8;
            coursesScreen->unk4B4 = recv->pat1.unk3 << 8;
        }
    }

    element->unk16 -= 0x10;
    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    if (!IsMultiplayer() || gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (coursesScreen->unk4C0 && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = sub_8035E70;
        } else if (gInput & (DPAD_LEFT) && !coursesScreen->unk4C0) {
            if (coursesScreen->currentCourse > 0) {
                if (!(coursesScreen->currentCourse & 1) || coursesScreen->currentCourse > 0xD) {
                    element->unk16 = 0xF0;
                }
                coursesScreen->unk4BE = 0;
                coursesScreen->currentCourse--;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = sub_8035554;
            }
        } else if (gInput & DPAD_RIGHT && !coursesScreen->unk4C0) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                if (coursesScreen->currentCourse & 1 || coursesScreen->currentCourse > 0xD) {
                    element->unk16 = 0xF0;
                }
                coursesScreen->unk4BE = 0;
                coursesScreen->currentCourse++;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = sub_8035750;
            }
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON) && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = sub_8035E70;
        } else if ((gPressedKeys & B_BUTTON) && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = sub_8035F60;
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON) && gGameMode < 4) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = sub_8035EF0;
        }
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;

        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = coursesScreen->unk4B0 >> 8;
        send->pat1.unk3 = coursesScreen->unk4B4 >> 8;

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT && 
                (gPressedKeys & A_BUTTON || coursesScreen->unk4C0) && 
                !(gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT))) {
            coursesScreen->unk4C0 = 1;
            send->pat1.unk0 = 0x4051;
        }
        recv = &gMultiSioRecv[0];

        if (recv->pat1.unk0 == 0x4051) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            gCurTask->main = sub_8035EF0;
            m4aSongNumStart(SE_SELECT);
        }
    }

    coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;
    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035554(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;
    union MultiSioData* send;
    MultiPakHeartbeat();

    element->unk16 -= 0x10;
    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    coursesScreen->unk4B0 += gSineTable[gUnknown_080D74C8[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->unk4B4 += gSineTable[gUnknown_080D74C8[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->unk4B0 < ((gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100))) {
        coursesScreen->unk4B0 = gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->unk4B4 = gUnknown_080D7358[coursesScreen->currentCourse][1] << 8;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = sub_803594C;
    }
    
    coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;

    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    if (gInput & A_BUTTON) {
        coursesScreen->unk4C0 = 1;
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;
        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = coursesScreen->unk4B0 >> 8;
        send->pat1.unk3 = coursesScreen->unk4B4 >> 8;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035750(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;
    union MultiSioData* send;

    if (IsMultiplayer()) {
        MultiPakHeartbeat();
    }

    element->unk16 -= 0x10;
    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    coursesScreen->unk4B0 += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->unk4B4 += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->unk4B0 > (gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100)) {
        coursesScreen->unk4B0 = gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->unk4B4 = gUnknown_080D7358[coursesScreen->currentCourse][1] << 8;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = sub_803594C;
    }

    coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;

    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    if (gInput & A_BUTTON) {
        coursesScreen->unk4C0 = 1;
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;
        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = coursesScreen->unk4B0 >> 8;
        send->pat1.unk3 = coursesScreen->unk4B4 >> 8;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_803594C(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;

    element->unk16 -= 0x10;
    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    coursesScreen->unk4BE++;

    if (coursesScreen->unk4BE > 5) {
        gCurTask->main = sub_8035124;
    }
    
    if (gInput & A_BUTTON) {
        coursesScreen->unk4C0 = 1;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_80359D4(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element = &coursesScreen->unk2CC;

    element->unk16 -= 0x10;
    if ((s16)element->unk16 < 0x50) {
        element->unk16 = 0x50;
    }

    coursesScreen->unk4B0 += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse] + 0x100] >> 6;
    coursesScreen->unk4B4 += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse]] >> 6;

    if (coursesScreen->unk4B0 > ((gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100))) {  
        coursesScreen->unk4B0 = gUnknown_080D7358[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->unk4B4 = gUnknown_080D7358[coursesScreen->currentCourse][1] << 8;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = sub_8035AF0;
    }

    coursesScreen->unk4AC = coursesScreen->unk4B0 - 0x7800;

    if (coursesScreen->unk4AC < 0) {
        coursesScreen->unk4AC = 0;
    } else if (coursesScreen->unk4AC > 0xF000) {
        coursesScreen->unk4AC = 0xF000;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035AF0(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    s8 unk4BE = coursesScreen->unk4BE + 1;
    struct UNK_802D4CC_UNK270* fadeTransition = &coursesScreen->unk0;

    coursesScreen->unk4BE = unk4BE;
    if (coursesScreen->unk4BE > 0x3C) {
        fadeTransition->unk0 = 0;
        fadeTransition->unk4 = 0;
        fadeTransition->unk2 = 1;
        fadeTransition->unk6 = 0x180;
        fadeTransition->unk8 = 0xFF;
        fadeTransition->unkA = 0;
        gCurTask->main = sub_8035E70;
    }

    sub_8035FCC(coursesScreen);
}

bool8 sub_8035B44(struct CourseSelectionScreen* coursesScreen) {
    u8 i;
    bool8 result;
    struct UNK_0808B3FC_UNK240* element;

    for (i = 0; i < coursesScreen->unk4BA; i++) {
        element = &coursesScreen->unkBC[i];
        element->unk16 = gUnknown_080D74A8[i][0] - (coursesScreen->unk4AC >> 8);
        element->unk18 = gUnknown_080D74A8[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->unkBC[coursesScreen->unk4BA];
    element->unk16 = gUnknown_080D74A8[coursesScreen->unk4BA][0] - (coursesScreen->unk4AC >> 8);
    element->unk18 = gUnknown_080D74A8[coursesScreen->unk4BA][1];
    result = sub_8004558(element) == 0;
    sub_80051E8(element);
    sub_8035C00(coursesScreen);

    return result;
}

void sub_8035C00(struct CourseSelectionScreen* coursesScreen) {
    struct UNK_0808B3FC_UNK240* element;
    s8 somethinga;
    s8 lang = gLoadedSaveGame->unk6;

    if (lang <= 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    }

    element = &coursesScreen->unk8C;
    element->unk16 = ((coursesScreen->unk4B0 - coursesScreen->unk4AC) >> 8) + 5;
    element->unk18 = (coursesScreen->unk4B4 >> 8) + 6;
    sub_80051E8(element);

    if (coursesScreen->currentCourse < 0xE) {
        element = &coursesScreen->unk23C[0];
        element->unkA = 0x2F6;
        element->unk20 = coursesScreen->currentCourse >> 1;
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);

        element = &coursesScreen->unk23C[1];
        element->unkA = 0x2F6;
        element->unk20 = coursesScreen->currentCourse & 1;
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->unk29C;
    element->unkA = gUnknown_080D7418[coursesScreen->currentCourse][0];
    element->unk20 = gUnknown_080D7418[coursesScreen->currentCourse][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);

    element = &coursesScreen->unk2CC;
#ifndef NON_MATCHING
    somethinga++; somethinga--;
#endif
    element->unkA = gUnknown_080D7398[coursesScreen->currentCourse + (somethinga << 4)][0];
    element->unk20 = gUnknown_080D7398[coursesScreen->currentCourse + (somethinga << 4)][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);
    element = &coursesScreen->unk2FC;
    sub_80051E8(element);

    if (!IsMultiplayer()) {
        u8 i;
        for (i = 0; i < 7; i++) {
            if (GetBit(gLoadedSaveGame->unkC[gSelectedCharacter], i)) {
                element = &coursesScreen->unk32C[i + 1];
            } else {
                element = &coursesScreen->unk32C[0];
            }
            element->unk16 = (((i * 3)) * 8) + 0x24;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }
}

void sub_8035DC8(struct CourseSelectionScreen* coursesScreen) {
    u8 i;

    if (coursesScreen->unk8C.unk4 != NULL) {
        VramFree(coursesScreen->unk8C.unk4);
        coursesScreen->unk8C.unk4 = NULL;
    }

    for (i = 0; i < 8; i++) {
        if (coursesScreen->unkBC[i].unk4 != NULL) {
            VramFree(coursesScreen->unkBC[i].unk4);
            coursesScreen->unkBC[i].unk4 = NULL;
        }
    }

    if (coursesScreen->unk23C[0].unk4 != NULL) {
        VramFree(coursesScreen->unk23C[0].unk4);
        coursesScreen->unk23C[0].unk4 = NULL;
    }

    if (coursesScreen->unk23C[1].unk4 != NULL) {
        VramFree(coursesScreen->unk23C[1].unk4);
        coursesScreen->unk23C[1].unk4 = NULL;
    }

    if (coursesScreen->unk29C.unk4 != NULL) {
        VramFree(coursesScreen->unk29C.unk4);
        coursesScreen->unk29C.unk4 = NULL;
    }

    if (coursesScreen->unk2CC.unk4 != NULL) {
        VramFree(coursesScreen->unk2CC.unk4);
        coursesScreen->unk2CC.unk4 = NULL;
    }

    if (coursesScreen->unk2FC.unk4 != NULL) {
        VramFree(coursesScreen->unk2FC.unk4);
        coursesScreen->unk2FC.unk4 = NULL;
    }
}

void sub_8035E70(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->unk0) == 1) {
        sub_8035DC8(coursesScreen);

        gCurrentLevel = gUnknown_080D7508[coursesScreen->currentCourse];

        if (gCurrentLevel != 29) {
            sub_801A770();
        } else {
            sub_8036C54();
        }
        
        TaskDestroy(gCurTask);
        return;
    }

    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035EF0(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->unk0) == 1) {
        sub_8035DC8(coursesScreen);
        gCurrentLevel = gUnknown_080D7508[coursesScreen->currentCourse];
        sub_801A770();
        TaskDestroy(gCurTask);
        return;
    }
    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035F60(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->unk0) == 1) {
        sub_8035DC8(coursesScreen);
        CreateCharacterSelectionScreen(gSelectedCharacter, gLoadedSaveGame->unk13 & 0x10);
        TaskDestroy(gCurTask);
        return;
    }
    gBgScrollRegs[0][0] = coursesScreen->unk4AC >> 8;
    sub_8035FCC(coursesScreen);
}

void sub_8035FCC(struct CourseSelectionScreen* coursesScreen) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;

    for (i = 0; i < coursesScreen->unk4BA; i++) {
        element = &coursesScreen->unkBC[i];
        element->unk16 = gUnknown_080D74A8[i][0] - (coursesScreen->unk4AC >> 8);
        element->unk18 = gUnknown_080D74A8[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    sub_8035C00(coursesScreen);
}

void sub_8036040(struct Task* t) {
    sub_8035DC8(TaskGetStructPtr(t));
}
