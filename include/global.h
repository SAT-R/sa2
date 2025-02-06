#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "config.h"
#include "gba/gba.h"

#if PLATFORM_GBA
#define ENABLE_AUDIO TRUE
#else
#define ENABLE_AUDIO     TRUE
#define ENABLE_VRAM_VIEW !TRUE
#endif

#define CONST_DATA __attribute__((section(".data")))

// #include "types.h"
// #include "variables.h"

#if !PLATFORM_GBA
#ifdef _WIN32
void *Platform_malloc(int numBytes);
void Platform_free(void *ptr);
#define malloc(numBytes)    Platform_malloc(numBytes)
#define calloc(count, size) Platform_malloc(count *size)
#define free(numBytes)      Platform_free(numBytes)
#endif
#endif

#define SIO_MULTI_CNT ((volatile struct SioMultiCnt *)REG_ADDR_SIOCNT)

typedef void (*VoidFn)(void);

// helper macros

// This macro is only needed while SA2 still has variables called gUnknown_XXXXXXX left
#if ((GAME == GAME_SA1) || (GAME == GAME_SA3))
#define SA2_LABEL(_label) sa2__##_label
#else
#define SA2_LABEL(_label) _label
#endif

#if (PORTABLE)
#define BUG_FIX

#if !(defined NON_MATCHING)
#define NON_MATCHING 1
#endif
#elif (DEBUG)
#define NON_MATCHING 1
#endif

#ifdef NON_MATCHING
#define ASM_FUNC(path, decl)
#define TEMP_FIX 1
#else
#define ASM_FUNC(path, decl)                                                                                                               \
    NAKED decl { asm(".include " #path); }
#define TEMP_FIX 0
#endif

#ifdef NON_MATCHING
#define NONMATCH(path, decl) decl
#define END_NONMATCH
#else
#define NONMATCH(path, decl)                                                                                                               \
    NAKED decl                                                                                                                             \
    {                                                                                                                                      \
        asm(".include " #path);                                                                                                            \
        if (0)
#define END_NONMATCH }
#endif

/// IDE support
#if defined(__CYGWIN__) || defined(__INTELLISENSE__)
// We define these when using certain IDEs to fool preproc
#define _(x)  (x)
#define __(x) (x)
#define INCBIN(...)                                                                                                                        \
    {                                                                                                                                      \
        0                                                                                                                                  \
    }
#define INCBIN_U8  INCBIN
#define INCBIN_U16 INCBIN
#define INCBIN_U32 INCBIN
#define INCBIN_S8  INCBIN
#define INCBIN_S16 INCBIN
#define INCBIN_S32 INCBIN
#endif // IDE support

// Use STR(<macro>) to turn the macro's *content* into a string
#define STR_(x) #x
#define STR(x)  STR_(x)

// NOTE: This has to be kept as-is.
//       If casted it to be signed,
//          dataIndex = (dataIndex + 1) % ARRAY_COUNT(data)
//       wouldn't match.
#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n)*256))

// Converts a number to Q16.16 fixed-point format (<< 0x10)
#define Q_16_16(n) ((s32)((n)*0x10000))

// Converts a number to Q4.12 fixed-point format
#define Q_4_12(n) ((s16)((n)*4096))

// Converts a number to Q2.14 fixed-point format
#define Q_2_14(n) ((s16)((n)*0x4000))

// Converts a number to Q20.12 fixed-point format
#define Q_20_12(n) ((s32)((n)*4096))

// Converts a number to Q24.8 fixed-point format
#define Q_24_8(n)      ((s32)((n)*256))
#define Q_24_8_FRAC(n) ((u8)(n))

// This may be the "real" version as we are seeing better matches with
// it in some cases
#define Q_24_8_NEW(n) ((s32)((n) << 8))

// Converts a Q8.8 fixed-point format number to a regular integer
#define Q_8_8_TO_INT(n) ((int)((n) >> 8))

// Converts a Q4.12 fixed-point format number to a regular integer
#define Q_4_12_TO_INT(n) ((int)((n) >> 12))

// Converts a Q2.12 fixed-point format number to a regular integer
#define Q_2_14_TO_INT(n) ((int)((n) >> 14))

// Converts a Q24.8 fixed-point format number to a regular integer
#define Q_24_8_TO_INT(n) ((int)((n) >> 8))

// Converts a Q20.12 fixed-point format number to a regular integer
#define Q_20_12_TO_INT(n) ((int)((n) >> 12))

// Converts a Q16.16 fixed-point format number to a regular integer
#define Q_16_16_TO_INT(n) ((int)((n) >> 0x10))

// Converts a Q2.12 fixed-point format number to a Q24.8 fixed point number
#define Q_2_14_TO_Q_24_8(n) ((int)((n) >> 6))

// Multiplies two Q values
#define Q_MUL(qValA, qValB)         ((qValA * qValB) >> 8)
#define Q_SQUARE(qVal)              Q_MUL(qVal, qVal)
#define Q_DIV(qValA, qValB)         Div((qValA << 8), qValB)
#define Q_DIV2(qValA, qValB)        ((qValA << 8) / qValB)
#define Q_MUL_Q_F32(qVal, floatVal) Q_MUL(qVal, Q(floatVal))

/*
 * Aliases for common macros
 */

// Converts a number to Q24.8 fixed-point format
#define Q(n) Q_24_8(n)

// Converts a number to Q24.8 fixed-point format
#define QS(n) Q_24_8_NEW(n)

// Converts a Q24.8 fixed-point format number to a regular integer
#define I(n) Q_24_8_TO_INT(n)

#define RED_VALUE(color)   (((color) >> 0) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color)  (((color) >> 10) & 0x1F)

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

#define CLAMP(value, min, max)                                                                                                             \
    ({                                                                                                                                     \
        s32 clamped;                                                                                                                       \
        if ((value) < (min)) {                                                                                                             \
            clamped = (min);                                                                                                               \
        } else {                                                                                                                           \
            clamped = (value) > (max) ? (max) : (value);                                                                                   \
        }                                                                                                                                  \
        clamped;                                                                                                                           \
    })

#define CLAMP_T(type, value, min, max)                                                                                                     \
    ({                                                                                                                                     \
        type clamped;                                                                                                                      \
        if ((value) >= (min)) {                                                                                                            \
            clamped = (value) > (max) ? (max) : (value);                                                                                   \
        } else {                                                                                                                           \
            clamped = (min);                                                                                                               \
        }                                                                                                                                  \
        clamped;                                                                                                                           \
    })

#define CLAMP_16(value, min, max) CLAMP_T(s16, value, min, max)
#define CLAMP_32(value, min, max) CLAMP_T(s32, value, min, max)

#define CLAMP_INLINE(var, min, max)                                                                                                        \
    ({                                                                                                                                     \
        if ((var) < (min)) {                                                                                                               \
            var = (min);                                                                                                                   \
        } else if ((var) > (max)) {                                                                                                        \
            var = (max);                                                                                                                   \
        }                                                                                                                                  \
    })

#define CLAMP_INLINE_NO_ELSE(var, min, max)                                                                                                \
    ({                                                                                                                                     \
        if ((var) < (min)) {                                                                                                               \
            var = (min);                                                                                                                   \
        }                                                                                                                                  \
                                                                                                                                           \
        if ((var) > (max)) {                                                                                                               \
            var = (max);                                                                                                                   \
        }                                                                                                                                  \
    })

#define CLAMP_INLINE2(var, min, max)                                                                                                       \
    ({                                                                                                                                     \
        if ((var) > (max)) {                                                                                                               \
            var = (max);                                                                                                                   \
        } else if ((var) < (min)) {                                                                                                        \
            var = (min);                                                                                                                   \
        }                                                                                                                                  \
    })

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

#define BitValue(y)      (1 << (y))
#define CheckBit(x, y)   ((x) & (BitValue(y)))
#define GetBit(x, y)     (((x) >> (y)) & 1)
#define SetBit(x, y)     (x) |= BitValue(y)
#define SetSoleBit(x, y) (x) = BitValue(y)
#define ClearBit(x, y)   (x) &= ~BitValue(y)

// TODO: Use instrinsics for these, on platforms that support it!
// Like GetFirstSetBitIndex, but an external iterator can be passed.
#define GetFirstSetBitIndexExt(value, max, it)                                                                                             \
    ({                                                                                                                                     \
        s32 res;                                                                                                                           \
                                                                                                                                           \
        for (it = 0; it < (max); it++) {                                                                                                   \
            if (GetBit(value, it)) {                                                                                                       \
                break;                                                                                                                     \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        res = it;                                                                                                                          \
    })

// Get the index to the first set bit in a given value.
#define GetFirstSetBitIndex(value, max)                                                                                                    \
    ({                                                                                                                                     \
        s16 bit;                                                                                                                           \
                                                                                                                                           \
        bit = GetFirstSetBitIndexExt(value, max, bit);                                                                                     \
    })

// Like GetFirstSetBitIndex, but expects input value to only have 1 bit set.
#define GetSoleSetBitIndex(value, max)                                                                                                     \
    ({                                                                                                                                     \
        s16 bit;                                                                                                                           \
                                                                                                                                           \
        for (bit = 0; bit < (max); bit++) {                                                                                                \
            if ((value) == (1 << bit)) {                                                                                                   \
                break;                                                                                                                     \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        bit;                                                                                                                               \
    })

// 60 is not exactly true as the GBA's FPS, but it's what they went
// with for the calculation
#define GBA_FRAMES_PER_SECOND 60

// TODO: fix casts here(?)
#define XOR_SWAP(a, b)                                                                                                                     \
    a ^= (u8)b;                                                                                                                            \
    b ^= (u8)a;                                                                                                                            \
    a = ((u8)b ^ (u8)a);

// TODO: fix casts here
#define SWAP_AND_NEGATE(a, b)                                                                                                              \
    a ^= (u8)b;                                                                                                                            \
    b ^= (u8)a;                                                                                                                            \
    a = ((u8)b ^ (u8)a) * -1;                                                                                                              \
    b = (u8)b * -1;

#define NEGATE(var)                                                                                                                        \
    ({                                                                                                                                     \
        s32 temp = var;                                                                                                                    \
        var = -temp;                                                                                                                       \
    })
#define DIRECT_NEGATE(var) (var = -var;)

#define HALVE(var) (var = (var >> 1))

typedef struct {
    s16 x;
    s16 y;
} Vec2_16;

typedef struct {
    s32 x;
    s32 y;
} Vec2_32;

typedef struct {
    u8 reserved : 4;
    u8 compressedType : 4;
    u32 size : 24;
    void *data;
} RLCompressed;

struct BlendRegs {
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
};

// TODO: Should this be in a GBA-specific header file?
#define NUM_AFFINE_BACKGROUNDS 2
#define NUM_BACKGROUNDS        4

// Values to be passed top the affine registers
// (used by BG2/BG3 in affine screen modes)
typedef struct {
    /* 0x00 */ u16 pa, pb, pc, pd;
    /* 0x08 */ u32 x, y;
} BgAffineReg;

// TODO: Find better place for this
typedef void (*HBlankFunc)(int_vcount vcount);
typedef void (*IntrFunc)(void);
typedef void (*FuncType_030053A0)(void);
typedef bool32 (*VBlankFunc)(void);

extern void *iwram_end;
extern void *ewram_end;

extern void *rom_footer;

#endif // GUARD_GLOBAL_H
