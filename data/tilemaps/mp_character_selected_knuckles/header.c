#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_mp_character_selected_knuckles[] = INCBIN_U16("data/tilemaps/mp_character_selected_knuckles/palette.gbapal");
ALIGNED(4) static const u8 Tiles_mp_character_selected_knuckles[] = INCBIN_U8("data/tilemaps/mp_character_selected_knuckles/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_mp_character_selected_knuckles[] = INCBIN_U16("data/tilemaps/mp_character_selected_knuckles/tilemap.tilemap2");

ALIGNED(4) const Tilemap mp_character_selected_knuckles = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_knuckles,
    .tilesSize = sizeof(Tiles_mp_character_selected_knuckles),
    .palette = Palette_mp_character_selected_knuckles,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_character_selected_knuckles) / sizeof(u16),
    .map = Tilemap_mp_character_selected_knuckles,
};
