#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"
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
    /*  0x00 */ ScreenFade fade;
    /*  0x0C */ Sprite s1[3];
    /*  0x9C */ Sprite sprScores[3];
    /* 0x12C */ Sprite s7;
    /* 0x15C */ u32 timeBonusScore;
    /* 0x160 */ u32 ringBonusScore;
    /* 0x164 */ u32 spRingBonusScore;
    /* 0x168 */ s32 counter; // frames since task started
    /* 0x16C */ s32 unk16C;
    /* 0x170 */ bool8 isCountingDone;
} StageResults; /* size: 0x174 */

#define OUTRO_TIME_BONUS_Y_POS    (DISPLAY_HEIGHT / 2) + 10
#define OUTRO_RING_BONUS_Y_POS    (DISPLAY_HEIGHT / 2) + 30
#define OUTRO_SP_RING_BONUS_Y_POS (DISPLAY_HEIGHT / 2) + 50

const u16 sAnimsGotThroughCharacterNames[5][3] = {
    { 24, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_SONIC },
    { 27, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_CREAM },
    { 24, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_TAILS },
    { 27, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_KNUCKLES },
    { 18, SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_AMY },
};

const u16 sStageResultsHeadlineTexts[5][3] = {
    { 28, SA2_ANIM_RESULTS_HEADLINE, SA2_ANIM_VARIANT_RESULTS_HEADLINE_GOT_THROUGH },
    { 36, SA2_ANIM_RESULTS_HEADLINE, SA2_ANIM_VARIANT_RESULTS_HEADLINE_BOSS_DESTROYED },
    { 0, 0, 0 },
    { 0, 0, 0 },
    { 0, 0, 0 },
};

const u16 sAnimsGotThroughZoneAndActNames[11][3] = {
    { 14, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ACT_1 },        { 14, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ACT_2 },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_1) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_2) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_3) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_4) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_5) }, { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_6) },
    { 18, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_ZONE(ZONE_7) }, { 16, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_FINAL },
    { 16, SA2_ANIM_STAGE, SA2_ANIM_VARIANT_STAGE_EXTRA },
};

static const u16 sStageScoreBonusesTexts[3][3] = {
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_TIME },
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_RING },
    { 26, SA2_ANIM_SCORE_BONUSES, SA2_ANIM_VARIANT_SCORE_BONUSES_SP_RING },
};

const u16 gUnknown_080D71CC[3] = { 0, 69, 173 };

void Task_UpdateStageResults(void);
void TaskDestructor_StageResults(struct Task *);
void sub_80310F0(void);
static void sub_8031138(u16 p0);
void sub_8031314(void);
static void DestroyStageResultsGfx(void);

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

    gLoadedSaveGame->score += (s16)gRingCount;

    t = TaskCreate(Task_UpdateStageResults, sizeof(StageResults), 0xC100, 0, TaskDestructor_StageResults);
    outro = TASK_DATA(t);
    outro->counter = zero;
    outro->isCountingDone = zero;

    outro->fade.window = zero;
    outro->fade.flags = 1;
    outro->fade.speed = Q(1.0);
    outro->fade.brightness = zero;
    outro->fade.bldCnt = 0x3FFF;
    outro->fade.bldAlpha = zero;

    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
        outro->fade.speed = Q(0.25);
        outro->fade.bldCnt = 0x3FBF;
    } else if (IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
        outro->fade.bldCnt = 0x3FAF;
        outro->fade.brightness = 0x2000;
        UpdateScreenFade(&outro->fade);
    }

    if (courseTime < ZONE_TIME_TO_INT(0, 30)) {
        outro->timeBonusScore = 80000;
    } else if (courseTime < ZONE_TIME_TO_INT(0, 50)) {
        outro->timeBonusScore = 50000;
    } else if (courseTime < ZONE_TIME_TO_INT(1, 0)) {
        outro->timeBonusScore = 10000;
    } else if (courseTime < ZONE_TIME_TO_INT(1, 30)) {
        outro->timeBonusScore = 5000;
    } else if (courseTime < ZONE_TIME_TO_INT(2, 0)) {
        outro->timeBonusScore = 4000;
    } else if (courseTime < ZONE_TIME_TO_INT(3, 0)) {
        outro->timeBonusScore = 3000;
    } else if (courseTime < ZONE_TIME_TO_INT(4, 0)) {
        outro->timeBonusScore = 2000;
    } else if (courseTime < ZONE_TIME_TO_INT(5, 0)) {
        outro->timeBonusScore = 1000;
    } else if (courseTime < ZONE_TIME_TO_INT(6, 0)) {
        outro->timeBonusScore = 500;
    } else {
        outro->timeBonusScore = 0;
    }

    outro->ringBonusScore = ringCount * 100;

    if (spRingCount == SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        outro->spRingBonusScore = 10000;
    } else {
        outro->spRingBonusScore = spRingCount * 1000;
    }

    if (outro->spRingBonusScore > outro->ringBonusScore) {
        if (outro->spRingBonusScore > outro->timeBonusScore) {
            outro->unk16C = Div(outro->spRingBonusScore, 100);
        } else {
            outro->unk16C = Div(outro->timeBonusScore, 100);
        }
    } else {
        if (outro->ringBonusScore > outro->timeBonusScore) {
            outro->unk16C = Div(outro->ringBonusScore, 100);
        } else {
            outro->unk16C = Div(outro->timeBonusScore, 100);
        }
    }

    s = &outro->s7;
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

    s = &outro->s1[0];
    s->x = DISPLAY_WIDTH + 16;
    s->y = DISPLAY_HEIGHT - 39;
    s->graphics.dest = VramMalloc(sAnimsGotThroughCharacterNames[gSelectedCharacter][0]);
    s->graphics.anim = sAnimsGotThroughCharacterNames[gSelectedCharacter][1];
    s->variant = sAnimsGotThroughCharacterNames[gSelectedCharacter][2];
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

        s = &outro->s1[1];
        s->x = DISPLAY_WIDTH + 16;
        s->y = DISPLAY_HEIGHT - 31;
        s->graphics.dest = VramMalloc(sStageResultsHeadlineTexts[isBossAct][0]);
        s->graphics.anim = sStageResultsHeadlineTexts[isBossAct][1];
        s->variant = sStageResultsHeadlineTexts[isBossAct][2];

        extraLevel = gCurrentLevel; // needed for matching
        if (IS_FINAL_STAGE(extraLevel) || IS_EXTRA_STAGE(gCurrentLevel)) {
            s->graphics.anim = sStageResultsHeadlineTexts[0][1];
            s->variant = sStageResultsHeadlineTexts[0][2];
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

        s = &outro->s1[2];
        s->x = DISPLAY_WIDTH + 16;
        s->y = DISPLAY_HEIGHT - 31;
        s->graphics.dest = VramMalloc(sAnimsGotThroughZoneAndActNames[level][0]);
        s->graphics.anim = sAnimsGotThroughZoneAndActNames[level][1];
        s->variant = sAnimsGotThroughZoneAndActNames[level][2];

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            s->graphics.anim = sAnimsGotThroughZoneAndActNames[9][1];
            s->variant = sAnimsGotThroughZoneAndActNames[9][2];
        } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
            s->graphics.anim = sAnimsGotThroughZoneAndActNames[10][1];
            s->variant = sAnimsGotThroughZoneAndActNames[10][2];
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

    for (i = 0; i < ARRAY_COUNT(outro->sprScores); i++) {
        s = &outro->sprScores[i];
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

    gUnknown_030054A8.unk0 |= -1;

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

    return (u16)outro->unk16C;
}

void Task_UpdateStageResults(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->counter;

    if (++counter > outro->unk16C + 309) {
        counter = outro->unk16C + 310;
    }
    outro->counter = counter;

    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2
                           | BLDCNT_TGT1_BG3);
    }

    if (counter >= 150) {
        if (outro->ringBonusScore != 0) {
            outro->ringBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        if (outro->spRingBonusScore != 0) {
            outro->spRingBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        if (outro->timeBonusScore != 0) {
            outro->timeBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        // If user pressed A, quickly finish score counting
        if (!IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
            if (gPressedKeys & A_BUTTON) {
                INCREMENT_SCORE_A(outro->ringBonusScore);
                INCREMENT_SCORE_A(outro->spRingBonusScore);
                INCREMENT_SCORE_A(outro->timeBonusScore);

                outro->ringBonusScore = 0;
                outro->spRingBonusScore = 0;
                outro->timeBonusScore = 0;

                if (counter < outro->unk16C + 149) {
                    counter = outro->unk16C + 149;
                    outro->counter = counter;
                }
            }
        }

        if ((gStageTime % 4u) == 0) {
            if ((outro->ringBonusScore != 0) || (outro->spRingBonusScore != 0) || (outro->timeBonusScore != 0)) {
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
            } else if (!outro->isCountingDone) {
                outro->isCountingDone = TRUE;
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
            }
        }
    }

    if (counter > outro->unk16C + 309) {
        if (IS_FINAL_STAGE(gCurrentLevel)) {
            if ((gMPlayInfo_BGM.status & 0xFFFF) == 0) {
                gLoadedSaveGame->unlockedLevels[gSelectedCharacter] = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
                WriteSaveGame();

                TasksDestroyAll();

                { // TODO: This is a macro!
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    PAUSE_GRAPHICS_QUEUE();
                }

                StartEndingCutscenes();
                return;
            }
        } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
            if ((gMPlayInfo_BGM.status & 0xFFFF) == 0) {
                gCurrentLevel++;
                gLoadedSaveGame->unlockedLevels[gSelectedCharacter] = gCurrentLevel;

                TasksDestroyAll();

                { // TODO: This is a macro!
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    PAUSE_GRAPHICS_QUEUE();
                }

                StartEndingCutscenes();

                WriteSaveGame();
                return;
            }
        } else {
            if (UpdateScreenFade(&outro->fade) == 1) {
                gBldRegs.bldY = 0x10;
                gPlayer.moveState |= MOVESTATE_100000;

                if (ACT_INDEX(gCurrentLevel) == ACT_BOSS) {
                    TasksDestroyAll();

                    { // TODO: This is a macro!
                        gUnknown_03002AE4 = gUnknown_0300287C;
                        gUnknown_03005390 = 0;
                        PAUSE_GRAPHICS_QUEUE();
                    }

                    gCurrentLevel++;

                    if (gCurrentLevel > gLoadedSaveGame->unlockedLevels[gSelectedCharacter]) {
                        gLoadedSaveGame->unlockedLevels[gSelectedCharacter] = gCurrentLevel;

                        if (gSelectedCharacter == CHARACTER_SONIC) {
                            switch (LEVEL_TO_ZONE(gCurrentLevel - 1)) {
                                case ZONE_1: {
                                    gLoadedSaveGame->unlockedCharacters |= CHARACTER_BIT(CHARACTER_CREAM);
                                    CreateCharacterUnlockCutScene(0);
                                } break;

                                case ZONE_3: {
                                    gLoadedSaveGame->unlockedCharacters |= CHARACTER_BIT(CHARACTER_TAILS);
                                    CreateCharacterUnlockCutScene(2);
                                } break;

                                case ZONE_5: {
                                    gLoadedSaveGame->unlockedCharacters |= CHARACTER_BIT(CHARACTER_KNUCKLES);
                                    CreateCharacterUnlockCutScene(1);
                                } break;

                                default: {
                                    CreateCourseSelectionScreen(gCurrentLevel, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 1);
                                }
                            }
                        } else {
                            CreateCourseSelectionScreen(gCurrentLevel, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 1);
                        }
                    } else {
                        CreateCourseSelectionScreen(gCurrentLevel, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 4);
                    }
                    WriteSaveGame();
                    return;
                } else {
                    gCurrentLevel++;
                    if (gCurrentLevel > gLoadedSaveGame->unlockedLevels[gSelectedCharacter]) {
                        gLoadedSaveGame->unlockedLevels[gSelectedCharacter] = gCurrentLevel;
                    }

                    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
                        TasksDestroyAll();

                        { // TODO: This is a macro!
                            gUnknown_03002AE4 = gUnknown_0300287C;
                            gUnknown_03005390 = 0;
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
                        gUnknown_03002AE4 = gUnknown_0300287C;
                        gUnknown_03005390 = 0;
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

    sub_80310F0();
    sub_8031314();

    if (IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
        if (counter > outro->unk16C + 245) {
            u32 innerCount = counter;
            innerCount -= 245;
            sub_8031138((innerCount - outro->unk16C) * 16);
        } else {
            sub_8031138(0);
        }
    } else {
        sub_8031138(0);
    }
}

void sub_80310F0(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->counter;
    Sprite *s = &outro->s7;

    if (counter <= 15) {
        s->x = (16 - counter) * 15;
        s->y = (DISPLAY_HEIGHT / 2) + 20;
    } else if (counter <= 23) {
        s->y = (DISPLAY_HEIGHT / 2) + 20;
    } else if (counter <= 28) {
        s->y -= 7;
    }
}

void sub_8031138(u16 p0)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->counter;
    u32 i;
    Sprite *s;
    s32 r4;

    if (counter < 24) {
        s32 x;
        s = &outro->s7;
        x = 0;

        if (counter <= 16) {
            x = (16 - counter) * 24;
        }

#if !PLATFORM_GBA
        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
#else
        for (i = 0; i < 8; i++) {
#endif
            s->x = (x - p0) + i * 32;
            DisplaySprite(s);
        }
    } else {
        s = &outro->s7;

#if !PLATFORM_GBA
        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
#else
        for (i = 0; i < 8; i++) {
#endif
            s->x = -p0 + i * 32;
            DisplaySprite(s);
        }
    }

    if (counter > 28) {
        u32 numDisplayedBonuses = (ACT_INDEX(gCurrentLevel) == ACT_BOSS) ? 2 : 3;

        for (i = 0; i < numDisplayedBonuses; i++) {
            s = &outro->s1[i];
            s->x -= p0;
            DisplaySprite(s);
        }
    }

    if (counter >= 39) {

        s = &outro->sprScores[0];

        if (counter < 56) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 39) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = p0;
            StageUI_PrintIntegerAt(outro->timeBonusScore, r4_2 + 144 - pp, OUTRO_TIME_BONUS_Y_POS, 0);
        }
    }

    if (counter >= 49) {
        s = &outro->sprScores[1];

        if (counter <= 65) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 49) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = p0;
            StageUI_PrintIntegerAt(outro->ringBonusScore, r4_2 + 144 - pp, OUTRO_RING_BONUS_Y_POS, 0);
        }
    }

    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS) && (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) && (counter >= 59)) {
        s = &outro->sprScores[2];

        if (counter <= 75) {
            u16 innerX = DISPLAY_WIDTH - ((counter - 59) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }

        s->x = r4 - p0;
        DisplaySprite(s);

        {
            s16 r4_2 = r4;
            s16 pp = p0;
            StageUI_PrintIntegerAt(outro->spRingBonusScore, r4_2 + 144 - pp, OUTRO_SP_RING_BONUS_Y_POS, 0);
        }
    }
}

void sub_8031314(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    u32 counter = outro->counter;

    if (counter > 28) {
        u32 x;

        if (counter < 45) {
            x = (u16)(DISPLAY_WIDTH - ((counter - 29) * 15));
        } else {
            x = 3;
        }

        {
            s32 i = 0;
            s32 x2 = (s16)x;
            for (; i < ARRAY_COUNT(gUnknown_080D71CC); i++) {
                Sprite *s = &outro->s1[i];
                s32 match = gUnknown_080D71CC[i];
                s->x = x2 + match;
            }
        }
    }
}

void TaskDestructor_StageResults(struct Task *t)
{
    StageResults *outro = TASK_DATA(t);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->sprScores[0].graphics.dest);
        VramFree(outro->sprScores[1].graphics.dest);
        VramFree(outro->sprScores[2].graphics.dest);
    }
}

void DestroyStageResultsGfx(void)
{
    StageResults *outro = TASK_DATA(gCurTask);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->sprScores[0].graphics.dest);
        VramFree(outro->sprScores[1].graphics.dest);
        VramFree(outro->sprScores[2].graphics.dest);

        outro->s7.graphics.dest = NULL;
    }
}
