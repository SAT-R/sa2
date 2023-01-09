#include "global.h"
#include "cut_scenes_credits.h"
#include "cut_scenes_credits_end.h"
#include "cut_scenes_missing_emeralds.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "m4a.h"
#include "save.h"
#include "title_screen.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

struct CreditsEndCutScene {
    Background unk0;
    Background unk40;
    Background unk80;
    Sprite unkC0;
    Sprite unkF0;
    Sprite unk120;
    struct UNK_802D4CC_UNK270 transitionConfig;
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
    vu32 unk16C;
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

static const u16 gUnknown_080E12B0[] = {
    232, 233, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 260, 259,
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
    struct UNK_802D4CC_UNK270 *transitionConfig;
    gDispCnt = 0x1040;

    gBgCntRegs[0] = 0x160D;
    gBgCntRegs[1] = 0x5480;
    gBgCntRegs[2] = 0x1504;
#ifndef NON_MATCHING
    DmaFill32(3, 0, BG_CHAR_ADDR((++r6, --r6)), 0x4000);
#else
    DmaFill32(3, 0, BG_CHAR_ADDR(r6), 0x4000);
#endif
    gUnknown_03004D80[2] = 0x5a;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 0x20;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;

    t = TaskCreate(Task_FadeIn, sizeof(struct CreditsEndCutScene), 0x3100, 0,
                   TaskDestroy_CreditsEndCutScene);
    scene = TaskGetStructPtr(t);
    scene->delayFrames = 270;
    scene->creditsVariant = creditsVariant;
    scene->sequence = SEQUENCE_GAME_END_SCREEN;
    scene->unk15E = 0;
    scene->sonicAnimFrame = 0;
    scene->congratsAnimFrame = 0x1E;
    scene->unk160 = 0;
    scene->hasAllEmeralds = FALSE;
    scene->unk162 = -1;
    if (gLoadedSaveGame->unk6 != LANG_JAPANESE) {
        scene->unk160 = 1;
    }

    for (i = 0; i < 2; i++) {
        scene->unk170[0][i] = 0;
        scene->unk170[1][i] = Q_24_8(180);

        // NOTE: set but never used
        scene->unk170[2][i] = Q_24_8(200);
    }

    transitionConfig = &scene->transitionConfig;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FFF;

    scene->unk16C = OBJ_VRAM0;

    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        Background *background = &scene->unk40;
        {
            gDispCnt |= 0x100;
            gBgScrollRegs[0][0] = 0;
            gBgScrollRegs[0][1] = 0;

            background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
            background->graphics.anim = 0;
            background->unkC = BG_SCREEN_ADDR(22);
            background->unk18 = 0;
            background->unk1A = 0;
            background->unk1C = gUnknown_080E12B0[2];
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

        {
            Sprite *element;
            element = &scene->unkC0;
            element->graphics.dest = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[0].numTiles * TILE_SIZE_4BPP);
            element->graphics.anim = gUnknown_080E12D0[0].anim;
            element->variant = gUnknown_080E12D0[0].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = -20;
            element->unk1A = 0;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
            sub_8004558(element);
        }

        {
            Sprite *element;
            element = &scene->unkF0;
            element->graphics.dest = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[1].numTiles * TILE_SIZE_4BPP);
            element->graphics.anim = gUnknown_080E12D0[1].anim;
            element->variant = gUnknown_080E12D0[1].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = DISPLAY_HEIGHT + 96; // Note: 96 is the width of metatiles
            element->unk1A = 0;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
            sub_8004558(element);
        }

        {
            Sprite *element;
            element = &scene->unk120;
            element->graphics.dest = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[2].numTiles * TILE_SIZE_4BPP);
            element->graphics.anim = gUnknown_080E12D0[2].anim;
            element->variant = gUnknown_080E12D0[2].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = DISPLAY_HEIGHT + 96;
            element->unk1A = 0;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
            sub_8004558(element);
        }

        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->graphics.anim = 0;
        background->unkC = BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[scene->sonicAnimFrame + 2];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 0;
        sub_8002A3C(background);
        updateBgAnimationTiles(background);
    }

    if (scene->creditsVariant == CREDITS_VARIANT_FINAL_ENDING) {
        Background *background;
        gDispCnt |= 0x200;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;

        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        background->graphics.anim = 0;
        background->unkC = BG_SCREEN_ADDR(20);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[scene->unk160];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 5;
        sub_8002A3C(background);
    }
}

static void Task_FadeOut(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->transitionConfig;
    transitionConfig->unk2 = 1;
    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        UpdateCongratsMessagePos(scene);
        UpdateMessageLine1Pos(scene);
        UpdateMessageLine2Pos(scene);
    }

    RenderExtraEndingElements(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;

        if (scene->sequence == SEQUENCE_FADE_TO_COPYRIGHT_SCREEN) {
            gCurTask->main = Task_CreateCopyrightScreen;
        } else {
            gCurTask->main = Task_SequenceEnd;
        }
    }
}

static void Task_CreateCopyrightScreen(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

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
        background->unkC = BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[13];
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

    {
        Background *background = &scene->unk80;
        gDispCnt |= 0x400;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0xD190;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->unkC = BG_SCREEN_ADDR(21);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[14];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 3;
        background->unk2A = 0;
        background->unk2E = 2;
        sub_8002A3C(background);

        scene->sequence = SEQUENCE_COPYRIGHT_SCREEN;
        scene->sonicAnimFrame++;
        scene->delayFrames = 270;
        gCurTask->main = Task_FadeIn;
    }
}

static void Task_SequenceMain(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

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

                background->unk1C = gUnknown_080E12B0[scene->sonicAnimFrame + 2];
                background->unk26 = 0x1E;
                background->unk28 = 0x14;
                background->unk2E = 0;
                sub_8002A3C(background);
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
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

#ifndef NON_MATCHING
    u16 var = zonesCompleteCharacters;
    asm("" ::"r"(&var));
#endif

    if (scene->creditsVariant == CREDITS_VARIANT_FINAL_ENDING) {
        if (gLoadedSaveGame->unk15[4] == 0) {
            gLoadedSaveGame->unk15[4] = 1;
            WriteSaveGame();
        }

        for (i = 0; i < NUM_CHARACTERS; i++) {
            if (gLoadedSaveGame->unk7[i] > LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                zonesCompleteCharacters |= CHARACTER_BIT(i);
            }
        }

        // sonic, cream, tails, knuckles, all completed, and all chaos emeralds
        // unlock true area 53.
        if (zonesCompleteCharacters >= MAIN_CHARACTERS
            && (gLoadedSaveGame->unkC[0] & CHAOS_EMERALDS_COMPLETED)
            && gLoadedSaveGame->unk1A == 0) {
            gLoadedSaveGame->unk1A |= 1;
            WriteSaveGame();
        }

        if (gSelectedCharacter != CHARACTER_AMY) {
            if ((gLoadedSaveGame->unkC[gSelectedCharacter] & CHAOS_EMERALDS_COMPLETED)) {
                gLoadedSaveGame->unk15[gSelectedCharacter] = 1;

                for (i = 0; i < 4; i++) {
                    if (gLoadedSaveGame->unk15[i] != 0) {
                        charactersCompleted++;
                    }
                }

                if ((charactersCompleted == 1 && gLoadedSaveGame->unk14)
                    || (charactersCompleted == 2 && gLoadedSaveGame->unk11)
                    || (charactersCompleted == 3 && gLoadedSaveGame->unk12)
                    || (charactersCompleted >= 4
                        && gLoadedSaveGame->unk13 > MAIN_CHARACTERS)) {
                    scene->hasAllEmeralds = TRUE;
                    scene->delayFrames = 180;
                } else {
                    if (charactersCompleted == 1) {
                        gLoadedSaveGame->unk14 = TRUE;
                    } else if (charactersCompleted == 2) {
                        gLoadedSaveGame->unk11 = TRUE;
                    } else if (charactersCompleted == 3) {
                        gLoadedSaveGame->unk12 = TRUE;
                    } else if (charactersCompleted == 4) {
                        gLoadedSaveGame->unk13 |= CHARACTER_BIT(CHARACTER_AMY);
                    }
                    WriteSaveGame();
                    scene->hasAllEmeralds = FALSE;
                    scene->delayFrames = 105;
                    scene->transitionConfig.unk8 = 0x3FFF;
                }
            } else {
                scene->hasAllEmeralds = FALSE;
                scene->transitionConfig.unk8 = 0x3FFF;
                scene->delayFrames = 105;
            }
        } else {
            // if amy we have to have collected all emeralds
            scene->hasAllEmeralds = TRUE;
            scene->delayFrames = 180;
        }
    } else {
        if (gLoadedSaveGame->unk1B == 0) {
            gLoadedSaveGame->unk1B = 1;
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
    Sprite *element;
    if (scene->creditsVariant != CREDITS_VARIANT_EXTRA_ENDING) {
        return;
    }

    if (scene->sonicAnimFrame > 11) {
        return;
    }

    // on for 30 frames
    if (scene->congratsAnimFrame >= 1) {
        element = &scene->unkC0;
        element->graphics.anim = gUnknown_080E12D0[0].anim;
        element->variant = gUnknown_080E12D0[0].variant;
        element->x = scene->unk170[0][0];
        element->y = scene->unk170[0][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
        scene->congratsAnimFrame--;
    } else if (scene->congratsAnimFrame > -15 && scene->congratsAnimFrame < 1) {
        // off for 15 frames
        scene->congratsAnimFrame--;
    } else if (scene->congratsAnimFrame <= -15) {
        // reset
        scene->congratsAnimFrame = 30;
    }

    if (scene->sonicAnimFrame == 11) {
        element = &scene->unkF0;
        element->graphics.anim = gUnknown_080E12D0[1].anim;
        element->variant = gUnknown_080E12D0[1].variant;
        element->x = scene->unk170[1][0];
        element->y = scene->unk170[1][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);

        element = &scene->unk120;
        element->graphics.anim = gUnknown_080E12D0[2].anim;
        element->variant = gUnknown_080E12D0[2].variant;
        element->x = scene->unk170[2][0];
        element->y = scene->unk170[2][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }
}

static void Task_FadeIn(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->transitionConfig;
    transitionConfig->unk2 = 2;

    if (scene->creditsVariant == CREDITS_VARIANT_EXTRA_ENDING) {
        UpdateCongratsMessagePos(scene);
        UpdateMessageLine1Pos(scene);
        UpdateMessageLine2Pos(scene);
    }

    RenderExtraEndingElements(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = Task_SequenceMain;
    }
}

static void Task_SequenceEnd(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
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
    scene->unk170[0][1] = Q_24_8(10);
}

static void UpdateMessageLine1Pos(struct CreditsEndCutScene *scene)
{
    if (scene->sonicAnimFrame == 11) {
        scene->unk170[1][0] = 120;
        if (scene->unk170[1][1] > Q_24_8(130)) {
            scene->unk170[1][1] -= Q_24_8(3);
        }
    }
}

static void UpdateMessageLine2Pos(struct CreditsEndCutScene *scene)
{
    if (scene->sonicAnimFrame == 11) {
        scene->unk170[2][0] = 120;
        if (scene->unk170[2][1] > Q_24_8(148)) {
            scene->unk170[2][1] -= Q_24_8(3);
        }
    }
}
