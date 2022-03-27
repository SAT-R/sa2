#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <stdlib.h>

#include "gba/gba.h"

#define CONST_DATA __attribute__((section(".data")))

// #include "types.h"
// #include "variables.h"
// #include "functions.h"

// helper macros

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define SIN(aAngle) (gSinLookup[(aAngle&0xFF)])
#define COS(aAngle) (gSinLookup[0x40 + (aAngle&0xFF)])

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

#endif  // GUARD_GLOBAL_H
