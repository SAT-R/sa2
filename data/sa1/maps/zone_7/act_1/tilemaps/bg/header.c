#include "global.h"
#include "core.h"

extern const ColorRaw Palette_zone_7_act_1_fg[];
const u8 Tiles_zone_7_act_1_bg[] = INCBIN_U8("data/sa1/maps/zone_7/act_1/tilemaps/bg/tiles.4bpp");
const u8 Tilemap_zone_7_act_1_bg[] = INCBIN_U8("data/sa1/maps/zone_7/act_1/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_7_act_1_bg = {
    .xTiles = 37,
    .yTiles = 23,
    .animTileSize = 0x00,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_7_act_1_bg,
    .tilesSize = sizeof(Tiles_zone_7_act_1_bg) - (0 * 0x00),
    .palette = NULL,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_7_act_1_fg) / sizeof(u16),
    .map = (const u16 *)Tilemap_zone_7_act_1_bg,
};
