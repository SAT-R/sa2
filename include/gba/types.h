#ifndef GUARD_GBA_TYPES_H
#define GUARD_GBA_TYPES_H

#include <stdint.h>

typedef uint8_t   u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef int8_t    s8;
typedef int16_t  s16;
typedef int32_t  s32;
typedef int64_t  s64;

typedef volatile u8   vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8   vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;

typedef float  f32;
typedef double f64;

typedef u8  bool8;
typedef u16 bool16;
typedef u32 bool32;

struct DispCnt
{
    u16 mode:3;
    u16 cgbMode:1;  // reserved, do not use
    u16 bmpFrameNum:1;
    u16 hblankIntervalFree:1;
    u16 obj1dMap:1;
    u16 forcedBlank:1;
    u16 bg0_on:1;
    u16 bg1_on:1;
    u16 bg2_on:1;
    u16 bg3_on:1;
    u16 obj_on:1;
    u16 win0_on:1;
    u16 win1_on:1;
    u16 objWin_on:1;
};

struct DispStat
{
    u16 vblankFlag:1;
    u16 hblankFlag:1;
    u16 vcountFlag:1;
    u16 vblankIrqEnable:1;
    u16 hblankIrqEnable:1;
    u16 vcountIrqEnable:1;
    u16 dummy:2;
    u8 vcountCompare;
};

struct BgCnt
{
    u16 priority:2;
    u16 charBaseBlock:2;
    u16 dummy:2;
    u16 mosaic:1;
    u16 colorMode:1;
    u16 screenBaseBlock:5;
    u16 areaOverflowMode:1;
    u16 screenSize:2;
};

struct WinCnt
{
    u8  win0_bg0_on:1;
    u8  win0_bg1_on:1;
    u8  win0_bg2_on:1;
    u8  win0_bg3_on:1;
    u8  win0_obj_on:1;
    u8  win0_blend_on:1;
    u8  dummy1:2;

    u8  win1_bg0_on:1;
    u8  win1_bg1_on:1;
    u8  win1_bg2_on:1;
    u8  win1_bg3_on:1;
    u8  win1_obj_on:1;
    u8  win1_blend_on:1;
    u8  dummy2:2;
};

struct BlendCnt
{
    u16 target1_bg0_on:1;
    u16 target1_bg1_on:1;
    u16 target1_bg2_on:1;
    u16 target1_bg3_on:1;
    u16 target1_obj_on:1;
    u16 target1_bd_on:1;
    u16 effect:2;
    u16 target2_bg0_on:1;
    u16 target2_bg1_on:1;
    u16 target2_bg2_on:1;
    u16 target2_bg3_on:1;
    u16 target2_obj_on:1;
    u16 target2_bd_on:1;
};

struct PlttData
{
    u16 r:5; // red
    u16 g:5; // green
    u16 b:5; // blue
    u16 unused_15:1;
} /*__attribute__((packed))*/;

typedef union {
    struct {
    /*0x00*/ u32 y:8;
    /*0x01*/ u32 affineMode:2;  // 0x1, 0x2 -> 0x4
             u32 objMode:2;     // 0x4, 0x8 -> 0xC
             u32 mosaic:1;      // 0x10
             u32 bpp:1;         // 0x20
             u32 shape:2;       // 0x40, 0x80 -> 0xC0

    /*0x02*/ u32 x:9;
             u32 matrixNum:5;   // bits 3/4 are h-flip/v-flip if not in affine mode
             u32 size:2;        // 0x4000, 0x8000 -> 0xC000

    /*0x04*/ u16 tileNum:10;    // 0x3FF
             u16 priority:2;    // 0x400, 0x800 -> 0xC00
             u16 paletteNum:4;

    /*0x06*/ u16 fractional:8;
             u16 integer:7;
             u16 sign:1;
    } split;

    struct {
        u16 attr0;
        u16 attr1;
        u16 attr2;
        u16 affineParam;
    } all;
} OamData;

#define ST_OAM_OBJ_NORMAL 0
#define ST_OAM_OBJ_BLEND  1
#define ST_OAM_OBJ_WINDOW 2

#define ST_OAM_AFFINE_OFF    0
#define ST_OAM_AFFINE_NORMAL 1
#define ST_OAM_AFFINE_ERASE  2
#define ST_OAM_AFFINE_DOUBLE 3

#define ST_OAM_AFFINE_ON_MASK     1
#define ST_OAM_AFFINE_DOUBLE_MASK 2

#define ST_OAM_4BPP 0
#define ST_OAM_8BPP 1

#define ST_OAM_SQUARE      0
#define ST_OAM_H_RECTANGLE 1
#define ST_OAM_V_RECTANGLE 2

struct BgAffineSrcData
{
    s32 texX;
    s32 texY;
    s16 scrX;
    s16 scrY;
    s16 sx;
    s16 sy;
    u16 alpha;
};

struct BgAffineDstData
{
    s16 pa;
    s16 pb;
    s16 pc;
    s16 pd;
    s32 dx;
    s32 dy;
};

struct ObjAffineSrcData
{
    s16 xScale;
    s16 yScale;
    u16 rotation;
};

// Multi-player SIO Control Structure
struct SioMultiCnt
{
    u16 baudRate:2;    // baud rate
    u16 si:1;          // SI terminal
    u16 sd:1;          // SD terminal
    u16 id:2;          // ID
    u16 error:1;       // error flag
    u16 enable:1;      // SIO enable
    u16 unused_11_8:4;
    u16 mode:2;        // communication mode (should equal 2)
    u16 intrEnable:1;  // IRQ enable
    u16 unused_15:1;
    u16 data;          // data
};

#define ST_SIO_MULTI_MODE 2 // Multi-player communication mode

// baud rate
#define ST_SIO_9600_BPS   0 //   9600 bps
#define ST_SIO_38400_BPS  1 //  38400 bps
#define ST_SIO_57600_BPS  2 //  57600 bps
#define ST_SIO_115200_BPS 3 // 115200 bps

struct WaitCnt
{
    u16 sramWait:2;
    u16 rom0_1stAcc:2;
    u16 rom0_2ndAcc:1;
    u16 rom1_1stAcc:2;
    u16 rom1_2ndAcc:1;
    u16 rom2_1stAcc:2;
    u16 rom2_2ndAcc:1;
    u16 phiTerminalClock:2;
    u16 dummy:1;
    u16 prefetchBufEnable:1;
    u16 gamePakType:1;
};

#endif // GUARD_GBA_TYPES_H
