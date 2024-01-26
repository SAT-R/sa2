#include "global.h"
#include "core.h"

void StageBgUpdate_Zone6ActBoss(void)
{
    gBgCntRegs[0] |= 0x3;
    gBgCntRegs[3] &= ~0x3;
    gBgCntRegs[3] |= 0x2;
    gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
}