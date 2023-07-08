#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_ta_orange_bg[]
    = INCBIN_U16("data/tilemaps/ta_orange_bg/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_ta_orange_bg[]
    = INCBIN_U8("data/tilemaps/ta_orange_bg/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_ta_orange_bg[]
    = INCBIN_U16("data/tilemaps/ta_orange_bg/tilemap.tilemap2");

ALIGNED(4)
const Tilemap ta_orange_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_ta_orange_bg,
    .tilesSize = sizeof(Tiles_ta_orange_bg),
    .palette = Palette_ta_orange_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_ta_orange_bg) / sizeof(u16),
    .map = Tilemap_ta_orange_bg,
};
