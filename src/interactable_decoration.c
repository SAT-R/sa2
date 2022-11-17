#include "global.h"
#include "malloc_vram.h"
#include "task.h"
#include "game.h"

#include "constants/animations.h"
#include "interactable.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ Interactable *entity;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 main;
} Sprite_Decoration;

void Task_Interactable_Decoration(void);
void TaskDestructor_Interactable_Decoration(struct Task *);

static const struct UNK_080E0D64 sDecoTileAnimInfo[7] = {
    { 2, SA2_ANIM_FLOWER_BLUE_SMALL, 0 },
    { 4, SA2_ANIM_FLOWER_BLUE, 0 },
    { 2, SA2_ANIM_FLOWER_RED_SMALL, 0 },
    { 4, SA2_ANIM_FLOWER_YELLOW, 0 },
    { 14, SA2_ANIM_ROCK, 0 },
    { 0, SA2_ANIM_552, 0 },
    { 12, SA2_ANIM_WATER_GROUND_SPLASH, 0 },
};

#define decoId data[0]

// InteractableDecorationInit
void initSprite_Interactable_Decoration(void *inEntity, u16 regionX, u16 regionY,
                                        u8 spriteY)
{
    struct Task *t;
    Sprite_Decoration *decoBase;
    struct UNK_0808B3FC_UNK240 *deco;
    Interactable *entity = inEntity;

    if (entity->decoId >= 0) {
        t = TaskCreate(Task_Interactable_Decoration, sizeof(Sprite_Decoration), 0x2010,
                       0, TaskDestructor_Interactable_Decoration);
        decoBase = TaskGetStructPtr(t);
        deco = &decoBase->main;

        decoBase->base.regionX = regionX;
        decoBase->base.regionY = regionY;

        decoBase->base.entity = entity;
        decoBase->base.spriteX = entity->x;
        decoBase->base.spriteY = spriteY;

        deco->unk16 = SpriteGetScreenPos(entity->x, regionX);
        deco->unk18 = SpriteGetScreenPos(entity->y, regionY);
        SET_SPRITE_INITIALIZED(entity);

        deco->unk4 = VramMalloc(sDecoTileAnimInfo[entity->decoId].unk0);
        deco->unkA = sDecoTileAnimInfo[entity->decoId].unk4;
        deco->unk20 = sDecoTileAnimInfo[entity->decoId].unk6;

        deco->unk1A = 0x700;
        deco->unk8 = 0;
        deco->unk14 = 0;
        deco->unk1C = 0;
        deco->unk21 = 0xFF;
        deco->unk22 = 0x10;
        deco->unk25 = 0;
        deco->unk28 = -1;
        deco->unk10 = 0x2000;
    }
}

void Task_Interactable_Decoration(void)
{
    Sprite_Decoration *decoBase = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *deco = &decoBase->main;
    Interactable *entity = decoBase->base.entity;
    s32 screenX;

#ifndef NON_MATCHING
    register s32 screenY asm("r2");
#else
    s32 screenX;
#endif

    screenX = (decoBase->base.spriteX) * TILE_WIDTH;
    screenX += (decoBase->base.regionX) * CAM_REGION_WIDTH;
    screenY = (entity->y) * TILE_WIDTH;
    screenY += (decoBase->base.regionY) * CAM_REGION_WIDTH;

    screenX -= gCamera.unk0;
    deco->unk16 = screenX;
    screenY -= gCamera.unk4;
    deco->unk18 = screenY;

    if ((u16)(screenX + (CAM_REGION_WIDTH / 2)) > 496
        || ((s16)deco->unk18 + (CAM_REGION_WIDTH / 2)) < 0 || (s16)deco->unk18 > 288) {
        entity->x = decoBase->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(deco);
        sub_80051E8(deco);
    }
}

// InteractableDecorationOnDestroy
void TaskDestructor_Interactable_Decoration(struct Task *t)
{
    Sprite_Decoration *deco = TaskGetStructPtr(t);
    VramFree(deco->main.unk4);
}

#undef decoId
