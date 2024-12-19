/* unofficial gameplaySP kai
 *
 * Copyright (C) 2006 Exophase <exophase@gmail.com>
 * Copyright (C) 2007 takka <takka@tfact.net>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "global.h"
#include <string.h>

#define LIMIT_MAX(x, y) (((x) > (y)) ? (x) : (y))
#define LIMIT_MIN(x, y) (((x) < (y)) ? (x) : (y))
// #define LIMIT_MAX(input, maxout) __builtin_allegrex_min(input, maxout)

// #define LIMIT_MIN(input, minout) __builtin_allegrex_max(input, minout)

#define GBA_SCREEN_WIDTH  (240)
#define GBA_SCREEN_HEIGHT (160)
//#define GBA_SCREEN_WIDTH  (256)
//#define GBA_SCREEN_HEIGHT (256)
#define GBA_LINE_SIZE (256)

#define pIO_REG(val) (val)

void update_scanline(void);

void clear_texture(u16 color);

extern s32 affine_reference_x[2];
extern s32 affine_reference_y[2];

typedef void (*tile_render_function)(u32 layer_number, u32 start, u32 end, void *dest_ptr);
typedef void (*bitmap_render_function)(u32 start, u32 end, void *dest_ptr);

typedef struct {
    tile_render_function normal_render_base;
    tile_render_function normal_render_transparent;
    tile_render_function alpha_render_base;
    tile_render_function alpha_render_transparent;
    tile_render_function color16_render_base;
    tile_render_function color16_render_transparent;
    tile_render_function color32_render_base;
    tile_render_function color32_render_transparent;
} TileLayerRenderStruct;

typedef struct {
    bitmap_render_function normal_render;
} BitmapLayerRenderStruct;

void video_write_savestate(void);
void video_read_savestate(void);

#define render_scanline_dest_normal        u16
#define render_scanline_dest_alpha         u32
#define render_scanline_dest_alpha_obj     u32
#define render_scanline_dest_color16       u16
#define render_scanline_dest_color32       u32
#define render_scanline_dest_partial_alpha u32
#define render_scanline_dest_copy_tile     u16
#define render_scanline_dest_copy_bitmap   u16

#define ALIGN_DATA __attribute__((aligned(64)))

s32 ALIGN_DATA affine_reference_x[2];
s32 ALIGN_DATA affine_reference_y[2];

extern uint16_t gameImage[DISPLAY_WIDTH * DISPLAY_HEIGHT];

extern uint8_t EWRAM_START[EWRAM_SIZE];
extern uint8_t IWRAM_START[IWRAM_SIZE];
// TODO: REG_BASE needs to be u8, because of the address macro definitions
extern uint8_t REG_BASE[IO_SIZE];
extern uint16_t PLTT[PLTT_SIZE / sizeof(uint16_t)];
extern uint8_t VRAM[VRAM_SIZE];
extern uint16_t OAM[OAM_SIZE / 2];

typedef struct {
    u16 u, v;
    u16 x, y, z;
} Vertex;

typedef struct {
    u16 color;
    u16 x, y, z;
} VertexLineCol16;

typedef struct {
    u32 color;
    u16 x, y, z;
} VertexLineCol32;

// Map widths and heights
const u16 ALIGN_DATA map_widths[] = { 256, 512, 256, 512 };
// const u16 ALIGN_DATA map_heights[] = { 256, 256, 512, 512 };

const u8 ALIGN_DATA obj_width_table[] = { 8, 16, 32, 64, 16, 32, 32, 64, 8, 8, 16, 32 };

const u8 ALIGN_DATA obj_height_table[] = { 8, 16, 32, 64, 8, 8, 16, 32, 16, 32, 32, 64 };

u8 ALIGN_DATA obj_priority_list[5][160][128];
u8 ALIGN_DATA obj_priority_count[5][160];
u8 ALIGN_DATA obj_alpha_count[160];

u8 ALIGN_DATA layer_order[16];
u32 layer_count;

const u8 ALIGN_DATA active_layers[8] = { 0x1F, 0x17, 0x1C, 0x14, 0x14, 0x14, 0x00, 0x00 };

static void render_scanline_text_base_normal(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_transparent_normal(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_base_color16(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_transparent_color16(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_base_color32(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_transparent_color32(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_base_alpha(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_text_transparent_alpha(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_base_normal(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_transparent_normal(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_base_color16(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_transparent_color16(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_base_color32(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_transparent_color32(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_base_alpha(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_affine_transparent_alpha(u32 layer, u32 start, u32 end, void *scanline);
static void render_scanline_bitmap_mode3_normal(u32 start, u32 end, void *scanline);
static void render_scanline_bitmap_mode4_normal(u32 start, u32 end, void *scanline);
static void render_scanline_bitmap_mode5_normal(u32 start, u32 end, void *scanline);
static void render_scanline_obj_normal_1D(u32 priority, u32 start, u32 end, render_scanline_dest_normal *scanline);
static void render_scanline_obj_normal_2D(u32 priority, u32 start, u32 end, render_scanline_dest_normal *scanline);
static void render_scanline_obj_color16_1D(u32 priority, u32 start, u32 end, render_scanline_dest_color16 *scanline);
static void render_scanline_obj_color16_2D(u32 priority, u32 start, u32 end, render_scanline_dest_color16 *scanline);
static void render_scanline_obj_color32_1D(u32 priority, u32 start, u32 end, render_scanline_dest_color32 *scanline);
static void render_scanline_obj_color32_2D(u32 priority, u32 start, u32 end, render_scanline_dest_color32 *scanline);
static void render_scanline_obj_alpha_obj_1D(u32 priority, u32 start, u32 end, render_scanline_dest_alpha_obj *scanline);
static void render_scanline_obj_alpha_obj_2D(u32 priority, u32 start, u32 end, render_scanline_dest_alpha_obj *scanline);
static void render_scanline_obj_partial_alpha_1D(u32 priority, u32 start, u32 end, render_scanline_dest_partial_alpha *scanline);
static void render_scanline_obj_partial_alpha_2D(u32 priority, u32 start, u32 end, render_scanline_dest_partial_alpha *scanline);
static void render_scanline_obj_copy_tile_1D(u32 priority, u32 start, u32 end, render_scanline_dest_copy_tile *scanline);
static void render_scanline_obj_copy_tile_2D(u32 priority, u32 start, u32 end, render_scanline_dest_copy_tile *scanline);
static void render_scanline_obj_copy_bitmap_1D(u32 priority, u32 start, u32 end, render_scanline_dest_copy_bitmap *scanline);
static void render_scanline_obj_copy_bitmap_2D(u32 priority, u32 start, u32 end, render_scanline_dest_copy_bitmap *scanline);
static void fill_line_normal(u16 color, render_scanline_dest_normal *dest_ptr, u32 start, u32 end);
static void fill_line_alpha(u16 color, render_scanline_dest_alpha *dest_ptr, u32 start, u32 end);
static void fill_line_color16(u16 color, render_scanline_dest_color16 *dest_ptr, u32 start, u32 end);
static void fill_line_color32(u16 color, render_scanline_dest_color32 *dest_ptr, u32 start, u32 end);
static void expand_blend(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end);
static void expand_darken(u16 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end);
static void expand_brighten(u16 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end);
static void expand_darken_partial_alpha(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end);
static void expand_brighten_partial_alpha(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end);
static void render_scanline_tile(u16 *scanline, u16 dispcnt);
static void render_scanline_bitmap(u16 *scanline, u16 dispcnt);
static void render_scanline_window_tile(u16 *scanline, u16 dispcnt);
static void render_scanline_window_bitmap(u16 *scanline, u16 dispcnt);

static void render_scanline_conditional_tile(u32 start, u32 end, u16 *scanline, u8 enable_flags, u16 dispcnt, u16 bldcnt,
                                             TileLayerRenderStruct *layer_renderers);
static void render_scanline_conditional_bitmap(u32 start, u32 end, u16 *scanline, u8 enable_flags, u16 dispcnt, u16 bldcnt,
                                               BitmapLayerRenderStruct *layer_renderers);

static void order_obj(u8 video_mode);
static void order_layers(u8 layer_flags);

#define tile_lookup_palette_full(palette, source) current_pixel = palette[source]

#define tile_lookup_palette(palette, source) current_pixel = palette[source]

#define tile_expand_base_normal_mode4(index)                                                                                               \
    if (current_pixel != 0) {                                                                                                              \
        tile_lookup_palette(palette, current_pixel);                                                                                       \
        dest_ptr[index] = current_pixel;                                                                                                   \
    }

#define tile_expand_base_normal(index)                                                                                                     \
    tile_lookup_palette(palette, current_pixel);                                                                                           \
    dest_ptr[index] = current_pixel;

#define tile_expand_transparent_normal(index) tile_expand_base_normal(index)

#define tile_expand_copy(index) dest_ptr[index] = copy_ptr[index]

#define advance_dest_ptr_base(delta) dest_ptr += delta

#define advance_dest_ptr_transparent(delta) advance_dest_ptr_base(delta)

#define advance_dest_ptr_copy(delta)                                                                                                       \
    advance_dest_ptr_base(delta);                                                                                                          \
    copy_ptr += delta;

#define color_combine_mask_a(layer) ((pIO_REG(REG_BLDCNT) >> layer) & 0x01)

// For color blending operations, will create a mask that has in bit
// 10 if the layer is target B, and bit 9 if the layer is target A.

#define color_combine_mask(layer) ((color_combine_mask_a(layer) | ((pIO_REG(REG_BLDCNT) >> (layer + 7)) & 0x02)) << 9)

// For alpha blending renderers, draw the palette index (9bpp) and
// layer bits rather than the raw RGB. For the base this should write to
// the 32bit location directly.

#define tile_expand_base_alpha(index) dest_ptr[index] = current_pixel | pixel_combine

#define tile_expand_base_bg(index) dest_ptr[index] = bg_combine

// For layered (transparent) writes this should shift the "stack" and write
// to the bottom. This will preserve the topmost pixel and the most recent
// one.

#define tile_expand_transparent_alpha(index) dest_ptr[index] = (dest_ptr[index] << 16) | current_pixel | pixel_combine

// OBJ should only shift if the top isn't already OBJ
#define tile_expand_transparent_alpha_obj(index)                                                                                           \
    dest = dest_ptr[index];                                                                                                                \
    if ((dest & 0x00000100) != 0) {                                                                                                        \
        dest_ptr[index] = (dest & 0xFFFF0000) | current_pixel | pixel_combine;                                                             \
    } else {                                                                                                                               \
        dest_ptr[index] = (dest << 16) | current_pixel | pixel_combine;                                                                    \
    }

// For color effects that don't need to preserve the previous layer.
// The color32 version should be used with 32bit wide dest_ptr so as to be
// compatible with alpha combine on top of it.

#define tile_expand_base_color16(index) dest_ptr[index] = current_pixel | pixel_combine

#define tile_expand_transparent_color16(index) tile_expand_base_color16(index)

#define tile_expand_base_color32(index) tile_expand_base_color16(index)

#define tile_expand_transparent_color32(index) tile_expand_base_color16(index)

// Operations for isolation 8bpp pixels within 32bpp pixel blocks.

#define tile_8bpp_pixel_op_mask(op_param) current_pixel = current_pixels & 0xFF

#define tile_8bpp_pixel_op_shift_mask(shift) current_pixel = (current_pixels >> shift) & 0xFF

#define tile_8bpp_pixel_op_shift(shift) current_pixel = current_pixels >> shift

#define tile_8bpp_pixel_op_none(shift)

// Base should always draw raw in 8bpp mode; color 0 will be drawn where
// color 0 is.

#define tile_8bpp_draw_base_normal(index) tile_expand_base_normal(index)

#define tile_8bpp_draw_base_alpha(index)                                                                                                   \
    if (current_pixel != 0) {                                                                                                              \
        tile_expand_base_alpha(index);                                                                                                     \
    } else {                                                                                                                               \
        tile_expand_base_bg(index);                                                                                                        \
    }

#define tile_8bpp_draw_base_color16(index) tile_8bpp_draw_base_alpha(index)

#define tile_8bpp_draw_base_color32(index) tile_8bpp_draw_base_alpha(index)

#define tile_8bpp_draw_base(index, op, op_param, alpha_op)                                                                                 \
    tile_8bpp_pixel_op_##op(op_param);                                                                                                     \
    tile_8bpp_draw_base_##alpha_op(index);

// Transparent (layered) writes should only replace what is there if the
// pixel is not transparent (zero)

#define tile_8bpp_draw_transparent(index, op, op_param, alpha_op)                                                                          \
    tile_8bpp_pixel_op_##op(op_param);                                                                                                     \
    if (current_pixel != 0) {                                                                                                              \
        tile_expand_transparent_##alpha_op(index);                                                                                         \
    }

#define tile_8bpp_draw_copy(index, op, op_param, alpha_op)                                                                                 \
    tile_8bpp_pixel_op_##op(op_param);                                                                                                     \
    if (current_pixel != 0) {                                                                                                              \
        tile_expand_copy(index);                                                                                                           \
    }

// Get the current tile from the map in 8bpp mode

#define get_tile_8bpp()                                                                                                                    \
    current_tile = *map_ptr;                                                                                                               \
    tile_ptr = tile_base + ((current_tile & 0x3FF) * 64);

// Draw half of a tile in 8bpp mode, for base renderer

#define tile_8bpp_draw_four_noflip(index, combine_op, alpha_op)                                                                            \
    tile_8bpp_draw_##combine_op(index + 0, mask, 0, alpha_op);                                                                             \
    tile_8bpp_draw_##combine_op(index + 1, shift_mask, 8, alpha_op);                                                                       \
    tile_8bpp_draw_##combine_op(index + 2, shift_mask, 16, alpha_op);                                                                      \
    tile_8bpp_draw_##combine_op(index + 3, shift, 24, alpha_op);

// Like the above, but draws the half-tile horizontally flipped

#define tile_8bpp_draw_four_flip(index, combine_op, alpha_op)                                                                              \
    tile_8bpp_draw_##combine_op(index + 3, mask, 0, alpha_op);                                                                             \
    tile_8bpp_draw_##combine_op(index + 2, shift_mask, 8, alpha_op);                                                                       \
    tile_8bpp_draw_##combine_op(index + 1, shift_mask, 16, alpha_op);                                                                      \
    tile_8bpp_draw_##combine_op(index + 0, shift, 24, alpha_op);

#define tile_8bpp_draw_four_base(index, alpha_op, flip_op) tile_8bpp_draw_four_##flip_op(index, base, alpha_op)

// Draw half of a tile in 8bpp mode, for transparent renderer; as an
// optimization the entire thing is checked against zero (in transparent
// capable renders it is more likely for the pixels to be transparent than
// opaque)

#define tile_8bpp_draw_four_transparent(index, alpha_op, flip_op)                                                                          \
    if (current_pixels != 0) {                                                                                                             \
        tile_8bpp_draw_four_##flip_op(index, transparent, alpha_op);                                                                       \
    }

#define tile_8bpp_draw_four_copy(index, alpha_op, flip_op)                                                                                 \
    if (current_pixels != 0) {                                                                                                             \
        tile_8bpp_draw_four_##flip_op(index, copy, alpha_op);                                                                              \
    }

// Helper macro for drawing 8bpp tiles clipped against the edge of the screen

#define partial_tile_8bpp(combine_op, alpha_op)                                                                                            \
    for (i = 0; i < partial_tile_run; i++) {                                                                                               \
        tile_8bpp_draw_##combine_op(0, mask, 0, alpha_op);                                                                                 \
        current_pixels >>= 8;                                                                                                              \
        advance_dest_ptr_##combine_op(1);                                                                                                  \
    }

// Draws 8bpp tiles clipped against the left side of the screen,
// partial_tile_offset indicates how much clipped in it is, partial_tile_run
// indicates how much it should draw.

#define partial_tile_right_noflip_8bpp(combine_op, alpha_op)                                                                               \
    if (partial_tile_offset >= 4) {                                                                                                        \
        current_pixels = *((u32 *)(tile_ptr + 4)) >> ((partial_tile_offset - 4) * 8);                                                      \
        partial_tile_8bpp(combine_op, alpha_op);                                                                                           \
    } else {                                                                                                                               \
        partial_tile_run -= 4;                                                                                                             \
        current_pixels = *((u32 *)tile_ptr) >> (partial_tile_offset * 8);                                                                  \
        partial_tile_8bpp(combine_op, alpha_op);                                                                                           \
        current_pixels = *((u32 *)(tile_ptr + 4));                                                                                         \
        tile_8bpp_draw_four_##combine_op(0, alpha_op, noflip);                                                                             \
        advance_dest_ptr_##combine_op(4);                                                                                                  \
    }

// Draws 8bpp tiles clipped against both the left and right side of the
// screen, IE, runs of less than 8 - partial_tile_offset.

#define partial_tile_mid_noflip_8bpp(combine_op, alpha_op)                                                                                 \
    if (partial_tile_offset >= 4) {                                                                                                        \
        current_pixels = *((u32 *)(tile_ptr + 4)) >> ((partial_tile_offset - 4) * 8);                                                      \
        partial_tile_8bpp(combine_op, alpha_op);                                                                                           \
    } else {                                                                                                                               \
        current_pixels = *((u32 *)tile_ptr) >> (partial_tile_offset * 8);                                                                  \
        if ((partial_tile_offset + partial_tile_run) > 4) {                                                                                \
            u32 old_run = partial_tile_run;                                                                                                \
            partial_tile_run = 4 - partial_tile_offset;                                                                                    \
            partial_tile_8bpp(combine_op, alpha_op);                                                                                       \
            partial_tile_run = old_run - partial_tile_run;                                                                                 \
            current_pixels = *((u32 *)(tile_ptr + 4));                                                                                     \
            partial_tile_8bpp(combine_op, alpha_op);                                                                                       \
        } else {                                                                                                                           \
            partial_tile_8bpp(combine_op, alpha_op);                                                                                       \
        }                                                                                                                                  \
    }

// Draws 8bpp tiles clipped against the right side of the screen,
// partial_tile_run indicates how much there is to draw.

#define partial_tile_left_noflip_8bpp(combine_op, alpha_op)                                                                                \
    if (partial_tile_run >= 4) {                                                                                                           \
        current_pixels = *((u32 *)tile_ptr);                                                                                               \
        tile_8bpp_draw_four_##combine_op(0, alpha_op, noflip);                                                                             \
        advance_dest_ptr_##combine_op(4);                                                                                                  \
        tile_ptr += 4;                                                                                                                     \
        partial_tile_run -= 4;                                                                                                             \
    }                                                                                                                                      \
    current_pixels = *((u32 *)(tile_ptr));                                                                                                 \
    partial_tile_8bpp(combine_op, alpha_op);

// Draws a non-clipped (complete) 8bpp tile.

#define tile_noflip_8bpp(combine_op, alpha_op)                                                                                             \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    tile_8bpp_draw_four_##combine_op(0, alpha_op, noflip);                                                                                 \
    current_pixels = *((u32 *)(tile_ptr + 4));                                                                                             \
    tile_8bpp_draw_four_##combine_op(4, alpha_op, noflip);

// Like the above versions but draws flipped tiles.

#define partial_tile_flip_8bpp(combine_op, alpha_op)                                                                                       \
    for (i = 0; i < partial_tile_run; i++) {                                                                                               \
        tile_8bpp_draw_##combine_op(0, shift, 24, alpha_op);                                                                               \
        current_pixels <<= 8;                                                                                                              \
        advance_dest_ptr_##combine_op(1);                                                                                                  \
    }

#define partial_tile_right_flip_8bpp(combine_op, alpha_op)                                                                                 \
    if (partial_tile_offset >= 4) {                                                                                                        \
        current_pixels = *((u32 *)tile_ptr) << ((partial_tile_offset - 4) * 8);                                                            \
        partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                      \
    } else {                                                                                                                               \
        partial_tile_run -= 4;                                                                                                             \
        current_pixels = *((u32 *)(tile_ptr + 4)) << ((partial_tile_offset - 4) * 8);                                                      \
        partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                      \
        current_pixels = *((u32 *)tile_ptr);                                                                                               \
        tile_8bpp_draw_four_##combine_op(0, alpha_op, flip);                                                                               \
        advance_dest_ptr_##combine_op(4);                                                                                                  \
    }

#define partial_tile_mid_flip_8bpp(combine_op, alpha_op)                                                                                   \
    if (partial_tile_offset >= 4) {                                                                                                        \
        current_pixels = *((u32 *)tile_ptr) << ((partial_tile_offset - 4) * 8);                                                            \
        partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                      \
    } else {                                                                                                                               \
        current_pixels = *((u32 *)(tile_ptr + 4)) << ((partial_tile_offset - 4) * 8);                                                      \
                                                                                                                                           \
        if ((partial_tile_offset + partial_tile_run) > 4) {                                                                                \
            u32 old_run = partial_tile_run;                                                                                                \
            partial_tile_run = 4 - partial_tile_offset;                                                                                    \
            partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                  \
            partial_tile_run = old_run - partial_tile_run;                                                                                 \
            current_pixels = *((u32 *)(tile_ptr));                                                                                         \
            partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                  \
        } else {                                                                                                                           \
            partial_tile_flip_8bpp(combine_op, alpha_op);                                                                                  \
        }                                                                                                                                  \
    }

#define partial_tile_left_flip_8bpp(combine_op, alpha_op)                                                                                  \
    if (partial_tile_run >= 4) {                                                                                                           \
        current_pixels = *((u32 *)(tile_ptr + 4));                                                                                         \
        tile_8bpp_draw_four_##combine_op(0, alpha_op, flip);                                                                               \
        advance_dest_ptr_##combine_op(4);                                                                                                  \
        tile_ptr -= 4;                                                                                                                     \
        partial_tile_run -= 4;                                                                                                             \
    }                                                                                                                                      \
    current_pixels = *((u32 *)(tile_ptr + 4));                                                                                             \
    partial_tile_flip_8bpp(combine_op, alpha_op);

#define tile_flip_8bpp(combine_op, alpha_op)                                                                                               \
    current_pixels = *((u32 *)(tile_ptr + 4));                                                                                             \
    tile_8bpp_draw_four_##combine_op(0, alpha_op, flip);                                                                                   \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    tile_8bpp_draw_four_##combine_op(4, alpha_op, flip);

// Operations for isolating 4bpp tiles in a 32bit block

#define tile_4bpp_pixel_op_mask(op_param) current_pixel = current_pixels & 0x0F

#define tile_4bpp_pixel_op_shift_mask(shift) current_pixel = (current_pixels >> shift) & 0x0F

#define tile_4bpp_pixel_op_shift(shift) current_pixel = current_pixels >> shift

#define tile_4bpp_pixel_op_none(op_param)

// Draws a single 4bpp pixel as base, normal renderer; checks to see if the
// pixel is zero because if so the current palette should not be applied.
// These ifs can be replaced with a lookup table, may or may not be superior
// this way, should be benchmarked. The lookup table would be from 0-255
// identity map except for multiples of 16, which would map to 0.

#define tile_4bpp_draw_base_normal(index)                                                                                                  \
    if (current_pixel != 0) {                                                                                                              \
        current_pixel |= current_palette;                                                                                                  \
        tile_expand_base_normal(index);                                                                                                    \
    } else {                                                                                                                               \
        tile_expand_base_normal(index);                                                                                                    \
    }

#define tile_4bpp_draw_base_alpha(index)                                                                                                   \
    if (current_pixel != 0) {                                                                                                              \
        current_pixel |= current_palette;                                                                                                  \
        tile_expand_base_alpha(index);                                                                                                     \
    } else {                                                                                                                               \
        tile_expand_base_bg(index);                                                                                                        \
    }

#define tile_4bpp_draw_base_color16(index) tile_4bpp_draw_base_alpha(index)

#define tile_4bpp_draw_base_color32(index) tile_4bpp_draw_base_alpha(index)

#define tile_4bpp_draw_base(index, op, op_param, alpha_op)                                                                                 \
    tile_4bpp_pixel_op_##op(op_param);                                                                                                     \
    tile_4bpp_draw_base_##alpha_op(index);

// Draws a single 4bpp pixel as layered, if not transparent.

#define tile_4bpp_draw_transparent(index, op, op_param, alpha_op)                                                                          \
    tile_4bpp_pixel_op_##op(op_param);                                                                                                     \
    if (current_pixel != 0) {                                                                                                              \
        current_pixel |= current_palette;                                                                                                  \
        tile_expand_transparent_##alpha_op(index);                                                                                         \
    }

#define tile_4bpp_draw_copy(index, op, op_param, alpha_op)                                                                                 \
    tile_4bpp_pixel_op_##op(op_param);                                                                                                     \
    if (current_pixel != 0) {                                                                                                              \
        current_pixel |= current_palette;                                                                                                  \
        tile_expand_copy(index);                                                                                                           \
    }

// Draws eight background pixels in transparent mode, for alpha or normal
// renderers.

#define tile_4bpp_draw_eight_base_zero(value)                                                                                              \
    dest_ptr[0] = value;                                                                                                                   \
    dest_ptr[1] = value;                                                                                                                   \
    dest_ptr[2] = value;                                                                                                                   \
    dest_ptr[3] = value;                                                                                                                   \
    dest_ptr[4] = value;                                                                                                                   \
    dest_ptr[5] = value;                                                                                                                   \
    dest_ptr[6] = value;                                                                                                                   \
    dest_ptr[7] = value;

// Draws eight background pixels for the alpha renderer, basically color zero
// with the background flag high.

#define tile_4bpp_draw_eight_base_zero_alpha() tile_4bpp_draw_eight_base_zero(bg_combine)

#define tile_4bpp_draw_eight_base_zero_color16() tile_4bpp_draw_eight_base_zero_alpha()

#define tile_4bpp_draw_eight_base_zero_color32() tile_4bpp_draw_eight_base_zero_alpha()

// Draws eight background pixels for the normal renderer, just a bunch of
// zeros.

#define tile_4bpp_draw_eight_base_zero_normal()                                                                                            \
    current_pixel = palette[0];                                                                                                            \
    tile_4bpp_draw_eight_base_zero(current_pixel);

// Draws eight 4bpp pixels.

#define tile_4bpp_draw_eight_noflip(combine_op, alpha_op)                                                                                  \
    tile_4bpp_draw_##combine_op(0, mask, 0, alpha_op);                                                                                     \
    tile_4bpp_draw_##combine_op(1, shift_mask, 4, alpha_op);                                                                               \
    tile_4bpp_draw_##combine_op(2, shift_mask, 8, alpha_op);                                                                               \
    tile_4bpp_draw_##combine_op(3, shift_mask, 12, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(4, shift_mask, 16, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(5, shift_mask, 20, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(6, shift_mask, 24, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(7, shift, 28, alpha_op);

// Draws eight 4bpp pixels in reverse order (for hflip).

#define tile_4bpp_draw_eight_flip(combine_op, alpha_op)                                                                                    \
    tile_4bpp_draw_##combine_op(7, mask, 0, alpha_op);                                                                                     \
    tile_4bpp_draw_##combine_op(6, shift_mask, 4, alpha_op);                                                                               \
    tile_4bpp_draw_##combine_op(5, shift_mask, 8, alpha_op);                                                                               \
    tile_4bpp_draw_##combine_op(4, shift_mask, 12, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(3, shift_mask, 16, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(2, shift_mask, 20, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(1, shift_mask, 24, alpha_op);                                                                              \
    tile_4bpp_draw_##combine_op(0, shift, 28, alpha_op);

// Draws eight 4bpp pixels in base mode, checks if all are zero, if so draws
// the appropriate background pixels.

#define tile_4bpp_draw_eight_base(alpha_op, flip_op)                                                                                       \
    if (current_pixels != 0) {                                                                                                             \
        tile_4bpp_draw_eight_##flip_op(base, alpha_op);                                                                                    \
    } else {                                                                                                                               \
        tile_4bpp_draw_eight_base_zero_##alpha_op();                                                                                       \
    }

// Draws eight 4bpp pixels in transparent (layered) mode, checks if all are
// zero and if so draws nothing.

#define tile_4bpp_draw_eight_transparent(alpha_op, flip_op)                                                                                \
    if (current_pixels != 0) {                                                                                                             \
        tile_4bpp_draw_eight_##flip_op(transparent, alpha_op);                                                                             \
    }

#define tile_4bpp_draw_eight_copy(alpha_op, flip_op)                                                                                       \
    if (current_pixels != 0) {                                                                                                             \
        tile_4bpp_draw_eight_##flip_op(copy, alpha_op);                                                                                    \
    }

// Gets the current tile in 4bpp mode, also getting the current palette and
// the pixel block.

#define get_tile_4bpp()                                                                                                                    \
    current_tile = *map_ptr;                                                                                                               \
    current_palette = (current_tile >> 12) << 4;                                                                                           \
    tile_ptr = tile_base + ((current_tile & 0x3FF) * 32);

// Helper macro for drawing clipped 4bpp tiles.

#define partial_tile_4bpp(combine_op, alpha_op)                                                                                            \
    for (i = 0; i < partial_tile_run; i++) {                                                                                               \
        tile_4bpp_draw_##combine_op(0, mask, 0, alpha_op);                                                                                 \
        current_pixels >>= 4;                                                                                                              \
        advance_dest_ptr_##combine_op(1);                                                                                                  \
    }

// Draws a 4bpp tile clipped against the left edge of the screen.
// partial_tile_offset is how far in it's clipped, partial_tile_run is
// how many to draw.

#define partial_tile_right_noflip_4bpp(combine_op, alpha_op)                                                                               \
    current_pixels = *((u32 *)tile_ptr) >> (partial_tile_offset * 4);                                                                      \
    partial_tile_4bpp(combine_op, alpha_op);

// Draws a 4bpp tile clipped against both edges of the screen, same as right.

#define partial_tile_mid_noflip_4bpp(combine_op, alpha_op) partial_tile_right_noflip_4bpp(combine_op, alpha_op)

// Draws a 4bpp tile clipped against the right edge of the screen.
// partial_tile_offset is how many to draw.

#define partial_tile_left_noflip_4bpp(combine_op, alpha_op)                                                                                \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    partial_tile_4bpp(combine_op, alpha_op);

// Draws a complete 4bpp tile row (not clipped)
#define tile_noflip_4bpp(combine_op, alpha_op)                                                                                             \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    tile_4bpp_draw_eight_##combine_op(alpha_op, noflip);

// Like the above, but draws flipped tiles.

#define partial_tile_flip_4bpp(combine_op, alpha_op)                                                                                       \
    for (i = 0; i < partial_tile_run; i++) {                                                                                               \
        tile_4bpp_draw_##combine_op(0, shift, 28, alpha_op);                                                                               \
        current_pixels <<= 4;                                                                                                              \
        advance_dest_ptr_##combine_op(1);                                                                                                  \
    }

#define partial_tile_right_flip_4bpp(combine_op, alpha_op)                                                                                 \
    current_pixels = *((u32 *)tile_ptr) << (partial_tile_offset * 4);                                                                      \
    partial_tile_flip_4bpp(combine_op, alpha_op);

#define partial_tile_mid_flip_4bpp(combine_op, alpha_op) partial_tile_right_flip_4bpp(combine_op, alpha_op)

#define partial_tile_left_flip_4bpp(combine_op, alpha_op)                                                                                  \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    partial_tile_flip_4bpp(combine_op, alpha_op)

#define tile_flip_4bpp(combine_op, alpha_op)                                                                                               \
    current_pixels = *((u32 *)tile_ptr);                                                                                                   \
    tile_4bpp_draw_eight_##combine_op(alpha_op, flip);

// Draws a single (partial or complete) tile from the tilemap, flipping
// as necessary.

#define single_tile_map(tile_type, combine_op, color_depth, alpha_op)                                                                      \
    get_tile_##color_depth();                                                                                                              \
    if ((current_tile & 0x800) != 0) {                                                                                                     \
        tile_ptr += vertical_pixel_flip;                                                                                                   \
    }                                                                                                                                      \
                                                                                                                                           \
    if ((current_tile & 0x400) != 0) {                                                                                                     \
        tile_type##_flip_##color_depth(combine_op, alpha_op);                                                                              \
    } else {                                                                                                                               \
        tile_type##_noflip_##color_depth(combine_op, alpha_op);                                                                            \
    }

// Draws multiple sequential tiles from the tilemap, hflips and vflips as
// necessary.

#define multiple_tile_map(combine_op, color_depth, alpha_op)                                                                               \
    for (i = 0; i < tile_run; i++) {                                                                                                       \
        single_tile_map(tile, combine_op, color_depth, alpha_op);                                                                          \
        advance_dest_ptr_##combine_op(8);                                                                                                  \
        map_ptr++;                                                                                                                         \
    }

// Draws a partial tile from a tilemap clipped against the left edge of the
// screen.

#define partial_tile_right_map(combine_op, color_depth, alpha_op)                                                                          \
    single_tile_map(partial_tile_right, combine_op, color_depth, alpha_op);                                                                \
    map_ptr++;

// Draws a partial tile from a tilemap clipped against both edges of the
// screen.

#define partial_tile_mid_map(combine_op, color_depth, alpha_op) single_tile_map(partial_tile_mid, combine_op, color_depth, alpha_op)

// Draws a partial tile from a tilemap clipped against the right edge of the
// screen.

#define partial_tile_left_map(combine_op, color_depth, alpha_op) single_tile_map(partial_tile_left, combine_op, color_depth, alpha_op)

// Byte lengths of complete tiles and tile rows in 4bpp and 8bpp.

#define tile_size_4bpp 32
#define tile_size_8bpp 64

#define tile_width_4bpp 4
#define tile_width_8bpp 8

// Advances a non-flipped 4bpp obj to the next tile.

#define obj_advance_noflip_4bpp() obj_tile_offset += tile_size_4bpp

// Advances a non-flipped 8bpp obj to the next tile.

#define obj_advance_noflip_8bpp() obj_tile_offset += tile_size_8bpp

// Advances a flipped 4bpp obj to the next tile.

#define obj_advance_flip_4bpp() obj_tile_offset -= tile_size_4bpp

// Advances a flipped 8bpp obj to the next tile.

#define obj_advance_flip_8bpp() obj_tile_offset -= tile_size_8bpp

// Draws multiple sequential tiles from an obj, flip_op determines if it should
// be flipped or not (set to flip or noflip)

#define multiple_tile_obj(combine_op, color_depth, alpha_op, flip_op)                                                                      \
    for (i = 0; i < tile_run; i++) {                                                                                                       \
        obj_tile_offset &= 0x7FFF;                                                                                                         \
        tile_ptr = obj_tile_base + obj_tile_offset;                                                                                        \
        tile_##flip_op##_##color_depth(combine_op, alpha_op);                                                                              \
        obj_advance_##flip_op##_##color_depth();                                                                                           \
        advance_dest_ptr_##combine_op(8);                                                                                                  \
    }

// Draws an obj's tile clipped against the left side of the screen

#define partial_tile_right_obj(combine_op, color_depth, alpha_op, flip_op)                                                                 \
    obj_tile_offset &= 0x7FFF;                                                                                                             \
    tile_ptr = obj_tile_base + obj_tile_offset;                                                                                            \
    partial_tile_right_##flip_op##_##color_depth(combine_op, alpha_op);                                                                    \
    obj_advance_##flip_op##_##color_depth();

// Draws an obj's tile clipped against both sides of the screen

#define partial_tile_mid_obj(combine_op, color_depth, alpha_op, flip_op)                                                                   \
    obj_tile_offset &= 0x7FFF;                                                                                                             \
    tile_ptr = obj_tile_base + obj_tile_offset;                                                                                            \
    partial_tile_mid_##flip_op##_##color_depth(combine_op, alpha_op);

// Draws an obj's tile clipped against the right side of the screen

#define partial_tile_left_obj(combine_op, color_depth, alpha_op, flip_op)                                                                  \
    obj_tile_offset &= 0x7FFF;                                                                                                             \
    tile_ptr = obj_tile_base + obj_tile_offset;                                                                                            \
    partial_tile_left_##flip_op##_##color_depth(combine_op, alpha_op);

// Extra variables specific for 8bpp/4bpp tile renderers.

#define tile_extra_variables_8bpp()

#define tile_extra_variables_4bpp() u32 current_palette

// Render a single scanline of text tiles

#define tile_render(color_depth, combine_op, alpha_op)                                                                                     \
    {                                                                                                                                      \
        u32 vertical_pixel_offset = (vertical_offset % 8) * tile_width_##color_depth;                                                      \
        u32 vertical_pixel_flip = ((tile_size_##color_depth - tile_width_##color_depth) - vertical_pixel_offset) - vertical_pixel_offset;  \
        tile_extra_variables_##color_depth();                                                                                              \
        u8 *tile_base = VRAM + ((((bg_control >> 2) & 0x03) * (1024 * 16)) + vertical_pixel_offset);                                       \
        u32 pixel_run = 256 - (horizontal_offset % 256);                                                                                   \
        u32 current_tile;                                                                                                                  \
                                                                                                                                           \
        map_base += ((vertical_offset % 256) / 8) * 32;                                                                                    \
        partial_tile_offset = (horizontal_offset % 8);                                                                                     \
                                                                                                                                           \
        if (pixel_run >= end) {                                                                                                            \
            if (partial_tile_offset != 0) {                                                                                                \
                partial_tile_run = 8 - partial_tile_offset;                                                                                \
                if (end < partial_tile_run) {                                                                                              \
                    partial_tile_run = end;                                                                                                \
                    partial_tile_mid_map(combine_op, color_depth, alpha_op);                                                               \
                    return;                                                                                                                \
                } else {                                                                                                                   \
                    end -= partial_tile_run;                                                                                               \
                    partial_tile_right_map(combine_op, color_depth, alpha_op);                                                             \
                }                                                                                                                          \
            }                                                                                                                              \
                                                                                                                                           \
            tile_run = end / 8;                                                                                                            \
            multiple_tile_map(combine_op, color_depth, alpha_op);                                                                          \
                                                                                                                                           \
            partial_tile_run = end % 8;                                                                                                    \
                                                                                                                                           \
            if (partial_tile_run != 0) {                                                                                                   \
                partial_tile_left_map(combine_op, color_depth, alpha_op);                                                                  \
            }                                                                                                                              \
        } else {                                                                                                                           \
            if (partial_tile_offset != 0) {                                                                                                \
                partial_tile_run = 8 - partial_tile_offset;                                                                                \
                partial_tile_right_map(combine_op, color_depth, alpha_op);                                                                 \
            }                                                                                                                              \
                                                                                                                                           \
            tile_run = (pixel_run - partial_tile_run) / 8;                                                                                 \
            multiple_tile_map(combine_op, color_depth, alpha_op);                                                                          \
            map_ptr = second_ptr;                                                                                                          \
            end -= pixel_run;                                                                                                              \
            tile_run = end / 8;                                                                                                            \
            multiple_tile_map(combine_op, color_depth, alpha_op);                                                                          \
                                                                                                                                           \
            partial_tile_run = end % 8;                                                                                                    \
            if (partial_tile_run != 0) {                                                                                                   \
                partial_tile_left_map(combine_op, color_depth, alpha_op);                                                                  \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

// If rendering a scanline that is not a target A then there's no point in
// keeping what's underneath it because it can't blend with it.

#define render_scanline_skip_alpha(bg_type, combine_op)                                                                                    \
    if ((pixel_combine & 0x00000200) == 0) {                                                                                               \
        render_scanline_##bg_type##_##combine_op##_color32(layer, start, end, scanline);                                                   \
        return;                                                                                                                            \
    }

#define render_scanline_extra_variables_base_normal(bg_type) u16 *palette = PLTT

#define render_scanline_extra_variables_base_alpha(bg_type)                                                                                \
    u32 bg_combine = color_combine_mask(5);                                                                                                \
    u32 pixel_combine = color_combine_mask(layer) | (bg_combine << 16);                                                                    \
    render_scanline_skip_alpha(bg_type, base);

#define render_scanline_extra_variables_base_color()                                                                                       \
    u32 bg_combine = color_combine_mask(5);                                                                                                \
    u32 pixel_combine = color_combine_mask(layer);

#define render_scanline_extra_variables_base_color16(bg_type) render_scanline_extra_variables_base_color()

#define render_scanline_extra_variables_base_color32(bg_type) render_scanline_extra_variables_base_color()

#define render_scanline_extra_variables_transparent_normal(bg_type) render_scanline_extra_variables_base_normal(bg_type)

#define render_scanline_extra_variables_transparent_alpha(bg_type)                                                                         \
    u32 pixel_combine = color_combine_mask(layer);                                                                                         \
    render_scanline_skip_alpha(bg_type, transparent);

#define render_scanline_extra_variables_transparent_color() u32 pixel_combine = color_combine_mask(layer)

#define render_scanline_extra_variables_transparent_color16(bg_type) render_scanline_extra_variables_transparent_color()

#define render_scanline_extra_variables_transparent_color32(bg_type) render_scanline_extra_variables_transparent_color()

// Build text scanline rendering functions.

#define render_scanline_text_builder(combine_op, alpha_op)                                                                                 \
    static void render_scanline_text_##combine_op##_##alpha_op(u32 layer, u32 start, u32 end, void *scanline)                              \
    {                                                                                                                                      \
        render_scanline_extra_variables_##combine_op##_##alpha_op(text);                                                                   \
        u16 bg_control = pIO_REG(REG_BG0CNT + layer);                                                                                      \
        u32 map_size = (bg_control >> 14) & 0x03;                                                                                          \
        u32 map_width = map_widths[map_size];                                                                                              \
        /*u32 map_height = map_heights[map_size]; */                                                                                       \
        u16 horizontal_offset = (pIO_REG(REG_BG0HOFS + (layer << 1)) + start) % 512;                                                       \
        u16 vertical_offset = (pIO_REG(REG_VCOUNT) + pIO_REG(REG_BG0VOFS + (layer << 1))) % 512;                                           \
        u32 current_pixel;                                                                                                                 \
        u32 current_pixels;                                                                                                                \
        u32 partial_tile_run = 0;                                                                                                          \
        u32 partial_tile_offset;                                                                                                           \
        u32 tile_run;                                                                                                                      \
        u32 i;                                                                                                                             \
        render_scanline_dest_##alpha_op *dest_ptr = ((render_scanline_dest_##alpha_op *)scanline) + start;                                 \
                                                                                                                                           \
        u16 *map_base = (u16 *)(VRAM + (((bg_control >> 8) & 0x1F) * (1024 * 2)));                                                         \
        u16 *map_ptr, *second_ptr;                                                                                                         \
        u8 *tile_ptr;                                                                                                                      \
                                                                                                                                           \
        end -= start;                                                                                                                      \
                                                                                                                                           \
        if (((map_size & 0x02) != 0) && (vertical_offset >= 256)) {                                                                        \
            map_base += ((map_width / 8) * 32) + (((vertical_offset - 256) / 8) * 32);                                                     \
        } else {                                                                                                                           \
            map_base += ((vertical_offset % 256) / 8) * 32;                                                                                \
        }                                                                                                                                  \
                                                                                                                                           \
        if ((map_size & 0x01) != 0) {                                                                                                      \
            if (horizontal_offset >= 256) {                                                                                                \
                horizontal_offset -= 256;                                                                                                  \
                map_ptr = map_base + (32 * 32) + (horizontal_offset / 8);                                                                  \
                second_ptr = map_base;                                                                                                     \
            } else {                                                                                                                       \
                map_ptr = map_base + (horizontal_offset / 8);                                                                              \
                second_ptr = map_base + (32 * 32);                                                                                         \
            }                                                                                                                              \
        } else {                                                                                                                           \
            horizontal_offset %= 256;                                                                                                      \
            map_ptr = map_base + (horizontal_offset / 8);                                                                                  \
            second_ptr = map_base;                                                                                                         \
        }                                                                                                                                  \
                                                                                                                                           \
        if ((bg_control & 0x80) != 0) {                                                                                                    \
            tile_render(8bpp, combine_op, alpha_op);                                                                                       \
        } else {                                                                                                                           \
            tile_render(4bpp, combine_op, alpha_op);                                                                                       \
        }                                                                                                                                  \
    }

render_scanline_text_builder(base, normal);
render_scanline_text_builder(transparent, normal);
render_scanline_text_builder(base, color16);
render_scanline_text_builder(transparent, color16);
render_scanline_text_builder(base, color32);
render_scanline_text_builder(transparent, color32);
render_scanline_text_builder(base, alpha);
render_scanline_text_builder(transparent, alpha);

#define affine_render_bg_pixel_normal() current_pixel = PLTT[0]

#define affine_render_bg_pixel_alpha() current_pixel = bg_combine

#define affine_render_bg_pixel_color16() affine_render_bg_pixel_alpha()

#define affine_render_bg_pixel_color32() affine_render_bg_pixel_alpha()

#define affine_render_bg_pixel_base(alpha_op) affine_render_bg_pixel_##alpha_op()

#define affine_render_bg_pixel_transparent(alpha_op)

#define affine_render_bg_pixel_copy(alpha_op)

#define affine_render_bg_base(alpha_op) dest_ptr[0] = current_pixel

#define affine_render_bg_transparent(alpha_op)

#define affine_render_bg_copy(alpha_op)

#define affine_render_bg_remainder_base(alpha_op)                                                                                          \
    affine_render_bg_pixel_##alpha_op();                                                                                                   \
    for (; i < end; i++) {                                                                                                                 \
        affine_render_bg_base(alpha_op);                                                                                                   \
        advance_dest_ptr_base(1);                                                                                                          \
    }

#define affine_render_bg_remainder_transparent(alpha_op)

#define affine_render_bg_remainder_copy(alpha_op)

#define affine_render_next(combine_op)                                                                                                     \
    source_x += dx;                                                                                                                        \
    source_y += dy;                                                                                                                        \
    advance_dest_ptr_##combine_op(1);

#define affine_render_scale_offset()                                                                                                       \
    tile_base += (pixel_y % 8) * 8;                                                                                                        \
    map_base += (pixel_y / 8) << map_pitch;

#define affine_render_scale_pixel(combine_op, alpha_op)                                                                                    \
    map_offset = (pixel_x / 8);                                                                                                            \
    if (map_offset != last_map_offset) {                                                                                                   \
        tile_ptr = tile_base + (map_base[map_offset] * 64);                                                                                \
        last_map_offset = map_offset;                                                                                                      \
    }                                                                                                                                      \
    tile_ptr = tile_base + (map_base[(pixel_x / 8)] * 64);                                                                                 \
    current_pixel = tile_ptr[(pixel_x % 8)];                                                                                               \
    tile_8bpp_draw_##combine_op(0, none, 0, alpha_op);                                                                                     \
    affine_render_next(combine_op);

#define affine_render_scale(combine_op, alpha_op)                                                                                          \
    {                                                                                                                                      \
        pixel_y = source_y >> 8;                                                                                                           \
        u32 i = 0;                                                                                                                         \
        affine_render_bg_pixel_##combine_op(alpha_op);                                                                                     \
        if ((u32)pixel_y < (u32)width_height) {                                                                                            \
            affine_render_scale_offset();                                                                                                  \
            for (; i < end; i++) {                                                                                                         \
                pixel_x = source_x >> 8;                                                                                                   \
                                                                                                                                           \
                if ((u32)pixel_x < (u32)width_height)                                                                                      \
                    break;                                                                                                                 \
                                                                                                                                           \
                affine_render_bg_##combine_op(alpha_op);                                                                                   \
                affine_render_next(combine_op);                                                                                            \
            }                                                                                                                              \
                                                                                                                                           \
            for (; i < end; i++) {                                                                                                         \
                pixel_x = source_x >> 8;                                                                                                   \
                                                                                                                                           \
                if ((u32)pixel_x >= (u32)width_height)                                                                                     \
                    break;                                                                                                                 \
                                                                                                                                           \
                affine_render_scale_pixel(combine_op, alpha_op);                                                                           \
            }                                                                                                                              \
        }                                                                                                                                  \
        affine_render_bg_remainder_##combine_op(alpha_op);                                                                                 \
    }

#define affine_render_scale_wrap(combine_op, alpha_op)                                                                                     \
    {                                                                                                                                      \
        u32 wrap_mask = width_height - 1;                                                                                                  \
        pixel_y = (source_y >> 8) & wrap_mask;                                                                                             \
        if ((u32)pixel_y < (u32)width_height) {                                                                                            \
            affine_render_scale_offset();                                                                                                  \
            for (i = 0; i < end; i++) {                                                                                                    \
                pixel_x = (source_x >> 8) & wrap_mask;                                                                                     \
                affine_render_scale_pixel(combine_op, alpha_op);                                                                           \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define affine_render_rotate_pixel(combine_op, alpha_op)                                                                                   \
    map_offset = (pixel_x / 8) + ((pixel_y / 8) << map_pitch);                                                                             \
    if (map_offset != last_map_offset) {                                                                                                   \
        tile_ptr = tile_base + (map_base[map_offset] * 64);                                                                                \
        last_map_offset = map_offset;                                                                                                      \
    }                                                                                                                                      \
                                                                                                                                           \
    current_pixel = tile_ptr[(pixel_x % 8) + ((pixel_y % 8) * 8)];                                                                         \
    tile_8bpp_draw_##combine_op(0, none, 0, alpha_op);                                                                                     \
    affine_render_next(combine_op);

#define affine_render_rotate(combine_op, alpha_op)                                                                                         \
    {                                                                                                                                      \
        affine_render_bg_pixel_##combine_op(alpha_op);                                                                                     \
        for (i = 0; i < end; i++) {                                                                                                        \
            pixel_x = source_x >> 8;                                                                                                       \
            pixel_y = source_y >> 8;                                                                                                       \
                                                                                                                                           \
            if (((u32)pixel_x < (u32)width_height) && ((u32)pixel_y < (u32)width_height)) {                                                \
                break;                                                                                                                     \
            }                                                                                                                              \
            affine_render_bg_##combine_op(alpha_op);                                                                                       \
            affine_render_next(combine_op);                                                                                                \
        }                                                                                                                                  \
                                                                                                                                           \
        for (; i < end; i++) {                                                                                                             \
            pixel_x = source_x >> 8;                                                                                                       \
            pixel_y = source_y >> 8;                                                                                                       \
                                                                                                                                           \
            if (((u32)pixel_x >= (u32)width_height) || ((u32)pixel_y >= (u32)width_height)) {                                              \
                affine_render_bg_remainder_##combine_op(alpha_op);                                                                         \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            affine_render_rotate_pixel(combine_op, alpha_op);                                                                              \
        }                                                                                                                                  \
    }

#define affine_render_rotate_wrap(combine_op, alpha_op)                                                                                    \
    {                                                                                                                                      \
        u32 wrap_mask = width_height - 1;                                                                                                  \
        for (i = 0; i < end; i++) {                                                                                                        \
            pixel_x = (source_x >> 8) & wrap_mask;                                                                                         \
            pixel_y = (source_y >> 8) & wrap_mask;                                                                                         \
                                                                                                                                           \
            affine_render_rotate_pixel(combine_op, alpha_op);                                                                              \
        }                                                                                                                                  \
    }

// Build affine background renderers.

#define render_scanline_affine_builder(combine_op, alpha_op)                                                                               \
    static void render_scanline_affine_##combine_op##_##alpha_op(u32 layer, u32 start, u32 end, void *scanline)                            \
    {                                                                                                                                      \
        render_scanline_extra_variables_##combine_op##_##alpha_op(affine);                                                                 \
        u16 bg_control = pIO_REG(REG_BG0CNT + layer);                                                                                      \
        u32 current_pixel;                                                                                                                 \
        s32 source_x, source_y;                                                                                                            \
        /* u16 vcount = pIO_REG(REG_VCOUNT); */                                                                                            \
        u32 pixel_x, pixel_y;                                                                                                              \
        u32 layer_offset = (layer == 3) ? 1 : 0;                                                                                           \
        s32 dx, dy;                                                                                                                        \
        u32 map_size = (bg_control >> 14) & 0x03;                                                                                          \
        u32 width_height = 1 << (7 + map_size);                                                                                            \
        u32 map_pitch = map_size + 4;                                                                                                      \
        u8 *map_base = VRAM + (((bg_control >> 8) & 0x1F) * (1024 * 2));                                                                   \
        u8 *tile_base = VRAM + (((bg_control >> 2) & 0x03) * (1024 * 16));                                                                 \
        u8 *tile_ptr = NULL;                                                                                                               \
        u32 map_offset, last_map_offset = (u32)-1;                                                                                         \
        u32 i;                                                                                                                             \
        render_scanline_dest_##alpha_op *dest_ptr = ((render_scanline_dest_##alpha_op *)scanline) + start;                                 \
                                                                                                                                           \
        dx = *((s16 *)(REG_ADDR_BG2PA + (layer_offset << 3)));                                                                             \
        dy = *((s16 *)(REG_ADDR_BG2PC + (layer_offset << 3)));                                                                             \
        source_x = affine_reference_x[layer_offset] + (start * dx);                                                                        \
        source_y = affine_reference_y[layer_offset] + (start * dy);                                                                        \
                                                                                                                                           \
        end -= start;                                                                                                                      \
                                                                                                                                           \
        switch (((bg_control >> 12) & 0x02) | (dy != 0)) {                                                                                 \
            case 0x00:                                                                                                                     \
                affine_render_scale(combine_op, alpha_op);                                                                                 \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x01:                                                                                                                     \
                affine_render_rotate(combine_op, alpha_op);                                                                                \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x02:                                                                                                                     \
                affine_render_scale_wrap(combine_op, alpha_op);                                                                            \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x03:                                                                                                                     \
                affine_render_rotate_wrap(combine_op, alpha_op);                                                                           \
                break;                                                                                                                     \
        }                                                                                                                                  \
    }

render_scanline_affine_builder(base, normal);
render_scanline_affine_builder(transparent, normal);
render_scanline_affine_builder(base, color16);
render_scanline_affine_builder(transparent, color16);
render_scanline_affine_builder(base, color32);
render_scanline_affine_builder(transparent, color32);
render_scanline_affine_builder(base, alpha);
render_scanline_affine_builder(transparent, alpha);

#define bitmap_render_pixel_mode3(alpha_op) *dest_ptr = current_pixel

#define bitmap_render_pixel_mode4(alpha_op) tile_expand_base_##alpha_op##_mode4(0)

#define bitmap_render_pixel_mode5(alpha_op) bitmap_render_pixel_mode3(alpha_op)

#define bitmap_render_scale(type, alpha_op, width, height)                                                                                 \
    pixel_y = (source_y >> 8);                                                                                                             \
    if ((u32)pixel_y < (u32)height) {                                                                                                      \
        pixel_x = (source_x >> 8);                                                                                                         \
        src_ptr += pixel_y * width;                                                                                                        \
        if (dx == 0x100) {                                                                                                                 \
            if (pixel_x < 0) {                                                                                                             \
                end += pixel_x;                                                                                                            \
                dest_ptr -= pixel_x;                                                                                                       \
                pixel_x = 0;                                                                                                               \
            } else if (pixel_x > 0) {                                                                                                      \
                src_ptr += pixel_x;                                                                                                        \
            }                                                                                                                              \
                                                                                                                                           \
            if ((pixel_x + end) >= width) {                                                                                                \
                end = (width - pixel_x);                                                                                                   \
            }                                                                                                                              \
                                                                                                                                           \
            for (i = 0; (s32)i < (s32)end; i++) {                                                                                          \
                current_pixel = *src_ptr;                                                                                                  \
                bitmap_render_pixel_##type(alpha_op);                                                                                      \
                src_ptr++;                                                                                                                 \
                dest_ptr++;                                                                                                                \
            }                                                                                                                              \
        } else {                                                                                                                           \
            if ((u32)(source_y >> 8) < (u32)height) {                                                                                      \
                for (i = 0; i < end; i++) {                                                                                                \
                    pixel_x = (source_x >> 8);                                                                                             \
                                                                                                                                           \
                    if ((u32)pixel_x < (u32)width)                                                                                         \
                        break;                                                                                                             \
                                                                                                                                           \
                    source_x += dx;                                                                                                        \
                    dest_ptr++;                                                                                                            \
                }                                                                                                                          \
                                                                                                                                           \
                for (; i < end; i++) {                                                                                                     \
                    pixel_x = (source_x >> 8);                                                                                             \
                                                                                                                                           \
                    if ((u32)pixel_x >= (u32)width)                                                                                        \
                        break;                                                                                                             \
                                                                                                                                           \
                    current_pixel = src_ptr[pixel_x];                                                                                      \
                    bitmap_render_pixel_##type(alpha_op);                                                                                  \
                                                                                                                                           \
                    source_x += dx;                                                                                                        \
                    dest_ptr++;                                                                                                            \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define bitmap_render_rotate(type, alpha_op, width, height)                                                                                \
    for (i = 0; i < end; i++) {                                                                                                            \
        pixel_x = source_x >> 8;                                                                                                           \
        pixel_y = source_y >> 8;                                                                                                           \
                                                                                                                                           \
        if (((u32)pixel_x < (u32)width) && ((u32)pixel_y < (u32)height))                                                                   \
            break;                                                                                                                         \
                                                                                                                                           \
        source_x += dx;                                                                                                                    \
        source_y += dy;                                                                                                                    \
        dest_ptr++;                                                                                                                        \
    }                                                                                                                                      \
                                                                                                                                           \
    for (; i < end; i++) {                                                                                                                 \
        pixel_x = (source_x >> 8);                                                                                                         \
        pixel_y = (source_y >> 8);                                                                                                         \
                                                                                                                                           \
        if (((u32)pixel_x >= (u32)width) || ((u32)pixel_y >= (u32)height))                                                                 \
            break;                                                                                                                         \
                                                                                                                                           \
        current_pixel = src_ptr[pixel_x + (pixel_y * width)];                                                                              \
        bitmap_render_pixel_##type(alpha_op);                                                                                              \
                                                                                                                                           \
        source_x += dx;                                                                                                                    \
        source_y += dy;                                                                                                                    \
        dest_ptr++;                                                                                                                        \
    }

#define render_scanline_VRAM_setup_mode3() u16 *src_ptr = (u16 *)VRAM

#define render_scanline_VRAM_setup_mode4()                                                                                                 \
    u16 *palette = PLTT;                                                                                                                   \
    u8 *src_ptr;                                                                                                                           \
    if ((pIO_REG(REG_DISPCNT) & 0x10) != 0) {                                                                                              \
        src_ptr = VRAM + 0xA000;                                                                                                           \
    } else {                                                                                                                               \
        src_ptr = VRAM;                                                                                                                    \
    }

#define render_scanline_VRAM_setup_mode5()                                                                                                 \
    u16 *src_ptr;                                                                                                                          \
    if ((pIO_REG(REG_DISPCNT) & 0x10) != 0) {                                                                                              \
        src_ptr = (u16 *)(VRAM + 0xA000);                                                                                                  \
    } else {                                                                                                                               \
        src_ptr = (u16 *)VRAM;                                                                                                             \
    }

// Build bitmap scanline rendering functions.

#define render_scanline_bitmap_builder(type, alpha_op, width, height)                                                                      \
    static void render_scanline_bitmap_##type##_##alpha_op(u32 start, u32 end, void *scanline)                                             \
    {                                                                                                                                      \
        /* u16 bg_control = pIO_REG(REG_BG2CNT); */                                                                                        \
        u32 current_pixel;                                                                                                                 \
        s32 source_x, source_y;                                                                                                            \
        /* u16 vcount = pIO_REG(REG_VCOUNT); */                                                                                            \
        s32 pixel_x, pixel_y;                                                                                                              \
                                                                                                                                           \
        s32 dx = REG_BG2PA;                                                                                                                \
        s32 dy = REG_BG2PC;                                                                                                                \
                                                                                                                                           \
        u32 i;                                                                                                                             \
                                                                                                                                           \
        render_scanline_dest_##alpha_op *dest_ptr = ((render_scanline_dest_##alpha_op *)scanline) + start;                                 \
        render_scanline_VRAM_setup_##type();                                                                                               \
                                                                                                                                           \
        end -= start;                                                                                                                      \
                                                                                                                                           \
        source_x = affine_reference_x[0] + (start * dx);                                                                                   \
        source_y = affine_reference_y[0] + (start * dy);                                                                                   \
                                                                                                                                           \
        if (dy == 0) {                                                                                                                     \
            bitmap_render_scale(type, alpha_op, width, height);                                                                            \
        } else {                                                                                                                           \
            bitmap_render_rotate(type, alpha_op, width, height);                                                                           \
        }                                                                                                                                  \
    }

render_scanline_bitmap_builder(mode3, normal, 240, 160);
render_scanline_bitmap_builder(mode4, normal, 240, 160);
render_scanline_bitmap_builder(mode5, normal, 160, 128);

// Fill in the renderers for a layer based on the mode type,

#define tile_layer_render_functions(type)                                                                                                  \
    {                                                                                                                                      \
        render_scanline_##type##_base_normal, render_scanline_##type##_transparent_normal, render_scanline_##type##_base_alpha,            \
            render_scanline_##type##_transparent_alpha, render_scanline_##type##_base_color16,                                             \
            render_scanline_##type##_transparent_color16, render_scanline_##type##_base_color32,                                           \
            render_scanline_##type##_transparent_color32                                                                                   \
    }

// Use if a layer is unsupported for that mode.

#define tile_layer_render_null()                                                                                                           \
    {                                                                                                                                      \
        NULL, NULL, NULL, NULL                                                                                                             \
    }

#define bitmap_layer_render_functions(type)                                                                                                \
    {                                                                                                                                      \
        render_scanline_bitmap_##type##_normal                                                                                             \
    }

// Structs containing functions to render the layers for each mode, for
// each render type.
TileLayerRenderStruct tile_mode_renderers[3][4] = { { tile_layer_render_functions(text), tile_layer_render_functions(text),
                                                      tile_layer_render_functions(text), tile_layer_render_functions(text) },
                                                    { tile_layer_render_functions(text), tile_layer_render_functions(text),
                                                      tile_layer_render_functions(affine), tile_layer_render_functions(text) },
                                                    { tile_layer_render_functions(text), tile_layer_render_functions(text),
                                                      tile_layer_render_functions(affine), tile_layer_render_functions(affine) } };

BitmapLayerRenderStruct bitmap_mode_renderers[3]
    = { bitmap_layer_render_functions(mode3), bitmap_layer_render_functions(mode4), bitmap_layer_render_functions(mode5) };

#define render_scanline_layer_functions_tile() TileLayerRenderStruct *layer_renderers = tile_mode_renderers[dispcnt & 0x07]

#define render_scanline_layer_functions_bitmap() BitmapLayerRenderStruct *layer_renderers = bitmap_mode_renderers + ((dispcnt & 0x07) - 3)

#define obj_tile_number_1D_4bpp ((obj_attribute_2 & 0x3FF) * 32)

#define obj_tile_number_2D_4bpp obj_tile_number_1D_4bpp

#define obj_tile_number_1D_8bpp obj_tile_number_1D_4bpp

#define obj_tile_number_2D_8bpp ((obj_attribute_2 & 0x3Fe) * 32)

// Adjust a flipped obj's starting position

#define obj_tile_offset_noflip(color_depth) 0

#define obj_tile_offset_flip(color_depth) (tile_size_##color_depth * ((obj_width - 8) / 8))

// Adjust the obj's starting point if it goes too far off the left edge of
// the screen.

#define obj_tile_right_offset_noflip(color_depth) obj_tile_offset += (partial_tile_offset / 8) * tile_size_##color_depth

#define obj_tile_right_offset_flip(color_depth) obj_tile_offset -= (partial_tile_offset / 8) * tile_size_##color_depth

// Get the current row offset into an obj in 1D map space

#define obj_tile_offset_1D(color_depth, flip_op)                                                                                           \
    obj_tile_offset = obj_tile_number_1D_##color_depth + ((vertical_offset / 8) * (obj_width / 8) * tile_size_##color_depth)               \
        + ((vertical_offset % 8) * tile_width_##color_depth) + obj_tile_offset_##flip_op(color_depth)

// Get the current row offset into an obj in 2D map space

#define obj_tile_offset_2D(color_depth, flip_op)                                                                                           \
    obj_tile_offset = obj_tile_number_2D_##color_depth + ((vertical_offset / 8) * 1024)                                                    \
        + ((vertical_offset % 8) * tile_width_##color_depth) + obj_tile_offset_##flip_op(color_depth)

// Get the palette for 4bpp obj.

#define obj_get_palette_4bpp() current_palette = (obj_attribute_2 >> 8) & 0xF0

#define obj_get_palette_8bpp()

// Render the current row of an obj.

#define obj_render(combine_op, color_depth, alpha_op, map_space, flip_op)                                                                  \
    {                                                                                                                                      \
        u32 obj_tile_offset;                                                                                                               \
                                                                                                                                           \
        obj_get_palette_##color_depth();                                                                                                   \
        obj_tile_offset_##map_space(color_depth, flip_op);                                                                                 \
                                                                                                                                           \
        if (obj_x < (s32)start) {                                                                                                          \
            dest_ptr = scanline + start;                                                                                                   \
            pixel_run = obj_width - (start - obj_x);                                                                                       \
            if ((s32)pixel_run > 0) {                                                                                                      \
                if ((obj_x + obj_width) >= end) {                                                                                          \
                    pixel_run = end - start;                                                                                               \
                    partial_tile_offset = start - obj_x;                                                                                   \
                    obj_tile_right_offset_##flip_op(color_depth);                                                                          \
                    partial_tile_offset %= 8;                                                                                              \
                                                                                                                                           \
                    if (partial_tile_offset != 0) {                                                                                        \
                        partial_tile_run = 8 - partial_tile_offset;                                                                        \
                        if ((s32)pixel_run < (s32)partial_tile_run) {                                                                      \
                            if ((s32)pixel_run > 0) {                                                                                      \
                                partial_tile_run = pixel_run;                                                                              \
                                partial_tile_mid_obj(combine_op, color_depth, alpha_op, flip_op);                                          \
                            }                                                                                                              \
                            continue;                                                                                                      \
                        } else {                                                                                                           \
                            pixel_run -= partial_tile_run;                                                                                 \
                            partial_tile_right_obj(combine_op, color_depth, alpha_op, flip_op);                                            \
                        }                                                                                                                  \
                    }                                                                                                                      \
                    tile_run = pixel_run / 8;                                                                                              \
                    multiple_tile_obj(combine_op, color_depth, alpha_op, flip_op);                                                         \
                    partial_tile_run = pixel_run % 8;                                                                                      \
                    if (partial_tile_run != 0) {                                                                                           \
                        partial_tile_left_obj(combine_op, color_depth, alpha_op, flip_op);                                                 \
                    }                                                                                                                      \
                } else {                                                                                                                   \
                    partial_tile_offset = start - obj_x;                                                                                   \
                    obj_tile_right_offset_##flip_op(color_depth);                                                                          \
                    partial_tile_offset %= 8;                                                                                              \
                    if (partial_tile_offset != 0) {                                                                                        \
                        partial_tile_run = 8 - partial_tile_offset;                                                                        \
                        partial_tile_right_obj(combine_op, color_depth, alpha_op, flip_op);                                                \
                    }                                                                                                                      \
                    tile_run = pixel_run / 8;                                                                                              \
                    multiple_tile_obj(combine_op, color_depth, alpha_op, flip_op);                                                         \
                }                                                                                                                          \
            }                                                                                                                              \
        } else {                                                                                                                           \
            if ((obj_x + obj_width) >= end) {                                                                                              \
                pixel_run = end - obj_x;                                                                                                   \
                if ((s32)pixel_run > 0) {                                                                                                  \
                    dest_ptr = scanline + obj_x;                                                                                           \
                    tile_run = pixel_run / 8;                                                                                              \
                    multiple_tile_obj(combine_op, color_depth, alpha_op, flip_op);                                                         \
                    partial_tile_run = pixel_run % 8;                                                                                      \
                    if (partial_tile_run != 0) {                                                                                           \
                        partial_tile_left_obj(combine_op, color_depth, alpha_op, flip_op);                                                 \
                    }                                                                                                                      \
                }                                                                                                                          \
            } else {                                                                                                                       \
                dest_ptr = scanline + obj_x;                                                                                               \
                tile_run = obj_width / 8;                                                                                                  \
                multiple_tile_obj(combine_op, color_depth, alpha_op, flip_op);                                                             \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define obj_scale_offset_1D(color_depth)                                                                                                   \
    tile_ptr = obj_tile_base                                                                                                               \
        + ((obj_tile_number_1D_##color_depth + ((vertical_offset / 8) * (max_x / 8) * tile_size_##color_depth)                             \
            + ((vertical_offset % 8) * tile_width_##color_depth))                                                                          \
           & 0x7FFF)

// Get the current row offset into an obj in 2D map space

#define obj_scale_offset_2D(color_depth)                                                                                                   \
    tile_ptr = obj_tile_base                                                                                                               \
        + ((obj_tile_number_2D_##color_depth + ((vertical_offset / 8) * 1024) + ((vertical_offset % 8) * tile_width_##color_depth))        \
           & 0x7FFF)

#define obj_render_scale_pixel_4bpp(combine_op, alpha_op)                                                                                  \
    if ((tile_x & 0x01) != 0) {                                                                                                            \
        current_pixel = tile_ptr[tile_map_offset + ((tile_x >> 1) & 0x03)] >> 4;                                                           \
    } else {                                                                                                                               \
        current_pixel = tile_ptr[tile_map_offset + ((tile_x >> 1) & 0x03)] & 0x0F;                                                         \
    }                                                                                                                                      \
                                                                                                                                           \
    tile_4bpp_draw_##combine_op(0, none, 0, alpha_op);

#define obj_render_scale_pixel_8bpp(combine_op, alpha_op)                                                                                  \
    current_pixel = tile_ptr[tile_map_offset + (tile_x & 0x07)];                                                                           \
    tile_8bpp_draw_##combine_op(0, none, 0, alpha_op);

#define obj_render_scale(combine_op, color_depth, alpha_op, map_space)                                                                     \
    {                                                                                                                                      \
        u32 vertical_offset;                                                                                                               \
        source_y += y_delta * dmy;                                                                                                         \
        vertical_offset = (source_y >> 8);                                                                                                 \
        if ((u32)vertical_offset < (u32)max_y) {                                                                                           \
            obj_scale_offset_##map_space(color_depth);                                                                                     \
            source_x += (y_delta * dmx) - (middle_x * dx);                                                                                 \
                                                                                                                                           \
            for (i = 0; i < obj_width; i++) {                                                                                              \
                tile_x = (source_x >> 8);                                                                                                  \
                                                                                                                                           \
                if ((u32)tile_x < (u32)max_x)                                                                                              \
                    break;                                                                                                                 \
                                                                                                                                           \
                source_x += dx;                                                                                                            \
                advance_dest_ptr_##combine_op(1);                                                                                          \
            }                                                                                                                              \
                                                                                                                                           \
            for (; i < obj_width; i++) {                                                                                                   \
                tile_x = (source_x >> 8);                                                                                                  \
                                                                                                                                           \
                if ((u32)tile_x >= (u32)max_x)                                                                                             \
                    break;                                                                                                                 \
                                                                                                                                           \
                tile_map_offset = (tile_x >> 3) * tile_size_##color_depth;                                                                 \
                obj_render_scale_pixel_##color_depth(combine_op, alpha_op);                                                                \
                                                                                                                                           \
                source_x += dx;                                                                                                            \
                advance_dest_ptr_##combine_op(1);                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define obj_rotate_offset_1D(color_depth) obj_tile_pitch = (max_x / 8) * tile_size_##color_depth

#define obj_rotate_offset_2D(color_depth) obj_tile_pitch = 1024

#define obj_render_rotate_pixel_4bpp(combine_op, alpha_op)                                                                                 \
    if ((tile_x & 0x01) != 0) {                                                                                                            \
        current_pixel = tile_ptr[tile_map_offset + ((tile_x >> 1) & 0x03) + ((tile_y & 0x07) * obj_pitch)] >> 4;                           \
    } else {                                                                                                                               \
        current_pixel = tile_ptr[tile_map_offset + ((tile_x >> 1) & 0x03) + ((tile_y & 0x07) * obj_pitch)] & 0x0F;                         \
    }                                                                                                                                      \
                                                                                                                                           \
    tile_4bpp_draw_##combine_op(0, none, 0, alpha_op);

#define obj_render_rotate_pixel_8bpp(combine_op, alpha_op)                                                                                 \
    current_pixel = tile_ptr[tile_map_offset + (tile_x & 0x07) + ((tile_y & 0x07) * obj_pitch)];                                           \
                                                                                                                                           \
    tile_8bpp_draw_##combine_op(0, none, 0, alpha_op);

#define obj_render_rotate(combine_op, color_depth, alpha_op, map_space)                                                                    \
    {                                                                                                                                      \
        tile_ptr = obj_tile_base + obj_tile_number_##map_space##_##color_depth;                                                            \
        obj_rotate_offset_##map_space(color_depth);                                                                                        \
                                                                                                                                           \
        source_x += (y_delta * dmx) - (middle_x * dx);                                                                                     \
        source_y += (y_delta * dmy) - (middle_x * dy);                                                                                     \
                                                                                                                                           \
        for (i = 0; i < obj_width; i++) {                                                                                                  \
            tile_x = (source_x >> 8);                                                                                                      \
            tile_y = (source_y >> 8);                                                                                                      \
                                                                                                                                           \
            if (((u32)tile_x < (u32)max_x) && ((u32)tile_y < (u32)max_y))                                                                  \
                break;                                                                                                                     \
                                                                                                                                           \
            source_x += dx;                                                                                                                \
            source_y += dy;                                                                                                                \
            advance_dest_ptr_##combine_op(1);                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        for (; i < obj_width; i++) {                                                                                                       \
            tile_x = (source_x >> 8);                                                                                                      \
            tile_y = (source_y >> 8);                                                                                                      \
                                                                                                                                           \
            if (((u32)tile_x >= (u32)max_x) || ((u32)tile_y >= (u32)max_y))                                                                \
                break;                                                                                                                     \
                                                                                                                                           \
            tile_map_offset = ((tile_x >> 3) * tile_size_##color_depth) + ((tile_y >> 3) * obj_tile_pitch);                                \
            obj_render_rotate_pixel_##color_depth(combine_op, alpha_op);                                                                   \
                                                                                                                                           \
            source_x += dx;                                                                                                                \
            source_y += dy;                                                                                                                \
            advance_dest_ptr_##combine_op(1);                                                                                              \
        }                                                                                                                                  \
    }

// Render the current row of an affine transformed OBJ.

#define obj_render_affine(combine_op, color_depth, alpha_op, map_space)                                                                    \
    {                                                                                                                                      \
        s16 *params = (s16 *)(OAM + (((obj_attribute_1 >> 9) & 0x1F) * 16));                                                               \
        s32 dx = params[3];                                                                                                                \
        s32 dmx = params[7];                                                                                                               \
        s32 dy = params[11];                                                                                                               \
        s32 dmy = params[15];                                                                                                              \
        s32 source_x, source_y;                                                                                                            \
        s32 tile_x, tile_y;                                                                                                                \
        /* u32 tile_offset; */                                                                                                             \
        u32 tile_map_offset;                                                                                                               \
        s32 middle_x;                                                                                                                      \
        s32 middle_y;                                                                                                                      \
        s32 max_x = obj_width;                                                                                                             \
        s32 max_y = obj_height;                                                                                                            \
        s32 y_delta;                                                                                                                       \
        u32 obj_pitch = tile_width_##color_depth;                                                                                          \
        u32 obj_tile_pitch;                                                                                                                \
                                                                                                                                           \
        middle_x = (obj_width >> 1);                                                                                                       \
        middle_y = (obj_height >> 1);                                                                                                      \
                                                                                                                                           \
        source_x = (middle_x << 8);                                                                                                        \
        source_y = (middle_y << 8);                                                                                                        \
                                                                                                                                           \
        if ((obj_attribute_0 & 0x200) != 0) {                                                                                              \
            obj_width <<= 1;                                                                                                               \
            obj_height <<= 1;                                                                                                              \
                                                                                                                                           \
            middle_x <<= 1;                                                                                                                \
            middle_y <<= 1;                                                                                                                \
        }                                                                                                                                  \
                                                                                                                                           \
        if ((s32)obj_x < (s32)start) {                                                                                                     \
            u32 x_delta = start - obj_x;                                                                                                   \
            middle_x -= x_delta;                                                                                                           \
            obj_width -= x_delta;                                                                                                          \
            obj_x = start;                                                                                                                 \
                                                                                                                                           \
            if ((s32)obj_width <= 0)                                                                                                       \
                continue;                                                                                                                  \
        }                                                                                                                                  \
                                                                                                                                           \
        if ((s32)(obj_x + obj_width) >= (s32)end) {                                                                                        \
            obj_width = end - obj_x;                                                                                                       \
                                                                                                                                           \
            if ((s32)obj_width <= 0)                                                                                                       \
                continue;                                                                                                                  \
        }                                                                                                                                  \
        dest_ptr = scanline + obj_x;                                                                                                       \
                                                                                                                                           \
        y_delta = vcount - (obj_y + middle_y);                                                                                             \
                                                                                                                                           \
        obj_get_palette_##color_depth();                                                                                                   \
                                                                                                                                           \
        if (dy == 0) {                                                                                                                     \
            obj_render_scale(combine_op, color_depth, alpha_op, map_space);                                                                \
        } else {                                                                                                                           \
            obj_render_rotate(combine_op, color_depth, alpha_op, map_space);                                                               \
        }                                                                                                                                  \
    }

// Build obj rendering functions

#define render_scanline_obj_extra_variables_normal(bg_type) u16 *palette = PLTT + 256

#define render_scanline_obj_extra_variables_color()                                                                                        \
    u32 dest;                                                                                                                              \
    u32 pixel_combine = color_combine_mask(4) | (1 << 8);

#define render_scanline_obj_extra_variables_color2() u32 pixel_combine = color_combine_mask(4) | (1 << 8);

#define render_scanline_obj_extra_variables_alpha_obj(map_space)                                                                           \
    render_scanline_obj_extra_variables_color();                                                                                           \
    if ((pixel_combine & 0x00000200) == 0) {                                                                                               \
        render_scanline_obj_color32_##map_space(priority, start, end, scanline);                                                           \
        return;                                                                                                                            \
    }

#define render_scanline_obj_extra_variables_color16(map_space) render_scanline_obj_extra_variables_color2()

#define render_scanline_obj_extra_variables_color32(map_space) render_scanline_obj_extra_variables_color2()

#define render_scanline_obj_extra_variables_partial_alpha(map_space)                                                                       \
    render_scanline_obj_extra_variables_color();                                                                                           \
    u32 base_pixel_combine = pixel_combine

#define render_scanline_obj_extra_variables_copy(type)                                                                                     \
    u16 bldcnt = pIO_REG(REG_BLDCNT);                                                                                                      \
    u16 dispcnt = pIO_REG(REG_DISPCNT);                                                                                                    \
    u8 obj_enable = pIO_REG(REG_WINOUT) >> 8;                                                                                              \
    render_scanline_layer_functions_##type();                                                                                              \
    u32 copy_start, copy_end;                                                                                                              \
    u16 ALIGN_DATA copy_buffer[240];                                                                                                       \
    u16 *copy_ptr;

#define render_scanline_obj_extra_variables_copy_tile(map_space) render_scanline_obj_extra_variables_copy(tile)

#define render_scanline_obj_extra_variables_copy_bitmap(map_space) render_scanline_obj_extra_variables_copy(bitmap)

#define render_scanline_obj_main(combine_op, alpha_op, map_space)                                                                          \
    if ((obj_attribute_0 & 0x100) != 0) {                                                                                                  \
        if (((obj_attribute_0 >> 13) & 0x01) != 0) {                                                                                       \
            obj_render_affine(combine_op, 8bpp, alpha_op, map_space);                                                                      \
        } else {                                                                                                                           \
            obj_render_affine(combine_op, 4bpp, alpha_op, map_space);                                                                      \
        }                                                                                                                                  \
    } else {                                                                                                                               \
        vertical_offset = vcount - obj_y;                                                                                                  \
                                                                                                                                           \
        if (((obj_attribute_1 >> 13) & 0x01) != 0) {                                                                                       \
            vertical_offset = obj_height - vertical_offset - 1;                                                                            \
        }                                                                                                                                  \
                                                                                                                                           \
        switch (((obj_attribute_0 >> 12) & 0x02) | ((obj_attribute_1 >> 12) & 0x01)) {                                                     \
            case 0x0:                                                                                                                      \
                obj_render(combine_op, 4bpp, alpha_op, map_space, noflip);                                                                 \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x1:                                                                                                                      \
                obj_render(combine_op, 4bpp, alpha_op, map_space, flip);                                                                   \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x2:                                                                                                                      \
                obj_render(combine_op, 8bpp, alpha_op, map_space, noflip);                                                                 \
                break;                                                                                                                     \
                                                                                                                                           \
            case 0x3:                                                                                                                      \
                obj_render(combine_op, 8bpp, alpha_op, map_space, flip);                                                                   \
                break;                                                                                                                     \
        }                                                                                                                                  \
    }

#define render_scanline_obj_no_partial_alpha(combine_op, alpha_op, map_space) render_scanline_obj_main(combine_op, alpha_op, map_space)

#define render_scanline_obj_partial_alpha(combine_op, alpha_op, map_space)                                                                 \
    if (((obj_attribute_0 >> 10) & 0x03) != 0) {                                                                                           \
        pixel_combine = 0x00000300;                                                                                                        \
        render_scanline_obj_main(combine_op, alpha_obj, map_space);                                                                        \
    } else {                                                                                                                               \
        pixel_combine = base_pixel_combine;                                                                                                \
        render_scanline_obj_main(combine_op, color32, map_space);                                                                          \
    }

#define render_scanline_obj_prologue_transparent(alpha_op)

#define render_scanline_obj_prologue_copy_body(type)                                                                                       \
    copy_start = obj_x;                                                                                                                    \
                                                                                                                                           \
    if ((obj_attribute_0 & 0x200) != 0)                                                                                                    \
        copy_end = obj_x + (obj_width << 1);                                                                                               \
    else                                                                                                                                   \
        copy_end = obj_x + obj_width;                                                                                                      \
                                                                                                                                           \
    if (copy_start < start)                                                                                                                \
        copy_start = start;                                                                                                                \
                                                                                                                                           \
    if (copy_end > end)                                                                                                                    \
        copy_end = end;                                                                                                                    \
                                                                                                                                           \
    if ((copy_start < end) && (copy_end > start)) {                                                                                        \
        render_scanline_conditional_##type(copy_start, copy_end, copy_buffer, obj_enable, dispcnt, bldcnt, layer_renderers);               \
        copy_ptr = copy_buffer + copy_start;                                                                                               \
    } else {                                                                                                                               \
        continue;                                                                                                                          \
    }

#define render_scanline_obj_prologue_copy_tile() render_scanline_obj_prologue_copy_body(tile)

#define render_scanline_obj_prologue_copy_bitmap() render_scanline_obj_prologue_copy_body(bitmap)

#define render_scanline_obj_prologue_copy(alpha_op) render_scanline_obj_prologue_##alpha_op()

#define render_scanline_obj_builder(combine_op, alpha_op, map_space, partial_alpha_op)                                                     \
    static void render_scanline_obj_##alpha_op##_##map_space(u32 priority, u32 start, u32 end, render_scanline_dest_##alpha_op *scanline)  \
    {                                                                                                                                      \
        render_scanline_obj_extra_variables_##alpha_op(map_space);                                                                         \
                                                                                                                                           \
        u32 obj_num, i;                                                                                                                    \
        u16 obj_size;                                                                                                                      \
        s32 obj_x, obj_y;                                                                                                                  \
        u32 obj_width, obj_height;                                                                                                         \
        u16 obj_attribute_0, obj_attribute_1, obj_attribute_2;                                                                             \
        u16 vcount = pIO_REG(REG_VCOUNT);                                                                                                  \
        u32 tile_run;                                                                                                                      \
        u32 current_pixels;                                                                                                                \
        u32 current_pixel;                                                                                                                 \
        u32 current_palette;                                                                                                               \
        u32 vertical_offset;                                                                                                               \
        u32 partial_tile_run, partial_tile_offset;                                                                                         \
        u32 pixel_run;                                                                                                                     \
        u16 *oam_ptr;                                                                                                                      \
        render_scanline_dest_##alpha_op *dest_ptr;                                                                                         \
        u8 *obj_tile_base = VRAM + 0x10000;                                                                                                \
        u8 *tile_ptr;                                                                                                                      \
        u8 obj_count = obj_priority_count[priority][vcount];                                                                               \
        u8 *obj_list = obj_priority_list[priority][vcount];                                                                                \
                                                                                                                                           \
        for (obj_num = 0; obj_num < obj_count; obj_num++) {                                                                                \
            oam_ptr = OAM + (obj_list[obj_num] * 4);                                                                                       \
            obj_attribute_0 = oam_ptr[0];                                                                                                  \
            obj_attribute_1 = oam_ptr[1];                                                                                                  \
            obj_attribute_2 = oam_ptr[2];                                                                                                  \
            obj_size = ((obj_attribute_0 >> 12) & 0x0C) | (obj_attribute_1 >> 14);                                                         \
                                                                                                                                           \
            obj_x = (s32)(obj_attribute_1 << 23) >> 23;                                                                                    \
            obj_width = obj_width_table[obj_size];                                                                                         \
                                                                                                                                           \
            render_scanline_obj_prologue_##combine_op(alpha_op);                                                                           \
                                                                                                                                           \
            obj_y = obj_attribute_0 & 0xFF;                                                                                                \
                                                                                                                                           \
            if (obj_y > 160) {                                                                                                             \
                obj_y -= 256;                                                                                                              \
            }                                                                                                                              \
            obj_height = obj_height_table[obj_size];                                                                                       \
            render_scanline_obj_##partial_alpha_op(combine_op, alpha_op, map_space);                                                       \
        }                                                                                                                                  \
    }

render_scanline_obj_builder(transparent, normal, 1D, no_partial_alpha);
render_scanline_obj_builder(transparent, normal, 2D, no_partial_alpha);
render_scanline_obj_builder(transparent, color16, 1D, no_partial_alpha);
render_scanline_obj_builder(transparent, color16, 2D, no_partial_alpha);
render_scanline_obj_builder(transparent, color32, 1D, no_partial_alpha);
render_scanline_obj_builder(transparent, color32, 2D, no_partial_alpha);
render_scanline_obj_builder(transparent, alpha_obj, 1D, no_partial_alpha);
render_scanline_obj_builder(transparent, alpha_obj, 2D, no_partial_alpha);
render_scanline_obj_builder(transparent, partial_alpha, 1D, partial_alpha);
render_scanline_obj_builder(transparent, partial_alpha, 2D, partial_alpha);
render_scanline_obj_builder(copy, copy_tile, 1D, no_partial_alpha);
render_scanline_obj_builder(copy, copy_tile, 2D, no_partial_alpha);
render_scanline_obj_builder(copy, copy_bitmap, 1D, no_partial_alpha);
render_scanline_obj_builder(copy, copy_bitmap, 2D, no_partial_alpha);

static void order_obj(u8 video_mode)
{
    s32 obj_num;
    s32 obj_x, obj_y, row;
    s32 obj_width, obj_height;
    u16 obj_size;
    u16 obj_priority, obj_mode;
    u16 obj_attribute_0, obj_attribute_1, obj_attribute_2;
    u16 current_count;
    u16 *oam_ptr = OAM + 508;

    memset(obj_priority_count, 0, 5 * 160);
    memset(obj_alpha_count, 0, 160);

    for (obj_num = 127; obj_num >= 0; obj_num--, oam_ptr -= 4) {
        obj_attribute_0 = oam_ptr[0];
        obj_attribute_1 = oam_ptr[1];
        obj_attribute_2 = oam_ptr[2];

        obj_size = obj_attribute_0 & 0xC000;

        if (obj_size == 0xC000) {
            obj_size = 0x0000;
            obj_attribute_1 &= 0x3FFF;
        }

        obj_mode = (obj_attribute_0 >> 10) & 0x03;

        if (obj_mode == 3)
            obj_mode = 0;

        if (((obj_attribute_0 & 0x0300) != 0x0200) && ((video_mode < 3) || ((obj_attribute_2 & 0x3FF) >= 512))) {
            obj_y = obj_attribute_0 & 0xFF;
            if (obj_y > 160)
                obj_y -= 256;

            obj_size = (obj_size >> 12) | (obj_attribute_1 >> 14);
            obj_priority = (obj_attribute_2 >> 10) & 0x03;
            obj_height = obj_height_table[obj_size];
            obj_width = (s32)obj_width_table[obj_size];

            if ((obj_attribute_0 & 0x200) != 0) {
                obj_height <<= 1;
                obj_width <<= 1;
            }

            if (((obj_y + obj_height) > 0) && (obj_y < 160)) {
                obj_x = (s32)(obj_attribute_1 << 23) >> 23;

                if (((obj_x + obj_width) > 0) && (obj_x < 240)) {
                    if (obj_y < 0) {
                        obj_height += obj_y;
                        obj_y = 0;
                    }

                    if ((obj_y + obj_height) >= 160) {
                        obj_height = 160 - obj_y;
                    }

                    if (obj_mode == 1) {
                        for (row = obj_y; row < obj_y + obj_height; row++) {
                            current_count = obj_priority_count[obj_priority][row];
                            obj_priority_list[obj_priority][row][current_count] = obj_num;
                            obj_priority_count[obj_priority][row] = current_count + 1;
                            obj_alpha_count[row] = 1;
                        }
                    } else {
                        if (obj_mode == 2)
                            obj_priority = 4;

                        for (row = obj_y; row < obj_y + obj_height; row++) {
                            current_count = obj_priority_count[obj_priority][row];
                            obj_priority_list[obj_priority][row][current_count] = obj_num;
                            obj_priority_count[obj_priority][row] = current_count + 1;
                        }
                    }
                }
            }
        }
    }
}

static void order_layers(u8 layer_flags)
{
    s32 priority, layer_number;
    layer_count = 0;

    for (priority = 3; priority >= 0; priority--) {
        for (layer_number = 3; layer_number >= 0; layer_number--) {
            if (((layer_flags >> layer_number) & 1) && ((pIO_REG(REG_BG0CNT + layer_number) & 0x03) == priority)) {
                layer_order[layer_count] = layer_number;
                layer_count++;
            }
        }

        if ((obj_priority_count[priority][pIO_REG(REG_VCOUNT)] > 0) && ((layer_flags & 0x10) != 0)) {
            layer_order[layer_count] = priority | 0x04;
            layer_count++;
        }
    }
}

#define fill_line(_start, _end)                                                                                                            \
    u32 i;                                                                                                                                 \
    for (i = _start; i < _end; i++) {                                                                                                      \
        dest_ptr[i] = color;                                                                                                               \
    }

#define fill_line_color_normal() color = PLTT[color]

#define fill_line_color_alpha()

#define fill_line_color_color16()

#define fill_line_color_color32()

#define fill_line_builder(type)                                                                                                            \
    static void fill_line_##type(u16 color, render_scanline_dest_##type *dest_ptr, u32 start, u32 end)                                     \
    {                                                                                                                                      \
        fill_line_color_##type();                                                                                                          \
        fill_line(start, end);                                                                                                             \
    }

fill_line_builder(normal);
fill_line_builder(alpha);
fill_line_builder(color16);
fill_line_builder(color32);

// Alpha blend two pixels (pixel_top and pixel_bottom).

#define blend_pixel()                                                                                                                      \
    pixel_bottom = PLTT[(pixel_pair >> 16) & 0x1FF];                                                                                       \
    pixel_bottom = (pixel_bottom | (pixel_bottom << 16)) & 0x03E07C1F;                                                                     \
    pixel_top = ((pixel_top * blend_a) + (pixel_bottom * blend_b)) >> 4;

// Alpha blend two pixels, allowing for saturation (individual channels > 31).
// The operation is optimized towards saturation not occuring.

#define blend_saturate_pixel()                                                                                                             \
    pixel_bottom = PLTT[(pixel_pair >> 16) & 0x1FF];                                                                                       \
    pixel_bottom = (pixel_bottom | (pixel_bottom << 16)) & 0x03E07C1F;                                                                     \
    pixel_top = ((pixel_top * blend_a) + (pixel_bottom * blend_b)) >> 4;                                                                   \
    if ((pixel_top & 0x04008020) != 0) {                                                                                                   \
        if ((pixel_top & 0x04000000) != 0) {                                                                                               \
            pixel_top |= 0x03E00000;                                                                                                       \
        }                                                                                                                                  \
        if ((pixel_top & 0x00008000) != 0) {                                                                                               \
            pixel_top |= 0x00007C00;                                                                                                       \
        }                                                                                                                                  \
        if ((pixel_top & 0x00000020) != 0) {                                                                                               \
            pixel_top |= 0x0000001F;                                                                                                       \
        }                                                                                                                                  \
    }

#define brighten_pixel() pixel_top = upper + ((pixel_top * blend) >> 4)

#define darken_pixel() pixel_top = (pixel_top * blend) >> 4

#define effect_condition_alpha ((pixel_pair & 0x04000200) == 0x04000200)

#define effect_condition_fade(pixel_source) ((pixel_source & 0x00000200) == 0x00000200)

#define expand_pixel_no_dest(expand_type, pixel_source)                                                                                    \
    pixel_top = (pixel_top | (pixel_top << 16)) & 0x03E07C1F;                                                                              \
    expand_type##_pixel();                                                                                                                 \
    pixel_top &= 0x03E07C1F;                                                                                                               \
    pixel_top = (pixel_top >> 16) | pixel_top;

#define expand_pixel(expand_type, pixel_source)                                                                                            \
    pixel_top = PLTT[pixel_source & 0x1FF];                                                                                                \
    expand_pixel_no_dest(expand_type, pixel_source);                                                                                       \
    *screen_dest_ptr = pixel_top;

#define expand_loop(expand_type, effect_condition, pixel_source)                                                                           \
    screen_src_ptr += start;                                                                                                               \
    screen_dest_ptr += start;                                                                                                              \
                                                                                                                                           \
    end -= start;                                                                                                                          \
                                                                                                                                           \
    for (i = 0; i < end; i++) {                                                                                                            \
        pixel_source = *screen_src_ptr;                                                                                                    \
        if (effect_condition != 0) {                                                                                                       \
            expand_pixel(expand_type, pixel_source);                                                                                       \
        } else {                                                                                                                           \
            *screen_dest_ptr = PLTT[pixel_source & 0x1FF];                                                                                 \
        }                                                                                                                                  \
                                                                                                                                           \
        screen_src_ptr++;                                                                                                                  \
        screen_dest_ptr++;                                                                                                                 \
    }

#define expand_loop_partial_alpha(alpha_expand, expand_type)                                                                               \
    screen_src_ptr += start;                                                                                                               \
    screen_dest_ptr += start;                                                                                                              \
                                                                                                                                           \
    end -= start;                                                                                                                          \
                                                                                                                                           \
    for (i = 0; i < end; i++) {                                                                                                            \
        pixel_pair = *screen_src_ptr;                                                                                                      \
        if (effect_condition_fade(pixel_pair) != 0) {                                                                                      \
            if (effect_condition_alpha != 0) {                                                                                             \
                expand_pixel(alpha_expand, pixel_pair);                                                                                    \
            } else {                                                                                                                       \
                expand_pixel(expand_type, pixel_pair);                                                                                     \
            }                                                                                                                              \
        } else {                                                                                                                           \
            *screen_dest_ptr = PLTT[pixel_pair & 0x1FF];                                                                                   \
        }                                                                                                                                  \
                                                                                                                                           \
        screen_src_ptr++;                                                                                                                  \
        screen_dest_ptr++;                                                                                                                 \
    }

#define expand_partial_alpha(expand_type)                                                                                                  \
    if ((blend_a + blend_b) > 16) {                                                                                                        \
        expand_loop_partial_alpha(blend_saturate, expand_type);                                                                            \
    } else {                                                                                                                               \
        expand_loop_partial_alpha(blend, expand_type);                                                                                     \
    }

// Blend top two pixels of scanline with each other.

#define expand_normal(screen_ptr, start, end)

static void expand_blend(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end)
{
    u32 pixel_pair;
    u32 pixel_top, pixel_bottom;
    u16 bldalpha = pIO_REG(REG_BLDALPHA);
    s32 blend_a = bldalpha & 0x1F;
    s32 blend_b = (bldalpha >> 8) & 0x1F;
    u32 i;

    blend_a = LIMIT_MAX(blend_a, 16);
    blend_b = LIMIT_MAX(blend_b, 16);

    // The individual colors can saturate over 31, this should be taken
    // care of in an alternate pass as it incurs a huge additional speedhit.
    if ((blend_a + blend_b) > 16) {
        expand_loop(blend_saturate, effect_condition_alpha, pixel_pair);
    } else {
        expand_loop(blend, effect_condition_alpha, pixel_pair);
    }
}

// Blend scanline with white.

static void expand_darken(u16 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end)
{
    u32 pixel_top;
    s32 blend = 16 - (pIO_REG(REG_BLDY) & 0x1F);
    u32 i;

    blend = LIMIT_MIN(blend, 0);

    expand_loop(darken, effect_condition_fade(pixel_top), pixel_top);
}

// Blend scanline with black.

static void expand_brighten(u16 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end)
{
    u32 pixel_top;
    s32 blend = pIO_REG(REG_BLDY) & 0x1F;
    u32 upper;
    u32 i;

    blend = LIMIT_MAX(blend, 16);

    upper = ((0x03E07C1F * blend) >> 4) & 0x03E07C1F;
    blend = 16 - blend;

    expand_loop(brighten, effect_condition_fade(pixel_top), pixel_top);
}

// Expand scanline such that if both top and bottom pass it's alpha,
// if only top passes it's as specified, and if neither pass it's normal.

static void expand_darken_partial_alpha(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end)
{
    s8 blend = 16 - (pIO_REG(REG_BLDY) & 0x1F);
    u32 pixel_pair;
    u32 pixel_top, pixel_bottom;
    u16 bldalpha = pIO_REG(REG_BLDALPHA);
    s32 blend_a = bldalpha & 0x1F;
    s32 blend_b = (bldalpha >> 8) & 0x1F;
    u32 i;

    blend = LIMIT_MIN(blend, 0);
    blend_a = LIMIT_MAX(blend_a, 16);
    blend_b = LIMIT_MAX(blend_b, 16);

    expand_partial_alpha(darken);
}

static void expand_brighten_partial_alpha(u32 *screen_src_ptr, u16 *screen_dest_ptr, u32 start, u32 end)
{
    s8 blend = pIO_REG(REG_BLDY) & 0x1F;
    u32 pixel_pair;
    u32 pixel_top, pixel_bottom;
    u16 bldalpha = pIO_REG(REG_BLDALPHA);
    s32 blend_a = bldalpha & 0x1F;
    s32 blend_b = (bldalpha >> 8) & 0x1F;
    u32 upper;
    u32 i;

    blend = LIMIT_MAX(blend, 16);

    upper = ((0x03E07C1F * blend) >> 4) & 0x03E07C1F;
    blend = 16 - blend;

    blend_a = LIMIT_MAX(blend_a, 16);
    blend_b = LIMIT_MAX(blend_b, 16);

    expand_partial_alpha(brighten);
}

// Render an OBJ layer from start to end, depending on the type (1D or 2D)
// stored in dispcnt.

#define render_obj_layer(type, dest, _start, _end)                                                                                         \
    current_layer &= ~0x04;                                                                                                                \
    if ((dispcnt & 0x40) != 0) {                                                                                                           \
        render_scanline_obj_##type##_1D(current_layer, _start, _end, dest);                                                                \
    } else {                                                                                                                               \
        render_scanline_obj_##type##_2D(current_layer, _start, _end, dest);                                                                \
    }

// Render a target all the way with the background color as taken from the
// palette.

#define fill_line_bg(type, dest, _start, _end) fill_line_##type(0, dest, _start, _end)

// Render all layers as they appear in the layer order.

#define render_layers(tile_alpha, obj_alpha, dest)                                                                                         \
    {                                                                                                                                      \
        current_layer = layer_order[0];                                                                                                    \
        if ((current_layer & 0x04) != 0) {                                                                                                 \
            /* If the first one is OBJ render the background then render it. */                                                            \
            fill_line_bg(tile_alpha, dest, 0, 240);                                                                                        \
            render_obj_layer(obj_alpha, dest, 0, 240);                                                                                     \
        } else {                                                                                                                           \
            /* Otherwise render a base layer. */                                                                                           \
            layer_renderers[current_layer].tile_alpha##_render_base(current_layer, 0, 240, dest);                                          \
        }                                                                                                                                  \
                                                                                                                                           \
        /* Render the rest of the layers. */                                                                                               \
        for (layer_order_pos = 1; layer_order_pos < layer_count; layer_order_pos++) {                                                      \
            current_layer = layer_order[layer_order_pos];                                                                                  \
            if ((current_layer & 0x04) != 0) {                                                                                             \
                render_obj_layer(obj_alpha, dest, 0, 240);                                                                                 \
            } else {                                                                                                                       \
                layer_renderers[current_layer].tile_alpha##_render_transparent(current_layer, 0, 240, dest);                               \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define render_condition_alpha                                                                                                             \
    (((pIO_REG(REG_BLDALPHA) & 0x1F1F) != 0x001F) && ((pIO_REG(REG_BLDCNT) & 0x003F) != 0) && ((pIO_REG(REG_BLDCNT) & 0x3F00) != 0))

#define render_condition_fade (((pIO_REG(REG_BLDY) & 0x1F) != 0) && ((pIO_REG(REG_BLDCNT) & 0x3F) != 0))

#define render_layers_color_effect(renderer, layer_condition, alpha_condition, fade_condition, _start, _end)                               \
    {                                                                                                                                      \
        if (layer_condition != 0) {                                                                                                        \
            if (obj_alpha_count[pIO_REG(REG_VCOUNT)] > 0) {                                                                                \
                /* Render based on special effects mode. */                                                                                \
                u32 ALIGN_DATA screen_buffer[240];                                                                                         \
                switch ((bldcnt >> 6) & 0x03) {                                                                                            \
                    /* Alpha blend */                                                                                                      \
                    case 0x01: {                                                                                                           \
                        if (alpha_condition != 0) {                                                                                        \
                            renderer(alpha, alpha_obj, screen_buffer);                                                                     \
                            expand_blend(screen_buffer, scanline, _start, _end);                                                           \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                                                                                                                                           \
                    /* Fade to white */                                                                                                    \
                    case 0x02: {                                                                                                           \
                        if (fade_condition != 0) {                                                                                         \
                            renderer(color32, partial_alpha, screen_buffer);                                                               \
                            expand_brighten_partial_alpha(screen_buffer, scanline, _start, _end);                                          \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                                                                                                                                           \
                    /* Fade to black */                                                                                                    \
                    case 0x03: {                                                                                                           \
                        if (fade_condition != 0) {                                                                                         \
                            renderer(color32, partial_alpha, screen_buffer);                                                               \
                            expand_darken_partial_alpha(screen_buffer, scanline, _start, _end);                                            \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                }                                                                                                                          \
                                                                                                                                           \
                renderer(color32, partial_alpha, screen_buffer);                                                                           \
                expand_blend(screen_buffer, scanline, _start, _end);                                                                       \
            } else {                                                                                                                       \
                /* Render based on special effects mode. */                                                                                \
                switch ((bldcnt >> 6) & 0x03) {                                                                                            \
                    /* Alpha blend */                                                                                                      \
                    case 0x01: {                                                                                                           \
                        if (alpha_condition != 0) {                                                                                        \
                            u32 ALIGN_DATA screen_buffer[240];                                                                             \
                            renderer(alpha, alpha_obj, screen_buffer);                                                                     \
                            expand_blend(screen_buffer, scanline, _start, _end);                                                           \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                                                                                                                                           \
                    /* Fade to white */                                                                                                    \
                    case 0x02: {                                                                                                           \
                        if (fade_condition != 0) {                                                                                         \
                            renderer(color16, color16, scanline);                                                                          \
                            expand_brighten(scanline, scanline, _start, _end);                                                             \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                                                                                                                                           \
                    /* Fade to black */                                                                                                    \
                    case 0x03: {                                                                                                           \
                        if (fade_condition != 0) {                                                                                         \
                            renderer(color16, color16, scanline);                                                                          \
                            expand_darken(scanline, scanline, _start, _end);                                                               \
                            return;                                                                                                        \
                        }                                                                                                                  \
                        break;                                                                                                             \
                    }                                                                                                                      \
                }                                                                                                                          \
                                                                                                                                           \
                renderer(normal, normal, scanline);                                                                                        \
                expand_normal(scanline, _start, _end);                                                                                     \
            }                                                                                                                              \
        } else {                                                                                                                           \
            u32 pixel_top = PLTT[0];                                                                                                       \
            switch ((bldcnt >> 6) & 0x03) {                                                                                                \
                /* Fade to white */                                                                                                        \
                case 0x02: {                                                                                                               \
                    if (color_combine_mask_a(5) != 0) {                                                                                    \
                        u8 blend = pIO_REG(REG_BLDY) & 0x1F;                                                                               \
                        u32 upper;                                                                                                         \
                                                                                                                                           \
                        if (blend > 16) {                                                                                                  \
                            blend = 16;                                                                                                    \
                        }                                                                                                                  \
                        upper = ((0x03E07C1F * blend) >> 4) & 0x03E07C1F;                                                                  \
                        blend = 16 - blend;                                                                                                \
                                                                                                                                           \
                        expand_pixel_no_dest(brighten, pixel_top);                                                                         \
                    }                                                                                                                      \
                    break;                                                                                                                 \
                }                                                                                                                          \
                                                                                                                                           \
                /* Fade to black */                                                                                                        \
                case 0x03: {                                                                                                               \
                    if (color_combine_mask_a(5) != 0) {                                                                                    \
                        s8 blend = 16 - (pIO_REG(REG_BLDY) & 0x1F);                                                                        \
                                                                                                                                           \
                        if (blend < 0) {                                                                                                   \
                            blend = 0;                                                                                                     \
                        }                                                                                                                  \
                        expand_pixel_no_dest(darken, pixel_top);                                                                           \
                    }                                                                                                                      \
                    break;                                                                                                                 \
                }                                                                                                                          \
            }                                                                                                                              \
            fill_line_color16(pixel_top, scanline, _start, _end);                                                                          \
        }                                                                                                                                  \
    }

// Renders an entire scanline from 0 to 240, based on current color mode.

static void render_scanline_tile(u16 *scanline, u16 dispcnt)
{
    u8 current_layer;
    u32 layer_order_pos;
    u16 bldcnt = pIO_REG(REG_BLDCNT);
    render_scanline_layer_functions_tile();

    render_layers_color_effect(render_layers, layer_count, render_condition_alpha, render_condition_fade, 0, 240);
}

static void render_scanline_bitmap(u16 *scanline, u16 dispcnt)
{
    //  u16 bldcnt = pIO_REG(REG_BLDCNT);
    render_scanline_layer_functions_bitmap();
    u8 current_layer;
    u32 layer_order_pos;

    fill_line_bg(normal, scanline, 0, 240);

    for (layer_order_pos = 0; layer_order_pos < layer_count; layer_order_pos++) {
        current_layer = layer_order[layer_order_pos];
        if ((current_layer & 0x04) != 0) {
            render_obj_layer(normal, scanline, 0, 240);
        } else {
            layer_renderers->normal_render(0, 240, scanline);
        }
    }
}

// Render layers from start to end based on if they're allowed in the
// enable flags.

#define render_layers_conditional(tile_alpha, obj_alpha, dest)                                                                             \
    {                                                                                                                                      \
        __label__ skip;                                                                                                                    \
        current_layer = layer_order[layer_order_pos];                                                                                      \
        /* If OBJ aren't enabled skip to the first non-OBJ layer */                                                                        \
        if ((enable_flags & 0x10) == 0) {                                                                                                  \
            while (((current_layer & 0x04) != 0) || (((1 << current_layer) & enable_flags) == 0)) {                                        \
                layer_order_pos++;                                                                                                         \
                current_layer = layer_order[layer_order_pos];                                                                              \
                                                                                                                                           \
                /* Oops, ran out of layers, render the background. */                                                                      \
                if (layer_order_pos == layer_count) {                                                                                      \
                    fill_line_bg(tile_alpha, dest, start, end);                                                                            \
                    goto skip;                                                                                                             \
                }                                                                                                                          \
            }                                                                                                                              \
                                                                                                                                           \
            /* Render the first valid layer */                                                                                             \
            layer_renderers[current_layer].tile_alpha##_render_base(current_layer, start, end, dest);                                      \
                                                                                                                                           \
            layer_order_pos++;                                                                                                             \
                                                                                                                                           \
            /* Render the rest of the layers if active, skipping OBJ ones. */                                                              \
            for (; layer_order_pos < layer_count; layer_order_pos++) {                                                                     \
                current_layer = layer_order[layer_order_pos];                                                                              \
                if (((current_layer & 0x04) == 0) && ((1 << current_layer) & enable_flags)) {                                              \
                    layer_renderers[current_layer].tile_alpha##_render_transparent(current_layer, start, end, dest);                       \
                }                                                                                                                          \
            }                                                                                                                              \
        } else {                                                                                                                           \
            /* Find the first active layer, skip all of the inactive ones */                                                               \
            while (!((current_layer & 0x04) || ((1 << current_layer) & enable_flags))) {                                                   \
                layer_order_pos++;                                                                                                         \
                current_layer = layer_order[layer_order_pos];                                                                              \
                                                                                                                                           \
                /* Oops, ran out of layers, render the background. */                                                                      \
                if (layer_order_pos == layer_count) {                                                                                      \
                    fill_line_bg(tile_alpha, dest, start, end);                                                                            \
                    goto skip;                                                                                                             \
                }                                                                                                                          \
            }                                                                                                                              \
                                                                                                                                           \
            if ((current_layer & 0x04) != 0) {                                                                                             \
                /* If the first one is OBJ render the background then render it. */                                                        \
                fill_line_bg(tile_alpha, dest, start, end);                                                                                \
                render_obj_layer(obj_alpha, dest, start, end);                                                                             \
            } else {                                                                                                                       \
                /* Otherwise render a base layer. */                                                                                       \
                layer_renderers[current_layer].tile_alpha##_render_base(current_layer, start, end, dest);                                  \
            }                                                                                                                              \
                                                                                                                                           \
            layer_order_pos++;                                                                                                             \
                                                                                                                                           \
            /* Render the rest of the layers. */                                                                                           \
            for (; layer_order_pos < layer_count; layer_order_pos++) {                                                                     \
                current_layer = layer_order[layer_order_pos];                                                                              \
                if ((current_layer & 0x04) != 0) {                                                                                         \
                    render_obj_layer(obj_alpha, dest, start, end);                                                                         \
                } else {                                                                                                                   \
                    if ((enable_flags & (1 << current_layer)) != 0) {                                                                      \
                        layer_renderers[current_layer].tile_alpha##_render_transparent(current_layer, start, end, dest);                   \
                    }                                                                                                                      \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
    skip:;                                                                                                                                 \
    }

// Render all of the BG and OBJ in a tiled scanline from start to end ONLY if
// enable_flag allows that layer/OBJ. Also conditionally render color effects.

static void render_scanline_conditional_tile(u32 start, u32 end, u16 *scanline, u8 enable_flags, u16 dispcnt, u16 bldcnt,
                                             TileLayerRenderStruct *layer_renderers)
{
    u8 current_layer;
    u32 layer_order_pos = 0;

    render_layers_color_effect(render_layers_conditional, (layer_count && (enable_flags & 0x1F)),
                               ((enable_flags & 0x20) && render_condition_alpha), ((enable_flags & 0x20) && render_condition_fade), start,
                               end);
}

// Render the BG and OBJ in a bitmap scanline from start to end ONLY if
// enable_flag allows that layer/OBJ. Also conditionally render color effects.

static void render_scanline_conditional_bitmap(u32 start, u32 end, u16 *scanline, u8 enable_flags, u16 dispcnt, u16 bldcnt,
                                               BitmapLayerRenderStruct *layer_renderers)
{
    u8 current_layer;
    u32 layer_order_pos;

    fill_line_bg(normal, scanline, start, end);

    for (layer_order_pos = 0; layer_order_pos < layer_count; layer_order_pos++) {
        current_layer = layer_order[layer_order_pos];
        if ((current_layer & 0x04) != 0) {
            if ((enable_flags & 0x10) != 0) {
                render_obj_layer(normal, scanline, start, end);
            }
        } else {
            if ((enable_flags & 0x04) != 0) {
                layer_renderers->normal_render(start, end, scanline);
            }
        }
    }
}

#define limit_window_horizontal_dimensions(window_number)                                                                                  \
    window_##window_number##_x1 = LIMIT_MAX(window_##window_number##_x1, 240);                                                             \
    window_##window_number##_x2 = LIMIT_MAX(window_##window_number##_x2, 240);

#define window_x_coords(window_number)                                                                                                     \
    window_##window_number##_x1 = pIO_REG(REG_WIN##window_number##H) >> 8;                                                                 \
    window_##window_number##_x2 = pIO_REG(REG_WIN##window_number##H) & 0xFF;                                                               \
    window_##window_number##_enable = (winin >> (window_number << 3)) & 0x3F;

#define window_coords(window_number)                                                                                                       \
    u8 window_##window_number##_x1, window_##window_number##_x2;                                                                           \
    u8 window_##window_number##_y1, window_##window_number##_y2;                                                                           \
    u8 window_##window_number##_enable = 0;                                                                                                \
    window_##window_number##_y1 = pIO_REG(REG_WIN##window_number##V) >> 8;                                                                 \
    window_##window_number##_y2 = pIO_REG(REG_WIN##window_number##V) & 0xFF;                                                               \
                                                                                                                                           \
    if (window_##window_number##_y1 > window_##window_number##_y2) {                                                                       \
        if ((((vcount <= window_##window_number##_y2) || (vcount > window_##window_number##_y1)) || (window_##window_number##_y2 > 227))   \
            && (window_##window_number##_y1 <= 227)) {                                                                                     \
            window_x_coords(window_number);                                                                                                \
        } else {                                                                                                                           \
            window_##window_number##_x1 = 240;                                                                                             \
            window_##window_number##_x2 = 240;                                                                                             \
        }                                                                                                                                  \
    } else {                                                                                                                               \
        if ((((vcount >= window_##window_number##_y1) && (vcount < window_##window_number##_y2)) || (window_##window_number##_y2 > 227))   \
            && (window_##window_number##_y1 <= 227)) {                                                                                     \
            window_x_coords(window_number);                                                                                                \
        } else {                                                                                                                           \
            window_##window_number##_x1 = 240;                                                                                             \
            window_##window_number##_x2 = 240;                                                                                             \
        }                                                                                                                                  \
    }

#define render_window_segment(type, start, end, window_type)                                                                               \
    if (start != end) {                                                                                                                    \
        render_scanline_conditional_##type(start, end, scanline, window_##window_type##_enable, dispcnt, bldcnt, layer_renderers);         \
    }

#define render_window_segment_unequal(type, start, end, window_type)                                                                       \
    render_scanline_conditional_##type(start, end, scanline, window_##window_type##_enable, dispcnt, bldcnt, layer_renderers)

#define render_window_segment_clip(type, clip_start, clip_end, start, end, window_type)                                                    \
    {                                                                                                                                      \
        if (start != end) {                                                                                                                \
            if (start < clip_start) {                                                                                                      \
                if (end > clip_start) {                                                                                                    \
                    if (end > clip_end) {                                                                                                  \
                        render_window_segment_unequal(type, clip_start, clip_end, window_type);                                            \
                    } else {                                                                                                               \
                        render_window_segment_unequal(type, clip_start, end, window_type);                                                 \
                    }                                                                                                                      \
                }                                                                                                                          \
            } else                                                                                                                         \
                                                                                                                                           \
                if (end > clip_end) {                                                                                                      \
                if (start < clip_end) {                                                                                                    \
                    render_window_segment_unequal(type, start, clip_end, window_type);                                                     \
                }                                                                                                                          \
            } else {                                                                                                                       \
                render_window_segment_unequal(type, start, end, window_type);                                                              \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define render_window_clip_1(type, start, end)                                                                                             \
    if (window_1_x1 < 240) {                                                                                                               \
        if (window_1_x1 > window_1_x2) {                                                                                                   \
            render_window_segment_clip(type, start, end, 0, window_1_x2, 1);                                                               \
            render_window_segment_clip(type, start, end, window_1_x2, window_1_x1, out);                                                   \
            render_window_segment_clip(type, start, end, window_1_x1, 240, 1);                                                             \
        } else {                                                                                                                           \
            window_1_x2 = LIMIT_MAX(window_1_x2, 240);                                                                                     \
            render_window_segment_clip(type, start, end, 0, window_1_x1, out);                                                             \
            render_window_segment_clip(type, start, end, window_1_x1, window_1_x2, 1);                                                     \
            render_window_segment_clip(type, start, end, window_1_x2, 240, out);                                                           \
        }                                                                                                                                  \
    } else {                                                                                                                               \
        render_window_segment(type, start, end, out);                                                                                      \
    }

#define render_window_clip_obj(type, start, end)                                                                                           \
    ;                                                                                                                                      \
    render_window_segment(type, start, end, out);                                                                                          \
    if ((dispcnt & 0x40) != 0) {                                                                                                           \
        render_scanline_obj_copy_##type##_1D(4, start, end, scanline);                                                                     \
    } else {                                                                                                                               \
        render_scanline_obj_copy_##type##_2D(4, start, end, scanline);                                                                     \
    }

#define render_window_segment_clip_obj(type, clip_start, clip_end, start, end)                                                             \
    {                                                                                                                                      \
        if (start != end) {                                                                                                                \
            if (start < clip_start) {                                                                                                      \
                if (end > clip_start) {                                                                                                    \
                    if (end > clip_end) {                                                                                                  \
                        render_window_clip_obj(type, clip_start, clip_end);                                                                \
                    } else {                                                                                                               \
                        render_window_clip_obj(type, clip_start, end);                                                                     \
                    }                                                                                                                      \
                }                                                                                                                          \
            } else if (end > clip_end) {                                                                                                   \
                if (start < clip_end) {                                                                                                    \
                    render_window_clip_obj(type, start, clip_end);                                                                         \
                }                                                                                                                          \
            } else {                                                                                                                       \
                render_window_clip_obj(type, start, end);                                                                                  \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

#define render_window_clip_1_obj(type, start, end)                                                                                         \
    if (window_1_x1 < 240) {                                                                                                               \
        if (window_1_x1 > window_1_x2) {                                                                                                   \
            render_window_segment_clip(type, start, end, 0, window_1_x2, 1);                                                               \
            render_window_segment_clip_obj(type, start, end, window_1_x2, window_1_x1);                                                    \
            render_window_segment_clip(type, start, end, window_1_x1, 240, 1);                                                             \
        } else {                                                                                                                           \
            window_1_x2 = LIMIT_MAX(window_1_x2, 240);                                                                                     \
            render_window_segment_clip_obj(type, start, end, 0, window_1_x1);                                                              \
            render_window_segment_clip(type, start, end, window_1_x1, window_1_x2, 1);                                                     \
            render_window_segment_clip_obj(type, start, end, window_1_x2, 240);                                                            \
        }                                                                                                                                  \
    } else {                                                                                                                               \
        render_window_clip_obj(type, start, end);                                                                                          \
    }

#define render_window_single(type, window_number)                                                                                          \
    window_coords(window_number);                                                                                                          \
    if (window_##window_number##_x1 > window_##window_number##_x2) {                                                                       \
        limit_window_horizontal_dimensions(window_number);                                                                                 \
        render_window_segment(type, 0, window_##window_number##_x2, window_number);                                                        \
        render_window_segment(type, window_##window_number##_x2, window_##window_number##_x1, out);                                        \
        render_window_segment(type, window_##window_number##_x1, 240, window_number);                                                      \
    } else {                                                                                                                               \
        limit_window_horizontal_dimensions(window_number);                                                                                 \
        render_window_segment(type, 0, window_##window_number##_x1, out);                                                                  \
        render_window_segment(type, window_##window_number##_x1, window_##window_number##_x2, window_number);                              \
        render_window_segment(type, window_##window_number##_x2, 240, out);                                                                \
    }

#define render_window_multi(type, front, back)                                                                                             \
    if (window_##front##_x1 > window_##front##_x2) {                                                                                       \
        limit_window_horizontal_dimensions(front);                                                                                         \
        render_window_segment(type, 0, window_##front##_x2, front);                                                                        \
        render_window_clip_##back(type, window_##front##_x2, window_##front##_x1);                                                         \
        render_window_segment(type, window_##front##_x1, 240, front);                                                                      \
    } else {                                                                                                                               \
        limit_window_horizontal_dimensions(front);                                                                                         \
        render_window_clip_##back(type, 0, window_##front##_x1);                                                                           \
        render_window_segment(type, window_##front##_x1, window_##front##_x2, front);                                                      \
        render_window_clip_##back(type, window_##front##_x2, 240);                                                                         \
    }

#define render_scanline_window_builder(type)                                                                                               \
    static void render_scanline_window_##type(u16 *scanline, u16 dispcnt)                                                                  \
    {                                                                                                                                      \
        u16 vcount = pIO_REG(REG_VCOUNT);                                                                                                  \
        u16 winin = pIO_REG(REG_WININ);                                                                                                    \
        u16 winout = pIO_REG(REG_WINOUT);                                                                                                  \
        u16 bldcnt = pIO_REG(REG_BLDCNT);                                                                                                  \
        u16 window_out_enable = winout & 0x3F;                                                                                             \
                                                                                                                                           \
        render_scanline_layer_functions_##type();                                                                                          \
                                                                                                                                           \
        switch (dispcnt >> 13) {                                                                                                           \
            /* Just window 0 */                                                                                                            \
            case 0x01: {                                                                                                                   \
                render_window_single(type, 0);                                                                                             \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Just window 1 */                                                                                                            \
            case 0x02: {                                                                                                                   \
                render_window_single(type, 1);                                                                                             \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Windows 1 and 2 */                                                                                                          \
            case 0x03: {                                                                                                                   \
                window_coords(0);                                                                                                          \
                window_coords(1);                                                                                                          \
                limit_window_horizontal_dimensions(1);                                                                                     \
                render_window_multi(type, 0, 1);                                                                                           \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Just OBJ windows */                                                                                                         \
            case 0x04: {                                                                                                                   \
                /* u8 window_obj_enable = winout >> 8; */                                                                                  \
                render_window_clip_obj(type, 0, 240);                                                                                      \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Window 0 and OBJ window */                                                                                                  \
            case 0x05: {                                                                                                                   \
                /* u8 window_obj_enable = winout >> 8; */                                                                                  \
                window_coords(0);                                                                                                          \
                render_window_multi(type, 0, obj);                                                                                         \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Window 1 and OBJ window */                                                                                                  \
            case 0x06: {                                                                                                                   \
                /* u8 window_obj_enable = winout >> 8; */                                                                                  \
                window_coords(1);                                                                                                          \
                render_window_multi(type, 1, obj);                                                                                         \
                break;                                                                                                                     \
            }                                                                                                                              \
                                                                                                                                           \
            /* Window 0, 1, and OBJ window */                                                                                              \
            case 0x07: {                                                                                                                   \
                /* u8 window_obj_enable = winout >> 8; */                                                                                  \
                window_coords(0);                                                                                                          \
                window_coords(1);                                                                                                          \
                render_window_multi(type, 0, 1_obj);                                                                                       \
                break;                                                                                                                     \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

render_scanline_window_builder(tile);
render_scanline_window_builder(bitmap);

void update_scanline(void)
{
    //   return;
    u16 dispcnt = pIO_REG(REG_DISPCNT);
    u16 *screen_offset = gameImage + (pIO_REG(REG_VCOUNT) << 8);
    u8 video_mode = dispcnt & 0x07;

    // If OAM has been modified since the last scanline has been updated then
    // reorder and reprofile the OBJ lists.
    // if (oam_update != 0) {
    order_obj(video_mode);
    //     oam_update = 0;
    // }

    order_layers((dispcnt >> 8) & active_layers[video_mode]);

    // If the screen is in in forced blank draw pure white.
    if ((dispcnt & 0x80) != 0) {
        fill_line_color16(0x7FFF, screen_offset, 0, 240);
    } else {
        if (video_mode < 3) {
            if ((dispcnt >> 13) != 0) {
                render_scanline_window_tile(screen_offset, dispcnt);
            } else {
                render_scanline_tile(screen_offset, dispcnt);
            }
        } else {
            if ((dispcnt >> 13) != 0) {
                render_scanline_window_bitmap(screen_offset, dispcnt);
            } else {
                render_scanline_bitmap(screen_offset, dispcnt);
            }
        }
    }

    affine_reference_x[0] += REG_BG2PB;
    affine_reference_y[0] += REG_BG2PD;
    affine_reference_x[1] += REG_BG3PB;
    affine_reference_y[1] += REG_BG3PD;
}

void clear_texture(u16 color)
{
    u32 *p_dest = (u32 *)gameImage;
    u32 color32 = color | (color << 16);

    while (p_dest != (u32 *)(gameImage + GBA_LINE_SIZE * GBA_SCREEN_HEIGHT)) {
        u32 *p_dest_max = p_dest + (GBA_SCREEN_WIDTH / 2);

        while (p_dest != p_dest_max)
            *p_dest++ = color32;

        p_dest += (GBA_LINE_SIZE - GBA_SCREEN_WIDTH) / 2;
    }
}
