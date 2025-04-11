#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "game/stage/background/callbacks.h"

void StageBgUpdate_ZoneFinalActTA53(void)
{
    u32 aBool = FALSE;
    int_vcount y;

    if (gActiveBossTask != NULL) {
        TA53Boss *boss = TASK_DATA(gActiveBossTask);
        aBool = boss->unk10 & 0x1;
    }

    if (aBool) {
        u16 *offset;
        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)&REG_BG1HOFS;
        gHBlankCopySize = 2;

        offset = (u16 *)gBgOffsetsHBlank;
        for (y = 0; y < DISPLAY_HEIGHT - 1; y++) {
            s16 val = SIN(((y + gStageTime) * 40) & ONE_CYCLE) >> 12;
            *offset++ = val;
        }
    }
}