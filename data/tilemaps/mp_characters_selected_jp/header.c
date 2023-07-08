#include "global.h"
#include "core.h"

const u16 Palette_mp_characters_selected_jp[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_jp/palette.gbapal");
const u8 Tiles_mp_characters_selected_jp[]
    = INCBIN_U8("data/tilemaps/mp_characters_selected_jp/tiles.4bpp");
const u16 Tilemap_mp_characters_selected_jp[]
    = INCBIN_U16("data/tilemaps/mp_characters_selected_jp/tilemap.tilemap2");

const Tilemap mp_characters_selected_jp = {
    .xTiles = 30,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_characters_selected_jp,
    .tilesSize = sizeof(Tiles_mp_characters_selected_jp),
    .palette = Palette_mp_characters_selected_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_characters_selected_jp) / sizeof(u16),
    .map = Tilemap_mp_characters_selected_jp,
};
