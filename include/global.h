#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

#define CONST_DATA __attribute__((section(".data")))

// #include "types.h"
// #include "variables.h"
#include "functions.h"

#define SIO_MULTI_CNT ((volatile struct SioMultiCnt *)REG_ADDR_SIOCNT)

// helper macros

#if NON_MATCHING
#define ASM_FUNC(path, decl)
#else
#define ASM_FUNC(path, decl)                                                            \
    NAKED decl { asm(".include " #path); }
#endif

#if NON_MATCHING
#define NONMATCH(path, decl) decl
#define END_NONMATCH
#else
#define NONMATCH(path, decl)                                                            \
    NAKED decl                                                                          \
    {                                                                                   \
        asm(".include " #path);                                                         \
        if (0)
#define END_NONMATCH }
#endif

/// IDE support
#if defined(__APPLE__) || defined(__CYGWIN__) || defined(__INTELLISENSE__)
// We define these when using certain IDEs to fool preproc
#define _(x)  (x)
#define __(x) (x)
#define INCBIN(...)                                                                     \
    {                                                                                   \
        0                                                                               \
    }
#define INCBIN_U8  INCBIN
#define INCBIN_U16 INCBIN
#define INCBIN_U32 INCBIN
#define INCBIN_S8  INCBIN
#define INCBIN_S16 INCBIN
#define INCBIN_S32 INCBIN
#endif // IDE support

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n)*256))

// Converts a number to Q16.16 fixed-point format (<< 0x10)
#define Q_16_16(n) ((s32)((n)*0x10000))

// Converts a number to Q4.12 fixed-point format
#define Q_4_12(n) ((s16)((n)*4096))

// Converts a number to Q2.14 fixed-point format
#define Q_2_14(n) ((s16)((n)*0x4000))

// Converts a number to Q24.8 fixed-point format
#define Q_20_12(n) ((s32)((n)*4096))

// Converts a number to Q24.8 fixed-point format
#define Q_24_8(n) ((s32)((n) << 8))

// Converts a Q8.8 fixed-point format number to a regular integer
#define Q_8_8_TO_INT(n) ((int)((n) / 256))

// Converts a Q4.12 fixed-point format number to a regular integer
#define Q_4_12_TO_INT(n) ((int)((n) / 4096))

// Converts a Q2.12 fixed-point format number to a regular integer
#define Q_2_14_TO_INT(n) ((int)((n) >> 14))

// Converts a Q24.8 fixed-point format number to a regular integer
#define Q_24_8_TO_INT(n) ((int)((n) >> 8))

// Converts a Q20.12 fixed-point format number to a regular integer
#define Q_20_12_TO_INT(n) ((int)((n) >> 12))

// Converts a Q16.16 fixed-point format number to a regular integer
#define Q_16_16_TO_INT(n) ((int)((n) >> 0x10))

#define RED_VALUE(color)   ((color)&0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color)  (((color) >> 10) & 0x1F)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

#define GetBit(x, y) ((x) >> (y)&1)

// 60 is not exactly true as the GBA's FPS, but it's what they went
// with for the calculation
#define GBA_FRAMES_PER_SECOND 60

#define SWAP_AND_NEGATE(a, b)                                                           \
    a ^= b;                                                                             \
    b ^= a;                                                                             \
    a = (b ^ a) * -1;                                                                   \
    b *= -1;

struct BlendRegs {
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
};

struct BgAffineRegs {
    u16 bg2pa;
    u16 bg2pb;
    u16 bg2pc;
    u16 bg2pd;
    u32 bg2x;
    u32 bg2y;
    u16 bg3pa;
    u16 bg3pb;
    u16 bg3pc;
    u16 bg3pd;
    u32 bg3x;
    u32 bg3y;
};

// TODO: Find better place for this
typedef void (*HBlankFunc)(u8 vcount);
typedef void (*IntrFunc)(void);
typedef void (*FuncType_030053A0)(void);
typedef u32 (*SpriteUpdateFunc)(void);

extern void *iwram_end;
extern void *ewram_end;

extern void *rom_footer;

#endif // GUARD_GLOBAL_H
