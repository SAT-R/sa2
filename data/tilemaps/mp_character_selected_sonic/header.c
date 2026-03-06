#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_character_selected_sonic[] = INCPAL("data/tilemaps/mp_character_selected_sonic/palette.pal");
const u8 Tiles_mp_character_selected_sonic[] = INCBIN_U8("data/tilemaps/mp_character_selected_sonic/tiles.4bpp");
const u16 Tilemap_mp_character_selected_sonic[] = INCBIN_U16("data/tilemaps/mp_character_selected_sonic/tilemap.tilemap2");

const Tilemap mp_character_selected_sonic = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_sonic,
    .tilesSize = sizeof(Tiles_mp_character_selected_sonic),
    .palette = Palette_mp_character_selected_sonic,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_mp_character_selected_sonic),
    .map = Tilemap_mp_character_selected_sonic,
};
