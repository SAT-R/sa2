#include "global.h"
#include "core.h"

const u16 Palette_character_select_wheel[] = INCBIN_U16("data/tilemaps/character_select_wheel/palette.gbapal");
const u8 Tiles_character_select_wheel[] = INCBIN_U8("data/tilemaps/character_select_wheel/tiles.4bpp");
const u16 Tilemap_character_select_wheel[] = INCBIN_U16("data/tilemaps/character_select_wheel/tilemap.tilemap2");

const Tilemap character_select_wheel = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_character_select_wheel,
    .tilesSize = sizeof(Tiles_character_select_wheel),
    .palette = Palette_character_select_wheel,
    .palOffset = 0,
    .palLength = sizeof(Palette_character_select_wheel) / sizeof(u16),
    .map = Tilemap_character_select_wheel,
};
