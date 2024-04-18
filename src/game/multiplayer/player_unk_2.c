#include "global.h"
#include "core.h"

#include "sakit/globals.h"

#include "game/multiplayer/player_unk_2.h"

#include "constants/zones.h"

// Not clear why this is 16 aligned
MultiPlayerBgCtrlRegs ALIGNED(16) *gUnknown_03005840 = NULL;

void Task_PlayerMPUnk2(void);
void TaskDestructor_PlayerMPUnk2(struct Task *);

void sub_801A384(void)
{
    if ((IS_MULTI_PLAYER) && (ACT_INDEX(gCurrentLevel) != ACT_BOSS)
        && ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
            || (gUnknown_030054B0 > 0))
        && (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        if (gUnknown_03005840 != NULL) {
            gUnknown_03005840->unk2 = 600;
        } else {
            // _0801A3D0
            struct Task *t
                = TaskCreate(Task_PlayerMPUnk2, (sizeof(MultiPlayerBgCtrlRegs)), 0xE000,
                             0, TaskDestructor_PlayerMPUnk2);
            MultiPlayerBgCtrlRegs *regs = TASK_DATA(t);

            gUnknown_03005840 = regs;

            regs->unk0 = 0;
            regs->unk2 = 600;
            regs->unk4 = 0;
            regs->unk6 = 0;

            gMosaicReg = 0;

            gBgCntRegs[0] |= 0x40;
            gBgCntRegs[1] |= 0x40;
            gBgCntRegs[2] |= 0x40;
            gBgCntRegs[3] |= 0x40;
        }
    }
}

void Task_PlayerMPUnk2(void)
{
    MultiPlayerBgCtrlRegs *regs = TASK_DATA(gCurTask);
    s16 *p;

    regs->unk0++;

    if (regs->unk2 != 0) {
        if (regs->unk6 < 15) {
            if (++regs->unk4 >= 4) {
                regs->unk6++;
                regs->unk4 = 0;
            }
        } else {
            regs->unk2--;
        }
    } else if (regs->unk6 == 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        if (++regs->unk4 >= 4) {
            regs->unk6--;
            regs->unk4 = 0;
        }
    }

    {
        u16 value = regs->unk6 & 0xF;
        gMosaicReg = (value << 12);
        gMosaicReg |= (value << 8);
        gMosaicReg |= (value << 4);
        gMosaicReg |= (value << 0);
    }

    gBgCntRegs[0] |= 0x40;
    gBgCntRegs[1] |= 0x40;
    gBgCntRegs[2] |= 0x40;
    gBgCntRegs[3] |= 0x40;
}

void TaskDestructor_PlayerMPUnk2(struct Task *t)
{
    gUnknown_03005840 = NULL;

    gBgCntRegs[0] &= ~0x40;
    gBgCntRegs[1] &= ~0x40;
    gBgCntRegs[2] &= ~0x40;
    gBgCntRegs[3] &= ~0x40;

    gMosaicReg = 0;
}