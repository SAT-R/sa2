#include "global.h"
#include "core.h"

const ColorRaw Palette_tilemap_84[] = INCPAL("graphics/sa1/tilemaps/tilemap_84/palette.pal");
const u8 Tiles_tilemap_84[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_84/tiles.4bpp");
const u8 Tilemap_tilemap_84[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_84/tilemap.tilemap2");

const Tilemap tilemap_84 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_84,
    .tilesSize = sizeof(Tiles_tilemap_84),
    .palette = Palette_tilemap_84,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_84) / sizeof(u16),
    .map = (const u16 *)Tilemap_tilemap_84,
};
