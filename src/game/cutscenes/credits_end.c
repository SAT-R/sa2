#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "animation_commands_bg.h"
#include "lib/m4a/m4a.h"
#include "game/cutscenes/credits.h"
#include "game/cutscenes/credits_end.h"
#include "game/cutscenes/missing_emeralds.h"
#include "game/save.h"
#include "game/stage/screen_fade.h"
#include "game/title_screen.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct CreditsEndCutScene {
    Background unk0;
    Background unk40;
    Background unk80;
    Sprite unkC0;
    Sprite unkF0;
    Sprite unk120;
    ScreenFade fade;
    u8 creditsVariant;
    u8 sequence;
    u8 unk15E;
    u8 sonicAnimFrame;
    u8 unk160;
    bool8 hasAllEmeralds;
    s16 unk162;
    u32 delayFrames;
    s16 congratsAnimFrame;
    // vram
    void *unk16C;
    s32 unk170[3][2];
}; /* size: 0x188 */

#define SEQUENCE_GAME_END_SCREEN          0
#define SEQUENCE_FADE_TO_COPYRIGHT_SCREEN 1
#define SEQUENCE_COPYRIGHT_SCREEN         2
#define SEQUENCE_END                      3

static void Task_FadeIn(void);
static void TaskDestroy_CreditsEndCutScene(struct Task *);
static void UpdateCongratsMessagePos(struct CreditsEndCutScene *);
static void UpdateMessageLine1Pos(struct CreditsEndCutScene *);
static void UpdateMessageLine2Pos(struct CreditsEndCutScene *);
static void RenderExtraEndingElements(struct CreditsEndCutScene *);
static void Task_HandleGameCompletion(void);

static void Task_CreateCopyrightScreen(void);
static void Task_SequenceEnd(void);
static void Task_FadeIn(void);

static const u16 sTilemapsCreditsEndSlides[] = {
    [0] = TM_CREDITS_SA2_LOGO_JP,         [1] = TM_CREDITS_SA2_LOGO_EN,        [2] = TM_STORYFRAME_SONIC_LEAVES_0,
    [3] = TM_STORYFRAME_SONIC_LEAVES_1,   [4] = TM_STORYFRAME_SONIC_LEAVES_2,  [5] = TM_STORYFRAME_SONIC_LEAVES_3,
    [6] = TM_STORYFRAME_SONIC_LEAVES_4,   [7] = TM_STORYFRAME_SONIC_LEAVES_5,  [8] = TM_STORYFRAME_SONIC_LEAVES_6,
    [9] = TM_STORYFRAME_SONIC_LEAVES_7,   [10] = TM_STORYFRAME_SONIC_LEAVES_8, [11] = TM_STORYFRAME_SONIC_LEAVES_9,
    [12] = TM_STORYFRAME_SONIC_LEAVES_10, [13] = TM_CREDITS_PRESENTED_BY_SEGA, [14] = TM_CREDITS_COPYRIGHT,
};

static const TileInfo gUnknown_080E12D0[4] = {
    { 48, 781, 0 },
    { 26, 781, 1 },
    { 32, 781, 2 },
    { 63, SA2_ANIM_CREDITS_COPYRIGHT, 0 },
};

static const u8 gUnknown_080E12F0[] = {
    42, 3, 3, 3, 3, 3, 3, 3, 12, 4, 4, 0,
};

void CreateCreditsEndCutScene(u8 creditsVariant)
{
    u8 i;
    s32 r6 = 1;
    struct Task *t;
    struct CreditsEndCutScene *scene = NULL;
    ScreenFade *fade;
    gDispCnt = 0x1040;

    gBgCntRegs[0] = 0x160D;
    gBgCntRegs[1] = 0x5480;

#ifndef JAPAN
    gBgCntRegs[2] = 0x1504;

#ifndef NON_MATCHING
    DmaFill32(3, 0, BG_CHAR_ADDR((++r6, --r6)), sizeof(Background) * 256);
#else
    DmaFill32(3, 0, BG_CHAR_ADDR(r6), sizeof(Background) * 256);
#endif

    gBgSprites_Unknown1[2] = 0x5a;
    gBgSprites_Unknown2[2][0] = 0;
    gBgSprites_Unknown2[2][1] = 0;
    gBgSprites_Unknown2[2][2] = 0xff;
    gBgSprites_Unknown2[2][3] = 0x20;
#endif
    INIT_BG_SPRITES_LAYER_32(0);
    INIT_BG_SPRITES_LAYER_32(1);

    t = TaskCreate(Task_FadeIn, sizeof(struct CreditsEndCutScene), 0x3100, 0, TaskDestroy_CreditsEndCutScene);
    scene = TASK_DATA(t);
    scene->delayFrames = 270;
    scene->creditsVariant = creditsVariant;
    scene->sequence = SEQUENCE_GAME_END_SCREEN;
    scene->unk15E = 0;
    scene->sonicAnimFrame = 0;
    scene->congratsAnimFrame = 0x1E;
    scene->unk160 = 0;
    scene->hasAllEmeralds = FALSE;
    scene->unk162 = -1;
    if (gLoadedSaveGame->language != LANG_JAPANESE) {
        scene->unk160 = 1;
    }

    for (i = 0; i < 2; i++) {
        scene->unk170[0][i] = 0;
        scene->unk170[1][i] = Q(180);

        // NOTE: set but never used
        scene->unk170[2][i] = Q(200);
    }

    fade = &scene->fade;
    fade->window = 1;
    fade->brightness = Q(0);
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->bldAlpha = 0;
    fade->speed = 0x100;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);

    scene->unk16C = OBJ_VRAM0;

    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        Background *background = &scene->unk40;
        {
            gDispCnt |= 0x100;
            gBgScrollRegs[0][0] = 0;
            gBgScrollRegs[0][1] = 0;

            background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
            background->graphics.anim = 0;
            background->layoutVram = (void *)BG_SCREEN_ADDR(22);
            background->unk18 = 0;
            background->unk1A = 0;
            background->tilemapId = sTilemapsCreditsEndSlides[2];
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

        {
            Sprite *s;
            s = &scene->unkC0;
            s->graphics.dest = scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[0].numTiles * TILE_SIZE_4BPP);
            s->graphics.anim = gUnknown_080E12D0[0].anim;
            s->variant = gUnknown_080E12D0[0].variant;
            s->prevVariant = -1;
            s->x = (DISPLAY_WIDTH / 2);
            s->y = -20;
            s->oamFlags = SPRITE_OAM_ORDER(0);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0;
            s->hitboxes[0].index = -1;
            UpdateSpriteAnimation(s);
        }

        {
            Sprite *s;
            s = &scene->unkF0;
            s->graphics.dest = scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[1].numTiles * TILE_SIZE_4BPP);
            s->graphics.anim = gUnknown_080E12D0[1].anim;
            s->variant = gUnknown_080E12D0[1].variant;
            s->prevVariant = -1;
            s->x = (DISPLAY_WIDTH / 2);
            s->y = DISPLAY_HEIGHT + 96; // Note: 96 is the width of metatiles
            s->oamFlags = SPRITE_OAM_ORDER(0);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0;
            s->hitboxes[0].index = -1;
            UpdateSpriteAnimation(s);
        }

        {
            Sprite *s;
            s = &scene->unk120;
            s->graphics.dest = scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[2].numTiles * TILE_SIZE_4BPP);
            s->graphics.anim = gUnknown_080E12D0[2].anim;
            s->variant = gUnknown_080E12D0[2].variant;
            s->prevVariant = -1;
            s->x = (DISPLAY_WIDTH / 2);
            s->y = DISPLAY_HEIGHT + 96;
            s->oamFlags = SPRITE_OAM_ORDER(0);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0;
            s->hitboxes[0].index = -1;
            UpdateSpriteAnimation(s);
        }

        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->tilemapId = sTilemapsCreditsEndSlides[scene->sonicAnimFrame + 2];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        background->targetTilesY = 0x14;
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAGS_BG_ID(0);
        DrawBackground(background);
        UpdateBgAnimationTiles(background);
    }

    if (scene->creditsVariant == CREDITS_VARIANT_FINAL_ENDING) {
        Background *background;
        gDispCnt |= 0x200;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;

        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(20);
        background->unk18 = 0;
        background->unk1A = 0;
        background->tilemapId = sTilemapsCreditsEndSlides[scene->unk160];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        background->targetTilesY = 0x14;
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAG_4 | BACKGROUND_FLAGS_BG_ID(1);
        DrawBackground(background);
    }
}

static void Task_FadeOut(void)
{
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->fade;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        UpdateCongratsMessagePos(scene);
        UpdateMessageLine1Pos(scene);
        UpdateMessageLine2Pos(scene);
    }

    RenderExtraEndingElements(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);

        if (scene->sequence == SEQUENCE_FADE_TO_COPYRIGHT_SCREEN) {
            gCurTask->main = Task_CreateCopyrightScreen;
        } else {
            gCurTask->main = Task_SequenceEnd;
        }
    }
}

static void Task_CreateCopyrightScreen(void)
{
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);

    if (scene->delayFrames > 0) {
        scene->delayFrames--;
        return;
    }
    {
        Background *background = &scene->unk40;
        gDispCnt &= ~0x200;
        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->tilemapId = sTilemapsCreditsEndSlides[13];
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
#ifndef JAPAN
    {
        Background *background = &scene->unk80;
        gDispCnt |= 0x400;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0xD190;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(21);
        background->unk18 = 0;
        background->unk1A = 0;
        background->tilemapId = sTilemapsCreditsEndSlides[14];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        background->targetTilesY = 3;
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAGS_BG_ID(2);
        DrawBackground(background);
    }
#endif
    scene->sequence = SEQUENCE_COPYRIGHT_SCREEN;
    scene->sonicAnimFrame++;
    scene->delayFrames = 270;
    gCurTask->main = Task_FadeIn;
}

static void Task_SequenceMain(void)
{
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);

    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        UpdateCongratsMessagePos(scene);
        UpdateMessageLine1Pos(scene);
        UpdateMessageLine2Pos(scene);

        if (scene->sonicAnimFrame < 11) {
            if (scene->unk15E > 0) {
                scene->unk15E--;
            } else {
                Background *background = &scene->unk40;
                gDispCnt |= 0x100;
                gBgScrollRegs[0][0] = 0;
                gBgScrollRegs[0][1] = 0;

                background->tilemapId = sTilemapsCreditsEndSlides[scene->sonicAnimFrame + 2];
                background->targetTilesX = 0x1E;
                background->targetTilesY = 0x14;
                background->flags = BACKGROUND_FLAGS_BG_ID(0);
                DrawBackground(background);
                scene->sonicAnimFrame++;

                scene->unk15E = gUnknown_080E12F0[scene->sonicAnimFrame];

                if (scene->sonicAnimFrame == 9) {
                    m4aSongNumStart(VOICE__ANNOUNCER__CONGRATULATIONS);
                }
            }
        }
    }

    RenderExtraEndingElements(scene);
    if (scene->delayFrames > 0) {
        scene->delayFrames--;
        return;
    }

    if (scene->sequence == SEQUENCE_GAME_END_SCREEN) {
        scene->sequence = SEQUENCE_FADE_TO_COPYRIGHT_SCREEN;
        scene->delayFrames = 30;
        gCurTask->main = Task_FadeOut;
    } else if (scene->sequence == SEQUENCE_COPYRIGHT_SCREEN) {
        gCurTask->main = Task_HandleGameCompletion;
    }
}

static void Task_HandleGameCompletion(void)
{
    u8 charactersCompleted = 0;
    u8 zonesCompleteCharacters = 0;
    u8 i;
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);

#ifndef NON_MATCHING
    u16 var = zonesCompleteCharacters;
    asm("" ::"r"(&var));
#endif

    if (scene->creditsVariant == CREDITS_VARIANT_FINAL_ENDING) {
        if (!gLoadedSaveGame->completedCharacters[CHARACTER_AMY]) {
            gLoadedSaveGame->completedCharacters[CHARACTER_AMY] = TRUE;
            WriteSaveGame();
        }

        for (i = 0; i < NUM_CHARACTERS; i++) {
            if (gLoadedSaveGame->unlockedLevels[i] > LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                zonesCompleteCharacters |= CHARACTER_BIT(i);
            }
        }

        // sonic, cream, tails, knuckles, all completed, and all chaos emeralds
        // unlock true area 53.
        if (zonesCompleteCharacters >= MAIN_CHARACTERS && (gLoadedSaveGame->chaosEmeralds[0] & CHAOS_EMERALDS_COMPLETED)
            && gLoadedSaveGame->extraZoneStatus == 0) {
            gLoadedSaveGame->extraZoneStatus |= 1;
            WriteSaveGame();
        }

        if (gSelectedCharacter != CHARACTER_AMY) {
            if ((gLoadedSaveGame->chaosEmeralds[gSelectedCharacter] & CHAOS_EMERALDS_COMPLETED)) {
                gLoadedSaveGame->completedCharacters[gSelectedCharacter] = TRUE;

                for (i = 0; i < 4; i++) {
                    if (gLoadedSaveGame->completedCharacters[i]) {
                        charactersCompleted++;
                    }
                }

                if ((charactersCompleted == 1 && gLoadedSaveGame->chaoGardenUnlocked)
                    || (charactersCompleted == 2 && gLoadedSaveGame->soundTestUnlocked)
                    || (charactersCompleted == 3 && gLoadedSaveGame->bossTimeAttackUnlocked)
                    || (charactersCompleted >= 4 && gLoadedSaveGame->unlockedCharacters > MAIN_CHARACTERS)) {
                    scene->hasAllEmeralds = TRUE;
                    scene->delayFrames = 180;
                } else {
                    if (charactersCompleted == 1) {
                        gLoadedSaveGame->chaoGardenUnlocked = TRUE;
                    } else if (charactersCompleted == 2) {
                        gLoadedSaveGame->soundTestUnlocked = TRUE;
                    } else if (charactersCompleted == 3) {
                        gLoadedSaveGame->bossTimeAttackUnlocked = TRUE;
                    } else if (charactersCompleted == 4) {
                        gLoadedSaveGame->unlockedCharacters |= CHARACTER_BIT(CHARACTER_AMY);
                    }
                    WriteSaveGame();
                    scene->hasAllEmeralds = FALSE;
                    scene->delayFrames = 105;
                    scene->fade.bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
                }
            } else {
                scene->hasAllEmeralds = FALSE;
                scene->fade.bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
                scene->delayFrames = 105;
            }
        } else {
            // if amy we have to have collected all emeralds
            scene->hasAllEmeralds = TRUE;
            scene->delayFrames = 180;
        }
    } else {
        if (!gLoadedSaveGame->extraEndingCreditsPlayed) {
            gLoadedSaveGame->extraEndingCreditsPlayed = TRUE;
            WriteSaveGame();
        }
        scene->hasAllEmeralds = TRUE;
        scene->delayFrames = 180;
    }

    scene->sequence = SEQUENCE_END;
    gCurTask->main = Task_FadeOut;
}

static void RenderExtraEndingElements(struct CreditsEndCutScene *scene)
{
    Sprite *s;
    if (scene->creditsVariant != CREDITS_VARIANT_EXTRA_ENDING) {
        return;
    }

    if (scene->sonicAnimFrame > 11) {
        return;
    }

    // on for 30 frames
    if (scene->congratsAnimFrame >= 1) {
        s = &scene->unkC0;
        s->graphics.anim = gUnknown_080E12D0[0].anim;
        s->variant = gUnknown_080E12D0[0].variant;
        s->x = scene->unk170[0][0];
        s->y = scene->unk170[0][1] >> 8;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
        scene->congratsAnimFrame--;
    } else if (scene->congratsAnimFrame > -15 && scene->congratsAnimFrame < 1) {
        // off for 15 frames
        scene->congratsAnimFrame--;
    } else if (scene->congratsAnimFrame <= -15) {
        // reset
        scene->congratsAnimFrame = 30;
    }

    if (scene->sonicAnimFrame == 11) {
        s = &scene->unkF0;
        s->graphics.anim = gUnknown_080E12D0[1].anim;
        s->variant = gUnknown_080E12D0[1].variant;
        s->x = scene->unk170[1][0];
        s->y = scene->unk170[1][1] >> 8;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &scene->unk120;
        s->graphics.anim = gUnknown_080E12D0[2].anim;
        s->variant = gUnknown_080E12D0[2].variant;
        s->x = scene->unk170[2][0];
        s->y = scene->unk170[2][1] >> 8;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void Task_FadeIn(void)
{
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->fade;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);

    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        UpdateCongratsMessagePos(scene);
        UpdateMessageLine1Pos(scene);
        UpdateMessageLine2Pos(scene);
    }

    RenderExtraEndingElements(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = Task_SequenceMain;
    }
}

static void Task_SequenceEnd(void)
{
    struct CreditsEndCutScene *scene = TASK_DATA(gCurTask);
    if (scene->delayFrames > 0) {
        scene->delayFrames--;
        return;
    }

    if (scene->hasAllEmeralds == FALSE) {
        CreateMissingChaosEmaraldsCutScene();
        TaskDestroy(gCurTask);
    } else if (scene->hasAllEmeralds == TRUE) {
        CreateTitleScreen();
        TaskDestroy(gCurTask);
    }
}

static void TaskDestroy_CreditsEndCutScene(UNUSED struct Task *t)
{
    // unused logic
}

static void UpdateCongratsMessagePos(struct CreditsEndCutScene *scene)
{
    scene->unk170[0][0] = 120;
    scene->unk170[0][1] = Q(10);
}

static void UpdateMessageLine1Pos(struct CreditsEndCutScene *scene)
{
    if (scene->sonicAnimFrame == 11) {
        scene->unk170[1][0] = 120;
        if (scene->unk170[1][1] > Q(130)) {
            scene->unk170[1][1] -= Q(3);
        }
    }
}

static void UpdateMessageLine2Pos(struct CreditsEndCutScene *scene)
{
    if (scene->sonicAnimFrame == 11) {
        scene->unk170[2][0] = 120;
        if (scene->unk170[2][1] > Q(148)) {
            scene->unk170[2][1] -= Q(3);
        }
    }
}
