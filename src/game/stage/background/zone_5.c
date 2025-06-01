#include "global.h"
#include "core.h"
#include "flags.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"
#include "constants/zones.h"

#define SCREENBASE_SKY_CANYON_CLOUDS 27

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

#define BG_CLOUD_START_Y 96

void StageBgUpdate_Zone5Acts12(s32 UNUSED a, s32 UNUSED b)
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
        cursor = gBgOffsetsHBlank;

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
    }
}
