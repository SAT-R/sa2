#include "global.h"
#include "core.h"

const u16 Palette_credits_presented_by_sega[]
    = INCBIN_U16("data/tilemaps/credits_presented_by_sega/palette.gbapal");
const u8 Tiles_credits_presented_by_sega[]
    = INCBIN_U8("data/tilemaps/credits_presented_by_sega/tiles.4bpp");
const u16 Tilemap_credits_presented_by_sega[]
    = INCBIN_U16("data/tilemaps/credits_presented_by_sega/tilemap.tilemap2");

const Tilemap credits_presented_by_sega = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_presented_by_sega,
    .tilesSize = sizeof(Tiles_credits_presented_by_sega),
    .palette = Palette_credits_presented_by_sega,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_presented_by_sega) / sizeof(u16),
    .map = Tilemap_credits_presented_by_sega,
};
