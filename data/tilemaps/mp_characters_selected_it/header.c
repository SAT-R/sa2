#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_mp_characters_selected_it[] = INCBIN_U16("data/tilemaps/mp_characters_selected_it/palette.gbapal");
ALIGNED(4) static const u8 Tiles_mp_characters_selected_it[] = INCBIN_U8("data/tilemaps/mp_characters_selected_it/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_mp_characters_selected_it[] = INCBIN_U16("data/tilemaps/mp_characters_selected_it/tilemap.tilemap2");

ALIGNED(4) const Tilemap mp_characters_selected_it = {
    .xTiles = 30,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_characters_selected_it,
    .tilesSize = sizeof(Tiles_mp_characters_selected_it),
    .palette = Palette_mp_characters_selected_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_characters_selected_it) / sizeof(u16),
    .map = Tilemap_mp_characters_selected_it,
};
