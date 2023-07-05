#include "global.h"
#include "core.h"

const u16 Palette_sa1_title_bg[]
    = INCBIN_U16("data/tilemaps/sa1_title_bg/palette.gbapal256");
const u8 Tiles_sa1_title_bg[] = INCBIN_U8("data/tilemaps/sa1_title_bg/tiles.4bpp");
const u16 Tilemap_sa1_title_bg[]
    = INCBIN_U16("data/tilemaps/sa1_title_bg/tilemap.tilemap2");

const Tilemap sa1_title_bg = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sa1_title_bg,
    .tilesSize = sizeof(Tiles_sa1_title_bg),
    .palette = Palette_sa1_title_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_sa1_title_bg) / sizeof(u16),
    .map = Tilemap_sa1_title_bg,
};
