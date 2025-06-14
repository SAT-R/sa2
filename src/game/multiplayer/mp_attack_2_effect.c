#include "global.h"
#include "core.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/multiplayer/mp_attack_2_effect.h"

#include "constants/zones.h"

#ifndef COLLECT_RINGS_ROM
// Not clear why this is 16 aligned in the main game
MultiPlayerBgCtrlRegs ALIGNED(16) *gMPAttackEffect2Regs = NULL;
#else
MultiPlayerBgCtrlRegs *gMPAttackEffect2Regs = NULL;
#endif

static void Task_MPAttackEffect2(void);
static void TaskDestructor_MPAttackEffect2(struct Task *);

void CreateMPAttack2Effect(void)
{
    if ((IS_MULTI_PLAYER) && (ACT_INDEX(gCurrentLevel) != ACT_BOSS)
        && ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) || (gUnknown_030054B0 > 0))
        && (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        if (gMPAttackEffect2Regs != NULL) {
            gMPAttackEffect2Regs->sizeChangeDelay = 600;
        } else {
            // _0801A3D0
            struct Task *t = TaskCreate(Task_MPAttackEffect2, (sizeof(MultiPlayerBgCtrlRegs)), 0xE000, 0, TaskDestructor_MPAttackEffect2);
            MultiPlayerBgCtrlRegs *regs = TASK_DATA(t);

            gMPAttackEffect2Regs = regs;

            regs->timer = 0;
            regs->sizeChangeDelay = 600;
            regs->sizeChangeTimer = 0;
            regs->size = 0;

            gMosaicReg = 0;

            gBgCntRegs[0] |= 0x40;
            gBgCntRegs[1] |= 0x40;
            gBgCntRegs[2] |= 0x40;
            gBgCntRegs[3] |= 0x40;
        }
    }
}

static void Task_MPAttackEffect2(void)
{
    MultiPlayerBgCtrlRegs *regs = TASK_DATA(gCurTask);
    s16 *p;

    regs->timer++;

    if (regs->sizeChangeDelay != 0) {
        if (regs->size < 15) {
            if (++regs->sizeChangeTimer >= 4) {
                regs->size++;
                regs->sizeChangeTimer = 0;
            }
        } else {
            regs->sizeChangeDelay--;
        }
    } else if (regs->size == 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        if (++regs->sizeChangeTimer >= 4) {
            regs->size--;
            regs->sizeChangeTimer = 0;
        }
    }

    {
        u16 value = regs->size & 0xF;
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

static void TaskDestructor_MPAttackEffect2(struct Task *t)
{
    gMPAttackEffect2Regs = NULL;

    gBgCntRegs[0] &= ~0x40;
    gBgCntRegs[1] &= ~0x40;
    gBgCntRegs[2] &= ~0x40;
    gBgCntRegs[3] &= ~0x40;

    gMosaicReg = 0;
}
