#include "global.h"
#include "core.h"
#include "task.h"
#include "animation_commands_bg.h"
#include "game/title_screen.h"

#include "data/tileset_language.h"

const u8 ALIGNED(4) gUnknown_080D5130[]
    = { 'F',  'L',  'A',  'S',  'H',  0xC5, 0xB2, 0xC4, 0x2C, 0xBE, 0xB0,
        0xCC, 0xDE, 0xC3, 0xDE, 0xB7, 0xC5, 0xB2, 0xC3, 0xDE, 0xBD };

void Task_800A4CC(void);
void sub_800A510(void);

void sub_800A43C(void)
{
    gDispCnt = (DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0);
    gBgCntRegs[2]
        = (BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(1));
    DmaFill32(3, 0, VRAM, 2 * TILE_SIZE_4BPP);

    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x40;

    {
        struct Task *t = TaskCreate(Task_800A4CC, 0, 0x1000, 0, NULL);
        gBgPalette[1] = RGB_WHITE;
        gFlags |= 0x1;
    }
}

void Task_800A4CC(void)
{
    RenderText((void *)(VRAM + 1 * TILE_SIZE_4BPP), &Tileset_Language, 1, 10, 2,
                gUnknown_080D5130, 0);

    if (gPressedKeys & A_BUTTON) {
        sub_800A510();
    }
}

void sub_800A510(void)
{
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    TaskDestroy(gCurTask);
    CreateTitleScreen();
}