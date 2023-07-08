#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_zone_4_act_2_bg[] = INCBIN_U16("data/tilemaps/zone_4_act_2_bg/palette.gbapal");
ALIGNED(4) static const u8 Tiles_zone_4_act_2_bg[] = INCBIN_U8("data/tilemaps/zone_4_act_2_bg/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_zone_4_act_2_bg[] = INCBIN_U16("data/tilemaps/zone_4_act_2_bg/tilemap.tilemap2");

ALIGNED(4) const Tilemap zone_4_act_2_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_4_act_2_bg,
    .tilesSize = sizeof(Tiles_zone_4_act_2_bg),
    .palette = Palette_zone_4_act_2_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_4_act_2_bg) / sizeof(u16),
    .map = Tilemap_zone_4_act_2_bg,
};
