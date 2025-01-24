#include "global.h"
#include "core.h"
#include "flags.h"
#include "animation_commands_bg.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/spot_light.h"

#include "game/stage/camera.h"
#include "game/stage/player.h"

#include "constants/tilemaps.h"

static s16 sCameraShiftX = 0;

void CreateStageBg_Zone4(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    const Background *templates;
    gBgCntRegs[0] = 0x1B0F;

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

    if (IS_SINGLE_PLAYER) {
#if !TEMP_FIX
        // Calling this will lead to crashes
        CreateSpotLightBeams();
#endif
    }
}

void StageBgUpdate_Zone4Acts12(s32 camX, s32 camY)
{
    Player *player = &gPlayer;

    if ((player->moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        if (sCameraShiftX == 0) {
            sCameraShiftX = camX;
        }
        sCameraShiftX += I(player->qSpeedGround);
        camX = sCameraShiftX;
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

    DrawBackground(&gStageBackgroundsRam.unk0);
    UpdateBgAnimationTiles(&gStageBackgroundsRam.unk0);

    if ((gStageTime % 16u) == 0) {
        gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 1) & 0xff;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xff;
    }
    gBgScrollRegs[3][0] = camX >> 4;
    gBgScrollRegs[3][1] = camY >> 6;
}
