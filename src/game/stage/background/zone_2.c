#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage/player.h"

// (88.05%) https://decomp.me/scratch/ekyaq
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone2Acts12.inc",
         void StageBgUpdate_Zone2Acts12(s32 a, s32 b))
{
    u8 i, j;
    u16 *cursor = NULL;
    s16 something;
    s32 x = 0;
    if ((gPlayer.moveState & MOVESTATE_8000000)
        && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        if (gBgScrollRegs[3][0] == 0) {
            gBgScrollRegs[3][0] = a;
        }
        gBgScrollRegs[3][0] += (gPlayer.speedGroundX >> 8);
        a = gBgScrollRegs[3][0];
    }

    if (IS_MULTI_PLAYER) {
        s16 val;
        gBgScrollRegs[3][0] = a >> 4;
        val = Div(b, 0x10);
        if (val > 0x100) {
            val = 0x100;
        }
        gBgScrollRegs[3][1] = val;
    } else {
        s16 temp, temp2;
        s32 unk5590_1;

        temp = Div(b, 0x10);
        if (temp > 0x100) {
            temp = 0x100;
        }

        temp2 = Div(a, 0x69);
        if (temp2 > 0x100) {
            temp2 = 0x100;
        }

        gFlags |= FLAGS_4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;

        cursor = gBgOffsetsHBlank;
        unk5590_1 = gStageTime * 0x18;

        for (i = 0; i < 159; i++) {
            s16 temp4;
            s32 sin;
            s32 temp3 = temp + i;
            if ((u32)(temp3 - 0x6F) < 10) {
                temp4 = (((temp3 - 0x6E) * a) >> 5) & 0xFF;
            } else {
                if (temp3 > 0x78) {
                    temp4 = ((a * 10) >> 5) & 0xFF;
                } else {
                    temp4 = temp2 << 3;
                }
            }
            *cursor++ = temp4;
            *cursor++ = temp;
            sin = SIN(((i * 8) + (temp << 3)) & ONE_CYCLE) >> 12;

            if (temp + i + sin >= 178) {
                break;
            }
        }
        something = (a >> 3);
        for (j = 0; i < 159; i++, j++) {
            x = (x + 8);
            x &= ONE_CYCLE;
            *cursor++ = something + (SIN(x) >> 0xD)
                + (COS(((gStageTime * 2) + x) & ONE_CYCLE) >> 0xB)
                + (SIN((unk5590_1 + (i * 0x40)) & ONE_CYCLE) >> 0xD);
            *cursor++ = (j / 2) + temp + (SIN(x) >> 0xC)
                + (COS((gStageTime + (i * 8)) & ONE_CYCLE) >> 10);
        };
    }
}
END_NONMATCH
