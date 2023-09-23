#include <string.h>
#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"

const u16 gUnknown_080D5CC2[16] = INCBIN_U16("graphics/080D5CC2.gbapal");

void CreateStageBg_ZoneFinal_0(void)
{
    Background *bgDst;
    const Background *bgSrc;
    u8 i;

    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    gUnknown_03004D80[2] = 0;

    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    bgDst = &gStageBackgroundsRam.unk80;
    gBgCntRegs[2]
        = BGCNT_SCREENBASE(26) | BGCNT_256COLOR | BGCNT_CHARBASE(2) | BGCNT_PRIORITY(1);
    bgSrc = gStageCameraBgTemplates;
    memcpy(bgDst, &bgSrc[2], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_COCKPIT;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(2);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(416);
    bgDst->targetTilesX = 10;
    bgDst->targetTilesY = 9;
    bgDst->flags |= BACKGROUND_FLAG_4;
    InitBackground(bgDst);

    bgDst = &gStageBackgroundsRam.unk0;
    gBgCntRegs[0]
        = BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(1) | BGCNT_PRIORITY(3);

    memcpy(bgDst, &bgSrc[3], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_BACKGROUND;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(1);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(480);
    bgDst->targetTilesX = 32;
    bgDst->targetTilesY = 20;
    bgDst->flags = BACKGROUND_FLAGS_BG_ID(0);
    InitBackground(bgDst);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    for (i = 0; i < ARRAY_COUNT(gUnknown_080D5CC2); i++) {
        gBgPalette[i] = gUnknown_080D5CC2[i];
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}