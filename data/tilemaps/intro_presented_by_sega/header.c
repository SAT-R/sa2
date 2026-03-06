#include "global.h"
#include "core.h"

const ColorRaw Palette_intro_presented_by_sega[] = INCPAL("data/tilemaps/intro_presented_by_sega/palette.pal");
const u8 Tiles_intro_presented_by_sega[] = INCBIN_U8("data/tilemaps/intro_presented_by_sega/tiles.4bpp");
const u16 Tilemap_intro_presented_by_sega[] = INCBIN_U16("data/tilemaps/intro_presented_by_sega/tilemap.tilemap2");

const Tilemap intro_presented_by_sega = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_intro_presented_by_sega,
    .tilesSize = sizeof(Tiles_intro_presented_by_sega),
    .palette = Palette_intro_presented_by_sega,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_intro_presented_by_sega),
    .map = Tilemap_intro_presented_by_sega,
};
