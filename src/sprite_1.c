#include "global.h"
#include "core.h"
#include "sprite.h"
#include "flags.h"

extern s32 animCmd_GetTiles_COPY(void *, Sprite *);
extern s32 animCmd_GetPalette_COPY(void *, Sprite *);
extern s32 animCmd_JumpBack_COPY(void *, Sprite *);
extern s32 animCmd_End_COPY(void *, Sprite *);
extern s32 animCmd_PlaySoundEffect_COPY(void *, Sprite *);
extern s32 animCmd_AddHitbox_COPY(void *, Sprite *);
extern s32 animCmd_TranslateSprite_COPY(void *, Sprite *);
extern s32 animCmd_8_COPY(void *, Sprite *);
extern s32 animCmd_SetIdAndVariant_COPY(void *, Sprite *);
extern s32 animCmd_10_COPY(void *, Sprite *);
extern s32 animCmd_SetSpritePriority_COPY(void *, Sprite *);
extern s32 animCmd_12_COPY(void *, Sprite *);

const AnimationCommandFunc animCmdTable_2[12] = {
    animCmd_GetTiles_COPY,          animCmd_GetPalette_COPY,
    animCmd_JumpBack_COPY,          animCmd_End_COPY,
    animCmd_PlaySoundEffect_COPY,   animCmd_AddHitbox_COPY,
    animCmd_TranslateSprite_COPY,   animCmd_8_COPY,
    animCmd_SetIdAndVariant_COPY,   animCmd_10_COPY,
    animCmd_SetSpritePriority_COPY, animCmd_12_COPY,
};

void sub_8002A3C(Background *background)
{
    struct MapHeader *mapHeader = gUnknown_03002260[background->tilemapId];
    const u16 *pal;
    u32 palSize;
    u16 gfxSize;

    background->unk14 = mapHeader->h.xTiles;
    background->unk16 = mapHeader->h.yTiles;
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
    background->unk2A = mapHeader->h.palOffset;

    if (!(background->flags & BACKGROUND_UPDATE_PALETTE)) {
        DmaCopy16(3, pal, gBgPalette + background->unk2A, palSize * sizeof(*pal));
        gFlags |= 1;
        background->flags ^= BACKGROUND_UPDATE_PALETTE;
    }

    background->unk10 = mapHeader->h.map;

    if (background->flags & BACKGROUND_FLAG_IS_LEVEL_MAP) {
        background->metatileMap = mapHeader->metatileMap;
        background->mapWidth = mapHeader->mapWidth;
        background->mapHeight = mapHeader->mapHeight;
    }

    gUnknown_03001800[gUnknown_0300287C] = background;
    gUnknown_0300287C = (gUnknown_0300287C + 1) & 0xF;
}
