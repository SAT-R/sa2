#ifndef GUARD_SW_RENDERER_COMMON_H
#define GUARD_SW_RENDERER_COMMON_H

// shared color math for the gba ppu blend unit
// used by both the normal (multi-pass) and fast (single-pass) software renderers

#include "global.h"

#ifndef TILE_WIDTH
#define TILE_WIDTH 8
#endif
#define VRAM_VIEW_WIDTH  (32 * TILE_WIDTH)
#define VRAM_VIEW_HEIGHT (((VRAM_SIZE / TILE_SIZE_4BPP) / 32) * TILE_WIDTH)

extern void gpsp_draw_frame(uint16_t *framebuf);
extern void gpsp_draw_vram_view(uint16_t *framebuf);

#endif // GUARD_SW_RENDERER_COMMON_H
