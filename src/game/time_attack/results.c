#include "game/time_attack/results.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "game/save.h"
#include "game/stage/player.h"
#include "game/stage/ui.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "task.h"
#include "game/stage/results.h"
#include "game/time_attack/lobby.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"

typedef struct {
    StageResultsBase base;
    u8 unk170;
    u8 unk171;
    u8 unk172;
    u8 unk173;
    u8 unk174;
    u8 unk175;
    Sprite digits[7];
    SpriteTransform transform;
    s16 medalSpinSpeed;
    s16 medalSpin;
    u8 rank;
} TimeAttackResultsCutScene;

static void TaskDestructor_TimeAttackResults(struct Task *);
static void Task_AnimateResults(void);
static void Task_HandleExit(void);
static u8 StoreRecord(u32 finishTime);

static const s8 sTimeResultDigitAnim[] = {
    3, 2, 1, 0, 0, -1, -2, -3, -4, -4, -3, -2, 1, 2, 3, 0, 0, 0, 0, 0,
};
static const u8 unused[] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

u32 CreateTimeAttackResults(u32 finishTime)
{
    struct Task *t;
    TimeAttackResultsCutScene *resultsCutScene;
    ScreenFade *fade;
    Sprite *s = NULL;
    s16 millis, minutes, seconds;
    u8 i, level;
    bool8 isBossLevel;
    gLoadedSaveGame->score += (s16)gRingCount;

    t = TaskCreate(Task_AnimateResults, sizeof(TimeAttackResultsCutScene), 0xC100, 0, TaskDestructor_TimeAttackResults);
    resultsCutScene = TASK_DATA(t);
    fade = &resultsCutScene->base.fade;

    resultsCutScene->base.counter = 0;
    resultsCutScene->medalSpinSpeed = Q(8);
    resultsCutScene->medalSpin = Q(64);

    fade->window = 0;
    fade->flags = 1;
    fade->speed = Q_8_8(1);
    fade->brightness = Q_8_8(0);
    fade->bldCnt = 0x3FFF;
    fade->bldAlpha = 0;

    resultsCutScene->base.timeBonusScore = finishTime;

    if (finishTime < MAX_COURSE_TIME) {
        s16 millisIndex = finishTime % 60;
        resultsCutScene->base.timeBonusScore = finishTime - millisIndex;
        millis = gMillisUnpackTable[millisIndex][0] * 10;
        millis += gMillisUnpackTable[millisIndex][1];
        seconds = resultsCutScene->base.timeBonusScore / 60;
        minutes = seconds / 60;
        seconds += minutes * -60;
    } else {
        millis = 99;
        seconds = 59;
        minutes = 9;
    }

    resultsCutScene->unk171 = UNITS_DIGIT(minutes);
    resultsCutScene->unk172 = TENS_DIGIT(seconds);
    resultsCutScene->unk173 = UNITS_DIGIT(seconds);
    resultsCutScene->unk174 = TENS_DIGIT(millis);
    resultsCutScene->unk175 = UNITS_DIGIT(millis);

    for (i = 0; i < 7; i++) {
        s = &resultsCutScene->digits[i];
        s->x = i * 14 + ((DISPLAY_WIDTH / 2) - 48);
        s->y = (DISPLAY_HEIGHT / 2) + 8;
        s->graphics.dest = VramMalloc(4);
        s->graphics.anim = SA2_ANIM_TIME_ATTACK_DIGITS;
        s->variant = SA2_ANIM_VARIANT_TA_DIGITS_0;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
    }

    resultsCutScene->digits[0].variant += resultsCutScene->unk171;
    resultsCutScene->digits[1].variant = DELIMINATOR_DIGIT;
    resultsCutScene->digits[2].variant += resultsCutScene->unk172;
    resultsCutScene->digits[3].variant += resultsCutScene->unk173;
    resultsCutScene->digits[4].variant = DELIMINATOR_DIGIT;
    resultsCutScene->digits[5].variant += resultsCutScene->unk174;
    resultsCutScene->digits[6].variant += resultsCutScene->unk175;

    for (i = 0; i < 7; i++) {
        UpdateSpriteAnimation(&resultsCutScene->digits[i]);
    }

    resultsCutScene->rank = StoreRecord(finishTime);

    s = &resultsCutScene->base.separator;
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
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &resultsCutScene->base.title[0];
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
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    isBossLevel = ACT_INDEX(gCurrentLevel) >> 1;

    s = &resultsCutScene->base.title[1];
    s->x = DISPLAY_WIDTH + 16;
    s->y = (DISPLAY_HEIGHT / 2) - 31;
    s->graphics.dest = VramMalloc(gStageResultsHeadlineTexts[isBossLevel][0]);
    s->graphics.anim = gStageResultsHeadlineTexts[isBossLevel][1];
    s->variant = gStageResultsHeadlineTexts[isBossLevel][2];
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

    if (isBossLevel) {
        level = LEVEL_TO_ZONE(gCurrentLevel) + ACT_BOSS;

    } else {
        level = gCurrentLevel & 1;
    }
    s = &resultsCutScene->base.title[2];
    s->x = DISPLAY_WIDTH + 16;
    s->y = (DISPLAY_HEIGHT / 2) - 31;
    s->graphics.dest = VramMalloc(gAnimsGotThroughZoneAndActNames[level][0]);
    s->graphics.anim = gAnimsGotThroughZoneAndActNames[level][1];
    s->variant = gAnimsGotThroughZoneAndActNames[level][2];
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

    s = &resultsCutScene->base.sprScores[0];
    s->x = (DISPLAY_WIDTH / 2) - 80;
    s->y = (DISPLAY_HEIGHT / 2) + 10;
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_TA_RECORD;
    s->variant = SA2_ANIM_VARIANT_TA_TIME;
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

    s = &resultsCutScene->base.sprScores[1];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 40;
    s->graphics.dest = VramMalloc(16);
    s->graphics.anim = SA2_ANIM_TIME_ATTACK_DIGITS;
    if (resultsCutScene->rank != 0) {
        s->variant = resultsCutScene->rank + SA2_ANIM_VARIANT_TA_DIGITS_PLATE_0_BRONZE;
    } else {
        s->variant = SA2_ANIM_VARIANT_TA_DIGITS_PLATE_1_GOLD;
    }
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = gOamMatrixIndex++ | 0x20;
    UpdateSpriteAnimation(s);

    resultsCutScene->transform.qScaleX = 0;
    resultsCutScene->transform.qScaleY = +Q(1);
    resultsCutScene->transform.x = (DISPLAY_WIDTH / 2);
    resultsCutScene->transform.y = (DISPLAY_HEIGHT / 2) + 40;
    resultsCutScene->transform.rotation = 0;

    s = &resultsCutScene->base.sprScores[2];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 68;
    s->graphics.dest = VramMalloc(22);
    s->graphics.anim = SA2_ANIM_TA_RECORD;
    s->variant = 0;
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

    gMusicManagerState.unk0 = 0xFF;

    if ((gCurrentLevel & ACT_BOSS) && !(gCurrentLevel & ACT_2)) {
        gPlayer.charState = CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS;
    }

    if (resultsCutScene->rank == 1) {
        m4aSongNumStart(MUS_TIME_ATTACK_3);
    } else {
        m4aSongNumStart(MUS_TIME_ATTACK_2);
    }

    return 600;
}

static void AnimateResults(void)
{
    TimeAttackResultsCutScene *resultsCutScene = TASK_DATA(gCurTask);
    Sprite *s;
    u32 frame = resultsCutScene->base.counter;
    u32 i;

    if (frame < 24) {
        s32 temp;
        s = &resultsCutScene->base.separator;
        temp = 0;
        if (frame <= 16) {
            temp = ((16 - frame) * 24);
        }

        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
            s->x = temp + (i * 32);
            DisplaySprite(s);
        }
    } else {
        s = &resultsCutScene->base.separator;

        for (i = 0; i < ((DISPLAY_WIDTH + 32) / 32); i++) {
            s->x = i * 32;
            DisplaySprite(s);
        }
    }

    if (frame > 28) {
        s32 numElements = ((gCurrentLevel & ACT_BOSS) && !(gCurrentLevel & ACT_2)) ? 2 : 3;

        for (i = 0; i < numElements; i++) {
            s = &resultsCutScene->base.title[i];
            DisplaySprite(s);
        }
    }

    if (frame >= 90) {
        // TIME text
        s = &resultsCutScene->base.sprScores[0];
        if ((frame - 90) <= 10) {
            s->x = (100 - frame) * 16 + ((DISPLAY_WIDTH / 2) - 80);
        }
        DisplaySprite(s);
    }

    if (frame >= 120) {
        s32 dFrames = (frame - 127);
        if (dFrames > 16) {
            if (resultsCutScene->rank > 0) {
                // medal
                s = &resultsCutScene->base.sprScores[1];
                resultsCutScene->transform.qScaleX = COS_24_8(I((u16)resultsCutScene->medalSpin) * 4);
                resultsCutScene->medalSpin += resultsCutScene->medalSpinSpeed;

                if (resultsCutScene->medalSpin == 0) {
                    if (resultsCutScene->medalSpinSpeed == Q(8)) {
                        resultsCutScene->medalSpinSpeed = Q(4);
                    } else {
                        resultsCutScene->medalSpinSpeed = 0;
                    }
                }

                if (resultsCutScene->transform.qScaleX == 0) {
                    resultsCutScene->transform.qScaleX = Q(0.0625);
                }
                TransformSprite(s, &resultsCutScene->transform);
                DisplaySprite(s);
            }
            // Flash the new record text
            if (resultsCutScene->rank == 1 && (frame & 32)) {
                s = &resultsCutScene->base.sprScores[2];
                DisplaySprite(s);
            }
        }

        for (i = 0; i < 7; i++) {
            s32 index = (frame - 120) - i;
            if (index < 0) {
                break;
            }

            s = &resultsCutScene->digits[i];
            if (index < ARRAY_COUNT(sTimeResultDigitAnim)) {
                s->y += sTimeResultDigitAnim[index];
            }

            DisplaySprite(s);
        }
    }
}

static u8 StoreRecord(u32 finishTime)
{
    u32 existingRecords[3];
    u8 i;

    u8 character = gSelectedCharacter;
    u8 zone = gCurrentLevel >> 2;
    s32 currentLevel = gCurrentLevel;
    u8 act = currentLevel - (currentLevel / (ACTS_PER_ZONE + 1)) * (ACTS_PER_ZONE + 1);
    u8 rank = 0;

    for (i = 0; i < 3; i++) {
        existingRecords[i] = gLoadedSaveGame->timeRecords.table[character][zone][act][i];
    }

    for (i = 0; i < 3; i++) {
        if (finishTime < existingRecords[i]) {
            gLoadedSaveGame->timeRecords.table[character][zone][act][i] = finishTime;
            rank = ++i;
            break;
        }
    }

    for (; i < 3; i++) {
        gLoadedSaveGame->timeRecords.table[character][zone][act][i] = existingRecords[i - 1];
    }

    return rank;
}

static void Task_AnimateResults(void)
{
    TimeAttackResultsCutScene *resultsCutScene = TASK_DATA(gCurTask);
    u32 frame = resultsCutScene->base.counter;
    resultsCutScene->base.counter = ++frame;
    StageResults_AnimateSeparator();
    StageResults_AnimateTitle();
    AnimateResults();

    if (((frame > 160) && (gPressedKeys & (A_BUTTON | START_BUTTON))) || (frame > 600)) {
        gCurTask->main = Task_HandleExit;
    }
}

static void Task_HandleExit(void)
{
    TimeAttackResultsCutScene *resultsCutScene = TASK_DATA(gCurTask);
    if (UpdateScreenFade(&resultsCutScene->base.fade) == SCREEN_FADE_COMPLETE) {
        WriteSaveGame();
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateTimeAttackLobbyScreen();
        return;
    }

    StageResults_AnimateSeparator();
    StageResults_AnimateTitle();
    AnimateResults();
}

static void TaskDestructor_TimeAttackResults(struct Task *t)
{
    u32 i;
    TimeAttackResultsCutScene *resultsCutScene = TASK_DATA(t);
    VramFree(resultsCutScene->base.separator.graphics.dest);

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->base.title[i].graphics.dest);
    }

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->base.sprScores[i].graphics.dest);
    }

    for (i = 0; i < 7; i++) {
        VramFree(resultsCutScene->digits[i].graphics.dest);
    }

    gStageFlags &= ~STAGE_FLAG__TURN_OFF_TIMER;
}
