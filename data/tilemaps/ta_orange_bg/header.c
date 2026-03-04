#include "global.h"
#include "core.h"

const ColorRaw Palette_ta_orange_bg[] = INCPAL("data/tilemaps/ta_orange_bg/palette.pal");
const u8 Tiles_ta_orange_bg[] = INCBIN_U8("data/tilemaps/ta_orange_bg/tiles.4bpp");
const u16 Tilemap_ta_orange_bg[] = INCBIN_U16("data/tilemaps/ta_orange_bg/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_ta_orange_bg),
    .map = Tilemap_ta_orange_bg,
};
