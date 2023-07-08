#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_unknown_stars[] = INCBIN_U16("data/tilemaps/unknown_stars/palette.gbapal");
ALIGNED(4) static const u8 Tiles_unknown_stars[] = INCBIN_U8("data/tilemaps/unknown_stars/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_unknown_stars[] = INCBIN_U16("data/tilemaps/unknown_stars/tilemap.tilemap2");

ALIGNED(4) const Tilemap unknown_stars = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unknown_stars,
    .tilesSize = sizeof(Tiles_unknown_stars),
    .palette = Palette_unknown_stars,
    .palOffset = 0,
    .palLength = sizeof(Palette_unknown_stars) / sizeof(u16),
    .map = Tilemap_unknown_stars,
};
