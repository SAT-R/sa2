#include "global.h"
#include "flags.h"
#include "core.h"
#include "sprite.h"
#include "data/sprite_data.h"
#include "trig.h"
#include "animation_commands.h"

extern const AnimationCommandFunc animCmdTable[];

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

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

// This function gets called as long as an enemy is on-screen.
// Potentially something to do with collision/distance?
s16 sub_8004418(s16 x, s16 y)
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
            fraction = Q_24_8(0.5) - fraction;
        }

        {
            s32 val = array[index] * Q_24_8(0.5);
            fraction += val;
            result = ((u32)(fraction << 22) >> 22);
        }
    }
    return result;
}

void numToTileIndices(u8 *digits, u16 number)
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

u32 sub_8004518(u16 num)
{
    u8 i;
    u16 result;
    u8 lowDigit;
    u32 remainder = num;

    result = 0;
    for (i = 0; i < 4; i++) {
        s32 divisor = Div(remainder, 10);
        lowDigit = remainder - (divisor * 10);
        remainder = (u16)divisor;

        result |= lowDigit << (i * 4);
    }

    return result;
}

s32 UpdateSpriteAnimation(Sprite *s)
{
    SPRITE_MAYBE_SWITCH_ANIM(s);

    if (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER)
        return 0;

    if (s->timeUntilNextFrame > 0)
        s->timeUntilNextFrame -= s->animSpeed * 16;
    else {
        /* Call all commands for the new frame */
        s32 ret;
        ACmd *cmd;
        ACmd *script;
        ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gUnknown_03002794->animations[s->graphics.anim];
        script = variants[s->variant];
        cmd = ReadInstruction(script, s->animCursor);
        while (cmd->id < 0) {
            ret = animCmdTable[~cmd->id](cmd, s);
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
                variants = gUnknown_03002794->animations[s->graphics.anim];
                newScript = variants[s->variant];

                // reset cursor
                s->animCursor = 0;

                // load the new script
                script = newScript;
            }
            cmd = ReadInstruction(script, s->animCursor);
        }

        // Display the image 'index' for 'delay' frames
        s->timeUntilNextFrame += Q_8_8(((ACmd_ShowFrame *)cmd)->delay);
        s->timeUntilNextFrame -= s->animSpeed * 16;
        {
            s32 frame = ((ACmd_ShowFrame *)cmd)->index;
            if (frame != -1) {
                const struct SpriteTables *sprTables = gUnknown_03002794;

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
s32 animCmd_GetTiles(void *cursor, Sprite *s)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    s->animCursor += AnimCommandSizeInWords(ACmd_GetTiles);

    if ((s->unk10 & SPRITE_FLAG_MASK_19) == 0) {
        if (cmd->tileIndex < 0) {
            s->graphics.src
                = &gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            s->graphics.size = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            s->graphics.src
                = &gUnknown_03002794->tiles_4bpp[cmd->tileIndex * TILE_SIZE_4BPP];
            s->graphics.size = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &s->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
    }

    return 1;
}

// (-6)
s32 animCmd_AddHitbox(void *cursor, Sprite *s)
{
    ACmd_Hitbox *cmd = (ACmd_Hitbox *)cursor;
    s32 hitboxId = cmd->hitbox.index % 16u;
    s->animCursor += AnimCommandSizeInWords(ACmd_Hitbox);

    DmaCopy32(3, &cmd->hitbox, &s->hitboxes[hitboxId].index, 8);

    if ((cmd->hitbox.left == 0) && (cmd->hitbox.top == 0) && (cmd->hitbox.right == 0)
        && (cmd->hitbox.bottom == 0)) {
        s->hitboxes[hitboxId].index = -1;
    } else {
        if (s->unk10 & SPRITE_FLAG_MASK_Y_FLIP) {
            SWAP_AND_NEGATE(s->hitboxes[hitboxId].top, s->hitboxes[hitboxId].bottom);
        }

        if (s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
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
    affine[0] = Q_24_8_TO_INT(COS_24_8(angle) * res);

    res = Div(0x10000, p1);
    affine[4] = Q_24_8_TO_INT(SIN_24_8(angle) * res);

    res = Div(0x10000, p2);
    affine[8] = Q_24_8_TO_INT((-(SIN(angle)) >> 6) * res);

    res = Div(0x10000, p2);
    affine[12] = Q_24_8_TO_INT(COS_24_8(angle) * res);
}

// Similar to sub_8004ABC and sub_8004E14
// (53.42%) https://decomp.me/scratch/llwGy
NONMATCH("asm/non_matching/engine/sub_8004860.inc",
         void sub_8004860(Sprite *s, SpriteTransform *transform))
{
    // sp24 = s
    SpriteOffset *dimensions = s->dimensions;

    u16 sp00[8];

    if (dimensions != (SpriteOffset *)-1) {
        int temp;
        s16 res;
        s32 sp10, sp14; // posX, posY
        s16 sp18[2];
        s16 sp1C[2];
        s32 affineIndex = s->unk10 & 0x1F; // sp20
        u16 *affine = &gOamBuffer[affineIndex * 4].all.affineParam;
        u16 *pTemp, *pTemp2;

#if 0
        sub_80047A0(transform->rotation & ONE_CYCLE, transform->width, transform->height, affineIndex);
#else
        sp00[4] = COS_24_8(transform->rotation & ONE_CYCLE);
        sp00[5] = SIN_24_8(transform->rotation & ONE_CYCLE);

        sp00[6] = transform->width;
        sp00[7] = transform->height;

        res = Div(0x10000, sp00[6]);
        affine[0] = Q_8_8_TO_INT(((sp00[4] << 16) >> 16) * res);

        res = Div(0x10000, sp00[6]);
        affine[4] = Q_24_8_TO_INT(sp00[5] * res);

        res = Div(0x10000, sp00[7]);
        affine[8] = Q_24_8_TO_INT(-sp00[4] * res);

        res = Div(0x10000, sp00[7]);
        affine[12] = Q_24_8_TO_INT(sp00[5] * res);
#endif

        if (transform->height < 0)
            sp00[6] = -transform->height;

        if (transform->width < 0)
            sp00[7] = -transform->width;

        // _0800497A
        sp00[0] = Q_24_8_TO_INT(sp00[4] * sp00[6]);
        sp00[1] = Q_24_8_TO_INT(-sp00[5] * sp00[6]);
        sp00[2] = Q_24_8_TO_INT(sp00[5] * sp00[7]);
        sp00[3] = Q_24_8_TO_INT(sp00[6] * sp00[7]);

        pTemp = &sp18[0];
        *pTemp++ = 0x100;
        *pTemp = 0;
        pTemp2 = &sp1C[0];
        *pTemp2++ = 0;
        *pTemp2++ = 0x100;

        sp10 = transform->x;
        sp14 = transform->y;

        // _08004A20
        {
            s16 r3;
            s32 r0, r1, r2, r4;
            u32 r5;

            if (transform->width > 0) {
                r4 = (u16)dimensions->offsetX;
                r2 = dimensions->width;
            } else {
                r4 = dimensions->width - (u16)dimensions->offsetX;
                r2 = dimensions->width;
            }

            // _08004A2E
            r3 = transform->height;

            if (r3 > 0) {
                r3 = (u16)dimensions->offsetY;
                r5 = dimensions->height;
            } else {
                // _08004A3E
                r3 = dimensions->height - (u16)dimensions->offsetY;
                r5 = dimensions->height;
            }

            // _08004A4C
            r0 = sp00[0];
            r4 -= dimensions->width / 2;
            r1 = r0;
            r1 *= r4;
            r0 = sp00[1];
            r5 >>= 1;
            r3 -= r5;
            r0 *= r3;
            r1 += r0;
            r1 += (r2 << 8);
            r1 >>= 8;
            sp10 -= r1;

            // __080004A7E
            r1 = sp00[2];
            r1 *= r4;
            r0 = sp00[7];
            r0 *= r3;
            r1 += r0;
            r1 += Q_24_8(r5);
            r1 >>= 8;

            sp14 -= r1;

            s->x = sp10;
            s->y = sp14;
        }
    }
}
END_NONMATCH
