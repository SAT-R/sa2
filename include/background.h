#ifndef GUARD_BACKGROUND_H
#define GUARD_BACKGROUND_H

#include "core.h"

// TODO: Put this somewhere else! (or is this already somewhere?)
#define TileMask_Index   (0x3FF)
#define TileMask_FlipX   (1 << 10)
#define TileMask_FlipY   (1 << 11)
#define TileMask_FlipXY  (TileMask_FlipX | TileMask_FlipY)
#define TileMask_Palette (TileMask_FlipX | TileMask_FlipY)

#define BACKGROUND_FLAGS_BG_ID(id)        (id)
#define BACKGROUND_FLAGS_MASK_BG_ID       0x3
#define BACKGROUND_FLAG_4                 0x4
#define BACKGROUND_DISABLE_TILESET_UPDATE 0x8
#define BACKGROUND_DISABLE_PALETTE_UPDATE 0x10
#define BACKGROUND_FLAG_20                0x20
#define BACKGROUND_FLAG_IS_LEVEL_MAP      0x40
#define BACKGROUND_FLAG_80                0x80
#define BACKGROUND_FLAG_100               0x100
#define BACKGROUND_UPDATE_ANIMATIONS      0x200
#define BACKGROUND_FLAG_400               0x400
#define BACKGROUND_FLAG_800               0x800

// TODO: potentially rename these. For now, all we know is
// that they are used in the same functions which handles
// bg sprites
#define INIT_BG_SPRITES_LAYER_32(index)                                                                                                    \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 32;                                                                                              \
    });

#define INIT_BG_SPRITES_LAYER_64(index)                                                                                                    \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 64;                                                                                              \
    })

#define INIT_BG_SPRITES_LAYER_128(index)                                                                                                   \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 128;                                                                                             \
    })

void DrawBackground(Background *);
void DisplaySprite_BG(Sprite *);
s32 UpdateSpriteAnimation_BG(Sprite *);
void UpdateBgAnimationTiles(Background *);
s32 RenderText(void *dest, const void *font, u16 x, u16 y, u8 bg, const char *text, u8 palette);
void SA2_LABEL(sub_8003EE4)(u16 p0, s16 p1, s16 p2, s16 p3, s16 p4, s16 p5, s16 p6, BgAffineReg *affine);
bool32 SA2_LABEL(sub_8004010)(void);
bool32 SA2_LABEL(sub_8002B20)(void);
bool32 SA2_LABEL(sub_80039E4)(void);

#endif // GUARD_BACKGROUND_H
