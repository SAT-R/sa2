#include "global.h"
#include "m4a.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

typedef int (*AnimationCommandFunc)(s32 *variantCursor,
                                    struct UNK_0808B3FC_UNK240 *sprite);

extern int animCmd_GetTileIndex(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_GetPalette(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_JumpBack(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_4(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_PlaySoundEffect(s32 *variantCursor,
                                   struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_6(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_TranslateSprite(s32 *variantCursor,
                                   struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_8(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_9(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_10(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_11(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
static int animCmd_12(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);

// make static
const AnimationCommandFunc animCmdTable[] = {
    // 0x080984AC
    animCmd_GetTileIndex,
    animCmd_GetPalette,
    animCmd_JumpBack,
    animCmd_4,
    animCmd_PlaySoundEffect,
    animCmd_6,
    animCmd_TranslateSprite,
    animCmd_8,
    animCmd_9,
    animCmd_10,
    animCmd_11,
    animCmd_12,
};

extern struct SpriteTables *gUnknown_03002794;
extern u16 gObjPalette[];
extern u32 gFlags;

// (-2)
int animCmd_GetPalette(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 3;

    if (!(sprite->unk10 & 0x40000)) {
        s32 paletteIndex = variantCursor[1];
        u16 count, insertIndex;

        DmaCopy32(3, &gUnknown_03002794->palettes[paletteIndex * 16],
                  &gObjPalette[sprite->focused * 16 + ((u16 *)variantCursor)[5]],
                  ((u16 *)variantCursor)[4] * 2);

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    return 1;
}

// (-3)
int animCmd_JumpBack(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 -= variantCursor[1];

    return 1;
}

// (-4)
int animCmd_4(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk10 |= 0x4000;

    return 0;
}

// (-5)
int animCmd_PlaySoundEffect(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 2;

    m4aSongNumStart(((u16 *)variantCursor)[2]);

    return 1;
}

// (-7)
int animCmd_TranslateSprite(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 2;

    sprite->x += ((u16 *)variantCursor)[2];
    sprite->y += ((u16 *)variantCursor)[3];

    return 1;
}

// (-8)
int animCmd_8(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 3;

    return 1;
}

// (-9)
int animCmd_9(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 2;

    sprite->anim = ((AnimId *)variantCursor)[2];
    sprite->unk21 = 0xFF;
    sprite->variant = ((AnimId *)variantCursor)[3];

    return -1;
}

// (-10)
int animCmd_10(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 4;
#ifdef UBFIX
    return 1; // I think this should be the correct behavior?
#else
    return (int)variantCursor;
#endif
}

// (-11)
int animCmd_11(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 2;

    sprite->unk10 = (sprite->unk10 & ~0x3000) | (variantCursor[1] << 12);

    return 1;
}

// (-12)
int animCmd_12(s32 *variantCursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk14 += 2;
    sprite->unk1A = variantCursor[1] << 6;

    return 1;
}