#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/stage/player.h"
#include "game/stage/stage.h"
#include "game/course_select.h"
#include "game/cutscenes/endings.h"
#include "game/cutscenes/level_endings.h"
#include "game/save.h"
#include "game/stage/screen_fade.h"
#include "game/special_stage/main.h"
#include "game/stage/results.h"
#include "game/stage/ui.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    StageResultsBase base;
    /* 0x170 */ bool8 isCountingDone;
} StageResults; /* size: 0x174 */

#define OUTRO_TIME_BONUS_Y_POS    (DISPLAY_HEIGHT / 2) + 10
#define OUTRO_RING_BONUS_Y_POS    (DISPLAY_HEIGHT / 2) + 30
#define OUTRO_SP_RING_BONUS_Y_POS (DISPLAY_HEIGHT / 2) + 50

static void Task_UpdateStageResults(void);
static void TaskDestructor_StageResults(struct Task *);
static void AnimateResults(u16 frame);
static void DestroyStageResultsGfx(void);

const u16 gAnimsGotThroughCharacterNames[][3] = {
    { 24, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_SONIC },
    { 27, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_CREAM },
    { 24, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_TAILS },
    { 27, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_KNUCKLES },
    { 18, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_AMY },
};

const u16 gStageResultsHeadlineTexts[][3] = {
    { 28, SA2_ANIM_RESULTS_HEADLINE, SA2_ANIM_VARIANT_RESULTS_HEADLINE_GOT_THROUGH },
    { 36, SA2_ANIM_RESULTS_HEADLINE, SA2_ANIM_VARIANT_RESULTS_HEADLINE_BOSS_DESTROYED },
    { 0, 0, 0 },
    { 0, 0, 0 },
    { 0, 0, 0 },
};

const u16 gAnimsGotThroughZoneAndActNames[][3] = {
    { 14, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ACT_1 },        { 14, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ACT_2 },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_1) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_2) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_3) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_4) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_5) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_6) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_7) }, { 16, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_FINAL },
    { 16, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_EXTRA },
};

static const u16 sStageScoreBonusesTexts[][3] = {
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_TIME },
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_RING },
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_SP_RING },
};

static const u16 sStageResultsTextOffset[] = { 0, 69, 173 };

u16 CreateStageResults(u32 courseTime, u16 ringCount, u8 spRingCount)
{
    struct Task *t;
    StageResults *outro;
    Sprite *s;
    u8 i;

#ifndef NON_MATCHING
    register u32 zero asm("r7") = 0;
#else
    u32 zero = 0;
#endif

    LOADED_SAVE->score += (s16)gRingCount;

    t = TaskCreate(Task_UpdateStageResults, sizeof(StageResults), 0xC100, 0, TaskDestructor_StageResults);
    outro = TASK_DATA(t);
    outro->base.counter = zero;
    outro->isCountingDone = zero;

    outro->base.fade.window = zero;
    outro->base.fade.flags = 1;
    outro->base.fade.speed = Q(1.0);
    outro->base.fade.brightness = zero;
    outro->base.fade.bldCnt = 0x3FFF;
    outro->base.fade.bldAlpha = zero;

    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
        outro->base.fade.speed = Q(0.25);
        outro->base.fade.bldCnt = 0x3FBF;
    } else if (IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
        outro->base.fade.bldCnt = 0x3FAF;
        outro->base.fade.brightness = 0x2000;
        UpdateScreenFade(&outro->base.fade);
    }

    if (courseTime < ZONE_TIME_TO_INT(0, 30)) {
        outro->base.timeBonusScore = 80000;
    } else if (courseTime < ZONE_TIME_TO_INT(0, 50)) {
        outro->base.timeBonusScore = 50000;
    } else if (courseTime < ZONE_TIME_TO_INT(1, 0)) {
        outro->base.timeBonusScore = 10000;
    } else if (courseTime < ZONE_TIME_TO_INT(1, 30)) {
        outro->base.timeBonusScore = 5000;
    } else if (courseTime < ZONE_TIME_TO_INT(2, 0)) {
        outro->base.timeBonusScore = 4000;
    } else if (courseTime < ZONE_TIME_TO_INT(3, 0)) {
        outro->base.timeBonusScore = 3000;
    } else if (courseTime < ZONE_TIME_TO_INT(4, 0)) {
        outro->base.timeBonusScore = 2000;
    } else if (courseTime < ZONE_TIME_TO_INT(5, 0)) {
        outro->base.timeBonusScore = 1000;
    } else if (courseTime < ZONE_TIME_TO_INT(6, 0)) {
        outro->base.timeBonusScore = 500;
    } else {
        outro->base.timeBonusScore = 0;
    }

    outro->base.ringBonusScore = ringCount * 100;

    if (spRingCount == SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        outro->base.spRingBonusScore = 10000;
    } else {
        outro->base.spRingBonusScore = spRingCount * 1000;
    }

    if (outro->base.spRingBonusScore > outro->base.ringBonusScore) {
        if (outro->base.spRingBonusScore > outro->base.timeBonusScore) {
            outro->base.unk16C = Div(outro->base.spRingBonusScore, 100);
        } else {
            outro->base.unk16C = Div(outro->base.timeBonusScore, 100);
        }
    } else {
        if (outro->base.ringBonusScore > outro->base.timeBonusScore) {
            outro->base.unk16C = Div(outro->base.ringBonusScore, 100);
        } else {
            outro->base.unk16C = Div(outro->base.timeBonusScore, 100);
        }
    }

    s = &outro->base.separator;
    s->x = DISPLAY_WIDTH + 16;
    s->y = (DISPLAY_HEIGHT / 2);
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_TA_WHITE_BAR;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(5);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
    UpdateSpriteAnimation(s);

    s = &outro->base.title[0];
    s->x = DISPLAY_WIDTH + 16;
    s->y = (DISPLAY_HEIGHT / 2) - 39;
    s->graphics.dest = VramMalloc(gAnimsGotThroughCharacterNames[gSelectedCharacter][0]);
    s->graphics.anim = gAnimsGotThroughCharacterNames[gSelectedCharacter][1];
    s->variant = gAnimsGotThroughCharacterNames[gSelectedCharacter][2];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
    UpdateSpriteAnimation(s);

    {
        s8 extraLevel;
        u8 level;
        bool32 isBossAct = ACT_INDEX(gCurrentLevel) >> 1;

        s = &outro->base.title[1];
        s->x = DISPLAY_WIDTH + 16;
        s->y = (DISPLAY_HEIGHT / 2) - 31;
        s->graphics.dest = VramMalloc(gStageResultsHeadlineTexts[isBossAct][0]);
        s->graphics.anim = gStageResultsHeadlineTexts[isBossAct][1];
        s->variant = gStageResultsHeadlineTexts[isBossAct][2];

        extraLevel = gCurrentLevel; // needed for matching
        if (IS_FINAL_STAGE(extraLevel) || IS_EXTRA_STAGE(gCurrentLevel)) {
            s->graphics.anim = gStageResultsHeadlineTexts[0][1];
            s->variant = gStageResultsHeadlineTexts[0][2];
        }

        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);

        if (isBossAct) {
            level = LEVEL_TO_ZONE(gCurrentLevel) + ACT_BOSS;

        } else {
            level = gCurrentLevel & 1;
        }

        s = &outro->base.title[2];
        s->x = DISPLAY_WIDTH + 16;
        s->y = (DISPLAY_HEIGHT / 2) - 31;
        s->graphics.dest = VramMalloc(gAnimsGotThroughZoneAndActNames[level][0]);
        s->graphics.anim = gAnimsGotThroughZoneAndActNames[level][1];
        s->variant = gAnimsGotThroughZoneAndActNames[level][2];

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            s->graphics.anim = gAnimsGotThroughZoneAndActNames[9][1];
            s->variant = gAnimsGotThroughZoneAndActNames[9][2];
        } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
            s->graphics.anim = gAnimsGotThroughZoneAndActNames[10][1];
            s->variant = gAnimsGotThroughZoneAndActNames[10][2];
        }

        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < ARRAY_COUNT(outro->base.sprScores); i++) {
        s = &outro->base.sprScores[i];
        s->x = DISPLAY_WIDTH + 16;
        s->y = ((DISPLAY_HEIGHT / 2) - 6) + i * 20;
        s->graphics.dest = VramMalloc(sStageScoreBonusesTexts[i][0]);
        s->graphics.anim = sStageScoreBonusesTexts[i][1];
        s->variant = sStageScoreBonusesTexts[i][2];
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }

    gMusicManagerState.unk0 |= -1;

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        m4aSongNumStart(MUS_FINAL_CLEAR);
    } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
        m4aSongNumStart(MUS_EXTRA_CLEAR);
    } else if (ACT_INDEX(gCurrentLevel) == ACT_BOSS) {
        m4aSongNumStart(MUS_BOSS_CLEAR);

        if (gPlayer.charState == CHARSTATE_WALK_A) {
            gPlayer.charState = CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS;
        }

    } else {
        m4aSongNumStart(MUS_ACT_CLEAR);
    }

    return (u16)outro->base.unk16C;
}

static void Task_UpdateStageResults(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->base.counter;

    if (++counter > outro->base.unk16C + 309) {
        counter = outro->base.unk16C + 310;
    }
    outro->base.counter = counter;

    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2
                           | BLDCNT_TGT1_BG3);
    }

    if (counter >= 150) {
        if (outro->base.ringBonusScore != 0) {
            outro->base.ringBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        if (outro->base.spRingBonusScore != 0) {
            outro->base.spRingBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        if (outro->base.timeBonusScore != 0) {
            outro->base.timeBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        // If user pressed A, quickly finish score counting
        if (!IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
            if (gPressedKeys & A_BUTTON) {
                INCREMENT_SCORE_A(outro->base.ringBonusScore);
                INCREMENT_SCORE_A(outro->base.spRingBonusScore);
                INCREMENT_SCORE_A(outro->base.timeBonusScore);

                outro->base.ringBonusScore = 0;
                outro->base.spRingBonusScore = 0;
                outro->base.timeBonusScore = 0;

                if (counter < outro->base.unk16C + 149) {
                    counter = outro->base.unk16C + 149;
                    outro->base.counter = counter;
                }
            }
        }

        if ((gStageTime % 4u) == 0) {
            if ((outro->base.ringBonusScore != 0) || (outro->base.spRingBonusScore != 0) || (outro->base.timeBonusScore != 0)) {
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
            } else if (!outro->isCountingDone) {
                outro->isCountingDone = TRUE;
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
            }
        }
    }

    if (counter > outro->base.unk16C + 309) {
        if (IS_FINAL_STAGE(gCurrentLevel)) {
            if ((gMPlayInfo_BGM.status & 0xFFFF) == 0) {
                LOADED_SAVE->unlockedLevels[gSelectedCharacter] = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
                WriteSaveGame();

                TasksDestroyAll();

                { // TODO: This is a macro!
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                }

                StartEndingCutscenes();
                return;
            }
        } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
            if ((gMPlayInfo_BGM.status & 0xFFFF) == 0) {
                gCurrentLevel++;
                LOADED_SAVE->unlockedLevels[gSelectedCharacter] = gCurrentLevel;

                TasksDestroyAll();

                { // TODO: This is a macro!
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                }

                StartEndingCutscenes();

                WriteSaveGame();
                return;
            }
        } else {
            if (UpdateScreenFade(&outro->base.fade) == 1) {
                gBldRegs.bldY = 0x10;
                gPlayer.moveState |= MOVESTATE_100000;

                if (ACT_INDEX(gCurrentLevel) == ACT_BOSS) {
                    TasksDestroyAll();

                    { // TODO: This is a macro!
                        PAUSE_BACKGROUNDS_QUEUE();
                        gBgSpritesCount = 0;
                        PAUSE_GRAPHICS_QUEUE();
                    }

                    gCurrentLevel++;

                    if (gCurrentLevel > LOADED_SAVE->unlockedLevels[gSelectedCharacter]) {
                        LOADED_SAVE->unlockedLevels[gSelectedCharacter] = gCurrentLevel;

                        if (gSelectedCharacter == CHARACTER_SONIC) {
                            switch (LEVEL_TO_ZONE(gCurrentLevel - 1)) {
                                case ZONE_1: {
                                    LOADED_SAVE->unlockedCharacters |= CHARACTER_BIT(CHARACTER_CREAM);
                                    CreateCharacterUnlockCutScene(0);
                                } break;

                                case ZONE_3: {
                                    LOADED_SAVE->unlockedCharacters |= CHARACTER_BIT(CHARACTER_TAILS);
                                    CreateCharacterUnlockCutScene(2);
                                } break;

                                case ZONE_5: {
                                    LOADED_SAVE->unlockedCharacters |= CHARACTER_BIT(CHARACTER_KNUCKLES);
                                    CreateCharacterUnlockCutScene(1);
                                } break;

                                default: {
                                    CreateCourseSelectionScreen(gCurrentLevel, LOADED_SAVE->unlockedLevels[gSelectedCharacter], 1);
                                }
                            }
                        } else {
                            CreateCourseSelectionScreen(gCurrentLevel, LOADED_SAVE->unlockedLevels[gSelectedCharacter], 1);
                        }
                    } else {
                        CreateCourseSelectionScreen(gCurrentLevel, LOADED_SAVE->unlockedLevels[gSelectedCharacter], 4);
                    }
                    WriteSaveGame();
                    return;
                } else {
                    gCurrentLevel++;
                    if (gCurrentLevel > LOADED_SAVE->unlockedLevels[gSelectedCharacter]) {
                        LOADED_SAVE->unlockedLevels[gSelectedCharacter] = gCurrentLevel;
                    }

                    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
                        TasksDestroyAll();

                        { // TODO: This is a macro!
                            PAUSE_BACKGROUNDS_QUEUE();
                            gBgSpritesCount = 0;
                            PAUSE_GRAPHICS_QUEUE();
                        }

                        CreateSpecialStage(-1, -1);

                        gDispCnt |= DISPCNT_WIN0_ON;
                        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
                        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
                        gWinRegs[WINREG_WININ] |= WININ_WIN0_ALL;
                        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_ALL & ~WINOUT_WIN01_CLR);

                        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
                        gBldRegs.bldY = 0x10;

                        WriteSaveGame();
                        return;
                    }

                    TasksDestroyAll();

                    { // TODO: This is a macro!
                        PAUSE_BACKGROUNDS_QUEUE();
                        gBgSpritesCount = 0;
                        PAUSE_GRAPHICS_QUEUE();
                    }

                    GameStageStart();

                    WriteSaveGame();
                    return;
                }
            }
        }

        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
            DestroyStageResultsGfx();
            gPlayer.moveState |= MOVESTATE_4000000;
            return;
        }
    }

    StageResults_AnimateSeparator();
    StageResults_AnimateTitle();

    if (IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
        if (counter > outro->base.unk16C + 245) {
            u32 innerCount = counter;
            innerCount -= 245;
            AnimateResults((innerCount - outro->base.unk16C) * 16);
        } else {
            AnimateResults(0);
        }
    } else {
        AnimateResults(0);
    }
}

void StageResults_AnimateSeparator(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->base.counter;
    Sprite *s = &outro->base.separator;

    if (counter <= 15) {
        s->x = (16 - counter) * 15;
        s->y = (DISPLAY_HEIGHT / 2) + 20;
    } else if (counter <= 23) {
        s->y = (DISPLAY_HEIGHT / 2) + 20;
    } else if (counter <= 28) {
        s->y -= 7;
    }
}

static void AnimateResults(u16 frame)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->base.counter;
    u32 i;
    Sprite *s;
    s32 r4;

    if (counter < 24) {
        s32 x;
        s = &outro->base.separator;
        x = 0;

        if (counter <= 16) {
            x = (16 - counter) * 24;
        }

        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
            s->x = (x - frame) + i * 32;
            DisplaySprite(s);
        }
    } else {
        s = &outro->base.separator;

        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
            s->x = -frame + i * 32;
            DisplaySprite(s);
        }
    }

    if (counter > 28) {
        u32 numDisplayedBonuses = (ACT_INDEX(gCurrentLevel) == ACT_BOSS) ? 2 : 3;

        for (i = 0; i < numDisplayedBonuses; i++) {
            s = &outro->base.title[i];
            s->x -= frame;
            DisplaySprite(s);
        }
    }

    if (counter >= 39) {

        s = &outro->base.sprScores[0];

        if (counter < 56) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 39) * 12);
            r4 = innerX;
        } else {
            r4 = (DISPLAY_WIDTH / 2) - 72;
        }
        s->x = r4 - frame;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = frame;
            StageUI_PrintIntegerAt(outro->base.timeBonusScore, r4_2 + 144 - pp, OUTRO_TIME_BONUS_Y_POS, 0);
        }
    }

    if (counter >= 49) {
        s = &outro->base.sprScores[1];

        if (counter <= 65) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 49) * 12);
            r4 = innerX;
        } else {
            r4 = (DISPLAY_WIDTH / 2) - 72;
        }
        s->x = r4 - frame;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = frame;
            StageUI_PrintIntegerAt(outro->base.ringBonusScore, r4_2 + 144 - pp, OUTRO_RING_BONUS_Y_POS, 0);
        }
    }

    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS) && (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) && (counter >= 59)) {
        s = &outro->base.sprScores[2];

        if (counter <= 75) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 59) * 12);
            r4 = innerX;
        } else {
            r4 = (DISPLAY_WIDTH / 2) - 72;
        }

        s->x = r4 - frame;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = frame;
            StageUI_PrintIntegerAt(outro->base.spRingBonusScore, r4_2 + 144 - pp, OUTRO_SP_RING_BONUS_Y_POS, 0);
        }
    }
}

void StageResults_AnimateTitle(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->base.counter;

    if (counter > 28) {
        u32 x;

        if (counter < 45) {
            x = (u16)(DISPLAY_WIDTH - ((counter - 29) * 15));
        } else {
            x = (DISPLAY_WIDTH / 2) - 117;
        }

        {
            s32 i = 0;
            s32 x2 = (s16)x;
            for (; i < ARRAY_COUNT(sStageResultsTextOffset); i++) {
                Sprite *s = &outro->base.title[i];
                s32 offset = sStageResultsTextOffset[i];
                s->x = x2 + offset;
            }
        }
    }
}

static void TaskDestructor_StageResults(struct Task *t)
{
    StageResults *outro = TASK_DATA(t);
    if (outro->base.separator.graphics.dest != NULL) {
        VramFree(outro->base.separator.graphics.dest);
        VramFree(outro->base.title[0].graphics.dest);
        VramFree(outro->base.title[1].graphics.dest);
        VramFree(outro->base.title[2].graphics.dest);
        VramFree(outro->base.sprScores[0].graphics.dest);
        VramFree(outro->base.sprScores[1].graphics.dest);
        VramFree(outro->base.sprScores[2].graphics.dest);
    }
}

static void DestroyStageResultsGfx(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    if (outro->base.separator.graphics.dest != NULL) {
        VramFree(outro->base.separator.graphics.dest);
        VramFree(outro->base.title[0].graphics.dest);
        VramFree(outro->base.title[1].graphics.dest);
        VramFree(outro->base.title[2].graphics.dest);
        VramFree(outro->base.sprScores[0].graphics.dest);
        VramFree(outro->base.sprScores[1].graphics.dest);
        VramFree(outro->base.sprScores[2].graphics.dest);

        outro->base.separator.graphics.dest = NULL;
    }
}
