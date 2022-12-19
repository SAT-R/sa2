#include "global.h"
#include "m4a.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

#include "animation_commands.h"

extern const struct SpriteTables *gUnknown_03002794;
extern u8 gVramGraphicsCopyQueueIndex;
extern struct GraphicsData *gVramGraphicsCopyQueue[];

// (-1)
s32 animCmd_GetTiles(void *cursor, Sprite *sprite)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetTiles);

    if ((sprite->unk10 & 0x80000) == 0) {
        // @TODO: Change sprite's unk0 to be a pointer
        if (cmd->tileIndex < 0) {
            sprite->graphics.src
                = &gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            sprite->graphics.size = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            sprite->graphics.src
                = &gUnknown_03002794->graphics[cmd->tileIndex * TILE_SIZE_4BPP];
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
