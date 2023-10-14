#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"

// TODO: Remove decl after merging with stage/backgrounds/zone_6.c
extern const s16 gUnknown_080D5BF0[];

void sub_801D24C(u8, u8, u8);

void StageBgUpdate_Zone6Acts12(s32 x, s32 UNUSED y)
{
    u16 r6;
    u8 r5;
    u8 r2;
    Background *bg = &gStageBackgroundsRam.unk0;

    gBgScrollRegs[1][1] = x / 16u;

    r6 = Mod(gStageTime, 0x680);
    r5 = 0;
    r2 = 7;

    if (r6 > gUnknown_080D5BF0[7]) {
        r5 = 7;
    } else {
        s8 r0;
        r2--;
        r0 = r2;

        if (r0 >= 0) {
            if (r6 > gUnknown_080D5BF0[r0]) {
                r5 = r2;
            }
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
                memcpy(bg, &gStageCameraBgTemplates[3], sizeof(Background));
                bg->tilemapId = TM_TECHNO_BASE_BG_PURPLE_GRID;
                bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
                bg->layoutVram = (void *)BG_SCREEN_ADDR(26);
                bg->targetTilesX = 32;
                bg->targetTilesY = 32;
                InitBackground(bg);
            } else if (r6 > 1) {
                // _0801D636
                gDispCnt |= DISPCNT_BG0_ON;
                gBgCntRegs[0] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[0] |= BGCNT_PRIORITY(3);
                gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[3] |= BGCNT_PRIORITY(3);

                if (r2 > 63)
                    r2 = 63;

                sub_801D24C(r6 / 4u, 63 - r2, 0);
            }
        } break;

        case 1: {
            sub_801D24C(15, 0, 0);
        } break;

        case 2: {

        } break;

        case 3: {

        } break;

        case 4: {

        } break;

        case 5: {

        } break;

        case 6: {

        } break;

        case 7: {

        } break;
    }
}