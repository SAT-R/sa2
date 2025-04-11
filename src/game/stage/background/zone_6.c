#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/camera.h"

#include "constants/tilemaps.h"

extern const Background gStageCameraBgTemplates[4];

void CreateStageBg_Zone6_Boss(void);

const s16 gUnknown_080D5BF0[] = {
    Q_8_8(0.00), Q_8_8(0.25), Q_8_8(2.25), Q_8_8(2.50), Q_8_8(3.50), Q_8_8(3.625), Q_8_8(5.625), Q_8_8(5.75), Q_8_8(6.75),
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
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), sizeof(Background));
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
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), sizeof(Background));
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
// (85.82%) https://decomp.me/scratch/pNyvP
NONMATCH("asm/non_matching/game/stage/background/sub_801D24C.inc", void sub_801D24C(u8 p0, s16 p1, u8 p2))
{
    s16 r6;
    u16 *hOffsets;
    s32 stageTime;
    s32 stageTime2;
    s16 i;
    s16 r4;
    s32 sl;
    s32 p1_2;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 4;

    gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
    gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
    gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 8);
    gBldRegs.bldY = 16 * 10;

    hOffsets = gBgOffsetsHBlank;

    stageTime = (gStageTime & 0x3FF);
    stageTime2 = ((gStageTime >> 1) & 0x3FF);

    // p1 *= 2.5

    p1_2 = p1;
    r6 = (DISPLAY_HEIGHT - 1) - ((p1_2 * 2) + (p1_2 >> 1));

    if (r6 > (DISPLAY_HEIGHT - 1)) {
        r6 = (DISPLAY_HEIGHT - 1);
    }

    if (p2 != 0) {
        s16 r2;
        // _0801D2CA
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1_2 >> 4)));

        for (r4 = 0; r4 < r6; r4++) {
            *hOffsets++ = 0;
            *hOffsets++ = (-15 - r4) & 0xFF;
        }
        // _0801D312

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            // _0801D31C
            s32 sin = SIN_24_8(CLAMP_SIN_PERIOD(r4 * 16 + stageTime2 + stageTime)) >> 1;
            sin++;
            sin = (sin)-r4 * 2;
            *hOffsets++ = sin & 0xFF;

            if ((r4 - 15) < r6) {
                s32 r0 = (1 - r4);
                r0 -= (((r4 - r6) - 15) * 8);
                *hOffsets++ = r0 & 0xFE;
            } else {
                // _0801D3A0
                s32 sin = (SIN_24_8(CLAMP_SIN_PERIOD(stageTime + r4 * 4)) >> 1) + 1;
                sin = sin - r4;
                *hOffsets++ = (stageTime2 + sin) & 0xFF;
            }

            r4++;
        }
    } else {
        // _0801D3D6
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1_2 >> 5)));
        r4 = 0;

        // _0801D3FC
        for (; r4 < r6; r4++) {
            s32 sin = SIN_24_8(CLAMP_SIN_PERIOD(r4 * 16 + stageTime2 + stageTime)) >> 1;
            sin += 1;
            sin = sin - r4 * 2;
            *hOffsets++ = sin & 0xFF;

            sin = SIN_24_8((CLAMP_SIN_PERIOD(stageTime2 + r4 * 4))) >> 1;
            sin++;
            sin = (sin)-r4 * 2;
            *hOffsets++ = (stageTime2 + sin) & 0xFF;
        }

        // _0801D44C

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            *hOffsets++ = 0;

            if ((r4 - 15) < r6) {
                *hOffsets++ = ((((r4 - r6) - 15) << 3) - (r4 - 1)) & 0xFF;
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

// (84.63%) https://decomp.me/scratch/W9B0j
// (82.95%) https://decomp.me/scratch/ZEtCx (newer)
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone6Acts12.inc", void StageBgUpdate_Zone6Acts12(s32 x, s32 UNUSED y))
{
    u16 r6;
    u8 r5;
    u8 r2;
    Background *bg = &gStageBackgroundsRam.unk0;

    gBgScrollRegs[3][0] = x >> 4;

    r6 = Mod(gStageTime, 0x680);
    r5 = 0;
    r2 = 8;

    if (r6 > gUnknown_080D5BF0[7]) {
        r5 = 7;
    } else
        while (1) {
            u32 r3;
            u32 r0 = (r2 << 24);
            r0 += (0xFF << 24);
            r2 = r0 >> 24;
            r3 = r2 << 24;
            r0 = r3 >> 24;
            if (((signed)r0 >= 0) || (r6 > gUnknown_080D5BF0[r0])) {
                break;
            }
        }

    if (IS_MULTI_PLAYER) {
        r5 = 5;
    }

    gBgPalette[0] = RGB_BLACK;
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    switch (r5) {
        case 0: {
            if (r6 == 1) {
                const Background *bgTemplate = gStageCameraBgTemplates;
                memcpy(bg, (bgTemplate + 3), sizeof(Background));
                bg->tilemapId = TM_TECHNO_BASE_BG_PURPLE_GRID;
                bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
                bg->layoutVram = (void *)BG_SCREEN_ADDR(26);
                bg->targetTilesX = 32;
                bg->targetTilesY = 32;
                DrawBackground(bg);
            } else if (r6 > 1) {
                // _0801D636
                gDispCnt |= DISPCNT_BG0_ON;
                gBgCntRegs[0] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[0] |= BGCNT_PRIORITY(3);
                gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[3] |= BGCNT_PRIORITY(3);

                r2 = r6;
                if (r2 > 63)
                    r2 = 63;

                r6 /= 4u;

                sub_801D24C(r6, 63 - r2, 0);
            }
        } break;

        case 1: {
            sub_801D24C(15, 0, 0);
        } break;

        case 2: {
            u32 r0 = (r6 - 577);
            r0 <<= 16;
            r2 = (r0 << 8) >> 24;
            r6 /= 4u;
            r6 = (15 - r6);

            if (r6 != 0) {
                sub_801D24C(r6, 63 - r2, 1);
            } else {
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                gBldRegs.bldCnt = r6;
            }
        } break;

        case 3: {
            s8 i;
            gBgCntRegs[0] &= ~BGCNT_PRIORITY(3);
            gBgCntRegs[0] |= BGCNT_PRIORITY(3);
            gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
            gBgCntRegs[3] |= BGCNT_PRIORITY(2);

            for (i = 0; i < 16; i++) {
                gBgPalette[(15 * 16) + i] = RGB_BLACK;
            }

            // jumps to _0801D8EE for this
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 4: {
            s8 i;
            s32 v;

            if (r6 == 897) {
                memcpy(&gStageBackgroundsRam.unk0, &gStageCameraBgTemplates[3], sizeof(Background));
                gStageBackgroundsRam.unk0.tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
                bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
                bg->layoutVram = (void *)BG_SCREEN_ADDR(26);
                bg->targetTilesX = 32;
                bg->targetTilesY = 32;
                DrawBackground(bg);
            } else {
                gDispCnt |= DISPCNT_BG0_ON;
                gBgCntRegs[0] |= BGCNT_PRIORITY(3);
            }
            // _0801D76C

            v = r6 - 897;
            r6 = v;

            for (i = 0; i < 16; i++) {
                u32 red = ((gUnknown_080D5C02[0][i][0] * r6) >> 5) & 0x1F;
                u32 green = ((gUnknown_080D5C02[0][i][1] * r6) >> 5) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[0][i][2] * r6) >> 5) & 0x1F;

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            // jumps to _0801D83C for this
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
        } break;

        case 5: {
            // _0801D7F8_case5
            s8 i;

            for (i = 0; i < 16; i++) {
                u32 red = gUnknown_080D5C02[0][i][0];
                u32 green = gUnknown_080D5C02[0][i][1];
                u32 blue = gUnknown_080D5C02[0][i][2];

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            // _0801D83C
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
        } break;

        case 6: {
            s8 i;
            s32 v;

            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;

            v = r6 - 1441;
            r6 = v;
            r6 = (31 - r6) / 2u;

            for (i = 0; i < 16; i++) {
                u32 red = ((gUnknown_080D5C02[0][i][0] * r6) >> 4) & 0x1F;
                u32 green = ((gUnknown_080D5C02[0][i][1] * r6) >> 4) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[0][i][2] * r6) >> 4) & 0x1F;

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 7: {
            s8 i;
            for (i = 0; i < 16; i++) {
                gBgPalette[(15 * 16) + i] = RGB_BLACK;
            }
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
            gDispCnt &= ~(DISPCNT_BG0_ON);
        } break;
    }
}
END_NONMATCH
