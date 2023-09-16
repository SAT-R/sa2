#include "global.h"
#include "game/cutscenes/credits.h"
#include "game/cutscenes/credits_end.h"
#include "game/cutscenes/credits_slides.h"
#include "core.h"
#include "game/game.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/save.h"

#include "constants/tilemaps.h"

struct CreditsCutScene {
    Background unk0;
    struct TransitionState unk40;

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

UNUSED static const u16 gUnknown_080E124E[]
    = { 56, 0, 828, 0, 78, 0, 828, 1, 60, 0, 828, 2, 96, 0, 828, 3 };

void CreateCreditsCutScene(u8 creditsVariant, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsCutScene *scene = NULL;
    Background *background;
    struct TransitionState *transition;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5c00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 0x20;

    t = TaskCreate(sub_808EBC4, 0x58, 0x3100, 0, TaskDestroy_CreditsCutScene);

    // BUG: assigning to null pointer
    scene->unk52 = 0;

    scene = TaskGetStructPtr(t);
    scene->variant = creditsVariant;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk54 = 0xB4;

    if (scene->variant == CREDITS_VARIANT_EXTRA_ENDING) {
        scene->unk50 = 5;
    } else {
        scene->unk50 = 0;
    }

    if ((scene->variant == CREDITS_VARIANT_FINAL_ENDING
         && gLoadedSaveGame->completedCharacters[CHARACTER_AMY])) {
        scene->unk4D = 1;
    } else if (scene->variant == CREDITS_VARIANT_EXTRA_ENDING
               && gLoadedSaveGame->extraEndingCreditsPlayed) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    transition = &scene->unk40;
    transition->unk0 = 0;
    transition->unk4 = Q_8_8(0);
    transition->unkA = 0;
    transition->speed = 0x100;
    transition->unk8 = 0x3FFF;

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
    sub_8002A3C(background);
}

static void sub_808EBC4(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;

    transition->unk2 = 2;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (NextTransitionFrame(transition) == SCREEN_TRANSITION_COMPLETE) {
        transition->unk4 = Q_8_8(0);
        gCurTask->main = sub_808EC64;
    }
}

static void sub_808EC28(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;
    transition->unk2 = 1;

    if (NextTransitionFrame(transition) == SCREEN_TRANSITION_COMPLETE) {
        transition->unk4 = Q_8_8(0);
        gCurTask->main = sub_808ED04;
    }
}

static void sub_808EC64(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;

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
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;
    transition->unk2 = 1;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (NextTransitionFrame(transition) == SCREEN_TRANSITION_COMPLETE) {
        transition->unk4 = Q_8_8(0);
        CreateCreditsEndCutScene(scene->variant);
        TaskDestroy(gCurTask);
    }
}

static void sub_808ED04(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    scene->unk4E++;
    if (scene->unk4F < 4) {
        CreateCreditsSlidesCutScene(scene->variant, scene->unk4E, scene->unk4F);
    } else {
        CreateCreditsEndCutScene(scene->variant);
    }
    TaskDestroy(gCurTask);
}

static void TaskDestroy_CreditsCutScene(UNUSED struct Task *t) { }
