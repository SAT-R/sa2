#include "global.h"
#include "core.h"
#include "flags.h"

#include "game/stage/background/callbacks.h"

void StageBgUpdateZone5ActBoss(void)
{
    gDispCnt &= ~DISPCNT_BG1_ON;
    gBgScrollRegs[0][0]++;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_BgUpdateZone5ActBoss;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}