#include "global.h"
#include "core.h"

const u16 Palette_zone_2_act_2_bg[]
    = INCBIN_U16("data/maps/zone_2/act_2/tilemaps/bg/palette.gbapal");
const u8 Tiles_zone_2_act_2_bg[] = INCBIN_U8("data/maps/zone_2/act_2/tilemaps/bg/tiles.4bpp");
const u16 Tilemap_zone_2_act_2_bg[]
    = INCBIN_U16("data/maps/zone_2/act_2/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_2_act_2_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_2_act_2_bg,
    .tilesSize = sizeof(Tiles_zone_2_act_2_bg),
    .palette = Palette_zone_2_act_2_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_2_act_2_bg) / sizeof(u16),
    .map = Tilemap_zone_2_act_2_bg,
};
