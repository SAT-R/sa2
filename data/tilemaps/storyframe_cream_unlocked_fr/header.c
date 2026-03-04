#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_cream_unlocked_fr[] = INCPAL("data/tilemaps/storyframe_cream_unlocked_fr/palette.pal");
const u8 Tiles_storyframe_cream_unlocked_fr[] = INCBIN_U8("data/tilemaps/storyframe_cream_unlocked_fr/tiles.4bpp");
const u16 Tilemap_storyframe_cream_unlocked_fr[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlocked_fr/tilemap.tilemap2");

const Tilemap storyframe_cream_unlocked_fr = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlocked_fr,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlocked_fr),
    .palette = Palette_storyframe_cream_unlocked_fr,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_cream_unlocked_fr),
    .map = Tilemap_storyframe_cream_unlocked_fr,
};
