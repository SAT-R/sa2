#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_characters_selected_jp[] = INCPAL("data/tilemaps/mp_characters_selected_jp/palette.pal");
const u8 Tiles_mp_characters_selected_jp[] = INCBIN_U8("data/tilemaps/mp_characters_selected_jp/tiles.4bpp");
const u16 Tilemap_mp_characters_selected_jp[] = INCBIN_U16("data/tilemaps/mp_characters_selected_jp/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_mp_characters_selected_jp),
    .map = Tilemap_mp_characters_selected_jp,
};
