#include "global.h"
#include "core.h"
#include "task.h"
#include "game/game.h"
#include "game/title_screen.h"

#include "animation_commands_extra.h"
#include "data/tileset_language.h"

const char ALIGNED(4) gUnknown_080D5128[8] = "STAGE";

typedef struct {
    void *vram;
    u16 unk4;
    u8 unk6;
} Struct_LangTask;

void Task_8009854(void);

void sub_80096DC(void)
{
    struct Task *t = TaskCreate(Task_8009854, sizeof(Struct_LangTask), 0x2000, 0, NULL);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    {
        Struct_LangTask *lang = TaskGetStructPtr(t);

        gDispCnt = (DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0);
        gBgCntRegs[0] = (BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_CHARBASE(1)
                         | BGCNT_PRIORITY(2));

        lang->unk4 = 0;
        lang->unk6 = 0;
        lang->vram = (void *)(BG_CHAR_ADDR(1) + 1 * TILE_SIZE_4BPP);

        gBldRegs.bldY = 0;
        gBldRegs.bldCnt = BLDCNT_EFFECT_NONE;
        gBldRegs.bldAlpha = BLDCNT_EFFECT_NONE;

        gWinRegs[WINREG_WIN0H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);

        gWinRegs[WINREG_WIN1H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);

        gWinRegs[WINREG_WININ] = 0;
        gWinRegs[WINREG_WINOUT] = 0;

        gDispCnt &= ~(DISPCNT_OBJWIN_ON | DISPCNT_WIN1_ON | DISPCNT_WIN0_ON);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
    }
}
