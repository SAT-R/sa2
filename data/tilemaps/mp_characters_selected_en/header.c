#include "global.h"
#include "core.h"

const u16 Palette_mp_characters_selected_en[] = INCBIN_U16("data/tilemaps/mp_characters_selected_en/palette.gbapal");
const u8 Tiles_mp_characters_selected_en[] = INCBIN_U8("data/tilemaps/mp_characters_selected_en/tiles.4bpp");
const u16 Tilemap_mp_characters_selected_en[] = INCBIN_U16("data/tilemaps/mp_characters_selected_en/tilemap.tilemap2");

const Tilemap mp_characters_selected_en = {
    .xTiles = 30,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_characters_selected_en,
    .tilesSize = sizeof(Tiles_mp_characters_selected_en),
    .palette = Palette_mp_characters_selected_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_characters_selected_en) / sizeof(u16),
    .map = Tilemap_mp_characters_selected_en,
};
