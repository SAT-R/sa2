#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"
#include "game/stage/camera.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"

// TODO: Remove decl after merging with stage/backgrounds/zone_6.c
extern const s16 gUnknown_080D5BF0[];
// TODO: Remove decl after merging with stage/backgrounds/zone_6.c
extern const u8 gUnknown_080D5C02[];

void sub_801D24C(u8, u32, u8);

// (84.63%) https://decomp.me/scratch/W9B0j
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone6Acts12.inc",
         void StageBgUpdate_Zone6Acts12(s32 x, s32 UNUSED y))
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
            r3 == r2 << 24;
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
                gFlags &= ~FLAGS_4;
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
                gBgPalette[DISPLAY_WIDTH + i] = RGB_BLACK;
            }

            // jumps to _0801D8EE for this
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 4: {
            s8 i;
            s32 v;

            if (r6 == 897) {
                memcpy(&gStageBackgroundsRam.unk0, &gStageCameraBgTemplates[3],
                       sizeof(Background));
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
                u32 red = ((gUnknown_080D5C02[i * 3 + 0] * r6) >> 5) & 0x1F;
                u32 green = ((gUnknown_080D5C02[i * 3 + 1] * r6) >> 5) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[i * 3 + 2] * r6) >> 5) & 0x1F;

                gBgPalette[DISPLAY_WIDTH + i] = ((blue << 10) | (green << 5) | red);
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
                u32 red = gUnknown_080D5C02[i * 3 + 0];
                u32 green = gUnknown_080D5C02[i * 3 + 1];
                u32 blue = gUnknown_080D5C02[i * 3 + 2];

                gBgPalette[DISPLAY_WIDTH + i] = ((blue << 10) | (green << 5) | red);
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
                u32 red = ((gUnknown_080D5C02[i * 3 + 0] * r6) >> 4) & 0x1F;
                u32 green = ((gUnknown_080D5C02[i * 3 + 1] * r6) >> 4) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[i * 3 + 2] * r6) >> 4) & 0x1F;

                gBgPalette[DISPLAY_WIDTH + i] = ((blue << 10) | (green << 5) | red);
            }

            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 7: {
            s8 i;
            for (i = 0; i < 16; i++) {
                gBgPalette[DISPLAY_WIDTH + i] = RGB_BLACK;
            }
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
            gDispCnt &= ~(DISPCNT_BG0_ON);
        } break;
    }
}
END_NONMATCH
