#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

#include "constants/sa1/tilemaps.h"

void CreateStageBg_Zone4(void)
{
    Background *bg = &gStageBackgroundsRam.unk0;

    gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 16);

    gBgCntRegs[0] = ((BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ) | (BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3));

    *bg = gStageCameraBgTemplates[CAMBG_BACK_B_LAYER];
    bg->tilemapId = TM_ICE_PARADISE_SNOW;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
    bg->layoutVram = (void *)BG_SCREEN_ADDR(27);
    bg->targetTilesX = 32;
    bg->targetTilesY = 32;

    DrawBackground(bg);
}
