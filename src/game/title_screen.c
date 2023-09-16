#include "game/title_screen.h"
#include "core.h"
#include "flags.h"
#include "global.h"
#include "core.h"
#include "lib/m4a.h"
#include "task.h"
#include "sprite.h"
#include "game/save.h"
#include "game/screen_transition.h"
#include "input_recorder.h"
#include "game/math.h"
#include "game/math.h"
#include "game/options_screen.h"
#include "game/game.h"
#include "game/time_attack/lobby.h"
#include "constants/zones.h"
#include "data/recordings.h"
#include "trig.h"
#include "game/backgrounds.h"
#include "game/multiplayer/mode_select.h"
#include "game/character_select.h"
#include "malloc_vram.h"
#include "game/time_attack/mode_select.h"
#include "game/stage/demo_manager.h"

#include "game/assets/compressed/roms.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct TitleScreen {
    // Possibly an array of ui elements?
    Background unk0;
    Background unk40;
    Background introSonicLogo;

    // Dunno what these are yet
    Sprite unkC0;
    Sprite unkF0;

    Sprite menuItems[6];

    // Used
    Sprite unk240;

    // fade s
    struct TransitionState unk270;

    struct UNK_3005B80_UNK4 unk27C;

    // Something to do with the wave effects
    u16 wavesTranslationX[DISPLAY_HEIGHT];
    u32 unk3F4[DISPLAY_HEIGHT][4];
    u16 wavesTranslationY[DISPLAY_HEIGHT];

    u16 unkF34;
    u16 unkF36;
    u16 wavesTopOffset;

    s16 unkF3A;

    u8 introTransitionStep;
    u8 introPanUpVelocity;

    u16 animFrame;
    u16 startScreenTimer;
    u8 menuCursor;

    u8 unkF43;
    u16 unkF44[16];
}; /* size 0xF64 */

struct BirdAnimation {
    Sprite s;
    u16 unk30;
    u16 unk32;
    u16 unk34;
    u16 unk36;
    s16 unk38;
    s16 unk3A;
    u8 unk3C;
    u8 unk3D;
    u8 sequenceStep;
    u8 unk3F;
};

struct MenuItemTransition {
    Sprite *s;
    u8 filler4[12];
    u8 animFrame;
    s16 unk12;
}; /* size 0x14 */

struct LensFlare {
    Sprite sprites[8];
    SpriteTransform transforms[8];
    s16 posSequenceX[8];
    s16 posSequenceY[8];
    u16 unk200;
    s16 unk202;
    u8 unk204;
    u8 animFrame;
    u8 unk206;
    u8 unk207;
}; /* size 0x208 */

static void sub_808D874(void);

static void InitTitleScreenBackgrounds(struct TitleScreen *);
static void InitTitleScreenUI(struct TitleScreen *);
static void WavesBackgroundAnim(struct TitleScreen *);

static void Task_IntroStartSegaLogoAnim(void);
static void Task_IntroShowSegaLogo(void);
static void Task_IntroStartSonicTeamLogoAnim(void);
static void Task_IntroFadeInSonicTeamLogoAnim(void);
static void Task_IntroShowSonicTeamLogo(void);

static void Task_IntroStartSkyTransition(void);
static void Task_IntroPanSkyAnim(void);
static void Task_IntroSkyAnim(void);
static void Task_IntroFadeInTitleScreenAnim(void);
static void Task_IntroWaitUntilTitleScreenFanfare(void);

static void SkipIntro(struct TitleScreen *);

static void ShowGameLogo(struct TitleScreen *);
static void Task_ShowPressStartMenu(void);
static void Task_PressStartMenuMain(void);
static void Task_StartPressedTransitionAnim(void);
static void Task_PlayModeMenuMain(void);
static void Task_SinglePlayerSelectedTransitionAnim(void);
static void Task_SinglePlayerMenuMain(void);

static void Task_StartTitleScreenDemo(void);
static void Task_HandleTitleScreenExit(void);
static void LoadTinyChaoGarden(void);

static void CreateMenuItemTransition(Sprite *, u8);

static void CreateLensFlareAnimation(void);
static void Task_LensFlareAnim(void);
static void LensFlareAnimEnd(void);

static void CreateBirdAnimation(u16, s16, u16, u16, u16);
static void Task_BirdAnim(void);
static void BirdAnimEnd(void);

#define FadeInBlend(frame) BLDALPHA_BLEND(frame, 16 - (frame))

#define FadeOutBlend(frame) BLDALPHA_BLEND(16 - (frame), frame)

#define FRAME_TIME_SECONDS(n) ((n)*60)

#define TRANSITION_OUT 0
#define TRANSITION_IN  1

#define MENU_ITEM_SINGLE_PLAYER    0
#define MENU_ITEM_MULTI_PLAYER     1
#define MENU_ITEM_GAME_START       2
#define MENU_ITEM_TIME_ATTACK      3
#define MENU_ITEM_OPTIONS          4
#define MENU_ITEM_TINY_CHAO_GARDEN 5

#define SPECIAL_MENU_INDEX_MULTI_PLAYER 4

#define PlayModeMenuIndex(item) (item - MENU_ITEM_SINGLE_PLAYER)
#define PlayModeMenuItem(index) (MENU_ITEM_SINGLE_PLAYER + index)

#define SinglePlayerMenuIndex(item) (item - MENU_ITEM_GAME_START)
#define SinglePlayerMenuItem(index) (MENU_ITEM_GAME_START + index)

#define MenuTextIdx(language, menuItemId) menuItemId + language *NUM_LANGUAGES

const TileInfo gPressStartTiles[] = {
    [LANG_DEFAULT] = { 0x2E, 0x364, 0 }, [LANG_JAPANESE] = { 0x2E, 0x364, 0 },
    [LANG_ENGLISH] = { 0x26, 0x36A, 0 }, [LANG_GERMAN] = { 0x26, 0x36B, 0 },
    [LANG_FRENCH] = { 0x2E, 0x36C, 0 },  [LANG_SPANISH] = { 0x1E, 0x36D, 0 },
    [LANG_ITALIAN] = { 0x1E, 0x36E, 0 },
};

static const TileInfo sMenuTiles[] = {
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_SINGLE_PLAYER)] = { 0x14, 0x364, 0x5 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_MULTI_PLAYER)] = { 0x14, 0x364, 0x6 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_GAME_START)] = { 0x14, 0x364, 0x1 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_TIME_ATTACK)] = { 0x14, 0x364, 0x2 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_OPTIONS)] = { 0x10, 0x364, 0x3 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x1C, 0x364, 0x4 },

    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_SINGLE_PLAYER)] = { 0x14, 0x364, 0x5 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_MULTI_PLAYER)] = { 0x14, 0x364, 0x6 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_GAME_START)] = { 0x14, 0x364, 0x1 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_TIME_ATTACK)] = { 0x14, 0x364, 0x2 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_OPTIONS)] = { 0x10, 0x364, 0x3 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x1C, 0x364, 0x4 },

    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_SINGLE_PLAYER)] = { 0x22, 0x36A, 0x5 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_MULTI_PLAYER)] = { 0x20, 0x36A, 0x6 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_GAME_START)] = { 0x1E, 0x36A, 0x1 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_TIME_ATTACK)] = { 0x20, 0x36A, 0x2 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_OPTIONS)] = { 0x16, 0x36A, 0x3 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2C, 0x36A, 0x4 },

    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_SINGLE_PLAYER)] = { 0x1E, 0x36B, 0x5 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_MULTI_PLAYER)] = { 0x22, 0x36B, 0x6 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_GAME_START)] = { 0x1A, 0x36B, 0x1 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_TIME_ATTACK)] = { 0x1C, 0x36B, 0x2 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_OPTIONS)] = { 0x16, 0x36B, 0x3 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2E, 0x36B, 0x4 },

    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_SINGLE_PLAYER)] = { 0x22, 0x36C, 0x5 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_MULTI_PLAYER)] = { 0x1A, 0x36C, 0x6 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_GAME_START)] = { 0x1A, 0x36C, 0x1 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_TIME_ATTACK)] = { 0x1C, 0x36C, 0x2 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_OPTIONS)] = { 0x14, 0x36C, 0x3 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2C, 0x36C, 0x4 },

    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_SINGLE_PLAYER)] = { 0x16, 0x36D, 0x5 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_MULTI_PLAYER)] = { 0x1E, 0x36D, 0x6 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_GAME_START)] = { 0x1E, 0x36D, 0x1 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_TIME_ATTACK)] = { 0x26, 0x36D, 0x2 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_OPTIONS)] = { 0x16, 0x36D, 0x3 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x26, 0x36D, 0x4 },

    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_SINGLE_PLAYER)] = { 0x26, 0x36E, 0x5 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_MULTI_PLAYER)] = { 0x26, 0x36E, 0x6 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_GAME_START)] = { 0x1A, 0x36E, 0x1 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_TIME_ATTACK)] = { 0x28, 0x36E, 0x2 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_OPTIONS)] = { 0x12, 0x36E, 0x3 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x26, 0x36E, 0x4 },

    // TODO: What's this text
    { 0x28, SA2_ANIM_SOME_JAPANESE_TXT, SA2_ANIM_VARIANT_SOME_JAPANESE_TXT_7 },
};

static const u8 sUnknown_080E0EF4[] = INCBIN_U8("graphics/80E0EF4.gbapal");

// Each value is scan line which the brightness should be increased
// 0 being top 160 being bottom
static const u8 sWavesVerticalBrightnessGradiant[] = {
    0, 3, 8, 14, 21, 32, 46, 66, 96, 160,
};

static const u8 sPanUpNextVelocityChangeFrame[] = { 60, 19, 10, 10, 255 };

static const u8 sMenuItemTransitionKeyFrames[] = {
    1, 2, 3, 4, 5, 6, 8, 10, 11, 13, 14, 16, 16, 16, 16, 16, 16, 16, 16, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 3, 3,  3,  3,  3,  3,  3,  2,  2,  2,  2,  2,  1,  1, 1, 1, 1,
    0, 1, 0, 1, 0, 0, 1, 0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0,
};

static const u8 sBirdAnimModeSequence[] = {
    1, 1, 0, 1, 0, 0, 1, 1, 0, 0,
};

// I wonder if they were ever going to
// make the demos show different levels
// atm only the first is used
static const u8 sDemoLevels[] = {
    LEVEL_INDEX(ZONE_1, ACT_1),
    LEVEL_INDEX(ZONE_1, ACT_BOSS),
    LEVEL_INDEX(ZONE_2, ACT_1),
    LEVEL_INDEX(ZONE_2, ACT_BOSS),
    LEVEL_INDEX(ZONE_1, ACT_1),
    LEVEL_INDEX(ZONE_1, ACT_2),
    // This is really odd
    3,
    LEVEL_INDEX(ZONE_1, ACT_BOSS),
};

static const u16 sLensFlareSizes[] = {
    0, 1, 2, 3, 4, 5, 6, 6,
};

static const u16 sLensFlareStartPositions[][2] = {
    { 20, 10 }, { 36, 26 },   { 52, 42 },   { 68, 58 },
    { 92, 82 }, { 124, 114 }, { 148, 138 }, { 180, 170 },
};

void CreateTitleScreen(void)
{
    struct Task *t;
    struct TitleScreen *titleScreen;
    struct TransitionState *transition;
    struct UNK_3005B80_UNK4 *config27C;
    s32 i, val;
    s16 denom;

    t = TaskCreate(Task_IntroStartSegaLogoAnim, sizeof(struct TitleScreen), 0x1000, 0,
                   NULL);
    titleScreen = TaskGetStructPtr(t);

    titleScreen->unkF34 = 512;
    titleScreen->unkF36 = 0x100;
    titleScreen->wavesTopOffset = 2;

    titleScreen->menuCursor = 0;
    titleScreen->startScreenTimer = 0;

    titleScreen->animFrame = 0;
    titleScreen->unkF3A = 0x20;

    titleScreen->introTransitionStep = 0;
    titleScreen->introPanUpVelocity = 1;

    // Generate the wave effects
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        denom = Div(65536, (i + 1) * 8);

        // I.E: (512 * demon) - Not sure why it uses this when it's constant
        val = (titleScreen->unkF34 * denom) >> 8;

        // Goes from 16384 -> 102 in an log curve \_
        titleScreen->wavesTranslationX[i] = val;
        // Goes from 4 -> 642 in steps of 4 but becomes
        // a slightly more jagged line as i in creases
        titleScreen->wavesTranslationY[i] = Div(65536, val);
    };

    transition = &titleScreen->unk270;
    transition->unk0 = 1;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0x100;
    transition->unk8 = 0x3FBF;
    transition->unkA = 0;

    config27C = &titleScreen->unk27C;
    config27C->unk0 = 0;
    config27C->unk2 = 0;
    config27C->unk34 = titleScreen->wavesTopOffset;
    config27C->unk1 = 0xE;
    config27C->unk4 = sWavesVerticalBrightnessGradiant;
    config27C->unk8 = sUnknown_080E0EF4;
    config27C->unk36 = 0;

    gUnknown_03005B80.unk0 = config27C;
    gUnknown_03005B80.unk4 = &titleScreen->unk0;

    InitTitleScreenBackgrounds(titleScreen);
    m4aSongNumStart(MUS_INTRO);
    gFlags |= 0x8000;

    NextTransitionFrame(transition);
}

static void CreateTitleScreenWithoutIntro(struct TitleScreen *titleScreen)
{
    struct TransitionState *transition;
    Background *bg0, *config40;

    // Size of filler between unk2B4
    // and unkDF4
    titleScreen->unkF34 = 0xa00;

    titleScreen->unkF36 = 3;
    titleScreen->wavesTopOffset = 2;
    titleScreen->menuCursor = 0;
    titleScreen->startScreenTimer = 0;
    titleScreen->animFrame = 0;
    titleScreen->unkF3A = 0x20;
    titleScreen->introTransitionStep = 0;
    titleScreen->introPanUpVelocity = 1;

    transition = &titleScreen->unk270;
    transition->unk0 = 1;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0x200;
    transition->unk8 = 0x3fbf;
    transition->unkA = 0;

    InitTitleScreenUI(titleScreen);

    // Possibly a macro, why would this be set to 0 first
    gDispCnt = 0;
    gDispCnt |= DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON
        | DISPCNT_OBJ_ON;

    gBgCntRegs[0]
        = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR;
    gBgCntRegs[1] = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(29)
        | BGCNT_AFF512x512 | BGCNT_16COLOR;
    gBgCntRegs[2] = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(26)
        | BGCNT_AFF256x256 | BGCNT_256COLOR;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 512;

    bg0 = &titleScreen->unk0;
    bg0->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    bg0->graphics.anim = 0;
    bg0->layoutVram = (void *)BG_SCREEN_ADDR(26);
    bg0->unk18 = 0;
    bg0->unk1A = SPRITE_OAM_ORDER(0);
    if (gLoadedSaveGame->language < 2) {
        bg0->tilemapId = TM_SA2_LOGO_JP;
    } else {
        bg0->tilemapId = TM_SA2_LOGO_EN;
    }
    bg0->unk1E = 0;
    bg0->unk20 = 0;
    bg0->unk22 = 0;
    bg0->unk24 = 0;
    bg0->targetTilesX = 26;
    bg0->targetTilesY = 10;
    bg0->paletteOffset = 0;
    bg0->flags = BACKGROUND_FLAG_4 | BACKGROUND_FLAGS_BG_ID(2);

    InitBackground(bg0);

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG1_ON | DISPCNT_BG2_ON;

    gBgCntRegs[2] &= ~BGCNT_WRAP;

    gBldRegs.bldCnt = BLDCNT_EFFECT_NONE;
    gFlags &= ~0x8000;

    config40 = &titleScreen->unk40;
    config40->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    config40->graphics.anim = 0;
    config40->layoutVram = (void *)BG_SCREEN_ADDR(29);
    config40->unk18 = 0;
    config40->unk1A = 0;
    config40->tilemapId = TM_TITLE_SCREEN_BG;
    config40->unk1E = 0;
    config40->unk20 = 0;
    config40->unk22 = 0;
    config40->unk24 = 0;
    config40->targetTilesX = 0x20;
    config40->targetTilesY = 0x40;
    config40->paletteOffset = 0;
    config40->flags = BACKGROUND_FLAGS_BG_ID(1);

    InitBackground(config40);

    m4aSongNumStart(MUS_TITLE_FANFARE);

    NextTransitionFrame(&titleScreen->unk270);
}

// Maybe create background sprites
static void InitTitleScreenBackgrounds(struct TitleScreen *titleScreen)
{
    Background *bg80, *bg0;

    gDispCnt = DISPCNT_MODE_1;
    gDispCnt |= DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;

    gBgCntRegs[0] = 0x1f04;
    gBgCntRegs[1] = 0x9d0a;
    gBgCntRegs[2] = 0x7a81;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xFF;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0x200;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    bg80 = &titleScreen->introSonicLogo;

    bg80->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    bg80->graphics.anim = 0;
    bg80->layoutVram = (void *)BG_SCREEN_ADDR(31);
    bg80->unk18 = 0;
    bg80->unk1A = SPRITE_OAM_ORDER(0);
    bg80->tilemapId = TM_INTRO_PRESENTED_BY_SEGA;
    bg80->unk1E = 0;
    bg80->unk20 = 0;
    bg80->unk22 = 0;
    bg80->unk24 = 0;
    bg80->targetTilesX = 30;
    bg80->targetTilesY = 20;
    bg80->paletteOffset = 0;
    bg80->flags = 0;

    InitBackground(bg80);

    bg0 = &titleScreen->unk0;

    bg0->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    bg0->graphics.anim = 0;
    bg0->layoutVram = (void *)BG_SCREEN_ADDR(26);
    bg0->unk18 = 0;
    bg0->unk1A = SPRITE_OAM_ORDER(0);
    bg0->tilemapId = TM_INTRO_WATER;
    bg0->unk1E = 0;
    bg0->unk20 = 0;
    bg0->unk22 = 0;
    bg0->unk24 = 0;
    bg0->targetTilesX = 32;
    bg0->targetTilesY = 32;
    bg0->paletteOffset = 0;
    bg0->flags = BACKGROUND_FLAG_4 | BACKGROUND_FLAGS_BG_ID(2);

    InitBackground(bg0);
}

static void InitTitleScreenUI(struct TitleScreen *titleScreen)
{
    // Credit to @jiang for the match on this one too
    s8 language;
    u32 menuItemId;
    void *objAddr;
    Sprite *s;

    // Must be 0 - 6;
    language = gLoadedSaveGame->language;
    objAddr = (void *)OBJ_VRAM0;

    // TODO: make these into macros maybe?
    s = &titleScreen->unkC0;

    s->graphics.dest = objAddr;
    objAddr += (90 * TILE_SIZE_4BPP);

    // Copyright screen
    s->graphics.anim = SA2_ANIM_TITLE_COPYRIGHT;
    s->variant = SA2_ANIM_VARIANT_COPYRIGHT_2003;
    s->prevVariant = -1;
    s->x = 0;
    s->y = DISPLAY_HEIGHT - 30; // set to the screen's bottom
    s->graphics.size = 0;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    s = &titleScreen->unkF0;

    s->graphics.dest = objAddr;
    objAddr += (gPressStartTiles[language].numTiles * TILE_SIZE_4BPP);

    // "PRESS START" text
    s->graphics.anim = gPressStartTiles[language].anim;
    s->variant = gPressStartTiles[language].variant;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 30;
    s->graphics.size = 0;
    s->unk1A = SPRITE_OAM_ORDER(3);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    for (menuItemId = 0; menuItemId < ARRAY_COUNT(titleScreen->menuItems);
         menuItemId++) {
        s = &titleScreen->menuItems[menuItemId];

        s->graphics.dest = objAddr;
        objAddr
            += (sMenuTiles[MenuTextIdx(language, menuItemId)].numTiles * TILE_SIZE_4BPP);

        s->graphics.anim = sMenuTiles[MenuTextIdx(language, menuItemId)].anim;
        s->variant = sMenuTiles[MenuTextIdx(language, menuItemId)].variant;
        s->prevVariant = -1;
        s->x = (DISPLAY_WIDTH / 2);

        // Generate menu item y positions
        // position * lineHeight + topPadding
        if (menuItemId < SinglePlayerMenuItem(0)) {
            // PlayModeMenu positions
            s->y = (PlayModeMenuIndex(menuItemId) * 0x12) + 96;
        } else if (gLoadedSaveGame->chaoGardenUnlocked) {
            // SinglePlayerMenu positions if we have the chao garden available
            s->y = (SinglePlayerMenuIndex(menuItemId) * 0x10) + 96;
        } else {
            // SinglePlayerMenu positions if we don't have the chao garden
            s->y = (SinglePlayerMenuIndex(menuItemId) * 0x12) + 100;
        }

        s->graphics.size = 0;
        s->unk1A = SPRITE_OAM_ORDER(3);
        s->timeUntilNextFrame = 0;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = 0;
        UpdateSpriteAnimation(s);
    };

    s = &titleScreen->unk240;
    s->graphics.dest = objAddr;
    s->graphics.anim = sMenuTiles[ARRAY_COUNT(sMenuTiles) - 1].anim;
    s->variant = sMenuTiles[ARRAY_COUNT(sMenuTiles) - 1].variant;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2);
    s->graphics.size = 0;
    s->unk1A = SPRITE_OAM_ORDER(30);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0x3000;
    UpdateSpriteAnimation(s);
}

static void Task_IntroFadeInSegaLogoAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame);

    if (titleScreen->animFrame >= 16) {
        titleScreen->animFrame = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        gCurTask->main = Task_IntroShowSegaLogo;
    }

    titleScreen->animFrame++;
}

static void Task_IntroFadeOutSegaLogoAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    gBldRegs.bldAlpha = FadeOutBlend(titleScreen->animFrame * 2);

    if (titleScreen->animFrame >= 8) {
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        titleScreen->animFrame = 0;
        gFlags &= ~0x8000;
        gCurTask->main = Task_IntroStartSonicTeamLogoAnim;
    }

    titleScreen->animFrame++;
}

static void Task_IntroStartSonicTeamLogoAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    Background *bg;

    WavesBackgroundAnim(titleScreen);

    if (titleScreen->animFrame == 1) {
        // TODO: some macro for this
        bg = &titleScreen->introSonicLogo;
        bg->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        bg->graphics.anim = 0;
        bg->layoutVram = (void *)BG_SCREEN_ADDR(31);
        bg->unk18 = 0;
        bg->unk1A = 0;
        bg->tilemapId = TM_INTRO_CREATED_BY_SONIC_TEAM;
        bg->unk1E = 0;
        bg->unk20 = 0;
        bg->unk22 = 0;
        bg->unk24 = 0;
        bg->targetTilesX = 30;
        bg->targetTilesY = 20;
        bg->paletteOffset = 0;
        bg->flags = 0x10;
        InitBackground(bg);
    }

    if (titleScreen->animFrame > 2) {
        titleScreen->animFrame = 0;
        gDispCnt |= DISPCNT_BG0_ON;
        gCurTask->main = Task_IntroFadeInSonicTeamLogoAnim;
    }

    titleScreen->animFrame++;
}

static void Task_IntroFadeInSonicTeamLogoAnim(void)
{
    // Wondering if this is some inline function
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame);

    if (titleScreen->animFrame >= 16) {
        titleScreen->animFrame = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        // Only diference is this function assignment for the next task
        gCurTask->main = Task_IntroShowSonicTeamLogo;
    }

    titleScreen->animFrame++;
}

static void Task_IntroFadeOutSonicTeamLogoAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    gBldRegs.bldAlpha = FadeOutBlend(titleScreen->animFrame * 2);

    if (titleScreen->animFrame >= 8) {
        gCurTask->main = Task_IntroStartSkyTransition;
        titleScreen->animFrame = 0;
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
    }

    titleScreen->animFrame++;
}

static void Task_IntroStartSkyTransition(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    Background *config40;
    WavesBackgroundAnim(titleScreen);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        SkipIntro(titleScreen);
        return;
    }

    // If animation frame is 59
    // Preload the island s
    if (titleScreen->animFrame == 59) {
        config40 = &titleScreen->unk40;
        config40->graphics.dest = (void *)BG_SCREEN_ADDR(16);
        config40->graphics.anim = 0;
        config40->layoutVram = (void *)BG_SCREEN_ADDR(29);
        config40->unk18 = 0;
        config40->unk1A = 0;
        config40->tilemapId = TM_TITLE_SCREEN_BG;
        config40->unk1E = 0;
        config40->unk20 = 0;
        config40->unk22 = 0;
        config40->unk24 = 0;
        config40->targetTilesX = 0x20;
        config40->targetTilesY = 0x40;
        config40->paletteOffset = 0;
        config40->flags = BACKGROUND_FLAGS_BG_ID(1);
        InitBackground(config40);
    }

    // Once the animation frame is at 140
    // begin the pan, and load the bird animations
    if (titleScreen->animFrame > 140) {
        gCurTask->main = Task_IntroPanSkyAnim;
        titleScreen->animFrame = 0;
        gDispCnt |= DISPCNT_BG1_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        gBldRegs.bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1;
        CreateBirdAnimation(0x7c, 0xffc4, 0, 0xffdf, 0);
        CreateBirdAnimation(0xb4, 0xffe8, 3, 0x20, 0);
    }

    titleScreen->animFrame++;
}

static void Task_IntroPanSkyAnim(void)
{
    Background *bg0;
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        SkipIntro(titleScreen);
        return;
    }

    gBgScrollRegs[1][1] -= titleScreen->introPanUpVelocity;
    if (gBgScrollRegs[1][1] < 0xAF) {
        gBgScrollRegs[1][1] = 0xAF;
    }

    if (gBgScrollRegs[1][1] < 0x15F) {
        gDispCnt &= 0xFBFF;
        gDispCnt &= 0xBFFF;
    } else {
        titleScreen->wavesTopOffset += titleScreen->introPanUpVelocity;
        WavesBackgroundAnim(titleScreen);
    }

    // Increase the pan up velocity once the correct
    // frame is reached
    if (titleScreen->animFrame
        == sPanUpNextVelocityChangeFrame[titleScreen->introTransitionStep]) {
        titleScreen->animFrame = 0;
        titleScreen->introPanUpVelocity++;
        titleScreen->introTransitionStep++;
    }

    // After 1 second, show the lens flare
    // animation
    if (titleScreen->animFrame > 60 && titleScreen->introTransitionStep > 2) {
        gBgCntRegs[2] &= ~BGCNT_WRAP;

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0x20;
        gUnknown_03002280[0][3] = 0x20;

        gBldRegs.bldCnt = 0;

        bg0 = &titleScreen->unk0;
        bg0->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        bg0->graphics.anim = 0;
        bg0->layoutVram = (void *)BG_SCREEN_ADDR(31);
        bg0->unk18 = 0;
        bg0->unk1A = 0;
        bg0->tilemapId = TM_LENS_FLARE_BG;
        bg0->unk1E = 0;
        bg0->unk20 = 0;
        bg0->unk22 = 0;
        bg0->unk24 = 0;
        bg0->targetTilesX = 7;
        bg0->targetTilesY = 0x10;
        bg0->paletteOffset = 0;
        bg0->flags = 0x10;
        InitBackground(bg0);

        gBgScrollRegs[0][1] = 0x4F;
        gCurTask->main = Task_IntroSkyAnim;

        titleScreen->animFrame = 0;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY = 0;

        gDispCnt |= DISPCNT_WIN1_ON;
        REG_SIOCNT |= SIO_INTR_ENABLE;
    }
    titleScreen->animFrame++;
}

static void Task_IntroSkyAnim(void)
{
    Background *bg0;
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        SkipIntro(titleScreen);
        return;
    }

    // After 2 frames
    if (titleScreen->animFrame == 2) {
        CreateLensFlareAnimation();
    }

    // Every other frame
    if (titleScreen->animFrame & 1) {
        sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 10, gBgAffineRegs);
        gDispCnt |= DISPCNT_BG0_ON;
    }

    // transition step is always > 2 to be here
    if (titleScreen->introTransitionStep > 2
        && (u16)(titleScreen->animFrame - 20) < 119) {
        gDispCnt &= 0xFEFF;
        gDispCnt |= 0x4000;

        gWinRegs[1] = 0xF0;
        // Display height?
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;

        if (titleScreen->animFrame > 29) {
            gBldRegs.bldY = 16 - ((titleScreen->animFrame - 30) >> 3);
        } else {
            gBldRegs.bldY = 16;
        }

        if (titleScreen->animFrame == 0x15) {
            gBgScrollRegs[1][1] = 0;
        }
    }

    if (titleScreen->animFrame > 138) {
        // Init title screen background
        bg0 = &titleScreen->unk0;

        // Probably wrong size here (0x4000)
        DmaFill32(3, 0, (void *)VRAM, OBJ_VRAM1_SIZE);

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xff;
        gUnknown_03002280[0][3] = 0x20;
        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[2][0] = 0;
        gUnknown_03002280[2][1] = 0;
        gUnknown_03002280[2][2] = 0xff;
        gUnknown_03002280[2][3] = 0x20;

        bg0->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        bg0->graphics.anim = 0;
        bg0->layoutVram = (void *)BG_SCREEN_ADDR(26);
        bg0->unk18 = 0;
        bg0->unk1A = 0;

        if (gLoadedSaveGame->language < LANG_ENGLISH) {
            bg0->tilemapId = TM_SA2_LOGO_JP;
        } else {
            bg0->tilemapId = TM_SA2_LOGO_EN;
        }

        bg0->unk1E = 0;
        bg0->unk20 = 0;
        bg0->unk22 = 0;
        bg0->unk24 = 0;
        bg0->targetTilesX = 0x1A;
        bg0->targetTilesY = 10;
        bg0->paletteOffset = 0;
        bg0->flags = BACKGROUND_FLAG_4 | BACKGROUND_FLAGS_BG_ID(2);

        InitBackground(bg0);

        gBgCntRegs[2] &= 0xDFFF;
        gCurTask->main = Task_IntroFadeInTitleScreenAnim;

        gDispCnt |= 0x400;
        gDispCnt &= 0xFEFF;

        gBldRegs.bldAlpha = 0x1000;
        gBldRegs.bldCnt = 0x244;

        titleScreen->animFrame = 0;
        gBgScrollRegs[1][1] = 0;

        InitTitleScreenUI(titleScreen);
    }
    titleScreen->animFrame++;
}

static void Task_IntroFadeInTitleScreenAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        SkipIntro(titleScreen);
        return;
    }

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame >> 2);

    if (titleScreen->animFrame > 64) {
        gBldRegs.bldCnt = 0;
        titleScreen->animFrame = 0;
        gCurTask->main = Task_IntroWaitUntilTitleScreenFanfare;
    }

    titleScreen->animFrame++;
    ShowGameLogo(titleScreen);
}

static void Task_PressStartMenuMain(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    // Show the press start text for 2/3 of a second
    if (titleScreen->animFrame < 40) {
        DisplaySprite(&titleScreen->unkF0);
    }

    titleScreen->animFrame++;
    // And don't show it for the next 2/3 of a second
    if (titleScreen->animFrame > 80) {
        titleScreen->animFrame = 0;
    }
    DisplaySprite(&titleScreen->unkC0);

    if (gPressedKeys & START_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        titleScreen->animFrame = 0;
        titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = Task_StartPressedTransitionAnim;
    }

    ShowGameLogo(titleScreen);

    titleScreen->startScreenTimer++;
    if (titleScreen->startScreenTimer == FRAME_TIME_SECONDS(15)) {
        // Start the demo after 15 seconds on this screen
        gCurTask->main = Task_StartTitleScreenDemo;
    }
}

static void Task_StartPressedTransitionAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    // Flash the start button
    if ((titleScreen->animFrame & 7) > 3) {
        DisplaySprite(&titleScreen->unkF0);
    }
    titleScreen->animFrame++;

    DisplaySprite(&titleScreen->unkC0);

    // Start showing the next menu items after 1/6 of a second (10 frames)
    if (titleScreen->animFrame == 10) {
        CreateMenuItemTransition(
            &titleScreen->menuItems[PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)],
            TRANSITION_IN);
        CreateMenuItemTransition(
            &titleScreen->menuItems[PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER)],
            TRANSITION_IN);
    }

    if (titleScreen->animFrame > 16) {
        titleScreen->animFrame = 0;
        titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = Task_PlayModeMenuMain;
    }

    ShowGameLogo(titleScreen);
}

static inline void PlayModeMenuHighlightFocused(struct TitleScreen *titleScreen)
{
    Sprite *menuItem;
    u8 menuIndex;
    // Highlight the menu items from cursor position
    for (menuIndex = 0; menuIndex < 2; menuIndex++) {
        menuItem = &titleScreen->menuItems[menuIndex ^ 1];
        menuItem->palId = (menuIndex ^ titleScreen->menuCursor);
        DisplaySprite(menuItem);
    };
}

static void Task_PlayModeMenuMain(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition;

    DisplaySprite(&titleScreen->unkC0);
    ShowGameLogo(titleScreen);

    PlayModeMenuHighlightFocused(titleScreen);

    // Move the cursor if buttons are pressed
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        if (titleScreen->menuCursor != PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        } else {
            titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER);
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    // Select option
    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        if (titleScreen->menuCursor == PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            titleScreen->menuItems[MENU_ITEM_MULTI_PLAYER].x = (DISPLAY_WIDTH / 2);
            CreateMenuItemTransition(&titleScreen->menuItems[MENU_ITEM_MULTI_PLAYER],
                                     TRANSITION_OUT);

            titleScreen->animFrame = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);

            gCurTask->main = Task_SinglePlayerSelectedTransitionAnim;
        } else {
            transition = &titleScreen->unk270;
            CreateMenuItemTransition(&titleScreen->menuItems[MENU_ITEM_SINGLE_PLAYER],
                                     TRANSITION_OUT);

            transition->unk8 = 0x3FFF;
            transition->unk4 = 0;
            transition->speed = 0x100;
            transition->unk2 = 1;

            titleScreen->menuCursor = SPECIAL_MENU_INDEX_MULTI_PLAYER;
            gCurTask->main = Task_HandleTitleScreenExit;
        }
        return;
    }

    // Return to start screen
    if (gPressedKeys & B_BUTTON) {
        titleScreen->startScreenTimer = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_PressStartMenuMain;
    }
}

static void Task_SinglePlayerSelectedTransitionAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    Sprite *menuItems = titleScreen->menuItems;

    // Flash the previous selected single player menu item
    if ((titleScreen->animFrame & 7) > 3) {
        DisplaySprite(&menuItems[MENU_ITEM_SINGLE_PLAYER]);
    }
    titleScreen->animFrame++;

    DisplaySprite(&titleScreen->unkC0);

    // Allow back to be pressed during animation
    // to cancel
    if (gPressedKeys & B_BUTTON) {
        titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_PlayModeMenuMain;
    }

    // Transition in the menu items after 8 frames
    if (titleScreen->animFrame == 8) {
        CreateMenuItemTransition(&menuItems[MENU_ITEM_GAME_START], TRANSITION_IN);
        CreateMenuItemTransition(&menuItems[MENU_ITEM_TIME_ATTACK], TRANSITION_IN);
        CreateMenuItemTransition(&menuItems[MENU_ITEM_OPTIONS], TRANSITION_IN);

        if (gLoadedSaveGame->chaoGardenUnlocked) {
            CreateMenuItemTransition(&menuItems[MENU_ITEM_TINY_CHAO_GARDEN],
                                     TRANSITION_IN);
        }
    }

    // After 12 frames enable the single player menu
    if (titleScreen->animFrame > 12) {
        titleScreen->animFrame = 0;
        titleScreen->menuCursor = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);
        gCurTask->main = Task_SinglePlayerMenuMain;
    }

    ShowGameLogo(titleScreen);
}

static inline void SinglePlayerMenuHighlightFocused(struct TitleScreen *titleScreen,
                                                    u8 numMenuItems)
{
    Sprite *menuItem;
    u8 menuIndex;

    for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
        menuItem = &titleScreen->menuItems[SinglePlayerMenuItem(menuIndex)];
        if (titleScreen->menuCursor == menuIndex) {
            menuItem->palId = 1;
        } else {
            menuItem->palId = 0;
        }
        DisplaySprite(menuItem);
    }
};

static void Task_SinglePlayerMenuMain(void)
{
    struct TitleScreen *titleScreen;
    struct TransitionState *transition;
    u8 menuIndex;

    u8 numMenuItems = 3;
    if (gLoadedSaveGame->chaoGardenUnlocked) {
        numMenuItems = 4;
    }

    titleScreen = TaskGetStructPtr(gCurTask);
    SinglePlayerMenuHighlightFocused(titleScreen, numMenuItems);

    ShowGameLogo(titleScreen);

    // Handle input and wrap the cursor around
    if (gRepeatedKeys & DPAD_UP) {
        if (titleScreen->menuCursor > 0) {
            titleScreen->menuCursor--;
        } else {
            titleScreen->menuCursor = numMenuItems - 1;
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if (gRepeatedKeys & DPAD_DOWN) {
        if (titleScreen->menuCursor < (numMenuItems - 1)) {
            titleScreen->menuCursor++;
        } else {
            titleScreen->menuCursor = 0;
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    if (gPressedKeys & B_BUTTON) {
        titleScreen->menuCursor = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = Task_PlayModeMenuMain;
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        transition = &titleScreen->unk270;
        transition->unk8 = 0x3FFF;
        if (titleScreen->menuCursor
            == SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN)) {
            transition->unk8 = 0x3FBF;
        }
        transition->speed = 0x100;
        transition->unk4 = 0;
        transition->unk2 = 1;

        for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
            if (menuIndex != titleScreen->menuCursor) {
                CreateMenuItemTransition(
                    &titleScreen->menuItems[SinglePlayerMenuItem(menuIndex)],
                    TRANSITION_OUT);
            }
        }

        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_HandleTitleScreenExit;
    }
}

static void Task_HandleTitleScreenExit(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    Sprite *menuItem;
    u8 i;

    if (NextTransitionFrame(&titleScreen->unk270) == SCREEN_TRANSITION_COMPLETE) {
        gUnknown_03005424 = EXTRA_STATE__CLEAR;
        gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
        gSelectedCharacter = CHARACTER_SONIC;

        switch (titleScreen->menuCursor) {
            case SinglePlayerMenuIndex(MENU_ITEM_GAME_START):
                gGameMode = GAME_MODE_SINGLE_PLAYER;
                ApplyGameStageSettings();
                // If all characters unlocked
                if (gLoadedSaveGame->unlockedCharacters & CHARACTER_BIT(CHARACTER_AMY)) {
                    CreateCharacterSelectionScreen(CHARACTER_SONIC, TRUE);
                } else {
                    CreateCharacterSelectionScreen(CHARACTER_SONIC, FALSE);
                }
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TIME_ATTACK):
                ApplyGameStageSettings();
                gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
                gSelectedCharacter = CHARACTER_SONIC;
                gGameMode = GAME_MODE_TIME_ATTACK;
                CreateTimeAttackModeSelectionScreen();
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_OPTIONS):
                gGameMode = GAME_MODE_SINGLE_PLAYER;
                CreateOptionsScreen(0);
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN):
                LoadTinyChaoGarden();
                break;
            case SPECIAL_MENU_INDEX_MULTI_PLAYER:
                gGameMode = GAME_MODE_MULTI_PLAYER;
                ApplyGameStageSettings();
                if (gLoadedSaveGame->playerName[0] != PLAYER_NAME_END_CHAR) {
                    CreateMultiplayerModeSelectScreen();
                } else {
                    // If we don't have a profile name
                    // show the profile creator screen
                    CreateNewProfileNameScreen(NEW_PROFILE_NAME_MULTIPLAYER);
                }
                break;
        }
        TaskDestroy(gCurTask);
    } else {
        ShowGameLogo(titleScreen);
        if (titleScreen->menuCursor == SPECIAL_MENU_INDEX_MULTI_PLAYER) {
            // ?? wat, who writes for loops like this
            // is some macro for the numMenuItems so it wasn't
            // obvious
            for (i = 0; i < 1; i++) {
                menuItem = &titleScreen->menuItems[i ^ 1];
                menuItem->palId = i ^ 1;
                if ((++titleScreen->animFrame & 7) > 3) {
                    DisplaySprite(menuItem);
                }
            }
            DisplaySprite(&titleScreen->unkC0);
        } else {
            menuItem
                = &titleScreen->menuItems[SinglePlayerMenuItem(titleScreen->menuCursor)];
            menuItem->palId = 1;
            if ((++titleScreen->animFrame & 7) > 3) {
                DisplaySprite(menuItem);
            }
        }
    }
}

static void Task_ShowTitleScreenIntroSkipped(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    Background *bg0 = &titleScreen->unk0;
    Background *config40;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 32;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 32;

    bg0->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    bg0->graphics.anim = 0;
    bg0->layoutVram = (void *)BG_SCREEN_ADDR(26);
    bg0->unk18 = 0;
    bg0->unk1A = 0;

    // Show japanese game logo if japanese, otherwise
    if (gLoadedSaveGame->language < LANG_ENGLISH) {
        bg0->tilemapId = TM_SA2_LOGO_JP;
    } else {
        bg0->tilemapId = TM_SA2_LOGO_EN;
    }

    bg0->unk1E = 0;
    bg0->unk20 = 0;
    bg0->unk22 = 0;
    bg0->unk24 = 0;
    bg0->targetTilesX = 0x1A;
    bg0->targetTilesY = 10;
    bg0->paletteOffset = 0;
    bg0->flags = BACKGROUND_FLAG_4 | BACKGROUND_FLAGS_BG_ID(2);
    InitBackground(bg0);

    config40 = &titleScreen->unk40;
    config40->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    config40->graphics.anim = 0;
    config40->layoutVram = (void *)BG_SCREEN_ADDR(29);
    config40->unk18 = 0;
    config40->unk1A = 0;
    config40->tilemapId = TM_TITLE_SCREEN_BG;
    config40->unk1E = 0;
    config40->unk20 = 0;
    config40->unk22 = 0;
    config40->unk24 = 0;
    config40->targetTilesX = 0x20;
    config40->targetTilesY = 0x40;
    config40->paletteOffset = 0;
    config40->flags = BACKGROUND_FLAGS_BG_ID(1);
    InitBackground(config40);

    gDispCnt &= ~0x100;
    gDispCnt |= 0x600;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0;
    gBgCntRegs[2] &= ~0x2000;
    gBldRegs.bldCnt = 0;
    gFlags &= ~0x8000;

    NextTransitionFrame(&titleScreen->unk270);
    m4aSongNumStart(MUS_TITLE_FANFARE);

    ShowGameLogo(titleScreen);
    gCurTask->main = Task_ShowPressStartMenu;

    REG_SIOCNT |= SIO_INTR_ENABLE;
}

static void Task_JumpToPlayModeMenu(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    PlayModeMenuHighlightFocused(titleScreen);

    DisplaySprite(&titleScreen->unkC0);
    ShowGameLogo(titleScreen);

    if (NextTransitionFrame(&titleScreen->unk270) == SCREEN_TRANSITION_COMPLETE) {
        m4aSongNumStart(VOICE__ANNOUNCER__SONIC_ADVANCE_2);
        titleScreen->animFrame = 0;
        gCurTask->main = Task_PlayModeMenuMain;
    }
}

static void Task_JumpToSinglePlayerMenu(void)
{
    struct TitleScreen *titleScreen;
    struct TransitionState *transition;

    u8 numMenuItems = 3;
    if (gLoadedSaveGame->chaoGardenUnlocked) {
        numMenuItems = 4;
    }

    titleScreen = TaskGetStructPtr(gCurTask);
    SinglePlayerMenuHighlightFocused(titleScreen, numMenuItems);

    ShowGameLogo(titleScreen);

    if (NextTransitionFrame(&titleScreen->unk270) == SCREEN_TRANSITION_COMPLETE) {
        m4aSongNumStart(VOICE__ANNOUNCER__SONIC_ADVANCE_2);
        titleScreen->animFrame = 0;
        gCurTask->main = Task_SinglePlayerMenuMain;
    }
}

static void WavesBackgroundAnim(struct TitleScreen *titleScreen)
{
    u32 i;
    u32 *pointer;
    s32 j;

    REG_SIOCNT &= ~SIO_INTR_ENABLE;
    gDispCnt |= 0x4000;
    gWinRegs[1] = 0xF0;
    gWinRegs[3] = (titleScreen->wavesTopOffset - 2) * 0x100;
    gWinRegs[3] |= 0xA0;
    gWinRegs[4] |= 0x3F00;
    gWinRegs[5] &= 0x13;

    // Something which effects wave length
    titleScreen->unkF3A -= 768;
    if (titleScreen->unkF3A < 0) {
        titleScreen->unkF3A = 7680;
    }

    gUnknown_03001870[gUnknown_03004D50++] = sub_808D874;
    gFlags |= 0x10;

    titleScreen->unk27C.unk34 = (titleScreen->wavesTopOffset - 2);

    gHBlankCallbacks[gNumHBlankCallbacks++] = sub_808DB2C;

    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
    gFlags |= 0x4;
    gUnknown_03002A80 = 16;
    gUnknown_03002878 = (void *)REG_ADDR_BG2PA;

    // TODO: not sure unk3F4 is the correct type
    gBgOffsetsHBlank = &titleScreen->unk3F4[0][0];
    pointer = &titleScreen->unk3F4[0][0];
    for (i = 0, j = 0; i < DISPLAY_HEIGHT; i++) {
        s32 temp, r3;
        if (titleScreen->wavesTopOffset <= i) {
            r3 = titleScreen->wavesTranslationX[i - titleScreen->wavesTopOffset];
            *pointer++ = r3;
            *pointer++ = 0;

            // * DISPLAY_WIDTH
            temp = (titleScreen->wavesTranslationY[i - titleScreen->wavesTopOffset]
                    * 0xF000)
                >> 8;
            temp = (0xF000 - (temp)) >> 1;
            temp = ((temp)*r3) >> 8;

            if (temp > 0x7FFFFFF) {
                temp = 0x7FFFFFF;
            }
            *pointer++ = -temp;
            // j * r3
            if (((j << 8) * r3) >> 8 >= 0x1F80) {
                j = 0;
                // again possibly a macro
                temp = titleScreen->unkF3A;
                *pointer++ = temp;
            } else {
                temp = (((j << 8) * r3) >> 8) + titleScreen->unkF3A;
                *pointer++ = temp;
            }
            j++;
        } else {
            *pointer++ = 0;
            *pointer++ = 0;
            *pointer++ = 0;
            // Could be a macro
            *pointer++ = (({ i + 0x200; }) - titleScreen->wavesTopOffset) << 8;
        }
    }
}

UNUSED static void sub_808CD64(struct TitleScreen *titleScreen)
{
    u16 last = titleScreen->unkF44[6];
    titleScreen->unkF44[6] = titleScreen->unkF44[5];
    titleScreen->unkF44[5] = titleScreen->unkF44[4];
    titleScreen->unkF44[4] = titleScreen->unkF44[3];
    titleScreen->unkF44[3] = titleScreen->unkF44[2];
    titleScreen->unkF44[2] = titleScreen->unkF44[1];
    titleScreen->unkF44[1] = last;
}

UNUSED static void sub_808CDB0(struct TitleScreen *titleScreen, s8 index)
{
    // Might just be a the normal pallet
    u16 *pal = (u16 *)BG_PLTT + (index * 16);

    titleScreen->unkF44[0] = pal[0];
    titleScreen->unkF44[1] = pal[1];
    titleScreen->unkF44[2] = pal[2];
    titleScreen->unkF44[3] = pal[3];
    titleScreen->unkF44[4] = pal[4];
    titleScreen->unkF44[5] = pal[5];
    titleScreen->unkF44[6] = pal[6];
}

static void CreateBirdAnimation(u16 x, s16 y, u16 startStep, u16 p4, u16 p5)
{
    struct Task *t = TaskCreate(Task_BirdAnim, 0x40, 0x2000, 0, 0);
    struct BirdAnimation *animation = TaskGetStructPtr(t);
    Sprite *s = &animation->s;

    s->graphics.dest = VramMalloc(3);
    s->graphics.anim = SA2_ANIM_TITLE_SEAGULL;
    s->variant = 0;
    s->prevVariant = -1;
    s->x = x;
    s->y = y;
    s->graphics.size = 0;
    s->unk1A = SPRITE_OAM_ORDER(3);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(&animation->s);

    animation->unk30 = gBgScrollRegs[1][0];
    animation->unk32 = gBgScrollRegs[1][1];
    animation->unk38 = x * 128;
    animation->unk3A = y * 128;
    animation->unk34 = p4;
    animation->unk36 = p5;
    animation->unk3C = 0;
    animation->unk3D = 0;
    animation->sequenceStep = startStep;
}

static void Task_BirdAnim(void)
{
    struct BirdAnimation *animation = TaskGetStructPtr(gCurTask);
    Sprite *s = &animation->s;
    u16 temp;

    switch (animation->unk3C) {
        case 0:
            animation->unk3A += 0x30;
            break;
        case 1:
            animation->unk3A -= gSineTable[animation->unk3D * 16] >> 10;
            break;
    }

    animation->unk38 += animation->unk34;
    animation->unk3A += animation->unk36;

    if (animation->unk38 & 0x8000) {
        temp = animation->unk38 >> 7 | 0xE000;
    } else {
        temp = (animation->unk38) >> 7;
    }
    s->x = (temp << 0x10 >> 0x10) + animation->unk30 - gBgScrollRegs[1][0];

    if (animation->unk3A & 0x8000) {
        temp = animation->unk3A >> 7 | 0xE000;
    } else {
        temp = animation->unk3A >> 7;
    }
    s->y = (temp << 0x10 >> 0x10) + animation->unk32 - gBgScrollRegs[1][1];

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if ((u16)(s->x + 64) > 368) {
        BirdAnimEnd();
    }

    if ((u16)(s->y + 64) > 308) {
        BirdAnimEnd();
    }

    // Next key frame every 15 frames
    if (++animation->unk3D > 15) {
        animation->unk3C = sBirdAnimModeSequence[animation->sequenceStep];
        animation->sequenceStep++;
        animation->unk3D = 0;
    }
}

static void Task_MenuItemTransitionOutAnim(void)
{
    struct MenuItemTransition *transition = TaskGetStructPtr(gCurTask);
    Sprite *s = transition->s;

    s->x -= sMenuItemTransitionKeyFrames[transition->animFrame];
    gBldRegs.bldAlpha = FadeOutBlend(transition->animFrame * 2);

    DisplaySprite(s);

    if (++transition->animFrame > 8) {
        s->x = transition->unk12;

        s->unk10 &= ~0x80;
        TaskDestroy(gCurTask);
    }
}

static void Task_MenuItemTransitionInAnim(void)
{
    struct MenuItemTransition *transition = TaskGetStructPtr(gCurTask);
    Sprite *s = transition->s;
    s32 i;
    s16 sum = 0;

    for (i = 0; i < 7 - transition->animFrame; i++) {
        sum += sMenuItemTransitionKeyFrames[i];
    };

    s->x = sum + transition->unk12;

    gBldRegs.bldAlpha = FadeInBlend(transition->animFrame * 2);
    DisplaySprite(s);

    if (++transition->animFrame > 8) {
        s->x = transition->unk12;

        s->unk10 &= ~0x80;
        TaskDestroy(gCurTask);
    }
}

static void CreateLensFlareAnimation(void)
{
    struct Task *t
        = TaskCreate(Task_LensFlareAnim, sizeof(struct LensFlare), 0x2000, 0, 0);
    struct LensFlare *lensFlare = TaskGetStructPtr(t);
    Sprite *s;
    SpriteTransform *transform;
    u16 posX;
    u32 i;

    for (i = 0; i < 8; i++) {
        s = &lensFlare->sprites[i];
        transform = &lensFlare->transforms[i];

        s->graphics.dest = VramMalloc(0x40);

        s->graphics.anim = SA2_ANIM_TITLE_LENS_FLARE;
        s->variant = sLensFlareSizes[i];
        s->prevVariant = -1;

        lensFlare->posSequenceX[i] = posX = sLensFlareStartPositions[i][0];
        lensFlare->posSequenceY[i] = sLensFlareStartPositions[i][1];

        s->graphics.size = 0;
        s->unk1A = SPRITE_OAM_ORDER(8 - i);
        s->timeUntilNextFrame = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->unk10 = i
            | (SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE
               | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE);

        transform->rotation = 0;
        transform->height = transform->width = posX * 2 + 0xB0;
        transform->x = lensFlare->posSequenceX[i];
        transform->y = lensFlare->posSequenceY[i];

        UpdateSpriteAnimation(s);
    }

    lensFlare->unk200 = gBgScrollRegs[1][0];
    lensFlare->unk202 = gBgScrollRegs[1][1];
    lensFlare->unk204 = 0;
    lensFlare->animFrame = 0;
}

static void Task_LensFlareAnim(void)
{
    struct LensFlare *lensFlare = TaskGetStructPtr(gCurTask);
    Sprite *s;
    SpriteTransform *transform;
    u32 i;

    lensFlare->unk202 += 3;
    gBgScrollRegs[0][1] -= 3;

    gBldRegs.bldCnt = BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3
        | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0 | BLDCNT_EFFECT_BLEND
        | BLDCNT_TGT1_OBJ;
    gBldRegs.bldAlpha = BLDALPHA_BLEND(7, 31);

    // Show the flares every other frame
    if (!(lensFlare->animFrame & 1)) {
        for (i = 0; i < 8; i++) {
            s = &lensFlare->sprites[i];
            transform = &lensFlare->transforms[i];

            // Potentially a macro
            transform->x = sub_8085654(lensFlare->posSequenceX[i], -0x14,
                                       lensFlare->animFrame * 16, 8, 0);

            transform->y = sub_8085654(lensFlare->posSequenceY[i] + lensFlare->unk202
                                           - gBgScrollRegs[1][1],
                                       -0x14 + lensFlare->unk202 - gBgScrollRegs[1][1],
                                       lensFlare->animFrame * 16, 8, 0);

            sub_8004860(s, transform);
            DisplaySprite(s);
        }
    }

    if (++lensFlare->animFrame > 17) {
        LensFlareAnimEnd();
    };
}

#define TinyChaoGardenConfig ((u32 *)(EWRAM_START + 0x8))

static void LoadTinyChaoGarden(void)
{
    u32 chaoGardenLang;
    u32 unk374 = gLoadedSaveGame->score;

    switch (gLoadedSaveGame->language) {
        case LANG_JAPANESE:
            chaoGardenLang = 0;
            break;
        case LANG_GERMAN:
            chaoGardenLang = 3;
            break;
        case LANG_FRENCH:
            chaoGardenLang = 2;
            break;
        case LANG_SPANISH:
            chaoGardenLang = 4;
            break;
        case LANG_ENGLISH:
        case LANG_ITALIAN:
            chaoGardenLang = 1;
            break;
        default:
            chaoGardenLang = gLoadedSaveGame->language & 1;
            break;
    }

    gFlags |= 0x8000;
    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    LZ77UnCompWram(gMultiBootProgram_TinyChaoGarden, (void *)EWRAM_START);

    // TODO: what is going on here, doesn't work as a struct
    // TODO: what's unk374
    TinyChaoGardenConfig[0] = unk374;
    TinyChaoGardenConfig[1] = chaoGardenLang;
    // sessionId?
    TinyChaoGardenConfig[2] = ((Random() + gFrameCount) << 8) + Random();
    SoftResetExram(0);
}

void CreateTitleScreenAndSkipIntro(void)
{
    struct Task *t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(Task_ShowPressStartMenu, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t));
}

void CreateTitleScreenAtPlayModeMenu(void)
{
    struct Task *t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(Task_JumpToPlayModeMenu, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t));
}

void CreateTitleScreenAtSinglePlayerMenu(void)
{
    struct Task *t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(Task_JumpToSinglePlayerMenu, sizeof(struct TitleScreen), 0x1000, 0,
                   0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t));
}

static void SkipIntro(struct TitleScreen *titleScreen)
{
    struct TransitionState *transition = &titleScreen->unk270;
    gFlags &= ~0x4;

    transition->unk0 = 1;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0x100;
    transition->unk8 = 0x3FBF;
    transition->unkA = 0;
    NextTransitionFrame(transition);

    m4aMPlayAllStop();

    InitTitleScreenUI(titleScreen);
    ShowGameLogo(titleScreen);
    gCurTask->main = Task_ShowTitleScreenIntroSkipped;
}

static void Task_ShowPressStartMenu(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    DisplaySprite(&titleScreen->unkC0);
    ShowGameLogo(titleScreen);

    if (NextTransitionFrame(&titleScreen->unk270) == SCREEN_TRANSITION_COMPLETE) {
        m4aSongNumStart(VOICE__ANNOUNCER__SONIC_ADVANCE_2);
        titleScreen->animFrame = 0;
        gCurTask->main = Task_PressStartMenuMain;
    }
}

static void Task_IntroStartSegaLogoAnim(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    if (NextTransitionFrame(&titleScreen->unk270) == SCREEN_TRANSITION_COMPLETE) {
        gCurTask->main = Task_IntroFadeInSegaLogoAnim;

        gBldRegs.bldAlpha = FadeInBlend(0);
        // Fade in the background effect
        gBldRegs.bldCnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0 | BLDCNT_TGT2_BG2;
        gDispCnt |= DISPCNT_BG0_ON;
    }
}

static void Task_IntroShowSegaLogo(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    if (titleScreen->animFrame > FRAME_TIME_SECONDS(2)) {
        titleScreen->animFrame = 0;
        gCurTask->main = Task_IntroFadeOutSegaLogoAnim;
    }
    titleScreen->animFrame++;
}

static void Task_IntroShowSonicTeamLogo(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);
    WavesBackgroundAnim(titleScreen);

    // After 120 frames
    if (titleScreen->animFrame > FRAME_TIME_SECONDS(2)) {
        gCurTask->main = Task_IntroFadeOutSonicTeamLogoAnim;
        titleScreen->animFrame = 0;
    }
    titleScreen->animFrame++;
}

static void Task_IntroWaitUntilTitleScreenFanfare(void)
{
    struct TitleScreen *titleScreen = TaskGetStructPtr(gCurTask);

    // Wait for the fanfare to start on the intro music
    // before playing annoucement
    if (titleScreen->animFrame > FRAME_TIME_SECONDS(1)) {
        gFlags &= ~0x4;
        titleScreen->animFrame = 0;
        m4aSongNumStart(VOICE__ANNOUNCER__SONIC_ADVANCE_2);
        gCurTask->main = Task_PressStartMenuMain;
    }
    titleScreen->animFrame++;

    ShowGameLogo(titleScreen);
}

static void Task_StartTitleScreenDemo(void)
{
    gInputRecorder.mode = RECORDER_PLAYBACK;

    gInputPlaybackData = gDemoRecordings[0];
    gSelectedCharacter = CHARACTER_SONIC;
    gCurrentLevel = sDemoLevels[0];

    gDemoPlayCounter++;
    // Don't count higher than 3
    gDemoPlayCounter &= 3;

    gGameMode = GAME_MODE_SINGLE_PLAYER;

    CreateDemoManager();
    ApplyGameStageSettings();
    GameStageStart();

    TaskDestroy(gCurTask);
}

static void ShowGameLogo(struct TitleScreen *_)
{
    // angle, width, height, right, bottom, left, top
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 20, 8, gBgAffineRegs);
}

static void BirdAnimEnd(void)
{
    struct BirdAnimation *animation = TaskGetStructPtr(gCurTask);
    Sprite *s = &animation->s;

    VramFree(s->graphics.dest);
    TaskDestroy(gCurTask);
}

static void CreateMenuItemTransition(Sprite *s, u8 type)
{
    struct Task *t;
    struct MenuItemTransition *transition;

    if (type == TRANSITION_OUT) {
        t = TaskCreate(Task_MenuItemTransitionOutAnim, sizeof(struct MenuItemTransition),
                       0x2000, 0, 0);
    } else if (type == TRANSITION_IN) {
        t = TaskCreate(Task_MenuItemTransitionInAnim, sizeof(struct MenuItemTransition),
                       0x2000, 0, 0);
    } else {
        return;
    }
    transition = TaskGetStructPtr(t);

    s->unk10 |= 0x80;
    transition->s = s;
    transition->unk12 = s->x;
    transition->animFrame = 0;
}

static void LensFlareAnimEnd(void)
{
    struct LensFlare *lensFlare = TaskGetStructPtr(gCurTask);

    u32 i;
    for (i = 0; i < 8; i++) {
        VramFree(lensFlare->sprites[i].graphics.dest);
    }

    TaskDestroy(gCurTask);
}

// TODO: understand why this is inline
static inline void inline_CreateTitleScreenTaskWithoutIntro(TaskMain main)
{
    struct Task *t = TaskCreate(main, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t));
}

UNUSED void sub_808D824(void)
{
    // Unused but required for match
    struct Task *prevTask = gCurTask;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    inline_CreateTitleScreenTaskWithoutIntro(Task_ShowPressStartMenu);

    TaskDestroy(gCurTask);
}

// Might not in game/title_screen
static void sub_808D874(void)
{
    CpuFastSet(sUnknown_080E0EF4, (void *)(BG_PLTT + 0x1C0), 1);
    REG_SIOCNT |= SIO_INTR_ENABLE;
}
