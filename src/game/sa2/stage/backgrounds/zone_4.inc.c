#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

static s16 sCameraShiftX;

void CreateStageBg_Zone4(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    const Background *templates;
    gBgCntRegs[0] = BGCNT_SCREENBASE(27) | BGCNT_CHARBASE(3) | BGCNT_PRIORITY(3);

    *background = gStageCameraBgTemplates[CAMBG_BACK_B_LAYER];

    background->tilemapId = TM_SPOTLIGHT_SNOW;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(27);
    background->targetTilesX = 32;
    background->targetTilesY = 32;
    background->flags = BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

// Software renderer for these devices are too slow
// to handle these spotlights
#if !defined(__PS2__) && !defined(__PSP__)
    if (IS_SINGLE_PLAYER) {
        CreateSpotlightsManager();
    }
#endif
}

void StageBgUpdate_Zone4Acts12(s32 cameraX, s32 cameraY)
{
    Player *player = &gPlayer;
    s32 camFracY;

    if ((player->moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        if (sCameraShiftX == 0) {
            sCameraShiftX = cameraX;
        }
        sCameraShiftX += I(player->qSpeedGround);
        cameraX = sCameraShiftX;
    } else {
        sCameraShiftX = 0;
    }

    if (IS_SINGLE_PLAYER && !(gStageFlags & STAGE_FLAG__100)) {
        gWinRegs[WINREG_WINOUT] = 0x3e;
        gWinRegs[WINREG_WININ] = 0x3f3f;
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gBldRegs.bldY = 7;
        gBldRegs.bldCnt = 0x3f41;
        gBldRegs.bldAlpha = 0xc0c;
    }

#ifdef BUG_FIX
    UpdateBgAnimationTiles(&gStageBackgroundsRam.unk0);
    DrawBackground(&gStageBackgroundsRam.unk0);
#else
    DrawBackground(&gStageBackgroundsRam.unk0);
    UpdateBgAnimationTiles(&gStageBackgroundsRam.unk0);
#endif

    if ((gStageTime % 16u) == 0) {
        gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 1) & 0xff;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xff;
    }
    gBgScrollRegs[3][0] = cameraX >> 4;

    camFracY = cameraY >> 6;
#if WIDESCREEN_HACK
    if (camFracY > 256 - DISPLAY_HEIGHT) {
        camFracY = 256 - DISPLAY_HEIGHT;
    }
#endif
    gBgScrollRegs[3][1] = camFracY;
}
