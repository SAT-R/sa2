#include <string.h> // memcpy
#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "data/sprite_data.h"
#include "animation_commands.h"
#include "platform/platform.h"

#if !PLATFORM_GBA && !PLATFORM_SDL
extern void Platform_DisplaySprite(Sprite *sprite, u8 oamPaletteNum);
#endif

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

static AnimCmdResult animCmd_GetTiles(void *cursor, Sprite *s);
static AnimCmdResult animCmd_GetPalette(void *cursor, Sprite *s);
static AnimCmdResult animCmd_JumpBack(void *cursor, Sprite *s);
static AnimCmdResult animCmd_End(void *cursor, Sprite *s);
static AnimCmdResult animCmd_PlaySoundEffect(void *cursor, Sprite *s);
static AnimCmdResult animCmd_AddHitbox(void *cursor, Sprite *s);
static AnimCmdResult animCmd_TranslateSprite(void *cursor, Sprite *s);
static AnimCmdResult animCmd_8(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetIdAndVariant(void *cursor, Sprite *s);
static AnimCmdResult animCmd_10(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetSpritePriority(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetOamOrder(void *cursor, Sprite *s);

// This function gets called as long as an enemy is on-screen.
// Potentially something to do with collision/distance?
//
// Vector-to-rotation(0-1023) ?
s16 sub_8004418(s16 x, s16 y)
{
    s16 fraction;
    s32 result;
    u8 index = 0;
    u8 array[] = {
        /* 0x00 */ I(Q(0.5 * 2)),
        /* 0x01 */ I(Q(0.0 * 2)),
        /* 0x02 */ I(Q(1.0 * 2)),
        /* 0x03 */ I(Q(1.5 * 2)),
        /* 0x04 */ I(Q(3.0 * 2)),
        /* 0x05 */ I(Q(3.5 * 2)),
        /* 0x06 */ I(Q(2.5 * 2)),
        /* 0x07 */ I(Q(2.0 * 2)),
    };

    if ((x | y) == 0) {
        result = -1;
    } else {
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
            y *= Q(0.5);

            if (x == 0) {
                fraction = y;
            } else {
                fraction = y / x;
            }
        } else {
            index += 1;

            x *= Q(0.5);

            if (y == 0) {
                fraction = x;
            } else {
                fraction = x / y;
            }
        }

        if (array[index] & 0x01) {
            fraction = Q(0.5) - fraction;
        }

        {
            s32 val = array[index] * Q(0.5);
            fraction += val;
            result = ((u32)(fraction << 22) >> 22);
        }
    }

    return result;
}

void numToASCII(u8 digits[5], u16 number)
{
    u8 i;

    for (i = 0; i < 4; number <<= 4, i++) {
        u16 value = ((number & 0xF000) >> 12);
        if (value > 9) {
            digits[i] = value + 87;
        } else {
            digits[i] = value + '0';
        }
    }

    digits[i] = 0;
}

// This function takes a 16bit decimal number
// and returns a 32bit number which, viewed as hex,
// will contain the input number's digits in the lower 5 nibbles.
// Base10DigitsToHexNibbles(12345) -> 0x00012345
u32 Base10DigitsToHexNibbles(u16 num)
{
    u8 i;
    u16 result;
    u8 lowDigit;
    u16 remainder = num;

    result = 0;
    for (i = 0; i < 4; i++) {
        s32 divisor = Div(remainder, 10);
        lowDigit = remainder - (divisor * 10);
        remainder = divisor;

        result |= lowDigit << (i * 4);
    }

    return result;
}

AnimCmdResult UpdateSpriteAnimation(Sprite *s)
{
    static const AnimationCommandFunc animCmdTable[] = {
        // 0x080984AC
        animCmd_GetTiles,        animCmd_GetPalette, animCmd_JumpBack,        animCmd_End, animCmd_PlaySoundEffect,   animCmd_AddHitbox,
        animCmd_TranslateSprite, animCmd_8,          animCmd_SetIdAndVariant, animCmd_10,  animCmd_SetSpritePriority, animCmd_SetOamOrder,
    };
    SPRITE_INIT_ANIM_IF_CHANGED(s);

    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)
        return 0;

    if (s->qAnimDelay > 0)
        s->qAnimDelay -= s->animSpeed * 16;
    else {
        /* Call all commands for the new frame */
        s32 ret;
        const ACmd *cmd;
        const ACmd *script;
        const ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gRefSpriteTables->animations[GET_SPRITE_ANIM(s)];
        script = variants[s->variant];
        cmd = ReadInstruction(script, s->animCursor);
        while (cmd->id < 0) {
            // TODO: make this const void*
            ret = animCmdTable[~cmd->id]((void *)cmd, s);
            if (ret != ACMD_RESULT__RUNNING) {
#if (!defined(NON_MATCHING) && ((GAME == GAME_SA1) || (GAME == GAME_SA2)))
                register const ACmd *newScript asm("r2");
#else
                const ACmd *newScript;
#endif
                if (ret != ACMD_RESULT__ANIM_CHANGED) {
                    return ret;
                }

                // animation has changed
                variants = gRefSpriteTables->animations[GET_SPRITE_ANIM(s)];
                newScript = variants[s->variant];

                // reset cursor
                s->animCursor = 0;

                // load the new script
                script = newScript;
            }
            cmd = ReadInstruction(script, s->animCursor);
        }

        // Display the image 'index' for 'delay' frames
        s->qAnimDelay += Q_8_8(((ACmd_ShowFrame *)cmd)->delay);
        s->qAnimDelay -= s->animSpeed * 0x10;
        {
            s32 frame = ((ACmd_ShowFrame *)cmd)->index;

#if ((GAME == GAME_SA1) || (GAME == GAME_SA2))
            if (frame != -1) {
                const struct SpriteTables *sprTables = gRefSpriteTables;

                s->dimensions = &sprTables->dimensions[GET_SPRITE_ANIM(s)][frame];
            } else {
                s->dimensions = (void *)-1;
            }
#else
            s->frameNum = cmd->show.index;
            s->frameFlags |= SPRITE_FLAG_MASK_26;
#endif
        }

        s->animCursor += 2;
    }
    return 1;
}

// (-1)
static AnimCmdResult animCmd_GetTiles(void *cursor, Sprite *s)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    s->animCursor += AnimCommandSizeInWords(ACmd_GetTiles);

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
static AnimCmdResult animCmd_AddHitbox(void *cursor, Sprite *s)
{
    ACmd_Hitbox *cmd = (ACmd_Hitbox *)cursor;
    s32 hitboxId = cmd->hitbox.index % 16u;
    s->animCursor += AnimCommandSizeInWords(ACmd_Hitbox);

    DmaCopy32(3, &cmd->hitbox, &s->hitboxes[hitboxId].index, sizeof(Hitbox));
#if (GAME == GAME_SA3)
    if (((u8)cmd->hitbox.left == (u8)cmd->hitbox.right) && (*(volatile u8 *)&cmd->hitbox.top == (u8)cmd->hitbox.bottom))
#else
    if ((cmd->hitbox.left == 0) && (cmd->hitbox.top == 0) && (cmd->hitbox.right == 0) && (cmd->hitbox.bottom == 0))
#endif
    {
        s->hitboxes[hitboxId].index = -1;
    } else {
        if (s->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
            SWAP_AND_NEGATE(s->hitboxes[hitboxId].top, s->hitboxes[hitboxId].bottom);
        }

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SWAP_AND_NEGATE(s->hitboxes[hitboxId].left, s->hitboxes[hitboxId].right);
        }
    }

    return 1;
}

void sub_80047A0(u16 angle, s16 p1, s16 p2, u16 affineIndex)
{
    u16 *affine = &gOamBuffer[affineIndex * 4].all.affineParam;
    s16 res;

    res = Div(0x10000, p1);
    affine[0] = I(COS_24_8(angle) * res);

    res = Div(0x10000, p1);
    affine[4] = I(SIN_24_8(angle) * res);

    res = Div(0x10000, p2);
    affine[8] = I((-(SIN(angle)) >> 6) * res);

    res = Div(0x10000, p2);
    affine[12] = I(COS_24_8(angle) * res);
}

// Similar to sub_8004ABC and sub_8004E14
// (53.42%) https://decomp.me/scratch/llwGy
// (56.74%) https://decomp.me/scratch/rXgtp
NONMATCH("asm/non_matching/engine/TransformSprite.inc", void TransformSprite(Sprite *s, SpriteTransform *transform))
{
    // sp24 = s
    UnkSpriteStruct big;
    const SpriteOffset *dimensions = s->dimensions;

    if (dimensions != (SpriteOffset *)-1) {
        s16 res;
        s16 x16, y16;
        s16 *affine;
        big.affineIndex = s->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE;
        affine = (void *)&gOamBuffer[big.affineIndex * 4].all.affineParam;

#if 0
        sub_80047A0(transform->rotation & ONE_CYCLE, transform->qScaleX, transform->qScaleY,
                    big.affineIndex);
#else
        big.qDirX = COS_24_8(transform->rotation & ONE_CYCLE);
        big.qDirY = SIN_24_8(transform->rotation & ONE_CYCLE);

        big.unkC[0] = transform->qScaleX;
        big.unkC[1] = transform->qScaleY;
        // __set_UnkC

        res = Div(0x10000, big.unkC[0]);
        x16 = big.qDirX;
        affine[0] = (x16 * res) >> 8;

        res = Div(0x10000, big.unkC[0]);
        y16 = big.qDirY;
        affine[4] = (y16 * res) >> 8;

        res = Div(0x10000, big.unkC[1]);
        y16 = big.qDirY;
        affine[8] = (-y16 * res) >> 8;

        res = Div(0x10000, big.unkC[1]);
        x16 = big.qDirX;
        affine[12] = (x16 * res) >> 8;
#endif
        // __post_Divs

        if (transform->qScaleX < 0)
            big.unkC[0] = -transform->qScaleX;

        if (transform->qScaleY < 0)
            big.unkC[1] = -transform->qScaleY;

        // _0800497A
        x16 = big.qDirX;
        big.unk0[0] = (x16 * big.unkC[0]) >> 8;
        // __08004990
        y16 = big.qDirY;
        big.unk0[1] = (-y16 * big.unkC[0]) >> 8;
        // __080049AA
        y16 = big.qDirY;
        big.unk0[2] = (y16 * big.unkC[1]) >> 8;
        // __080049C2
        x16 = big.qDirX;
        big.unk0[3] = (x16 * big.unkC[1]) >> 8;

        big.unk18[0][0] = 0x100;
        big.unk18[0][1] = 0;
        big.unk18[1][0] = 0;
        big.unk18[1][1] = 0x100;

        big.posX = transform->x;
        big.posY = transform->y;

        // _08004A04
        {
            s32 r0;
            s32 r1;
            s32 r2;
            s32 r3;
            s32 r4;

            // __08004A04
            if (transform->qScaleX > 0) {
                // __08004A08
                r4 = dimensions->offsetX;
            } else {
                // _08004A20
                r4 = dimensions->width - dimensions->offsetX;
            }

            // _08004A2E
            if (transform->qScaleY > 0) {
                r3 = dimensions->offsetY;
            } else {
                // _08004A3E
                r3 = dimensions->height - dimensions->offsetY;
            }

            // _08004A4C
            r1 = big.unk0[0] * (r4 - (dimensions->width / 2));
            r0 = big.unk0[1] * (r3 - (dimensions->height / 2));
            r1 += r0;
            r1 = r1 + ((dimensions->width / 2) << 8);
            big.posX -= (r1 >> 8);

            // __080004A7E
            r1 = big.unk0[2] * (r4 - (dimensions->width / 2));
            r0 = big.unk0[3] * (r3 - (dimensions->height / 2));
            r1 += r0;
            r1 += ((dimensions->height / 2) << 8);
            big.posY -= r1 >> 8;

            s->x = big.posX;
            s->y = big.posY;
        }
    }
}
END_NONMATCH

// (0.00%)
NONMATCH("asm/non_matching/engine/unused_transform.inc", void UnusedTransform(Sprite *sprite, SpriteTransform *transform))
{
    // TODO
}
END_NONMATCH

// VERY similar to TransformSprite and sub_8004ABC
// (41.14%) https://decomp.me/scratch/n3NXz
NONMATCH("asm/non_matching/engine/sub_8004E14.inc", void sub_8004E14(Sprite *sprite, SpriteTransform *transform))
{
    UnkSpriteStruct us;
    if (sprite->dimensions != (void *)-1) {
        const SpriteOffset *sprDims = sprite->dimensions;
        u16 *affine;

        us.affineIndex = sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE;
        affine = (u16 *)&gOamBuffer[us.affineIndex * 4 + 3];

        us.qDirX = COS_24_8((transform->rotation + gUnknown_03001944) & ONE_CYCLE);
        us.qDirY = SIN_24_8((transform->rotation + gUnknown_03001944) & ONE_CYCLE);
        us.unkC[0] = I(transform->qScaleX * gUnknown_030017F0);
        us.unkC[1] = I(transform->qScaleY * gUnknown_03005394);

        affine[0] = I(Div(Q(256), us.unkC[0]) * us.qDirX);
        affine[4] = I(Div(Q(256), us.unkC[0]) * us.qDirY);
        affine[8] = I(Div(Q(256), us.unkC[1]) * -us.qDirY);
        affine[12] = I(Div(Q(256), us.unkC[1]) * us.qDirX);

        if (transform->qScaleX < 0) {
            us.unkC[0] = I(-transform->qScaleX * gUnknown_030017F0);
        }
        // _08004F48

        if (transform->qScaleY < 0) {
            us.unkC[1] = I(-transform->qScaleY * gUnknown_03005394);
        }
        // _08004F6A

        us.unk0[0] = I(+us.qDirX * us.unkC[0]);
        us.unk0[1] = I(-us.qDirY * us.unkC[0]);
        us.unk0[2] = I(+us.qDirY * us.unkC[1]);
        us.unk0[3] = I(+us.qDirX * us.unkC[1]);

        // 2D Rotation matrix:
        // { +cos(a), -sin(a) }
        // { +sin(a), +cos(a) }
        us.unk18[0][0] = I((Q(+COS_24_8(gUnknown_03001944) * gUnknown_030017F0) >> 16) * (Q(us.unkC[0] * gUnknown_03005398) >> 16));
        us.unk18[0][1] = I((Q(-SIN_24_8(gUnknown_03001944) * gUnknown_030017F0) >> 16) * (Q(us.unkC[0] * gUnknown_03005398) >> 16));
        us.unk18[1][0] = I((Q(+SIN_24_8(gUnknown_03001944) * gUnknown_03005394) >> 16) * (Q(us.unkC[1] * gUnknown_03005398) >> 16));
        us.unk18[1][1] = I((Q(+COS_24_8(gUnknown_03001944) * gUnknown_03005394) >> 16) * (Q(us.unkC[1] * gUnknown_03005398) >> 16));

        us.posX = I(transform->x * us.unk18[0][0] + transform->y * us.unk18[0][1] + Q(gUnknown_0300194C));
        us.posY = I(transform->x * us.unk18[1][0] + transform->y * us.unk18[1][1] + Q(gUnknown_03002820));

        {
            u16 width, height;
            u16 halfWidth, halfHeight;
            s16 offsetX, offsetY;
            s32 x, y;

            if (transform->qScaleX > 0) {
                offsetX = sprDims->offsetX;
                width = sprDims->width;
            } else {
                offsetX = sprDims->width - sprDims->offsetX;
                width = sprDims->width;
            }
            // _0800515A

            if (transform->qScaleY > 0) {
                offsetY = sprDims->offsetY;
                height = sprDims->height;
            } else {
                offsetY = sprDims->height - sprDims->offsetY;
                height = sprDims->height;
            }
            // _0800517A

            halfWidth = width / 2;
            offsetX -= halfWidth;
            x = offsetX * us.unk0[0];

            halfHeight = height / 2;
            offsetY -= halfHeight;
            x += offsetY * us.unk0[1];
            x = (x + Q(halfWidth));
            us.posX -= I(x);

            y = offsetX * us.unk0[2];
            y += offsetY * us.unk0[3];
            y = (y + Q(halfHeight));
            us.posY -= I(y);

            sprite->x = us.posX;
            sprite->y = us.posY;
        }
    }
}
END_NONMATCH

// used in background.c
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

    if (sprite->dimensions != (void *)-1) {

        const SpriteOffset *sprDims = sprite->dimensions;

        sprite->numSubFrames = sprDims->numSubframes;
        x = sprite->x;
        y = sprite->y;

        if (sprite->frameFlags & SPRITE_FLAG_MASK_17) {
            x -= gUnknown_030017F4[0];
            y -= gUnknown_030017F4[1];
        }

        sprWidth = sprDims->width;
        sprHeight = sprDims->height;
        if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                x -= sprDims->width / 2;
                y -= sprDims->height / 2;
                sprWidth *= 2;
                sprHeight *= 2;
            }
        } else {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
                y -= sprHeight - sprDims->offsetY;
            } else {
                y -= sprDims->offsetY;
            }

            if (sprite->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                x -= sprWidth - sprDims->offsetX;
            } else {
                x -= sprDims->offsetX;
            }
        }

        if (x + sprWidth >= 0 && x <= DISPLAY_WIDTH && // fmt
            y + sprHeight >= 0 && y <= DISPLAY_HEIGHT) {
            u8 mosaicHVSizes = gMosaicReg >> 8;

            for (i = 0; i < sprDims->numSubframes; i++) {
                oamData = gRefSpriteTables->oamData[sprite->graphics.anim];

                // oam gets zero-initialized(?)
                oam = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));
                if (iwram_end == oam) {
                    return;
                }

                if (i == 0) {
                    sprite->oamBaseIndex = gOamFreeIndex - 1;
                }

                // oamIndex is a byte, why are they ANDing with 0x3FFF?
                DmaCopy16(3, &oamData[3 * ((sprDims->oamIndex & 0x3FFF) + i)], oam, sizeof(OamDataShort));
                r7 = oam->all.attr1 & 0x1FF;
                r5 = oam->all.attr0 & 0xFF;
                oam->all.attr1 &= 0xFE00;
                oam->all.attr0 &= 0xFE00;

                oam->all.attr2 += sprite->palId << 12;

#if !PLATFORM_GBA && !PLATFORM_SDL
                // TEMP
                // Quick hack for getting output in OpenGL test
                // The whole function call should be replaced by this!
                Platform_DisplaySprite(sprite, oam->split.paletteNum);
                return;
#endif

                if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
                    oam->all.attr0 |= 0x100;
                    if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                        oam->all.attr0 |= 0x200;
                    }
                    oam->all.attr1 |= (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE) << 9;
                } else {
                    u32 shapeAndSize = ((oam->all.attr0 & 0xC000) >> 12);
                    u32 flipY;
                    u32 r6;

                    shapeAndSize |= ((oam->all.attr1 & 0xC000) >> 14);
                    flipY = sprite->frameFlags >> SPRITE_FLAG_SHIFT_Y_FLIP;
                    r6 = 1;

                    // y-flip
                    if ((((sprDims->flip >> 1) ^ flipY) & r6) != 0) {
                        oam->all.attr1 ^= 0x2000;
                        r5 = sprHeight - gOamShapesSizes[shapeAndSize][1] - r5;
                    }

                    // x-flip
                    if (((sprite->frameFlags >> SPRITE_FLAG_SHIFT_X_FLIP) & r6) != (sprDims->flip & 1)) {
                        oam->all.attr1 ^= 0x1000;
                        r7 = sprWidth - gOamShapesSizes[shapeAndSize][0] - r7;
                    }
                }

                if (mosaicHVSizes != 0 && (sprite->frameFlags & SPRITE_FLAG_MASK_MOSAIC) != 0) {
                    // Enable mosaic bit
                    oam->all.attr0 |= 0x1000;
                }

                oam->all.attr0 |= (sprite->frameFlags & SPRITE_FLAG_MASK_OBJ_MODE) * 8;
                oam->all.attr2 |= (sprite->frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> 2;
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

void DisplaySprites(Sprite *sprite, Vec2_16 *positions, u8 numPositions)
{
    vs32 x, y;
    s32 sprWidth, sprHeight;
    u8 subframe, i;
    s32 x1, y1, centerOffsetX, centerOffsetY;

    if (sprite->dimensions != (void *)-1) {
        const SpriteOffset *sprDims = sprite->dimensions;

        sprite->numSubFrames = sprDims->numSubframes;
        x = sprite->x;
        y = sprite->y;

        if (sprite->frameFlags & SPRITE_FLAG_MASK_17) {
            x -= gUnknown_030017F4[0];
            y -= gUnknown_030017F4[1];
        }

        sprWidth = sprDims->width;
        sprHeight = sprDims->height;
        if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                x -= sprDims->width / 2;
                y -= sprDims->height / 2;
                sprWidth *= 2;
                sprHeight *= 2;
            }
        } else {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
                y -= sprHeight - sprDims->offsetY;
            } else {
                y -= sprDims->offsetY;
            }

            if (sprite->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                x -= sprWidth - sprDims->offsetX;
            } else {
                x -= sprDims->offsetX;
            }
        }

        centerOffsetX = x - sprite->x;
        centerOffsetY = y - sprite->y;
        if (x + sprWidth >= 0 && x <= DISPLAY_WIDTH && y + sprHeight >= 0 && y <= DISPLAY_HEIGHT) {
            for (subframe = 0; subframe < sprDims->numSubframes; ++subframe) {
                const u16 *oamData = gRefSpriteTables->oamData[sprite->graphics.anim];
                OamData *oam = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));

                if (iwram_end == oam) {
                    return;
                }

                // copy excluding affine params
                DmaCopy16(3, &oamData[3 * ((sprDims->oamIndex & 0x3FFF) + subframe)], oam, sizeof(OamDataShort));

                x1 = oam->all.attr1 & 0x1FF;
                y1 = oam->all.attr0 & 0xFF;
                oam->all.attr1 &= 0xFE00;
                oam->all.attr0 &= 0xFE00;
                oam->all.attr2 += sprite->palId << 12;
                if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
                    oam->all.attr0 |= 0x100;
                    if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                        oam->all.attr0 |= 0x200;
                    }
                    oam->all.attr1 |= (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE) << 9;
                } else {
                    u32 shapeAndSize = ((oam->all.attr0 & 0xC000) >> 12);
                    u32 flipY;
                    u32 r6;

                    shapeAndSize |= ((oam->all.attr1 & 0xC000) >> 14);
                    flipY = sprite->frameFlags >> 11;
                    r6 = 1;

                    // y-flip
                    if ((((sprDims->flip >> 1) ^ flipY) & r6) != 0) {
                        oam->all.attr1 ^= 0x2000;
                        y1 = sprHeight - gOamShapesSizes[shapeAndSize][1] - y1;
                    }

                    // x-flip
                    if (((sprite->frameFlags >> 10) & r6) != (sprDims->flip & 1)) {
                        oam->all.attr1 ^= 0x1000;
                        x1 = sprWidth - gOamShapesSizes[shapeAndSize][0] - x1;
                    }
                }

                oam->all.attr0 |= (sprite->frameFlags & SPRITE_FLAG_MASK_OBJ_MODE) * 8;
                oam->all.attr2 |= (sprite->frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> 2;
                oam->all.attr0 += ((y + y1) & 0xFF);
                oam->all.attr1 += ((x + x1) & 0x1FF);

                if (oam->all.attr0 & (ST_OAM_8BPP << 13)) {
                    oam->all.attr2 += oam->all.attr2 & 0x3FF;
                }
                oam->all.attr2 += GET_TILE_NUM(sprite->graphics.dest);

                for (i = 0; i < numPositions; ++i) {
                    OamData *r5 = OamMalloc(GET_SPRITE_OAM_ORDER(sprite));

                    if (iwram_end == oam)
                        return;
                    DmaCopy16(3, oam, r5, sizeof(OamDataShort));
                    r5->all.attr1 &= 0xFE00;
                    r5->all.attr0 &= 0xFF00;
                    r5->all.attr0 += (positions[i].y + centerOffsetY + y1) & 0xFF;
                    r5->all.attr1 += (positions[i].x + centerOffsetX + x1) & 0x1FF;
                }
            }
        }
    }
}

// The parameter to this determines the order this sprite is expected to be drawn at.
//
// If you have created n Sprite instances, and you want them to be drawn in a certain
// order, you'd set their OAM order value (inside Sprite.oamFlags) accordingly.
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

    for (r3 = 0; r3 < (s32)ARRAY_COUNT(gUnknown_03001850); r3++) {
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

// (-2)
static AnimCmdResult animCmd_GetPalette(void *cursor, Sprite *s)
{
    ACmd_GetPalette *cmd = (ACmd_GetPalette *)cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    if (!(s->frameFlags & SPRITE_FLAG_MASK_18)) {
        s32 paletteIndex = cmd->palId;

        DmaCopy32(3, &gRefSpriteTables->palettes[paletteIndex * 16], &gObjPalette[s->palId * 16 + cmd->insertOffset], cmd->numColors * 2);

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    return ACMD_RESULT__RUNNING;
}

// (-3)
static AnimCmdResult animCmd_JumpBack(void *cursor, Sprite *s)
{
    ACmd_JumpBack *cmd = cursor;
    s->animCursor -= cmd->offset;

    return ACMD_RESULT__RUNNING;
}

// (-4)
static AnimCmdResult animCmd_End(void *cursor, Sprite *s)
{
    SPRITE_FLAG_SET(s, ANIM_OVER);

    return ACMD_RESULT__ENDED;
}

// (-5)
static AnimCmdResult animCmd_PlaySoundEffect(void *cursor, Sprite *s)
{
    ACmd_PlaySoundEffect *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    m4aSongNumStart(cmd->songId);

    return ACMD_RESULT__RUNNING;
}

// (-7)
static AnimCmdResult animCmd_TranslateSprite(void *cursor, Sprite *s)
{
    ACmd_TranslateSprite *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->x += cmd->x;
    s->y += cmd->y;

    return ACMD_RESULT__RUNNING;
}

// (-8)
static AnimCmdResult animCmd_8(void *cursor, Sprite *s)
{
    ACmd_8 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    return ACMD_RESULT__RUNNING;
}

// (-9)
static AnimCmdResult animCmd_SetIdAndVariant(void *cursor, Sprite *s)
{
    ACmd_SetIdAndVariant *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->graphics.anim = cmd->animId;
    s->prevVariant = -1;
    s->variant = cmd->variant;

    return ACMD_RESULT__ANIM_CHANGED;
}

// (-10)
static AnimCmdResult animCmd_10(void *cursor, Sprite *s)
{
    ACmd_10 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

#ifdef BUG_FIX
    return ACMD_RESULT__RUNNING; // I think this should be the correct behavior?
#else
    return (s32)cursor;
#endif
}

// (-11)
// Sets the priority the sprite has in OAM (0 - 3)
static AnimCmdResult animCmd_SetSpritePriority(void *cursor, Sprite *s)
{
    ACmd_SetSpritePriority *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    SPRITE_FLAG_CLEAR(s, PRIORITY);
    SPRITE_FLAG_SET_VALUE(s, PRIORITY, cmd->priority);

    return ACMD_RESULT__RUNNING;
}

// (-12)
// Sets the index 's' is expected to be put at in OAM
// compared to sprites with a lower/higher value (0 - 31)
static AnimCmdResult animCmd_SetOamOrder(void *cursor, Sprite *s)
{
    ACmd_SetOamOrder *cmd = cursor;

    s->animCursor += AnimCommandSizeInWords(*cmd);
    s->oamFlags = SPRITE_OAM_ORDER(cmd->orderIndex);

    return ACMD_RESULT__RUNNING;
}
