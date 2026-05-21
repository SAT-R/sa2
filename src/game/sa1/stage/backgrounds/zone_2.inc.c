#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

#define ZONE2_EXTERIOR_CAM_X(_x) Div((_x)*16, (78 * 16))
#define ZONE2_EXTERIOR_CAM_Y(_y) (512 - DISPLAY_HEIGHT)

extern void StageBgUpdate_Zone2_Interior(s32 x, s32 y);

void StageBgUpdate_Zone2Act1(s32 x, s32 y)
{
    Background *bg;
    const Collision *collision;
    s32 xSub, ySub;

    x -= gCamera.SA2_LABEL(unk20);
    y -= gCamera.SA2_LABEL(unk24);

    if (x < 1488) {
        collision = gRefCollision;

        xSub = ZONE2_EXTERIOR_CAM_X(x);
        gBgScrollRegs[3][0] = gCamera.SA2_LABEL(unk52) = xSub;

        ySub = ZONE2_EXTERIOR_CAM_Y(y);
        gCamera.SA2_LABEL(unk54) = ySub;
        gBgScrollRegs[3][1] = ySub;
    } else {
        StageBgUpdate_Zone2_Interior(x, y);
    }
}

void StageBgUpdate_Zone2Act2(s32 x, s32 y)
{
    x -= gCamera.SA2_LABEL(unk20);
    y -= gCamera.SA2_LABEL(unk24);

    StageBgUpdate_Zone2_Interior(x, y);
}