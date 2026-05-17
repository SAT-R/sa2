#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

#define NUM_ZONE7_BG_TRANSITION_POSITIONS 8

const u16 sZone7BgTransitionRegions[2][NUM_ZONE7_BG_TRANSITION_POSITIONS] = {
    { 697, 1849, 8857, 11832, 18553, 22009, 25369, 27673 }, // ACT 1
    { 1344, 2616, 9432, 15192, 18552, 19892, 23158, 25848 }, // ACT 2
};

const ColorRaw sExtraBossPalette[PALETTE_LEN_4BPP] = INCPAL("graphics/sa2/boss_9_normal.pal");

void CreateStageBg_ZoneFinal_0(void)
{
    Background *bgDst;
    const Background *bgSrc;
    u8 i;

    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    INIT_BG_SPRITES_LAYER_32(2);

    bgDst = &gStageBackgroundsRam.unk80;
    gBgCntRegs[2] = BGCNT_SCREENBASE(26) | BGCNT_256COLOR | BGCNT_CHARBASE(2) | BGCNT_PRIORITY(1);
    bgSrc = gStageCameraBgTemplates;
    memcpy(bgDst, &bgSrc[2], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_COCKPIT;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(2);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(416);
    bgDst->targetTilesX = 10;
    bgDst->targetTilesY = 9;
    bgDst->flags |= BACKGROUND_FLAG_4;
    DrawBackground(bgDst);

    bgDst = &gStageBackgroundsRam.unk0;
    gBgCntRegs[0] = BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(1) | BGCNT_PRIORITY(3);

    memcpy(bgDst, &bgSrc[3], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_BACKGROUND;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(1);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(480);
    bgDst->targetTilesX = 32;
    bgDst->targetTilesY = 20;
    bgDst->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(bgDst);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    for (i = 0; i < ARRAY_COUNT(sExtraBossPalette); i++) {
        SET_PALETTE_COLOR_BG(0, i, sExtraBossPalette[i]);
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}
