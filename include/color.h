#ifndef GUARD_COLOR_H
#define GUARD_COLOR_H

#if PLATFORM_GBA || PLATFORM_SDL
// ABGR_1555
typedef u16 ColorRaw;
typedef union Color {
    struct {
        u16 r : 5;
        u16 g : 5;
        u16 b : 5;
        u16 a : 1;
    } split;

    ColorRaw raw;
} Color;

#else
// RGBA_8888
typedef u32 ColorRaw;
typedef union Color {
    struct {
        u8 r;
        u8 g;
        u8 b;
        u8 a;
    } split;

    ColorRaw raw;
} Color;
#endif

#endif // GUARD_COLOR_H