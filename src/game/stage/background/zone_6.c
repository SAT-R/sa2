#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"

#include "sakit/globals.h"

#include "game/stage/camera.h"

#include "constants/tilemaps.h"

extern const Background gStageCameraBgTemplates[4];

void CreateStageBg_Zone6_Boss(void);

const s16 gUnknown_080D5BF0[] = {
    Q_8_8(0.00),  Q_8_8(0.25),  Q_8_8(2.25), Q_8_8(2.50), Q_8_8(3.50),
    Q_8_8(3.625), Q_8_8(5.625), Q_8_8(5.75), Q_8_8(6.75),
};

// TODO: Make static and Rename to sBlendColors
const u8 gUnknown_080D5C02[2][16][3] = {
    {
        //   r,    g,    b
        { 0x1F, 0x00, 0x1F },
        { 0x01, 0x07, 0x14 },
        { 0x01, 0x09, 0x14 },
        { 0x00, 0x0A, 0x13 },
        { 0x00, 0x0C, 0x13 },
        { 0x00, 0x0D, 0x12 },
        { 0x00, 0x0F, 0x12 },
        { 0x00, 0x10, 0x11 },
        { 0x00, 0x12, 0x10 },
        { 0x00, 0x13, 0x10 },
        { 0x00, 0x15, 0x0F },
        { 0x00, 0x16, 0x0F },
        { 0x00, 0x18, 0x0E },
        { 0x00, 0x19, 0x0E },
        { 0x00, 0x1B, 0x0D },
        { 0x1F, 0x07, 0x00 },
    },
    {
        //   r,    g,    b
        { 0x1F, 0x00, 0x00 },
        { 0x0F, 0x00, 0x1B },
        { 0x0E, 0x00, 0x19 },
        { 0x0D, 0x01, 0x17 },
        { 0x0C, 0x01, 0x15 },
        { 0x0B, 0x02, 0x13 },
        { 0x0A, 0x02, 0x11 },
        { 0x08, 0x03, 0x0F },
        { 0x07, 0x03, 0x0D },
        { 0x06, 0x04, 0x0B },
        { 0x05, 0x04, 0x09 },
        { 0x04, 0x05, 0x07 },
        { 0x03, 0x05, 0x05 },
        { 0x02, 0x06, 0x03 },
        { 0x01, 0x06, 0x01 },
        { 0x00, 0x07, 0x00 },
    },
};

void CreateStageBg_Zone6_Acts(void)
{
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gStageTime = 0x380;

    if (IS_MULTI_PLAYER) {
        CreateStageBg_Zone6_Boss();
    }
    gBgCntRegs[3] &= ~(1 | 2);
    gBgCntRegs[3] |= 2;
}

void CreateStageBg_Zone6_Boss(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    *background = gStageCameraBgTemplates[3];
    background->tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(26);
    background->targetTilesX = 32;
    background->targetTilesY = 32;

    DrawBackground(background);
}

// (82.58%) https://decomp.me/scratch/tB3Bs
NONMATCH("asm/non_matching/game/stage/background/sub_801D24C.inc",
         void sub_801D24C(u8 p0, s32 p1, u8 p2))
{
    s16 r6;
    u16 *hOffsets;
    s16 stageTime;
    s32 stageTime2;
    s16 i;
    s16 r4;
    s32 sl;

    gFlags |= FLAGS_4;

    gUnknown_03002878 = (void *)&REG_BG0HOFS;
    gUnknown_03002A80 = 4;

    gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
    gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
    gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 8);
    gBldRegs.bldY = 16 * 10;

    hOffsets = gBgOffsetsHBlank;

    stageTime = (gStageTime & 0x3FF);
    stageTime2 = ((gStageTime >> 1) & 0x3FF);

    // p1 *= 2.5
    p1 = (p1 * 2) + HALVE(p1);

    r6 = (DISPLAY_HEIGHT - 1) - p1;

    if (r6 > (DISPLAY_HEIGHT - 1)) {
        r6 = (DISPLAY_HEIGHT - 1);
    }

    if (p2 != 0) {
        s16 r2;
        // _0801D2CA
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1 >> 4)));

        for (r4 = 0; r4 < r6; r4++) {
            *hOffsets++ = 0;
            *hOffsets++ = (-15 - r4) & 0xFF;
        }
        // _0801D312

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            // _0801D31C
            s32 sin = SIN_24_8((r4 * 16 + stageTime2 + stageTime) & ONE_CYCLE) >> 1;
            sin++;
            sin = (sin)-r4 * 2;
            *hOffsets++ = sin & 0xFF;

            if ((r4 - 15) < r6) {
                s32 r0 = (1 - r4);
                r0 -= (((r4 - r6) - 15) * 8);
                *hOffsets++ = r0 & 0xFE;
            } else {
                // _0801D3A0
                s32 sin = (SIN_24_8((stageTime + r4 * 4) & ONE_CYCLE) >> 1) + 1;
                sin = sin - r4;
                *hOffsets++ = (stageTime2 + sin) & 0xFF;
            }

            r4++;
        }
    } else {
        // _0801D3D6
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1 * 2)));
        r4 = 0;

        if (r6 > 0) {
            // _0801D3FC
            for (; r4 < r6; r4++) {
                s32 sin = SIN_24_8((r4 * 16 + stageTime2 + stageTime) & ONE_CYCLE) >> 1;
                sin = (sin + 1) - r4 * 2;
                *hOffsets++ = sin & 0xFF;

                sin = SIN_24_8(((r4 * 4 + stageTime2) & ONE_CYCLE)) >> 1;
                sin++;
                sin = (sin)-r4 * 2;
                *hOffsets++ = (stageTime2 + sin) & 0xFF;
            }
        }
        // _0801D44C

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            *hOffsets++ = 0;

            if ((r4 - 15) < r6) {
                s32 r0 = (((r4 - r6) - 15) << 3);
                *hOffsets++ = (r0 - (r4 - 1)) & 0xFF;
            } else {
                *hOffsets++ = ((-r4 + 1) & 0xFF);
            }

            r4++;
        }
    }
    // _0801D498

    if (p0 > 16) {
        p0 = 16;
    }
    // _0801D4A2

    for (i = 0; i < 16; i++) {
        s32 b, g, r;
        r = (p0 * gUnknown_080D5C02[1][i][0]) >> 4;
        r &= 0x1F;

        g = (p0 * gUnknown_080D5C02[1][i][1]) >> 4;
        g &= 0x1F;

        b = (p0 * gUnknown_080D5C02[1][i][2]) >> 4;
        b &= 0x1F;

        gBgPalette[15 * 16 + i] = ((b << 10) + (g << 5) + (r << 0));
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}
END_NONMATCH
