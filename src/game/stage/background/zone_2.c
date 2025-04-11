#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"

// (88.05%) https://decomp.me/scratch/ekyaq
// (91.40%) https://decomp.me/scratch/vapLV
// (94.83%) https://decomp.me/scratch/Naixp (more accurate)
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone2Acts12.inc", void StageBgUpdate_Zone2Acts12(s32 cameraX, s32 cameraY))
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
        s32 unk5590_1;

        camFracY = Div(cameraY, 0x10);
        if (camFracY > 0x100) {
            camFracY = 0x100;
        }

        camFracX = Div(cameraX, 0x69);
        if (camFracX > 0x100) {
            camFracX = 0x100;
        }

        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 4;

        cursor = gBgOffsetsHBlank;
        unk5590_1 = gStageTime * 0x18;

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
            x0 = CLAMP_SIN_PERIOD(x0 + 8);
            *cursor++ = something + (SIN(x0) >> 13) + (COS(CLAMP_SIN_PERIOD((gStageTime * 2) + x0)) >> 11)
                + (SIN(CLAMP_SIN_PERIOD(unk5590_1 + (i * 0x40))) >> 13);
            *cursor++ = (j / 2) + camFracY + (SIN(x0) >> 12) + (COS((gStageTime + (i * 8)) & ONE_CYCLE) >> 10);
        };
    }
}
END_NONMATCH
