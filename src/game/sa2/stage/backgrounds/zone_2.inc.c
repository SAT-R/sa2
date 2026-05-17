#include "trig.h"

#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

// (88.05%) https://decomp.me/scratch/ekyaq
// (91.40%) https://decomp.me/scratch/vapLV
// (95.71%) https://decomp.me/scratch/Naixp (more accurate)
NONMATCH("asm/non_matching/game/sa2/stage/background/StageBgUpdate_Zone2Acts12.inc",
         void StageBgUpdate_Zone2Acts12(s32 cameraX, s32 cameraY))
{
    s16 something;
    u8 i, j;
    s16 camFracY, camFracX;

    u16 *cursor;
    s32 x0 = 0;
    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= 7) {
        if (gBgScrollRegs[3][0] == 0) {
            gBgScrollRegs[3][0] = cameraX;
        }
        gBgScrollRegs[3][0] += (gPlayer.qSpeedGround >> 8);
        cameraX = gBgScrollRegs[3][0];
    }

    if (!IS_SINGLE_PLAYER) {
        gBgScrollRegs[3][0] = cameraX >> 4;
        camFracY = Div(cameraY, 0x10);
        if (camFracY > 0x100) {
            camFracY = 0x100;
        }
        gBgScrollRegs[3][1] = camFracY;
    } else {
        s32 dt;

        camFracY = Div(cameraY, 0x10);

        // Prevent wrapping of the background map at the bottom of the screen on high cameraY's
#if !WIDESCREEN_HACK
        if (camFracY > 0x100) {
            camFracY = 0x100;
        }
#else
        {
            // TODO: Use proper maths for max, depending on DISPLAY_HEIGHT instead of a hardcoded value
            const u32 max = 153;

            if (camFracY > max) {
                camFracY = max;
            }
        }
#endif

        camFracX = Div(cameraX, 0x69);
        if (camFracX > 0x100) {
            camFracX = 0x100;
        }

        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = sizeof(u16) * 2;

        cursor = gBgOffsetsHBlankPrimary;
        dt = gStageTime * 0x18;

        // Sky and Clouds
        for (i = 0; i < DISPLAY_HEIGHT - 1; i++) {
            if ((u32)((camFracY + i) - 111) < 10) {
                camFracX = ((((camFracY + i) - 110) * cameraX) >> 5) & 0xFF;
            } else {
                camFracX = (camFracY + i) > 120 ? ((cameraX * 10) >> 5) & 0xFF : camFracX;
            }
            *cursor++ = camFracX;
            *cursor++ = camFracY;
            if ((camFracY + i) + (SIN(((i * 8) + (camFracY << 3)) & ONE_CYCLE) >> 12) >= 178) {
                break;
            }
        }

        // Red Bottom
        something = (cameraX >> 3);
        for (j = 0; i < DISPLAY_HEIGHT - 1; i++, j++) {
            u16 cursorX, cursorY;

            x0 += 8;
            x0 = CLAMP_SIN_PERIOD(x0);
            cursorX = camFracX + (SIN(x0) >> 13) + (COS(((gStageTime * 2) + x0) & 0x3FF) >> 11)
                + (SIN(CLAMP_SIN_PERIOD(dt + (i * 0x40))) >> 13);
            *cursor++ = cursorX;
            cursorY = (j / 2) + camFracY + (SIN(x0) >> 12) + (COS(CLAMP_SIN_PERIOD(gStageTime + (i * 8))) >> 10);
            *cursor++ = cursorY;
        };
    }
}
END_NONMATCH