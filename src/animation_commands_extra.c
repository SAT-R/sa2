#include "global.h"
#include "gba/syscall.h"
#include "core.h"
#include "lib/m4a.h"
#include "trig.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

#include "animation_commands.h"

extern const struct SpriteTables *gUnknown_03002794;
extern u8 gVramGraphicsCopyQueueIndex;
extern struct GraphicsData *gVramGraphicsCopyQueue[];

extern const AnimationCommandFunc animCmdTable[];
extern const AnimationCommandFunc animCmdTable_2[];

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

// Differences to sub_8004558:
// - SPRITE_MAYBE_SWITCH_ANIM gets executed *after* the if.
// - Uses animCmdTable_2 instead of animCmdTable
s32 sub_80036E0(Sprite *sprite)
{
    ACmd **variants;
    ACmd *script;
    ACmd *cmd;

    if (sprite->unk10 & SPRITE_FLAG_MASK_14)
        return 0;

    SPRITE_MAYBE_SWITCH_ANIM(sprite);

    if (sprite->unk1C > 0)
        sprite->unk1C -= 16 * sprite->unk22;
    else {
        s32 ret;
        ACmd *cmd;
        ACmd *script;
        ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gUnknown_03002794->animations[sprite->graphics.anim];
        script = variants[sprite->variant];
        cmd = ReadInstruction(script, sprite->unk14);
        while (cmd->id < 0) {
            ret = animCmdTable_2[~cmd->id](cmd, sprite);
            if (ret != 1) {
#ifndef NON_MATCHING
                register ACmd *newScript asm("r1");
#else
                ACmd *newScript;
#endif
                if (ret != -1) {
                    return ret;
                }

                // animation has changed
                variants = gUnknown_03002794->animations[sprite->graphics.anim];
                newScript = variants[sprite->variant];
                // reset cursor
                sprite->unk14 = 0;
                // load the new script
                script = newScript;
            }
            cmd = ReadInstruction(script, sprite->unk14);
        }

        // Display the image 'index' for 'delay' frames
        sprite->unk1C += (((ACmd_ShowFrame *)cmd)->delay << 8);
        sprite->unk1C -= sprite->unk22 * 16;
        {
            s32 frame = ((ACmd_ShowFrame *)cmd)->index;
            if (frame != -1) {
                const struct SpriteTables *sprTables = gUnknown_03002794;

                sprite->dimensions
                    = &sprTables->dimensions[sprite->graphics.anim][frame];
            } else {
                sprite->dimensions = (void *)-1;
            }
        }

        sprite->unk14 += 2;
    }
    return 1;
}

// (-1)
// No differences to animCmd_GetTiles
s32 animCmd_GetTiles_COPY(void *cursor, Sprite *sprite)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetTiles);

    if ((sprite->unk10 & SPRITE_FLAG_MASK_19) == 0) {
        if (cmd->tileIndex < 0) {
            sprite->graphics.src
                = &gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            sprite->graphics.size = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            sprite->graphics.src
                = &gUnknown_03002794->tiles_4bpp[cmd->tileIndex * TILE_SIZE_4BPP];
            sprite->graphics.size = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &sprite->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
    }

    return 1;
}

// (-6)
// Differences to animCmd_6:
// - uses XOR_SWAP macro instead of SWAP_AND_NEGATE
s32 animCmd_6_COPY(void *cursor, Sprite *sprite)
{
    ACmd_6 *cmd = (ACmd_6 *)cursor;
    s32 r3 = cmd->unk4.unk0 & 0xF;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_6);

    DmaCopy32(3, &cmd->unk4, &sprite->unk28[r3].unk0, 8);

    if ((cmd->unk4.unk4 == 0) && (cmd->unk4.unk5 == 0) && (cmd->unk4.unk6 == 0)
        && (cmd->unk4.unk7 == 0)) {
        sprite->unk28[r3].unk0 = -1;
    } else {
        if (sprite->unk10 & SPRITE_FLAG_MASK_Y_FLIP) {
            XOR_SWAP(sprite->unk28[r3].unk5, sprite->unk28[r3].unk7);
        }

        if (sprite->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
            XOR_SWAP(sprite->unk28[r3].unk4, sprite->unk28[r3].unk6);
        }
    }

    return 1;
}

void sub_8003914(Sprite *sprite)
{
    SpriteOffset *dims;
    gUnknown_03004D10[gUnknown_03005390] = sprite;
    gUnknown_03005390++;

    if (sprite->dimensions != (void *)-1) {
        u32 bgId;

        dims = sprite->dimensions;
        bgId = SPRITE_BF_GET_BG_ID(sprite);
        // Potential UB:
        //     gDispCnt 'Mode' is an int, not a bitfield!
        if ((bgId > 1) && (gDispCnt & (DISPCNT_MODE_1 | DISPCNT_MODE_2))) {
            // __sub_8003954
            s32 affineX, affineY;
            s32 posX, posY;

            posX = dims->offsetX - sprite->x;
            affineX = Mod(posX, 16);
            gBgAffineRegs[bgId - 2].x = Q_24_8(affineX);

            posY = dims->offsetY - sprite->y;
            affineY = Mod(posY, 8);
            gBgAffineRegs[bgId - 2].y = Q_24_8(affineY);
        } else {
            // _080039A4
            s32 scrollX, scrollY;
            s32 posX, posY;

            posX = dims->offsetX - sprite->x;
            scrollX = Mod(posX, 16);
            gBgScrollRegs[bgId][0] = scrollX;

            posY = dims->offsetY - sprite->y;
            scrollY = Mod(posY, 8);
            gBgScrollRegs[bgId][1] = scrollY;
        }
    }
}

// Some VBlank function
NONMATCH("asm/non_matching/sprite__sub_80039E4.inc", u32 sub_80039E4(void)) { }
END_NONMATCH

void sub_8003EE4(u16 p0, s16 p1, s16 p2, s16 p3, s16 p4, s16 p5, s16 p6,
                 BgAffineReg *affine)
{
    affine->pa = ((COS(p0) >> 6) * (s16)Div(0x10000, p1)) >> 8;
    affine->pb = ((SIN(p0) >> 6) * (s16)Div(0x10000, p1)) >> 8;
    affine->pc = ((-SIN(p0) >> 6) * (s16)Div(0x10000, p2)) >> 8;
    affine->pd = ((COS(p0) >> 6) * (s16)Div(0x10000, p2)) >> 8;

    p5 *= -1;
    p6 *= -1;
    {
        // __sub_8003FA8
        s32 r1 = (s16)affine->pa * p5;
        s32 r3 = (s16)affine->pb * p6;
        r1 += r3;
        affine->x = r1 + p3 * 256;
    }
    {
        // __sub_8003FBE
        s32 r1 = (s16)affine->pc * p5;
        s32 r3 = (s16)affine->pd * p6;
        r1 += r3;
        affine->y = r1 + p4 * 256;
    }
}

// https://decomp.me/scratch/oyiq8
NONMATCH("asm/non_matching/sub_8004010.inc", u32 sub_8004010(void))
{
    u8 bgIndex;
    u16 sp00[2];
    u8 r4;
    u8 *spVramPtr;
    u16 bgSize_TxtOrAff;

    for (bgIndex = 0; bgIndex < 4; bgIndex++) {

        if ((gUnknown_03002280[bgIndex][0] == gUnknown_03002280[bgIndex][3])
            && (gUnknown_03002280[bgIndex][2] == gUnknown_03002280[bgIndex][0]))
            continue;

        { // _08004056
            u16 target = gBgCntRegs[bgIndex];
            u16 *vramBgCtrl = (u16 *)VRAM;
            target &= (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BG2
                       | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0);
            vramBgCtrl += target * 4;

            r4 = gUnknown_03002280[bgIndex][1];

            if ((bgIndex > 1)
                && (gDispCnt & (DISPCNT_MODE_2 | DISPCNT_MODE_1 | DISPCNT_MODE_0))) {
                // _0800408E
                spVramPtr = (u8 *)&vramBgCtrl[gUnknown_03002280[bgIndex][0]];
                bgSize_TxtOrAff = 0x10 << (gBgCntRegs[bgIndex] >> 14);

                if (gUnknown_03002280[bgIndex][3] == 0xFF) {
                    // _080040A2
                    u16 v = gUnknown_03004D80[bgIndex];
                    u32 value;
                    v |= v << 8;
                    sp00[0] = v;

                    value = ((gUnknown_03002280[bgIndex][3] - r4) * bgSize_TxtOrAff);
                    DmaCopy16(3, &sp00, &spVramPtr[bgSize_TxtOrAff * r4],
                              (((s32)(value + (value >> 31))) >> 1));
                } else {
                    // _080040F8
                    // u8 i2 = i + 1;
                    for (; r4 < gUnknown_03002280[bgIndex][3]; r4++) {
                        u16 v = gUnknown_03004D80[bgIndex];
                        u32 value;
                        v |= v << 8;
                        sp00[0] = v;

                        DmaCopy32(
                            3, &sp00, &spVramPtr[bgIndex * r4],
                            (s32)(bgIndex * 4 - gUnknown_03002280[bgIndex][0] + 1));
                    }
                }
                // then -> _0800422C
            } else {
                // _08004168
                int tileSize = 32;

                if (((gBgCntRegs[bgIndex] >> 14) - 2) <= 1)
                    tileSize = 64;

                if (gUnknown_03002280[bgIndex][2] == 0xFF) {
                    u8 r1 = gUnknown_03004D80[bgIndex];
                    u8 *p1p = &gUnknown_03002280[bgIndex][r4 * tileSize];
                    sp00[0] = r1;

                    DmaCopy32(3, &sp00, &gUnknown_03002280[bgIndex][r4 * tileSize],
                              gUnknown_03002280[bgIndex][3]);
                } else {
                    // _080041D8
                    for (; r4 <= gUnknown_03002280[bgIndex][3]; r4++) {
                        u16 r1 = gUnknown_03004D80[bgIndex];
                        sp00[0] = r1;
                        DmaCopy32(3, &sp00, &gUnknown_03002280[bgIndex][r4 * tileSize],
                                  ARRAY_COUNT(gUnknown_03002280[0]));
                    }
                }
            }
            // _0800422C
            DmaFill32(3, 0, spVramPtr, 4);
        }
    }

    return 1;
}
END_NONMATCH

// Copies the given tileOffsets of the given tilesSrc into the
// given dest.
// Also sets some stuff in the vram blend regs
// My guess is that this was designed for rendering text based tiles to the screen
s32 sub_8004274(void *dest, void *tilesSrc, u16 param2, u16 param3, u8 bgCtrlIndex,
                u8 *tileOffsets, u8 param6)
{
    u8 i = 0;

    u16 tileBase = gBgCntRegs[bgCtrlIndex] & BGCNT_CHARBASE(0x3);
    void *vramTiles = (void *)(VRAM + (tileBase * 4096));

    u16 blendTarget = (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BG2
                       | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0)
        & gBgCntRegs[bgCtrlIndex];
    u16 *vramBlend
        = ({ (u16 *)(VRAM + (blendTarget * 8)); }) + param3 * TILE_SIZE_4BPP + param2;

    for (; tileOffsets[i] != 0; i++) {
        void *copyDest = dest + (i * TILE_SIZE_4BPP);
        u16 offset;
        u16 *addr;
        CpuFastCopy(tilesSrc + (tileOffsets[i] * TILE_SIZE_4BPP), copyDest,
                    TILE_SIZE_4BPP);

#ifndef NON_MATCHING
        offset = (u16)((((u16 *)copyDest - (u16 *)vramTiles) << 12) >> 16);
        vramBlend++;
        vramBlend--;
#else
        // divide by tilesize 4bpp
        offset = (u16)(copyDest - vramTiles) >> 5;
#endif

        addr = vramBlend;
        addr += i;

        *addr = (param6 * 4096) | offset;
    }

    return i * TILE_SIZE_4BPP;
}

// (-2)
// This is different to animCmd_GetPalette in that:
// - gBgPalette is used instead of gObjPalette
// - gFlags ->  FLAGS_UPDATE_BACKGROUND_PALETTES
//   instead of FLAGS_UPDATE_SPRITE_PALETTES
s32 animCmd_GetPalette_COPY(void *cursor, Sprite *sprite)
{
    ACmd_GetPalette *cmd = (ACmd_GetPalette *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetPalette);

    if (!(sprite->unk10 & SPRITE_FLAG_MASK_18)) {
        s32 paletteIndex = cmd->palId;

        DmaCopy32(3, &gUnknown_03002794->palettes[paletteIndex * 16],
                  &gBgPalette[sprite->focused * 16 + cmd->insertOffset],
                  cmd->numColors * 2);

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    return 1;
}

// (-3)
s32 animCmd_JumpBack_COPY(void *cursor, Sprite *sprite)
{
    ACmd_JumpBack *cmd = cursor;
    sprite->unk14 -= cmd->offset;

    return 1;
}

// (-4)
s32 animCmd_End_COPY(void *cursor, Sprite *sprite)
{
    sprite->unk10 |= SPRITE_FLAG_MASK_14;

    return 0;
}

// (-5)
s32 animCmd_PlaySoundEffect_COPY(void *cursor, Sprite *sprite)
{
    ACmd_PlaySoundEffect *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_PlaySoundEffect);

    m4aSongNumStart(cmd->songId);

    return 1;
}

// (-7)
s32 animCmd_TranslateSprite_COPY(void *cursor, Sprite *sprite)
{
    ACmd_TranslateSprite *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_TranslateSprite);

    sprite->x += cmd->x;
    sprite->y += cmd->y;

    return 1;
}

// (-8)
s32 animCmd_8_COPY(void *cursor, Sprite *sprite)
{
    ACmd_8 *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_8);

    return 1;
}

s32 animCmd_SetIdAndVariant_COPY(void *cursor, Sprite *sprite)
{
    ACmd_SetIdAndVariant *cmd = cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_SetIdAndVariant);

    sprite->graphics.anim = cmd->animId;
    sprite->unk21 = 0xFF;
    sprite->variant = cmd->variant;

    return -1;
}

s32 animCmd_10_COPY(void *cursor, Sprite *sprite)
{
    sprite->unk14 += AnimCommandSizeInWords(ACmd_10);

#ifdef UBFIX
    return 1; // I think this should be the correct behavior?
#else
    return (s32)cursor;
#endif
}

// This is not a NOP-instruction in the regular version
s32 animCmd_SetSpritePriority_COPY(void *cursor, Sprite *sprite)
{
    sprite->unk14 += AnimCommandSizeInWords(ACmd_SetSpritePriority);
    return 1;
}

// This is not a NOP-instruction in the regular version
s32 animCmd_12_COPY(void *cursor, Sprite *sprite)
{
    sprite->unk14 += AnimCommandSizeInWords(ACmd_12);
    return 1;
}

const u8 sUnknown_080984A4[] = {
    /* 0x00 */ Q_24_8_TO_INT(Q_24_8(0.5 * 2)),
    /* 0x01 */ Q_24_8_TO_INT(Q_24_8(0.0 * 2)),
    /* 0x02 */ Q_24_8_TO_INT(Q_24_8(1.0 * 2)),
    /* 0x03 */ Q_24_8_TO_INT(Q_24_8(1.5 * 2)),
    /* 0x04 */ Q_24_8_TO_INT(Q_24_8(3.0 * 2)),
    /* 0x05 */ Q_24_8_TO_INT(Q_24_8(3.5 * 2)),
    /* 0x06 */ Q_24_8_TO_INT(Q_24_8(2.5 * 2)),
    /* 0x07 */ Q_24_8_TO_INT(Q_24_8(2.0 * 2)),
};

// This function gets called as long as an enemy is on-screen.
// Potentially something to do with collision/distance?
s32 sub_8004418(s16 x, s16 y)
{
    u8 index = 0;
    u8 array[ARRAY_COUNT(sUnknown_080984A4)];

    s16 fraction;
    s32 result;

    memcpy(&array, sUnknown_080984A4, ARRAY_COUNT(sUnknown_080984A4));

    if ((x | y) == 0) {
        result = -1;
    } else {
        // _0800444C
        if (x <= 0) {
            x = -x;
            index = 4;
        }
        if (y <= 0) {
            y = -y;
            index += 2;
        }
        if (x >= y) {
            // fraction = y*0.5 / x
            y *= Q_24_8(0.5);
            if (x == 0) {
                // _0800447C
                fraction = y;
            } else {
                // _08004480
                fraction = y / x;
            }
        } else {
            // _08004488
            index += 1;

            x *= Q_24_8(0.5);
            if (y == 0) {
                fraction = x;
            } else {
                fraction = x / y;
            }
        }

        // If array[index] is odd,
        if (array[index] & 0x01) {
            fraction = Q_8_8(0.5) - fraction;
        }

        {
            s32 val = array[index] * Q_24_8(0.5);
            fraction += val;
            result = ((u32)(fraction << 22) >> 22);
        }
    }
    return result;
}

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
    u32 remainder = num;

    result = 0;
    for (i = 0; i < 4; i++) {
        s32 divisor = Div(remainder, 10);
        lowDigit = remainder - divisor * 10;
        remainder = (u16)divisor;

        result |= lowDigit << (i << 2);
    }

    return result;
}

s32 sub_8004558(Sprite *sprite)
{
    SPRITE_MAYBE_SWITCH_ANIM(sprite);

    if (sprite->unk10 & SPRITE_FLAG_MASK_14)
        return 0;

    if (sprite->unk1C > 0)
        sprite->unk1C -= 16 * sprite->unk22;
    else {

        // _080045B8
        s32 ret;
        ACmd *cmd;
        ACmd *script;
        ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gUnknown_03002794->animations[sprite->graphics.anim];
        script = variants[sprite->variant];
        cmd = ReadInstruction(script, sprite->unk14);
        while (cmd->id < 0) {
            ret = animCmdTable[~cmd->id](cmd, sprite);
            if (ret != 1) {
#ifndef NON_MATCHING
                register ACmd *newScript asm("r2");
#else
                ACmd *newScript;
#endif
                if (ret != -1) {
                    return ret;
                }

                // animation has changed
                variants = gUnknown_03002794->animations[sprite->graphics.anim];
                newScript = variants[sprite->variant];

                // reset cursor
                sprite->unk14 = 0;

                // load the new script
                script = newScript;
            }
            cmd = ReadInstruction(script, sprite->unk14);
        }

        // Display the image 'index' for 'delay' frames
        sprite->unk1C += (((ACmd_ShowFrame *)cmd)->delay << 8);
        sprite->unk1C -= sprite->unk22 * 16;
        {
            s32 frame = ((ACmd_ShowFrame *)cmd)->index;
            if (frame != -1) {
                const struct SpriteTables *sprTables = gUnknown_03002794;

                sprite->dimensions
                    = &sprTables->dimensions[sprite->graphics.anim][frame];
            } else {
                sprite->dimensions = (void *)-1;
            }
        }

        sprite->unk14 += 2;
    }
    return 1;
}

// (-1)
s32 animCmd_GetTiles(void *cursor, Sprite *sprite)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetTiles);

    if ((sprite->unk10 & SPRITE_FLAG_MASK_19) == 0) {
        if (cmd->tileIndex < 0) {
            sprite->graphics.src
                = &gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            sprite->graphics.size = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            sprite->graphics.src
                = &gUnknown_03002794->tiles_4bpp[cmd->tileIndex * TILE_SIZE_4BPP];
            sprite->graphics.size = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &sprite->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
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
        if (sprite->unk10 & SPRITE_FLAG_MASK_Y_FLIP) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk5, sprite->unk28[r3].unk7);
        }

        if (sprite->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk4, sprite->unk28[r3].unk6);
        }
    }

    return 1;
}