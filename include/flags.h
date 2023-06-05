#ifndef GUARD_FLAGS_H
#define GUARD_FLAGS_H

#include "global.h"

// used by 'animCmd_GetPalette_COPY' (0x08004314 in SA2)
#define FLAGS_UPDATE_BACKGROUND_PALETTES 0x1
#define FLAGS_UPDATE_SPRITE_PALETTES     0x2
#define FLAGS_4                          0x4
#define FLAGS_EXECUTE_HBLANK_CALLBACKS   0x8

#define FLAGS_NO_FLASH_MEMORY 0x100
#define FLAGS_SKIP_INTRO      0x1000

extern u32 gFlags;

#endif
