#include "global.h"
#include "game/cutscenes/endings.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "game/cutscenes/extra_ending_fall.h"
#include "game/cutscenes/final_ending_fall.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "game/save.h"

#include "constants/songs.h"

struct EndingCutSceneTransition {
    u8 filler0[0x6C];
    u8 unk6C;
    u8 unk6D;
    u16 unk6E;
    u8 filler[4];
} /* 0x74 */;

void sub_808E9AC(void);
void sub_808E9F8(struct Task *);

void StartEndingCutscenes(void)
{
    struct Task *t = TaskCreate(sub_808E9AC, sizeof(struct EndingCutSceneTransition), 0x3100, 0, sub_808E9F8);
    struct EndingCutSceneTransition *fade = TASK_DATA(t);

    fade->unk6C = 0;
    fade->unk6D = 0;
    fade->unk6E = 0xB4;
}

void sub_808E8F8(s16 *ptr, s16 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 rand = PseudoRandom32();
        if (rand >> 8 != 0) {
            *ptr += ((rand) >> ((16 - b)));
        } else {
            *ptr -= ((rand) >> ((8 - b)));
        }
    }
}

void sub_808E95C(s32 *ptr, s32 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 rand = PseudoRandom32();
        if (rand >> 8 != 0) {
            *ptr += ((rand) >> ((8 - b)));
        } else {
            *ptr -= (rand);
        }
    }
}

void sub_808E9AC(void)
{
    struct EndingCutSceneTransition *fade = TASK_DATA(gCurTask);

    if (fade->unk6E != 0) {
        fade->unk6E--;
    } else {
        if (gCurrentLevel == (LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) + 1)) {
            CreateExtraEndingFallCutScene();
        } else {
            CreateFinalEndingFallCutScene();
        }
        TaskDestroy(gCurTask);
    }
}

void sub_808E9F8(UNUSED struct Task *t)
{
    // unused logic
}

UNUSED void sub_808E9FC(void)
{
    struct EndingCutSceneTransition *fade = TASK_DATA(gCurTask);
    if (gLoadedSaveGame->unlockedLevels[gSelectedCharacter] > (LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        fade->unk6D = 2;
    } else {
        fade->unk6D = 1;
    }

    gCurTask->main = sub_808E9AC;
}
