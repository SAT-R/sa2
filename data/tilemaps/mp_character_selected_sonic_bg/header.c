#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_character_selected_sonic_bg[] = INCPAL("data/tilemaps/mp_character_selected_sonic_bg/palette.pal");
const u8 Tiles_mp_character_selected_sonic_bg[] = INCBIN_U8("data/tilemaps/mp_character_selected_sonic_bg/tiles.4bpp");
const u16 Tilemap_mp_character_selected_sonic_bg[] = INCBIN_U16("data/tilemaps/mp_character_selected_sonic_bg/tilemap.tilemap2");

const Tilemap mp_character_selected_sonic_bg = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_sonic_bg,
    .tilesSize = sizeof(Tiles_mp_character_selected_sonic_bg),
    .palette = Palette_mp_character_selected_sonic_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_mp_character_selected_sonic_bg),
    .map = Tilemap_mp_character_selected_sonic_bg,
};
