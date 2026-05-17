#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/sa1/stage/mp_unk_0.h"
#include "game/globals.h"

void Task_801C770(void);
void Task_801C810(void);
void Task_801C8D4(void);
void sub_801C9AC(void);
void sub_801C9C0(int_vcount vcount);
void TaskDestructor_801C980(Task *t);

#define ROOT            DISPLAY_CENTER_X
#define X_RANGE(offset) WIN_RANGE((ROOT) - (offset), (ROOT) + (offset))

static const winreg_t sWin0Ranges[DISPLAY_HEIGHT] = {
    X_RANGE(00), //
    X_RANGE(12), //
    X_RANGE(00), //
    X_RANGE(12), //
    X_RANGE(00), //
    X_RANGE(12), //
    X_RANGE(00), //
    X_RANGE(12), //
    X_RANGE(00), //
    X_RANGE(11), //
    X_RANGE(00), //
    X_RANGE(11), //
    X_RANGE(00), //
    X_RANGE(11), //
    X_RANGE(00), //
    X_RANGE(11), //
    X_RANGE(00), //
    X_RANGE(11), //
    X_RANGE(15), //
    X_RANGE(19), //
    X_RANGE(22), //
    X_RANGE(24), //
    X_RANGE(27), //
    X_RANGE(29), //
    X_RANGE(30), //
    X_RANGE(32), //
    X_RANGE(34), //
    X_RANGE(35), //
    X_RANGE(37), //
    X_RANGE(38), //
    X_RANGE(39), //
    X_RANGE(41), //
    X_RANGE(42), //
    X_RANGE(43), //
    X_RANGE(44), //
    X_RANGE(45), //
    X_RANGE(46), //
    X_RANGE(47), //
    X_RANGE(48), //
    X_RANGE(49), //
    X_RANGE(49), //
    X_RANGE(50), //
    X_RANGE(51), //
    X_RANGE(52), //
    X_RANGE(52), //
    X_RANGE(53), //
    X_RANGE(54), //
    X_RANGE(54), //
    X_RANGE(55), //
    X_RANGE(55), //
    X_RANGE(56), //
    X_RANGE(57), //
    X_RANGE(57), //
    X_RANGE(58), //
    X_RANGE(58), //
    X_RANGE(58), //
    X_RANGE(59), //
    X_RANGE(59), //
    X_RANGE(60), //
    X_RANGE(60), //
    X_RANGE(60), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(64), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(63), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(62), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(61), //
    X_RANGE(60), //
    X_RANGE(60), //
    X_RANGE(60), //
    X_RANGE(59), //
    X_RANGE(59), //
    X_RANGE(58), //
    X_RANGE(58), //
    X_RANGE(58), //
    X_RANGE(57), //
    X_RANGE(57), //
    X_RANGE(56), //
    X_RANGE(55), //
    X_RANGE(55), //
    X_RANGE(54), //
    X_RANGE(54), //
    X_RANGE(53), //
    X_RANGE(52), //
    X_RANGE(52), //
    X_RANGE(51), //
    X_RANGE(50), //
    X_RANGE(49), //
    X_RANGE(49), //
    X_RANGE(48), //
    X_RANGE(47), //
    X_RANGE(46), //
    X_RANGE(45), //
    X_RANGE(44), //
    X_RANGE(43), //
    X_RANGE(42), //
    X_RANGE(41), //
    X_RANGE(39), //
    X_RANGE(38), //
    X_RANGE(37), //
    X_RANGE(35), //
    X_RANGE(34), //
    X_RANGE(32), //
    X_RANGE(30), //
    X_RANGE(29), //
    X_RANGE(27), //
    X_RANGE(24), //
    X_RANGE(22), //
    X_RANGE(19), //
    X_RANGE(15), //
    X_RANGE(11), //
    X_RANGE(16), //
    X_RANGE(11), //
    X_RANGE(16), //
    X_RANGE(11), //
    X_RANGE(16), //
    X_RANGE(11), //
    X_RANGE(16), //
    X_RANGE(11), //
    X_RANGE(17), //
    X_RANGE(12), //
    X_RANGE(17), //
    X_RANGE(12), //
    X_RANGE(17), //
    X_RANGE(12), //
    X_RANGE(17), //
    X_RANGE(12), //
};

Task *sub_801C704(void)
{
    Task *t;
    UnkMP0 *strc;

    t = TaskCreate(Task_801C770, 8U, 0x2000U, 0U, TaskDestructor_801C980);
    strc = TASK_DATA(t);
    strc->unk2 = 0;
    strc->unk4 = 600;
    strc->unk6 = 0;
    strc->unk0 = 64;

    gDispCnt |= DISPCNT_WIN0_ON;
    gWinRegs[WINREG_WININ] = 0x1F;
    gWinRegs[WINREG_WINOUT] = 63;
    gBldRegs.bldCnt = 0x3FDF;
    gBldRegs.bldY = 0;

    return t;
}

void Task_801C770()
{
    u16 temp_r0;
    u8 temp_r0_2;
    u8 temp_r0_3;

    UnkMP0 *strc = TASK_DATA(gCurTask);

    strc->unk2 += 64;
    if (strc->unk2 == 0x1000) {
        gCurTask->main = Task_801C810;
    }

    gBldRegs.bldY = I(strc->unk2);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(17, DISPLAY_HEIGHT - 16);
    gVBlankCallbacks[gNumVBlankCallbacks++] = sub_801C9AC;
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;
    gHBlankCallbacks[gNumHBlankCallbacks++] = sub_801C9C0;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}

void Task_801C810()
{
    u16 temp_r0;
    u8 temp_r0_2;
    u8 temp_r0_3;

    UnkMP0 *strc = TASK_DATA(gCurTask);
    u32 siocnt = REG_SIOCNT_32;

    gBldRegs.bldY = I(strc->unk2);
    gVBlankCallbacks[gNumVBlankCallbacks++] = sub_801C9AC;
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;
    gHBlankCallbacks[gNumHBlankCallbacks++] = sub_801C9C0;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;

    if (--strc->unk4 == 0) {
        gCurTask->main = Task_801C8D4;
    }

    if (gMultiplayerRanks[SIO_MULTI_CNT->id] != -1) {
        TaskDestroy(gCurTask);
    }
}

void Task_801C8D4()
{
    u16 temp_r0;
    u8 temp_r0_2;
    u8 temp_r0_3;

    UnkMP0 *strc = TASK_DATA(gCurTask);

    strc->unk2 -= 64;
    if ((strc->unk2 < 0x0) || (gMultiplayerRanks[SIO_MULTI_CNT->id] != -1)) {
        TaskDestroy(gCurTask);
        return;
    }

    gBldRegs.bldY = I(strc->unk2);
    gVBlankCallbacks[gNumVBlankCallbacks++] = sub_801C9AC;
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;
    gHBlankCallbacks[gNumHBlankCallbacks++] = sub_801C9C0;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}

void TaskDestructor_801C980(Task *t)
{
    gDispCnt &= ~DISPCNT_WIN0_ON;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, 0);
}

void sub_801C9AC(void)
{
    volatile winreg_t *regs = &REG_WIN0H;
    *regs = sWin0Ranges[0];
}

void sub_801C9C0(int_vcount vcount)
{
    volatile winreg_t *reg = &REG_WIN0H;
    const winreg_t *src = &sWin0Ranges[vcount];
    *reg = *src;
}
