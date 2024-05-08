#include "global.h"
#include "core.h"
#include "sprite.h"
#include "flags.h"

#include "data/sprite_data.h"

const u8 gOamShapesSizes[12][2] = {
    // Square
    { 8, 8 },
    { 16, 16 },
    { 32, 32 },
    { 64, 64 },

    // Horizontal
    { 16, 8 },
    { 32, 8 },
    { 32, 16 },
    { 64, 32 },

    // Vertical
    { 8, 16 },
    { 8, 32 },
    { 16, 32 },
    { 32, 64 },
};

void DisplaySprite(Sprite *sprite)
{
    OamData *oam;
    s32 x, y, sprWidth, sprHeight;
    u8 i;
    u32 r5, r7;
    const u16 *oamData;

    if ((u32)sprite->dimensions != -1) {
        const SpriteOffset *sprDims = sprite->dimensions;

        sprite->numSubFrames = sprDims->numSubframes;
        x = sprite->x;
        y = sprite->y;

        if (sprite->unk10 & SPRITE_FLAG_MASK_17) {
            x -= gUnknown_030017F4[0];
            y -= gUnknown_030017F4[1];
        }

        sprWidth = sprDims->width;
        sprHeight = sprDims->height;
        if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
            if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                x -= sprDims->width / 2;
                y -= sprDims->height / 2;
                sprWidth *= 2;
                sprHeight *= 2;
            }
        } else {
            if (sprite->unk10 & SPRITE_FLAG_MASK_Y_FLIP) {
                y -= sprHeight - sprDims->offsetY;
            } else {
                y -= sprDims->offsetY;
            }

            if (sprite->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
                x -= sprWidth - sprDims->offsetX;
            } else {
                x -= sprDims->offsetX;
            }
        }

        if (x + sprWidth >= 0 && x <= DISPLAY_WIDTH && // fmt
            y + sprHeight >= 0 && y <= DISPLAY_HEIGHT) {
            u8 unk6D0 = gMosaicReg >> 8;

            for (i = 0; i < sprDims->numSubframes; i++) {
                oamData = gUnknown_03002794->oamData[sprite->graphics.anim];

                // oam gets zero-initialized(?)
                oam = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));
                if (iwram_end == oam) {
                    return;
                }

                if (i == 0) {
                    sprite->oamBaseIndex = gOamFreeIndex - 1;
                }

                // oamIndex is a byte, why are they ANDing with 0x3FFF?
                DmaCopy16(3, &oamData[3 * ((sprDims->oamIndex & 0x3FFF) + i)], oam, 6);
                r7 = oam->all.attr1 & 0x1FF;
                r5 = oam->all.attr0 & 0xFF;
                oam->all.attr1 &= 0xFE00;
                oam->all.attr0 &= 0xFE00;

                oam->all.attr2 += sprite->palId << 12;
                if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
                    oam->all.attr0 |= 0x100;
                    if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                        oam->all.attr0 |= 0x200;
                    }
                    oam->all.attr1 |= (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE) << 9;
                } else {
                    u32 shapeAndSize = ((oam->all.attr0 & 0xC000) >> 12);
                    u32 flipY;
                    u32 r6;

                    shapeAndSize |= ((oam->all.attr1 & 0xC000) >> 14);
                    flipY = sprite->unk10 >> SPRITE_FLAG_SHIFT_Y_FLIP;
                    r6 = 1;

                    // y-flip
                    if ((((sprDims->flip >> 1) ^ flipY) & r6) != 0) {
                        oam->all.attr1 ^= 0x2000;
                        r5 = sprHeight - gOamShapesSizes[shapeAndSize][1] - r5;
                    }

                    // x-flip
                    if (((sprite->unk10 >> SPRITE_FLAG_SHIFT_X_FLIP) & r6)
                        != (sprDims->flip & 1)) {
                        oam->all.attr1 ^= 0x1000;
                        r7 = sprWidth - gOamShapesSizes[shapeAndSize][0] - r7;
                    }
                }

                if (unk6D0 != 0 && (sprite->unk10 & SPRITE_FLAG_MASK_MOSAIC) != 0) {
                    oam->all.attr0 |= 0x1000;
                }

                oam->all.attr0 |= (sprite->unk10 & SPRITE_FLAG_MASK_OBJ_MODE) * 8;
                oam->all.attr2 |= (sprite->unk10 & SPRITE_FLAG_MASK_PRIORITY) >> 2;
                oam->all.attr0 += ((y + r5) & 0xFF);
                oam->all.attr1 += ((x + r7) & 0x1FF);

                if (oam->all.attr0 & (ST_OAM_8BPP << 13)) {
                    oam->all.attr2 += oam->all.attr2 & 0x3FF;
                }
                oam->all.attr2 += GET_TILE_NUM(sprite->graphics.dest);
            }
        }
    }
}

void sub_081569A0(Sprite *sprite, u16 *sp08, u8 sp0C)
{
    vs32 x, y;
    s32 sprWidth, sprHeight;
    u8 sp18, i;
    u32 x1, y1, sp24, sp28;

    if ((u32)sprite->dimensions != -1) {
        const SpriteOffset *sprDims = sprite->dimensions;

        sprite->numSubFrames = sprDims->numSubframes;
        x = sprite->x;
        y = sprite->y;

        if (sprite->unk10 & SPRITE_FLAG_MASK_17) {
            x -= gUnknown_030017F4[0];
            y -= gUnknown_030017F4[1];
        }

        sprWidth = sprDims->width;
        sprHeight = sprDims->height;
        if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
            if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                x -= sprDims->width / 2;
                y -= sprDims->height / 2;
                sprWidth *= 2;
                sprHeight *= 2;
            }
        } else {
            if (sprite->unk10 & SPRITE_FLAG_MASK_Y_FLIP) {
                y -= sprHeight - sprDims->offsetY;
            } else {
                y -= sprDims->offsetY;
            }

            if (sprite->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
                x -= sprWidth - sprDims->offsetX;
            } else {
                x -= sprDims->offsetX;
            }
        }

        sp24 = x - sprite->x;
        sp28 = y - sprite->y;
        if (x + sprWidth >= 0 && x <= 240 && y + sprHeight >= 0 && y <= 160) {
            for (sp18 = 0; sp18 < sprDims->numSubframes; ++sp18) {
                const u16 *oamData = gUnknown_03002794->oamData[sprite->graphics.anim];
                OamData *oam = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));

                if (iwram_end == oam) {
                    return;
                }

                DmaCopy16(3, &oamData[3 * ((sprDims->oamIndex & 0x3FFF) + sp18)], oam,
                          6); // excluding affine params
                x1 = oam->all.attr1 & 0x1FF;
                y1 = oam->all.attr0 & 0xFF;
                oam->all.attr1 &= 0xFE00;
                oam->all.attr0 &= 0xFE00;
                oam->all.attr2 += sprite->palId << 12;
                if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
                    oam->all.attr0 |= 0x100;
                    if (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                        oam->all.attr0 |= 0x200;
                    }
                    oam->all.attr1 |= (sprite->unk10 & SPRITE_FLAG_MASK_ROT_SCALE) << 9;
                } else {
                    u32 shapeAndSize = ((oam->all.attr0 & 0xC000) >> 12);
                    u32 flipY;
                    u32 r6;

                    shapeAndSize |= ((oam->all.attr1 & 0xC000) >> 14);
                    flipY = sprite->unk10 >> 11;
                    r6 = 1;

                    // y-flip
                    if ((((sprDims->flip >> 1) ^ flipY) & r6) != 0) {
                        oam->all.attr1 ^= 0x2000;
                        y1 = sprHeight - gOamShapesSizes[shapeAndSize][1] - y1;
                    }

                    // x-flip
                    if (((sprite->unk10 >> 10) & r6) != (sprDims->flip & 1)) {
                        oam->all.attr1 ^= 0x1000;
                        x1 = sprWidth - gOamShapesSizes[shapeAndSize][0] - x1;
                    }
                }

                oam->all.attr0 |= (sprite->unk10 & SPRITE_FLAG_MASK_OBJ_MODE) * 8;
                oam->all.attr2 |= (sprite->unk10 & SPRITE_FLAG_MASK_PRIORITY) >> 2;
                oam->all.attr0 += ((y + y1) & 0xFF);
                oam->all.attr1 += ((x + x1) & 0x1FF);

                if (oam->all.attr0 & (ST_OAM_8BPP << 13)) {
                    oam->all.attr2 += oam->all.attr2 & 0x3FF;
                }
                oam->all.attr2 += GET_TILE_NUM(sprite->graphics.dest);

                for (i = 0; i < sp0C; ++i) {
                    OamData *r5 = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));

                    if (iwram_end == oam)
                        return;
                    DmaCopy16(3, oam, r5, 6);
                    r5->all.attr1 &= 0xFE00;
                    r5->all.attr0 &= 0xFF00;
                    r5->all.attr0 += (sp08[2 * i + 1] + sp28 + y1) & 0xFF;
                    r5->all.attr1 += (sp08[2 * i + 0] + sp24 + x1) & 0x1FF;
                }
            }
        }
    }
}

// The parameter to this determines the order this sprite is expected to be drawn at.
//
// If you have created n Sprite instances, and you want them to be drawn in a certain
// order, you'd set their OAM order value (inside Sprite.unk1A) accordingly.
// A higher value gets drawn first
// (Higher order value == Higher Priority -> Drawn first).
//  This only applies if these sprites all have the same priority value (0-3) in OAM.
//  For OAM priority values the same rule (Higher value == Higher Priority) applies.
//
// This behavior is used by the Pause Menu, whereby all existing OAM values get put to
// the end of the OAM buffer, while the pause menu itself gets put to the beginning.
OamData *OamMalloc(u8 order)
{
    OamData *result;

    if (order > 31) {
        order = 31;
    }

    if (gOamFreeIndex > OAM_ENTRY_COUNT - 1) {
        result = (OamData *)iwram_end;
    } else {
        if (gUnknown_03001850[order] == 0xFF) {
            gOamBuffer2[gOamFreeIndex].split.fractional = 0xFF;
            gUnknown_03001850[order] = gOamFreeIndex;
            gUnknown_03004D60[order] = gOamFreeIndex;
        } else {
            gOamBuffer2[gOamFreeIndex].split.fractional = 0xFF;
            gOamBuffer2[gUnknown_03004D60[order]].split.fractional = gOamFreeIndex;
            gUnknown_03004D60[order] = gOamFreeIndex;
        }

        gOamFreeIndex++;
        result = &gOamBuffer2[gOamFreeIndex - 1];
    }

    return result;
}

void CopyOamBufferToOam(void)
{
    OamData *dstOam = &gOamBuffer[0];
    u8 i = 0;
    s32 r3;

    for (r3 = 0; r3 < 32; r3++) {
        s8 index = gUnknown_03001850[r3];

        while (index != -1) {
            u8 newI;
            u8 *byteArray = gUnknown_03002710;
            DmaCopy16(3, &gOamBuffer2[index], dstOam, sizeof(OamDataShort));
            dstOam++;

            byteArray += index;
            newI = i++;
            *byteArray = newI;
            index = gOamBuffer2[index].split.fractional;
        };
    }

    if (gFlags & FLAGS_800) {
        r3 = gOamFreeIndex;
        dstOam = &gOamBuffer[r3];

        while (r3 < gOamFirstPausedIndex) {
            DmaFill16(3, 0x200, dstOam, sizeof(OamDataShort));
            dstOam++;
            r3++;
        }
    } else if (gFlags & FLAGS_PAUSE_GAME) {
        /* Push all active OAM entries to te end of OAM temporarily while
         * the game is paused */
        s32 k, l;
        r3 = gOamFreeIndex - 1;
        dstOam = &gOamBuffer[r3];

        for (k = l = 0; r3 >= 0;) {
            s32 size = sizeof(OamDataShort);
            DmaCopy16(3, dstOam - k, &gOamBuffer[OAM_ENTRY_COUNT - 1 - l], size);
            k++, r3--, l++;
        }

        // _08005A5E

        gOamFirstPausedIndex = OAM_ENTRY_COUNT - gOamFreeIndex;

        for (r3 = 0; r3 < gOamFirstPausedIndex; r3++) {
            DmaFill16(3, 0x200, &gOamBuffer[r3], sizeof(OamDataShort));
#ifndef NON_MATCHING
            // unlike when using --, using ++ changes the condition to something entirely
            // different unless we tell the compiler that we want to use r3's values
            // (without actually doing so)
            asm("" ::"r"(r3));
#endif
        }

    } else {
        gOamFirstPausedIndex = 0;
    }

    gOamFreeIndex = 0;
    if (gFlags & FLAGS_4000) {
        CpuFill32(-1, gUnknown_03001850, sizeof(gUnknown_03001850));
        CpuFill32(-1, gUnknown_03004D60, sizeof(gUnknown_03004D60));
    } else {
        DmaFill32(3, -1, gUnknown_03001850, sizeof(gUnknown_03001850));
        DmaFill32(3, -1, gUnknown_03004D60, sizeof(gUnknown_03004D60));
    }
}
