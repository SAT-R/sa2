#include "global.h"
#include "core.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_5.h"

#include "constants/sa1/tilemaps.h"

void CreateStageBg_Zone5(void)
{
    Background *bg = &gStageBackgroundsRam.unk0;
    gBgCntRegs[0]
        = ((BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ) | (BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3));

    *bg = gStageCameraBgTemplates[CAMBG_BACK_B_LAYER];
    bg->tilemapId = TM_EGG_ROCKET_CLOUDS;

    DrawBackground(bg);
}
