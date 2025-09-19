#ifndef GUARD_FLAGS_H
#define GUARD_FLAGS_H

#include "global.h"

// used by 'animCmd_GetPalette_COPY' (0x08004314 in SA2)
#define FLAGS_UPDATE_BACKGROUND_PALETTES 0x1
#define FLAGS_UPDATE_SPRITE_PALETTES     0x2
#define FLAGS_EXECUTE_HBLANK_COPY        0x4
#define FLAGS_EXECUTE_HBLANK_CALLBACKS   0x8
#define FLAGS_10                         0x10
#define FLAGS_20                         0x20
#define FLAGS_40                         0x40
#define FLAGS_80                         0x80
#define FLAGS_NO_FLASH_MEMORY            0x100
#define FLAGS_200                        0x200
#define FLAGS_PAUSE_GAME                 0x400
#define FLAGS_800                        0x800
#define FLAGS_SKIP_INTRO                 0x1000
#define FLAGS_4000                       0x4000
#define FLAGS_8000                       0x8000

extern u32 gFlags;

#endif
