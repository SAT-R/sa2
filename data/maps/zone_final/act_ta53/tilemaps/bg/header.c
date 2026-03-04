#include "global.h"
#include "core.h"

const ColorRaw Palette_zone_final_act_ta53_bg[] = INCPAL("data/maps/zone_final/act_ta53/tilemaps/bg/palette.pal");
const u8 Tiles_zone_final_act_ta53_bg[] = INCBIN_U8("data/maps/zone_final/act_ta53/tilemaps/bg/tiles.4bpp");
const u16 Tilemap_zone_final_act_ta53_bg[] = INCBIN_U16("data/maps/zone_final/act_ta53/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_final_act_ta53_bg = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_final_act_ta53_bg,
    .tilesSize = sizeof(Tiles_zone_final_act_ta53_bg),
    .palette = Palette_zone_final_act_ta53_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_zone_final_act_ta53_bg),
    .map = Tilemap_zone_final_act_ta53_bg,
};
