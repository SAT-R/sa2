#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_techno_base_bg_circuit_mask[]
    = INCBIN_U16("data/tilemaps/techno_base_bg_circuit_mask/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_techno_base_bg_circuit_mask[]
    = INCBIN_U8("data/tilemaps/techno_base_bg_circuit_mask/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_techno_base_bg_circuit_mask[]
    = INCBIN_U16("data/tilemaps/techno_base_bg_circuit_mask/tilemap.tilemap2");

ALIGNED(4)
const Tilemap techno_base_bg_circuit_mask = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_techno_base_bg_circuit_mask,
    .tilesSize = sizeof(Tiles_techno_base_bg_circuit_mask),
    .palette = Palette_techno_base_bg_circuit_mask,
    .palOffset = 0,
    .palLength = sizeof(Palette_techno_base_bg_circuit_mask) / sizeof(u16),
    .map = Tilemap_techno_base_bg_circuit_mask,
};
