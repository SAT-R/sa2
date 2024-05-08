#include "global.h"
#include "flags.h"
#include "core.h"
#include "sprite.h"
#include "data/sprite_data.h"
#include "trig.h"
#include "animation_commands.h"

extern const AnimationCommandFunc animCmdTable[];

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

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
            y *= Q(0.5);

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
    SPRITE_MAYBE_SWITCH_ANIM(s);

    if (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER)
        return 0;

    if (s->timeUntilNextFrame > 0)
        s->timeUntilNextFrame -= s->animSpeed * 16;
    else {
        /* Call all commands for the new frame */
        s32 ret;
        const ACmd *cmd;
        const ACmd *script;
        const ACmd **variants;

        // Handle all the "regular" Animation commands with an ID < 0
        variants = gUnknown_03002794->animations[s->graphics.anim];
        script = variants[s->variant];
        cmd = ReadInstruction(script, s->animCursor);
        while (cmd->id < 0) {
            // TODO: make this const void*
            ret = animCmdTable[~cmd->id]((void *)cmd, s);
            if (ret != ACMD_RESULT__RUNNING) {
#ifndef NON_MATCHING
                register const ACmd *newScript asm("r2");
#else
                const ACmd *newScript;
#endif
                if (ret != ACMD_RESULT__ANIM_CHANGED) {
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
AnimCmdResult animCmd_GetTiles(void *cursor, Sprite *s)
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
AnimCmdResult animCmd_AddHitbox(void *cursor, Sprite *s)
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
    affine[0] = I(COS_24_8(angle) * res);

    res = Div(0x10000, p1);
    affine[4] = I(SIN_24_8(angle) * res);

    res = Div(0x10000, p2);
    affine[8] = I((-(SIN(angle)) >> 6) * res);

    res = Div(0x10000, p2);
    affine[12] = I(COS_24_8(angle) * res);
}

typedef struct {
    /* 0x00 */ u16 unk0[8];
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;

    /* 0x0C */ s16 unkC[2];

    /* 0x10 */ s32 posX;
    /* 0x14 */ s32 posY;

    /* 0x18 */ s16 unk18[2][2];
    u16 affineIndex;
} UnkStruct;

// Similar to sub_8004ABC and sub_8004E14
// (53.42%) https://decomp.me/scratch/llwGy
// (56.74%) https://decomp.me/scratch/rXgtp
NONMATCH("asm/non_matching/engine/sub_8004860.inc",
         void sub_8004860(Sprite *s, SpriteTransform *transform))
{
    // sp24 = s
    UnkStruct big;
    const SpriteOffset *dimensions = s->dimensions;

    if (dimensions != (SpriteOffset *)-1) {
        s16 res;
        u16 *affine;
        big.affineIndex = s->unk10 % 32u;
        affine = &gOamBuffer[big.affineIndex * 4].all.affineParam;

#if 01
        sub_80047A0(transform->rotation & ONE_CYCLE, transform->width, transform->height,
                    big.affineIndex);
#else
        big.unk0[4] = COS_24_8(transform->rotation & ONE_CYCLE);
        big.unk0[5] = SIN_24_8(transform->rotation & ONE_CYCLE);

        big.unk0[6] = transform->width;
        big.unk0[7] = transform->height;

        res = Div(0x10000, big.unk0[6]);
        affine[0] = Q_8_8_TO_INT(((big.unk0[4] << 16) >> 16) * res);

        res = Div(0x10000, big.unk0[6]);
        affine[4] = I(big.unk0[5] * res);

        res = Div(0x10000, big.unk0[7]);
        affine[8] = I(-big.unk0[4] * res);

        res = Div(0x10000, big.unk0[7]);
        affine[12] = I(big.unk0[5] * res);
#endif

        if (transform->height < 0)
            big.unk0[6] = -transform->height;

        if (transform->width < 0)
            big.unk0[7] = -transform->width;

        // _0800497A
        big.unk0[0] = I(big.unk0[4] * big.unk0[6]);
        big.unk0[1] = I(-big.unk0[5] * big.unk0[6]);
        big.unk0[2] = I(big.unk0[5] * big.unk0[7]);
        big.unk0[3] = I(big.unk0[6] * big.unk0[7]);

        big.unk18[0][0] = 0x100;
        big.unk18[0][1] = 0;
        big.unk18[1][0] = 0;
        big.unk18[1][1] = 0x100;

        big.posX = transform->x;
        big.posY = transform->y;

        // _08004A20
        {
            s32 r0;
            s16 r1_16;
            s32 r1;
            s32 r2;
            s16 r4;
            s16 r3;
            u32 r5;

            if (transform->width > 0) {
                r4 = (u16)dimensions->offsetX;
                r2 = dimensions->width;
            } else {
                s32 w = dimensions->width;
                r4 = w - (u16)dimensions->offsetX;
                r2 = w;
            }

            // _08004A2E
            r3 = transform->height;

            if (r3 > 0) {
                r3 = (u16)dimensions->offsetY;
                r5 = dimensions->height;
            } else {
                // _08004A3E
                s32 h = dimensions->height;
                r3 = h - (u16)dimensions->offsetY;
                r5 = h;
            }

            // _08004A4C
            r1_16 = big.unk0[0] * (r4 - dimensions->width / 2);
            r0 = big.unk0[1] * (r3 - dimensions->height / 2);
            r1_16 += r0;
            r1_16 = r1_16 + (r2 << 8);
            big.posX -= (r1_16 >> 8);

            // __080004A7E
            r1 = big.unk0[2];
            r1 *= r4;
            r0 = big.unk0[7];
            r0 *= r3;
            r1 += r0;
            r1 += Q(r5);
            r1 >>= 8;

            big.posY -= r1;

            s->x = big.posX;
            s->y = big.posY;
        }
    }
}
END_NONMATCH
