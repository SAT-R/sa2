#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "trig.h"
#include "course_select.h"
#include "save.h"
#include "title_screen.h"
#include "random.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

extern void sub_808E8F8(s16 *ptr, s16 a, u8 b);
extern void sub_808E95C(s32 *ptr, s32 a, u8 b);

extern void CreateCreditsCutScene(u8 a, u8 b, u8 c);
extern void CreateCreditsEndCutScene(u8);

struct CreditsSlidesCutScene {
    struct Unk_03002400 unk0;
    struct UNK_802D4CC_UNK270 unk40;

    u8 unk4C;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u8 unk51;
    u8 unk52;
    u32 unk54;
    u32 unk58;
};

void sub_808F004(void);
void sub_808F148(struct Task *);

extern const u8 gUnknown_080E12AA[6];
extern const u16 gUnknown_080E1278[25];

void CreateCreditsSlidesCutScene(u8 endingVariant, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsSlidesCutScene *scene = NULL;
    struct Unk_03002400 *background;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;
    u8 i;

    gDispCnt = 0x1241;
    gBgCntRegs[1] = 0x1C04;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 0x20;

    t = TaskCreate(sub_808F004, 0x5C, 0x3100, 0, sub_808F148);
    scene = TaskGetStructPtr(t);
    scene->unk4C = endingVariant;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk52 = 0;
    scene->unk54 = 0x96;
    scene->unk50 = 0;

    if (scene->unk4C == 1 && gLoadedSaveGame->unk15[4] != 0) {
        scene->unk4D = 1;
    } else if (scene->unk4C == 2 && gLoadedSaveGame->unk1B != 0) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    for (i = 0; i < scene->unk4F; i++) {
        scene->unk50 += gUnknown_080E12AA[i];
    }

    scene->unk51 = scene->unk50 + gUnknown_080E12AA[scene->unk4F];

    transitionConfig = &scene->unk40;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x200;
    transitionConfig->unk8 = 0x3FFF;

    if (gUnknown_080E1278[scene->unk50] != 0) {
        background = &scene->unk0;
        background->unk4 = BG_SCREEN_ADDR(8);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E1278[scene->unk50];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 1;
        sub_8002A3C(background);
    }
}

void sub_808F10C(void);

void sub_808EF38(void)
{
    struct CreditsSlidesCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 1;
    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        scene->unk50++;

        if (scene->unk50 < scene->unk51) {
            if (gUnknown_080E1278[scene->unk50] != 0) {
                struct Unk_03002400 *background = &scene->unk0;
                background->unk4 = BG_SCREEN_ADDR(8);
                background->unkA = 0;
                background->unkC = BG_SCREEN_ADDR(28);
                background->unk18 = 0;
                background->unk1A = 0;
                background->unk1C = gUnknown_080E1278[scene->unk50];
                background->unk1E = 0;
                background->unk20 = 0;
                background->unk22 = 0;
                background->unk24 = 0;
                background->unk26 = 0x1E;
                background->unk28 = 0x14;
                background->unk2A = 0;
                background->unk2E = 1;
                sub_8002A3C(background);
            }
            gCurTask->main = sub_808F004;
        } else {
            gCurTask->main = sub_808F10C;
        }
    }
}

void sub_808F0BC(void);
void sub_808F068(void);

void sub_808F004(void)
{
    struct CreditsSlidesCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 2;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808F0BC;
    }

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808F068;
    }
}

void sub_808F068(void)
{
    struct CreditsSlidesCutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk54 != 0) {
        scene->unk54--;
    } else {
        scene->unk54 = 0x96;
        gCurTask->main = sub_808EF38;
    }

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808F0BC;
    }
}

void sub_808F0BC(void)
{
    struct CreditsSlidesCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        CreateCreditsEndCutScene(scene->unk4C);
        TaskDestroy(gCurTask);
    }
}

void sub_808F10C(void)
{
    struct CreditsSlidesCutScene *scene = TaskGetStructPtr(gCurTask);
    scene->unk4F++;
    CreateCreditsCutScene(scene->unk4C, scene->unk4E, scene->unk4F);
    TaskDestroy(gCurTask);
}

void sub_808F148(UNUSED struct Task *t)
{
    // unused logic
}
