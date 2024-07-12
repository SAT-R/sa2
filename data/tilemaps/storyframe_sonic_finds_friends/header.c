#include "global.h"
#include "core.h"

const u16 Palette_storyframe_sonic_finds_friends[] = INCBIN_U16("data/tilemaps/storyframe_sonic_finds_friends/palette.gbapal");
const u8 Tiles_storyframe_sonic_finds_friends[] = INCBIN_U8("data/tilemaps/storyframe_sonic_finds_friends/tiles.4bpp");
const u16 Tilemap_storyframe_sonic_finds_friends[] = INCBIN_U16("data/tilemaps/storyframe_sonic_finds_friends/tilemap.tilemap2");

const Tilemap storyframe_sonic_finds_friends = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_finds_friends,
    .tilesSize = sizeof(Tiles_storyframe_sonic_finds_friends),
    .palette = Palette_storyframe_sonic_finds_friends,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_sonic_finds_friends) / sizeof(u16),
    .map = Tilemap_storyframe_sonic_finds_friends,
};
