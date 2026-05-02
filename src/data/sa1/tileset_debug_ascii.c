#include "global.h"
#include "data/sa1/tileset_debug_ascii.h"

// Tiles used for debug strings, like the unused (in the retail version) Stage Select.
#ifndef NON_MATCHING
const u8 ALIGNED(8) Tileset_DebugAscii[] = {};
#else
const u8 ALIGNED(8) Tileset_DebugAscii[] = INCBIN_U8("graphics/sa1/tilesets/debug_ascii/debug_ascii.4bpp");
#endif
