#include "global.h"
#include "flags.h"

#include "game/globals.h"
#include "game/shared/stage/camera.h"

void StageBgUpdate_Zone1Acts12(s32 x, s32 UNUSED y)
{
    Camera *cam = &gCamera;
    Background *bg;
    u16 *offsets;
    s32 i;
    s32 r3;

    x -= cam->SA2_LABEL(unk20);

    bg = &gStageBackgroundsRam.unkC0;

    gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;
    gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = 0;

    bg->scrollX = 0;
    bg->scrollY = 0;
    DrawBackground(bg);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)&REG_BG3HOFS;
    gHBlankCopySize = 4;

    offsets = gBgOffsetsHBlankPrimary;

    for (i = 0; i < 8; i++) {
        // Highest moving cloud (fastest)
        *offsets++ = (gStageTime >> 4) & 0xFF;
        *offsets++ = 0;
    }

    for (i = 0; i < 16; i++) {
        // 2nd highest moving cloud (slower)
        *offsets++ = (gStageTime >> 5) & 0xFF;
        *offsets++ = 0;
    }

    for (i = 24; i < 40; i++) {
        // Lowest moving cloud (slowest)
        *offsets++ = (gStageTime >> 6) & 0xFF;
        *offsets++ = 0;

#ifndef NON_MATCHING
        asm("" ::"r"(i));
#endif
    }

    for (; i < 88; i++) {
        // Big clouds and islands (static)
        *offsets++ = 0;
        *offsets++ = 0;
    }

    for (; i < 160; i++) {
        // Water
        *offsets++ = ((i - 86) * x) >> 8;
        *offsets++ = 0;
    }
}