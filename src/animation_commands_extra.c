#include "global.h"
#include "m4a.h"

#include "data.h"
#include "flags.h"
#include "sprite.h"

#include "animation_commands.h"

extern const struct SpriteTables *gUnknown_03002794;
extern u8 gUnknown_03002A84;
extern struct BgHeader *gUnknown_030027A0[];

// (-1)
s32 animCmd_GetTiles(void *cursor, Sprite *sprite)
{
    ACmd_GetTiles *cmd = (ACmd_GetTiles *)cursor;
    sprite->unk14 += AnimCommandSizeInWords(ACmd_GetTiles);

    if((sprite->unk10 & 0x80000) == 0) {
        // @TODO: Change sprite->unk0 to be a pointer
        if (cmd->tileIndex < 0) {
            sprite->unk0 = (u32)&gUnknown_03002794->tiles_8bpp[cmd->tileIndex * TILE_SIZE_8BPP];
            sprite->unk8 = cmd->numTilesToCopy * TILE_SIZE_8BPP;
        } else {
            sprite->unk0 = (u32)&gUnknown_03002794->graphics[cmd->tileIndex * TILE_SIZE_4BPP];
            sprite->unk8 = cmd->numTilesToCopy * TILE_SIZE_4BPP;
        }

        gUnknown_030027A0[gUnknown_03002A84] = (struct BgHeader*)sprite;
        gUnknown_03002A84 = (gUnknown_03002A84 + 1) & 0x1F;
    }

    return 1;
}