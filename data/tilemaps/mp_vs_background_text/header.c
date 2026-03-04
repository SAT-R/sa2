#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_vs_background_text[] = INCPAL("data/tilemaps/mp_vs_background_text/palette.pal");
const u8 Tiles_mp_vs_background_text[] = INCBIN_U8("data/tilemaps/mp_vs_background_text/tiles.4bpp");
const u16 Tilemap_mp_vs_background_text[] = INCBIN_U16("data/tilemaps/mp_vs_background_text/tilemap.tilemap2");

const Tilemap mp_vs_background_text = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_vs_background_text,
    .tilesSize = sizeof(Tiles_mp_vs_background_text),
    .palette = Palette_mp_vs_background_text,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_mp_vs_background_text),
    .map = Tilemap_mp_vs_background_text,
};
