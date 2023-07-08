#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_mp_character_selected_sonic[] = INCBIN_U16("data/tilemaps/mp_character_selected_sonic/palette.gbapal");
ALIGNED(4) static const u8 Tiles_mp_character_selected_sonic[] = INCBIN_U8("data/tilemaps/mp_character_selected_sonic/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_mp_character_selected_sonic[] = INCBIN_U16("data/tilemaps/mp_character_selected_sonic/tilemap.tilemap2");

ALIGNED(4) const Tilemap mp_character_selected_sonic = {
    .xTiles = 10,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_character_selected_sonic,
    .tilesSize = sizeof(Tiles_mp_character_selected_sonic),
    .palette = Palette_mp_character_selected_sonic,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_character_selected_sonic) / sizeof(u16),
    .map = Tilemap_mp_character_selected_sonic,
};
