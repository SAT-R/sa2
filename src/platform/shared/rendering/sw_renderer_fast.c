// sw_renderer_fast.c -- single-pass back-to-front gba ppu renderer
//
// the default renderer does multiple passes per scanline which thrashes
// the data cache on older platforms with tiny L1 and no L2

// this one composites everything in one pass per scanline, painting
// layers directly into the output buffer from back to front. a
// layerIds[] side-buffer tracks what wrote each pixel so alpha
// blending can find its target-b inline.
//
// 4bpp text bgs get a batched path that reads one u32 per 8 pixels.
// 8bpp and mosaic bgs fall back to per-pixel. sprites are pre-filtered
// per scanline so we only touch the ones that actually matter.

#include "config.h"

#if RENDERER == RENDERER_SOFTWARE_FAST

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "global.h"
#include "core.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "gba/types.h"
#include "platform/shared/dma.h"
#include "platform/shared/rendering/sw_renderer_common.h"

extern IntrFunc gIntrTable[16];
extern uint8_t REG_BASE[IO_SIZE];
extern uint16_t PLTT[PLTT_SIZE / sizeof(uint16_t)];
extern uint8_t VRAM[VRAM_SIZE];
extern uint8_t OAM[OAM_SIZE];
extern const u8 gOamShapesSizes[12][2];

#ifndef TILE_WIDTH
#define TILE_WIDTH 8
#endif

#define IsBGEnabled(n) (((REG_DISPCNT >> 8) & 0xF) & (1 << (n)))

// mosaic
#define MOSAIC_BG_X        (REG_MOSAIC & 0xF)
#define MOSAIC_BG_Y        ((REG_MOSAIC >> 4) & 0xF)
#define MOSAIC_SPR_X       ((REG_MOSAIC >> 8) & 0xF)
#define MOSAIC_SPR_Y       ((REG_MOSAIC >> 12) & 0xF)
#define ApplyMosaicBGX(x)  ((x) - ((x) % (MOSAIC_BG_X + 1)))
#define ApplyMosaicBGY(y)  ((y) - ((y) % (MOSAIC_BG_Y + 1)))
#define ApplyMosaicSprX(x) ((x) - ((x) % (MOSAIC_SPR_X + 1)))
#define ApplyMosaicSprY(y) ((y) - ((y) % (MOSAIC_SPR_Y + 1)))

// tilemap entry fields
#define TILE_NUM(e)     ((e)&0x3FF)
#define TILE_PALETTE(e) (((e) >> 12) & 0xF)
#define TILE_HFLIP(e)   ((e) & (1 << 10))
#define TILE_VFLIP(e)   ((e) & (1 << 11))

// window mask bits
#define WINMASK_BG0    (1 << 0)
#define WINMASK_BG1    (1 << 1)
#define WINMASK_BG2    (1 << 2)
#define WINMASK_BG3    (1 << 3)
#define WINMASK_OBJ    (1 << 4)
#define WINMASK_CLR    (1 << 5)
#define WINMASK_WINOUT (1 << 6)

// layer ids for blend target tracking
#define LAYER_BG0      0
#define LAYER_BG1      1
#define LAYER_BG2      2
#define LAYER_BG3      3
#define LAYER_OBJ      4
#define LAYER_BACKDROP 5

static const uint16_t bgMapSizes[][2] = {
    { 32, 32 },
    { 64, 32 },
    { 32, 64 },
    { 64, 64 },
};

// 16-bit fill using 32-bit writes
static inline void Memset16(uint16_t *dst, uint16_t fill, unsigned int count)
{
    uint32_t fill32 = ((uint32_t)fill << 16) | fill;
    uint32_t *dst32 = (uint32_t *)dst;
    unsigned int pairs = count >> 1;
    for (unsigned int i = 0; i < pairs; i++)
        dst32[i] = fill32;
    if (count & 1)
        dst[count - 1] = fill;
}

static inline uint32_t GetBgRefX(int bg) { return (bg == 2) ? REG_BG2X : (bg == 3) ? REG_BG3X : 0; }
static inline uint32_t GetBgRefY(int bg) { return (bg == 2) ? REG_BG2Y : (bg == 3) ? REG_BG3Y : 0; }
static inline uint16_t GetBgPA(int bg) { return (bg == 2) ? REG_BG2PA : (bg == 3) ? REG_BG3PA : 0; }
static inline uint16_t GetBgPB(int bg) { return (bg == 2) ? REG_BG2PB : (bg == 3) ? REG_BG3PB : 0; }
static inline uint16_t GetBgPC(int bg) { return (bg == 2) ? REG_BG2PC : (bg == 3) ? REG_BG3PC : 0; }
static inline uint16_t GetBgPD(int bg) { return (bg == 2) ? REG_BG2PD : (bg == 3) ? REG_BG3PD : 0; }

// handles the wraparound case where left > right
static inline bool WindowContainsX(u16 left, u16 right, u16 x)
{
    if (left > right)
        return (x >= left || x < right);
    return (x >= left && x < right);
}

// check if a layer can be the target-b for alpha blending
static inline bool IsBlendTargetB(uint8_t layerId, unsigned int bldcnt)
{
    if (layerId <= 3)
        return (bldcnt & (1 << (8 + layerId))) != 0;
    if (layerId == LAYER_OBJ)
        return (bldcnt & BLDCNT_TGT2_OBJ) != 0;
    if (layerId == LAYER_BACKDROP)
        return (bldcnt & BLDCNT_TGT2_BD) != 0;
    return false;
}

// sprites with oam mode 1 always try alpha blending regardless of bldcnt
static inline uint16_t BlendSpritePixel(uint16_t color, unsigned int x, uint16_t *output, uint8_t *layerIds, bool isSemiTransparent,
                                        unsigned int blendMode, unsigned int bldcnt, bool windowsEnabled, uint16_t *winMask,
                                        unsigned int eva, unsigned int evb, unsigned int evy)
{
    bool winAllowsBlend = !windowsEnabled || (winMask && (winMask[x] & WINMASK_CLR));

    bool doAlpha = (blendMode == 1 && (bldcnt & BLDCNT_TGT1_OBJ) && winAllowsBlend) || isSemiTransparent;

    if (doAlpha) {
        if (IsBlendTargetB(layerIds[x], bldcnt))
            return alphaBlendColor(color, output[x], eva, evb);
    } else if ((bldcnt & BLDCNT_TGT1_OBJ) && winAllowsBlend) {
        if (blendMode == 2)
            return alphaBrightnessIncrease(color, evy);
        if (blendMode == 3)
            return alphaBrightnessDecrease(color, evy);
    }

    return color;
}

// write a bg pixel with inline blend resolution
static inline void WriteBGPixelBlended(unsigned int x, uint8_t pixel, const uint16_t *palBase, int bgNum, uint16_t *output,
                                       uint8_t *layerIds, unsigned int blendMode, bool bgIsTargetA, bool useWindows, unsigned int winBgBit,
                                       uint16_t *winMask, unsigned int bldcnt, unsigned int eva, unsigned int evb, unsigned int evy)
{
    uint16_t color = palBase[pixel] | COLOR_OPAQUE;

    if (useWindows && !(winMask[x] & winBgBit))
        return;

    if (bgIsTargetA && (!useWindows || (winMask[x] & WINMASK_CLR))) {
        uint16_t src = color;
        switch (blendMode) {
            case 1:
                if (IsBlendTargetB(layerIds[x], bldcnt))
                    color = alphaBlendColor(src, output[x], eva, evb);
                break;
            case 2:
                color = alphaBrightnessIncrease(src, evy);
                break;
            case 3:
                color = alphaBrightnessDecrease(src, evy);
                break;
        }
    }

    output[x] = color;
    layerIds[x] = bgNum;
}

static void RenderTextBG(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *output)
{
    unsigned int charBase = (control >> 2) & 3;
    unsigned int screenBase = (control & BGCNT_SCREENBASE_MASK) >> 8;
    unsigned int is8bpp = (control >> 7) & 1;

    unsigned int mapW = bgMapSizes[control >> 14][0];
    unsigned int mapPxW = mapW << 3;
    unsigned int mapPxH = bgMapSizes[control >> 14][1] << 3;
    unsigned int wMask = mapPxW - 1;
    unsigned int hMask = mapPxH - 1;

    uint8_t *tiles = (uint8_t *)BG_CHAR_ADDR(charBase);
    uint16_t *map = (uint16_t *)BG_SCREEN_ADDR(screenBase);
    uint16_t *pal = (uint16_t *)PLTT;

    bool hasMosaic = control & BGCNT_MOSAIC;
    if (hasMosaic)
        lineNum = ApplyMosaicBGY(lineNum);

    hoffs &= 0x1FF;
    voffs &= 0x1FF;

    unsigned int yy = (lineNum + voffs) & hMask;
    unsigned int mapY = yy >> 3;
    unsigned int tileY = yy & 7;
    unsigned int rowBase = mapY * mapW;

    // slow path: 8bpp or mosaic, one pixel at a time
    if (hasMosaic || is8bpp) {
        for (unsigned int x = 0; x < DISPLAY_WIDTH; x++) {
            unsigned int xx = hasMosaic ? (ApplyMosaicBGX(x) + hoffs) & wMask : (x + hoffs) & wMask;

            uint16_t entry = map[rowBase + (xx >> 3)];
            unsigned int tileNum = TILE_NUM(entry);
            unsigned int palNum = TILE_PALETTE(entry);
            unsigned int tx = xx & 7;
            unsigned int ty = tileY;
            if (TILE_HFLIP(entry))
                tx = 7 - tx;
            if (TILE_VFLIP(entry))
                ty = 7 - ty;

            if (!is8bpp) {
                uint8_t pair = tiles[(tileNum << 5) + (ty << 2) + (tx >> 1)];
                uint8_t pixel = (tx & 1) ? (pair >> 4) : (pair & 0xF);
                if (pixel)
                    output[x] = pal[(palNum << 4) + pixel] | COLOR_OPAQUE;
            } else {
                uint8_t pixel = tiles[(tileNum << 6) + (ty << 3) + tx];
                if (pixel)
                    output[x] = pal[pixel] | COLOR_OPAQUE;
            }
        }
        return;
    }

    // fast path: 4bpp, read one u32 per tile row, unroll 8 pixels
    unsigned int x = 0;

    // left edge: partial tile if scroll isn't tile-aligned
    {
        unsigned int startX = hoffs & wMask;
        unsigned int startOff = startX & 7;

        if (startOff != 0) {
            uint16_t entry = map[rowBase + (startX >> 3)];
            unsigned int tileNum = TILE_NUM(entry);
            unsigned int palNum = TILE_PALETTE(entry);
            unsigned int ty = tileY;
            if (TILE_VFLIP(entry))
                ty = 7 - ty;
            bool hflip = TILE_HFLIP(entry);

            uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));

            unsigned int partial = 8 - startOff;
            if (partial > DISPLAY_WIDTH)
                partial = DISPLAY_WIDTH;

            for (unsigned int t = 0; t < partial && x < DISPLAY_WIDTH; t++, x++) {
                unsigned int tx = startOff + t;
                if (hflip)
                    tx = 7 - tx;
                uint8_t pixel = (row >> (tx << 2)) & 0xF;
                if (pixel)
                    output[x] = pal[(palNum << 4) + pixel] | COLOR_OPAQUE;
            }
        }
    }

    // middle: full tiles, 8 pixels at a time
    while (x + 8 <= DISPLAY_WIDTH) {
        unsigned int srcX = (x + hoffs) & wMask;
        uint16_t entry = map[rowBase + (srcX >> 3)];
        unsigned int tileNum = TILE_NUM(entry);
        unsigned int palNum = TILE_PALETTE(entry);
        unsigned int ty = tileY;
        if (TILE_VFLIP(entry))
            ty = 7 - ty;

        uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));
        uint16_t *palBase = pal + (palNum << 4);

        if (!TILE_HFLIP(entry)) {
            uint8_t p;
            p = row & 0xF;
            if (p)
                output[x] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 4) & 0xF;
            if (p)
                output[x + 1] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 8) & 0xF;
            if (p)
                output[x + 2] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 12) & 0xF;
            if (p)
                output[x + 3] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 16) & 0xF;
            if (p)
                output[x + 4] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 20) & 0xF;
            if (p)
                output[x + 5] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 24) & 0xF;
            if (p)
                output[x + 6] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 28) & 0xF;
            if (p)
                output[x + 7] = palBase[p] | COLOR_OPAQUE;
        } else {
            uint8_t p;
            p = (row >> 28) & 0xF;
            if (p)
                output[x] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 24) & 0xF;
            if (p)
                output[x + 1] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 20) & 0xF;
            if (p)
                output[x + 2] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 16) & 0xF;
            if (p)
                output[x + 3] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 12) & 0xF;
            if (p)
                output[x + 4] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 8) & 0xF;
            if (p)
                output[x + 5] = palBase[p] | COLOR_OPAQUE;
            p = (row >> 4) & 0xF;
            if (p)
                output[x + 6] = palBase[p] | COLOR_OPAQUE;
            p = row & 0xF;
            if (p)
                output[x + 7] = palBase[p] | COLOR_OPAQUE;
        }
        x += 8;
    }

    // right edge: leftover partial tile
    if (x < DISPLAY_WIDTH) {
        unsigned int srcX = (x + hoffs) & wMask;
        uint16_t entry = map[rowBase + (srcX >> 3)];
        unsigned int tileNum = TILE_NUM(entry);
        unsigned int palNum = TILE_PALETTE(entry);
        unsigned int ty = tileY;
        if (TILE_VFLIP(entry))
            ty = 7 - ty;
        bool hflip = TILE_HFLIP(entry);

        uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));

        for (unsigned int t = 0; x < DISPLAY_WIDTH; t++, x++) {
            unsigned int tx = hflip ? (7 - t) : t;
            uint8_t pixel = (row >> (tx << 2)) & 0xF;
            if (pixel)
                output[x] = pal[(palNum << 4) + pixel] | COLOR_OPAQUE;
        }
    }
}

// same thing but with blend/window tracking baked in
static void RenderTextBGBlend(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *output, uint8_t *layerIds,
                              unsigned int blendMode, bool windowsEnabled, uint16_t *winMask, unsigned int bldcnt, unsigned int eva,
                              unsigned int evb, unsigned int evy)
{
    unsigned int charBase = (control >> 2) & 3;
    unsigned int screenBase = (control & BGCNT_SCREENBASE_MASK) >> 8;
    unsigned int is8bpp = (control >> 7) & 1;

    unsigned int mapW = bgMapSizes[control >> 14][0];
    unsigned int mapPxW = mapW << 3;
    unsigned int mapPxH = bgMapSizes[control >> 14][1] << 3;
    unsigned int wMask = mapPxW - 1;
    unsigned int hMask = mapPxH - 1;

    uint8_t *tiles = (uint8_t *)BG_CHAR_ADDR(charBase);
    uint16_t *map = (uint16_t *)BG_SCREEN_ADDR(screenBase);
    uint16_t *pal = (uint16_t *)PLTT;

    bool hasMosaic = control & BGCNT_MOSAIC;
    if (hasMosaic)
        lineNum = ApplyMosaicBGY(lineNum);

    hoffs &= 0x1FF;
    voffs &= 0x1FF;

    unsigned int yy = (lineNum + voffs) & hMask;
    unsigned int mapY = yy >> 3;
    unsigned int tileY = yy & 7;
    unsigned int rowBase = mapY * mapW;

    bool bgIsTargetA = (blendMode != 0) && (bldcnt & (1 << bgNum));
    bool useWindows = windowsEnabled && (winMask != NULL);
    unsigned int winBgBit = 1 << bgNum;

    // slow path: 8bpp or mosaic
    if (hasMosaic || is8bpp) {
        for (unsigned int x = 0; x < DISPLAY_WIDTH; x++) {
            unsigned int xx = hasMosaic ? (ApplyMosaicBGX(x) + hoffs) & wMask : (x + hoffs) & wMask;

            uint16_t entry = map[rowBase + (xx >> 3)];
            unsigned int tileNum = TILE_NUM(entry);
            unsigned int palNum = TILE_PALETTE(entry);
            unsigned int tx = xx & 7;
            unsigned int ty = tileY;
            if (TILE_HFLIP(entry))
                tx = 7 - tx;
            if (TILE_VFLIP(entry))
                ty = 7 - ty;

            uint8_t pixel;
            if (!is8bpp) {
                uint8_t pair = tiles[(tileNum << 5) + (ty << 2) + (tx >> 1)];
                pixel = (tx & 1) ? (pair >> 4) : (pair & 0xF);
            } else {
                pixel = tiles[(tileNum << 6) + (ty << 3) + tx];
            }

            if (pixel == 0)
                continue;

            uint16_t color = !is8bpp ? pal[(palNum << 4) + pixel] | COLOR_OPAQUE : pal[pixel] | COLOR_OPAQUE;

            if (useWindows && !(winMask[x] & winBgBit))
                continue;

            if (bgIsTargetA && (!useWindows || (winMask[x] & WINMASK_CLR))) {
                uint16_t src = color;
                switch (blendMode) {
                    case 1:
                        if (IsBlendTargetB(layerIds[x], bldcnt))
                            color = alphaBlendColor(src, output[x], eva, evb);
                        break;
                    case 2:
                        color = alphaBrightnessIncrease(src, evy);
                        break;
                    case 3:
                        color = alphaBrightnessDecrease(src, evy);
                        break;
                }
            }

            output[x] = color;
            layerIds[x] = bgNum;
        }
        return;
    }

    // fast path: 4bpp batched with inline blend
    unsigned int x = 0;

    // left edge partial tile
    {
        unsigned int startX = hoffs & wMask;
        unsigned int startOff = startX & 7;

        if (startOff != 0) {
            uint16_t entry = map[rowBase + (startX >> 3)];
            unsigned int tileNum = TILE_NUM(entry);
            unsigned int palNum = TILE_PALETTE(entry);
            unsigned int ty = tileY;
            if (TILE_VFLIP(entry))
                ty = 7 - ty;
            bool hflip = TILE_HFLIP(entry);

            uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));
            uint16_t *palBase = pal + (palNum << 4);

            unsigned int partial = 8 - startOff;
            if (partial > DISPLAY_WIDTH)
                partial = DISPLAY_WIDTH;

            for (unsigned int t = 0; t < partial && x < DISPLAY_WIDTH; t++, x++) {
                unsigned int tx = startOff + t;
                if (hflip)
                    tx = 7 - tx;
                uint8_t pixel = (row >> (tx << 2)) & 0xF;
                if (pixel)
                    WriteBGPixelBlended(x, pixel, palBase, bgNum, output, layerIds, blendMode, bgIsTargetA, useWindows, winBgBit, winMask,
                                        bldcnt, eva, evb, evy);
            }
        }
    }

    // middle: full tiles
    while (x + 8 <= DISPLAY_WIDTH) {
        unsigned int srcX = (x + hoffs) & wMask;
        uint16_t entry = map[rowBase + (srcX >> 3)];
        unsigned int tileNum = TILE_NUM(entry);
        unsigned int palNum = TILE_PALETTE(entry);
        unsigned int ty = tileY;
        if (TILE_VFLIP(entry))
            ty = 7 - ty;

        uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));
        uint16_t *palBase = pal + (palNum << 4);

#define BLEND_PX(off, shift)                                                                                                               \
    do {                                                                                                                                   \
        uint8_t p = (row >> (shift)) & 0xF;                                                                                                \
        if (p)                                                                                                                             \
            WriteBGPixelBlended(x + (off), p, palBase, bgNum, output, layerIds, blendMode, bgIsTargetA, useWindows, winBgBit, winMask,     \
                                bldcnt, eva, evb, evy);                                                                                    \
    } while (0)

        if (!TILE_HFLIP(entry)) {
            BLEND_PX(0, 0);
            BLEND_PX(1, 4);
            BLEND_PX(2, 8);
            BLEND_PX(3, 12);
            BLEND_PX(4, 16);
            BLEND_PX(5, 20);
            BLEND_PX(6, 24);
            BLEND_PX(7, 28);
        } else {
            BLEND_PX(0, 28);
            BLEND_PX(1, 24);
            BLEND_PX(2, 20);
            BLEND_PX(3, 16);
            BLEND_PX(4, 12);
            BLEND_PX(5, 8);
            BLEND_PX(6, 4);
            BLEND_PX(7, 0);
        }

#undef BLEND_PX

        x += 8;
    }

    // right edge partial tile
    if (x < DISPLAY_WIDTH) {
        unsigned int srcX = (x + hoffs) & wMask;
        uint16_t entry = map[rowBase + (srcX >> 3)];
        unsigned int tileNum = TILE_NUM(entry);
        unsigned int palNum = TILE_PALETTE(entry);
        unsigned int ty = tileY;
        if (TILE_VFLIP(entry))
            ty = 7 - ty;
        bool hflip = TILE_HFLIP(entry);

        uint32_t row = *(uint32_t *)(tiles + (tileNum << 5) + (ty << 2));
        uint16_t *palBase = pal + (palNum << 4);

        for (unsigned int t = 0; x < DISPLAY_WIDTH; t++, x++) {
            unsigned int tx = hflip ? (7 - t) : t;
            uint8_t pixel = (row >> (tx << 2)) & 0xF;
            if (pixel)
                WriteBGPixelBlended(x, pixel, palBase, bgNum, output, layerIds, blendMode, bgIsTargetA, useWindows, winBgBit, winMask,
                                    bldcnt, eva, evb, evy);
        }
    }
}

static void RenderAffineBG(int bgNum, uint16_t control, int lineNum, uint16_t *output)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;

    uint8_t *tiles = (uint8_t *)(VRAM + bgcnt->charBaseBlock * 0x4000);
    uint8_t *map = (uint8_t *)(VRAM + bgcnt->screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;

    if (control & BGCNT_MOSAIC)
        lineNum = ApplyMosaicBGY(lineNum);

    s16 pa = GetBgPA(bgNum);
    s16 pb = GetBgPB(bgNum);
    s16 pc = GetBgPC(bgNum);
    s16 pd = GetBgPD(bgNum);

    // always square: 128/256/512/1024
    int size = 128;
    switch (bgcnt->screenSize) {
        case 1:
            size = 256;
            break;
        case 2:
            size = 512;
            break;
        case 3:
            size = 1024;
            break;
    }
    int mask = size - 1;
    int yshift = ((control >> 14) & 3) + 4;

    // sign-extend 28-bit reference point, advance by scanline
    s32 refX = GetBgRefX(bgNum);
    s32 refY = GetBgRefY(bgNum);
    refX = (refX & (1 << 27)) ? refX | 0xF0000000 : refX;
    refY = (refY & (1 << 27)) ? refY | 0xF0000000 : refY;
    refX += lineNum * pb;
    refY += lineNum * pd;

    int curX = refX;
    int curY = refY;

    if (bgcnt->areaOverflowMode) {
        // wraparound
        for (int x = 0; x < DISPLAY_WIDTH; x++) {
            int tx = (curX >> 8) & mask;
            int ty = (curY >> 8) & mask;
            int tile = map[(tx >> 3) + ((ty >> 3) << yshift)];
            uint8_t pixel = tiles[(tile << 6) + ((ty & 7) << 3) + (tx & 7)];
            if (pixel)
                output[x] = pal[pixel] | COLOR_OPAQUE;
            curX += pa;
            curY += pc;
        }
    } else {
        // clamp: outside the map = transparent
        for (int x = 0; x < DISPLAY_WIDTH; x++) {
            int tx = curX >> 8;
            int ty = curY >> 8;
            if (tx >= 0 && ty >= 0 && tx < size && ty < size) {
                int tile = map[(tx >> 3) + ((ty >> 3) << yshift)];
                uint8_t pixel = tiles[(tile << 6) + ((ty & 7) << 3) + (tx & 7)];
                if (pixel)
                    output[x] = pal[pixel] | COLOR_OPAQUE;
            }
            curX += pa;
            curY += pc;
        }
    }

    // horizontal mosaic as a post-pass
    if ((control & BGCNT_MOSAIC) && MOSAIC_BG_X > 0) {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
            output[x] = output[ApplyMosaicBGX(x)];
    }
}

// same deal with blend/window support
static void RenderAffineBGBlend(int bgNum, uint16_t control, int lineNum, uint16_t *output, uint8_t *layerIds, unsigned int blendMode,
                                bool windowsEnabled, uint16_t *winMask, unsigned int bldcnt, unsigned int eva, unsigned int evb,
                                unsigned int evy)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;

    uint8_t *tiles = (uint8_t *)(VRAM + bgcnt->charBaseBlock * 0x4000);
    uint8_t *map = (uint8_t *)(VRAM + bgcnt->screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;

    if (control & BGCNT_MOSAIC)
        lineNum = ApplyMosaicBGY(lineNum);

    s16 pa = GetBgPA(bgNum);
    s16 pb = GetBgPB(bgNum);
    s16 pc = GetBgPC(bgNum);
    s16 pd = GetBgPD(bgNum);

    int size = 128;
    switch (bgcnt->screenSize) {
        case 1:
            size = 256;
            break;
        case 2:
            size = 512;
            break;
        case 3:
            size = 1024;
            break;
    }
    int mask = size - 1;
    int yshift = ((control >> 14) & 3) + 4;

    s32 refX = GetBgRefX(bgNum);
    s32 refY = GetBgRefY(bgNum);
    refX = (refX & (1 << 27)) ? refX | 0xF0000000 : refX;
    refY = (refY & (1 << 27)) ? refY | 0xF0000000 : refY;
    refX += lineNum * pb;
    refY += lineNum * pd;

    int curX = refX;
    int curY = refY;

    bool bgIsTargetA = (blendMode != 0) && (bldcnt & (1 << bgNum));

    for (int x = 0; x < DISPLAY_WIDTH; x++) {
        int tx, ty;

        if (bgcnt->areaOverflowMode) {
            tx = (curX >> 8) & mask;
            ty = (curY >> 8) & mask;
        } else {
            tx = curX >> 8;
            ty = curY >> 8;
            if (tx < 0 || ty < 0 || tx >= size || ty >= size) {
                curX += pa;
                curY += pc;
                continue;
            }
        }

        int tile = map[(tx >> 3) + ((ty >> 3) << yshift)];
        uint8_t pixel = tiles[(tile << 6) + ((ty & 7) << 3) + (tx & 7)];

        curX += pa;
        curY += pc;

        if (pixel == 0)
            continue;

        uint16_t color = pal[pixel] | COLOR_OPAQUE;

        if (windowsEnabled && winMask && !(winMask[x] & (1 << bgNum)))
            continue;

        bool winAllowsBlend = true;
        if (windowsEnabled && winMask)
            winAllowsBlend = (winMask[x] & WINMASK_CLR) >> 5;

        if (bgIsTargetA && winAllowsBlend) {
            uint16_t src = color;
            switch (blendMode) {
                case 1:
                    if (IsBlendTargetB(layerIds[x], bldcnt))
                        color = alphaBlendColor(src, output[x], eva, evb);
                    break;
                case 2:
                    color = alphaBrightnessIncrease(src, evy);
                    break;
                case 3:
                    color = alphaBrightnessDecrease(src, evy);
                    break;
            }
        }

        output[x] = color;
        layerIds[x] = bgNum;
    }

    if ((control & BGCNT_MOSAIC) && MOSAIC_BG_X > 0) {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
            output[x] = output[ApplyMosaicBGX(x)];
    }
}

#define MAX_SPRITES_PER_PRIORITY 32

typedef struct {
    uint8_t oamIndex;
} ActiveSprite;

static ActiveSprite sActiveSprites[4][MAX_SPRITES_PER_PRIORITY];
static int sActiveSpriteCount[4];

static void PrefilterSprites(uint16_t vcount)
{
    sActiveSpriteCount[0] = 0;
    sActiveSpriteCount[1] = 0;
    sActiveSpriteCount[2] = 0;
    sActiveSpriteCount[3] = 0;

    if (!(REG_DISPCNT & DISPCNT_OBJ_ON))
        return;

    // back-to-front so lower oam indices (higher hw priority) draw last
    for (int i = OAM_ENTRY_COUNT - 1; i >= 0; i--) {
        OamData *oam = &((OamData *)OAM)[i];

        bool isAffine = oam->split.affineMode & 1;
        bool isDisabled = (oam->split.affineMode >> 1) & 1;

        if (!isAffine && isDisabled)
            continue;

        s32 idx = (oam->split.shape << 2) | oam->split.size;
        unsigned int width = gOamShapesSizes[idx][0];
        unsigned int height = gOamShapesSizes[idx][1];
        int halfW = width / 2;
        int halfH = height / 2;

        int32_t sx = oam->split.x;
        int32_t sy = oam->split.y;
#if !EXTENDED_OAM
        if (sx >= DISPLAY_WIDTH)
            sx -= 512;
        if (sy >= DISPLAY_HEIGHT)
            sy -= 256;
#endif

        // double-size affine sprites have 2x bounding box
        if (isAffine && isDisabled) {
            halfW *= 2;
            halfH *= 2;
        }

        if ((int)vcount < sy || (int)vcount >= sy + halfH * 2)
            continue;
        if (sx + halfW * 2 < 0 || sx >= DISPLAY_WIDTH)
            continue;

        int pri = oam->split.priority;
        if (sActiveSpriteCount[pri] < MAX_SPRITES_PER_PRIORITY) {
            sActiveSprites[pri][sActiveSpriteCount[pri]].oamIndex = i;
            sActiveSpriteCount[pri]++;
        }
    }
}

static void DrawSpritesAtPriority(int priority, uint16_t vcount, uint16_t *output, uint8_t *layerIds, bool windowsEnabled,
                                  uint16_t *winMask, unsigned int blendMode, bool objWinOnly, unsigned int bldcnt, unsigned int eva,
                                  unsigned int evb, unsigned int evy)
{
    uint8_t *tiledata = (uint8_t *)OBJ_VRAM0;
    uint16_t *sprpal = (uint16_t *)PLTT + (0x200 / 2);
    int16_t matrix[2][2];

    // only 1-D tile mapping supported
    if (!(REG_DISPCNT & (1 << 6)))
        return;

    for (int s = 0; s < sActiveSpriteCount[priority]; s++) {
        int i = sActiveSprites[priority][s].oamIndex;
        OamData *oam = &((OamData *)OAM)[i];

        bool isAffine = oam->split.affineMode & 1;
        bool doubleSize = (oam->split.affineMode >> 1) & 1;

        s32 idx = (oam->split.shape << 2) | oam->split.size;
        unsigned int width = gOamShapesSizes[idx][0];
        unsigned int height = gOamShapesSizes[idx][1];
        int halfW = width / 2;
        int halfH = height / 2;

        int32_t x = oam->split.x;
        int32_t y = oam->split.y;
#if !EXTENDED_OAM
        if (x >= DISPLAY_WIDTH)
            x -= 512;
        if (y >= DISPLAY_HEIGHT)
            y -= 256;
#endif
        if (isAffine && doubleSize) {
            halfW *= 2;
            halfH *= 2;
        }

        bool isSemiTransparent = (oam->split.objMode == 1);
        bool isObjWin = (oam->split.objMode == 2);

        if (objWinOnly && !isObjWin)
            continue;
        if (!objWinOnly && isObjWin)
            continue;

        int rectWidth = width;
        int rectHeight = height;

        if (isAffine) {
            u8 matrixNum = oam->split.matrixNum * 4;
            OamData *m0 = &((OamData *)OAM)[matrixNum];
            OamData *m1 = &((OamData *)OAM)[matrixNum + 1];
            OamData *m2 = &((OamData *)OAM)[matrixNum + 2];
            OamData *m3 = &((OamData *)OAM)[matrixNum + 3];
            matrix[0][0] = m0->all.affineParam;
            matrix[0][1] = m1->all.affineParam;
            matrix[1][0] = m2->all.affineParam;
            matrix[1][1] = m3->all.affineParam;
            if (doubleSize) {
                rectWidth *= 2;
                rectHeight *= 2;
            }
        } else {
            matrix[0][0] = 0x100; // identity in 8.8 fixed point
            matrix[0][1] = 0;
            matrix[1][0] = 0;
            matrix[1][1] = 0x100;
        }

        x += halfW;
        y += halfH;

        int localY = (oam->split.mosaic == 1) ? ApplyMosaicSprY(vcount) - y : vcount - y;
        bool flipX = !isAffine && ((oam->split.matrixNum >> 3) & 1);
        bool flipY = !isAffine && ((oam->split.matrixNum >> 4) & 1);
        bool is8bpp = oam->split.bpp & 1;

        int startLX = -halfW;
        int endLX = halfW;
        if (startLX + x < 0)
            startLX = -x;
        if (endLX + x >= DISPLAY_WIDTH)
            endLX = DISPLAY_WIDTH - 1 - x;

        // fast path: non-affine 4bpp, no mosaic -- batched tile row reads
        if (!isAffine && !is8bpp && !oam->split.mosaic) {
            int texY = localY + halfH;
            if (flipY)
                texY = height - texY - 1;
            if (texY < 0 || texY >= (int)height)
                continue;

            int tileRowY = texY & 7;
            int blockY = texY >> 3;
            int tilesPerRow = (REG_DISPCNT & 0x40) ? ((int)width >> 3) : 16;
            int tileBase = blockY * tilesPerRow + oam->split.tileNum;
            int rowByteOff = tileRowY << 2;
            uint16_t *pixpal = sprpal + (oam->split.paletteNum << 4);

            int lx = startLX;
            while (lx <= endLX) {
                int rawX = lx + halfW;
                int texX = flipX ? ((int)width - 1 - rawX) : rawX;

                if (texX < 0 || texX >= (int)width) {
                    lx++;
                    continue;
                }

                int blockX = texX >> 3;
                int tileXStart = texX & 7;

                uint32_t rowData = *(uint32_t *)(tiledata + ((tileBase + blockX) << 5) + rowByteOff);

                int pixelsInTile = !flipX ? (8 - tileXStart) : (tileXStart + 1);
                int remain = endLX - lx + 1;
                if (pixelsInTile > remain)
                    pixelsInTile = remain;

                if (!flipX) {
                    int texRemain = (int)width - texX;
                    if (pixelsInTile > texRemain)
                        pixelsInTile = texRemain;
                } else {
                    int texRemain = texX + 1;
                    if (pixelsInTile > texRemain)
                        pixelsInTile = texRemain;
                }

                for (int p = 0; p < pixelsInTile; p++, lx++) {
                    int curTX = flipX ? (tileXStart - p) : (tileXStart + p);
                    uint8_t pixel = (rowData >> (curTX << 2)) & 0xF;
                    if (pixel == 0)
                        continue;

                    int gx = lx + x;
                    uint16_t color = pixpal[pixel];

                    // obj window sprites modify the window mask, not the framebuffer
                    if (isObjWin) {
                        if (windowsEnabled && winMask && (winMask[gx] & WINMASK_WINOUT))
                            winMask[gx] = (REG_WINOUT >> 8) & 0x3F;
                        continue;
                    }

                    if (layerIds && blendMode != 0)
                        color = BlendSpritePixel(color, gx, output, layerIds, isSemiTransparent, blendMode, bldcnt, windowsEnabled, winMask,
                                                 eva, evb, evy);

                    if (windowsEnabled && winMask && !(winMask[gx] & WINMASK_OBJ))
                        continue;

                    output[gx] = color | COLOR_OPAQUE;
                    if (layerIds)
                        layerIds[gx] = LAYER_OBJ;
                }
            }
            continue;
        }

        // generic path: affine, 8bpp, or mosaic -- per pixel
        for (int localX = startLX; localX <= endLX; localX++) {
            int gx = localX + x;
            int texX, texY;

            if (!isAffine) {
                int lmx = localX;
                if (oam->split.mosaic == 1)
                    lmx = ApplyMosaicSprX(gx) - x;
                texX = lmx + halfW;
                texY = localY + halfH;
                if (flipX)
                    texX = width - texX - 1;
                if (flipY)
                    texY = height - texY - 1;
            } else {
                int lmx = localX;
                int lmy = localY;
                if (oam->split.mosaic == 1) {
                    lmx = ApplyMosaicSprX(gx) - x;
                    lmy = ApplyMosaicSprY(vcount) - y;
                }
                // apply 2x2 affine matrix (8.8 fixed point)
                texX = ((matrix[0][0] * lmx + matrix[0][1] * lmy) >> 8) + (width / 2);
                texY = ((matrix[1][0] * lmx + matrix[1][1] * lmy) >> 8) + (height / 2);
            }

            if (texX < 0 || texY < 0 || texX >= (int)width || texY >= (int)height)
                continue;

            int tileX = texX & 7;
            int tileY = texY & 7;
            int blockX = texX >> 3;
            int blockY = texY >> 3;
            int blockOffset = blockY * (REG_DISPCNT & 0x40 ? ((int)width >> 3) : 16) + blockX;

            uint16_t pixel = 0;
            uint16_t *pixpal;

            if (!is8bpp) {
                int tdi = ((blockOffset + oam->split.tileNum) << 5) + (tileY << 2) + (tileX >> 1);
                pixel = tiledata[tdi];
                if (tileX & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;
                pixpal = sprpal + (oam->split.paletteNum << 4);
            } else {
                pixel = tiledata[((blockOffset * 2 + oam->split.tileNum) << 5) + (tileY << 3) + tileX];
                pixpal = sprpal;
            }

            if (pixel == 0)
                continue;

            uint16_t color = pixpal[pixel];

            if (isObjWin) {
                if (windowsEnabled && winMask && (winMask[gx] & WINMASK_WINOUT))
                    winMask[gx] = (REG_WINOUT >> 8) & 0x3F;
                continue;
            }

            if (layerIds && blendMode != 0)
                color = BlendSpritePixel(color, gx, output, layerIds, isSemiTransparent, blendMode, bldcnt, windowsEnabled, winMask, eva,
                                         evb, evy);

            if (windowsEnabled && winMask && !(winMask[gx] & WINMASK_OBJ))
                continue;

            output[gx] = color | COLOR_OPAQUE;
            if (layerIds)
                layerIds[gx] = LAYER_OBJ;
        }
    }
}

static void DrawScanline(uint16_t *pixels, uint16_t vcount)
{
    unsigned int mode = REG_DISPCNT & 3;
    unsigned int numBGs = (mode == 0) ? 4 : 3;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    unsigned int enabledBgs = (REG_DISPCNT >> 8) & 0xF;

    // sort bgs by priority
    uint16_t bgcnts[4];
    char bgPriority[4];
    char bgsByPri[4][4];
    char bgsByPriCount[4] = { 0, 0, 0, 0 };

    for (int bg = 0; bg < (int)numBGs; bg++) {
        uint16_t cnt = *(uint16_t *)(REG_ADDR_BG0CNT + bg * 2);
        bgcnts[bg] = cnt;
        uint16_t pri = cnt & 3;
        bgPriority[bg] = pri;
        bgsByPri[pri][bgsByPriCount[pri]] = bg;
        bgsByPriCount[pri]++;
    }

    // window setup
    bool windowsEnabled = false;
    u16 win0Bot, win0Top, win0Right, win0Left;
    u16 win1Bot, win1Top, win1Right, win1Left;
    bool win0Active = false, win1Active = false;
    static uint16_t winMask[DISPLAY_WIDTH];

    if (REG_DISPCNT & DISPCNT_WIN0_ON) {
        win0Bot = WIN_GET_HIGHER(REG_WIN0V);
        win0Top = WIN_GET_LOWER(REG_WIN0V);
        win0Right = WIN_GET_HIGHER(REG_WIN0H);
        win0Left = WIN_GET_LOWER(REG_WIN0H);
        if (win0Top > win0Bot)
            win0Active = (vcount >= win0Top || vcount < win0Bot);
        else
            win0Active = (vcount >= win0Top && vcount < win0Bot);
        windowsEnabled = true;
    }
    if (REG_DISPCNT & DISPCNT_WIN1_ON) {
        win1Bot = WIN_GET_HIGHER(REG_WIN1V);
        win1Top = WIN_GET_LOWER(REG_WIN1V);
        win1Right = WIN_GET_HIGHER(REG_WIN1H);
        win1Left = WIN_GET_LOWER(REG_WIN1H);
        if (win1Top > win1Bot)
            win1Active = (vcount >= win1Top || vcount < win1Bot);
        else
            win1Active = (vcount >= win1Top && vcount < win1Bot);
        windowsEnabled = true;
    }
    if ((REG_DISPCNT & DISPCNT_OBJWIN_ON) && (REG_DISPCNT & DISPCNT_OBJ_ON))
        windowsEnabled = true;

    // build per-pixel window mask
    if (windowsEnabled) {
        for (unsigned int xpos = 0; xpos < DISPLAY_WIDTH; xpos++) {
            if (win0Active && WindowContainsX(win0Left, win0Right, xpos))
                winMask[xpos] = REG_WININ & 0x3F;
            else if (win1Active && WindowContainsX(win1Left, win1Right, xpos))
                winMask[xpos] = (REG_WININ >> 8) & 0x3F;
            else
                winMask[xpos] = (REG_WINOUT & 0x3F) | WINMASK_WINOUT;
        }
    }

    PrefilterSprites(vcount);

    // layerIds tracks who wrote each pixel so alpha blend can find target-b
    static uint8_t layerIds[DISPLAY_WIDTH];
    bool needLayerIds = (blendMode != 0 || windowsEnabled);
    uint8_t *lids = needLayerIds ? layerIds : NULL;
    uint16_t *wmask = windowsEnabled ? winMask : NULL;

    if (needLayerIds)
        memset(layerIds, LAYER_BACKDROP, DISPLAY_WIDTH);

    // grab blend regs once per scanline
    unsigned int bldcnt = REG_BLDCNT;
    unsigned int bld_eva = REG_BLDALPHA & 0x1F;
    unsigned int bld_evb = (REG_BLDALPHA >> 8) & 0x1F;
    unsigned int bld_evy = REG_BLDY & 0x1F;

    // obj window pass -- these sprites modify the window mask, not the framebuffer
    if (windowsEnabled && (REG_DISPCNT & DISPCNT_OBJWIN_ON) && (REG_DISPCNT & DISPCNT_OBJ_ON)) {
        for (int pri = 0; pri < 4; pri++)
            DrawSpritesAtPriority(pri, vcount, pixels, lids, windowsEnabled, wmask, blendMode,
                                  /*objWinOnly=*/true, bldcnt, bld_eva, bld_evb, bld_evy);
    }

    // back-to-front: priority 3 first, 0 last (0 is topmost)
    for (int pri = 3; pri >= 0; pri--) {
        for (int sub = bgsByPriCount[pri] - 1; sub >= 0; sub--) {
            int bg = bgsByPri[pri][sub];
            if (!IsBGEnabled(bg))
                continue;

            if (!needLayerIds) {
                switch (mode) {
                    case 0:
                        RenderTextBG(bg, bgcnts[bg], *(uint16_t *)(REG_ADDR_BG0HOFS + bg * 4), *(uint16_t *)(REG_ADDR_BG0VOFS + bg * 4),
                                     vcount, pixels);
                        break;
                    case 1:
                        if (bg == 2)
                            RenderAffineBG(bg, bgcnts[bg], vcount, pixels);
                        else
                            RenderTextBG(bg, bgcnts[bg], *(uint16_t *)(REG_ADDR_BG0HOFS + bg * 4), *(uint16_t *)(REG_ADDR_BG0VOFS + bg * 4),
                                         vcount, pixels);
                        break;
                }
            } else {
                switch (mode) {
                    case 0:
                        RenderTextBGBlend(bg, bgcnts[bg], *(uint16_t *)(REG_ADDR_BG0HOFS + bg * 4),
                                          *(uint16_t *)(REG_ADDR_BG0VOFS + bg * 4), vcount, pixels, lids, blendMode, windowsEnabled, wmask,
                                          bldcnt, bld_eva, bld_evb, bld_evy);
                        break;
                    case 1:
                        if (bg == 2)
                            RenderAffineBGBlend(bg, bgcnts[bg], vcount, pixels, lids, blendMode, windowsEnabled, wmask, bldcnt, bld_eva,
                                                bld_evb, bld_evy);
                        else
                            RenderTextBGBlend(bg, bgcnts[bg], *(uint16_t *)(REG_ADDR_BG0HOFS + bg * 4),
                                              *(uint16_t *)(REG_ADDR_BG0VOFS + bg * 4), vcount, pixels, lids, blendMode, windowsEnabled,
                                              wmask, bldcnt, bld_eva, bld_evb, bld_evy);
                        break;
                }
            }
        }

        if (REG_DISPCNT & DISPCNT_OBJ_ON)
            DrawSpritesAtPriority(pri, vcount, pixels, lids, windowsEnabled, wmask, blendMode,
                                  /*objWinOnly=*/false, bldcnt, bld_eva, bld_evb, bld_evy);
    }
}

void DrawFrame_Fast(uint16_t *pixels)
{
    for (int i = 0; i < DISPLAY_HEIGHT; i++) {
        uint16_t *scanline = &pixels[i * DISPLAY_WIDTH];

        REG_VCOUNT = i;
        if (((REG_DISPSTAT >> 8) & 0xFF) == REG_VCOUNT) {
            REG_DISPSTAT |= INTR_FLAG_VCOUNT;
            if (REG_DISPSTAT & DISPSTAT_VCOUNT_INTR)
                gIntrTable[INTR_INDEX_VCOUNT]();
        }

        Memset16(scanline, *(uint16_t *)PLTT, DISPLAY_WIDTH);
        DrawScanline(scanline, i);

        REG_DISPSTAT |= INTR_FLAG_HBLANK;
        RunDMAs(DMA_HBLANK);
        if (REG_DISPSTAT & DISPSTAT_HBLANK_INTR)
            gIntrTable[INTR_INDEX_HBLANK]();

        REG_DISPSTAT &= ~INTR_FLAG_HBLANK;
        REG_DISPSTAT &= ~INTR_FLAG_VCOUNT;
    }
}

#endif
