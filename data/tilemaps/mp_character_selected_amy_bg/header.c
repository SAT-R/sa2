#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_mp_character_selected_amy_bg[] = INCBIN_U16("data/tilemaps/mp_character_selected_amy_bg/palette.gbapal");
ALIGNED(4) static const u8 Tiles_mp_character_selected_amy_bg[] = INCBIN_U8("data/tilemaps/mp_character_selected_amy_bg/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_mp_character_selected_amy_bg[] = INCBIN_U16("data/tilemaps/mp_character_selected_amy_bg/tilemap.tilemap2");

ALIGNED(4) const Tilemap mp_character_selected_amy_bg = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_amy_bg,
    .tilesSize = sizeof(Tiles_mp_character_selected_amy_bg),
    .palette = Palette_mp_character_selected_amy_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_character_selected_amy_bg) / sizeof(u16),
    .map = Tilemap_mp_character_selected_amy_bg,
};
