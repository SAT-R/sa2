#include "global.h"
#include "gba/syscall.h"

#include "m4a.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

#include "animation_commands.h"

extern const struct SpriteTables *gUnknown_03002794;
extern u8 gUnknown_03002A84;
extern struct BgHeader *gUnknown_030027A0[];

extern const AnimationCommandFunc animCmdTable[];

void sub_80044D8(u8 *p0, u16 p1)
{
    u8 i;

    for (i = 0; i < 4; p1 <<= 4, i++) {
        u16 value = ((p1 & 0xF000) >> 12);
        if (value > 9) {
            p0[i] = value + 87;
        } else {
            p0[i] = value + 48;
        }
    }

    p0[i] = 0;
}

u32 sub_8004518(u16 num)
{
    u8 i;
    u16 result;
    u8 lowDigit;
    u16 remainder = num;

    result = 0;
    for (i = 0; i < 4; i++) {
        s32 divisor = Div(remainder, 10);
        lowDigit = remainder - divisor * 10;
        remainder = ((divisor << 16) >> 16);

        result |= lowDigit << (i << 2);
    }

    return result;
}

NONMATCH("asm/non_matching/sub_8004558.inc", s32 sub_8004558(Sprite *sprite))
{
    if (sprite->unk21 != sprite->variant || sprite->unk1E != sprite->anim) {
        sprite->unk8 = 0;
        sprite->unk21 = sprite->variant;
        sprite->unk1E = sprite->anim;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk10 &= ~0x4000;
    }
    if (sprite->unk10 & 0x4000)
        return 0;
    if (sprite->unk1C > 0)
        sprite->unk1C -= 16 * sprite->unk22;
    else {
        // _080045B8
        s32 ret;
        ACmd *cmd;
        ACmd **cursor;
        ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gUnknown_03002794->animations[sprite->anim];
        cursor = &variants[sprite->variant];
        for (cmd = cursor[sprite->unk14]; cmd->id < 0; cmd = cursor[sprite->unk14]) {
            ret = animCmdTable[~cmd->id](cmd, sprite);
            if (ret != +1) {
                if (ret != -1)
                    return ret;

                variants = gUnknown_03002794->animations[sprite->anim];
                cursor = &variants[sprite->variant];
                sprite->unk14 = 0;
            }
        }
        // _08004628

        // Display the image 'index' for 'delay' frames
        sprite->unk1C += (((ACmd_ShowFrame *)cmd)->delay << 8);
        sprite->unk1C -= sprite->unk22 * 16;
        {
            int frame = ((ACmd_ShowFrame *)cmd)->index;
            if (frame != -1) {
                const struct SpriteTables *sprTables = gUnknown_03002794;

                // TODO: Remove cast
                sprite->unkC = (struct UNK_0808B3FC_UNK240_UNKC *)&sprTables
                                   ->dimensions[sprite->anim][frame];
            } else {
                sprite->unkC = (void *)-1;
            }
        }

        sprite->unk14 += 2;
    }
    return 1;
}
END_NONMATCH

// (-1)
s32 animCmd_GetTiles(void *cursor, Sprite *sprite)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetTiles);

    if ((sprite->unk10 & 0x80000) == 0) {
        // @TODO: Change sprite's unk0 to be a pointer
        if (cmd->tileIndex < 0) {
            sprite->unk0
                = (u32)&gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            sprite->unk8 = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            sprite->unk0
                = (u32)&gUnknown_03002794->graphics[cmd->tileIndex * TILE_SIZE_4BPP];
            sprite->unk8 = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        gUnknown_030027A0[gUnknown_03002A84] = (struct BgHeader *)sprite;
        gUnknown_03002A84 = (gUnknown_03002A84 + 1) & 0x1F;
    }

    return 1;
}

// (-6)
s32 animCmd_6(void *cursor, Sprite *sprite)
{
    ACmd_6 *cmd = (ACmd_6 *)cursor;
    s32 r3 = cmd->unk4.unk0 & 0xF;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_6);

    DmaCopy32(3, &cmd->unk4, &sprite->unk28[r3].unk0, 8);

    if ((cmd->unk4.unk4 == 0) && (cmd->unk4.unk5 == 0) && (cmd->unk4.unk6 == 0)
        && (cmd->unk4.unk7 == 0)) {
        sprite->unk28[r3].unk0 = -1;
    } else {
        if (sprite->unk10 & 0x00000800) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk5, sprite->unk28[r3].unk7);
        }

        if (sprite->unk10 & 0x00000400) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk4, sprite->unk28[r3].unk6);
        }
    }

    return 1;
}
