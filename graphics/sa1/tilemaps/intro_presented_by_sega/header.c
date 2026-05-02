#include "global.h"
#include "core.h"

const u16 Palette_intro_presented_by_sega[] = INCBIN_U16("graphics/sa1/tilemaps/intro_presented_by_sega/palette.gbapal");
const u8 Tiles_intro_presented_by_sega[] = INCBIN_U8("graphics/sa1/tilemaps/intro_presented_by_sega/tiles.4bpp");
const u8 Tilemap_intro_presented_by_sega[] = INCBIN_U8("graphics/sa1/tilemaps/intro_presented_by_sega/tilemap.tilemap2");

const Tilemap intro_presented_by_sega = {
    .xTiles = 20,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_intro_presented_by_sega,
    .tilesSize = sizeof(Tiles_intro_presented_by_sega),
    .palette = Palette_intro_presented_by_sega,
    .palOffset = 0,
    .palLength = sizeof(Palette_intro_presented_by_sega) / sizeof(u16),
    .map = (const u16 *)Tilemap_intro_presented_by_sega,
};
