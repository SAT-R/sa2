#include "global.h"
#include "game/cutscenes/credits.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

struct ExtraEndingCutSceneSlides {
    Background unk0;
    ScreenFade unk40;
    u16 unk4C;
}; /* 0x50 */

void sub_8091590(void);
void sub_8091680(struct Task *);

void CreateExtraEndingSlidesCutScene(void)
{
    struct Task *t = NULL;
    struct ExtraEndingCutSceneSlides *scene;
    Background *background;
    ScreenFade *fade = NULL;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5C00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    INIT_BG_SPRITES_LAYER_32(0);

    t = TaskCreate(sub_8091590, sizeof(struct ExtraEndingCutSceneSlides), 0x3100, 0, sub_8091680);
    scene = TASK_DATA(t);

    scene->unk4C = 240;

    fade = &scene->unk40;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->speed = Q(0.5);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;

    background = &scene->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_STORYFRAME_SONIC_CATCHES_VANILLA;
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

void sub_8091608(void);

void sub_8091590(void)
{
    struct ExtraEndingCutSceneSlides *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;

    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_8091608;
    }
}

void sub_8091638(void);

void sub_80915CC(void)
{
    struct ExtraEndingCutSceneSlides *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;

    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_8091638;
    }
}

void sub_8091608(void)
{
    struct ExtraEndingCutSceneSlides *scene = TASK_DATA(gCurTask);

    if (scene->unk4C != 0) {
        scene->unk4C--;
    } else {
        scene->unk4C = 240;
        gCurTask->main = sub_80915CC;
    }
}

void sub_8091638(void)
{
    struct ExtraEndingCutSceneSlides *scene = TASK_DATA(gCurTask);

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
