#include "global.h"
#include "core.h"

const ColorRaw Palette_ta_and_mp_white_bg[] = INCPAL("data/tilemaps/ta_and_mp_white_bg/palette.pal");
const u8 Tiles_ta_and_mp_white_bg[] = INCBIN_U8("data/tilemaps/ta_and_mp_white_bg/tiles.4bpp");
const u16 Tilemap_ta_and_mp_white_bg[] = INCBIN_U16("data/tilemaps/ta_and_mp_white_bg/tilemap.tilemap2");

const Tilemap ta_and_mp_white_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_ta_and_mp_white_bg,
    .tilesSize = sizeof(Tiles_ta_and_mp_white_bg),
    .palette = Palette_ta_and_mp_white_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_ta_and_mp_white_bg),
    .map = Tilemap_ta_and_mp_white_bg,
};
