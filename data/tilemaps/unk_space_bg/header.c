#include "global.h"
#include "core.h"

const u16 Palette_unk_space_bg[]
    = INCBIN_U16("data/tilemaps/unk_space_bg/palette.gbapal");
const u8 Tiles_unk_space_bg[] = INCBIN_U8("data/tilemaps/unk_space_bg/tiles.4bpp");
const u16 Tilemap_unk_space_bg[]
    = INCBIN_U16("data/tilemaps/unk_space_bg/tilemap.tilemap2");

const Tilemap unk_space_bg = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unk_space_bg,
    .tilesSize = sizeof(Tiles_unk_space_bg),
    .palette = Palette_unk_space_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_unk_space_bg) / sizeof(u16),
    .map = Tilemap_unk_space_bg,
};
