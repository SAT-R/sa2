#include "global.h"
#include "game/cutscenes/credits.h"
#include "game/cutscenes/credits_end.h"
#include "game/cutscenes/credits_slides.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"

#include "constants/tilemaps.h"

struct CreditsCutScene {
    Background unk0;
    ScreenFade unk40;

    u8 variant;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u16 unk52;
    u32 unk54;
}; /* 0x58 */

static void TaskDestroy_CreditsCutScene(struct Task *);
static void sub_808EBC4(void);
static void sub_808ECB4(void);

static void sub_808EC64(void);
static void sub_808ED04(void);

static const u16 gUnknown_080E1244[] = {
    // 0 or 1
    TM_STORYFRAME_CREAM_UNLOCK_0_SEPIA,
    TM_STORYFRAME_CREAM_UNLOCK_1_SEPIA,
    TM_STORYFRAME_TAILS_UNLOCK_1_SEPIA,
    TM_STORYFRAME_KNUCKLES_UNLOCK_1_SEPIA,
    TM_STORYFRAME_CREAM_UNLOCK_3_SEPIA,
    // 2
    TM_STORYFRAME_SONIC_FINDS_FRIENDS,
    TM_STORYFRAME_SONIC_PATS_TAILS,
    TM_STORYFRAME_CREAM_HUGS_VANILLA,
    TM_STORYFRAME_CREAM_TAILS_VANILLA_LOOK_AROUND,
    TM_STORYFRAME_CREAM_CHEESE_VANILLA_HAPPY,
};

UNUSED static const u16 gUnknown_080E124E[] = { 56, 0, 828, 0, 78, 0, 828, 1, 60, 0, 828, 2, 96, 0, 828, 3 };

void CreateCreditsCutScene(u8 creditsVariant, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsCutScene *scene = NULL;
    Background *background;
    ScreenFade *fade;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5c00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    INIT_BG_SPRITES_LAYER_32(0);

    t = TaskCreate(sub_808EBC4, sizeof(struct CreditsCutScene), 0x3100, 0, TaskDestroy_CreditsCutScene);

#ifdef BUG_FIX
    // Prevent 'scene' from being nullpointer when accessed
    scene = TASK_DATA(t);
#endif

    scene->unk52 = 0;

    scene = TASK_DATA(t);
    scene->variant = creditsVariant;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk54 = 0xB4;

    if (scene->variant == CREDITS_VARIANT_EXTRA_ENDING) {
        scene->unk50 = 5;
    } else {
        scene->unk50 = 0;
    }

    if ((scene->variant == CREDITS_VARIANT_FINAL_ENDING && gLoadedSaveGame->completedCharacters[CHARACTER_AMY])) {
        scene->unk4D = 1;
    } else if (scene->variant == CREDITS_VARIANT_EXTRA_ENDING && gLoadedSaveGame->extraEndingCreditsPlayed) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    fade = &scene->unk40;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->brightness = Q_8_8(0);
    fade->bldAlpha = 0;
    fade->speed = 0x100;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);

    background = &scene->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = gUnknown_080E1244[scene->unk50 + scene->unk4E];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);
}

static void sub_808EBC4(void)
{
    struct CreditsCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;

    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_808EC64;
    }
}

static void sub_808EC28(void)
{
    struct CreditsCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_808ED04;
    }
}

static void sub_808EC64(void)
{
    struct CreditsCutScene *scene = TASK_DATA(gCurTask);

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (scene->unk54 != 0) {
        scene->unk54--;
    } else {
        gCurTask->main = sub_808EC28;
    }
}

static void sub_808ECB4(void)
{
    struct CreditsCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        CreateCreditsEndCutScene(scene->variant);
        TaskDestroy(gCurTask);
    }
}

static void sub_808ED04(void)
{
    struct CreditsCutScene *scene = TASK_DATA(gCurTask);
    scene->unk4E++;
    if (scene->unk4F < 4) {
        CreateCreditsSlidesCutScene(scene->variant, scene->unk4E, scene->unk4F);
    } else {
        CreateCreditsEndCutScene(scene->variant);
    }
    TaskDestroy(gCurTask);
}

static void TaskDestroy_CreditsCutScene(UNUSED struct Task *t) { }
