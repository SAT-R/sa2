#include "global.h"
#include "cut_scenes_endings.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes_extra_ending_fall.h"
#include "cut_scenes_final_ending_fall.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "trig.h"
#include "course_select.h"
#include "save.h"
#include "title_screen.h"
#include "random.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

struct EndingCutSceneTransition {
    u8 filler0[0x6C];
    u8 unk6C;
    u8 unk6D;
    u16 unk6E;
    u8 filler[4];
} /* 0x74 */;

void sub_808E9AC(void);
void sub_808E9F8(struct Task *);

void StartEndingCutScenes(void)
{
    struct Task *t = TaskCreate(sub_808E9AC, 0x74, 0x3100, 0, sub_808E9F8);
    struct EndingCutSceneTransition *transition = TaskGetStructPtr(t);

    transition->unk6C = 0;
    transition->unk6D = 0;
    transition->unk6E = 0xB4;
}

void sub_808E8F8(s16 *ptr, s16 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 temp;
        gUnknown_030053B8 = (gUnknown_030053B8 * 0x196225) + 0x3C6EF35F;

        temp = gUnknown_030053B8;
        if (temp >> 8 != 0) {
            *ptr += ((temp) >> ((0x10 - b)));
        } else {
            *ptr -= ((temp) >> ((8 - b)));
        }
    }
}

void sub_808E95C(s32 *ptr, s32 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 temp;
        gUnknown_030053B8 = (gUnknown_030053B8 * 0x196225) + 0x3C6EF35F;

        temp = gUnknown_030053B8;
        if (temp >> 8 != 0) {
            *ptr += ((temp) >> ((8 - b)));
        } else {
            *ptr -= (temp);
        }
    }
}

void sub_808E9AC(void)
{
    struct EndingCutSceneTransition *transition = TaskGetStructPtr(gCurTask);

    if (transition->unk6E != 0) {
        transition->unk6E--;
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
    struct EndingCutSceneTransition *transition = TaskGetStructPtr(gCurTask);
    if (gLoadedSaveGame->unk7[gSelectedCharacter]
        > (LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        transition->unk6D = 2;
    } else {
        transition->unk6D = 1;
    }

    gCurTask->main = sub_808E9AC;
}
