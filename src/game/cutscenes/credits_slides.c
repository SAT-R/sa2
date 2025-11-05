#include "global.h"
#include "game/cutscenes/credits.h"
#include "game/cutscenes/credits_end.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/tilemaps.h"

typedef struct {
    Background unk0;
    ScreenFade unk40;

    u8 creditsVariant;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u8 unk51;
    u8 unk52;
    u32 unk54;
    u32 unk58;
} CreditsSlidesCutScene;

void sub_808F004(void);
void sub_808F148(struct Task *);

static const u16 sTilemapsCreditsSlides[] = {
    TM_CREDITS_0,  TM_CREDITS_1,  TM_CREDITS_2,  TM_CREDITS_3,  TM_CREDITS_4,  TM_CREDITS_5,  TM_CREDITS_6,  TM_CREDITS_7,  TM_CREDITS_8,
    TM_CREDITS_9,  TM_CREDITS_10, TM_CREDITS_11, TM_CREDITS_12, TM_CREDITS_13, TM_CREDITS_14, TM_CREDITS_15, TM_CREDITS_16, TM_CREDITS_17,
    TM_CREDITS_18, TM_CREDITS_19, TM_CREDITS_20, TM_CREDITS_21, TM_CREDITS_22, TM_CREDITS_23, TM_CREDITS_24,
};

static const u8 gUnknown_080E12AA[] = { 6, 6, 8, 5, 0, 0 };

void CreateCreditsSlidesCutScene(u8 creditsVariant, u8 b, u8 c)
{
    struct Task *t;
    CreditsSlidesCutScene *scene = NULL;
    Background *background;
    ScreenFade *fade = NULL;
    u8 i;

    gDispCnt = 0x1241;
    gBgCntRegs[1] = 0x1C04;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    INIT_BG_SPRITES_LAYER_32(1);

    t = TaskCreate(sub_808F004, sizeof(CreditsSlidesCutScene), 0x3100, 0, sub_808F148);
    scene = TASK_DATA(t);
    scene->creditsVariant = creditsVariant;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk52 = 0;
    scene->unk54 = 0x96;
    scene->unk50 = 0;

    if (scene->creditsVariant == CREDITS_VARIANT_FINAL_ENDING && gLoadedSaveGame->completedCharacters[CHARACTER_AMY]) {
        scene->unk4D = 1;
    } else if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING && gLoadedSaveGame->extraEndingCreditsPlayed) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    for (i = 0; i < scene->unk4F; i++) {
        scene->unk50 += gUnknown_080E12AA[i];
    }

    scene->unk51 = scene->unk50 + gUnknown_080E12AA[scene->unk4F];

    fade = &scene->unk40;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->bldAlpha = 0;
    fade->speed = 0x200;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);

    if (sTilemapsCreditsSlides[scene->unk50] != 0) {
        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->tilemapId = sTilemapsCreditsSlides[scene->unk50];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        background->targetTilesY = 0x14;
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAGS_BG_ID(1);
        DrawBackground(background);
    }
}

void sub_808F10C(void);

void sub_808EF38(void)
{
    CreditsSlidesCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;

    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        scene->unk50++;

        if (scene->unk50 < scene->unk51) {
            if (sTilemapsCreditsSlides[scene->unk50] != 0) {
                Background *background = &scene->unk0;
                background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
                background->graphics.anim = 0;
                background->layoutVram = (void *)BG_SCREEN_ADDR(28);
                background->unk18 = 0;
                background->unk1A = 0;
                background->tilemapId = sTilemapsCreditsSlides[scene->unk50];
                background->unk1E = 0;
                background->unk20 = 0;
                background->unk22 = 0;
                background->unk24 = 0;
                background->targetTilesX = 0x1E;
                background->targetTilesY = 0x14;
                background->paletteOffset = 0;
                background->flags = BACKGROUND_FLAGS_BG_ID(1);
                DrawBackground(background);
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
    CreditsSlidesCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808F0BC;
    }

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_808F068;
    }
}

void sub_808F068(void)
{
    CreditsSlidesCutScene *scene = TASK_DATA(gCurTask);

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
    CreditsSlidesCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk40;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        CreateCreditsEndCutScene(scene->creditsVariant);
        TaskDestroy(gCurTask);
    }
}

void sub_808F10C(void)
{
    CreditsSlidesCutScene *scene = TASK_DATA(gCurTask);
    scene->unk4F++;
    CreateCreditsCutScene(scene->creditsVariant, scene->unk4E, scene->unk4F);
    TaskDestroy(gCurTask);
}

void sub_808F148(UNUSED struct Task *t)
{
    // unused logic
}
