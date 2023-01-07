#include "global.h"
#include "main.h"
#include "sprite.h"
#include "flags.h"

extern s32 animCmd_GetTiles_COPY(void *, Sprite *);
extern s32 animCmd_GetPalette_COPY(void *, Sprite *);
extern s32 animCmd_JumpBack_COPY(void *, Sprite *);
extern s32 animCmd_End_COPY(void *, Sprite *);
extern s32 animCmd_PlaySoundEffect_COPY(void *, Sprite *);
extern s32 animCmd_6_COPY(void *, Sprite *);
extern s32 animCmd_TranslateSprite_COPY(void *, Sprite *);
extern s32 animCmd_8_COPY(void *, Sprite *);
extern s32 animCmd_SetIdAndVariant_COPY(void *, Sprite *);
extern s32 animCmd_10_COPY(void *, Sprite *);
extern s32 animCmd_SetSpritePriority_COPY(void *, Sprite *);
extern s32 animCmd_12_COPY(void *, Sprite *);

const AnimationCommandFunc animCmdTable_2[12] = {
    animCmd_GetTiles_COPY,          animCmd_GetPalette_COPY,
    animCmd_JumpBack_COPY,          animCmd_End_COPY,
    animCmd_PlaySoundEffect_COPY,   animCmd_6_COPY,
    animCmd_TranslateSprite_COPY,   animCmd_8_COPY,
    animCmd_SetIdAndVariant_COPY,   animCmd_10_COPY,
    animCmd_SetSpritePriority_COPY, animCmd_12_COPY,
};

void sub_8002A3C(Background *background)
{
    struct MapHeader_Full *r6 = gUnknown_03002260[background->unk1C].y;
    u32 a;
    u16 *c;

    background->unk14 = r6->unk0.X_Tiles;
    background->unk16 = r6->unk0.Y_Tiles;
    background->graphics.src = r6->unk0.Tileset;
    background->graphics.size = r6->unk0.unkC;

    if (!(background->unk2E & 8)) {
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &background->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        background->unk2E ^= 8;
    }

    c = r6->unk0.Palette;
    a = r6->unk0.unk16;
    background->unk2A = r6->unk0.unk14;

    if (!(background->unk2E & 0x10)) {
        DmaCopy16(3, c, gBgPalette + background->unk2A, a * 2);
        gFlags |= 1;
        background->unk2E ^= 0x10;
    }

    background->unk10 = r6->unk0.Metatiles;

    if (background->unk2E & 0x40) { // Can we actually trigger this condition?
        background->unk38 = r6->unk0.Map;
        background->unk3C = r6->Map_Width;
        background->unk3E = r6->Map_Height;
    }

    gUnknown_03001800[gUnknown_0300287C] = background;
    gUnknown_0300287C = (gUnknown_0300287C + 1) & 0xF;
}
