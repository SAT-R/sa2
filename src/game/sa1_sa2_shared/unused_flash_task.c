#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "animation_commands_bg.h"
#include "game/title_screen.h"

#include "data/tileset_debug_ascii.h"

static const char ALIGNED(4) sTxtFlash[]
    = { 'F', 'L', 'A', 'S', 'H', 0xC5, 0xB2, 0xC4, 0x2C, 0xBE, 0xB0, 0xCC, 0xDE, 0xC3, 0xDE, 0xB7, 0xC5, 0xB2, 0xC3, 0xDE, 0xBD };

void Task_UnusedFlashTask(void);
void DestroyUnusedFlashTask(void);

void CreateUnusedFlashTask(void)
{
    gDispCnt = (DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0);
    gBgCntRegs[2] = (BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(1));
    DmaFill32(3, 0, VRAM, 2 * TILE_SIZE_4BPP);

    SA2_LABEL(gUnknown_03004D80)[2] = 0;
    SA2_LABEL(gUnknown_03002280)[2][0] = 0;
    SA2_LABEL(gUnknown_03002280)[2][1] = 0;
    SA2_LABEL(gUnknown_03002280)[2][2] = 0xFF;
    SA2_LABEL(gUnknown_03002280)[2][3] = 0x40;

    {
        struct Task *t = TaskCreate(Task_UnusedFlashTask, 0, 0x1000, 0, NULL);
        gBgPalette[1] = RGB_WHITE;
        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}

void Task_UnusedFlashTask(void)
{
    RenderText((void *)(VRAM + 1 * TILE_SIZE_4BPP), &Tileset_DebugAscii, 1, 10, 2, sTxtFlash, 0);

    if (gPressedKeys & A_BUTTON) {
        DestroyUnusedFlashTask();
    }
}

void DestroyUnusedFlashTask(void)
{
    SA2_LABEL(gUnknown_03004D80)[2] = 0;
    SA2_LABEL(gUnknown_03002280)[2][0] = 0;
    SA2_LABEL(gUnknown_03002280)[2][1] = 0;
    SA2_LABEL(gUnknown_03002280)[2][2] = 0xFF;
    SA2_LABEL(gUnknown_03002280)[2][3] = 0x20;

    TaskDestroy(gCurTask);

#if (GAME == GAME_SA1)
    CreateSegaLogo();
#elif (GAME == GAME_SA2)
    CreateTitleScreen();
#endif
}