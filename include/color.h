#ifndef GUARD_COLOR_H
#define GUARD_COLOR_H

#if PLATFORM_GBA || (RENDERER == RENDERER_SOFTWARE)
// ABGR_1555
typedef uint16_t ColorRaw;
typedef union Color {
    struct {
        uint16_t r : 5;
        uint16_t g : 5;
        uint16_t b : 5;
        uint16_t a : 1;
    } split;

    ColorRaw raw;
} Color;

#else
// RGBA_8888
typedef uint32_t ColorRaw;
typedef union Color {
    struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
        uint8_t a;
    } split;

    ColorRaw raw;
} Color;
#endif

#endif // GUARD_COLOR_H