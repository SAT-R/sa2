#include "global.h"
#include "core.h"

const u16 Palette_mp_unknown_orange_zigzag[] = INCBIN_U16("data/tilemaps/mp_unknown_orange_zigzag/palette.gbapal");
const u8 Tiles_mp_unknown_orange_zigzag[] = INCBIN_U8("data/tilemaps/mp_unknown_orange_zigzag/tiles.4bpp");
const u16 Tilemap_mp_unknown_orange_zigzag[] = INCBIN_U16("data/tilemaps/mp_unknown_orange_zigzag/tilemap.tilemap2");

const Tilemap mp_unknown_orange_zigzag = {
    .xTiles = 30,
    .yTiles = 40,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_unknown_orange_zigzag,
    .tilesSize = sizeof(Tiles_mp_unknown_orange_zigzag),
    .palette = Palette_mp_unknown_orange_zigzag,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_unknown_orange_zigzag) / sizeof(u16),
    .map = Tilemap_mp_unknown_orange_zigzag,
};
