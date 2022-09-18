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
    struct UNK_802D4CC_UNK270 screenFade;
    struct Unk_03002400 worldMap;
    struct Unk_03002400 headerBackground;
    struct UNK_0808B3FC_UNK240 playerAvatar;
    struct UNK_0808B3FC_UNK240 mapPaths[8];
    struct UNK_0808B3FC_UNK240 zoneActUnits[2];
    struct UNK_0808B3FC_UNK240 zoneType;
    struct UNK_0808B3FC_UNK240 zoneName;
    struct UNK_0808B3FC_UNK240 screenTitle;
    struct UNK_0808B3FC_UNK240 chaosEmeralds[8];
    s32 cameraScrollX;
    s32 avatarTargetX;
    s32 avatarTargetY;
    u8 filler4B8[2];
    u8 zonePathsUnlocked;
    u8 currentCourse;
    u8 maxCourse;
    u8 cutScenes;
    u8 zoneNameAnimFrame;
    u8 unlockedCourse;
    bool8 levelChosen;
};

#define UNITS_PER_PIXEL 256
#define CAMERA_FOV_WIDTH (DISPLAY_WIDTH * UNITS_PER_PIXEL)

#define MIN_CAMERA_SCROLL_X 0
#define MAX_CAMERA_SCROLL_X (DISPLAY_WIDTH * UNITS_PER_PIXEL)

#define CAM_MAX_X_SPEED (UNITS_PER_PIXEL * 3)
#define ZONE_NAME_SCROLL_SPEED (0x10)

// divide by 256 (round down) 
#define TO_SCREEN_COORD(val) ((val) >> 8)

// Devide by 2, round down
#define COURSE_INDEX_TO_ZONE_INDEX(courseIndex) ((courseIndex) >> 1)
// Mod 1
#define COURSE_INDEX_TO_ACT_INDEX(courseIndex) ((courseIndex) & 1)

void Task_FadeIn(void);
void Task_FadeInIntroAndStartUnlockCutScene(void);
void CourseSelectionScreenOnDestroy(struct Task* t);
void RenderZoneMapPathsAndUI(struct CourseSelectionScreen* coursesScreen);
void Task_CourseSelectMain(void);
void Task_ScrollToNextCourseCutSceneAnim(void);
void Task_UnlockCourseCutSceneNewPathAnim(void);
void Task_UnlockCourseCutSceneScrollAnim(void);
bool8 AnimateNewZonePath(struct CourseSelectionScreen*);
void Task_FadeOutAndExitToSelectedLevel(void);
void Task_ScrollToPreviousLevelAnim(void);
void Task_ScrollToNextLevelAnim(void);
void Task_FadeOutAndExitToSelectedMultiplayerLevel(void);
void Task_FadeOutAndExitToCharacterSelect(void);
void Task_DisplayZoneNameAnim(void);
void sub_8035AF0(void);
void RenderUI(struct CourseSelectionScreen* coursesScreen);

extern const u16 gZonePathAssets[8][3];
extern const u16 gZonePathAnimatedAssets[18][3];

extern const s16 gZoneMapCameraTargets[16][2];
extern const u16 gUnknown_080D7398[0x20][2];
extern const u16 gUnknown_080D7418[0x10][2];
extern const u16 gUnknown_080D7458[8][2];

extern const u8 gCourseIndexToZonePaths[16];

extern const s16 gUnknown_080D7488[0x10];
extern const u16 gZoneMapPathPositions[8][2];

extern const u16 gZoneMapPathReverseAngles[0x10];
extern const u16 gUnknown_080D74E8[0x10];

extern const u8 gCourseIndexToLevelIndex[16];

#define Render(coursesScreen) ({ \
    gBgScrollRegs[0][0] = TO_SCREEN_COORD((coursesScreen)->cameraScrollX); \
    RenderZoneMapPathsAndUI(coursesScreen); \
})

#define SetCameraScrollX(coursesScreen, x) ({ \
    (coursesScreen)->cameraScrollX = (x); \
    if ((coursesScreen)->cameraScrollX < MIN_CAMERA_SCROLL_X) { \
        (coursesScreen)->cameraScrollX = MIN_CAMERA_SCROLL_X; \
    } else if ((coursesScreen)->cameraScrollX > MAX_CAMERA_SCROLL_X) { \
        (coursesScreen)->cameraScrollX = MAX_CAMERA_SCROLL_X; \
    } \
})

#define ScrollInZoneName(element, speed) ({ \
    (element)->unk16 -= speed; \
    if ((s16)(element)->unk16 < 0x50) { \
        (element)->unk16 = 0x50; \
    } \
})

void CreateCourseSelectionScreen(u8 currentLevel, u8 maxLevel, u8 cutScenes) {
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

    if (cutScenes == CUT_SCENE_UNLOCK_TRUE_AREA_53) {
        gLoadedSaveGame->unk1A = 2;
        WriteSaveGame();
    }

    if (IsMultiplayer() && maxLevel > LEVEL_INDEX(ZONE_7, ACT_BOSS)) {
        maxLevel = LEVEL_INDEX(ZONE_7, ACT_BOSS);
    }

    if (maxLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        if (maxLevel < LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            maxLevel++;
        } else {
            if (gLoadedSaveGame->unk1A != 0 && gSelectedCharacter == CHARACTER_SONIC) {
                maxLevel = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
            } else {
                maxLevel = LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE);
            }
        }
    }
        
    if (maxLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        m4aSongNumStart(MUS_COURSE_SELECTION_2);
    } else {
        if (maxLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            m4aSongNumStart(MUS_COURSE_SELECTION_3);
        } else {
            m4aSongNumStart(MUS_TA_COURSE_SELECTION);
        }
    }

    // make sure our level rounds to 3, or the screen will crash
    if (!IsMultiplayer() && (Mod(maxLevel, ACTS_PER_ZONE + 1) & 2) != 0) {
        maxLevel &= ~ACTS_PER_ZONE;
    }

    gDispCnt = 0x1340;

    gBgCntRegs[1] = 0x1C0E;
    gBgCntRegs[0] = 0x5003;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53) && !IsMultiplayer()) {
        t = TaskCreate(Task_FadeInIntroAndStartUnlockCutScene, sizeof(struct CourseSelectionScreen), 0x3100, 0, CourseSelectionScreenOnDestroy);
    } else {
        t = TaskCreate(Task_FadeIn, sizeof(struct CourseSelectionScreen), 0x3100, 0, CourseSelectionScreenOnDestroy);
    }

    coursesScreen = TaskGetStructPtr(t);
    coursesScreen->cameraScrollX = 0;

    courseIndex = LEVEL_TO_COURSE_INDEX(currentLevel);
    coursesScreen->avatarTargetX = gZoneMapCameraTargets[courseIndex][0] * UNITS_PER_PIXEL;
    coursesScreen->avatarTargetY = gZoneMapCameraTargets[courseIndex][1] * UNITS_PER_PIXEL;
    coursesScreen->currentCourse = courseIndex;
    coursesScreen->zoneNameAnimFrame = 0;
    coursesScreen->levelChosen = FALSE;

    maxCourseIndex = LEVEL_TO_COURSE_INDEX(maxLevel);

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)) {
        coursesScreen->unlockedCourse = maxCourseIndex;
    }

    coursesScreen->zonePathsUnlocked = gCourseIndexToZonePaths[maxCourseIndex];
    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53) && coursesScreen->zonePathsUnlocked != 0) {
        coursesScreen->zonePathsUnlocked--;
    }

    coursesScreen->cutScenes = cutScenes;
    coursesScreen->maxCourse = maxCourseIndex;

    fadeTransition = &coursesScreen->screenFade;
    fadeTransition->unk0 = 0;
    fadeTransition->unk4 = 0;
    fadeTransition->unk2 = 2;
    fadeTransition->unk6 = 0x180;
    fadeTransition->unk8 = 0xFF;
    fadeTransition->unkA = 0;
    sub_802D4CC(fadeTransition);

    background = &coursesScreen->headerBackground;
    background->unk4 = BG_SCREEN_ADDR(24);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;

    if (!IsMultiplayer()) {
        background->unk1C = 100 + gSelectedCharacter;
    } else {
        background->unk1C = 100 + gMultiplayerCharacters[0];   
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

    background = &coursesScreen->worldMap;
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

    element =&coursesScreen->playerAvatar;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x2F7;
    if (!IsMultiplayer()) {
        element->unk20 = gSelectedCharacter;
    } else {
        element->unk20 = gMultiplayerCharacters[0];
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

    for (i = 0; i < ARRAY_COUNT(coursesScreen->mapPaths); i++) {
        element =&coursesScreen->mapPaths[i];
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk4 = VramMalloc(gZonePathAssets[i][0]);
        if ((cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)) && coursesScreen->zonePathsUnlocked == i) {
            element->unkA = gZonePathAnimatedAssets[i][1];
            element->unk20 = gZonePathAnimatedAssets[i][2];
        } else {
            element->unkA =  gZonePathAssets[i][1];
            element->unk20 = gZonePathAssets[i][2];
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

    for (i = 0; i < ARRAY_COUNT(coursesScreen->zoneActUnits); i++) {
        element = &coursesScreen->zoneActUnits[i];
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

    element = &coursesScreen->zoneType;
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

    element = &coursesScreen->zoneName;
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

    element = &coursesScreen->screenTitle;
    element->unk16 = 0;
    element->unk18 = 0;
    if (gLoadedSaveGame->unk6 == LANG_JAPANESE) {
        element->unk4 = VramMalloc(0x18);
        element->unkA = 0x2FB;
        // Set the background color based on the
        // character
        if (!IsMultiplayer()) {
#ifndef NONMATCHING
            s8 var = gSelectedCharacter;
            if (var) var = gSelectedCharacter;
            var = gSelectedCharacter;
#endif
            element->unk20 = gSelectedCharacter;
        } else {
            element->unk20 = gMultiplayerCharacters[0];
        }
    } else {
        element->unk4 = VramMalloc(0x1C);
        element->unkA = 0x2FC;
        if (!IsMultiplayer()) {
            element->unk20 = gSelectedCharacter;
        } else {
            element->unk20 = gMultiplayerCharacters[0];
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

    for (i = 0; i < ARRAY_COUNT(coursesScreen->chaosEmeralds); i++) {
        element = &coursesScreen->chaosEmeralds[i];
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

void Task_FadeIn(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX + CAM_MAX_X_SPEED);

    // Wait for fade
    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X || coursesScreen->cameraScrollX >= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
            coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

            if ((coursesScreen->cutScenes & 4) && !IsMultiplayer()) {
                coursesScreen->currentCourse++;
                gCurTask->main = Task_ScrollToNextCourseCutSceneAnim;
            } else {
                gCurTask->main = Task_CourseSelectMain;
            }
        }
    }

    if (coursesScreen->cameraScrollX >= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
        coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);
        if (coursesScreen->cameraScrollX < 0) {
            coursesScreen->cameraScrollX = 0;
        }
    }

    Render(coursesScreen);
}



void Task_FadeInIntroAndStartUnlockCutScene(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X || coursesScreen->cameraScrollX >= ((gUnknown_080D7488[coursesScreen->unlockedCourse] * 0x100) - (CAMERA_FOV_WIDTH / 2))) {
            coursesScreen->cameraScrollX = (gUnknown_080D7488[coursesScreen->unlockedCourse] * 0x100) - (CAMERA_FOV_WIDTH / 2);
            m4aSongNumStart(SE_MAP_214);
            gCurTask->main = Task_UnlockCourseCutSceneNewPathAnim;
        }
    }

    SetCameraScrollX(coursesScreen, (gUnknown_080D7488[coursesScreen->unlockedCourse] * 0x100) - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

void Task_UnlockCourseCutSceneNewPathAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;
    bool8 animDone;
    coursesScreen->zoneNameAnimFrame++;

    ScrollInZoneName(zoneName, 16);
    gBgScrollRegs[0][0] = TO_SCREEN_COORD(coursesScreen->cameraScrollX);

    animDone = AnimateNewZonePath(coursesScreen);
    if (animDone) {
        gCurTask->main = Task_UnlockCourseCutSceneScrollAnim;
        zoneName->unk16 = 0xF0;
        coursesScreen->zonePathsUnlocked++;
        coursesScreen->maxCourse++;
    }
}

void Task_UnlockCourseCutSceneScrollAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX - CAM_MAX_X_SPEED);

    if (coursesScreen->cameraScrollX == MIN_CAMERA_SCROLL_X || coursesScreen->cameraScrollX <= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
        coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

        if (coursesScreen->cutScenes & CUT_SCENE_UNLOCK_NEXT_COURSE) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                coursesScreen->currentCourse++;
            }
            coursesScreen->zoneNameAnimFrame = 0;
            m4aSongNumStart(SE_MAP_MOVE);
            gCurTask->main = Task_ScrollToNextCourseCutSceneAnim;
        } else {
            if (coursesScreen->maxCourse == LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) + 1) {
                struct UNK_0808B3FC_UNK240* element;
                
                coursesScreen->maxCourse = LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53));
                element = &coursesScreen->mapPaths[7];
                element->unkA = gZonePathAssets[7][1];
                element->unk20 = gZonePathAssets[7][2];
            }
            gCurTask->main = Task_CourseSelectMain;            
        }

        if (coursesScreen->cameraScrollX <= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
            coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);
            if (coursesScreen->cameraScrollX < 0) {
                coursesScreen->cameraScrollX = 0;
            }
        }
    }

    Render(coursesScreen);
}

void Task_CourseSelectMain(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;
    struct UNK_802D4CC_UNK270* fadeTransition = &coursesScreen->screenFade;
    union MultiSioData* recv, *send;
    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        recv = &gMultiSioRecv[0];
        if(!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && recv->pat1.unk0 > 0x404F) {
            coursesScreen->currentCourse = recv->pat1.unk2;
            coursesScreen->avatarTargetX = recv->pat1.unk4 * UNITS_PER_PIXEL;
            coursesScreen->avatarTargetY = recv->pat1.unk3 * UNITS_PER_PIXEL;
        }
    }

    ScrollInZoneName(zoneName, 16);

    if (!IsMultiplayer() || gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (coursesScreen->levelChosen && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutAndExitToSelectedLevel;
        } else if (gInput & (DPAD_LEFT) && !coursesScreen->levelChosen) {
            if (coursesScreen->currentCourse > 0) {
                if (COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse) == 0 || coursesScreen->currentCourse > LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(ZONE_7, ACT_2))) {
                    zoneName->unk16 = 0xF0;
                }
                coursesScreen->zoneNameAnimFrame = 0;
                coursesScreen->currentCourse--;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = Task_ScrollToPreviousLevelAnim;
            }
        } else if (gInput & DPAD_RIGHT && !coursesScreen->levelChosen) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                if (COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse) == 1 || coursesScreen->currentCourse > LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(ZONE_7, ACT_2))) {
                    zoneName->unk16 = 0xF0;
                }
                coursesScreen->zoneNameAnimFrame = 0;
                coursesScreen->currentCourse++;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = Task_ScrollToNextLevelAnim;
            }
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON) && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutAndExitToSelectedLevel;
        } else if ((gPressedKeys & B_BUTTON) && !IsMultiplayer()) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = Task_FadeOutAndExitToCharacterSelect;
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON) && gGameMode <= GAME_MODE_MULTI_PLAYER) {
            fadeTransition->unk0 = 0;
            fadeTransition->unk4 = 0;
            fadeTransition->unk2 = 1;
            fadeTransition->unk6 = 0x180;
            fadeTransition->unk8 = 0xFF;
            fadeTransition->unkA = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutAndExitToSelectedMultiplayerLevel;
        }
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;

        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = TO_SCREEN_COORD(coursesScreen->avatarTargetX);
        send->pat1.unk3 = TO_SCREEN_COORD(coursesScreen->avatarTargetY);

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT && 
                (gPressedKeys & A_BUTTON || coursesScreen->levelChosen) && 
                !(gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT))) {
            coursesScreen->levelChosen = TRUE;
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
            gCurTask->main = Task_FadeOutAndExitToSelectedMultiplayerLevel;
            m4aSongNumStart(SE_SELECT);
        }
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

void Task_ScrollToPreviousLevelAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;
    union MultiSioData* send;
    MultiPakHeartbeat();

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[gZoneMapPathReverseAngles[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->avatarTargetY += gSineTable[gZoneMapPathReverseAngles[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX < (gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100)) {
        coursesScreen->avatarTargetX = gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->avatarTargetY = gZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }
    
    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

    if (gInput & A_BUTTON) {
        coursesScreen->levelChosen = TRUE;
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;
        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = TO_SCREEN_COORD(coursesScreen->avatarTargetX);
        send->pat1.unk3 = TO_SCREEN_COORD(coursesScreen->avatarTargetY);
    }

    Render(coursesScreen);
}

void Task_ScrollToNextLevelAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;
    union MultiSioData* send;

    if (IsMultiplayer()) {
        MultiPakHeartbeat();
    }

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->avatarTargetY += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX > (gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100)) {
        coursesScreen->avatarTargetX = gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->avatarTargetY = gZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

    if (gInput & A_BUTTON) {
        coursesScreen->levelChosen = TRUE;
    }

    if (IsMultiplayer()) {
        send = &gMultiSioSend;
        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = TO_SCREEN_COORD(coursesScreen->avatarTargetX);
        send->pat1.unk3 = TO_SCREEN_COORD(coursesScreen->avatarTargetY);
    }

    Render(coursesScreen);
}

void Task_DisplayZoneNameAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    coursesScreen->zoneNameAnimFrame++;

    if (coursesScreen->zoneNameAnimFrame > 5) {
        gCurTask->main = Task_CourseSelectMain;
    }
    
    if (gInput & A_BUTTON) {
        coursesScreen->levelChosen = TRUE;
    }

    Render(coursesScreen);
}

void Task_ScrollToNextCourseCutSceneAnim(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse] + 0x100] >> 6;
    coursesScreen->avatarTargetY += gSineTable[gUnknown_080D74E8[coursesScreen->currentCourse]] >> 6;

    if (coursesScreen->avatarTargetX > (gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100)) {  
        coursesScreen->avatarTargetX = gZoneMapCameraTargets[coursesScreen->currentCourse][0] * 0x100;
        coursesScreen->avatarTargetY = gZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = sub_8035AF0;
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

void sub_8035AF0(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);
    s8 unk4BE = coursesScreen->zoneNameAnimFrame + 1;
    struct UNK_802D4CC_UNK270* fadeTransition = &coursesScreen->screenFade;

    coursesScreen->zoneNameAnimFrame = unk4BE;
    if (coursesScreen->zoneNameAnimFrame > 0x3C) {
        fadeTransition->unk0 = 0;
        fadeTransition->unk4 = 0;
        fadeTransition->unk2 = 1;
        fadeTransition->unk6 = 0x180;
        fadeTransition->unk8 = 0xFF;
        fadeTransition->unkA = 0;
        gCurTask->main = Task_FadeOutAndExitToSelectedLevel;
    }

    RenderZoneMapPathsAndUI(coursesScreen);
}

bool8 AnimateNewZonePath(struct CourseSelectionScreen* coursesScreen) {
    u8 i;
    bool8 animDone;
    struct UNK_0808B3FC_UNK240* element;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        element = &coursesScreen->mapPaths[i];
        element->unk16 = gZoneMapPathPositions[i][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        element->unk18 = gZoneMapPathPositions[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->mapPaths[coursesScreen->zonePathsUnlocked];
    element->unk16 = gZoneMapPathPositions[coursesScreen->zonePathsUnlocked][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
    element->unk18 = gZoneMapPathPositions[coursesScreen->zonePathsUnlocked][1];
    animDone = sub_8004558(element) == 0;
    sub_80051E8(element);
    RenderUI(coursesScreen);

    return animDone;
}

void RenderUI(struct CourseSelectionScreen* coursesScreen) {
    struct UNK_0808B3FC_UNK240* element;
    s8 somethinga;
    s8 lang = gLoadedSaveGame->unk6;

    if (lang <= 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    }

    element = &coursesScreen->playerAvatar;
    element->unk16 = TO_SCREEN_COORD(coursesScreen->avatarTargetX - coursesScreen->cameraScrollX) + 5;
    element->unk18 = TO_SCREEN_COORD(coursesScreen->avatarTargetY) + 6;
    sub_80051E8(element);

    if (coursesScreen->currentCourse < 0xE) {
        element = &coursesScreen->zoneActUnits[0];
        element->unkA = 0x2F6;
        element->unk20 = COURSE_INDEX_TO_ZONE_INDEX(coursesScreen->currentCourse);
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);

        element = &coursesScreen->zoneActUnits[1];
        element->unkA = 0x2F6;
        element->unk20 = COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse);
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->zoneType;
    element->unkA = gUnknown_080D7418[coursesScreen->currentCourse][0];
    element->unk20 = gUnknown_080D7418[coursesScreen->currentCourse][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);

    element = &coursesScreen->zoneName;
#ifndef NON_MATCHING
    somethinga++; somethinga--;
#endif
    element->unkA = gUnknown_080D7398[coursesScreen->currentCourse + (somethinga * 16)][0];
    element->unk20 = gUnknown_080D7398[coursesScreen->currentCourse + (somethinga * 16)][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);
    element = &coursesScreen->screenTitle;
    sub_80051E8(element);

    if (!IsMultiplayer()) {
        u8 i;
        for (i = 0; i < 7; i++) {
            if (GetBit(gLoadedSaveGame->unkC[gSelectedCharacter], i)) {
                element = &coursesScreen->chaosEmeralds[i + 1];
            } else {
                element = &coursesScreen->chaosEmeralds[0];
            }
            element->unk16 = (((i * 3)) * 8) + 0x24;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }
}

void DestroyUI(struct CourseSelectionScreen* coursesScreen) {
    u8 i;

    if (coursesScreen->playerAvatar.unk4 != NULL) {
        VramFree(coursesScreen->playerAvatar.unk4);
        coursesScreen->playerAvatar.unk4 = NULL;
    }

    for (i = 0; i < 8; i++) {
        if (coursesScreen->mapPaths[i].unk4 != NULL) {
            VramFree(coursesScreen->mapPaths[i].unk4);
            coursesScreen->mapPaths[i].unk4 = NULL;
        }
    }

    if (coursesScreen->zoneActUnits[0].unk4 != NULL) {
        VramFree(coursesScreen->zoneActUnits[0].unk4);
        coursesScreen->zoneActUnits[0].unk4 = NULL;
    }

    if (coursesScreen->zoneActUnits[1].unk4 != NULL) {
        VramFree(coursesScreen->zoneActUnits[1].unk4);
        coursesScreen->zoneActUnits[1].unk4 = NULL;
    }

    if (coursesScreen->zoneType.unk4 != NULL) {
        VramFree(coursesScreen->zoneType.unk4);
        coursesScreen->zoneType.unk4 = NULL;
    }

    if (coursesScreen->zoneName.unk4 != NULL) {
        VramFree(coursesScreen->zoneName.unk4);
        coursesScreen->zoneName.unk4 = NULL;
    }

    if (coursesScreen->screenTitle.unk4 != NULL) {
        VramFree(coursesScreen->screenTitle.unk4);
        coursesScreen->screenTitle.unk4 = NULL;
    }
}

void Task_FadeOutAndExitToSelectedLevel(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);

        gCurrentLevel = gCourseIndexToLevelIndex[coursesScreen->currentCourse];

        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_801A770();
        } else {
            sub_8036C54();
        }
        
        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

void Task_FadeOutAndExitToSelectedMultiplayerLevel(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);
        gCurrentLevel = gCourseIndexToLevelIndex[coursesScreen->currentCourse];
        sub_801A770();
        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

void Task_FadeOutAndExitToCharacterSelect(void) {
    struct CourseSelectionScreen* coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);
        CreateCharacterSelectionScreen(gSelectedCharacter, gLoadedSaveGame->unk13 & 0x10);
        TaskDestroy(gCurTask);
        return;
    }
    Render(coursesScreen);
}

void RenderZoneMapPathsAndUI(struct CourseSelectionScreen* coursesScreen) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        element = &coursesScreen->mapPaths[i];
        element->unk16 = gZoneMapPathPositions[i][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        element->unk18 = gZoneMapPathPositions[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    RenderUI(coursesScreen);
}

void CourseSelectionScreenOnDestroy(struct Task* t) {
    DestroyUI(TaskGetStructPtr(t));
}
