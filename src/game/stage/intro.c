#include "global.h"
#include "flags.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/countdown.h"
#include "game/player_actions.h"
#include "game/player_mp_actor.h"
#include "game/screen_transition.h"
#include "game/stage/ui.h"

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

// The colored logo next to the stage name
static const u16 zoneLoadingCharacterLogos[NUM_CHARACTERS][3] = {
    [CHARACTER_SONIC] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 0 },
    [CHARACTER_CREAM] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 3 },
    [CHARACTER_TAILS] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 1 },
    [CHARACTER_KNUCKLES] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 2 },
    [CHARACTER_AMY] = { 9, SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO, 4 },
};

static const u16
    zoneLoadingZoneNames[NUM_INTRO_UNLOCKED_STAGES_ICONS * NUM_ZONE_NAME_PARTS][3]
    = {
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
    [CHARACTER_SONIC]
    = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_SONIC), 0 },
    [CHARACTER_CREAM]
    = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_CREAM), 0 },
    [CHARACTER_TAILS]
    = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_TAILS), 0 },
    [CHARACTER_KNUCKLES]
    = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_KNUCKLES), 0 },
    [CHARACTER_AMY]
    = { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_AMY), 0 },
};

// TODO: static
// Colored triangles used for each character (botton-right)
const TileInfo sColoredTriangle[NUM_CHARACTERS] = {
    [CHARACTER_SONIC] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 0 },
    [CHARACTER_CREAM] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 4 },
    [CHARACTER_TAILS] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 1 },
    [CHARACTER_KNUCKLES] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 2 },
    [CHARACTER_AMY] = { 0x54, SA2_ANIM_STAGE_INTRO_TRIANGLES, 3 },
};

static const u8 sGettingReadyAnimationDuration[NUM_CHARACTERS]
    = { [CHARACTER_SONIC] = 40,
        [CHARACTER_CREAM] = 55,
        [CHARACTER_TAILS] = 52,
        [CHARACTER_KNUCKLES] = 40,
        [CHARACTER_AMY] = 40 };

// TODO: static
//       This is u8[][3], each byte being one RGB channel(0-31)
#if 0
extern const u8 gUnknown_080D6FF5[];
#else
const u8 gUnknown_080D6FF5[][3] = {
    { 0x00, 0x17, 0x06 }, { 0x16, 0x16, 0x16 }, { 0x00, 0x04, 0x13 },
    { 0x00, 0x08, 0x1D }, { 0x00, 0x00, 0x0C }, { 0x00, 0x13, 0x00 },
    { 0x1F, 0x1F, 0x13 }, { 0x1F, 0x1B, 0x00 }, { 0x13, 0x0A, 0x02 },
    { 0x1F, 0x15, 0x0A }, { 0x15, 0x00, 0x00 }, { 0x1F, 0x04, 0x04 },
    { 0x04, 0x04, 0x04 }, { 0x1F, 0x1F, 0x1F }, { 0x0E, 0x0E, 0x0E },
    { 0x00, 0x13, 0x1F }, { 0x00, 0x19, 0x14 }, { 0x19, 0x19, 0x19 },
    { 0x1F, 0x0B, 0x00 }, { 0x1F, 0x12, 0x00 }, { 0x19, 0x05, 0x00 },
    { 0x1C, 0x0B, 0x00 }, { 0x13, 0x00, 0x00 }, { 0x1F, 0x1C, 0x17 },
    { 0x1D, 0x18, 0x10 }, { 0x13, 0x0F, 0x08 }, { 0x1F, 0x1E, 0x00 },
    { 0x08, 0x11, 0x1F }, { 0x02, 0x02, 0x02 }, { 0x1F, 0x1F, 0x1F },
    { 0x0E, 0x0E, 0x0E }, { 0x1F, 0x00, 0x1F }, { 0x00, 0x17, 0x06 },
    { 0x1F, 0x00, 0x1F }, { 0x1D, 0x11, 0x04 }, { 0x1F, 0x17, 0x04 },
    { 0x17, 0x0A, 0x02 }, { 0x15, 0x19, 0x1B }, { 0x00, 0x13, 0x1F },
    { 0x04, 0x08, 0x1F }, { 0x13, 0x13, 0x13 }, { 0x0E, 0x0E, 0x0E },
    { 0x15, 0x00, 0x00 }, { 0x1F, 0x04, 0x04 }, { 0x02, 0x02, 0x02 },
    { 0x1F, 0x1F, 0x1F }, { 0x1F, 0x00, 0x1F }, { 0x1F, 0x00, 0x1F },
    { 0x00, 0x16, 0x14 }, { 0x16, 0x16, 0x16 }, { 0x17, 0x00, 0x00 },
    { 0x1F, 0x04, 0x00 }, { 0x0E, 0x00, 0x00 }, { 0x04, 0x08, 0x1F },
    { 0x1F, 0x1F, 0x13 }, { 0x1F, 0x1B, 0x00 }, { 0x13, 0x0A, 0x00 },
    { 0x1F, 0x15, 0x0A }, { 0x00, 0x15, 0x02 }, { 0x0E, 0x1F, 0x00 },
    { 0x04, 0x04, 0x04 }, { 0x1F, 0x1F, 0x1F }, { 0x0E, 0x0E, 0x0E },
    { 0x1F, 0x13, 0x00 }, { 0x00, 0x17, 0x06 }, { 0x15, 0x19, 0x1B },
    { 0x1D, 0x08, 0x13 }, { 0x1F, 0x13, 0x17 }, { 0x17, 0x04, 0x0A },
    { 0x00, 0x15, 0x00 }, { 0x0E, 0x0E, 0x0E }, { 0x13, 0x13, 0x13 },
    { 0x13, 0x0A, 0x00 }, { 0x1F, 0x15, 0x0A }, { 0x15, 0x00, 0x00 },
    { 0x1F, 0x00, 0x00 }, { 0x00, 0x00, 0x00 }, { 0x1F, 0x1F, 0x1F },
    { 0x1F, 0x1F, 0x13 }, { 0x1F, 0x1F, 0x00 }, { 0x00, 0x12, 0x0B },
    { 0x04, 0x06, 0x0A }, { 0x00, 0x1F, 0x00 }, { 0x1F, 0x1F, 0x1F },
    { 0x14, 0x1F, 0x1F }, { 0x10, 0x1C, 0x1E }, { 0x0C, 0x18, 0x19 },
    { 0x09, 0x14, 0x15 }, { 0x00, 0x0E, 0x10 }, { 0x00, 0x1F, 0x00 },
    { 0x1F, 0x16, 0x18 }, { 0x1F, 0x0A, 0x10 }, { 0x1F, 0x1E, 0x00 },
    { 0x19, 0x18, 0x00 }, { 0x13, 0x0A, 0x00 }, { 0x1F, 0x00, 0x00 },
};
#endif

const u16 sZoneLoadingCharacterColors[NUM_CHARACTERS] = {
    [CHARACTER_SONIC] = RGB(0, 0, 31),  [CHARACTER_CREAM] = RGB(31, 18, 0),
    [CHARACTER_TAILS] = RGB(31, 27, 0), [CHARACTER_KNUCKLES] = RGB(31, 3, 0),
    [CHARACTER_AMY] = RGB(31, 17, 21),
};

const u16 sScreenPositions_ZoneLoadingActLetters[4][2] = {
    { DISPLAY_WIDTH - 108, DISPLAY_HEIGHT - 63 }, // A
    { DISPLAY_WIDTH - 87, DISPLAY_HEIGHT - 59 }, // C
    { DISPLAY_WIDTH - 66, DISPLAY_HEIGHT - 55 }, // T
    { DISPLAY_WIDTH - 44, DISPLAY_HEIGHT - 51 }, // 1|2
};

const u16 gUnknown_080D7130[3][2] = {
    { 10, -8 },
    { 6, -4 },
    { 2, 0 },
};

typedef struct {
    /* 0x00 */ u32 counter;
    /* 0x04 */ bool8 skippedIntro;
} SITaskA; /* size: 0x8 */

// TODO: Are SITaskB/C/F the same struct?
typedef struct {
    /* 0x00 */ SITaskA *parent;
    /* 0x04 */ struct TransitionState transition;
    /* 0x10 */ Vec2_16 unk10;
    /* 0x14 */ Vec2_16 unk14;
} SITaskB; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *parent;
    /* 0x04 */ Sprite sUnlockedIcons[9];
    /* 0x1B4 */ Sprite sCharacterLogo;
    /* 0x1E4 */ Sprite sStageName[4];
    /* 0x2A4 */ Sprite s2A4;
    /* 0x2D4 */ Sprite s2D4;
    /* 0x314 */ u8 filler4[0xC];
} SITaskD; /* size: 0x310 */

typedef struct {
    /* 0x00 */ SITaskA *parent;
    /* 0x04 */ Sprite sStageNames[4];
} SITaskE; /* size: 0xC4 */

void Task_802F75C(void);
void Task_802F9F8(void);
void Task_802FD34(void);
void Task_802FF94(void);
void Task_80302AC(void);
void Task_UpdateStageLoadingScreen(void);
void TaskDestructor_80303CC(struct Task *);
void TaskDestructor_nop_8030458(struct Task *);
void TaskDestructor_803045C(struct Task *);
void TaskDestructor_8030474(struct Task *);

// (99.66%) https://decomp.me/scratch/zGPtO
NONMATCH("asm/non_matching/game/stage/intro/SetupStageIntro.inc",
         struct Task *SetupStageIntro(void))
{
    struct Task *t; // sp04
    SITaskA *sit_a; // sp08
    struct Task *t2;
    SITaskB *sit_b;
    // SITaskC *sit_c;
    SITaskD *sit_d; // r8
    SITaskE *sit_e;
    // SITaskF *sit_f;
    struct TransitionState *transition;
    Vec2_16 *vec;
    void *tilesCursor;
    Sprite *s;
    u8 i; // r7

    gUnknown_03005424 |= EXTRA_STATE__ACT_START;
    gUnknown_03005424 |= EXTRA_STATE__100;

    gPlayer.unk90->s.unk10 |= SPRITE_FLAG_MASK_18;
    gPlayer.unk94->s.unk10 |= SPRITE_FLAG_MASK_18;

    gActiveBossTask = NULL;

    t = TaskCreate(Task_802F75C, sizeof(SITaskA), 0x2200, 0, TaskDestructor_80303CC);
    sit_a = TaskGetStructPtr(t);
    sit_a->counter = 2;
    sit_a->skippedIntro = FALSE;

    gPlayer.moveState |= MOVESTATE_100000;

    t2 = TaskCreate(Task_802F9F8, sizeof(SITaskB), 0x2210, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->parent = sit_a;

    transition = &sit_b->transition;
    transition->unk0 = 0;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;
    NextTransitionFrame(transition);

    t2 = TaskCreate(Task_802FD34, sizeof(SITaskB), 0x2220, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->parent = sit_a;

    vec = &sit_b->unk10;
    vec->x = 0;
    vec->y = 0;

    vec = &sit_b->unk14;
    vec->x = 0;
    vec->y = 0;

    t2 = TaskCreate(Task_802FF94, sizeof(SITaskD), 0x2230, 0, TaskDestructor_803045C);
    sit_d = TaskGetStructPtr(t2);
    sit_d->parent = sit_a;

    { // Allocate VRAM for all icon's tiles
#ifndef NON_MATCHING
        register u32 tilesToAlloc asm("r0");
#else
        u32 tilesToAlloc;
#endif
        u32 loadingIconsTiles;

        if (IS_SINGLE_PLAYER) {
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0];
            loadingIconsTiles = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24;
            tilesToAlloc += loadingIconsTiles;
            tilesToAlloc += sZoneUnlockedIcons[0][0] * NUM_ZONE_UNLOCKED_ICONS;
        } else {
            // _0802F260
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0];
            loadingIconsTiles = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24;
            tilesToAlloc += loadingIconsTiles;
        }
        tilesCursor = VramMalloc(tilesToAlloc);
    }
    // __0802F2C4

    /*     Init Character Logo     */
    s = &sit_d->sCharacterLogo;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    // Advance cursor to next collection of tiles
    tilesCursor += zoneLoadingCharacterLogos[gSelectedCharacter][0] * TILE_SIZE_4BPP;

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = zoneLoadingCharacterLogos[gSelectedCharacter][1];
    s->variant = zoneLoadingCharacterLogos[gSelectedCharacter][2];
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    }
    // _0802F34C
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_ZONE_NAME_PARTS; i++) {
        u32 nameIndex;

        // _0802F39C
        s = &sit_d->sStageName[i];
        s->x = 0;
        s->y = 0;

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_TA53 + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else if ((gCurrentLevel & 0x3) == ACT_BOSS) {
            // _0802F41C
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_BOSS_ATK + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else {
            // _0802F446
            s->graphics.dest = tilesCursor;

            tilesCursor += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][0]
                * TILE_SIZE_4BPP;
            s->graphics.anim
                = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][1];
            s->variant = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][2];
        }
        // _0802F47E
        s->unk1A = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
    }

    /*    Loading Wheel in upper-left corner    */
    s = &sit_d->s2A4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;
    tilesCursor += 36 * TILE_SIZE_4BPP;

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_STAGE_INTRO_LOADING_WHEEL;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 0);
    UpdateSpriteAnimation(s);

    /*    Icon inside the loading wheel    */
    s = &sit_d->s2D4;
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

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant |= -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = (gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE);
    UpdateSpriteAnimation(s);

    /*    The icons of all unlocked zones in the upper-right    */
    if (IS_SINGLE_PLAYER) {
        // _0802F5A8
        for (i = 0; i < NUM_INTRO_STAGE_ICONS; i++) {
            s = &sit_d->sUnlockedIcons[i];
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
                    // _0802F5FE
                    s->graphics.anim = sZoneUnlockedIcons[i][1];
                    s->variant = sZoneUnlockedIcons[i][2];
                }
            } else if (i == LEVEL_TO_ZONE(gCurrentLevel)) {
                // _0802F5F0
                s->graphics.anim = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][1];
                s->variant = sZoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][2];
            } else {
                // _0802F5FE
                s->graphics.anim = sZoneUnlockedIcons[i][1];
                s->variant = sZoneUnlockedIcons[i][2];
            }

            s->unk1A = SPRITE_OAM_ORDER(4);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->timeUntilNextFrame = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->unk10 = SPRITE_FLAG(PRIORITY, 0);
            UpdateSpriteAnimation(s);
        }
    }
    // _0802F652

    /*    Act Names    */
    t2 = TaskCreate(Task_80302AC, sizeof(SITaskE), 0x2240, 0, TaskDestructor_8030474);
    sit_e = TaskGetStructPtr(t2);
    sit_e->parent = sit_a;
    tilesCursor = VramMalloc(sZoneLoadingActLetters[0][0] * 4);

    for (i = 0; i < 4; i++) {
        s = &sit_e->sStageNames[i];
        s->x = 0;
        s->y = -32;

        s->graphics.anim = sZoneLoadingActLetters[i][1];
        s->variant = sZoneLoadingActLetters[i][2];

        // Set Act number anim (1 or 2)
        if ((i == 3) && ((ACT_INDEX(gCurrentLevel) & 0x1) != ACT_1)) {
            s->graphics.anim = sZoneLoadingActLetters[4][1];
            s->variant = sZoneLoadingActLetters[4][2];
        }

        s->graphics.dest = tilesCursor;
        tilesCursor += sZoneLoadingActLetters[0][0] * TILE_SIZE_4BPP;

        s->unk1A = SPRITE_OAM_ORDER(2);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }

    t2 = TaskCreate(Task_UpdateStageLoadingScreen, sizeof(SITaskB), 0x22F0, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->parent = sit_a;

    return t;
}
END_NONMATCH

void Task_802F75C(void)
{
    SITaskA *sit_a = TaskGetStructPtr(gCurTask);
    u32 frameCounter = sit_a->counter;
    frameCounter++;

    /*    Allow player to skip the intro animation    */
    if ((IS_SINGLE_PLAYER) && !IS_BOSS_STAGE(gCurrentLevel)) {
        if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
            gPlayer.moveState &= ~MOVESTATE_100000;
            gPlayer.moveState &= ~MOVESTATE_400000;
            frameCounter = 200;
            sit_a->skippedIntro = TRUE;
        }
    }
    sit_a->counter = frameCounter;

    gUnknown_03005AF0.s.unk10 &= ~(SPRITE_FLAG_MASK_OBJ_MODE);

    if (frameCounter < 150) {
        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_400000;
    } else if (frameCounter == 151) {
        gPlayer.moveState &= ~MOVESTATE_100000;
    } else if (frameCounter >= 150 && frameCounter <= 166) {
        gPlayer.moveState &= ~MOVESTATE_400000;
    }

    /*    Set player animation to "Getting Ready" and delay until it is finished    */
    if ((frameCounter == (200 - sGettingReadyAnimationDuration[gSelectedCharacter]))
        && (gUnknown_030055B0 == 0) && (ACT_INDEX(gCurrentLevel) != ACT_BOSS)) {
        Player *p = &gPlayer;
        p->anim = characterAnimsGettingReady[gSelectedCharacter].anim;
        p->variant = characterAnimsGettingReady[gSelectedCharacter].variant;
        p->unk6C = 1;
        p->unk90->s.unk10 |= MOVESTATE_40000;
        p->unk94->s.unk10 |= MOVESTATE_40000;

        if (IS_MULTI_PLAYER) {
            p->unk90->s.palId = SIO_MULTI_CNT->id;
        } else {
            p->unk90->s.palId = 0;
        }
    }

    /*    Call all initializations necessary for current stage and destroy this Task */
    if (frameCounter > 200) {
        gUnknown_03005424 &= ~EXTRA_STATE__100;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                // Create the 1st boss (for Boss Rush)
                if (gUnknown_030055B0 == 0) {
                    CreateZoneBoss(BOSS_EGG_HAMMER_TANK_II);
                }
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                CreateZoneBoss(BOSS_TRUE_AREA_53_BOSS);
                gDispCnt |= DISPCNT_BG1_ON;
            } else {
                CreateZoneBoss(LEVEL_TO_ZONE(gCurrentLevel));
            }

            gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
            gUnknown_03005424 &= ~EXTRA_STATE__ACT_START;
        } else {
            if (gUnknown_030055B0 == 0) {
                CreateCourseStartCountdown(sit_a->skippedIntro);
            } else {
                gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
                gUnknown_03005424 &= ~EXTRA_STATE__ACT_START;
            }
        }
        if (IS_MULTI_PLAYER) {
            sub_8018818();
        } else {
            gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_18;
        }
        CreateStageUI();
        TaskDestroy(gCurTask);
        sub_801583C();
    }
}

// (85.25%) https://decomp.me/scratch/zMdSN
NONMATCH("asm/non_matching/game/stage/intro/Task_802F9F8.inc", void Task_802F9F8(void))
{
    SITaskB *sit_b = TaskGetStructPtr(gCurTask);
    SITaskA *parent = sit_b->parent; // sp00
    struct TransitionState *transition = &sit_b->transition;
    s32 frameCounter = parent->counter;
    u8 i;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);

    if ((unsigned)frameCounter >= 150) {
        frameCounter -= 150;

        if ((unsigned)frameCounter >= (166 - 150)) {
            frameCounter = 16;
        }
        transition->unk4 = frameCounter << 9;

        if (((frameCounter << 25) >> 16) >= 0x2000) {
            transition->unk4 = 0x2000;
        }
        // _0802FA4C

        if (IS_SINGLE_PLAYER) {
            // _0802FA4C+8
            for (i = 0; i < 16; i++) {
                const u8 *colors = &gUnknown_080D6FF5[0][0];
                s32 index = (gSelectedCharacter * 16) + i;
                u8 r = (gUnknown_080D6FF5[index][0] * frameCounter) / 16u;
                u8 g = ((gUnknown_080D6FF5[index][1] * frameCounter) / 16u);
                u8 b = ((gUnknown_080D6FF5[index][2] * frameCounter) / 16u);

                gObjPalette[i] = RGB(r, g, b);

                if (gUnknown_030056A4 != NULL) {
                    r = (gUnknown_080D6FF5[index + 80][0] * frameCounter) / 16u;
                    g = ((gUnknown_080D6FF5[index + 80][1] * frameCounter) / 16u);
                    b = ((gUnknown_080D6FF5[index + 80][2] * frameCounter) / 16u);

                    gObjPalette[i + 0xE0] = RGB(r, g, b);
                }
            }
        } else {
            // _0802FB28
            u8 sid;
            for (sid = 0; sid < MULTI_SIO_PLAYERS_MAX; sid++) {
                if ((gMultiplayerConnections >> sid) & 0x1) {
                    for (i = 0; i < 16; i++) {
                        s32 index = (sid * 48) + i * 3;
                        u8 r = (gUnknown_080D6FF5[index][0] * frameCounter) / 16u;
                        u8 g = ((gUnknown_080D6FF5[index][1] * frameCounter) / 16u);
                        u8 b = ((gUnknown_080D6FF5[index][2] * frameCounter) / 16u);

                        gObjPalette[i] = RGB(r, g, b);
                    }
                }
            }
        }
        if (gUnknown_030056A4 != NULL) {
            for (i = 0; i < 16; i++) {
                s32 index;
                u8 r, b, g;
                {
                    const u8 *colors = &gUnknown_080D6FF5[0][0];
                    index = (0 * 48) + i;
                    colors = &gUnknown_080D6FF5[index + 80][0];
                    r = (colors[0] * frameCounter) / 16u;
                    g = ((gUnknown_080D6FF5[index + 80][1] * frameCounter) / 16u);
                    b = ((gUnknown_080D6FF5[index + 80][2] * frameCounter) / 16u);

                    gObjPalette[i + 0xE0] = RGB(r, g, b);
                }
            }
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        transition->unk8 = 0x3FCF;
        NextTransitionFrame(transition);

        // TODO: Use #defines here
        gWinRegs[WINREG_WININ] = 0x1F3F;
        gWinRegs[WINREG_WINOUT] = 0x1F;

    } else {
        // _0802FC5C
        transition->unk8 = 0x30EF;
        NextTransitionFrame(transition);

        gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);
        gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_OBJ | WINOUT_WINOBJ_OBJ);
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gWinRegs[WINREG_WININ] &= ~(WININ_WIN0_BG1 | WININ_WIN0_BG2);
    }
    // _0802FC86

    /* Setup window registers and destroy this Task */
    if (parent->counter >= 200) {
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
            gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_BG1_ON
                          | DISPCNT_BG2_ON);
            gWinRegs[WINREG_WINOUT]
                = (WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR | WINOUT_WINOBJ_BG0
                   | WINOUT_WINOBJ_BG1 | WINOUT_WINOBJ_BG2 | WINOUT_WIN01_OBJ
                   | WINOUT_WIN01_CLR | WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2);

            gBldRegs.bldCnt
                = (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1
                   | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2);
            gBldRegs.bldAlpha = 0x404;
            gBldRegs.bldY = 0x404;
        }

        TaskDestroy(gCurTask);
    }
}
END_NONMATCH
