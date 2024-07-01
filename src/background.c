#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a.h"

#include "animation_commands.h"

static AnimCmdResult animCmd_GetTiles_BG(void *, Sprite *);
static AnimCmdResult animCmd_GetPalette_BG(void *, Sprite *);
static AnimCmdResult animCmd_JumpBack_BG(void *, Sprite *);
static AnimCmdResult animCmd_End_BG(void *, Sprite *);
static AnimCmdResult animCmd_PlaySoundEffect_BG(void *, Sprite *);
static AnimCmdResult animCmd_AddHitbox_BG(void *, Sprite *);
static AnimCmdResult animCmd_TranslateSprite_BG(void *, Sprite *);
static AnimCmdResult animCmd_8_BG(void *, Sprite *);
static AnimCmdResult animCmd_SetIdAndVariant_BG(void *, Sprite *);
static AnimCmdResult animCmd_10_BG(void *, Sprite *);
static AnimCmdResult animCmd_SetSpritePriority_BG(void *, Sprite *);
static AnimCmdResult animCmd_SetOamOrder_BG(void *, Sprite *);

const AnimationCommandFunc animCmdTable_BG[12] = {
    animCmd_GetTiles_BG,          animCmd_GetPalette_BG,
    animCmd_JumpBack_BG,          animCmd_End_BG,
    animCmd_PlaySoundEffect_BG,   animCmd_AddHitbox_BG,
    animCmd_TranslateSprite_BG,   animCmd_8_BG,
    animCmd_SetIdAndVariant_BG,   animCmd_10_BG,
    animCmd_SetSpritePriority_BG, animCmd_SetOamOrder_BG,
};

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

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
        ADD_TO_GRAPHICS_QUEUE(&background->graphics);
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

#if 1 && !PORTABLE
        // TODO: This #if should not be required.
        if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
            return FALSE;
#endif

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
#ifndef NON_MATCHING
                        register const u16 *r1Ptr asm("r1");
                        register void *r2Ptr asm("r2");
                        register void *r0Ptr asm("r0");
#else
                        const u16 *r1Ptr;
                        void *r2Ptr;
                        void *r0Ptr;
#endif
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
                                    r7Ptr = CastPointer(r7Ptr, sp0C);
                                    r4Ptr = CastPointer(r4Ptr, sp00 * sp08);
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

void UpdateBgAnimationTiles(Background *bg)
{
    struct MapHeader *header = gTilemapsRef[bg->tilemapId];
    if (header->h.animFrameCount > 0) {
        if (header->h.animDelay <= ++bg->animDelayCounter) {
            u32 animTileSize;

            bg->animDelayCounter = 0;

            if (header->h.animFrameCount <= ++bg->animFrameCounter)
                bg->animFrameCounter = 0;

            animTileSize = header->h.animTileSize;

            if (!(bg->flags & BACKGROUND_UPDATE_ANIMATIONS)) {
                if (bg->animFrameCounter == 0) {
                    bg->graphics.src = header->h.tiles;
                } else {
                    const u8 *tiles = header->h.tiles;
                    u32 size = header->h.tilesSize;
                    tiles += size;
                    tiles += (bg->animFrameCounter - 1) * animTileSize;
                    bg->graphics.src = tiles;
                }
            } else {
                u8 *ts = bg->graphics.dest;
                ts += header->h.tilesSize;
                ts += (bg->animFrameCounter * animTileSize);
                bg->graphics.src = ts;
            }
            {
                bg->graphics.size = animTileSize;
                ADD_TO_GRAPHICS_QUEUE(&bg->graphics)
            }
        }
    }
}

// Differences to UpdateSpriteAnimation:
// - SPRITE_INIT_ANIM_IF_CHANGED gets executed *after* the if.
// - Uses animCmdTable_BG instead of animCmdTable
s32 sub_80036E0(Sprite *s)
{
    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)
        return 0;

    SPRITE_INIT_ANIM_IF_CHANGED(s);

    if (s->timeUntilNextFrame > 0)
        s->timeUntilNextFrame -= s->animSpeed * 16;
    else {
        s32 ret;
        const ACmd *cmd;
        const ACmd *script;
        const ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gRefSpriteTables->animations[s->graphics.anim];
        script = variants[s->variant];
        cmd = ReadInstruction(script, s->animCursor);
        while (cmd->id < 0) {
            // TODO: Fix types to make these const
            ret = animCmdTable_BG[~cmd->id]((void *)cmd, s);
            if (ret != 1) {
#ifndef NON_MATCHING
                register const ACmd *newScript asm("r1");
#else
                ACmd *newScript;
#endif
                if (ret != -1) {
                    return ret;
                }

                // animation has changed
                variants = gRefSpriteTables->animations[s->graphics.anim];
                newScript = (ACmd *)variants[s->variant];
                // reset cursor
                s->animCursor = 0;
                // load the new script
                script = newScript;
            }
            cmd = ReadInstruction(script, s->animCursor);
        }

        // Display the image 'index' for 'delay' frames
        s->timeUntilNextFrame += (((ACmd_ShowFrame *)cmd)->delay << 8);
        s->timeUntilNextFrame -= s->animSpeed * 16;
        {
            s32 frame = ((ACmd_ShowFrame *)cmd)->index;
            if (frame != -1) {
                const struct SpriteTables *sprTables = gRefSpriteTables;

                s->dimensions = &sprTables->dimensions[s->graphics.anim][frame];
            } else {
                s->dimensions = (void *)-1;
            }
        }

        s->animCursor += 2;
    }
    return 1;
}

// (-1)
// No differences to animCmd_GetTiles
static AnimCmdResult animCmd_GetTiles_BG(void *cursor, Sprite *s)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    if ((s->frameFlags & SPRITE_FLAG_MASK_19) == 0) {
        s32 tileIndex = cmd->tileIndex;

        if (tileIndex < 0) {
#ifdef BUG_FIX
            // Compilers *should* optimize the multiplication with a '<< 6', clearing the
            // high-bit. But if they don't, it could underflow.
            tileIndex &= ~0x80000000;
#endif
            s->graphics.src = &gRefSpriteTables->tiles_8bpp[tileIndex * TILE_SIZE_8BPP];
            s->graphics.size = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            s->graphics.src = &gRefSpriteTables->tiles_4bpp[tileIndex * TILE_SIZE_4BPP];
            s->graphics.size = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        ADD_TO_GRAPHICS_QUEUE(&s->graphics)
    }

    return 1;
}

// (-6)
// Differences to animCmd_AddHitbox:
// - uses XOR_SWAP macro instead of SWAP_AND_NEGATE
// TODO: rename animCmd_AddHitbox_BG
static AnimCmdResult animCmd_AddHitbox_BG(void *cursor, Sprite *s)
{
    ACmd_Hitbox *cmd = (ACmd_Hitbox *)cursor;
    s32 index = cmd->hitbox.index & 0xF;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    DmaCopy32(3, &cmd->hitbox, &s->hitboxes[index].index, 8);

    if ((cmd->hitbox.left == 0) && (cmd->hitbox.top == 0) && (cmd->hitbox.right == 0)
        && (cmd->hitbox.bottom == 0)) {
        s->hitboxes[index].index = -1;
    } else {
        if (s->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
            XOR_SWAP(s->hitboxes[index].top, s->hitboxes[index].bottom);
        }

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            XOR_SWAP(s->hitboxes[index].left, s->hitboxes[index].right);
        }
    }

    return 1;
}

void sub_8003914(Sprite *s)
{
    const SpriteOffset *dims;
    gUnknown_03004D10[gUnknown_03005390] = s;
    gUnknown_03005390++;

    if (s->dimensions != (void *)-1) {
        u32 bgId;

        dims = s->dimensions;
        bgId = SPRITE_FLAG_GET(s, BG_ID);
        // Potential UB:
        //     gDispCnt 'Mode' is an int, not a bitfield!
        if ((bgId > 1) && (gDispCnt & (DISPCNT_MODE_1 | DISPCNT_MODE_2))) {
            // __sub_8003954
            s32 affineX, affineY;
            s32 posX, posY;

            posX = dims->offsetX - s->x;
            affineX = Mod(posX, 16);
            gBgAffineRegs[bgId - 2].x = Q(affineX);

            posY = dims->offsetY - s->y;
            affineY = Mod(posY, 8);
            gBgAffineRegs[bgId - 2].y = Q(affineY);
        } else {
            // _080039A4
            s32 scrollX, scrollY;
            s32 posX, posY;

            posX = dims->offsetX - s->x;
            scrollX = Mod(posX, 16);
            gBgScrollRegs[bgId][0] = scrollX;

            posY = dims->offsetY - s->y;
            scrollY = Mod(posY, 8);
            gBgScrollRegs[bgId][1] = scrollY;
        }
    }
}

// Some VBlank function
// (21.30%) https://decomp.me/scratch/UfJX7
NONMATCH("asm/non_matching/engine/sub_80039E4.inc", bool32 sub_80039E4(void))
{
    // tilesize (could be 32 and get optimized out?)
    s32 sp28 = 5;

    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        return FALSE;
    }

    return TRUE;

    if (gUnknown_03005390 != 0) {
        OamDataShort oam;
        s32 r5;
        s32 sp08;
        u16 shapeAndSize;
        Sprite *s; // = sp0C
        const SpriteOffset *dims;
        u32 sp10; // bg_affine_pixelcount
        const u16 *const *oamSub;
        OamDataShort *sp1C;
        u32 tilesX; // =sp20
        u32 tilesY; // =ip
        s32 xPos; // =r8
        s32 yPos; // =r5
        u16 oamX, oamY;

        for (r5 = 0; r5 < gUnknown_03005390; r5++) {
            // _08003A1A
            s = gUnknown_03004D10[r5];
            dims = s->dimensions;

            if (dims != (void *)-1) {
                u32 bgId = SPRITE_FLAG_GET(s, BG_ID);
                void *bgVram
                    = (void *)BG_CHAR_ADDR((gBgCntRegs[bgId] & BGCNT_CHARBASE(3)) >> 2);
                void *bgBase = bgVram + ((gBgCntRegs[bgId] & BGCNT_SCREENBASE(31)) * 8);

                if (gBgCntRegs[bgId] & BGCNT_256COLOR) {
                    // tilesize (could be 32 and get optimized out?)
                    sp28 = 6;
                }

                // TODO: Remove this comment if it matches without what it says
                // NOTE: This might be the following:
                //       (... && ((gDispCnt & DISPCNT_MODE_1) || (gDispCnt &
                //       DISPCNT_MODE_2))) But it would be UB in that case, since the
                //       mode is determined by 3 bits, so the value could also be
                //       DISPCNT_MODE_3 or DISPCNT_MODE_5.
                if ((bgId >= 2) && ((gDispCnt & 0x3) != DISPCNT_MODE_0)) {
                    // _08003A84
                    // u16 sp24;
                    u8 sp30;
                    s32 shrunkTileId;
                    void *r7;
                    u16 affine = (gBgCntRegs[bgId] & BGCNT_AFF1024x1024) >> 14;
                    sp10 = ((1024 * 1024) << affine) >> 16;
                    oamSub = gRefSpriteTables->oamData;

                    // OAM entry for this sub-frame
                    sp1C = (OamDataShort *)oamSub[s->graphics.anim];
                    sp1C = &sp1C[dims->oamIndex];

                    for (sp08 = 0; sp08 < dims->numSubframes; sp08++) {
                        u16 tileId;
                        // _08003ABE
                        sp30 = sp10;
                        DmaCopy16(3, sp1C, &oam, sizeof(OamDataShort));
                        sp1C++;

                        shapeAndSize = oam.shape << 2;
                        shapeAndSize |= oam.size;
                        tilesX = gOamShapesSizes[shapeAndSize][0] >> 3;
                        tilesY = gOamShapesSizes[shapeAndSize][1] >> 3;
                        yPos = s->y - dims->offsetY;
                        xPos = s->x - dims->offsetX;
                        xPos &= ~0xF;
                        r7 = bgBase + (((oam.y + yPos) >> 3) * sp10);
                        tileId = ((size_t)(s->graphics.dest - bgVram)) >> sp28;
                        shrunkTileId = (oam.tileNum + tileId) & 0xFF;

                        // __08003B68
                        // sp08++;
                        while (tilesY-- != 0) {
                            // _08003B74
                            //(r7 + (oam.tileNum >> 3));

                            // UNFINISHED //
                        }
                    }
                } else {
                    // _08003C2C
                    u8 bgReg = (gBgCntRegs[bgId] >> 14);
                    if (bgReg == 2 || bgReg == 3) {
                        sp10 = 0x40;
                    }
                    // _08003C46
                    sp1C = (OamDataShort *)gRefSpriteTables->oamData[s->graphics.anim];
                    sp1C = (OamDataShort *)&sp1C[dims->oamIndex];

                    // _08003C78
                    for (sp08 = 0; sp08 < dims->numSubframes; sp08++) {
                        s32 someOffsetY;
                        u32 yFlip;
                        DmaCopy16(3, sp1C, &oam, sizeof(OamDataShort));
                        sp1C++;

                        shapeAndSize = oam.shape << 2;
                        shapeAndSize |= oam.size;
                        tilesX = gOamShapesSizes[shapeAndSize][0] >> 3;
                        tilesY = gOamShapesSizes[shapeAndSize][1] >> 3;
                        oamY = oam.y;
                        oamX = oam.x;
                        oam.paletteNum += s->palId;
                        // __08003CD8

                        yFlip = s->frameFlags >> SPRITE_FLAG_SHIFT_Y_FLIP;
                        yFlip ^= (dims->flip >> 1);

                        if (yFlip & 1) {
                            // ___08003CEE
                            // alt: oam.all.attr1 ^ 0x2000
                            oam.matrixNum ^= 0x4; // do flip Y in OAM
                            if (dims->flip & 0x1) {
                                // __08003D04
                                someOffsetY = s->y + dims->offsetY;
                            } else {
                                // _08003D2C
                                someOffsetY = s->y + (dims->height - dims->offsetY);
                            }
                            // _08003D3C
                            someOffsetY -= 8;
                            oamX = -oamX;
                        } else {
                            // _08003D4A
                            someOffsetY = s->y - dims->offsetY;
                        }

                        if ((SPRITE_FLAG_GET(s, X_FLIP) & 0x1) != (dims->flip & 0x1)) {

                        } else {
                            //_08003DB4
                        }
                    }
                }
            }
        }

        gUnknown_03005390 = 0;
    }

    return TRUE;
}
END_NONMATCH

void sub_8003EE4(u16 p0, s16 p1, s16 p2, s16 p3, s16 p4, s16 p5, s16 p6,
                 BgAffineReg *affine)
{
    affine->pa = (COS_24_8(p0) * (s16)Div(0x10000, p1)) >> 8;
    affine->pb = (SIN_24_8(p0) * (s16)Div(0x10000, p1)) >> 8;
    affine->pc = ((-SIN(p0) >> 6) * (s16)Div(0x10000, p2)) >> 8;
    affine->pd = (COS_24_8(p0) * (s16)Div(0x10000, p2)) >> 8;

    p5 *= -1;
    p6 *= -1;
    {
        // __sub_8003FA8
        s32 r1 = (s16)affine->pa * p5;
        s32 r3 = (s16)affine->pb * p6;

        affine->x = (r1 + r3) + p3 * 256;
    }
    {
        // __sub_8003FBE
        s32 r1 = (s16)affine->pc * p5;
        s32 r3 = (s16)affine->pd * p6;

        affine->y = (r1 + r3) + p4 * 256;
    }
}

// (57.61%) https://decomp.me/scratch/6Xm6S
// (58.36%) https://decomp.me/scratch/ClyxP
// (48.23%) https://decomp.me/scratch/bDTEe
#if 01
NONMATCH("asm/non_matching/engine/sub_8004010.inc", u32 sub_8004010(void))
{
    u8 bgIndex = 0;
    u16 sp00[2];
    u8 r4;
    u8 *spVramPtr;
    u16 bgSize_TxtOrAff;

    s32 sp08;

    for (; bgIndex < 4; bgIndex++) {

        if ((gUnknown_03002280[bgIndex][1] == gUnknown_03002280[bgIndex][3])
            && (gUnknown_03002280[bgIndex][0] == gUnknown_03002280[bgIndex][2]))
            continue;

        { // _08004056
            u16 target = gBgCntRegs[bgIndex];
            u16 *vramBgCtrl = (u16 *)VRAM;
            target &= BGCNT_SCREENBASE_MASK;
            vramBgCtrl += target * 4;

            r4 = gUnknown_03002280[bgIndex][1];

            sp08 = gUnknown_03002280[bgIndex][0];

            if ((bgIndex > 1)
                && (gDispCnt & (DISPCNT_MODE_2 | DISPCNT_MODE_1 | DISPCNT_MODE_0))) {
                // _0800408E
                spVramPtr = (u8 *)&vramBgCtrl[sp08];
                bgSize_TxtOrAff = (0x10 << (gBgCntRegs[bgIndex] >> 14));

                if (gUnknown_03002280[bgIndex][3] == 0xFF) {
                    // _080040A2
                    u16 v = gUnknown_03004D80[bgIndex];
                    u32 value;
                    v |= v << 8;

                    value = ((gUnknown_03002280[bgIndex][3] - r4) * bgSize_TxtOrAff);
                    DmaFill16(3, v, (void *)&spVramPtr[bgSize_TxtOrAff],
                              (((s32)(value + (value >> 31))) >> 1));
                } else {
                    // _080040F8
                    // u8 i2 = i + 1;
                    for (; r4 < gUnknown_03002280[bgIndex][3]; r4++) {
                        u16 v = gUnknown_03004D80[bgIndex];
                        v |= v << 8;

                        DmaFill16(
                            3, v, &spVramPtr[bgIndex * r4],
                            (s32)(bgIndex * 4 - gUnknown_03002280[bgIndex][0] + 1));
                    }
                }
                // then -> _0800422C
            } else {
                // _08004168
                int tileSize = 32;
                u8 *p1p;

                if ((u8)((gBgCntRegs[sp08] >> 14) - 2) <= 1)
                    tileSize = 64;

                if (gUnknown_03002280[bgIndex][2] == 0xFF) {
                    u8 r1 = gUnknown_03004D80[bgIndex];
                    p1p = &gUnknown_03002280[bgIndex][tileSize];
                    sp00[0] = r1;

#if 0
                    // TODO: This crashes the game after selecting a stage right now.
                    DmaFill16(3, sp00[0], &gUnknown_03002280[bgIndex][tileSize],
                              gUnknown_03002280[bgIndex][3] - r4);
#endif
                } else {
                    // _080041D8
                    for (; r4 <= gUnknown_03002280[bgIndex][3]; r4++) {
                        // _080041F6
                        DmaFill16(3, gUnknown_03004D80[bgIndex],
                                  &gUnknown_03002280[bgIndex][tileSize],
                                  ARRAY_COUNT(gUnknown_03002280[0]));
                    }
                }
            }
            // _0800422C
            DmaFill32(3, 0, &gUnknown_03002280[bgIndex],
                      ARRAY_COUNT(gUnknown_03002280[bgIndex]));
        }
    }

    return 1;
}
END_NONMATCH

#else
#define combine(v) ((v) << 8 | (v))

u32 sub_8004010(void)
{
    // Stack size: 0x18 bytes

    u8 bg; // bg index
    u16 sp00; // 4 : num backgrounds
    u8 sp08;

    for (bg = 0; bg < 4; bg++) {
        if ((gUnknown_03002280[bg][1] != gUnknown_03002280[bg][3])
            || (gUnknown_03002280[bg][0] != gUnknown_03002280[bg][2])) {
            // _08004056
            void *vramBase
                = ((void *)BG_VRAM + ((gBgCntRegs[bg] & BGCNT_SCREENBASE_MASK) << 3));
            sp08 = gUnknown_03002280[bg][0];

            // Potential bug?
            // gDispCnt could be set to bitmap mode (0x5), which
            // would still trigger this condition but is not intended.
            if (bg > 1 || (gDispCnt & 0x3)) {
                // __0800408E
                u16 affineSize;

                vramBase = (vramBase + sp08);

                // affineSize = internal "screen size"
                // 0 = 128x128
                // 1 = 256x256
                // 2 = 512x512
                // 3 = 1024x1024
                affineSize = 16 << (gBgCntRegs[bg] >> 14);

                if (gUnknown_03002280[bg][3] == 0xFF) {
                    // __080040A2
                    u16 cb = combine(gUnknown_03004D80[bg]);
                    void *vram = (vramBase + (gUnknown_03002280[bg][1] * affineSize));
                    s32 size = affineSize
                        * (gUnknown_03002280[bg][3] - gUnknown_03002280[bg][1]);

                    DmaFill16(3, cb, vram, ABS(size));
                } else {
                    // _080040F8
                    u8 r4 = gUnknown_03002280[bg][1];

                    for (; r4 <= gUnknown_03002280[bg][3]; r4++) {
                        u16 cb = combine(gUnknown_03004D80[bg]);
                        void *vram
                            = (vramBase + (gUnknown_03002280[bg][1] * affineSize));
                        s32 size = (gUnknown_03002280[bg][2] - sp08) + 1;

                        DmaFill16(3, cb, vram, ABS(size));
                    }
                }
            } else {
                // _08004168
                int tileSize;
                u8 affineSize;
                vramBase = (vramBase + sp08 * 2);

                tileSize = 32;

                // affineSize = internal "screen size"
                // 0 = 128x128     (-2, -> 254)
                // 1 = 256x256     (-2, -> 255)
                // 2 = 512x512     (-2, -> 0)
                // 3 = 1024x1024   (-2, -> 1)
                affineSize = (gBgCntRegs[bg] >> 14) - 2;

                if (affineSize < 2) {
                    // 512x512 or 1024x1024
                    tileSize = 64;
                }
                // _08004182

                if (gUnknown_03002280[bg][2] == 0xFF) {
                    // __0800418C
                    void *vram = (vramBase + (gUnknown_03002280[bg][1] * tileSize));
                    s32 size = tileSize
                        * (gUnknown_03002280[bg][3] - gUnknown_03002280[bg][1]);

                    DmaFill16(3, gUnknown_03004D80[bg], vram, size * 2);
                } else {
                    // _080041D8
                    u8 r4 = gUnknown_03002280[bg][1];

                    for (; r4 < gUnknown_03002280[bg][3]; r4++) {
                        void *vram
                            = (vramBase + (gUnknown_03002280[bg][1] * (tileSize * 2)));
                        s32 size = tileSize * (gUnknown_03002280[bg][2] - sp08) + 1;
                        DmaFill16(3, gUnknown_03004D80[bg], vram, size * 2);
                    }
                }
            }

            // _0800422C
            DmaFill32(3, 0, &gUnknown_03002280[bg], ARRAY_COUNT(gUnknown_03002280[bg]));
        }
    }

    return 1;
}
#endif

// Copies the given tileOffsets of the given tilesSrc into the
// given dest.
// Also sets some stuff in the vram blend regs
// My guess is that this was designed for rendering text based tiles to the screen
s32 sub_8004274(void *dest, const void *tilesSrc, u16 param2, u16 param3, u8 bgCtrlIndex,
                const u8 *tileOffsets, u8 param6)
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
static AnimCmdResult animCmd_GetPalette_BG(void *cursor, Sprite *s)
{
    ACmd_GetPalette *cmd = (ACmd_GetPalette *)cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    if (!(s->frameFlags & SPRITE_FLAG_MASK_18)) {
        s32 paletteIndex = cmd->palId;

        DmaCopy32(3, &gRefSpriteTables->palettes[paletteIndex * 16],
                  &gBgPalette[s->palId * 16 + cmd->insertOffset], cmd->numColors * 2);

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    return 1;
}

// (-3)
static AnimCmdResult animCmd_JumpBack_BG(void *cursor, Sprite *s)
{
    ACmd_JumpBack *cmd = cursor;
    s->animCursor -= cmd->offset;

    return 1;
}

// (-4)
static AnimCmdResult animCmd_End_BG(void *cursor, Sprite *s)
{
    SPRITE_FLAG_SET(s, ANIM_OVER);

    return 0;
}

// (-5)
static AnimCmdResult animCmd_PlaySoundEffect_BG(void *cursor, Sprite *s)
{
    ACmd_PlaySoundEffect *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    m4aSongNumStart(cmd->songId);

    return 1;
}

// (-7)
static AnimCmdResult animCmd_TranslateSprite_BG(void *cursor, Sprite *s)
{
    ACmd_TranslateSprite *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->x += cmd->x;
    s->y += cmd->y;

    return 1;
}

// (-8)
static AnimCmdResult animCmd_8_BG(void *cursor, Sprite *s)
{
    ACmd_8 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    return 1;
}

static AnimCmdResult animCmd_SetIdAndVariant_BG(void *cursor, Sprite *s)
{
    ACmd_SetIdAndVariant *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->graphics.anim = cmd->animId;
    s->prevVariant = 0xFF;
    s->variant = cmd->variant;

    return -1;
}

static AnimCmdResult animCmd_10_BG(void *cursor, Sprite *s)
{
    ACmd_10 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

#ifdef BUG_FIX
    return 1; // I think this should be the correct behavior?
#else
    return (s32)cursor;
#endif
}

// This is not a NOP-instruction in the regular version
static AnimCmdResult animCmd_SetSpritePriority_BG(void *cursor, Sprite *s)
{
    ACmd_SetSpritePriority *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);
    return 1;
}

// This is not a NOP-instruction in the regular version
static AnimCmdResult animCmd_SetOamOrder_BG(void *cursor, Sprite *s)
{
    ACmd_SetOamOrder *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);
    return 1;
}
