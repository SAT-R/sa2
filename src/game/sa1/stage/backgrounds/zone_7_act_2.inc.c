#include "global.h"
#include "core.h"
#include "flags.h"
#include "animation_commands_bg.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

extern void HBlankCallback_803F92C(int_vcount line);
extern void VBlankCallback_803F920(void);

void StageBgUpdate_Zone7Act2(s32 x, s32 y)
{
    Camera *cam = &gCamera;
    Background *bg = &gStageBackgroundsRam.unkC0;
    const Collision *collision;
    u32 *offsets;
    s32 i;

    gBgScrollRegs[1][0] = cam->SA2_LABEL(unk52) = 0;
    gBgScrollRegs[1][1] = cam->SA2_LABEL(unk54) = 0;

    bg->scrollX = 0;
    bg->scrollY = 0;
    DrawBackground(bg);

    offsets = gBgOffsetsHBlankPrimary;
    offsets += 90; // Earth is static, so skip those lines

    DmaFill32(3, (gStageTime >> 6) & 0xFF, offsets, 10 * sizeof(u32));
    offsets += 10;

    DmaFill32(3, (gStageTime >> 5) & 0xFF, offsets, 5 * sizeof(u32));
    offsets += 5;

    DmaFill32(3, (gStageTime >> 4) & 0xFF, offsets, 8 * sizeof(u32));
    offsets += 8;

    DmaFill32(3, (gStageTime >> 3) & 0xFF, offsets, 16 * sizeof(u32));
    offsets += 16;

    for (i = 1; i < 32; i++) {
        *offsets++ = ((gStageTime >> 3) + ((gStageTime * i) >> 5)) & 0xFF;
    }

    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCallback_803F92C;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;

    gVBlankCallbacks[gNumVBlankCallbacks++] = VBlankCallback_803F920;
    gFlags |= FLAGS_EXECUTE_VBLANK_CALLBACKS;
}
