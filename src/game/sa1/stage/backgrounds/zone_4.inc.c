#include "global.h"
#include "core.h"
#include "animation_commands_bg.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/water_effects.h"

void StageBgUpdate_Zone4Acts12(s32 x, s32 y)
{
    Camera *cam = &gCamera;
    Background *bg;
    u16 *offsets;
    const Collision *coll;
    s32 xSub, ySub;
    s32 v;

    gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
    gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 16);

    x -= cam->SA2_LABEL(unk20);
    y -= cam->SA2_LABEL(unk24);

    // Snow layer
    bg = &gStageBackgroundsRam.unk0;

    gBgScrollRegs[0][0] = ((x + (x >> 2)) + (gStageTime >> 2)) & 0xFF;
    gBgScrollRegs[0][1] = y + 256;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - gStageTime) & 0xFF;
    DrawBackground(bg);
    UpdateBgAnimationTiles(bg);

    coll = gRefCollision;

    xSub = Div(x << 4, coll->pxWidth - DISPLAY_WIDTH);
    cam->SA2_LABEL(unk52) = xSub;
    gBgScrollRegs[3][0] = xSub;

    ySub = Div(((y << 8) + (y << 6) + (y << 5)), coll->pxHeight - DISPLAY_HEIGHT);
    cam->SA2_LABEL(unk54) = ySub;
    gBgScrollRegs[3][1] = ySub;

    if (gWater.SA2_LABEL(unk1) == 0) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
    }

    if (gWater.SA2_LABEL(unk1) == 0) {
        REG_DISPCNT &= ~DISPCNT_BG0_ON;
    }
}
