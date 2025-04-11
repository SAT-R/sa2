#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/cheese.h"
#include "game/save.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/cutscenes/level_endings.h"
#include "game/stage/screen_fade.h"
#include "game/stage/results.h"
#include "game/time_attack/results.h"
#include "game/stage/boss_results_transition.h"

#include "constants/songs.h"
#include "constants/zones.h"

// Seven unknown x/y positions
const u16 gUnknown_080D6DE4[][2] = {
    { 3800, 177 }, { 11864, 145 }, { 16088, 177 }, { 21080, 153 }, { 27000, 150 }, { 36058, 201 }, { 40000, 225 },
};

typedef struct {
    /* 0x00 */ ScreenFade ts;
    /* 0x0C */ s16 unkC;
    /* 0x0C */ s16 unkE;
    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 unk11;
} StageResultsInit; /* size: 0x14 */

void Task_802F06C(void);

void Task_802ED98(void)
{
    StageResultsInit *sri = TASK_DATA(gCurTask);
    ScreenFade *ts = &sri->ts;

    if (UpdateScreenFade(ts) == SCREEN_FADE_COMPLETE) {
        TaskDestroy(gCurTask);

        if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
            return;
        }

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            return;
        }

        if ((gSelectedCharacter == CHARACTER_SONIC) && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            switch (LEVEL_TO_ZONE(gCurrentLevel)) {
                case ZONE_1: {
                    // This case is never executed.
                    // The boss_1 module does the transition to Cream
                    // explicitly.
                    CreateStageResultsCutscene(COURSE_END_UNLOCK_CREAM);
                } break;

                case ZONE_3: {
                    CreateStageResultsCutscene(COURSE_END_UNLOCK_TAILS);
                } break;

                case ZONE_5: {
                    CreateStageResultsCutscene(COURSE_END_UNLOCK_KNUCKLES);
                } break;

                default: {
                    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
                } break;
            }

            return;
        } else {
            CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
            return;
        }
    }
}

void Task_802EE78(void)
{
    StageResultsInit *sri = TASK_DATA(gCurTask);
    ScreenFade *ts = &sri->ts;
    UpdateScreenFade(ts);

    if (++sri->unk10 > 8) {
        ts->brightness = Q(0);
        ts->flags = 2;
        ts->speed = 0;
        ts->bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        ts->bldAlpha = 0;

        if (gCurrentLevel != LEVEL_INDEX(ZONE_7, ACT_BOSS)) {
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        }

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            u32 x, y;

            x = gUnknown_080D6DE4[sri->unk11][0];
            x -= I(gPlayer.qWorldX);
            y = gUnknown_080D6DE4[sri->unk11][1];
            y -= I(gPlayer.qWorldY);

            gPlayer.qWorldX += Q(x);
            gPlayer.qWorldY += Q(y);

            gCamera.x += x;
            gCamera.y += y;
            gCamera.unk20 += x;
            gCamera.unk24 += y;
            gCamera.unk10 += x;
            gCamera.unk14 += y;

            if (gCheese != NULL) {
                gCheese->posX += Q(x);
                gCheese->posY += Q(y);
            }

            gBossIndex++;
        }

        gCurTask->main = Task_802F06C;
    }
}

void sub_802EF68(s16 p0, s16 p1, u8 p2)
{
    struct Task *t = TaskCreate(Task_802EE78, sizeof(StageResultsInit), 0x6080, 0, NULL);
    StageResultsInit *sri = TASK_DATA(t);
    ScreenFade *ts = &sri->ts;

    sri->unk10 = 0;
    sri->unkC = p0;
    sri->unkE = p1;
    sri->unk11 = p2;

    ts->window = 0;
    ts->brightness = Q(8.0);
    ts->flags = 1;
    ts->speed = Q(3. / 4.);
    ts->bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    ts->bldAlpha = 0;

    m4aSongNumStart(SE_333);
}

void InitHBlankBgOffsets(u16 xOffset)
{
    if (gBgOffsetsHBlank == &gBgOffsetsBuffer) {
#if DISPLAY_WIDTH > 255
        DmaFill32(3, xOffset, &gBgOffsetsBuffer[0][0], sizeof(gBgOffsetsBuffer[0]));
#else
        DmaFill16(3, xOffset, &gBgOffsetsBuffer[0][0], sizeof(gBgOffsetsBuffer[0]));
#endif
    } else {
#if DISPLAY_WIDTH > 255
        DmaFill32(3, xOffset, &gBgOffsetsBuffer[1][0], sizeof(gBgOffsetsBuffer[1]));
#else
        DmaFill16(3, xOffset, &gBgOffsetsBuffer[1][0], sizeof(gBgOffsetsBuffer[1]));
#endif
    }
}

// Unused
void SetBgOffsetsInRange(u16 value, int_vcount from, int_vcount to)
{
    u16 *offsets = gBgOffsetsHBlank;
    offsets += from;

    for (; from < to; from++) {
        *offsets++ = value;
    }
}

void Task_802F06C(void)
{
    StageResultsInit *sri = TASK_DATA(gCurTask);

    ScreenFade *ts = &sri->ts;
    UpdateScreenFade(ts);

    if (++sri->unk10 > ZONE_TIME_TO_INT(0, 2)) {
        ts->speed = 60;
        gCurTask->main = Task_802ED98;
    }
}