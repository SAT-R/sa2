#include "global.h"
#include "core.h"

const u16 Palette_zone_final_act_ta53_bg[]
    = INCBIN_U16("data/tilemaps/zone_final_act_ta53_bg/palette.gbapal");
const u8 Tiles_zone_final_act_ta53_bg[]
    = INCBIN_U8("data/tilemaps/zone_final_act_ta53_bg/tiles.4bpp");
const u16 Tilemap_zone_final_act_ta53_bg[]
    = INCBIN_U16("data/tilemaps/zone_final_act_ta53_bg/tilemap.tilemap2");

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
    .palLength = sizeof(Palette_zone_final_act_ta53_bg) / sizeof(u16),
    .map = Tilemap_zone_final_act_ta53_bg,
};
