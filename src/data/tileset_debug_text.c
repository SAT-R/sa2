#include "global.h"
#include "data/tileset_language.h"

// Tiles used for debug strings, like the unused (in the retail version) Stage Select.
#if NON_MATCHING
const u8 Tileset_Language[] = INCBIN_U8("graphics/tilesets/debug_ascii.4bpp");
#else
const u8 Tileset_Language[] = {};
#endif
