#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_cream_hugs_vanilla[] = INCPAL("data/tilemaps/storyframe_cream_hugs_vanilla/palette.pal");
const u8 Tiles_storyframe_cream_hugs_vanilla[] = INCBIN_U8("data/tilemaps/storyframe_cream_hugs_vanilla/tiles.4bpp");
const u16 Tilemap_storyframe_cream_hugs_vanilla[] = INCBIN_U16("data/tilemaps/storyframe_cream_hugs_vanilla/tilemap.tilemap2");

const Tilemap storyframe_cream_hugs_vanilla = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_hugs_vanilla,
    .tilesSize = sizeof(Tiles_storyframe_cream_hugs_vanilla),
    .palette = Palette_storyframe_cream_hugs_vanilla,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_cream_hugs_vanilla),
    .map = Tilemap_storyframe_cream_hugs_vanilla,
};
