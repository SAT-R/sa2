#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_mp_characters_selected_fr[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_fr/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_mp_characters_selected_fr[]
    = INCBIN_U8("data/tilemaps/mp_characters_selected_fr/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_mp_characters_selected_fr[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_fr/tilemap.tilemap2");

ALIGNED(4)
const Tilemap mp_characters_selected_fr = {
    .xTiles = 30,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_characters_selected_fr,
    .tilesSize = sizeof(Tiles_mp_characters_selected_fr),
    .palette = Palette_mp_characters_selected_fr,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_characters_selected_fr) / sizeof(u16),
    .map = Tilemap_mp_characters_selected_fr,
};
