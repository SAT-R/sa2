#include "global.h"
#include "game/cutscenes/credits.h"
#include "core.h"
#include "game/game.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

struct ExtraEndingCutSceneSlides {
    Background unk0;
    struct TransitionState unk40;
    u16 unk4C;
}; /* 0x50 */

void sub_8091590(void);
void sub_8091680(struct Task *);

void CreateExtraEndingSlidesCutScene(void)
{
    struct Task *t = NULL;
    struct ExtraEndingCutSceneSlides *scene;
    Background *background;
    struct TransitionState *transition = NULL;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5C00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x20;

    t = TaskCreate(sub_8091590, 0x50, 0x3100, 0, sub_8091680);
    scene = TaskGetStructPtr(t);

    scene->unk4C = 0xF0;

    transition = &scene->unk40;
    transition->unk2 = 1;
    transition->unk0 = 1;
    transition->unk4 = Q_8_8(0);
    transition->speed = 0x80;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;

    background = &scene->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_STORYFRAME_SONIC_CATCHES_VANILLA;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    sub_8002A3C(background);
}

void sub_8091608(void);

void sub_8091590(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;

    transition->unk2 = 2;
    if (NextTransitionFrame(transition) == SCREEN_TRANSITION_COMPLETE) {
        transition->unk4 = Q_8_8(0);
        gCurTask->main = sub_8091608;
    }
}

void sub_8091638(void);

void sub_80915CC(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);
    struct TransitionState *transition = &scene->unk40;

    transition->unk2 = 1;
    if (NextTransitionFrame(transition) == SCREEN_TRANSITION_COMPLETE) {
        transition->unk4 = Q_8_8(0);
        gCurTask->main = sub_8091638;
    }
}

void sub_8091608(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk4C != 0) {
        scene->unk4C--;
    } else {
        scene->unk4C = 0xF0;
        gCurTask->main = sub_80915CC;
    }
}

void sub_8091638(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk4C != 0) {
        scene->unk4C--;
        if (scene->unk4C == 0x3C) {
            m4aSongNumStart(MUS_STAFF_CREDITS);
        }
    } else {
        CreateCreditsCutScene(CREDITS_VARIANT_EXTRA_ENDING, 0, 0);
        TaskDestroy(gCurTask);
    }
}

void sub_8091680(struct Task *t)
{
    // unused logic
}
