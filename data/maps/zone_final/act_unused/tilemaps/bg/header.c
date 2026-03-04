#include "global.h"
#include "core.h"

const ColorRaw Palette_zone_final_act_unused_bg[] = INCPAL("data/maps/zone_final/act_unused/tilemaps/bg/palette.pal");
const u8 Tiles_zone_final_act_unused_bg[] = INCBIN_U8("data/maps/zone_final/act_unused/tilemaps/bg/tiles.4bpp");
const u16 Tilemap_zone_final_act_unused_bg[] = INCBIN_U16("data/maps/zone_final/act_unused/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_final_act_unused_bg = {
    .xTiles = 32,
    .yTiles = 30,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_final_act_unused_bg,
    .tilesSize = sizeof(Tiles_zone_final_act_unused_bg),
    .palette = Palette_zone_final_act_unused_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_zone_final_act_unused_bg),
    .map = Tilemap_zone_final_act_unused_bg,
};
