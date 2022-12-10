#include "global.h"
#include "cut_scenes_credits.h"
#include "cut_scenes_credits_end.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "m4a.h"
#include "save.h"

struct CreditsCutScene {
    Background unk0;
    struct UNK_802D4CC_UNK270 unk40;

    u8 endingVariant;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u16 unk52;
    u32 unk54;
}; /* 0x58 */

void sub_808ED5C(struct Task *);
void sub_808EBC4(void);

static const u16 gUnknown_080E1244[] = {
    // 0 or 1
    227,
    228,
    229,
    230,
    231,
    // 2
    211,
    212,
    213,
    214,
    215,
};

UNUSED static const u16 gUnknown_080E124E[]
    = { 56, 0, 828, 0, 78, 0, 828, 1, 60, 0, 828, 2, 96, 0, 828, 3 };

void CreateCreditsCutScene(u8 endingVariant, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsCutScene *scene = NULL;
    Background *background;
    struct UNK_802D4CC_UNK270 *transitionConfig;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5c00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 0x20;

    t = TaskCreate(sub_808EBC4, 0x58, 0x3100, 0, sub_808ED5C);

    // BUG: assigning to null pointer
    scene->unk52 = 0;

    scene = TaskGetStructPtr(t);
    scene->endingVariant = endingVariant;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk54 = 0xB4;

    if (scene->endingVariant == 2) {
        scene->unk50 = 5;
    } else {
        scene->unk50 = 0;
    }

    if ((scene->endingVariant == 1 && gLoadedSaveGame->unk15[4] != 0)) {
        scene->unk4D = 1;
    } else if (scene->endingVariant == 2 && gLoadedSaveGame->unk1B != 0) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    transitionConfig = &scene->unk40;
    transitionConfig->unk0 = 0;
    transitionConfig->unk4 = 0;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FFF;

    background = &scene->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1244[scene->unk50 + scene->unk4E];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);
}

void sub_808ECB4(void);

void sub_808EC64(void);

void sub_808EBC4(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 2;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808EC64;
    }
}

void sub_808ED04(void);

void sub_808EC28(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808ED04;
    }
}

void sub_808EC64(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (scene->unk54 != 0) {
        scene->unk54--;
    } else {
        gCurTask->main = sub_808EC28;
    }
}

void sub_808ECB4(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        CreateCreditsEndCutScene(scene->endingVariant);
        TaskDestroy(gCurTask);
    }
}

void CreateCreditsSlidesCutScene(u8, u8, u8);

void sub_808ED04(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    scene->unk4E++;
    if (scene->unk4F < 4) {
        CreateCreditsSlidesCutScene(scene->endingVariant, scene->unk4E, scene->unk4F);
    } else {
        CreateCreditsEndCutScene(scene->endingVariant);
    }
    TaskDestroy(gCurTask);
}

void sub_808ED5C(UNUSED struct Task *t) { }
