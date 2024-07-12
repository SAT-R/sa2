#include "global.h"
#include "core.h"

const u16 Palette_storyframe_cream_tails_vanilla_look_around[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_tails_vanilla_look_around/palette.gbapal");
const u8 Tiles_storyframe_cream_tails_vanilla_look_around[]
    = INCBIN_U8("data/tilemaps/storyframe_cream_tails_vanilla_look_around/tiles.4bpp");
const u16 Tilemap_storyframe_cream_tails_vanilla_look_around[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_tails_vanilla_look_around/tilemap.tilemap2");

const Tilemap storyframe_cream_tails_vanilla_look_around = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_tails_vanilla_look_around,
    .tilesSize = sizeof(Tiles_storyframe_cream_tails_vanilla_look_around),
    .palette = Palette_storyframe_cream_tails_vanilla_look_around,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_cream_tails_vanilla_look_around) / sizeof(u16),
    .map = Tilemap_storyframe_cream_tails_vanilla_look_around,
};
