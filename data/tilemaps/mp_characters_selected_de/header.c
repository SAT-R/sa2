#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_mp_characters_selected_de[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_de/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_mp_characters_selected_de[]
    = INCBIN_U8("data/tilemaps/mp_characters_selected_de/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_mp_characters_selected_de[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_de/tilemap.tilemap2");

ALIGNED(4)
const Tilemap mp_characters_selected_de = {
    .xTiles = 30,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_characters_selected_de,
    .tilesSize = sizeof(Tiles_mp_characters_selected_de),
    .palette = Palette_mp_characters_selected_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_characters_selected_de) / sizeof(u16),
    .map = Tilemap_mp_characters_selected_de,
};
