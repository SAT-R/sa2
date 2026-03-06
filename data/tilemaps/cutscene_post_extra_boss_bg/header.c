#include "global.h"
#include "core.h"

const ColorRaw Palette_cutscene_post_extra_boss_bg[] = INCPAL("data/tilemaps/cutscene_post_extra_boss_bg/palette.pal");
const u8 Tiles_cutscene_post_extra_boss_bg[] = INCBIN_U8("data/tilemaps/cutscene_post_extra_boss_bg/tiles.4bpp");
const u16 Tilemap_cutscene_post_extra_boss_bg[] = INCBIN_U16("data/tilemaps/cutscene_post_extra_boss_bg/tilemap.tilemap2");

const Tilemap cutscene_post_extra_boss_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_post_extra_boss_bg,
    .tilesSize = sizeof(Tiles_cutscene_post_extra_boss_bg),
    .palette = Palette_cutscene_post_extra_boss_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_cutscene_post_extra_boss_bg),
    .map = Tilemap_cutscene_post_extra_boss_bg,
};
