#include "global.h"
#include "gba/syscall.h"
#include "main.h"
#include "m4a.h"
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

#if 1
bool32 sub_8002B20(void)
{
    u16 sp00;
    s32 sp04 = 0;
    u32 sp08;
    u32 sp0C; // palette-size ?
    u32 affine; // -> r3

    while (gUnknown_03002AE4 != gUnknown_0300287C) {
        Background *bg;

        if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
            return 0;

        // _08002B64
        REG_VCOUNT;
        {
            s32 index = gUnknown_03002AE4;
            bg = gUnknown_03001800[index];
            index = (index + 1) % ARRAY_COUNT(gUnknown_03001800);
            gUnknown_03002AE4 = index;

            if ((bg->unk2E & 0x20) && bg->unk30 == bg->unk34)
                continue;
        }
        // NOTE: register r4 = sp00
        sp00 = bg->unk14;

        {
            u32 v = (bg->unk2E & 0x3);
            if (v > 1 && ((gDispCnt & 0x3) > 0)) {
                affine = (gBgCntRegs[v] >> 14);
                sp0C = 0x400 << affine;
                sp08 = 1;
            } else {
                // _08002BD8
                sp0C = 0x20;
                affine = (gBgCntRegs[v] >> 14);
                if ((affine == 1) || (affine == 3)) {
                    sp04 = 0x800;
                }
                sp08 = 2;
            }

            // _08002BF8
            sp0C = (u16)(sp0C * sp08);
        }

        if (!(bg->unk2E & 0x20)) {
            if (!(bg->unk2E & 0x40)) {
                // _08002C20
                u32 r1 = bg->unkC + (bg->unk24 * sp0C);
                u16 *r7 = (u16 *)(r1 * (bg->unk22 * sp08));
                u16 r5 = bg->unk28;

                // r2 <- bg->unk2E
                // r3 <- affine
                // r4 <- sp00
                // r5 <- bg->unk28
                // sb = 0x20
                if (bg->unk2E & 0x100) {
                    // _08002C46
                    if (bg->unk2E & 0x80) {
                        u32 r0Index = (((bg->unk20 + r5) - 1) * sp00) * sp08;
                        void *r2Ptr = &((u8 *)bg->unk10)[r0Index];
                        u16 *r4Ptr = r2Ptr + (((bg->unk1E + bg->unk26) - 1) * sp08);

                        // _08002C7C
                        while (--r5 != (u16)-1) {
                            u16 i;

                            // _08002C9A
                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = (r4Ptr[0 - i] ^ 0xC00); // WTF? -i???
                            }

                            r7 = r2Ptr;
                            ((u8 *)r4Ptr) -= (sp00 * sp08);
                        }
                    } else {
                        // _08002CD4
                        u32 someIndex = (bg->unk20 * sp00) * sp08;
                        void *r2Ptr = &((u8 *)bg->unk10)[someIndex];
                        u16 *r4Ptr = r2Ptr + (((bg->unk1E + bg->unk26) - 1) * sp08);

                        // _08002D08
                        while (--r5 != (u16)-1) {
                            u16 i;

                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = (r4Ptr[0 - i] ^ 0x400); // WTF? -i???
                            }

                            r7 = r2Ptr;
                            ((u8 *)r4Ptr) -= (sp00 * sp08);
                        }
                    }
                } else {
                    // r2 <- bg->unk2E
                    // r3 <- affine
                    // r4 <- sp00
                    // r5 <- r5 = bg->unk28
                    // sb = 0x20
                    // _08002D50
                    if (bg->unk2E & 0x80) {
                        u32 r0Index = (((bg->unk20 + r5) - 1) * sp00) * sp08;
                        void *r1Ptr = &((u8 *)bg->unk10)[r0Index];
                        u16 *r4Ptr = (u16 *)(r1Ptr + (bg->unk1E * sp08));

                        while (--r5 != (u16)-1) {
                            u16 i;
                            u32 sb = sp00 * sp08;

                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = r4Ptr[i] ^ 0x800;
                            }

                            r4Ptr -= 16;
                        }
                    } else {
                        // _08002DD4
                        if ((affine & 1) && (sp08 == 2) && ((0x20 - bg->unk22) > 0)
                            && ((bg->unk26 + bg->unk22 - 0x20) > 0)) {
                            // __08002DF8
                            const u16 *r4Ptr = &bg->unk10[bg->unk20 * sp00] + bg->unk1E;
                            s32 sb = 0x20 * 2;

                            while (--r5 != (u16)-1) {
                                // _08002E1C
                                // r7 <- sp08
                                DmaCopy16(3, r4Ptr, sp08, sb);
                                DmaCopy16(3, &r4Ptr[0x20 / 2], &((u8 *)r7)[sp04], sb);

                                r7 += sp0C / 2;
                                ((u8 *)r4Ptr) += sp00 * sp08;
                            }

                        } else {
                            // __08002E74
                            u32 r0Index = bg->unk20 * sp00 * sp08;
                            void *r1Ptr = &((u8 *)bg->unk10)[bg->unk20 * sp00 * sp08];
                            void *r4Ptr = &((u8 *)r1Ptr)[bg->unk1E * sp08];

                            // r0 = r0Index
                            // r1 = r1Ptr
                            // r2 = sp00
                            // r4 = r4Ptr
                            // r6 = bg
                            // r7 =
                            while (--r5 != (u16)-1) {
                                // _08002EA4
                                DmaCopy16(3, r4Ptr, r7, (bg->unk26 * sp08));
                                ((u8 *)r7) += sp0C;
                                r4Ptr += sp00 * sp08;
                            }
                        }
                    }
                }
            } else {
                // r3 = affine
                // r6 = bg
                // _08002ED4
                u32 sp10 = bg->unk1E;
                u32 sp14 = bg->unk20;
                s32 sp18;
                s32 sp1C;
                s32 sp20;
                s32 sp38;
                u32 dmaFlags; // <- sp3C
                s32 i, j;

                // _08002EE8
                for (i = 0; i < bg->unk26;) {
                    s32 r1;
                    s32 r5Res;
                    u32 r8;
                    s32 sp10_i = sp10 + i;

                    sp18 = Div(sp10_i, bg->unk14);
                    r1 = bg->unk14;
                    r5Res = sp18;

                    sp1C = sp10_i - r5Res * bg->unk14;
                    r1 -= sp1C;

                    if (r1 > (bg->unk26 - i))
                        r1 = (bg->unk26 - i);

                    sp20 = r1 * sp08;
                    sp38 = r1 + i;

                    // _08002F28
                    // sb = j
                    r8 = bg->unk28;
                    for (j = 0; j < bg->unk28; j++) {
                        void *dmaSrc, *dmaDest;
                        s32 r4 = sp14 + i;
                        s32 r5;
                        const u16 *r1Ptr;
                        u16 v;
                        s32 result = Div(sp14, bg->unk16);
                        r4 -= result * bg->unk16;
                        r5 = bg->unk16 - r4;

                        result *= bg->unk3C;
                        r1Ptr = &bg->unk38[result];

                        // r1 = v
                        v = r1Ptr[sp18] * bg->unk14 * bg->unk16;

                        v += r4 * bg->unk14 + sp1C;
                        v *= sp08;

                        dmaSrc = ((u8 *)bg->unk10) + v;

                        {
                            s32 r0 = bg->unkC + bg->unk24;
                            r0 += sp0C * j + bg->unk22;
                            dmaDest = (void *)(r0 + sp08 * i);
                        }

                        j += r5;

                        if (r5 > r8)
                            r5 = r8;

                        r8 -= r5;

                        {
                            u32 dmaSrcSize = sp00 * sp08;
                            while (r5--) {
                                dmaFlags = (sp20 + (sp20 >> 31)) / 2;
                                DmaCopy16(3, dmaSrc, dmaDest, dmaFlags);
                                dmaSrc += dmaSrcSize;
                                dmaDest += sp0C;
                            }
                        }
                    }

                    i = sp38;
                }
                // _08002FD6
            }
        } else {
            // _08002FE8
        }
        // _080035FA
        REG_VCOUNT;
        bg->unk34 = bg->unk30;
        bg->unk36 = bg->unk32;
    };

    return 1;
}
#endif

void UpdateBgAnimationTiles(Background *bg)
{
    struct MapHeader *header = gUnknown_03002260[bg->unk1C].x;
    if (header->animFrameCount) {
        if (header->animDelay <= ++bg->animDelayCounter) {
            u32 animTileSize;

            bg->animDelayCounter = 0;

            if (header->animFrameCount <= ++bg->animFrameCounter)
                bg->animFrameCounter = 0;

            animTileSize = header->animTileSize;

            if (!(bg->unk2E & 0x200)) {
                if (bg->animFrameCounter == 0) {
                    bg->graphics.src = header->tileset;
                } else {
                    u8 *ts = header->tileset;
                    u32 size = header->tilesetSize;
                    ts += size;
                    ts += (bg->animFrameCounter - 1) * animTileSize;
                    bg->graphics.src = ts;
                }
            } else {
                u8 *ts = bg->graphics.dest;
                ts += header->tilesetSize;
                ts += (bg->animFrameCounter * animTileSize);
                bg->graphics.src = ts;
            }
            {
                u32 queueIndex;
                bg->graphics.size = animTileSize;
                gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &bg->graphics;
                queueIndex = gVramGraphicsCopyQueueIndex + 1;
                queueIndex %= ARRAY_COUNT(gVramGraphicsCopyQueue);
                gVramGraphicsCopyQueueIndex = queueIndex;
            }
        }
    }
}

// Differences to sub_8004558:
// - SPRITE_MAYBE_SWITCH_ANIM gets executed *after* the if.
// - Uses animCmdTable_2 instead of animCmdTable
s32 sub_80036E0(Sprite *sprite)
{
    ACmd **variants;
    ACmd *script;
    ACmd *cmd;

    if (sprite->unk10 & 0x4000)
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

    if ((sprite->unk10 & 0x80000) == 0) {
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
        if (sprite->unk10 & 0x00000800) {
            XOR_SWAP(sprite->unk28[r3].unk5, sprite->unk28[r3].unk7);
        }

        if (sprite->unk10 & 0x00000400) {
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
            BgAffineRegs_Alt *affineRegs;
            s32 affineX, affineY;
            s32 posX, posY;

            posX = dims->offsetX - sprite->x;
            affineX = Mod(posX, 16);
            // TODO: Remove this cast after replacing 'BgAffineRegs'
            affineRegs = (BgAffineRegs_Alt *)&gBgAffineRegs;
            affineRegs->regs[bgId - 2].x = Q_24_8(affineX);

            posY = dims->offsetY - sprite->y;
            affineY = Mod(posY, 8);
            affineRegs->regs[bgId - 2].y = Q_24_8(affineY);
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
                 struct BgAffineRegs *affine)
{
    affine->bg2pa = ((COS(p0) >> 6) * (s16)Div(0x10000, p1)) >> 8;
    affine->bg2pb = ((SIN(p0) >> 6) * (s16)Div(0x10000, p1)) >> 8;
    affine->bg2pc = ((-SIN(p0) >> 6) * (s16)Div(0x10000, p2)) >> 8;
    affine->bg2pd = ((COS(p0) >> 6) * (s16)Div(0x10000, p2)) >> 8;

    p5 *= -1;
    p6 *= -1;
    {
        // __sub_8003FA8
        s32 r1 = (s16)affine->bg2pa * p5;
        s32 r3 = (s16)affine->bg2pb * p6;
        r1 += r3;
        affine->bg2x = r1 + p3 * 256;
    }
    {
        // __sub_8003FBE
        s32 r1 = (s16)affine->bg2pc * p5;
        s32 r3 = (s16)affine->bg2pd * p6;
        r1 += r3;
        affine->bg2y = r1 + p4 * 256;
    }
}

NONMATCH("asm/non_matching/sub_8004010.inc", u32 sub_8004010(void))
{
    u8 bgIndex;
    u16 sp00[2];
    u8 r4;
    u32 sp08;
    u8 *spVramPtr;
    u16 bgSize_TxtOrAff;

    for (bgIndex = 0; bgIndex < 4; bgIndex++) {

        if ((gUnknown_03002280[bgIndex][1] == gUnknown_03002280[bgIndex][3])
            && (gUnknown_03002280[bgIndex][2] == gUnknown_03002280[bgIndex][0]))
            continue;

        { // _08004056
            u16 target = gBgCntRegs[bgIndex];
            u16 *vramBgCtrl = (u16 *)VRAM;
            target &= (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BG2
                       | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0);
            vramBgCtrl += target * 4;

            r4 = gUnknown_03002280[bgIndex][1];
            sp08 = gUnknown_03002280[bgIndex][0];

            if ((bgIndex > 1)
                && (gDispCnt & (DISPCNT_MODE_2 | DISPCNT_MODE_1 | DISPCNT_MODE_0))) {
                // _0800408E
                spVramPtr = (u8 *)&vramBgCtrl[sp08];
                bgSize_TxtOrAff = 0x10 << (gBgCntRegs[bgIndex] >> 14);

                if (gUnknown_03002280[bgIndex][3] == 0xFF) {
                    // _080040A2
                    u16 v = gUnknown_03004D80[bgIndex];
                    u32 value;
                    v |= v << 8;
                    sp00[0] = v;

                    value = ((gUnknown_03002280[bgIndex][3] - r4) * bgSize_TxtOrAff);
                    DmaCopy16(3, &sp00, &spVramPtr[bgSize_TxtOrAff * r4],
                              (((s32)(value + (value >> 31))) / 2));
                } else {
                    // _080040F8
                    // u8 i2 = i + 1;
                    for (; r4 < gUnknown_03002280[bgIndex][3]; r4++) {
                        u16 v = gUnknown_03004D80[bgIndex];
                        u32 value;
                        v |= v << 8;
                        sp00[0] = v;

                        DmaCopy32(3, &sp00, &spVramPtr[bgIndex * r4],
                                  (s32)(bgIndex * 4 - sp08 + 1));
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

s32 sub_8004274(u16 *param0, u16 *cpuFastSetSrc, u16 param2, u16 param3, u8 bgCtrlIndex,
                u8 *tileCounts, u8 param6)
{
    u8 i = 0;

    u16 tileBase = gBgCntRegs[bgCtrlIndex] & BGCNT_CHARBASE(0x3);
    u16 *vramTiles = (u16 *)(VRAM + (tileBase << 12));

    u16 blendTarget = (BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BG2
                       | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0)
        & gBgCntRegs[bgCtrlIndex];
    u16 *vramBlend = ({ (u16 *)(VRAM + (blendTarget * 8)); }) + param3 * 32 + param2;

    for (; tileCounts[i] != 0; i++) {
        u16 *copyDest = &param0[i * 16];
        u16 offset;
        u16 *addr;
        CpuFastSet(&cpuFastSetSrc[tileCounts[i] * 16], copyDest, 8);

        offset = (u16)(((copyDest - vramTiles) << 12) >> 16);

#ifndef NON_MATCHING
        vramBlend++;
        vramBlend--;
#endif
        addr = vramBlend;
        addr += i;

        *addr = (param6 * 4096) | offset;
    }

    return i * 32;
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

    if (!(sprite->unk10 & 0x40000)) {
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
    sprite->unk10 |= 0x4000;

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

    if (sprite->unk10 & 0x4000)
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
        // _08004628

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

    if ((sprite->unk10 & 0x80000) == 0) {
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
        if (sprite->unk10 & 0x00000800) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk5, sprite->unk28[r3].unk7);
        }

        if (sprite->unk10 & 0x00000400) {
            SWAP_AND_NEGATE(sprite->unk28[r3].unk4, sprite->unk28[r3].unk6);
        }
    }

    return 1;
}
