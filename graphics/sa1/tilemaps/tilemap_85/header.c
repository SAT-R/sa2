#include "global.h"
#include "core.h"

const u16 Palette_tilemap_85[] = INCBIN_U16("graphics/sa1/tilemaps/tilemap_85/palette.gbapal");
const u8 Tiles_tilemap_85[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_85/tiles.4bpp");
const u8 Tilemap_tilemap_85[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_85/tilemap.tilemap2");

const Tilemap tilemap_85 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_85,
    .tilesSize = sizeof(Tiles_tilemap_85),
    .palette = Palette_tilemap_85,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_85) / sizeof(u16),
    .map = (const u16 *)Tilemap_tilemap_85,
};
