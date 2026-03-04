#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_19[] = INCPAL("data/tilemaps/credits_19/palette.pal");
const u8 Tiles_credits_19[] = INCBIN_U8("data/tilemaps/credits_19/tiles.4bpp");
const u16 Tilemap_credits_19[] = INCBIN_U16("data/tilemaps/credits_19/tilemap.tilemap2");

const Tilemap credits_19 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_19,
    .tilesSize = sizeof(Tiles_credits_19),
    .palette = Palette_credits_19,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_19),
    .map = Tilemap_credits_19,
};
