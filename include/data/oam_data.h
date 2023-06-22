#ifndef GUARD_CONST_DATA_OAM_DATA_H
#define GUARD_CONST_DATA_OAM_DATA_H

#include "game/game.h"
#include "gba/types.h"

// NOTE: Inside the ROM the OAM data used for layouting
//       is stored without an affine parameter, which makes sense
//       since they're relatively unrelated and affine values
//       usually generated during runtime, anyway.
//       That's what this variation of 'OamData' is for.
typedef struct PACKED {
    /*0x00*/
    u32 y : 8;

    /*0x01*/
    u32 affineMode : 2; // 0x1, 0x2 -> 0x4
    u32 objMode : 2; // 0x4, 0x8 -> 0xC
    u32 mosaic : 1; // 0x10
    u32 bpp : 1; // 0x20
    u32 shape : 2; // 0x40, 0x80 -> 0xC0

    /*0x02*/
    u32 x : 9;
    u32 matrixNum : 5; // bits 3/4 are h-flip/v-flip if not in affine mode
    u32 size : 2; // 0x4000, 0x8000 -> 0xC000

    /*0x04*/
    u16 tileNum : 10; // 0x3FF
    u16 priority : 2; // 0x400, 0x800 -> 0xC00
    u16 paletteNum : 4;
} OamDataRom;

extern const OamDataRom *const gSpriteOamData[NUM_SPRITE_ANIMATIONS];

#endif // GUARD_CONST_DATA_OAM_DATA_H
