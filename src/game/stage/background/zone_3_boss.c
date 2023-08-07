#include "global.h"
#include "core.h"

void StageBgUpdateZone3ActBoss(void)
{
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][1] = 0;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[3][0] = 0;
}