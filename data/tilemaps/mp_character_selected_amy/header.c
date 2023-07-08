#include "global.h"
#include "core.h"

const u16 Palette_mp_character_selected_amy[]
    = INCBIN_U16("data/tilemaps/mp_character_selected_amy/palette.gbapal");
const u8 Tiles_mp_character_selected_amy[]
    = INCBIN_U8("data/tilemaps/mp_character_selected_amy/tiles.4bpp");
const u16 Tilemap_mp_character_selected_amy[]
    = INCBIN_U16("data/tilemaps/mp_character_selected_amy/tilemap.tilemap2");

const Tilemap mp_character_selected_amy = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_amy,
    .tilesSize = sizeof(Tiles_mp_character_selected_amy),
    .palette = Palette_mp_character_selected_amy,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_character_selected_amy) / sizeof(u16),
    .map = Tilemap_mp_character_selected_amy,
};
