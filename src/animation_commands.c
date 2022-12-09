#include "global.h"
#include "m4a.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

#include "animation_commands.h"

typedef s32 (*AnimationCommandFunc)(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);

extern s32 animCmd_GetTileIndex(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_GetPalette(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_JumpBack(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_4(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_PlaySoundEffect(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
extern s32 animCmd_6(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_TranslateSprite(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_8(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_SetIdAndVariant(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
s32 animCmd_10(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_11(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);
static s32 animCmd_12(void *cursor, struct UNK_0808B3FC_UNK240 *sprite);

extern struct SpriteTables *gUnknown_03002794;
extern u16 gObjPalette[];
extern u32 gFlags;

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
    animCmd_SetIdAndVariant,
    animCmd_10,
    animCmd_11,
    animCmd_12,
};

// (-2)
s32 animCmd_GetPalette(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_GetPalette *cmd = (ACmd_GetPalette *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetPalette);

    if (!(sprite->unk10 & 0x40000)) {
        s32 paletteIndex = cmd->palId;

        DmaCopy32(3, &gUnknown_03002794->palettes[paletteIndex * 16],
                  &gObjPalette[sprite->focused * 16 + cmd->insertOffset],
                  cmd->numColors * 2);

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    return 1;
}

// (-3)
s32 animCmd_JumpBack(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_JumpBack *cmd = cursor;
    sprite->unk14 -= cmd->offset;

    return 1;
}

// (-4)
// Command "End"?
s32 animCmd_4(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    sprite->unk10 |= 0x4000;

    return 0;
}

// (-5)
s32 animCmd_PlaySoundEffect(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_PlaySoundEffect *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_PlaySoundEffect);

    m4aSongNumStart(cmd->songId);

    return 1;
}

// (-7)
s32 animCmd_TranslateSprite(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_TranslateSprite *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_TranslateSprite);

    sprite->x += cmd->x;
    sprite->y += cmd->y;

    return 1;
}

// (-8)
s32 animCmd_8(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_8 *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_8);

    return 1;
}

// (-9)
s32 animCmd_SetIdAndVariant(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_SetIdAndVariant *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_SetIdAndVariant);

    sprite->anim = cmd->animId;
    sprite->unk21 = 0xFF;
    sprite->variant = cmd->variant;

    return -1;
}

// (-10)
s32 animCmd_10(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_10 *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_10);

#ifdef UBFIX
    return 1; // I think this should be the correct behavior?
#else
    return (s32)cursor;
#endif
}

// (-11)
s32 animCmd_11(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_11 *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_11);

    sprite->unk10 = ((sprite->unk10 & ~0x3000) | (cmd->unk4 << 3 * 4));

    return 1;
}

// (-12)
s32 animCmd_12(void *cursor, struct UNK_0808B3FC_UNK240 *sprite)
{
    ACmd_12 *cmd = cursor;

    sprite->unk14 += AnimCommandSizeInWords(ACmd_12);
    sprite->unk1A = cmd->unk4 << 6;

    return 1;
}