#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"

#include "constants/tilemaps.h"

typedef struct {
    Background map;
} TMViewer;

void Task_DebugTilemapViewer(void);
void TaskDestructor_TMViewer(struct Task *t);

extern struct Task *gDebugUITask;

// src/stage/debug_text_printer.c
struct Task *Debug_CreateAsciiTask(s16 x, s16 y);
void Debug_PrintIntegerAt(u32 value, u16 x, u16 y);
void Debug_PrintTextAt(char *value, u16 x, u16 y);

void CreateDebugTilemapViewer(void)
{
    struct Task *t = TaskCreate(Task_DebugTilemapViewer, sizeof(TMViewer), 0, 0,
                                TaskDestructor_TMViewer);
    TMViewer *tv = TaskGetStructPtr(t);

    Debug_CreateAsciiTask(16, 16);

    gDispCnt = DISPCNT_MODE_0;
    gDispCnt |= DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;

    gBgCntRegs[0] = 0x1f04;
    gBgCntRegs[1] = 0x9d0a;
    gBgCntRegs[2] = 0x7a81;

    gBgCntRegs[0] ^= BGCNT_256COLOR;
    gBgCntRegs[1] ^= BGCNT_256COLOR;
    gBgCntRegs[2] ^= BGCNT_256COLOR;
    gBgCntRegs[3] ^= BGCNT_256COLOR;

    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xFF;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0x200;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    tv->map.graphics.dest = (void *)BG_SCREEN_ADDR(0);
    tv->map.graphics.anim = 0;
    tv->map.tilesVram = (void *)BG_SCREEN_ADDR(26);
    tv->map.unk18 = 0;
    tv->map.unk1A = 0;
    tv->map.unk1C = TM_REGULAR_FINAL_BOSS;
    tv->map.unk1E = 0;
    tv->map.unk20 = 0;
    tv->map.unk22 = 0;
    tv->map.unk24 = 0;
    tv->map.unk26 = 0x20;
    tv->map.unk28 = 0x20;
    tv->map.unk2A = 0;
    tv->map.unk2E = 6;

    sub_8002A3C(&tv->map);

    TaskDestroy(gCurTask);
}

extern void CreateTitleScreen(void);

void Task_DebugTilemapViewer(void)
{
    TMViewer *tv = TaskGetStructPtr(gCurTask);
    u8 mode = gDispCnt & 0x7;

    if (gReleasedKeys & B_BUTTON) {
        TaskDestroy(gCurTask);
        CreateTitleScreen();
    }

    // Go through modes 0-5
    if (gPressedKeys & START_BUTTON) {
        gDispCnt &= ~0x7;
        gDispCnt |= (++mode) % 6;
    }

    // Toggle between 4bb/8bpp
    if (gPressedKeys & SELECT_BUTTON) {
        gBgCntRegs[0] ^= BGCNT_256COLOR;
        gBgCntRegs[1] ^= BGCNT_256COLOR;
        gBgCntRegs[2] ^= BGCNT_256COLOR;
        gBgCntRegs[3] ^= BGCNT_256COLOR;
    }

    if (gRepeatedKeys & L_BUTTON) {
        tv->map.unk1C--;
        if (((s16)tv->map.unk1C) < 0)
            tv->map.unk1C = TM_COUNT - 1;

        tv->map.unk2E &= ~0x8;
        tv->map.unk2E &= ~0x10;

        if (gMapHeaders[tv->map.unk1C] != NULL)
            sub_8002A3C(&tv->map);
    }
    if (gRepeatedKeys & R_BUTTON) {
        tv->map.unk1C = (tv->map.unk1C + 1) % TM_COUNT;
        tv->map.unk2E &= ~0x8;
        tv->map.unk2E &= ~0x10;

        if (gMapHeaders[tv->map.unk1C] != NULL)
            sub_8002A3C(&tv->map);
    } else {
        if (gRepeatedKeys & DPAD_LEFT) {
            gBgScrollRegs[2][0] -= 8;
            tv->map.unk2E &= ~0x8;
        }
        if (gRepeatedKeys & DPAD_RIGHT) {
            gBgScrollRegs[2][0] += 8;
            tv->map.unk2E &= ~0x8;
        }
        if (gRepeatedKeys & DPAD_UP) {
            gBgScrollRegs[2][1] -= 8;
            tv->map.unk2E &= ~0x8;
        }
        if (gRepeatedKeys & DPAD_DOWN) {
            gBgScrollRegs[2][1] += 8;
            tv->map.unk2E &= ~0x8;
        }
    }

    Debug_PrintIntegerAt(tv->map.unk1C, DISPLAY_WIDTH - 8, 16);

    {
        int idX = DISPLAY_WIDTH - 8;
        int idY = 16;
        int bppX = DISPLAY_WIDTH - 32;
        int bppY = 32;
        int bpp = (gBgCntRegs[2] & BGCNT_256COLOR) ? 8 : 4;
        int bgModeX = DISPLAY_WIDTH - (8 + 8 * 8);
        int bgModeY = 48;

        Debug_PrintIntegerAt(tv->map.unk1C, idX, idY);
        Debug_PrintIntegerAt(bpp, bppX, bppY);
        Debug_PrintTextAt("BPP", bppX + 8, bppY);

        Debug_PrintIntegerAt(mode, bgModeX + 8 * 8, bgModeY);
        Debug_PrintTextAt("BG-Mode:", bgModeX, bgModeY);
    }
}

void TaskDestructor_TMViewer(struct Task *t)
{
    TaskDestroy(gDebugUITask);
    gDebugUITask = NULL;
}