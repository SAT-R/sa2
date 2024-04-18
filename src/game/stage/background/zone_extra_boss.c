#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "trig.h"

#include "sakit/globals.h"

#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "game/stage/background/callbacks.h"

void StageBgUpdate_ZoneFinalActTA53(void)
{
    u32 aBool = FALSE;
    int_vcount y;

    if (gActiveBossTask != NULL) {
        Sprite_TrueArea53Boss *boss = TASK_DATA(gActiveBossTask);
        aBool = boss->unk10 & 0x1;
    }

    if (aBool) {
        u16 *ptr;
        gFlags |= FLAGS_4;
        gUnknown_03002878 = (void *)&REG_BG1HOFS;
        gUnknown_03002A80 = 2;

        ptr = (u16 *)gBgOffsetsHBlank;
        for (y = 0; y < DISPLAY_HEIGHT - 1; y++) {
            s16 val = SIN(((y + gStageTime) * 40) & ONE_CYCLE) >> 12;
            *ptr++ = val;
        }
    }
}