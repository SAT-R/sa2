#ifndef GUARD_SW_RENDERER_COMMON_H
#define GUARD_SW_RENDERER_COMMON_H

// shared color math for the gba ppu blend unit
// used by both the normal (multi-pass) and fast (single-pass) software renderers

#include <stdint.h>

// bgr555 channel extraction
#define getAlphaBit(x)     (((x) >> 15) & 1)
#define getRedChannel(x)   (((x) >> 0) & 0x1F)
#define getGreenChannel(x) (((x) >> 5) & 0x1F)
#define getBlueChannel(x)  (((x) >> 10) & 0x1F)
#define COLOR_OPAQUE       0x8000

static inline uint16_t alphaBlendColor(uint16_t targetA, uint16_t targetB, unsigned int eva, unsigned int evb)
{
    unsigned int r = ((getRedChannel(targetA) * eva) + (getRedChannel(targetB) * evb)) >> 4;
    unsigned int g = ((getGreenChannel(targetA) * eva) + (getGreenChannel(targetB) * evb)) >> 4;
    unsigned int b = ((getBlueChannel(targetA) * eva) + (getBlueChannel(targetB) * evb)) >> 4;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | COLOR_OPAQUE;
}

static inline uint16_t alphaBrightnessIncrease(uint16_t targetA, unsigned int evy)
{
    unsigned int r = getRedChannel(targetA) + (31 - getRedChannel(targetA)) * evy / 16;
    unsigned int g = getGreenChannel(targetA) + (31 - getGreenChannel(targetA)) * evy / 16;
    unsigned int b = getBlueChannel(targetA) + (31 - getBlueChannel(targetA)) * evy / 16;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | COLOR_OPAQUE;
}

static inline uint16_t alphaBrightnessDecrease(uint16_t targetA, unsigned int evy)
{
    unsigned int r = getRedChannel(targetA) - getRedChannel(targetA) * evy / 16;
    unsigned int g = getGreenChannel(targetA) - getGreenChannel(targetA) * evy / 16;
    unsigned int b = getBlueChannel(targetA) - getBlueChannel(targetA) * evy / 16;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | COLOR_OPAQUE;
}

#endif // GUARD_SW_RENDERER_COMMON_H
