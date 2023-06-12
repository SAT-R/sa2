#include "global.h"
#include "core.h"
#include "game/game.h"

#include "constants/zones.h"

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
            MultiPlayerBgCtrlRegs *bgCntRegs = TaskGetStructPtr(t);

            gUnknown_03005840 = bgCntRegs;

            bgCntRegs->unk0 = 0;
            bgCntRegs->unk2 = 600;
            bgCntRegs->unk4 = 0;
            bgCntRegs->unk6 = 0;

            gUnknown_030026D0 = 0;

            gBgCntRegs[0] |= 0x40;
            gBgCntRegs[1] |= 0x40;
            gBgCntRegs[2] |= 0x40;
            gBgCntRegs[3] |= 0x40;
        }
    }
}