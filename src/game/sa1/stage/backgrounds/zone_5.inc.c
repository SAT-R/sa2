#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

void StageBgUpdate_Zone5Acts12(s32 x, s32 y)
{
    Background *bg;
    gDispCnt |= DISPCNT_BG0_ON;
    gBldRegs.bldCnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0 | BLDCNT_TGT2_ALL;
    gBldRegs.bldAlpha = BLDALPHA_BLEND(12, 16);

    bg = &gStageBackgroundsRam.unk0;
    gBgScrollRegs[0][0] = (0x100 - (gStageTime / 4)) & 0xFF;
    gBgScrollRegs[0][1] = 0;
    DrawBackground(bg);
    UpdateBgAnimationTiles(bg);
}