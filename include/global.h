#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

#define CONST_DATA __attribute__((section(".data")))

// #include "types.h"
// #include "variables.h"
#include "functions.h"


// helper macros

#if NON_MATCHING
#define ASM_FUNC(path, decl)
#else
#define ASM_FUNC(path, decl)    \
    NAKED decl {                \
        asm(".include " #path); \
    }
#endif

/// IDE support
#if defined(__APPLE__) || defined(__CYGWIN__) || defined(__INTELLISENSE__)
// We define these when using certain IDEs to fool preproc
#define _(x)        (x)
#define __(x)       (x)
#define INCBIN(...) {0}
#define INCBIN_U8   INCBIN
#define INCBIN_U16  INCBIN
#define INCBIN_U32  INCBIN
#define INCBIN_S8   INCBIN
#define INCBIN_S16  INCBIN
#define INCBIN_S32  INCBIN
#endif // IDE support

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define SIN(aAngle) (gSinLookup[(aAngle&0xFF)])
#define COS(aAngle) (gSinLookup[0x40 + (aAngle&0xFF)])

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

// TODO: Find better place for this
typedef void (*HBlankFunc)(u8);
typedef void (*IntrFunc)(void);
typedef void (*FuncType_030053A0)(void);
typedef u32 (*SpriteUpdateFunc)(void);


#endif  // GUARD_GLOBAL_H
