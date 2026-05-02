#include "global.h"
#include "core.h"

extern const u16 Palette_zone_6_act_2_fg[];
const u8 Tiles_zone_6_act_2_bg[] = INCBIN_U8("data/sa1/maps/zone_6/act_2/tilemaps/bg/tiles.4bpp");
const u8 Tilemap_zone_6_act_2_bg[] = INCBIN_U8("data/sa1/maps/zone_6/act_2/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_6_act_2_bg = {
    .xTiles = 64,
    .yTiles = 29,
    .animTileSize = 0x00,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_6_act_2_bg,
    .tilesSize = sizeof(Tiles_zone_6_act_2_bg) - (0 * 0x00),
    .palette = NULL,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_6_act_2_fg) / sizeof(u16),
    .map = (const u16 *)Tilemap_zone_6_act_2_bg,
};
