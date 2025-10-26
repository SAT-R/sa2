#include "global.h"
#include "flags.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/stage/player.h"
#include "game/cheese.h"
#include "game/stage/screen_mask.h"
#include "game/bosses/common.h"
#include "game/countdown.h"
#include "game/boost_effect.h"
#include "game/multiplayer/mp_player.h"
#include "game/stage/screen_fade.h"
#include "game/stage/ui.h"
#include "game/stage/boss_results_transition.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "constants/zones.h"

#define INTRO_ICON_LEAF_FOREST  0
#define INTRO_ICON_HOT_CRATAER  1
#define INTRO_ICON_MUSIC_PLANT  2
#define INTRO_ICON_ICE_PARADISE 3
#define INTRO_ICON_SKY_CANYON   4
#define INTRO_ICON_TECHNO_BASE  5
#define INTRO_ICON_EGG_UTOPIA   6
#define INTRO_ICON_XX           7
#define INTRO_ICON_TRUE_AREA_53 8
#define INTRO_ICON_BOSS_ATTACK  9
#define NUM_INTRO_STAGE_ICONS   9

// includes Boss Attack
#define NUM_INTRO_UNLOCKED_STAGES_ICONS (NUM_INTRO_STAGE_ICONS + 1)

// (Stage-Courses + XX + True Area 53) == 9
#define NUM_ZONE_UNLOCKED_ICONS  (NUM_COURSE_ZONES + 2)
#define NUM_ZONE_NAME_PARTS      4
#define ZONE_NAME_INDEX_TA53     32
#define ZONE_NAME_INDEX_BOSS_ATK 36

#define INTROFRAME_VISIBLE         1
#define INTROFRAME_BANNER_APPEARS  7
#define INTROFRAME_NAME_AND_BANNER 10
#define INTROFRAME_PAUSE_ON_BANNER 120
#define INTROFRAME_CLEAR_BANNER    136
#define INTROFRAME_FADE_GAMEPLAY   150

// The colored logo next to the stage name
static const u16 zoneLoadingCharacterLogos[NUM_CHARACTERS][3] = {
    [CHARACTER_SONIC] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 0 }, [CHARACTER_CREAM] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 3 },
    [CHARACTER_TAILS] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 1 }, [CHARACTER_KNUCKLES] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 2 },
    [CHARACTER_AMY] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 4 },
};

static const u16 zoneLoadingZoneNames[NUM_INTRO_UNLOCKED_STAGES_ICONS * NUM_ZONE_NAME_PARTS][3] = {
    // LEAF FOREST
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 0 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 1 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 2 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 3 },
    // HOT CRATER
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 4 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 5 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 6 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 7 },
    // MUSIC PLANT
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 8 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 9 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 10 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 11 },
    // ICE PARADISE
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 12 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 13 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 14 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 15 },
    // SKY CANYON
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 16 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 17 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 18 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 19 },
    // TECHNO BASE
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 20 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 21 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 22 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 23 },
    // EGG UTOPIA
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 24 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 25 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 26 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 27 },
    // XX
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 28 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 29 }, // (empty image)
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 30 }, // (empty image)
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 31 }, // (empty image)
    // TRUE AREA 53
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 32 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 33 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 34 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 35 },
    // BOSS ATTACK!
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 36 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 37 },
    { 20, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 38 },
    { 35, SA2_ANIM_STAGE_INTRO_ZONE_NAMES, 39 },
};

// Big icon showing the current zone during the stage loading screen.
// It is positioned inside the rotating wheel displayed in the upper left screen corner.
static const u16 zoneLoadingIcons[NUM_INTRO_STAGE_ICONS][3] = {
    [INTRO_ICON_LEAF_FOREST] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 0 },
    [INTRO_ICON_HOT_CRATAER] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 1 },
    [INTRO_ICON_MUSIC_PLANT] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 2 },
    [INTRO_ICON_ICE_PARADISE] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 3 },
    [INTRO_ICON_SKY_CANYON] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 4 },
    [INTRO_ICON_TECHNO_BASE] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 5 },
    [INTRO_ICON_EGG_UTOPIA] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 6 },
    [INTRO_ICON_XX] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 7 },
    [INTRO_ICON_TRUE_AREA_53] = { 64, SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS, 8 },
};

// Small icons showing the unlocked stages during the stage loading screen
//
// NOTE: The usage code expects all these icons to have the same tile-count.
//       It uses the count of the 0th entry.
static const u16 sZoneUnlockedIcons[NUM_INTRO_UNLOCKED_STAGES_ICONS][3] = {
    [INTRO_ICON_LEAF_FOREST] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 1 },
    [INTRO_ICON_HOT_CRATAER] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 2 },
    [INTRO_ICON_MUSIC_PLANT] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 3 },
    [INTRO_ICON_ICE_PARADISE] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 4 },
    [INTRO_ICON_SKY_CANYON] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 5 },
    [INTRO_ICON_TECHNO_BASE] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 6 },
    [INTRO_ICON_EGG_UTOPIA] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 7 },
    [INTRO_ICON_XX] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 8 },
    [INTRO_ICON_TRUE_AREA_53] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 9 },
    [INTRO_ICON_BOSS_ATTACK] = { 9, SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS, 0 },
};

static const u16 sZoneLoadingActLetters[5][3] = {
    [0] = { 18, SA2_ANIM_STAGE_INTRO_ACT_LETTERS, 0 }, // A
    [1] = { 18, SA2_ANIM_STAGE_INTRO_ACT_LETTERS, 1 }, // C
    [2] = { 18, SA2_ANIM_STAGE_INTRO_ACT_LETTERS, 2 }, // T
    [3] = { 18, SA2_ANIM_STAGE_INTRO_ACT_LETTERS, 3 }, // 1
    [4] = { 18, SA2_ANIM_STAGE_INTRO_ACT_LETTERS, 4 }, // 2
};

static const TileInfo characterAnimsGettingReady[NUM_CHARACTERS] = {
    [CHARACTER_SONIC] = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_SONIC), 0 },
    [CHARACTER_CREAM] = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_CREAM), 0 },
    [CHARACTER_TAILS] = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_TAILS), 0 },
    [CHARACTER_KNUCKLES] = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_KNUCKLES), 0 },
    [CHARACTER_AMY] = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_AMY), 0 },
};

// TODO: static
// Colored triangles used for each character (bottom-right)
const TileInfo sColoredTriangle[NUM_CHARACTERS] = {
    [CHARACTER_SONIC] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 0 }, [CHARACTER_CREAM] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 4 },
    [CHARACTER_TAILS] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 1 }, [CHARACTER_KNUCKLES] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 2 },
    [CHARACTER_AMY] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 3 },
};

static const u8 sGettingReadyAnimationDuration[NUM_CHARACTERS]
    = { [CHARACTER_SONIC] = 40, [CHARACTER_CREAM] = 55, [CHARACTER_TAILS] = 52, [CHARACTER_KNUCKLES] = 40, [CHARACTER_AMY] = 40 };

// Each byte represents one RGB channel (0-31)
static const u8 gUnknown_080D6FF5[NUM_CHARACTERS + 1][16][3] = {
    {
        { 0x00, 0x17, 0x06 },
        { 0x16, 0x16, 0x16 },
        { 0x00, 0x04, 0x13 },
        { 0x00, 0x08, 0x1D },
        { 0x00, 0x00, 0x0C },
        { 0x00, 0x13, 0x00 },
        { 0x1F, 0x1F, 0x13 },
        { 0x1F, 0x1B, 0x00 },
        { 0x13, 0x0A, 0x02 },
        { 0x1F, 0x15, 0x0A },
        { 0x15, 0x00, 0x00 },
        { 0x1F, 0x04, 0x04 },
        { 0x04, 0x04, 0x04 },
        { 0x1F, 0x1F, 0x1F },
        { 0x0E, 0x0E, 0x0E },
        { 0x00, 0x13, 0x1F },
    },
    {
        { 0x00, 0x19, 0x14 },
        { 0x19, 0x19, 0x19 },
        { 0x1F, 0x0B, 0x00 },
        { 0x1F, 0x12, 0x00 },
        { 0x19, 0x05, 0x00 },
        { 0x1C, 0x0B, 0x00 },
        { 0x13, 0x00, 0x00 },
        { 0x1F, 0x1C, 0x17 },
        { 0x1D, 0x18, 0x10 },
        { 0x13, 0x0F, 0x08 },
        { 0x1F, 0x1E, 0x00 },
        { 0x08, 0x11, 0x1F },
        { 0x02, 0x02, 0x02 },
        { 0x1F, 0x1F, 0x1F },
        { 0x0E, 0x0E, 0x0E },
        { 0x1F, 0x00, 0x1F },
    },
    {
        { 0x00, 0x17, 0x06 },
        { 0x1F, 0x00, 0x1F },
        { 0x1D, 0x11, 0x04 },
        { 0x1F, 0x17, 0x04 },
        { 0x17, 0x0A, 0x02 },
        { 0x15, 0x19, 0x1B },
        { 0x00, 0x13, 0x1F },
        { 0x04, 0x08, 0x1F },
        { 0x13, 0x13, 0x13 },
        { 0x0E, 0x0E, 0x0E },
        { 0x15, 0x00, 0x00 },
        { 0x1F, 0x04, 0x04 },
        { 0x02, 0x02, 0x02 },
        { 0x1F, 0x1F, 0x1F },
        { 0x1F, 0x00, 0x1F },
        { 0x1F, 0x00, 0x1F },
    },
    {
        { 0x00, 0x16, 0x14 },
        { 0x16, 0x16, 0x16 },
        { 0x17, 0x00, 0x00 },
        { 0x1F, 0x04, 0x00 },
        { 0x0E, 0x00, 0x00 },
        { 0x04, 0x08, 0x1F },
        { 0x1F, 0x1F, 0x13 },
        { 0x1F, 0x1B, 0x00 },
        { 0x13, 0x0A, 0x00 },
        { 0x1F, 0x15, 0x0A },
        { 0x00, 0x15, 0x02 },
        { 0x0E, 0x1F, 0x00 },
        { 0x04, 0x04, 0x04 },
        { 0x1F, 0x1F, 0x1F },
        { 0x0E, 0x0E, 0x0E },
        { 0x1F, 0x13, 0x00 },
    },
    {
        { 0x00, 0x17, 0x06 },
        { 0x15, 0x19, 0x1B },
        { 0x1D, 0x08, 0x13 },
        { 0x1F, 0x13, 0x17 },
        { 0x17, 0x04, 0x0A },
        { 0x00, 0x15, 0x00 },
        { 0x0E, 0x0E, 0x0E },
        { 0x13, 0x13, 0x13 },
        { 0x13, 0x0A, 0x00 },
        { 0x1F, 0x15, 0x0A },
        { 0x15, 0x00, 0x00 },
        { 0x1F, 0x00, 0x00 },
        { 0x00, 0x00, 0x00 },
        { 0x1F, 0x1F, 0x1F },
        { 0x1F, 0x1F, 0x13 },
        { 0x1F, 0x1F, 0x00 },
    },
    {
        { 0x00, 0x12, 0x0B },
        { 0x04, 0x06, 0x0A },
        { 0x00, 0x1F, 0x00 },
        { 0x1F, 0x1F, 0x1F },
        { 0x14, 0x1F, 0x1F },
        { 0x10, 0x1C, 0x1E },
        { 0x0C, 0x18, 0x19 },
        { 0x09, 0x14, 0x15 },
        { 0x00, 0x0E, 0x10 },
        { 0x00, 0x1F, 0x00 },
        { 0x1F, 0x16, 0x18 },
        { 0x1F, 0x0A, 0x10 },
        { 0x1F, 0x1E, 0x00 },
        { 0x19, 0x18, 0x00 },
        { 0x13, 0x0A, 0x00 },
        { 0x1F, 0x00, 0x00 },
    },
};

const u16 sZoneLoadingCharacterColors[NUM_CHARACTERS] = {
    [CHARACTER_SONIC] = RGB16(0, 0, 31),    [CHARACTER_CREAM] = RGB16(31, 18, 0), [CHARACTER_TAILS] = RGB16(31, 27, 0),
    [CHARACTER_KNUCKLES] = RGB16(31, 3, 0), [CHARACTER_AMY] = RGB16(31, 17, 21),
};

const u16 sScreenPositions_ZoneLoadingActLetters[4][2] = {
    { DISPLAY_WIDTH - 108, DISPLAY_HEIGHT - 63 }, // A
    { DISPLAY_WIDTH - 87, DISPLAY_HEIGHT - 59 }, // C
    { DISPLAY_WIDTH - 66, DISPLAY_HEIGHT - 55 }, // T
    { DISPLAY_WIDTH - 44, DISPLAY_HEIGHT - 51 }, // 1|2
};

const s16 gUnknown_080D7130[6] = { 10, -8, 6, -4, 2, 0 };

typedef struct {
    /* 0x00 */ u32 counter;
    /* 0x04 */ bool8 skippedIntro;
} IntroController; /* size: 0x8 */

typedef struct {
    u16 y;
    u16 angle;
} ScreenMaskValues;

// TODO: Are IntroBackgrounds/C/F the same struct?
typedef struct {
    /* 0x00 */ IntroController *controller;
    /* 0x04 */ ScreenFade fade;
    /* 0x10 */ ScreenMaskValues mask1;
    /* 0x14 */ ScreenMaskValues mask2;
} IntroBackgrounds; /* size: 0x18 */

typedef struct {
    /* 0x00 */ IntroController *controller;
    /* 0x04 */ Sprite sprUnlockedIcons[9];
    /* 0x1B4 */ Sprite sprCharacterLogo;
    /* 0x1E4 */ Sprite sprZoneName[4];
    /* 0x2A4 */ Sprite sprLoadingWheel;
    /* 0x2D4 */ Sprite sprLoadingWheelIcon;
    /* 0x304 */ SpriteTransform transform;
} IntroUI; /* size: 0x310 */

typedef struct {
    /* 0x00 */ IntroController *controller;
    /* 0x04 */ Sprite sprZoneNames[4];
} IntroActLetters; /* size: 0xC4 */

static void Task_IntroControllerMain(void);
static void Task_802F9F8(void);
static void Task_IntroColorAnimation(void);
static void Task_IntroZoneNameAndIconAnimations(void);
static void Task_IntroActLettersAnimations(void);
static void Task_UpdateStageLoadingScreen(void);
static void TaskDestructor_IntroController(struct Task *);
static void TaskDestructor_Dummy(struct Task *);
static void TaskDestructor_803045C(struct Task *);
static void TaskDestructor_8030474(struct Task *);

struct Task *SetupStageIntro(void)
{
    struct Task *t; // sp04
    IntroController *introController; // sp08
    struct Task *t2;
    ScreenFade *fade;
    IntroBackgrounds *introBackgrounds;
    // SITaskC *sit_c;
    IntroUI *introUI; // r8
    IntroActLetters *introActLetters;
    // SITaskF *sit_f;
    ScreenMaskValues *mask;
    void *tilesCursor;
    Sprite *s;
    u8 i; // r7

    gStageFlags |= STAGE_FLAG__ACT_START;
    gStageFlags |= STAGE_FLAG__100;

    // NOTE: null when Super Sonic
#ifdef BUG_FIX
    if (gPlayer.spriteInfoBody)
#endif
        gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG_MASK_18;
#ifdef BUG_FIX
    if (gPlayer.spriteInfoLimbs)
#endif
        gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG_MASK_18;

    gActiveBossTask = NULL;

    t = TaskCreate(Task_IntroControllerMain, sizeof(IntroController), 0x2200, 0, TaskDestructor_IntroController);
    introController = TASK_DATA(t);
    introController->counter = 2;
    introController->skippedIntro = FALSE;

    gPlayer.moveState |= MOVESTATE_100000;

    t2 = TaskCreate(Task_802F9F8, sizeof(IntroBackgrounds), 0x2210, 0, TaskDestructor_Dummy);
    introBackgrounds = TASK_DATA(t2);
    introBackgrounds->controller = introController;

    fade = &introBackgrounds->fade;
    fade->window = 0;
    fade->brightness = 0;
    fade->flags = SCREEN_FADE_FLAG_2;
    fade->speed = 0;
    fade->bldCnt = BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_EFFECT_BLEND;
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    t2 = TaskCreate(Task_IntroColorAnimation, sizeof(IntroBackgrounds), 0x2220, 0, TaskDestructor_Dummy);
    introBackgrounds = TASK_DATA(t2);
    introBackgrounds->controller = introController;

    mask = &introBackgrounds->mask1;
    mask->y = 0;
    mask->angle = 0;

    mask = &introBackgrounds->mask2;
    mask->y = 0;
    mask->angle = 0;

    t2 = TaskCreate(Task_IntroZoneNameAndIconAnimations, sizeof(IntroUI), 0x2230, 0, TaskDestructor_803045C);
    introUI = TASK_DATA(t2);
    introUI->controller = introController;

    if (IS_SINGLE_PLAYER) {
        tilesCursor = VramMalloc(
            zoneLoadingCharacterLogos[gSelectedCharacter][0] + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0]
            + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0] + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0]
            + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0]
            + ({ zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24; }) + (sZoneUnlockedIcons[0][0] * NUM_ZONE_UNLOCKED_ICONS));
    } else {
        tilesCursor = VramMalloc(
            zoneLoadingCharacterLogos[gSelectedCharacter][0] + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0]
            + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0] + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0]
            + zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0]
            + ({ zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24; }));
    }

    /*     Init Character Logo     */
    s = &introUI->sprCharacterLogo;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    // Advance cursor to next collection of tiles
    tilesCursor += zoneLoadingCharacterLogos[gSelectedCharacter][0] * TILE_SIZE_4BPP;

    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = zoneLoadingCharacterLogos[gSelectedCharacter][1];
    s->variant = zoneLoadingCharacterLogos[gSelectedCharacter][2];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    }

    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_ZONE_NAME_PARTS; i++) {
        u32 nameIndex;

        s = &introUI->sprZoneName[i];
        s->x = 0;
        s->y = 0;

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_TA53 + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else if ((gCurrentLevel & 0x3) == ACT_BOSS) {
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_BOSS_ATK + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else {
            s->graphics.dest = tilesCursor;

            tilesCursor += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][1];
            s->variant = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][2];
        }
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
    }

    /*    Loading Wheel in upper-left corner    */
    s = &introUI->sprLoadingWheel;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;
    tilesCursor += 36 * TILE_SIZE_4BPP;

    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_STAGE_INTRO_LOADING_WHEEL;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
    UpdateSpriteAnimation(s);

    /*    Icon inside the loading wheel    */
    s = &introUI->sprLoadingWheelIcon;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    tilesCursor += zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] * TILE_SIZE_4BPP;
    s->graphics.anim = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][2];

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        s->graphics.anim = zoneLoadingIcons[INTRO_ICON_TRUE_AREA_53][1];
        s->variant = zoneLoadingIcons[INTRO_ICON_TRUE_AREA_53][2];
    }

    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant |= -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = (gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE);
    UpdateSpriteAnimation(s);

    /*    The icons of all unlocked zones in the upper-right    */
    if (IS_SINGLE_PLAYER) {
        for (i = 0; i < NUM_INTRO_STAGE_ICONS; i++) {
            s = &introUI->sprUnlockedIcons[i];
            s->x = 0;
            s->y = -32;
            s->graphics.dest = tilesCursor;
            tilesCursor += sZoneUnlockedIcons[0][0] * TILE_SIZE_4BPP;

            if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                if (i == INTRO_ICON_TRUE_AREA_53) {
                    // TODO: The macro names don't line up right now.
                    //       (i == TA53, but icon index for Boss Attack)
                    s->graphics.anim = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][1];
                    s->variant = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][2];
                } else {
                    s->graphics.anim = sZoneUnlockedIcons[i][1];
                    s->variant = sZoneUnlockedIcons[i][2];
                }
            } else if (i == LEVEL_TO_ZONE(gCurrentLevel)) {
                s->graphics.anim = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][1];
                s->variant = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][2];
            } else {
                s->graphics.anim = sZoneUnlockedIcons[i][1];
                s->variant = sZoneUnlockedIcons[i][2];
            }

            s->oamFlags = SPRITE_OAM_ORDER(4);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
            UpdateSpriteAnimation(s);
        }
    }

    /*    Act Names    */
    t2 = TaskCreate(Task_IntroActLettersAnimations, sizeof(IntroActLetters), 0x2240, 0, TaskDestructor_8030474);
    introActLetters = TASK_DATA(t2);
    introActLetters->controller = introController;
    tilesCursor = VramMalloc(sZoneLoadingActLetters[0][0] * 4);

    for (i = 0; i < 4; i++) {
        s = &introActLetters->sprZoneNames[i];
        s->x = 0;
        s->y = -32;

        s->graphics.anim = sZoneLoadingActLetters[i][1];
        s->variant = sZoneLoadingActLetters[i][2];

        // Set Act number anim (1 or 2)
        if ((i == 3) && ((ACT_INDEX(gCurrentLevel) & 1) != ACT_1)) {
            s->graphics.anim = sZoneLoadingActLetters[4][1];
            s->variant = sZoneLoadingActLetters[4][2];
        }

        s->graphics.dest = tilesCursor;
        tilesCursor += sZoneLoadingActLetters[0][0] * TILE_SIZE_4BPP;

        s->oamFlags = SPRITE_OAM_ORDER(2);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }

    t2 = TaskCreate(Task_UpdateStageLoadingScreen, sizeof(IntroBackgrounds), 0x22F0, 0, TaskDestructor_Dummy);
    introBackgrounds = TASK_DATA(t2);
    introBackgrounds->controller = introController;

    return t;
}

static void Task_IntroControllerMain(void)
{
    IntroController *introController = TASK_DATA(gCurTask);
    u32 frameCounter = introController->counter;
    frameCounter++;

    /*    Allow player to skip the intro animation    */
    if ((IS_SINGLE_PLAYER) && !IS_BOSS_STAGE(gCurrentLevel)) {
        if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
            gPlayer.moveState &= ~MOVESTATE_100000;
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            frameCounter = 200;
            introController->skippedIntro = TRUE;
        }
    }
    introController->counter = frameCounter;

    gPlayerBodyPSI.s.frameFlags &= ~(SPRITE_FLAG_MASK_OBJ_MODE);

    if (frameCounter < 150) {
        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    } else if (frameCounter == 151) {
        gPlayer.moveState &= ~MOVESTATE_100000;
    } else if (frameCounter >= 150 && frameCounter <= 166) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    }

    /*    Set player animation to "Getting Ready" and delay until it is finished    */
    if ((frameCounter == (200 - sGettingReadyAnimationDuration[gSelectedCharacter])) && (gBossIndex == 0)
        && (ACT_INDEX(gCurrentLevel) != ACT_BOSS)) {
        Player *p = &gPlayer;
        p->anim = characterAnimsGettingReady[gSelectedCharacter].anim;
        p->variant = characterAnimsGettingReady[gSelectedCharacter].variant;
        p->unk6C = TRUE;

        // NOTE: null when Super Sonic
#ifdef BUG_FIX
        if (p->spriteInfoBody != NULL)
#endif
        {
            p->spriteInfoBody->s.frameFlags |= MOVESTATE_40000;

#ifdef BUG_FIX
            if (p->spriteInfoLimbs != NULL)
#endif
            {
                p->spriteInfoLimbs->s.frameFlags |= MOVESTATE_40000;
            }

            if (IS_MULTI_PLAYER) {
                p->spriteInfoBody->s.palId = SIO_MULTI_CNT->id;
            } else {
                p->spriteInfoBody->s.palId = 0;
            }
        }
    }

    /*    Call all initializations necessary for current stage and destroy this Task */
    if (frameCounter > 200) {
        gStageFlags &= ~STAGE_FLAG__100;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                // Create the 1st boss (for Boss Rush)
                if (gBossIndex == 0) {
                    CreateZoneBoss(BOSS_EGG_HAMMER_TANK_II);
                }
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                CreateZoneBoss(BOSS_TRUE_AREA_53_BOSS);
                gDispCnt |= DISPCNT_BG1_ON;
            } else {
                CreateZoneBoss(LEVEL_TO_ZONE(gCurrentLevel));
            }

            gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
            gStageFlags &= ~STAGE_FLAG__ACT_START;
        } else {
            if (gBossIndex == 0) {
                CreateCourseStartCountdown(introController->skippedIntro);
            } else {
                gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
                gStageFlags &= ~STAGE_FLAG__ACT_START;
            }
        }
        if (IS_MULTI_PLAYER) {
            sub_8018818();
        } else {
            gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_18;
        }
        CreateStageUI();
        TaskDestroy(gCurTask);
        CreateBoostEffectTasks();
    }
}

static void Task_802F9F8(void)
{
    IntroBackgrounds *introBackgrounds = TASK_DATA(gCurTask);
    IntroController *controller = introBackgrounds->controller; // sp00
    ScreenFade *fade = &introBackgrounds->fade;
    s32 frameCounter = controller->counter;
    u8 i;
    u8 r, g, b;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);

    if ((unsigned)frameCounter >= 150) {
        frameCounter -= 150;

        if ((unsigned)frameCounter >= (166 - 150)) {
            frameCounter = 16;
        }
        fade->brightness = frameCounter << 9;

        if (((frameCounter << 25) >> 16) >= 0x2000) {
            fade->brightness = 0x2000;
        }
        // _0802FA4C

        if (IS_SINGLE_PLAYER) {
            // _0802FA4C+8
            for (i = 0; i < 16; i++) {
                r = gUnknown_080D6FF5[gSelectedCharacter][i][0];
                r = (r * frameCounter) / 16u;
                g = ((gUnknown_080D6FF5[gSelectedCharacter][i][1] * frameCounter) / 16u);
                b = ((gUnknown_080D6FF5[gSelectedCharacter][i][2] * frameCounter) / 16u);

                gObjPalette[i] = RGB16_REV(r, g, b);

                if (gCheese != NULL) {
                    r = gUnknown_080D6FF5[5][i][0];
                    r = (r * frameCounter) / 16u;
                    g = ((gUnknown_080D6FF5[5][i][1] * frameCounter) / 16u);
                    b = ((gUnknown_080D6FF5[5][i][2] * frameCounter) / 16u);

                    gObjPalette[14 * 16 + i] = RGB16_REV(r, g, b);
                }
            }
        } else {
            // _0802FB28
            u8 sid;

            for (sid = 0; sid < MULTI_SIO_PLAYERS_MAX; sid++) {
                if (GetBit(gMultiplayerConnections, sid)) {
                    for (i = 0; i < 16; i++) {
                        r = gUnknown_080D6FF5[(gMultiplayerCharacters)[sid]][i][0];
                        r = (r * frameCounter) / 16u;
                        g = ((gUnknown_080D6FF5[(gMultiplayerCharacters)[sid]][i][1] * frameCounter) / 16u);
                        b = ((gUnknown_080D6FF5[(gMultiplayerCharacters)[sid]][i][2] * frameCounter) / 16u);

                        gObjPalette[sid * 16 + i] = RGB16_REV(r, g, b);
                    }
                }
            }

            if (gCheese != NULL) {
                for (i = 0; i < 16; i++) {
                    r = gUnknown_080D6FF5[5][i][0];
                    r = (r * frameCounter) / 16u;
                    g = ((gUnknown_080D6FF5[5][i][1] * frameCounter) / 16u);
                    b = ((gUnknown_080D6FF5[5][i][2] * frameCounter) / 16u);

                    gObjPalette[14 * 16 + i] = RGB16_REV(r, g, b);
                }
            }
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        fade->bldCnt = 0x3FCF;
        UpdateScreenFade(fade);

        // TODO: Use #defines here
        gWinRegs[WINREG_WININ] = 0x1F3F;
        gWinRegs[WINREG_WINOUT] = 0x1F;

    } else {
        // _0802FC5C
        fade->bldCnt = 0x30EF;
        UpdateScreenFade(fade);

        gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);
        gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_OBJ | WINOUT_WINOBJ_OBJ);
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gWinRegs[WINREG_WININ] &= ~(WININ_WIN0_BG1 | WININ_WIN0_BG2);
    }
    // _0802FC86

    /* Setup window registers and destroy this Task */
    if (controller->counter >= 200) {
        gBldRegs.bldY = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldAlpha = 0;

        gWinRegs[WINREG_WIN0H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] = 0;
        gWinRegs[WINREG_WINOUT] = 0;

        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
        } else {
            // Level: True Area 53
            gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON);
            gWinRegs[WINREG_WINOUT] = (WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR | WINOUT_WINOBJ_BG0 | WINOUT_WINOBJ_BG1 | WINOUT_WINOBJ_BG2
                                       | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2);

            gBldRegs.bldCnt
                = (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2);
            gBldRegs.bldAlpha = 1028;
#ifdef BUG_FIX
            gBldRegs.bldY = SCREEN_FADE_BLEND_MAX;
#else
            gBldRegs.bldY = 1028;
#endif
        }

        TaskDestroy(gCurTask);
    }
}

static void Task_IntroColorAnimation(void)
{
    IntroBackgrounds *introBackgrounds = TASK_DATA(gCurTask);

    IntroController *controller = introBackgrounds->controller;
    ScreenMaskValues *mask1 = &introBackgrounds->mask1;
    ScreenMaskValues *mask2 = &introBackgrounds->mask2;
    u32 counter = controller->counter;

    if (counter > INTROFRAME_VISIBLE) {
        u32 innerCount = counter - INTROFRAME_VISIBLE;

        mask1->angle = DEG_TO_SIN(0);
        mask1->y = DISPLAY_HEIGHT;
        mask2->angle = DEG_TO_SIN(180);
        mask2->y = 0;

        if (innerCount < INTROFRAME_NAME_AND_BANNER) {
            /* Bottom left */
            mask1->angle = -(innerCount * (DISPLAY_WIDTH / INTROFRAME_NAME_AND_BANNER)) + (DISPLAY_WIDTH + DEG_TO_SIN(5.625));
            mask1->y = (DISPLAY_HEIGHT / 2) + 8;

            if (innerCount >= INTROFRAME_BANNER_APPEARS) {
                /* Top Banner */
                innerCount = counter - INTROFRAME_BANNER_APPEARS;

                mask2->angle = DEG_TO_SIN(180);
                mask2->y = innerCount * 5;
            }
        } else if (counter < INTROFRAME_PAUSE_ON_BANNER) {
            /* Keep the Bottom-Left Triangle and Banner on-screen until 2 seconds have
             * passed (and stage name + all icons left the screen) */
            mask1->angle = DEG_TO_SIN(190.546875);
            mask1->y = DISPLAY_HEIGHT - 23;
            mask2->angle = DEG_TO_SIN(180);
            mask2->y = 16;
        } else if (counter < INTROFRAME_CLEAR_BANNER) {
            /* Clear the BL-Triangle and Banner */
            innerCount = counter - INTROFRAME_PAUSE_ON_BANNER;

            mask1->angle = DEG_TO_SIN(190.546875) - (innerCount * DEG_TO_SIN(6.328125));
            mask1->y = -(innerCount * 2) + (DISPLAY_HEIGHT - 23);
            mask2->angle = DEG_TO_SIN(180) - (innerCount * DEG_TO_SIN(5.625));
            mask2->y = counter - 104;
        } else if (counter >= INTROFRAME_FADE_GAMEPLAY) {
            /* Clean up after the animation finished */
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

            TaskDestroy(gCurTask);
            return;
        } else {
            /* INTROFRAME_CLEAR_BANNER <= counter < INTROFRAME_FADE_GAMEPLAY */
            /* Transition to single Bottom-Right triangle (which is a sprite!) that
             * highlights the Act's name */
            innerCount = counter - INTROFRAME_CLEAR_BANNER;
            mask1->angle = DEG_TO_SIN(191.25) - (innerCount * DEG_TO_SIN(2.109375));
            mask1->y = innerCount * ((DISPLAY_HEIGHT - 62) / 14);
            mask2->angle = 0;
        }
    }

    gHBlankCopySize = sizeof(winreg_t);
    gHBlankCopyTarget = (void *)&REG_WIN0H;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    InitHBlankBgOffsets(DISPLAY_WIDTH);

    if (counter > INTROFRAME_NAME_AND_BANNER) {
        ScreenMask_Lower_OriginRight(mask1->y, mask1->angle);
        ScreenMask_Upper_OriginRight(mask2->y, mask2->angle);
        // controller->counter = INTROFRAME_NAME_AND_BANNER;
    } else {
        ScreenMask_Lower_OriginLeft(mask1->y, mask1->angle);
        ScreenMask_Upper_OriginRight(mask2->y, mask2->angle);
    }
}

static void StageIntroUpdateIcons(void)
{
    IntroUI *introUI = TASK_DATA(gCurTask);
    u32 counter = introUI->controller->counter;
    Sprite *s;
    SpriteTransform *transform;
    s32 i;
    s32 sineVal;

    /* Colored Character Logo */
    s = &introUI->sprCharacterLogo;
    DisplaySprite(s);

    /* Zone Name */
    for (i = 0; i < ARRAY_COUNT(introUI->sprZoneName); i++) {
        s = &introUI->sprZoneName[i];
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    /* Icons of unlocked Zones */
    if (IS_SINGLE_PLAYER) {
        for (i = 0; i < ARRAY_COUNT(introUI->sprUnlockedIcons); i++) {
            s = &introUI->sprUnlockedIcons[i];
            DisplaySprite(s);
        }
    }

    /* The top-left Loading Wheel */
    s = &introUI->sprLoadingWheel;
    if (counter >= 30) {
        if (counter == 30) {
            s->graphics.anim = SA2_ANIM_STAGE_INTRO_LOADING_WHEEL;
            s->variant = 1;
            s->prevVariant = -1;
        }
        UpdateSpriteAnimation(s);
    }
    DisplaySprite(s);

    /* The Zone's icon inside the Loading Wheel */
    s = &introUI->sprLoadingWheelIcon;
    transform = &introUI->transform;
    sineVal = SIN_24_8((counter * 24) & ONE_CYCLE);

    if (sineVal == Q(1.0)) {
        sineVal = Q(1.0) - 1;
    }
    if (sineVal == Q(0.0)) {
        sineVal = Q(0.0) + 4;
    }

    transform->rotation = 0;
    transform->qScaleX = sineVal;
    transform->qScaleY = Q(1.0);
    transform->x = s->x;
    transform->y = s->y;

    TransformSprite(s, transform);
    DisplaySprite(s);
}

static inline int InlineIconsCalc(u8 arg0, int arg1) { return (arg0 * arg1) - 22; }

static void Task_IntroZoneNameAndIconAnimations(void)
{
    IntroUI *introUI = TASK_DATA(gCurTask);
    u32 counter = introUI->controller->counter;
    Sprite *s;
    u32 i;
    u8 counterByte;

    if (counter - 10 > 124) {
        if (counter >= 200) {
            TaskDestroy(gCurTask);
            return;
        }

        if (counter >= 150) {
            // _0802FFD2
            s = &introUI->sprCharacterLogo;

            if (counter == 150) {
                s->graphics.anim = sColoredTriangle[gSelectedCharacter].anim;
                s->variant = sColoredTriangle[gSelectedCharacter].variant;
                s->palId = 0;
                s->prevVariant = -1;
                s->x = DISPLAY_WIDTH;
                s->y = DISPLAY_HEIGHT;
                s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
            } else if (counter >= 190) {
                s->x += 4;
                s->y += 4;
            }

            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
        return;
    }

    // _0803004E
    counter -= 9;

    s = &introUI->sprCharacterLogo;

    if (counter <= 12) {
        s->x = 254 - (((counter * 75) << 6) >> 8);
        s->y = ((DISPLAY_HEIGHT / 2) + 41) - (((counter * 123) << 3) >> 8);

    } else if (counter <= 100) {
        // _08030078
        s->x = 254 - (((13 * 75) << 6) >> 8) + 13;
        s->y = ((DISPLAY_HEIGHT / 2) + 41) - (((13 * 123) << 3) >> 8) + 2;
    } else {
        // _08030086
        u32 innerCount = counter - (100 - 12);
        s->x = 254 - (((innerCount * 75) << 6) >> 8);
        s->y = ((DISPLAY_HEIGHT / 2) + 41) - (((innerCount * 123) << 3) >> 8);
    }

    // _080300AE
    for (i = 0; i < ARRAY_COUNT(introUI->sprZoneName); i++) {
        s = &introUI->sprZoneName[i];

        if (counter <= 12) {
            s->x = 284 - (((counter * 75) << 6) >> 8);
            s->y = ((DISPLAY_HEIGHT / 2) + 47) - (((counter * 123) << 3) >> 8);
        } else if (counter <= 100) {
            s->x = 284 - (((13 * 75) << 6) >> 8) + 13;
            s->y = ((DISPLAY_HEIGHT / 2) + 47) - (((13 * 123) << 3) >> 8) + 2;
        } else {
            s->x = 284 - ((((counter - (100 - 12)) * 75) << 6) >> 8);
            s->y = ((DISPLAY_HEIGHT / 2) + 47) - ((((counter - (100 - 12)) * 123) << 3) >> 8);
        }
        // _0803012A

        // TODO: This looks like a programmer added a @HACK here?
        if (i == 3) {
            s->x -= 24;
        }
    }
    // _08030134+8

    counterByte = counter;
    for (i = 0; i < ARRAY_COUNT(introUI->sprUnlockedIcons); i++) {
        s32 x, y;
// _08030170
#ifndef NON_MATCHING
        register u32 lastIconIndex asm("r0");
#else
        u32 lastIconIndex;
#endif
        lastIconIndex = ((ARRAY_COUNT(introUI->sprUnlockedIcons) - 1) - i);
        s = &introUI->sprUnlockedIcons[lastIconIndex];

        x = (DISPLAY_WIDTH - (ARRAY_COUNT(introUI->sprUnlockedIcons) * 17) - ((ARRAY_COUNT(introUI->sprUnlockedIcons) + 1) * 2))
            + lastIconIndex * 17;
        s->x = x;

        y = -22;
        s->y = y;

        if (counterByte < 50) {
            if (counterByte >= i * 2) {
                if (!(i & 1)) {
                    s32 offset = i * -20;
                    if (counterByte + (i * -2) < 5) {
                        s->y = InlineIconsCalc(counterByte, 10) + offset;
                    } else {
                        s->y = 20;
                    }
                } else {
                    // _080301B2
                    if ((counterByte + (i * -2)) < 5) {
                        s->y = ((counterByte + (i * -2)) * 6) - 22;
                    } else {
                        s->y = 12;
                    }
                }
            }
        } else if (counter < 100) {
            // _080301C8+4
            if (!(i & 1)) {
                s->y = 20;
            } else {
                s->y = 12;
            }
        } else {
            // _080301E0
            if (!(i & 1)) {
                s->y = 20 - (counter - 100) * 6;

            } else {
                s->y = 12 - (counter - 100) * 6;
            }
        }
    }

    /* Loading Wheel */
    s = &introUI->sprLoadingWheel;
    s->x = 36;

    if (counter <= 16) {
        s->y = -48;
    } else if (counter <= 25) {
        counterByte = counter - 16;
        s->y = (counterByte * 8) - 40;
    } else if (counter <= 100) {
        s->y = 32;
    } else {
        counterByte = counter - 100;
        s->y = 32 - (counterByte * 8);
    }

    // _08030240
    /* Loading Wheel Icon */
    s = &introUI->sprLoadingWheelIcon;
    s->frameFlags = (gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE);
    s->x = 35;

    if (counter <= 16) {
        s->y = -49;
    } else if (counter <= 25) {
        counterByte = counter - 16;
        s->y = (counterByte * 8) - 41;
    } else if (counter <= 100) {
        s->x = 35;
        s->y = 32;
    } else {
        counterByte = counter - 100;
        s->y = 32 - (counterByte * 8);
    }

    StageIntroUpdateIcons();
}

static inline void sub_8030488_inline()
{
    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS) && (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_FINAL)) {
        IntroActLetters *introActLetters = TASK_DATA(gCurTask);
        u8 i;

        for (i = 0; i < ARRAY_COUNT(introActLetters->sprZoneNames); i++) {
            if ((i * 3) < (introActLetters->controller->counter - 150)) {
                Sprite *s = &introActLetters->sprZoneNames[i];
                DisplaySprite(s);
            }
        }
    }
}

void Task_IntroActLettersAnimations(void)
{
    IntroActLetters *introActLetters = TASK_DATA(gCurTask);
    u32 counter = introActLetters->controller->counter;
    Sprite *s;
    u32 i;
    s32 y;

    if ((counter - 151) >= 40) {
        if (counter >= 200) {
            TaskDestroy(gCurTask);
            return;
        }
    } else {
        counter -= 150;

        if (counter < 14) {
            for (i = 0; i < ARRAY_COUNT(introActLetters->sprZoneNames); i++) {
                s = &introActLetters->sprZoneNames[i];

                y = counter - i * 3;
                if (y >= 4)
                    y = 4;

                y *= 8;

                s->x = sScreenPositions_ZoneLoadingActLetters[i][0];

                y = (y - 32);
                s->y = y + sScreenPositions_ZoneLoadingActLetters[i][1];
            }
        } else if (counter < 18) {
            counter -= 13;

            y = gUnknown_080D7130[counter];

            for (i = 0; i < ARRAY_COUNT(introActLetters->sprZoneNames); i++) {
                s = &introActLetters->sprZoneNames[i];
                s->x = sScreenPositions_ZoneLoadingActLetters[i][0];
                s->y = sScreenPositions_ZoneLoadingActLetters[i][1] + y;
            }
        } else {
            for (i = 0; i < ARRAY_COUNT(introActLetters->sprZoneNames); i++) {
                s = &introActLetters->sprZoneNames[i];
                s->x = sScreenPositions_ZoneLoadingActLetters[i][0];
                s->y = sScreenPositions_ZoneLoadingActLetters[i][1];
            }
        }

        sub_8030488_inline();
    }
}

static void TaskDestructor_IntroController(struct Task *t)
{
    if (gCurrentLevel == LEVEL_INDEX(ZONE_1, ACT_1)) {
        InitWaterPalettes();
    }

    if (IS_SINGLE_PLAYER) {
        gStageFlags &= ~STAGE_FLAG__DISABLE_PAUSE_MENU;
    }
}

static void Task_UpdateStageLoadingScreen(void)
{
    IntroBackgrounds *introBackgrounds = TASK_DATA(gCurTask);
    u32 counter = introBackgrounds->controller->counter;

    gBgPalette[0] = sZoneLoadingCharacterColors[gSelectedCharacter];

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    if (counter >= 200) {
        TaskDestroy(gCurTask);
        return;
    }
}

static void TaskDestructor_Dummy(struct Task *t) { }

static void TaskDestructor_803045C(struct Task *t)
{
    IntroUI *introUI = TASK_DATA(t);
    VramFree(introUI->sprCharacterLogo.graphics.dest);
}

static void TaskDestructor_8030474(struct Task *t)
{
    IntroActLetters *introActLetters = TASK_DATA(t);
    VramFree(introActLetters->sprZoneNames[0].graphics.dest);
}

// NOTE: This only matches with the code being copy-pasted,
//       not using the inline function
//       defined above for some reason...
static void sub_8030488(void)
{
#ifndef NON_MATCHING
    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS) && (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_FINAL)) {
        IntroActLetters *introActLetters = TASK_DATA(gCurTask);
        u8 i;

        for (i = 0; i < ARRAY_COUNT(introActLetters->sprZoneNames); i++) {
            if ((i * 3) < (introActLetters->controller->counter - 150)) {
                Sprite *s = &introActLetters->sprZoneNames[i];
                DisplaySprite(s);
            }
        }
    }
#else
    sub_8030488_inline();
#endif
}
