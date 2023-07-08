#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_mp_character_selected_cream[]
    = INCBIN_U16("data/tilemaps/mp_character_selected_cream/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_mp_character_selected_cream[]
    = INCBIN_U8("data/tilemaps/mp_character_selected_cream/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_mp_character_selected_cream[]
    = INCBIN_U16("data/tilemaps/mp_character_selected_cream/tilemap.tilemap2");

ALIGNED(4)
const Tilemap mp_character_selected_cream = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_cream,
    .tilesSize = sizeof(Tiles_mp_character_selected_cream),
    .palette = Palette_mp_character_selected_cream,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_character_selected_cream) / sizeof(u16),
    .map = Tilemap_mp_character_selected_cream,
};
