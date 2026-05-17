#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

#if !WIDESCREEN_HACK
#define SCREENBASE_SKY_CANYON_CLOUDS 27
#else
#define SCREENBASE_SKY_CANYON_CLOUDS 27
#endif

void CreateStageBg_Zone5(void)
{
    Background *background = &gStageBackgroundsRam.unk0;

    if (IS_SINGLE_PLAYER) {
        gDispCnt |= DISPCNT_BG0_ON;
        gBgCntRegs[0] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(SCREENBASE_SKY_CANYON_CLOUDS) | BGCNT_CHARBASE(3));
        *background = gStageCameraBgTemplates[3];
        background->tilemapId = TM_SKY_CANYON_CLOUDS_FOREGROUND;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(SCREENBASE_SKY_CANYON_CLOUDS);
        background->targetTilesX = (256 / TILE_WIDTH);
        background->targetTilesY = (256 / TILE_WIDTH);
        DrawBackground(background);
    }

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 160 - DISPLAY_HEIGHT;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

#if WIDESCREEN_HACK
// NOTE: This is very much temporary.
void HBlankCB_FixCloudRendering(int_vcount vcount)
{
    // NOTE: If gBgScrollRegs[0][1] doesn't also get set here, a transparent line will appear at the very top.
    //       Only setting REG_BG0VOFS leads to its value getting overwritten at the end of the frame,
    //       with gBgScrollRegs[0][1], so we have to set it accordingly.
    if (vcount < 80 || vcount == 239) {
        REG_BG0VOFS = 0;
        gBgScrollRegs[0][1] = 0;
    } else {
        REG_BG0VOFS = 160 - DISPLAY_HEIGHT;
        gBgScrollRegs[0][1] = 160 - DISPLAY_HEIGHT;
    }
}
#endif

#define BG_CLOUD_START_Y 96

void StageBgUpdate_Zone5Acts12(s32 UNUSED cameraX, s32 UNUSED cameraY)
{
    s32 num;
    u16 *cursor, i, val;
    gBgScrollRegs[0][0]++;
    gBgScrollRegs[3][0] = 0;
    num = gStageTime * 2;

    if (IS_SINGLE_PLAYER) {
        gFlags = gFlags | FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 2;
        cursor = gBgOffsetsHBlankPrimary;

        if (gCurrentLevel != LEVEL_INDEX(ZONE_5, ACT_BOSS)) {
            gDispCnt |= DISPCNT_BG0_ON;
            gDispCnt |= DISPCNT_WIN0_ON;
            gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
            gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);
            gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
            gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
            gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gBldRegs.bldY = 7;
            gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
            gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 16);
        }

        // Move the parallax clouds
#if !WIDESCREEN_HACK
        for (i = 0; i < BG_CLOUD_START_Y; i++) {
            *cursor++ = 0;
        }

        val = Div(num, 8);
        for (; i < BG_CLOUD_START_Y + 4; i++) {
            *cursor++ = val;
        }

        val = Div(num, 7);
        for (; i < BG_CLOUD_START_Y + 8; i++) {
            *cursor++ = val;
        }

        val = Div(num, 6);
        for (; i < BG_CLOUD_START_Y + 16; i++) {
            *cursor++ = val;
        }

        val = Div(num, 5);
        for (; i < BG_CLOUD_START_Y + 24; i++) {
            *cursor++ = val;
        }

        val = Div(num, 4);
        for (; i < BG_CLOUD_START_Y + 32; i++) {
            *cursor++ = val;
        }

        val = Div(num, 3);
        for (; i < BG_CLOUD_START_Y + 48; i++) {
            *cursor++ = val;
        }

        val = Div(num, 2);
        for (; i < BG_CLOUD_START_Y + 63; i++) {
            *cursor++ = val;
        }
#else
        // NOTE: Temporary solution to render the bottom of the background in a decent looking way
        gHBlankCopySize = 2 * sizeof(u16);

        for (i = 0; i < DISPLAY_HEIGHT - 1; i++) {
            s32 originalLine = (s32)(((float)i / (float)DISPLAY_HEIGHT) * 160.0f);

            if (originalLine > 159) {
                originalLine = 159;
            }

            if (originalLine < BG_CLOUD_START_Y) {
                *cursor++ = 0;
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 4) {
                *cursor++ = num >> 3;
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 8) {
                *cursor++ = Div(num, 7);
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 16) {
                *cursor++ = Div(num, 6);
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 24) {
                *cursor++ = Div(num, 5);
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 32) {
                *cursor++ = num >> 2;
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 48) {
                *cursor++ = Div(num, 3);
                *cursor++ = originalLine - i;
            } else if (originalLine < BG_CLOUD_START_Y + 63) {
                *cursor++ = num >> 1;
                *cursor++ = originalLine - i;
            } else {
                *cursor++ = 0;
                *cursor++ = originalLine - i;
            }
        }

        gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_FixCloudRendering;
        gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
#endif
    }
}
