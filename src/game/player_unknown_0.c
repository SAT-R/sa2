#include "global.h"
#include "core.h"
#include "task.h"
#include "game/game.h"

#include "data/sprite_data.h"
#include "game/player_unknown_0.h"

#include "constants/animations.h"

#define WATER_MASK_COLOR_A 0x7BDE
#define WATER_MASK_COLOR_B 0x739C
#define WATER_MASK_A       ((WATER_MASK_COLOR_A << 16) | WATER_MASK_COLOR_A)
#define WATER_MASK_B       ((WATER_MASK_COLOR_B << 16) | WATER_MASK_COLOR_B)

// TODO: Move decl elsewhere
extern u16 gUnknown_080D5678[];

// TODO: static
const u16 gUnknown_080D550C[NUM_CHARACTERS] = {
    SA2_ANIM_UNDERWATER_1UP_SONIC, SA2_ANIM_UNDERWATER_1UP_CREAM,
    SA2_ANIM_UNDERWATER_1UP_TAILS, SA2_ANIM_UNDERWATER_1UP_KNUCKLES,
    SA2_ANIM_UNDERWATER_1UP_AMY,
};

static void inline sub_8011B54_inline(u32 *dst, u32 *src, s32 size, s32 shift)
{
    s32 r2 = size >> shift;

    while (r2-- != 0) {
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
    }
}

static void inline copyMask(u32 *dst, u32 *src, u32 waterMask)
{
    u32 maskColors0, maskColors1;

    maskColors0 = *src;
    maskColors1 = maskColors0;
    maskColors1 &= WATER_MASK_A;
    maskColors0 &= WATER_MASK_B;
    maskColors0 = (maskColors0 + waterMask) >> 1;
    maskColors1 = (maskColors1 + maskColors0) >> 1;
    *dst = maskColors1;
}

#if 01
void sub_8011328()
{
    u8 i = 0, j = 0;
    u32 k;
    u16 animId;
    s32 **animation;
    s32 pal;
    u32 *dst, *src;
    u32 waterMask;
    u32 maskColors0, maskColors1;

    WaterData *wd = TaskGetStructPtr(gWater.t);

    if (IS_MULTI_PLAYER) {
        const u16 *palettes = gSpritePalettes;
        u8 connections = gMultiplayerConnections;

        for (; j < 4; j++) {
            if ((connections >> j) & 0x1) {
                i++;
            }
        }

        for (j = 0; j < i; j++) {
            // _08011382
            u16 mpChar = gMultiplayerCharacters[j];
            animId = gUnknown_080D550C[mpChar];
            animation = gAnimations[animId];
            pal = (animation[0])[1];
            sub_8011B54_inline((u32 *)&wd->pal[j * 16],
                               (u32 *)&gSpritePalettes[pal * 16], 1, 0);
        }
    } else {
        // _08011400
        animId = gUnknown_080D550C[gPlayer.character];
        animation = (s32 **)gAnimations[animId];
        pal = (animation[0])[1];
        sub_8011B54_inline((u32 *)&wd->pal[0 * 16], (u32 *)&gSpritePalettes[pal * 16], 1,
                           0);

        gUnknown_080D5678[gPlayer.character];
        animation = (s32 **)gAnimations[animId];
        pal = (animation[0])[1];
        sub_8011B54_inline((u32 *)&wd->pal[3 * 16],
                           (u32 *)&gSpritePalettes[(pal + 1) * 16], 1, 0);
    }
    // _080114B0
    animId = SA2_ANIM_PALETTE_554;
    animation = (s32 **)gAnimations[animId];
    pal = (animation[0])[1];
    sub_8011B54_inline((u32 *)&wd->pal[3 * 16], (u32 *)&gSpritePalettes[(pal + 2) * 16],
                       12, 0);

    dst = (u32 *)&wd->pal[256];
    src = (u32 *)gBgPalette;
    waterMask = gWater.mask & WATER_MASK_B;

    /* Mask sixteen 16-color palettes - Start */
    k = 16;
    while (--k != 0) {
        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= WATER_MASK_A;
        maskColors0 &= WATER_MASK_B;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0) >> 1;
        *dst++ = maskColors1;
    }
    /* Mask sixteen 16-color palettes - End */
}
#endif

#if 0 // matches
static void sub_8011B54(u32 *dst, u32 *src, s32 size)
{
    sub_8011B54_inline(dst, src, size, 4, 4);
}
#endif