#include "global.h"
#include "core.h"

const ColorRaw Palette_character_select_background[] = INCPAL("data/tilemaps/character_select_background/palette.pal");
const u8 Tiles_character_select_background[] = INCBIN_U8("data/tilemaps/character_select_background/tiles.4bpp");
const u16 Tilemap_character_select_background[] = INCBIN_U16("data/tilemaps/character_select_background/tilemap.tilemap2");

const Tilemap character_select_background = {
    .xTiles = (DISPLAY_WIDTH / 8),
    .yTiles = (DISPLAY_HEIGHT / 8),
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_character_select_background,
    .tilesSize = sizeof(Tiles_character_select_background),
    .palette = Palette_character_select_background,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_character_select_background),
    .map = Tilemap_character_select_background,
};
