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
#define ASM_FUNC(path, decl)                                                                                                               \
    NAKED decl { asm(".include " #path); }
#endif

#if NON_MATCHING
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

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n)*256))

// Converts a number to Q4.12 fixed-point format
#define Q_4_12(n) ((s16)((n)*4096))

// Converts a number to Q2.14 fixed-point format
#define Q_2_14(n) ((s16)((n)*0x4000))

// Converts a number to Q24.8 fixed-point format
#define Q_24_8(n)      ((s32)((n) << 8))
#define Q_24_8_FRAC(n) ((u8)(n))

// Converts a Q8.8 fixed-point format number to a regular integer
#define Q_8_8_TO_INT(n) ((int)((n) / 256))

// Converts a Q4.12 fixed-point format number to a regular integer
#define Q_4_12_TO_INT(n) ((int)((n) / 4096))

// Converts a Q24.8 fixed-point format number to a regular integer
#define Q_24_8_TO_INT(n) ((int)((n) >> 8))

#define RED_VALUE(color)   ((color)&0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color)  (((color) >> 10) & 0x1F)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

#define GetBit(x, y) ((x) >> (y)&1)

// 60 is not exactly true as the GBA's FPS, but it's what they went
// with for the calculation
#define GBA_FRAMES_PER_SECOND 60

// TODO: Find better place for this
typedef void (*HBlankFunc)(u8 vcount);
typedef void (*IntrFunc)(void);
typedef u32 (*SpriteUpdateFunc)(void);

extern u8 IntrMain_RAM[0x80];
extern IntrFunc gIntrTable[4];

extern u16 gUnknown_03003B70;

struct GameConfig {
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

extern struct GameConfig gUnknown_02000008;

struct UNK_03003330 {
    // Main
    void (*unk0)(void);
    u32 filler4;
    // frame
    u32 unk8;
    u16 unkC;
    u8 unkE;
    u8 unkF;
    u8 unk10;
};

extern struct UNK_03003330 gUnknown_03003330;

extern u8 gSaveSectorNum;
extern u32 gSaveVersion;

extern u32 gUnknown_03005274;

// These should be moved once we know
// which files they belong to
extern void sub_02001528(u32);
extern void sub_020018c8(void);
extern void sub_0200be24(void);
extern void sub_0200d27c(void);
extern void sub_020018a0(void);
extern void GetInput(void);

#endif // GUARD_GLOBAL_H
