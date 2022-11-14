#include "global.h"

static const u8 demo1[];
static const u8 demo2[];
static const u8 demo3[];
static const u8 demo4[];

const u8 *const gDemoRecordings[] = {
    demo1,
    demo2,
    demo4,
    demo3,
};

static const u8 demo1[] = INCBIN_U8("data/recordings/demo_1.bin.lz");
static const u8 demo2[] = INCBIN_U8("data/recordings/demo_2.bin.lz");
static const u8 demo3[] = INCBIN_U8("data/recordings/demo_3.bin.lz");
static const u8 demo4[] = INCBIN_U8("data/recordings/demo_4.bin.lz");
