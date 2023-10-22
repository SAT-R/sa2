#include "global.h"
#include "task.h"
#include "game/game.h"
#include "game/save.h"
#include "game/cutscenes/level_endings.h"
#include "game/screen_transition.h"
#include "game/time_attack/results.h"

#include "constants/zones.h"

typedef struct {
    /* 0x00 */ struct TransitionState ts;
    /* 0x0C */ u8 fillerC[0x8];
} StageResultsInit; /* size: 0x14 */

void Task_802ED98(void)
{
    StageResultsInit *sri = TASK_DATA(gCurTask);
    struct TransitionState *ts = &sri->ts;

    if (NextTransitionFrame(ts) == SCREEN_TRANSITION_COMPLETE) {
        TaskDestroy(gCurTask);

        if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
            CreateTimeAttackResults(gCourseTime);
            return;
        }

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            return;
        }

        if ((gSelectedCharacter == CHARACTER_SONIC)
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            switch (LEVEL_TO_ZONE(gCurrentLevel)) {
                case ZONE_1: {
                    CreateCourseResultsCutScene(COURSE_END_UNLOCK_CREAM);
                } break;

                case ZONE_3: {
                    CreateCourseResultsCutScene(COURSE_END_UNLOCK_TAILS);
                } break;

                case ZONE_5: {
                    CreateCourseResultsCutScene(COURSE_END_UNLOCK_KNUCKLES);
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