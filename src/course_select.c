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
    Background zoneMap;
    Background header;
    Sprite playerAvatar;
    Sprite mapPaths[8];
    Sprite zoneActUnits[2];
    Sprite zoneType;
    Sprite zoneName;
    Sprite screenTitle;
    Sprite chaosEmeralds[8];
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

#define UNITS_PER_PIXEL  256
#define CAMERA_FOV_WIDTH (DISPLAY_WIDTH * UNITS_PER_PIXEL)

#define MIN_CAMERA_SCROLL_X 0
#define MAX_CAMERA_SCROLL_X (DISPLAY_WIDTH * UNITS_PER_PIXEL)

#define CAM_MAX_X_SPEED        (UNITS_PER_PIXEL * 3)
#define ZONE_NAME_SCROLL_SPEED (0x10)

// divide by 256 (round down)
#define TO_SCREEN_COORD(val) ((val) >> 8)

// Devide by 2, round down
#define COURSE_INDEX_TO_ZONE_INDEX(courseIndex) ((courseIndex) >> 1)
// Mod 1
#define COURSE_INDEX_TO_ACT_INDEX(courseIndex) ((courseIndex)&1)

static void Task_FadeInIntro(void);
static void Task_FadeInIntroAndStartUnlockCutScene(void);

static void Task_UnlockCutSceneScrollToNextCourseAnim(void);
static void Task_UnlockCutSceneNewPathAnim(void);
static void Task_UnlockCutSceneScrollAnim(void);
static void Task_UnlockCutSceneNextCoursePause(void);
static bool8 AnimateNewZonePath(struct CourseSelectionScreen *);

static void Task_CourseSelectMain(void);
static void Task_ScrollToPreviousLevelAnim(void);
static void Task_ScrollToNextLevelAnim(void);

static void Task_DisplayZoneNameAnim(void);
static void Task_FadeOutAndExitToSelectedLevel(void);
static void Task_FadeOutAndExitToSelectedMultiplayerLevel(void);
static void Task_FadeOutAndExitToCharacterSelect(void);

static void RenderUI(struct CourseSelectionScreen *coursesScreen);
static void RenderZoneMapPathsAndUI(struct CourseSelectionScreen *coursesScreen);

static void CourseSelectionScreenOnDestroy(struct Task *t);

static const u16 sZoneMapPathAssets[][3] = {
    [ZONE_1] = { 6, 749, 1 },  [ZONE_2] = { 12, 750, 1 },     [ZONE_3] = { 10, 751, 1 },
    [ZONE_4] = { 6, 752, 1 },  [ZONE_5] = { 16, 753, 1 },     [ZONE_6] = { 21, 754, 1 },
    [ZONE_7] = { 36, 755, 1 }, [ZONE_FINAL] = { 30, 756, 1 },
};

static const u16 sZoneMapPathAnimatedAssets[][3] = {
    [ZONE_1] = { 6, 749, 0 },  [ZONE_2] = { 12, 750, 0 },     [ZONE_3] = { 10, 751, 0 },
    [ZONE_4] = { 6, 752, 0 },  [ZONE_5] = { 16, 753, 0 },     [ZONE_6] = { 28, 754, 0 },
    [ZONE_7] = { 36, 755, 0 }, [ZONE_FINAL] = { 30, 756, 0 },
};

static const s16 sUnused_080D7318[][2] = {
    { 9, 106 },  { 25, 106 }, { 40, 76 },  { 56, 76 },  { 75, 114 }, { 91, 114 },
    { 97, 66 },  { 113, 66 }, { 146, 77 }, { 162, 77 }, { 204, 97 }, { 220, 97 },
    { 284, 77 }, { 300, 77 }, { 402, 72 }, { 455, 93 },
};

static const s16 sZoneMapCameraTargets[][2] = {
    { 4, 100 },  { 20, 100 }, { 35, 70 },  { 51, 70 },  { 70, 108 }, { 86, 108 },
    { 92, 60 },  { 108, 60 }, { 141, 71 }, { 157, 71 }, { 199, 91 }, { 215, 91 },
    { 279, 71 }, { 295, 71 }, { 373, 93 }, { 449, 81 },
};

static const u16 sZoneNameAssets[][2] = {
    // ENGLISH
    { 761, 0 },
    { 761, 0 },
    { 761, 1 },
    { 761, 1 },
    { 761, 2 },
    { 761, 2 },
    { 761, 3 },
    { 761, 3 },
    { 761, 4 },
    { 761, 4 },
    { 761, 5 },
    { 761, 5 },
    { 761, 6 },
    { 761, 6 },
    { 761, 7 },
    { 761, 8 },

    // Japanese
    { 762, 0 },
    { 762, 0 },
    { 762, 1 },
    { 762, 1 },
    { 762, 2 },
    { 762, 2 },
    { 762, 3 },
    { 762, 3 },
    { 762, 4 },
    { 762, 4 },
    { 762, 5 },
    { 762, 5 },
    { 762, 6 },
    { 762, 6 },
    { 762, 7 },
    { 762, 8 },
};

static const u16 sZoneTypeAssets[][2] = {
    { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 },
    { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 },
    { 757, 0 }, { 757, 0 }, { 757, 1 }, { 757, 2 },
};

static const u16 sChaoEmeraldAssets[][2] = {
    { 760, 0 }, { 760, 1 }, { 760, 2 }, { 760, 3 },
    { 760, 4 }, { 760, 5 }, { 760, 6 }, { 760, 7 },
};

static const u8 sCourseIndexToNumZonePaths[] = {
    0, 0, // ZONE_1
    1, 1, // ZONE_2
    2, 2, // ZONE_3
    3, 3, // ZONE_4
    4, 4, // ZONE_5
    5, 5, // ZONE_6
    6, 6, // ZONE_7
    7, 8 // ZONE_FINAL
};

static const s16 sZoneMapCourseXPositions[] = {
    4,   20, // ZONE_1
    35,  51, // ZONE_2
    70,  86, // ZONE_3
    92,  108, // ZONE_4
    141, 157, // ZONE_5
    199, 215, // ZONE_6
    279, 295, // ZONE_7
    397, 450, // ZONE_FINAL
};

static const u16 sZoneMapPathPositions[][2] = {
    [ZONE_1] = { 24, 80 },  [ZONE_2] = { 56, 80 },      [ZONE_3] = { 88, 72 },
    [ZONE_4] = { 120, 64 }, [ZONE_5] = { 168, 72 },     [ZONE_6] = { 224, 72 },
    [ZONE_7] = { 304, 72 }, [ZONE_FINAL] = { 384, 80 },
};

static const u16 sZoneMapPathReverseAngles[] = {
    512, 330, // ZONE_1
    512, 692, // ZONE_2
    512, 276, // ZONE_3
    512, 566, // ZONE_4
    512, 584, // ZONE_5
    512, 463, // ZONE_6
    512, 557, // ZONE_7
    484, 0, // ZONE_FINAL
};

static const u16 sZoneMapPathForwardAngles[]
    = { -1, 0, 850, 0, 180, 0, 788, 0, 56, 0, 72, 0, 976, 0, 44, 1000 };

static const u8 sCourseIndexToLevelIndex[] = {
    LEVEL_INDEX(ZONE_1, ACT_1),
    LEVEL_INDEX(ZONE_1, ACT_2),
    LEVEL_INDEX(ZONE_2, ACT_1),
    LEVEL_INDEX(ZONE_2, ACT_2),
    LEVEL_INDEX(ZONE_3, ACT_1),
    LEVEL_INDEX(ZONE_3, ACT_2),
    LEVEL_INDEX(ZONE_4, ACT_1),
    LEVEL_INDEX(ZONE_4, ACT_2),
    LEVEL_INDEX(ZONE_5, ACT_1),
    LEVEL_INDEX(ZONE_5, ACT_2),
    LEVEL_INDEX(ZONE_6, ACT_1),
    LEVEL_INDEX(ZONE_6, ACT_2),
    LEVEL_INDEX(ZONE_7, ACT_1),
    LEVEL_INDEX(ZONE_7, ACT_2),
    LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE),
    LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53),
};

#define Render(coursesScreen)                                                           \
    ({                                                                                  \
        gBgScrollRegs[0][0] = TO_SCREEN_COORD((coursesScreen)->cameraScrollX);          \
        RenderZoneMapPathsAndUI(coursesScreen);                                         \
    })

#define SetCameraScrollX(coursesScreen, x)                                              \
    ({                                                                                  \
        (coursesScreen)->cameraScrollX = (x);                                           \
        if ((coursesScreen)->cameraScrollX < MIN_CAMERA_SCROLL_X) {                     \
            (coursesScreen)->cameraScrollX = MIN_CAMERA_SCROLL_X;                       \
        } else if ((coursesScreen)->cameraScrollX > MAX_CAMERA_SCROLL_X) {              \
            (coursesScreen)->cameraScrollX = MAX_CAMERA_SCROLL_X;                       \
        }                                                                               \
    })

// Text scrolls in from the right, so take that as base for pixel value
#define CS_LOCAL_ZONE_TEXT_X (DISPLAY_WIDTH - 160)
#define ScrollInZoneName(element, speed)                                                \
    ({                                                                                  \
        (element)->x -= speed;                                                          \
        if ((s16)(element)->x < CS_LOCAL_ZONE_TEXT_X) {                                 \
            (element)->x = CS_LOCAL_ZONE_TEXT_X;                                        \
        }                                                                               \
    })

void CreateCourseSelectionScreen(u8 currentLevel, u8 maxLevel, u8 cutScenes)
{
    struct Task *t;
    struct UNK_802D4CC_UNK270 *fadeTransition;
    Background *background;
    Sprite *element = NULL;
    struct CourseSelectionScreen *coursesScreen;

    u8 i;

    u8 courseIndex, maxCourseIndex;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

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

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)
        && !IsMultiplayer()) {
        t = TaskCreate(Task_FadeInIntroAndStartUnlockCutScene,
                       sizeof(struct CourseSelectionScreen), 0x3100, 0,
                       CourseSelectionScreenOnDestroy);
    } else {
        t = TaskCreate(Task_FadeInIntro, sizeof(struct CourseSelectionScreen), 0x3100, 0,
                       CourseSelectionScreenOnDestroy);
    }

    coursesScreen = TaskGetStructPtr(t);
    coursesScreen->cameraScrollX = 0;

    courseIndex = LEVEL_TO_COURSE_INDEX(currentLevel);
    coursesScreen->avatarTargetX
        = sZoneMapCameraTargets[courseIndex][0] * UNITS_PER_PIXEL;
    coursesScreen->avatarTargetY
        = sZoneMapCameraTargets[courseIndex][1] * UNITS_PER_PIXEL;
    coursesScreen->currentCourse = courseIndex;
    coursesScreen->zoneNameAnimFrame = 0;
    coursesScreen->levelChosen = FALSE;

    maxCourseIndex = LEVEL_TO_COURSE_INDEX(maxLevel);

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)) {
        coursesScreen->unlockedCourse = maxCourseIndex;
    }

    coursesScreen->zonePathsUnlocked = sCourseIndexToNumZonePaths[maxCourseIndex];
    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)
        && coursesScreen->zonePathsUnlocked != 0) {
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

    background = &coursesScreen->header;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
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

    background = &coursesScreen->zoneMap;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
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

    element = &coursesScreen->playerAvatar;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(4);
    element->graphics.anim = 0x2F7;
    if (!IsMultiplayer()) {
        element->variant = gSelectedCharacter;
    } else {
        element->variant = gMultiplayerCharacters[0];
    }
    element->unk1A = 0xC0;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < ARRAY_COUNT(coursesScreen->mapPaths); i++) {
        element = &coursesScreen->mapPaths[i];
        element->x = 0;
        element->y = 0;
        element->graphics.dest = VramMalloc(sZoneMapPathAssets[i][0]);
        if ((cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53))
            && coursesScreen->zonePathsUnlocked == i) {
            element->graphics.anim = sZoneMapPathAnimatedAssets[i][1];
            element->variant = sZoneMapPathAnimatedAssets[i][2];
        } else {
            element->graphics.anim = sZoneMapPathAssets[i][1];
            element->variant = sZoneMapPathAssets[i][2];
        }
        element->unk1A = 0x100;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28[0].unk0 = -1;
        element->unk10 = 0;
    }

    for (i = 0; i < ARRAY_COUNT(coursesScreen->zoneActUnits); i++) {
        element = &coursesScreen->zoneActUnits[i];
        element->x = i * 0x20 + 0xB8;
        element->y = 0;
        element->graphics.dest = VramMalloc(4);
        element->graphics.anim = 0x2F6;
        element->variant = 0;
        element->unk1A = 0x100;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28[0].unk0 = -1;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &coursesScreen->zoneType;
    element->x = 0x80;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x1A);
    element->graphics.anim = 0x2F5;
    element->variant = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &coursesScreen->zoneName;
    element->x = 0xF0;
    element->y = 0x18;
    element->graphics.dest = VramMalloc(0x26);
    element->graphics.anim = 0x2F9;
    element->variant = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &coursesScreen->screenTitle;
    element->x = 0;
    element->y = 0;
    if (gLoadedSaveGame->unk6 == LANG_JAPANESE) {
        element->graphics.dest = VramMalloc(0x18);
        element->graphics.anim = 0x2FB;
        // Set the background color based on the
        // character
        if (!IsMultiplayer()) {
#ifndef NONMATCHING
            s8 var = gSelectedCharacter;
            if (var)
                var = gSelectedCharacter;
            var = gSelectedCharacter;
#endif
            element->variant = gSelectedCharacter;
        } else {
            element->variant = gMultiplayerCharacters[0];
        }
    } else {
        element->graphics.dest = VramMalloc(0x1C);
        element->graphics.anim = 0x2FC;
        if (!IsMultiplayer()) {
            element->variant = gSelectedCharacter;
        } else {
            element->variant = gMultiplayerCharacters[0];
        }
    }
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < ARRAY_COUNT(coursesScreen->chaosEmeralds); i++) {
        element = &coursesScreen->chaosEmeralds[i];
        element->x = 0;
        element->y = 0x88;
        element->graphics.dest = (void *)OBJ_VRAM0 + (i * 0x120);
        element->graphics.anim = sChaoEmeraldAssets[i][0];
        element->variant = sChaoEmeraldAssets[i][1];
        element->unk1A = 0x100;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28[0].unk0 = -1;
        element->unk10 = 0;
    }
}

static void Task_FadeInIntro(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX + CAM_MAX_X_SPEED);

    // Wait for fade
    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X
            || coursesScreen->cameraScrollX
                >= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
            coursesScreen->cameraScrollX
                = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

            if ((coursesScreen->cutScenes & 4) && !IsMultiplayer()) {
                coursesScreen->currentCourse++;
                gCurTask->main = Task_UnlockCutSceneScrollToNextCourseAnim;
            } else {
                gCurTask->main = Task_CourseSelectMain;
            }
        }
    }

    if (coursesScreen->cameraScrollX
        >= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
        coursesScreen->cameraScrollX
            = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);
        if (coursesScreen->cameraScrollX < 0) {
            coursesScreen->cameraScrollX = 0;
        }
    }

    Render(coursesScreen);
}

static void Task_FadeInIntroAndStartUnlockCutScene(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X
            || coursesScreen->cameraScrollX
                >= ((sZoneMapCourseXPositions[coursesScreen->unlockedCourse]
                     * UNITS_PER_PIXEL)
                    - (CAMERA_FOV_WIDTH / 2))) {
            coursesScreen->cameraScrollX
                = (sZoneMapCourseXPositions[coursesScreen->unlockedCourse]
                   * UNITS_PER_PIXEL)
                - (CAMERA_FOV_WIDTH / 2);
            m4aSongNumStart(SE_MAP_214);
            gCurTask->main = Task_UnlockCutSceneNewPathAnim;
        }
    }

    SetCameraScrollX(
        coursesScreen,
        (sZoneMapCourseXPositions[coursesScreen->unlockedCourse] * UNITS_PER_PIXEL)
            - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_UnlockCutSceneNewPathAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;
    bool8 animDone;
    coursesScreen->zoneNameAnimFrame++;

    ScrollInZoneName(zoneName, 16);
    gBgScrollRegs[0][0] = TO_SCREEN_COORD(coursesScreen->cameraScrollX);

    animDone = AnimateNewZonePath(coursesScreen);
    if (animDone) {
        gCurTask->main = Task_UnlockCutSceneScrollAnim;
        zoneName->x = DISPLAY_WIDTH;
        coursesScreen->zonePathsUnlocked++;
        coursesScreen->maxCourse++;
    }
}

static void Task_UnlockCutSceneScrollAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX - CAM_MAX_X_SPEED);

    if (coursesScreen->cameraScrollX == MIN_CAMERA_SCROLL_X
        || coursesScreen->cameraScrollX
            <= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
        coursesScreen->cameraScrollX
            = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

        if (coursesScreen->cutScenes & CUT_SCENE_UNLOCK_NEXT_COURSE) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                coursesScreen->currentCourse++;
            }
            coursesScreen->zoneNameAnimFrame = 0;
            m4aSongNumStart(SE_MAP_MOVE);
            gCurTask->main = Task_UnlockCutSceneScrollToNextCourseAnim;
        } else {
            if (coursesScreen->maxCourse
                == COURSE_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) + 1) {
                Sprite *element;

                coursesScreen->maxCourse = COURSE_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
                element = &coursesScreen->mapPaths[ZONE_FINAL];
                element->graphics.anim = sZoneMapPathAssets[ZONE_FINAL][1];
                element->variant = sZoneMapPathAssets[ZONE_FINAL][2];
            }
            gCurTask->main = Task_CourseSelectMain;
        }

        if (coursesScreen->cameraScrollX
            <= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
            coursesScreen->cameraScrollX
                = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);
            if (coursesScreen->cameraScrollX < 0) {
                coursesScreen->cameraScrollX = 0;
            }
        }
    }

    Render(coursesScreen);
}

static void Task_CourseSelectMain(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);

    Sprite *zoneName = &coursesScreen->zoneName;
    struct UNK_802D4CC_UNK270 *fadeTransition = &coursesScreen->screenFade;
    union MultiSioData *recv, *send;
    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        recv = &gMultiSioRecv[0];
        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && recv->pat1.unk0 > 0x404F) {
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
                if (COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse) == 0
                    || coursesScreen->currentCourse > COURSE_INDEX(ZONE_7, ACT_2)) {
                    zoneName->x = DISPLAY_WIDTH;
                }
                coursesScreen->zoneNameAnimFrame = 0;
                coursesScreen->currentCourse--;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = Task_ScrollToPreviousLevelAnim;
            }
        } else if (gInput & DPAD_RIGHT && !coursesScreen->levelChosen) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                if (COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse) == 1
                    || coursesScreen->currentCourse > COURSE_INDEX(ZONE_7, ACT_2)) {
                    zoneName->x = DISPLAY_WIDTH;
                }
                coursesScreen->zoneNameAnimFrame = 0;
                coursesScreen->currentCourse++;
                m4aSongNumStart(SE_MAP_MOVE);
                gCurTask->main = Task_ScrollToNextLevelAnim;
            }
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON)
                   && !IsMultiplayer()) {
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
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON)
                   && gGameMode <= GAME_MODE_MULTI_PLAYER) {
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

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT
            && (gPressedKeys & A_BUTTON || coursesScreen->levelChosen)
            && !(gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT))) {
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

    SetCameraScrollX(coursesScreen,
                     coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_ScrollToPreviousLevelAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;
    union MultiSioData *send;
    MultiPakHeartbeat();

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX
        += gSineTable[sZoneMapPathReverseAngles[coursesScreen->currentCourse] + 0x100]
        >> 5;
    coursesScreen->avatarTargetY
        += gSineTable[sZoneMapPathReverseAngles[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX
        < (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX
            = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY
            = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }

    SetCameraScrollX(coursesScreen,
                     coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

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

static void Task_ScrollToNextLevelAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;
    union MultiSioData *send;

    if (IsMultiplayer()) {
        MultiPakHeartbeat();
    }

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX
        += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse] + 0x100]
        >> 5;
    coursesScreen->avatarTargetY
        += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX
        > (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX
            = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY
            = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }

    SetCameraScrollX(coursesScreen,
                     coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

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

static void Task_DisplayZoneNameAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;

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

static void Task_UnlockCutSceneScrollToNextCourseAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX
        += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse] + 0x100]
        >> 6;
    coursesScreen->avatarTargetY
        += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse]] >> 6;

    if (coursesScreen->avatarTargetX
        > (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX
            = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY
            = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_UnlockCutSceneNextCoursePause;
    }

    SetCameraScrollX(coursesScreen,
                     coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_UnlockCutSceneNextCoursePause(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);
    s8 unk4BE = coursesScreen->zoneNameAnimFrame + 1;
    struct UNK_802D4CC_UNK270 *fadeTransition = &coursesScreen->screenFade;

    coursesScreen->zoneNameAnimFrame = unk4BE;
    if (coursesScreen->zoneNameAnimFrame > 60) {
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

static bool8 AnimateNewZonePath(struct CourseSelectionScreen *coursesScreen)
{
    u8 i;
    bool8 animDone;
    Sprite *element;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        element = &coursesScreen->mapPaths[i];
        element->x = sZoneMapPathPositions[i][0]
            - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        element->y = sZoneMapPathPositions[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->mapPaths[coursesScreen->zonePathsUnlocked];
    element->x = sZoneMapPathPositions[coursesScreen->zonePathsUnlocked][0]
        - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
    element->y = sZoneMapPathPositions[coursesScreen->zonePathsUnlocked][1];
    animDone = sub_8004558(element) == 0;
    sub_80051E8(element);
    RenderUI(coursesScreen);

    return animDone;
}

static void RenderUI(struct CourseSelectionScreen *coursesScreen)
{
    Sprite *element;
    s8 somethinga;
    s8 lang = gLoadedSaveGame->unk6;

    if (lang <= 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    }

    element = &coursesScreen->playerAvatar;
    element->x
        = TO_SCREEN_COORD(coursesScreen->avatarTargetX - coursesScreen->cameraScrollX)
        + 5;
    element->y = TO_SCREEN_COORD(coursesScreen->avatarTargetY) + 6;
    sub_80051E8(element);

    if (coursesScreen->currentCourse < 0xE) {
        element = &coursesScreen->zoneActUnits[0];
        element->graphics.anim = 0x2F6;
        element->variant = COURSE_INDEX_TO_ZONE_INDEX(coursesScreen->currentCourse);
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);

        element = &coursesScreen->zoneActUnits[1];
        element->graphics.anim = 0x2F6;
        element->variant = COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse);
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &coursesScreen->zoneType;
    element->graphics.anim = sZoneTypeAssets[coursesScreen->currentCourse][0];
    element->variant = sZoneTypeAssets[coursesScreen->currentCourse][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);

    element = &coursesScreen->zoneName;
#ifndef NON_MATCHING
    somethinga++;
    somethinga--;
#endif
    element->graphics.anim
        = sZoneNameAssets[coursesScreen->currentCourse + (somethinga * 16)][0];
    element->variant
        = sZoneNameAssets[coursesScreen->currentCourse + (somethinga * 16)][1];
    element->unk21 = 0xFF;
    sub_8004558(element);
    sub_80051E8(element);
    element = &coursesScreen->screenTitle;
    sub_80051E8(element);

    if (!IsMultiplayer()) {
        u8 i;
        for (i = 0; i < NUM_COURSE_ZONES; i++) {
            if (gLoadedSaveGame->unkC[gSelectedCharacter] & CHAOS_EMERALD(i)) {
                element = &coursesScreen->chaosEmeralds[i + 1];
            } else {
                element = &coursesScreen->chaosEmeralds[0];
            }
            element->x = (((i * 3)) * 8) + 0x24;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }
}

static void DestroyUI(struct CourseSelectionScreen *coursesScreen)
{
    u8 i;

    if (coursesScreen->playerAvatar.graphics.dest != NULL) {
        VramFree(coursesScreen->playerAvatar.graphics.dest);
        coursesScreen->playerAvatar.graphics.dest = NULL;
    }

    for (i = 0; i < 8; i++) {
        if (coursesScreen->mapPaths[i].graphics.dest != NULL) {
            VramFree(coursesScreen->mapPaths[i].graphics.dest);
            coursesScreen->mapPaths[i].graphics.dest = NULL;
        }
    }

    if (coursesScreen->zoneActUnits[0].graphics.dest != NULL) {
        VramFree(coursesScreen->zoneActUnits[0].graphics.dest);
        coursesScreen->zoneActUnits[0].graphics.dest = NULL;
    }

    if (coursesScreen->zoneActUnits[1].graphics.dest != NULL) {
        VramFree(coursesScreen->zoneActUnits[1].graphics.dest);
        coursesScreen->zoneActUnits[1].graphics.dest = NULL;
    }

    if (coursesScreen->zoneType.graphics.dest != NULL) {
        VramFree(coursesScreen->zoneType.graphics.dest);
        coursesScreen->zoneType.graphics.dest = NULL;
    }

    if (coursesScreen->zoneName.graphics.dest != NULL) {
        VramFree(coursesScreen->zoneName.graphics.dest);
        coursesScreen->zoneName.graphics.dest = NULL;
    }

    if (coursesScreen->screenTitle.graphics.dest != NULL) {
        VramFree(coursesScreen->screenTitle.graphics.dest);
        coursesScreen->screenTitle.graphics.dest = NULL;
    }
}

static void Task_FadeOutAndExitToSelectedLevel(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);

        gCurrentLevel = sCourseIndexToLevelIndex[coursesScreen->currentCourse];

        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_801A770();
        } else {
            CreateTrueArea53();
        }

        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

static void Task_FadeOutAndExitToSelectedMultiplayerLevel(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);
        gCurrentLevel = sCourseIndexToLevelIndex[coursesScreen->currentCourse];
        sub_801A770();
        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

static void Task_FadeOutAndExitToCharacterSelect(void)
{
    struct CourseSelectionScreen *coursesScreen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&coursesScreen->screenFade) == 1) {
        DestroyUI(coursesScreen);
        CreateCharacterSelectionScreen(gSelectedCharacter,
                                       gLoadedSaveGame->unk13 & 0x10);
        TaskDestroy(gCurTask);
        return;
    }
    Render(coursesScreen);
}

static void RenderZoneMapPathsAndUI(struct CourseSelectionScreen *coursesScreen)
{
    u8 i;
    Sprite *element;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        element = &coursesScreen->mapPaths[i];
        element->x = sZoneMapPathPositions[i][0]
            - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        element->y = sZoneMapPathPositions[i][1];
        sub_8004558(element);
        sub_80051E8(element);
    }

    RenderUI(coursesScreen);
}

static void CourseSelectionScreenOnDestroy(struct Task *t)
{
    DestroyUI(TaskGetStructPtr(t));
}
