#include "global.h"
#include "core.h"

const ColorRaw Palette_zone_final_act_xx_bg[] = INCPAL("data/maps/zone_final/act_xx/tilemaps/bg/palette.pal");
const u8 Tiles_zone_final_act_xx_bg[] = INCBIN_U8("data/maps/zone_final/act_xx/tilemaps/bg/tiles.4bpp");
const u16 Tilemap_zone_final_act_xx_bg[] = INCBIN_U16("data/maps/zone_final/act_xx/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_final_act_xx_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_final_act_xx_bg,
    .tilesSize = sizeof(Tiles_zone_final_act_xx_bg),
    .palette = Palette_zone_final_act_xx_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_zone_final_act_xx_bg),
    .map = Tilemap_zone_final_act_xx_bg,
};
