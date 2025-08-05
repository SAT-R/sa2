#include "game/course_select.h"
#include "core.h"
#include "sprite.h"

#include "game/stage/screen_fade.h"
#include "game/save.h"
#include "game/stage/stage.h"

#include "lib/m4a/m4a.h"
#include "game/character_select.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/bosses/final_intro.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/tilemaps.h"

struct CourseSelectionScreen {
    ScreenFade fade;
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
    [ZONE_1] = { 6, 749, 1 },  [ZONE_2] = { 12, 750, 1 }, [ZONE_3] = { 10, 751, 1 }, [ZONE_4] = { 6, 752, 1 },
    [ZONE_5] = { 16, 753, 1 }, [ZONE_6] = { 21, 754, 1 }, [ZONE_7] = { 36, 755, 1 }, [ZONE_FINAL] = { 30, 756, 1 },
};

static const u16 sZoneMapPathAnimatedAssets[][3] = {
    [ZONE_1] = { 6, 749, 0 },  [ZONE_2] = { 12, 750, 0 }, [ZONE_3] = { 10, 751, 0 }, [ZONE_4] = { 6, 752, 0 },
    [ZONE_5] = { 16, 753, 0 }, [ZONE_6] = { 28, 754, 0 }, [ZONE_7] = { 36, 755, 0 }, [ZONE_FINAL] = { 30, 756, 0 },
};

static const s16 sUnused_080D7318[][2] = {
    { 9, 106 },  { 25, 106 }, { 40, 76 },  { 56, 76 },  { 75, 114 }, { 91, 114 }, { 97, 66 },  { 113, 66 },
    { 146, 77 }, { 162, 77 }, { 204, 97 }, { 220, 97 }, { 284, 77 }, { 300, 77 }, { 402, 72 }, { 455, 93 },
};

static const s16 sZoneMapCameraTargets[][2] = {
    { 4, 100 },  { 20, 100 }, { 35, 70 },  { 51, 70 },  { 70, 108 }, { 86, 108 }, { 92, 60 },  { 108, 60 },
    { 141, 71 }, { 157, 71 }, { 199, 91 }, { 215, 91 }, { 279, 71 }, { 295, 71 }, { 373, 93 }, { 449, 81 },
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
    { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 },
    { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 0 }, { 757, 1 }, { 757, 2 },
};

static const u16 sChaoEmeraldAssets[][2] = {
    { 760, 0 }, { 760, 1 }, { 760, 2 }, { 760, 3 }, { 760, 4 }, { 760, 5 }, { 760, 6 }, { 760, 7 },
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
    [ZONE_1] = { 24, 80 },  [ZONE_2] = { 56, 80 },  [ZONE_3] = { 88, 72 },  [ZONE_4] = { 120, 64 },
    [ZONE_5] = { 168, 72 }, [ZONE_6] = { 224, 72 }, [ZONE_7] = { 304, 72 }, [ZONE_FINAL] = { 384, 80 },
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

static const u16 sZoneMapPathForwardAngles[] = { -1, 0, 850, 0, 180, 0, 788, 0, 56, 0, 72, 0, 976, 0, 44, 1000 };

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

#define Render(coursesScreen)                                                                                                              \
    ({                                                                                                                                     \
        gBgScrollRegs[0][0] = TO_SCREEN_COORD((coursesScreen)->cameraScrollX);                                                             \
        RenderZoneMapPathsAndUI(coursesScreen);                                                                                            \
    })

#define SetCameraScrollX(coursesScreen, x)                                                                                                 \
    ({                                                                                                                                     \
        (coursesScreen)->cameraScrollX = (x);                                                                                              \
        if ((coursesScreen)->cameraScrollX < MIN_CAMERA_SCROLL_X) {                                                                        \
            (coursesScreen)->cameraScrollX = MIN_CAMERA_SCROLL_X;                                                                          \
        } else if ((coursesScreen)->cameraScrollX > MAX_CAMERA_SCROLL_X) {                                                                 \
            (coursesScreen)->cameraScrollX = MAX_CAMERA_SCROLL_X;                                                                          \
        }                                                                                                                                  \
    })

// Text scrolls in from the right, so take that as base for pixel value
#define CS_LOCAL_ZONE_TEXT_X (DISPLAY_WIDTH - 160)
#define ScrollInZoneName(s, speed)                                                                                                         \
    ({                                                                                                                                     \
        (s)->x -= speed;                                                                                                                   \
        if ((s)->x < CS_LOCAL_ZONE_TEXT_X) {                                                                                               \
            (s)->x = CS_LOCAL_ZONE_TEXT_X;                                                                                                 \
        }                                                                                                                                  \
    })

void CreateCourseSelectionScreen(u8 currentLevel, u8 maxLevel, u8 cutScenes)
{
    struct Task *t;
    ScreenFade *fade;
    Background *background;
    Sprite *s = NULL;
    struct CourseSelectionScreen *coursesScreen;

    u8 i;

    u8 courseIndex, maxCourseIndex;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    if (cutScenes == CUT_SCENE_UNLOCK_TRUE_AREA_53) {
        gLoadedSaveGame->extraZoneStatus = 2;
        WriteSaveGame();
    }

    if (IS_MULTI_PLAYER && maxLevel > LEVEL_INDEX(ZONE_7, ACT_BOSS)) {
        maxLevel = LEVEL_INDEX(ZONE_7, ACT_BOSS);
    }

    if (maxLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        if (maxLevel < LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            maxLevel++;
        } else {
            if (gLoadedSaveGame->extraZoneStatus != 0 && gSelectedCharacter == CHARACTER_SONIC) {
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
    if (IS_SINGLE_PLAYER && (Mod(maxLevel, ACTS_PER_ZONE + 1) & 2) != 0) {
        maxLevel &= ~ACTS_PER_ZONE;
    }

    gDispCnt = 0x1340;

    gBgCntRegs[1] = BGCNT_TXT256x256 | (BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_CHARBASE(3));
    gBgCntRegs[0] = BGCNT_TXT512x256 | (BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(16) | BGCNT_16COLOR | BGCNT_CHARBASE(0));

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53) && IS_SINGLE_PLAYER) {
        t = TaskCreate(Task_FadeInIntroAndStartUnlockCutScene, sizeof(struct CourseSelectionScreen), 0x3100, 0,
                       CourseSelectionScreenOnDestroy);
    } else {
        t = TaskCreate(Task_FadeInIntro, sizeof(struct CourseSelectionScreen), 0x3100, 0, CourseSelectionScreenOnDestroy);
    }

    coursesScreen = TASK_DATA(t);
    coursesScreen->cameraScrollX = 0;

    courseIndex = LEVEL_TO_COURSE_INDEX(currentLevel);
    coursesScreen->avatarTargetX = sZoneMapCameraTargets[courseIndex][0] * UNITS_PER_PIXEL;
    coursesScreen->avatarTargetY = sZoneMapCameraTargets[courseIndex][1] * UNITS_PER_PIXEL;
    coursesScreen->currentCourse = courseIndex;
    coursesScreen->zoneNameAnimFrame = 0;
    coursesScreen->levelChosen = FALSE;

    maxCourseIndex = LEVEL_TO_COURSE_INDEX(maxLevel);

    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)) {
        coursesScreen->unlockedCourse = maxCourseIndex;
    }

    coursesScreen->zonePathsUnlocked = sCourseIndexToNumZonePaths[maxCourseIndex];
    if (cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53) && coursesScreen->zonePathsUnlocked != 0) {
        coursesScreen->zonePathsUnlocked--;
    }

    coursesScreen->cutScenes = cutScenes;
    coursesScreen->maxCourse = maxCourseIndex;

    fade = &coursesScreen->fade;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->brightness = 0;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->speed = 0x180;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    background = &coursesScreen->header;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;

    if (IS_SINGLE_PLAYER) {
        background->tilemapId = TM_STAGE_SELECT_BG_SONIC + gSelectedCharacter;
    } else {
        background->tilemapId = TM_STAGE_SELECT_BG_SONIC + gMultiplayerCharacters[0];
    }

    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    background = &coursesScreen->zoneMap;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(16);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_STAGE_SELECT_MAP;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x40;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    s = &coursesScreen->playerAvatar;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = 0x2F7;
    if (IS_SINGLE_PLAYER) {
        s->variant = gSelectedCharacter;
    } else {
        s->variant = gMultiplayerCharacters[0];
    }
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < ARRAY_COUNT(coursesScreen->mapPaths); i++) {
        s = &coursesScreen->mapPaths[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(sZoneMapPathAssets[i][0]);
        if ((cutScenes & (CUT_SCENE_UNLOCK_NEXT_COURSE | CUT_SCENE_UNLOCK_TRUE_AREA_53)) && coursesScreen->zonePathsUnlocked == i) {
            s->graphics.anim = sZoneMapPathAnimatedAssets[i][1];
            s->variant = sZoneMapPathAnimatedAssets[i][2];
        } else {
            s->graphics.anim = sZoneMapPathAssets[i][1];
            s->variant = sZoneMapPathAssets[i][2];
        }
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
    }

    for (i = 0; i < ARRAY_COUNT(coursesScreen->zoneActUnits); i++) {
        s = &coursesScreen->zoneActUnits[i];
        s->x = i * 32 + (DISPLAY_WIDTH - 56);
        s->y = 0;
        s->graphics.dest = VramMalloc(4);
        s->graphics.anim = SA2_ANIM_758;
        s->variant = 0;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    s = &coursesScreen->zoneType;
    s->x = DISPLAY_WIDTH - 112;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x1A);
    s->graphics.anim = 0x2F5;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &coursesScreen->zoneName;
    s->x = DISPLAY_WIDTH;
    s->y = 24;
    s->graphics.dest = VramMalloc(0x26);
    s->graphics.anim = 0x2F9;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &coursesScreen->screenTitle;
    s->x = 0;
    s->y = 0;
    if (gLoadedSaveGame->language == LANG_JAPANESE) {
        s->graphics.dest = VramMalloc(24);
        s->graphics.anim = 763;
        // Set the background color based on the
        // character
        if (IS_SINGLE_PLAYER) {
#ifndef NON_MATCHING
            s8 var = gSelectedCharacter;
            if (var)
                var = gSelectedCharacter;
            var = gSelectedCharacter;
#endif
            s->variant = gSelectedCharacter;
        } else {
            s->variant = gMultiplayerCharacters[0];
        }
    } else {
        s->graphics.dest = VramMalloc(28);
        s->graphics.anim = 764;
        if (IS_SINGLE_PLAYER) {
            s->variant = gSelectedCharacter;
        } else {
            s->variant = gMultiplayerCharacters[0];
        }
    }
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < ARRAY_COUNT(coursesScreen->chaosEmeralds); i++) {
        s = &coursesScreen->chaosEmeralds[i];
        s->x = 0;
        s->y = DISPLAY_HEIGHT - 24;
        s->graphics.dest = (void *)OBJ_VRAM0 + (i * (9 * TILE_SIZE_4BPP));
        s->graphics.anim = sChaoEmeraldAssets[i][0];
        s->variant = sChaoEmeraldAssets[i][1];
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
    }
}

static void Task_FadeInIntro(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX + CAM_MAX_X_SPEED);

    // Wait for fade
    if (UpdateScreenFade(&coursesScreen->fade) == SCREEN_FADE_COMPLETE) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X
            || coursesScreen->cameraScrollX >= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
            coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

            if ((coursesScreen->cutScenes & 4) && IS_SINGLE_PLAYER) {
                coursesScreen->currentCourse++;
                gCurTask->main = Task_UnlockCutSceneScrollToNextCourseAnim;
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

static void Task_FadeInIntroAndStartUnlockCutScene(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    if (UpdateScreenFade(&coursesScreen->fade) == SCREEN_FADE_COMPLETE) {
        if (coursesScreen->cameraScrollX == MAX_CAMERA_SCROLL_X
            || coursesScreen->cameraScrollX
                >= ((sZoneMapCourseXPositions[coursesScreen->unlockedCourse] * UNITS_PER_PIXEL) - (CAMERA_FOV_WIDTH / 2))) {
            coursesScreen->cameraScrollX
                = (sZoneMapCourseXPositions[coursesScreen->unlockedCourse] * UNITS_PER_PIXEL) - (CAMERA_FOV_WIDTH / 2);
            m4aSongNumStart(SE_MAP_214);
            gCurTask->main = Task_UnlockCutSceneNewPathAnim;
        }
    }

    SetCameraScrollX(coursesScreen, (sZoneMapCourseXPositions[coursesScreen->unlockedCourse] * UNITS_PER_PIXEL) - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_UnlockCutSceneNewPathAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
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
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    SetCameraScrollX(coursesScreen, coursesScreen->cameraScrollX - CAM_MAX_X_SPEED);

    if (coursesScreen->cameraScrollX == MIN_CAMERA_SCROLL_X
        || coursesScreen->cameraScrollX <= coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2)) {
        coursesScreen->cameraScrollX = coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2);

        if (coursesScreen->cutScenes & CUT_SCENE_UNLOCK_NEXT_COURSE) {
            if (coursesScreen->currentCourse < coursesScreen->maxCourse) {
                coursesScreen->currentCourse++;
            }
            coursesScreen->zoneNameAnimFrame = 0;
            m4aSongNumStart(SE_MAP_MOVE);
            gCurTask->main = Task_UnlockCutSceneScrollToNextCourseAnim;
        } else {
            if (coursesScreen->maxCourse == COURSE_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) + 1) {
                Sprite *s;

                coursesScreen->maxCourse = COURSE_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
                s = &coursesScreen->mapPaths[ZONE_FINAL];
                s->graphics.anim = sZoneMapPathAssets[ZONE_FINAL][1];
                s->variant = sZoneMapPathAssets[ZONE_FINAL][2];
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

static void Task_CourseSelectMain(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);

    Sprite *zoneName = &coursesScreen->zoneName;
    ScreenFade *fade = &coursesScreen->fade;
    union MultiSioData *recv, *send;
    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        recv = &gMultiSioRecv[0];
        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && recv->pat1.unk0 > 0x404F) {
            coursesScreen->currentCourse = recv->pat1.unk2;
            coursesScreen->avatarTargetX = recv->pat1.unk4 * UNITS_PER_PIXEL;
            coursesScreen->avatarTargetY = recv->pat1.unk3 * UNITS_PER_PIXEL;
        }
    }

    ScrollInZoneName(zoneName, 16);

    if (IS_SINGLE_PLAYER || gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (coursesScreen->levelChosen && IS_SINGLE_PLAYER) {
            fade->window = SCREEN_FADE_USE_WINDOW_0;
            fade->brightness = 0;
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->speed = 0x180;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
            fade->bldAlpha = 0;
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
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON) && IS_SINGLE_PLAYER) {
            fade->window = SCREEN_FADE_USE_WINDOW_0;
            fade->brightness = 0;
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->speed = 0x180;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
            fade->bldAlpha = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutAndExitToSelectedLevel;
        } else if ((gPressedKeys & B_BUTTON) && IS_SINGLE_PLAYER) {
            fade->window = SCREEN_FADE_USE_WINDOW_0;
            fade->brightness = 0;
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->speed = 0x180;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
            fade->bldAlpha = 0;
            m4aSongNumStart(SE_RETURN);
            gCurTask->main = Task_FadeOutAndExitToCharacterSelect;
        } else if (!(gInput & (DPAD_RIGHT | DPAD_LEFT)) && (gPressedKeys & A_BUTTON)
                   && (IS_SINGLE_PLAYER || gGameMode == GAME_MODE_MULTI_PLAYER)) {
            fade->window = SCREEN_FADE_USE_WINDOW_0;
            fade->brightness = 0;
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->speed = 0x180;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
            fade->bldAlpha = 0;
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_FadeOutAndExitToSelectedMultiplayerLevel;
        }
    }

    if (IS_MULTI_PLAYER) {
        send = &gMultiSioSend;

        send->pat1.unk0 = 0x4050;
        send->pat1.unk2 = coursesScreen->currentCourse;
        send->pat1.unk4 = TO_SCREEN_COORD(coursesScreen->avatarTargetX);
        send->pat1.unk3 = TO_SCREEN_COORD(coursesScreen->avatarTargetY);

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT && (gPressedKeys & A_BUTTON || coursesScreen->levelChosen)
            && !(gRepeatedKeys & (DPAD_LEFT | DPAD_RIGHT))) {
            coursesScreen->levelChosen = TRUE;
            send->pat1.unk0 = 0x4051;
        }
        recv = &gMultiSioRecv[0];

        if (recv->pat1.unk0 == 0x4051) {
            fade->window = SCREEN_FADE_USE_WINDOW_0;
            fade->brightness = 0;
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->speed = 0x180;
            fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
            fade->bldAlpha = 0;
            gCurTask->main = Task_FadeOutAndExitToSelectedMultiplayerLevel;
            m4aSongNumStart(SE_SELECT);
        }
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_ScrollToPreviousLevelAnim(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;
    union MultiSioData *send;
    MultiPakHeartbeat();

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[sZoneMapPathReverseAngles[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->avatarTargetY += gSineTable[sZoneMapPathReverseAngles[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX < (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

    if (gInput & A_BUTTON) {
        coursesScreen->levelChosen = TRUE;
    }

    if (IS_MULTI_PLAYER) {
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
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;
    union MultiSioData *send;

    if (IS_MULTI_PLAYER) {
        MultiPakHeartbeat();
    }

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse] + 0x100] >> 5;
    coursesScreen->avatarTargetY += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse]] >> 5;

    if (coursesScreen->avatarTargetX > (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_DisplayZoneNameAnim;
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));

    if (gInput & A_BUTTON) {
        coursesScreen->levelChosen = TRUE;
    }

    if (IS_MULTI_PLAYER) {
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
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
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
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    Sprite *zoneName = &coursesScreen->zoneName;

    ScrollInZoneName(zoneName, 16);

    coursesScreen->avatarTargetX += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse] + 0x100] >> 6;
    coursesScreen->avatarTargetY += gSineTable[sZoneMapPathForwardAngles[coursesScreen->currentCourse]] >> 6;

    if (coursesScreen->avatarTargetX > (sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL)) {
        coursesScreen->avatarTargetX = sZoneMapCameraTargets[coursesScreen->currentCourse][0] * UNITS_PER_PIXEL;
        coursesScreen->avatarTargetY = sZoneMapCameraTargets[coursesScreen->currentCourse][1] * UNITS_PER_PIXEL;
        m4aSongNumStart(SE_MAP_MOVE_END);
        gCurTask->main = Task_UnlockCutSceneNextCoursePause;
    }

    SetCameraScrollX(coursesScreen, coursesScreen->avatarTargetX - (CAMERA_FOV_WIDTH / 2));
    Render(coursesScreen);
}

static void Task_UnlockCutSceneNextCoursePause(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);
    s8 unk4BE = coursesScreen->zoneNameAnimFrame + 1;
    ScreenFade *fade = &coursesScreen->fade;

    coursesScreen->zoneNameAnimFrame = unk4BE;
    if (coursesScreen->zoneNameAnimFrame > 60) {
        fade->window = SCREEN_FADE_USE_WINDOW_0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = Q(1.5);
        fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;
        gCurTask->main = Task_FadeOutAndExitToSelectedLevel;
    }

    RenderZoneMapPathsAndUI(coursesScreen);
}

static bool8 AnimateNewZonePath(struct CourseSelectionScreen *coursesScreen)
{
    u8 i;
    bool8 animDone;
    Sprite *s;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        s = &coursesScreen->mapPaths[i];
        s->x = sZoneMapPathPositions[i][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        s->y = sZoneMapPathPositions[i][1];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &coursesScreen->mapPaths[coursesScreen->zonePathsUnlocked];
    s->x = sZoneMapPathPositions[coursesScreen->zonePathsUnlocked][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
    s->y = sZoneMapPathPositions[coursesScreen->zonePathsUnlocked][1];
    animDone = UpdateSpriteAnimation(s) == 0;
    DisplaySprite(s);
    RenderUI(coursesScreen);

    return animDone;
}

static void RenderUI(struct CourseSelectionScreen *coursesScreen)
{
    Sprite *s;
    s8 somethinga;
    s8 lang = gLoadedSaveGame->language;

    if (lang <= 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    }

    s = &coursesScreen->playerAvatar;
    s->x = TO_SCREEN_COORD(coursesScreen->avatarTargetX - coursesScreen->cameraScrollX) + 5;
    s->y = TO_SCREEN_COORD(coursesScreen->avatarTargetY) + 6;
    DisplaySprite(s);

    if (coursesScreen->currentCourse < 0xE) {
        s = &coursesScreen->zoneActUnits[0];
        s->graphics.anim = 0x2F6;
        s->variant = COURSE_INDEX_TO_ZONE_INDEX(coursesScreen->currentCourse);
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &coursesScreen->zoneActUnits[1];
        s->graphics.anim = 0x2F6;
        s->variant = COURSE_INDEX_TO_ACT_INDEX(coursesScreen->currentCourse);
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &coursesScreen->zoneType;
    s->graphics.anim = sZoneTypeAssets[coursesScreen->currentCourse][0];
    s->variant = sZoneTypeAssets[coursesScreen->currentCourse][1];
    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &coursesScreen->zoneName;
#ifndef NON_MATCHING
    somethinga++;
    somethinga--;
#endif
    s->graphics.anim = sZoneNameAssets[coursesScreen->currentCourse + (somethinga * 16)][0];
    s->variant = sZoneNameAssets[coursesScreen->currentCourse + (somethinga * 16)][1];
    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s = &coursesScreen->screenTitle;
    DisplaySprite(s);

    if (IS_SINGLE_PLAYER) {
        u8 i;
        for (i = 0; i < NUM_COURSE_ZONES; i++) {
            if (gLoadedSaveGame->chaosEmeralds[gSelectedCharacter] & CHAOS_EMERALD(i)) {
                s = &coursesScreen->chaosEmeralds[i + 1];
            } else {
                s = &coursesScreen->chaosEmeralds[0];
            }
            s->x = (((i * 3)) * 8) + ((DISPLAY_WIDTH / 2) - 84);
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
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
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&coursesScreen->fade) == SCREEN_FADE_COMPLETE) {
        DestroyUI(coursesScreen);

        gCurrentLevel = sCourseIndexToLevelIndex[coursesScreen->currentCourse];

        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            GameStageStart();
        } else {
            CreateTrueArea53Intro();
        }

        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

static void Task_FadeOutAndExitToSelectedMultiplayerLevel(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&coursesScreen->fade) == SCREEN_FADE_COMPLETE) {
        DestroyUI(coursesScreen);
        gCurrentLevel = sCourseIndexToLevelIndex[coursesScreen->currentCourse];
        GameStageStart();
        TaskDestroy(gCurTask);
        return;
    }

    Render(coursesScreen);
}

static void Task_FadeOutAndExitToCharacterSelect(void)
{
    struct CourseSelectionScreen *coursesScreen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&coursesScreen->fade) == SCREEN_FADE_COMPLETE) {
        DestroyUI(coursesScreen);
        CreateCharacterSelectionScreen(gSelectedCharacter, gLoadedSaveGame->unlockedCharacters & 0x10);
        TaskDestroy(gCurTask);
        return;
    }
    Render(coursesScreen);
}

static void RenderZoneMapPathsAndUI(struct CourseSelectionScreen *coursesScreen)
{
    u8 i;
    Sprite *s;

    for (i = 0; i < coursesScreen->zonePathsUnlocked; i++) {
        s = &coursesScreen->mapPaths[i];
        s->x = sZoneMapPathPositions[i][0] - TO_SCREEN_COORD(coursesScreen->cameraScrollX);
        s->y = sZoneMapPathPositions[i][1];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    RenderUI(coursesScreen);
}

static void CourseSelectionScreenOnDestroy(struct Task *t) { DestroyUI(TASK_DATA(t)); }
