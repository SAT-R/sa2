#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_cream_cheese_vanilla_happy[] = INCPAL("data/tilemaps/storyframe_cream_cheese_vanilla_happy/palette.pal");
const u8 Tiles_storyframe_cream_cheese_vanilla_happy[] = INCBIN_U8("data/tilemaps/storyframe_cream_cheese_vanilla_happy/tiles.4bpp");
const u16 Tilemap_storyframe_cream_cheese_vanilla_happy[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_cheese_vanilla_happy/tilemap.tilemap2");

const Tilemap storyframe_cream_cheese_vanilla_happy = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_cheese_vanilla_happy,
    .tilesSize = sizeof(Tiles_storyframe_cream_cheese_vanilla_happy),
    .palette = Palette_storyframe_cream_cheese_vanilla_happy,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_cream_cheese_vanilla_happy),
    .map = Tilemap_storyframe_cream_cheese_vanilla_happy,
};
