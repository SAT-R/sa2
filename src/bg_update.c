#include "global.h"
#include "core.h"

#define CastPointer(ptr, index) (void *)&(((u8 *)(ptr))[(index)])

NONMATCH("asm/non_matching/sub_8002B20.inc", bool32 sub_8002B20(void))
{
    u16 sp00;
    s32 sp04 = 0;
    u32 sp08;
    u32 sp0C; // line-size ?
    u32 affine; // -> r3
    u32 bgId; // -> r5 = (bg->unk2E & 0x3)

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

            if ((bg->unk2E & 0x20) && bg->scrollX == bg->prevScrollX)
                continue;
        }
        // NOTE: register r4 = sp00
        sp00 = bg->unk14;

        {
            bgId = (bg->unk2E & 0x3);
            if (bgId > 1 && ((gDispCnt & 0x3) > 0)) {
                affine = (gBgCntRegs[bgId] >> 14);
                sp0C = 0x400 << affine;
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
        }

        if (!(bg->unk2E & 0x20)) {
            if (!(bg->unk2E & 0x40)) {
                // _08002C20
                u8 *r1 = CastPointer(bg->tilesVram, bg->unk24 * sp0C);
                u16 *r7 = CastPointer(r1, bg->unk22 * sp08);
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
                        void *r2Ptr = CastPointer(bg->unk10, r0Index);
                        u16 *r4Ptr
                            = CastPointer(r2Ptr, ((bg->unk1E + bg->unk26) - 1) * sp08);

                        // _08002C7C
                        while (--r5 != (u16)-1) {
                            u16 i;

                            // _08002C9A
                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = (r4Ptr[0 - i] ^ TileMask_FlipXY);
                            }

                            ((u8 *)r7) += sp0C;
                            ((u8 *)r4Ptr) -= (sp00 * sp08);
                        }
                    } else {
                        // _08002CD4
                        u32 someIndex = (bg->unk20 * sp00);
                        void *r2Ptr = CastPointer(bg->unk10, someIndex * sp08);
                        u32 index2 = ((bg->unk1E + bg->unk26) - 1);
                        u16 *r4Ptr = CastPointer(r2Ptr, index2 * sp08);

                        // _08002D08
                        while (--r5 != (u16)-1) {
                            u16 i;

                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = (r4Ptr[0 - i] ^ TileMask_FlipX);
                            }

                            ((u8 *)r7) += sp0C;
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
                        u32 r0Index = (((bg->unk20 + r5) - 1) * sp00);
                        void *r1Ptr = CastPointer(bg->unk10, r0Index * sp08);
                        u16 *r4Ptr = CastPointer(r1Ptr, bg->unk1E * sp08);

                        while (--r5 != (u16)-1) {
                            u16 i;
                            u32 sb = sp00 * sp08;

                            for (i = 0; i < bg->unk26; i++) {
                                r7[i] = r4Ptr[i] ^ TileMask_FlipY;
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
                            u8 *r0 = CastPointer(bg->tilesVram, bg->unk24);
                            r0 += (sp0C * j + bg->unk22);
                            dmaDest = &r0[i * sp08];
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
            // r2 <- bg->unk2E
            // r3 <- bg->unk30
            // r4 <- sp00
            // r5 <- bgId
            // _08002FE8
            if (!(bg->unk2E & 0x40)) {
                while (bg->scrollX >= sp00 * 8)
                    bg->scrollX -= sp00 * 8;

                while (bg->scrollY >= bg->unk16 * 8) {
                    bg->scrollY -= bg->unk16 * 8;
                }
            }
            //_08003034
            gBgScrollRegs[bgId][0] = bg->scrollX % 8;
            gBgScrollRegs[bgId][1] = bg->scrollY % 8;

            if ((bg->prevScrollX / 8 != bg->scrollX / 8)
                && (bg->prevScrollY / 8 != bg->scrollY / 8)) {
                if (!(bg->unk2E & 0x40)) {
                    // _08003072
                    u32 sp10 = (u16)(bg->scrollX / 8 + bg->unk1E);
                    u32 sp14 = (u16)(bg->scrollY / 8 + bg->unk20);
                    u16 *sp3C;

                    u16 *r7Ptr = CastPointer(bg->tilesVram,
                                             (bg->unk24 * sp0C) + (bg->unk22 * sp08));

                    u16 r2 = (bg->unk26 + sp10);
                    u32 r4 = bg->unk14;
                    u16 r5;
                    if ((r2 + 1) > r4) {
                        r2 -= (r4 - 1);
                    } else {
                        r2 = 0;
                    }

                    r5 = bg->unk28 + 1;
                    if (bg->unk2E & 0x100) {
                        // _080030D4
                        if (bg->unk2E & 0x80) {
                            // _080030DC
                            u32 index = ((bg->unk20 + r5) - 1);
                            u16 *r1Ptr = (u16 *)&((u8 *)bg->unk10)[r4 * index * sp08];
                            u32 index2 = ((bg->unk1E + bg->unk26) - 1);
                            u16 *r4Ptr = &r1Ptr[index2 * sp08];

                            while (--r5 != (u16)-1) {
                                // _08003108
                                u16 i; // <- r3
                                for (i = 0; i < bg->unk26; i++) {
                                    // _08003126
                                    sp3C = &r7Ptr[i];
                                    *sp3C = (r4Ptr[0 - i] ^ TileMask_FlipXY);
                                }
                            }
                        } else {
                            // _08003158
                            u32 index = bg->unk20;
                            u16 *r1Ptr = (u16 *)&((u8 *)bg->unk10)[r4 * index * sp08];
                            u32 index2 = bg->unk1E + bg->unk26 - 1;
                            u16 *r4Ptr = &r1Ptr[index2 * sp08];

                            while (--r5 != (u16)-1) {
                                // _08003180
                                u16 i;
                                for (i = 0; i < bg->unk26; i++) {
                                    // _0800319E
                                    sp3C = &r7Ptr[i];
                                    *sp3C = (r4Ptr[0 - i] ^ TileMask_FlipX);
                                }
                            }
                        }
                    } else {
                        // _080031D0
                        if (bg->unk2E & 0x80) {
                            // _080031D8
                            u32 index = ((sp14 + r5) - 1);
                            u16 *r0Ptr = (u16 *)&((u8 *)bg->unk10)[r4 * index * sp08];
                            u32 index2 = sp10;
                            u16 *r4Ptr = &r0Ptr[index2 * sp08];

                            while (--r5 != (u16)-1) {
                                u16 *r2Ptr = (u16 *)&((u8 *)r7Ptr)[sp0C];
                                u16 i;

                                for (i = 0; i < bg->unk26; i++) {
                                    sp3C = &r7Ptr[i];
                                    *sp3C = r4Ptr[i] ^ TileMask_FlipY;
                                }
                                r7Ptr = r2Ptr;
                            }
                        } else {
                            // _08003254
                            u32 index = sp14;
                            u16 *r0Ptr = (u16 *)&((u8 *)bg->unk10)[r4 * index * sp08];
                            u32 index2 = sp10;
                            u16 *r4Ptr = &r0Ptr[index2 * sp08];

                            // _08003298
                            while (--r5 != (u16)-1) {
                                u32 dmaSize = bg->unk26 - (r2 - 1);
                                dmaSize *= sp08;
                                dmaSize += (dmaSize >> 31);
                                DmaCopy16(3, r4Ptr, r7Ptr, dmaSize);

                                ((u8 *)r7Ptr) += sp0C;
                                ((u8 *)r4Ptr) += sp00 * sp08;
                            }
                        }
                    }
                    // _080032C4
                    if (r2 != 0) {
                        // _080032CE
                        u8 *r1 = CastPointer(bg->tilesVram, bg->unk24 * sp0C); // <- r1
                        u32 displayTile = bg->unk22 + bg->unk14 - sp10; // <- r0
                        u16 *r7Ptr = CastPointer(r1, displayTile * sp08);
                        u16 r5 = (bg->unk28 + 1);

                        if (bg->unk2E & 0x100) {
                            if (bg->unk2E & 0x80) {
                                // _08003306
                                u32 index = ((sp14 + r5) - 1) * r4;
                                u16 *r1Ptr = (u16*)((u8 *)&bg->unk10[index * sp08]);
                                u16 *r4Ptr = (u16*)((u8 *)&r1Ptr[(r2 - 1) * sp08]);

                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < bg->unk26; i++) {
                                        r7Ptr[i] = r4Ptr[i] ^ TileMask_FlipXY;
                                    }
                                    ((u8 *)r7Ptr) += sp0C;
                                    ((u8 *)r4Ptr) -= sp00 * sp08;
                                }
                            } else {
                                // _08003380
                                u32 index = sp14 * r4;
                                u8 *r1Ptr = &((u8 *)bg->unk10)[index * sp08];
                                u16 *r4Ptr = (u16 *)&r1Ptr[(r2 - 1) * sp08];

                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < bg->unk26; i++) {
                                        r7Ptr[i] = r4Ptr[i] ^ TileMask_FlipX;
                                    }
                                    ((u8 *)r7Ptr) += sp0C;
                                    ((u8 *)r4Ptr) += sp00 * sp08;
                                }
                            }
                        } else {
                            // _080033F4
                            if (bg->unk2E & 0x80) {
                                // _080033FC
                                u32 index = ((sp14 + r5) - 1) * r4;
                                u16 *r4Ptr = (u16 *)&((u8 *)bg->unk10)[index * sp08];

                                u32 sp30 = r2;
                                while (--r5 != (u16)-1) {
                                    u16 i;
                                    for (i = 0; i < r2; i++) {
                                        u16 *sp3C = &r7Ptr[i];
                                        *sp3C = r4Ptr[i] ^ TileMask_FlipY;
                                    }
                                    r7Ptr = (u16*)(((u8 *)r7Ptr) + sp0C);
                                    r7Ptr = (u16*)(((u8 *)r4Ptr) - sp00 * sp08);
                                }
                            } else {
                                // _08003474
                                u32 index = (sp14 * r4);
                                u16 *r4Ptr = (u16 *)&((u8 *)bg->unk10)[index * sp08];

                                u32 dmaSize = r2 * sp08;
                                dmaSize += (dmaSize >> 31);
                                while (--r5 != (u16)-1) {
                                    // _08003492
                                    DmaCopy16(3, r4Ptr, r7Ptr, dmaSize);

                                    r7Ptr = (u16*)(((u8 *)r7Ptr) + sp0C);
                                    r4Ptr = (u16*)(((u8 *)r4Ptr) + sp00 * sp08);
                                }
                            }
                        }
                    }
                } else {
                    // _080034DC
                    u16 sp10 = (bg->scrollX / 8) + bg->unk1E;
                    u16 sp14 = (bg->scrollY / 8) + bg->unk20;
                    u16 i, j;

                    for (i = 0; i < bg->unk26; i++) {
                        // _08003500
                        u32 sp24 = Div(sp10 + i, bg->unk14);
                        u32 sp28 = bg->scrollX - (bg->unk14 * sp24);
                        u32 sp2C;
                        u32 sp34;
                        u16 r8 = bg->unk28;
                        u32 r0 = bg->unk26 - i;
                        u32 r1 = bg->unk14 - sp28;

                        if (r1 > r0)
                            r1 = r0;

                        // _0800352E
                        sp2C = r1 * sp08;
                        sp34 = r1 + i;

                        for (j = 0; j < bg->unk28; j++) {
                            // _08003542
                            u32 divident = sp14 + j;
                            u32 index = Div(divident, bg->unk16);
                            u32 new_r4 = divident - (index * bg->unk16);
                            u32 r5 = bg->unk16 - new_r4;
                            index *= bg->unk3C;

                            { // _0800355C
                                u32 someVal = bg->unk38[index + (sp24 * 2)];
                                u32 otherVal;
                                someVal *= bg->unk14;
                                someVal *= bg->unk16;

                                otherVal = new_r4 * bg->unk14;
                                otherVal += sp28;
                                otherVal += someVal;

                                {
                                    // r4 <- dmaSrc
                                    u8 *dmaSrc = CastPointer(bg->unk10, otherVal * sp08);
                                    u8 *dmaDest;
                                    u32 dmaSize;
                                    u8 *destPtr = CastPointer(bg->tilesVram, bg->unk24);
                                    u32 destIndex = sp0C * j + bg->unk22;
                                    dmaDest = CastPointer(destPtr, destIndex + i * sp08);

                                    j += r5;

                                    if (r5 > r8)
                                        r5 = r8;
                                    r8 -= r5;

                                    // _080035A4
                                    // NOTE: Somehow this is different from all
                                    //       the other while-loops, where it was
                                    //       while(--r5 != (u16)-1) instead.
                                    dmaSize = sp2C;
                                    dmaSize += (dmaSize >> 31);
                                    while (r5-- != 0) {
                                        DmaCopy16(3, dmaSrc, dmaDest, dmaSize);
                                        dmaDest += sp0C;
                                        dmaSrc += sp00 * sp08;
                                    }
                                }
                            }
                        }
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
    struct MapHeader_Full *header = gUnknown_03002260[bg->unk1C];
    if (header->h.animFrameCount) {
        if (header->h.animDelay <= ++bg->animDelayCounter) {
            u32 animTileSize;

            bg->animDelayCounter = 0;

            if (header->h.animFrameCount <= ++bg->animFrameCounter)
                bg->animFrameCounter = 0;

            animTileSize = header->h.animTileSize;

            if (!(bg->unk2E & 0x200)) {
                if (bg->animFrameCounter == 0) {
                    bg->graphics.src = header->h.tileset;
                } else {
                    u8 *ts = header->h.tileset;
                    u32 size = header->h.tilesetSize;
                    ts += size;
                    ts += (bg->animFrameCounter - 1) * animTileSize;
                    bg->graphics.src = ts;
                }
            } else {
                u8 *ts = bg->graphics.dest;
                ts += header->h.tilesetSize;
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
