#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_storyframe_sonic_pats_tails[] = INCBIN_U16("data/tilemaps/storyframe_sonic_pats_tails/palette.gbapal");
ALIGNED(4) static const u8 Tiles_storyframe_sonic_pats_tails[] = INCBIN_U8("data/tilemaps/storyframe_sonic_pats_tails/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_storyframe_sonic_pats_tails[] = INCBIN_U16("data/tilemaps/storyframe_sonic_pats_tails/tilemap.tilemap2");

ALIGNED(4) const Tilemap storyframe_sonic_pats_tails = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_pats_tails,
    .tilesSize = sizeof(Tiles_storyframe_sonic_pats_tails),
    .palette = Palette_storyframe_sonic_pats_tails,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_sonic_pats_tails) / sizeof(u16),
    .map = Tilemap_storyframe_sonic_pats_tails,
};
