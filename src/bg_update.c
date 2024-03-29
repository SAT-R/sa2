#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"

#define CastPointer(ptr, index) (void *)&(((u8 *)(ptr))[(index)])

void DrawBackground(Background *background)
{
    struct MapHeader *mapHeader = gTilemapsRef[background->tilemapId];
    const u16 *pal;
    u32 palSize;
    u16 gfxSize;

    background->xTiles = mapHeader->h.xTiles;
    background->yTiles = mapHeader->h.yTiles;
    background->graphics.src = mapHeader->h.tiles;
    gfxSize = mapHeader->h.tilesSize;
    background->graphics.size = gfxSize;

    if (!(background->flags & BACKGROUND_UPDATE_GRAPHICS)) {
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &background->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        background->flags ^= BACKGROUND_UPDATE_GRAPHICS;
    }

    pal = mapHeader->h.palette;
    palSize = mapHeader->h.palLength;
    background->paletteOffset = mapHeader->h.palOffset;

    if (!(background->flags & BACKGROUND_UPDATE_PALETTE)) {
        DmaCopy16(3, pal, gBgPalette + background->paletteOffset,
                  palSize * sizeof(*pal));
        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        background->flags ^= BACKGROUND_UPDATE_PALETTE;
    }

    background->layout = mapHeader->h.map;

    if (background->flags & BACKGROUND_FLAG_IS_LEVEL_MAP) {
        background->metatileMap = mapHeader->metatileMap;
        background->mapWidth = mapHeader->mapWidth;
        background->mapHeight = mapHeader->mapHeight;
    }

    gUnknown_03001800[gUnknown_0300287C] = background;
    gUnknown_0300287C = (gUnknown_0300287C + 1) % ARRAY_COUNT(gUnknown_03001800);
}

// (85.37%) https://decomp.me/scratch/617Jb
NONMATCH("asm/non_matching/engine/sub_8002B20.inc", bool32 sub_8002B20(void))
{
    u16 sp00;
    s32 sp04 = 0;
    s32 sp08;
    u16 sp0C; // line-size ?
    u16 sp10;
    u16 sp14;
    u32 affine; // -> r3
    u32 bgId; // -> r5 = (bg->flags & BACKGROUND_FLAGS_MASK_BG_ID)
    s32 sb;
    u32 dmaSize;

    while (gUnknown_0300287C != gUnknown_03002AE4) {
        Background *bg;

        if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
            return 0;

        // _08002B64
        REG_VCOUNT;
        {
            Background **backgrounds = &gUnknown_03001800[0];
            s32 index = gUnknown_03002AE4;
            bg = backgrounds[index];
            index = (index + 1) % ARRAY_COUNT(gUnknown_03001800);
            gUnknown_03002AE4 = index;

            if ((bg->flags & BACKGROUND_FLAG_20) && (bg->scrollX == bg->prevScrollX)
                && bg->scrollY == bg->prevScrollY)
                continue;
        }
        // NOTE: register r4 = sp00
        sp00 = bg->xTiles;

        bgId = (bg->flags & BACKGROUND_FLAGS_MASK_BG_ID);
        if (bgId > 1 && ((gDispCnt & 0x3) > 0)) {
            affine = (gBgCntRegs[bgId] >> 14);
            sp0C = (0x10 << affine);
            sp08 = 1;
        } else {
            // _08002BD8
            sp0C = 0x20;
            affine = (gBgCntRegs[bgId] >> 14);
            if ((affine == 1) || (affine == 3)) {
                sp04 = 0x800;
            }
            sp08 = 2;
        }

        // _08002BF8
        sp0C = (u16)(sp0C * sp08);

        if (!(bg->flags & BACKGROUND_FLAG_20)) {
            if (!(bg->flags & BACKGROUND_FLAG_IS_LEVEL_MAP)) {
                // _08002C20
                u8 *r1 = CastPointer(bg->layoutVram, bg->unk24 * sp0C);
                u16 *r7 = CastPointer(r1, bg->unk22 * sp08);
                u16 r5 = bg->targetTilesY;

                // r2 <- bg->flags
                // r3 <- affine
                // r4 <- sp00
                // r5 <- bg->targetTilesY
                // sb = 0x20
                if (bg->flags & BACKGROUND_FLAG_100) {
                    // _08002C46
                    if (bg->flags & BACKGROUND_FLAG_80) {
                        u32 r0Index = (((bg->unk20 + r5) - 1) * sp00) * sp08;
                        void *r2Ptr = CastPointer(bg->layout, r0Index);
                        u16 *r4Ptr = CastPointer(
                            r2Ptr, ((bg->unk1E + bg->targetTilesX) - 1) * sp08);

                        // _08002C7C
                        while (r5-- != 0) {
                            u16 i;

                            // _08002C9A
                            for (i = 0; i < bg->targetTilesX; i++) {
                                r7[i] = (*(r4Ptr - i) ^ TileMask_FlipXY);
                            }

                            r7 = CastPointer(r7, sp0C);
                            r4Ptr = (void *)(((u8 *)r4Ptr) - (sp00 * sp08));
                        }
                    } else {
                        // _08002CD4
                        u32 someIndex = (bg->unk20 * sp00);
                        void *r2Ptr = CastPointer(bg->layout, someIndex * sp08);
                        u32 index2 = ((bg->unk1E + bg->targetTilesX) - 1);
                        u16 *r4Ptr = CastPointer(r2Ptr, index2 * sp08);

                        // _08002D08
                        while (r5-- != 0) {
                            u16 i;

                            for (i = 0; i < bg->targetTilesX; i++) {
                                r7[i] = (*(r4Ptr - i) ^ TileMask_FlipX);
                            }

                            r7 = CastPointer(r7, sp0C);
                            r4Ptr = CastPointer(r4Ptr, (sp00 * sp08));
                        }
                    }
                } else {
                    u16 *r4Ptr;
                    // r2 <- bg->flags
                    // r3 <- affine
                    // r4 <- sp00
                    // r5 <- r5 = bg->targetTilesY
                    // sb = 0x20
                    // _08002D50
                    if (bg->flags & BACKGROUND_FLAG_80) {
                        u32 r0Index = (((bg->unk20 + r5) - 1) * sp00);
                        void *r1Ptr = CastPointer(bg->layout, r0Index * sp08);
                        r4Ptr = CastPointer(r1Ptr, bg->unk1E * sp08);

                        while (r5-- != 0) {
                            u16 i;
                            void *r2;
                            sb = sp00 * sp08;

                            for (i = 0; i < bg->targetTilesX; i++) {
                                r7[i] = r4Ptr[i] ^ 0x800;
                            }

                            r7 = CastPointer(r7, sp0C);

                            r4Ptr = (u16 *)(((u8 *)r4Ptr) - sb);
                        }
                    } else {
                        // _08002DD4
                        if ((affine & 1) && (sp08 == 2) && ((0x20 - bg->unk22) > 0)
                            && ((bg->targetTilesX + bg->unk22 - 0x20) > 0)) {
                            s32 vR2;
                            // __08002DF8
                            r4Ptr = (u16 *)(&bg->layout[bg->unk20 * sp00] + bg->unk1E);
                            sb = (0x20 - bg->unk22) * 2;
                            vR2 = (bg->targetTilesX + bg->unk22 - 0x20) * 2;

                            while (r5-- != 0) {
                                // _08002E1C
                                // r7 <- sp08
                                DmaCopy16(3, r4Ptr, r7, sb);
                                DmaCopy16(3, CastPointer(r4Ptr, sb),
                                          CastPointer(r7, sp04), vR2);

                                r7 = CastPointer(r7, sp0C);
                                r4Ptr = CastPointer(r4Ptr, (sp00 * sp08));
                            }

                        } else {
                            // __08002E74
                            u32 r0Index = bg->unk20 * sp00 * sp08;
                            void *r1Ptr
                                = CastPointer(bg->layout, bg->unk20 * sp00 * sp08);
                            void *r4Ptr = CastPointer(r1Ptr, bg->unk1E * sp08);

                            // r0 = r0Index
                            // r1 = r1Ptr
                            // r2 = sp00
                            // r4 = r4Ptr
                            // r6 = bg
                            // r7 =
                            while (r5-- != 0) {
                                // _08002EA4
                                DmaCopy16(3, r4Ptr, r7, (s32)(bg->targetTilesX * sp08));
                                r7 = CastPointer(r7, sp0C);
                                r4Ptr = CastPointer(r4Ptr, sp00 * sp08);
                            }
                        }
                    }
                }
            } else {
                // r3 = affine
                // r6 = bg
                // _08002ED4
                s32 sp18;
                s32 sp1C;
                u32 sp20;
                s32 sp38;
                u32 dmaFlags; // <- sp3C
                s32 i, j;
                sp10 = bg->unk1E;
                sp14 = bg->unk20;

                // _08002EE8
                for (i = 0; i < bg->targetTilesX;) {
                    s32 r1;
                    s32 r5Res;
                    s32 r8;
                    s32 sp10_i = sp10 + i;
                    s32 temp;

                    sp18 = Div(sp10_i, bg->xTiles);
                    r1 = bg->xTiles;
                    r5Res = sp18;

                    sp1C = sp10_i - r5Res * bg->xTiles;

                    r8 = bg->targetTilesY;
                    temp = (bg->targetTilesX - i);
                    r1 -= sp1C;
                    if (r1 > temp)
                        r1 = (bg->targetTilesX - i);

                    sp20 = r1 * sp08;

                    // _08002F28
                    // sb = j
                    for (j = 0; j < bg->targetTilesY;) {
                        void *dmaSrc, *dmaDest;
                        s32 r5;
                        register const u16 *r1Ptr asm("r1");
                        register void *r2Ptr asm("r2");
                        register void *r0Ptr asm("r0");
                        s32 temp2;
                        u32 v;
                        s32 r4 = sp14 + j;
                        s32 result = Div(r4, bg->yTiles);
                        r4 -= result * bg->yTiles;
                        r5 = bg->yTiles - r4;

                        result *= bg->mapWidth;
                        r2Ptr = (void *)bg->metatileMap;
                        temp2 = sp18 << 1;
                        r0Ptr = CastPointer(r2Ptr, result << 1);
                        r1Ptr = CastPointer(r0Ptr, temp2);

                        // r1 = v
                        v = *((u16 *)r1Ptr) * bg->xTiles * bg->yTiles;
                        v += r4 * bg->xTiles + sp1C;
                        v *= sp08;

                        dmaSrc = ((u8 *)bg->layout) + v;

                        {
                            void *r0;
                            r0 = CastPointer(bg->layoutVram, bg->unk24);
                            r0 = CastPointer(r0, sp0C * j);
                            r0 = CastPointer(r0, bg->unk22);
                            dmaDest = CastPointer(r0, i * sp08);
                        }

                        j += r5;

                        if (r5 > r8)
                            r5 = r8;

                        r8 -= r5;

                        while (r5-- != 0) {
                            dmaFlags = sp20;
                            DmaCopy16(3, dmaSrc, dmaDest, (s32)dmaFlags);
                            dmaDest += sp0C;
                            dmaSrc += sp00 * sp08;
                        }
                    }

                    i += r1;
                }
                // _08002FD6
            }
        } else {
            // r2 <- bg->flags
            // r3 <- bg->unk30
            // r4 <- sp00 == bg->xTiles
            // r5 <- bgId
            // _08002FE8
            if (!(bg->flags & BACKGROUND_FLAG_IS_LEVEL_MAP)) {
                u32 vR2 = bg->xTiles;
                while (bg->scrollX >= sp00 * 8)
                    bg->scrollX -= sp00 * 8;

                while (bg->scrollY >= bg->yTiles * 8) {
                    bg->scrollY -= bg->yTiles * 8;
                }
            }
            //_08003034
            gBgScrollRegs[bgId][0] = bg->scrollX & 0x7;
            gBgScrollRegs[bgId][1] = bg->scrollY & 0x7;

            if ((bg->prevScrollX >> 3 != bg->scrollX >> 3)
                || (bg->prevScrollY >> 3 != bg->scrollY >> 3)) {
                if (!(bg->flags & BACKGROUND_FLAG_IS_LEVEL_MAP)) {
                    // _08003072
                    // TODO: Something'S wrong with the types here (r2 should be s16?)
                    u16 *r7Ptr;
                    s16 r2;
                    s32 r4;
                    u16 r5;
                    u16 *sp3C;
                    u32 notherIndex;
                    sp10 = (u16)((bg->scrollX >> 3) + bg->unk1E);
                    sp14 = (u16)((bg->scrollY >> 3) + bg->unk20);

                    notherIndex = (bg->unk24 * sp0C);
                    r7Ptr = CastPointer(bg->layoutVram, notherIndex);
                    r7Ptr = CastPointer(r7Ptr, bg->unk22 * sp08);

                    if (((bg->targetTilesX + sp10) + 1) > bg->xTiles) {
                        r2 -= (bg->xTiles - 1);
                    } else {
                        r2 = 0;
                    }

                    r5 = bg->targetTilesY + 1;
                    if (bg->flags & BACKGROUND_FLAG_100) {
                        // _080030D4
                        if (bg->flags & BACKGROUND_FLAG_80) {
                            // _080030DC
                            u32 index = ((bg->unk20 + r5) - 1);
                            u16 *r1Ptr = (u16 *)&((u8 *)bg->layout)[r4 * index * sp08];
                            u32 index2 = ((bg->unk1E + bg->targetTilesX) - 1);
                            u16 *r4Ptr = &r1Ptr[index2 * sp08];

                            while (r5-- != 0) {
                                // _08003108
                                u16 i; // <- r3
                                for (i = 0; i < bg->targetTilesX; i++) {
                                    u32 mask = TileMask_FlipXY;
                                    // _08003126
                                    sp3C = &r7Ptr[i];
                                    *sp3C = (r4Ptr[0 - i] ^ mask);
                                }
                            }
                        } else {
                            // _08003158
                            u32 index;
                            u16 *r1Ptr;
                            u32 index2;
                            u16 *r4Ptr;
                            index = bg->unk20;
                            index *= r4;
                            index *= sp08;
                            r1Ptr = (u16 *)&((u8 *)bg->layout)[index];
                            index2 = bg->unk1E + bg->targetTilesX - 1;
                            r4Ptr = CastPointer(r1Ptr, index2 * sp08);

                            while (r5-- != 0) {
                                // _08003180
                                u16 i;
                                for (i = 0; i < bg->targetTilesX; i++) {
                                    // _0800319E
                                    sp3C = &r7Ptr[i];
                                    *sp3C = (r4Ptr[0 - i] ^ TileMask_FlipX);
                                }
                            }
                        }
                    } else {
                        // _080031D0
                        if (bg->flags & BACKGROUND_FLAG_80) {
                            // _080031D8
                            u32 index = ((sp14 + r5) - 1);
                            u16 *r0Ptr = (u16 *)&((u8 *)bg->layout)[r4 * index * sp08];
                            u32 index2 = sp10;
                            u16 *r4Ptr = &r0Ptr[index2 * sp08];

                            while (r5-- != 0) {
                                u16 i = 0;

                                for (; i < bg->targetTilesX; i++) {
                                    sp3C = &r7Ptr[i];
                                    *sp3C = r4Ptr[i] ^ TileMask_FlipY;
                                }
                                r7Ptr = CastPointer(r7Ptr, sp0C);
                                r4Ptr = (void *)(((u8 *)r4Ptr) - sp00 * sp08);
                            }
                        } else {
                            // _08003254
                            u32 index = sp14;
                            u16 *r0Ptr = (u16 *)&((u8 *)bg->layout)[r4 * index * sp08];
                            u32 index2 = sp10;
                            u16 *r4Ptr = &r0Ptr[index2 * sp08];

                            // _08003298
                            while (r5-- != 0) {
                                dmaSize = bg->targetTilesX - (r2 - 1);
                                dmaSize *= sp08;
                                dmaSize += (dmaSize >> 31);
                                DmaCopy16(3, r4Ptr, r7Ptr, dmaSize);

                                r7Ptr = CastPointer(r7Ptr, sp0C);
                                r4Ptr = CastPointer(r4Ptr, sp00 * sp08);
                            }
                        }
                    }
                    // _080032C4
                    if (r2 != 0) {
                        // _080032CE
                        u8 *r1 = CastPointer(bg->layoutVram, bg->unk24 * sp0C); // <- r1
                        u32 displayTile = bg->unk22 + bg->xTiles - sp10; // <- r0
                        u16 *r7Ptr = CastPointer(r1, displayTile * sp08);
                        u16 r5 = (bg->targetTilesY + 1);

                        if (bg->flags & BACKGROUND_FLAG_100) {
                            if (bg->flags & BACKGROUND_FLAG_80) {
                                // _08003306
                                u32 index = ((sp14 + r5) - 1) * r4;
                                u16 *r1Ptr = (u16 *)&(((u8 *)bg->layout)[index * sp08]);
                                u16 *r4Ptr = (u16 *)((u8 *)&r1Ptr[(r2 - 1) * sp08]);

                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < bg->targetTilesX; i++) {
                                        r7Ptr[i] = *(r4Ptr - i) ^ TileMask_FlipXY;
                                    }
                                    r7Ptr = CastPointer(r7Ptr, sp0C);
                                    r4Ptr = (u16 *)(((u8 *)r4Ptr) - sp00 * sp08);
                                }
                            } else {
                                // _08003380
                                u32 index;
                                u8 *r1Ptr;
                                u16 *r4Ptr;
                                index = sp14;
                                index *= r4;
                                index *= sp08;
                                r1Ptr = &((u8 *)bg->layout)[index];
                                r4Ptr = (u16 *)&r1Ptr[(r2 - 1) * sp08];

                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < bg->targetTilesX; i++) {
                                        r7Ptr[i] = *(r4Ptr - i) ^ TileMask_FlipX;
                                    }
                                    ((u8 *)r7Ptr) += sp0C;
                                    ((u8 *)r4Ptr) += sp00 * sp08;
                                }
                            }
                        } else {
                            // _080033F4
                            if (bg->flags & BACKGROUND_FLAG_80) {
                                // _080033FC
                                u32 index = ((sp14 + r5) - 1) * r4;
                                u16 *r4Ptr = (u16 *)&((u8 *)bg->layout)[index * sp08];

                                u32 sp30 = r2;
                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < r2; i++) {
                                        u16 *sp3C = &r7Ptr[i];
                                        *sp3C = r4Ptr[i] ^ TileMask_FlipY;
                                    }
                                    r7Ptr = CastPointer(r7Ptr, sp0C);
                                    r4Ptr = (u16 *)(((u8 *)r4Ptr) - sp00 * sp08);
                                }
                            } else {
                                // _08003474
                                u32 index = (sp14 * r4);
                                u16 *r4Ptr = (u16 *)&((u8 *)bg->layout)[index * sp08];

                                while (r5-- != 0) {
                                    dmaSize = sp08 * r2;
                                    // _08003492
                                    DmaCopy16(3, r4Ptr, r7Ptr, (s32)dmaSize);

                                    r7Ptr = CastPointer(r7Ptr, sp0C);
                                    r4Ptr = CastPointer(r4Ptr, sp00 * sp08);
                                }
                            }
                        }
                    }
                } else {
                    // _080034DC
                    s32 i;
                    s32 j;
                    sp10 = (bg->scrollX >> 3) + bg->unk1E;
                    sp14 = (bg->scrollY >> 3) + bg->unk20;

                    for (i = 0; i < bg->targetTilesX;) {
                        // _08003500
                        s32 r4 = sp10 + i;
                        s32 sp24 = Div(r4, bg->xTiles);
                        s32 r1 = bg->xTiles;
                        s32 sp28 = r4 - (sp24 * r1);
                        s32 sp2C;
                        s32 sp34;
                        s32 r8 = bg->targetTilesY;
                        s32 r0 = bg->targetTilesX - i;
                        r1 = r1 - sp28;

                        if (r1 > r0)
                            r1 = r0;

                        // _0800352E
                        sp2C = r1 * sp08;

                        for (j = 0; j < bg->targetTilesY;) {
                            // _08003542
                            s32 divident = sp14 + j;
                            s32 yPos = Div(divident, bg->yTiles);
                            s32 new_r4 = divident - (yPos * bg->yTiles);
                            s32 r5 = bg->yTiles - new_r4;
                            yPos *= bg->mapWidth;

                            { // _0800355C
                                s32 metatileIndex = *(&bg->metatileMap[yPos] + sp24);
                                s32 otherVal;
                                metatileIndex *= bg->xTiles;
                                metatileIndex *= bg->yTiles;

                                otherVal = new_r4 * bg->xTiles;
                                otherVal += sp28;
                                otherVal += metatileIndex;

                                {
                                    // r4 <- dmaSrc
                                    u8 *dmaSrc;
                                    u8 *dmaDest;
                                    u8 *destPtr;
                                    u32 destIndex;
                                    dmaSrc = CastPointer(bg->layout, otherVal * sp08);
                                    destPtr = CastPointer(bg->layoutVram, bg->unk24);
                                    destPtr += sp0C * j;
                                    destPtr += +bg->unk22;
                                    dmaDest = CastPointer(destPtr, i * sp08);

                                    j += r5;

                                    if (r5 > r8)
                                        r5 = r8;
                                    r8 -= r5;

                                    // _080035A4
                                    while (r5-- != 0) {
                                        dmaSize = sp2C;
                                        DmaCopy16(3, dmaSrc, dmaDest, (s32)dmaSize);
                                        dmaDest += sp0C;
                                        dmaSrc += sp00 * sp08;
                                    }
                                }
                            }
                        }

                        i += r1;
                    }
                }
            }
        }
        // _080035FA
        REG_VCOUNT;
        bg->prevScrollX = bg->scrollX;
        bg->prevScrollY = bg->scrollY;
    };

    return 1;
}
END_NONMATCH
