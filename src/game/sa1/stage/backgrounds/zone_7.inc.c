#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

void StageBgUpdate_Zone7Act1(s32 x, s32 y)
{
    Background *bg;
    const Collision *collision;
    s32 xSub, ySub;

    x -= gCamera.SA2_LABEL(unk20);
    y -= gCamera.SA2_LABEL(unk24);

    collision = gRefCollision;

    xSub = Div(x * 64 - x * 8, collision->pxWidth - DISPLAY_WIDTH);
    gBgScrollRegs[3][0] = gCamera.SA2_LABEL(unk52) = xSub;

    ySub = Div((y << 4) + y * 8, collision->pxHeight - DISPLAY_HEIGHT);
    gCamera.SA2_LABEL(unk54) = ySub;
    gBgScrollRegs[3][1] = ySub;
}

void CreateStageBg_Zone7_Act2(void)
{
    Background *bg;
    const Collision *collision;

    DmaFill32(3, 0, BG_TILE_ADDR(128), 0x4000);
    DmaFill32(3, 0, BG_TILE_ADDR(448), 0x800);

    gBgCntRegs[2] = BGCNT_TXT512x256 | BGCNT_SCREENBASE(28) | BGCNT_256COLOR | 0x5;
}
