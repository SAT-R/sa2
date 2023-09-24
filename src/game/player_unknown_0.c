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

// https://decomp.me/scratch/M6i4c
void sub_8011328()
{
    s32 k;
    u16 animId;
    s32 **animation;
    s32 pal;
    u32 *dst, *src;
    u32 waterMask;
    u32 maskColors0, maskColors1;
    u32 maskA, maskB;

    Water *water = &gWater;
    WaterData *wd = TaskGetStructPtr(water->t);

    if (IS_MULTI_PLAYER) {
        u8 i = 0, j = 0;
        // const u16 *palettes = gSpritePalettes;

        for (; j < 4; j++) {
            if ((gMultiplayerConnections >> j) & 0x1) {
                i++;
            }
        }

        for (j = 0; j < i; j++) {
            // _08011382
            u16 mpChar = gMultiplayerCharacters[j];
            animId = gUnknown_080D550C[mpChar];
            animation = gAnimations[animId];
            pal = (animation[0])[1];
            src = (u32 *)&gSpritePalettes[pal * 16];
            dst = (u32 *)&wd->pal[j * 16];
            sub_8011B54_inline(dst, src, 1, 0);
        }
    } else {
        u16 playerChar = gPlayer.character;

        // _08011400
        animId = gUnknown_080D550C[playerChar];
        animation = (s32 **)gAnimations[animId];
        pal = ((animation[0])[1]);
        sub_8011B54_inline((u32 *)&wd->pal[0 * 16], (u32 *)&gSpritePalettes[pal * 16], 1,
                           0);

        playerChar = gPlayer.character;
        animId = gUnknown_080D5678[playerChar];
        animation = (s32 **)gAnimations[animId];
        pal = ((animation[0])[1] + 0) * 16;
        dst = (u32 *)&wd->pal[1 * 16];
        src = (u32 *)&gSpritePalettes[pal];
        sub_8011B54_inline(dst, src, 1, 0);
    }
    // _080114B0
    animId = SA2_ANIM_PALETTE_554;
    animation = (s32 **)gAnimations[animId];
    pal = ((animation[0])[1] + 4) * 16;
    dst = (u32 *)&wd->pal[4 * 16];
    src = (u32 *)&gSpritePalettes[(pal)];
    sub_8011B54_inline(dst, src, 12, 0);

    dst = (u32 *)&wd->pal[256];
    src = (u32 *)gBgPalette;
    waterMask = water->mask;
    k = 16;
    maskA = WATER_MASK_A;
    maskB = WATER_MASK_B;
    waterMask &= maskB;

    /* Mask sixteen 16-color palettes - Start */
    while (k-- != 0) {
        // TODO: Find a way to inline these!
        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;

        maskColors0 = *src++;
        maskColors1 = maskColors0;
        maskColors1 &= maskA;
        maskColors0 &= maskB;
        maskColors0 = (maskColors0 + waterMask) >> 1;
        maskColors1 = (maskColors1 + maskColors0);
        maskColors1 >>= 1;
        *dst++ = maskColors1;
    }
    /* Mask sixteen 16-color palettes - End */
}

#if 0 // matches
static void sub_8011B54(u32 *dst, u32 *src, s32 size)
{
    sub_8011B54_inline(dst, src, size, 4, 4);
}
#endif