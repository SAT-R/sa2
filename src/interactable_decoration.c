#include "global.h"
#include "malloc_vram.h"
#include "task.h"

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
    /* 0x00 */ u32 padding_0; // type unknown
    /* 0x04 */ void *tilesVram;
    /* 0x08 */ u16 v8;
    /* 0x0A */ u16 animIndex;
    /* 0x0C */ u8 padding_C[0x4];
    /* 0x10 */ u32 v10;
    /* 0x14 */ u16 v14;
    /* 0x16 */ u16 mapX;
    /* 0x18 */ u16 mapY;
    /* 0x1A */ u16 v1A;
    /* 0x1C */ u16 v1C;
    /* 0x1E */ u8 padding_1E[2];
    /* 0x20 */ u8 v20;
    /* 0x21 */ u8 v21;
    /* 0x22 */ u8 v22;
    /* 0x23 */ u8 padding_23[0x2];
    /* 0x25 */ u8 v25;
    /* 0x28 */ s32 v28; // might be unsigned?
    /* 0x2C */ u8 padding_2c[4];
} Decoration;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Decoration main;
} Sprite_Decoration;

typedef struct {
    /* 0x00 */ u32 tileNum;
    /* 0x04 */ u16 animIndex;
    /* 0x06 */ u8 v6;
    /* 0x07 */ u8 v7;
} TileInfo;

extern void Task_Interactable_Decoration(void);
void TaskDestructor_Interactable_Decoration(struct Task *);

static const TileInfo sDecoTileAnimInfo[7]
    = { { 2, SA2_ANIM_FLOWER_BLUE_SMALL, 0, 0 },
        { 4, SA2_ANIM_FLOWER_BLUE, 0, 0 },
        { 2, SA2_ANIM_FLOWER_RED_SMALL, 0, 0 },
        { 4, SA2_ANIM_FLOWER_YELLOW, 0, 0 },
        { 14, SA2_ANIM_ROCK, 0, 0 },
        { 0, SA2_ANIM_552, 0, 0 },
        { 12, SA2_ANIM_WATER_GROUND_SPLASH, 0, 0 } };

#define decoId data[0]

void initSprite_Interactable_Decoration(void *inEntity, u16 regionX, u16 regionY,
                                        u8 spriteY)
{
    struct Task *t;
    Sprite_Decoration *decoBase;
    Decoration *deco;
    Interactable *entity = (Interactable *)inEntity;

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

        deco->mapX = SpriteGetMapPos(entity->x, regionX);
        deco->mapY = SpriteGetMapPos(entity->y, regionY);
        SET_SPRITE_INITIALIZED(entity);

        deco->tilesVram = VramMalloc(sDecoTileAnimInfo[entity->decoId].tileNum);
        deco->animIndex = sDecoTileAnimInfo[entity->decoId].animIndex;
        deco->v20 = sDecoTileAnimInfo[entity->decoId].v6;

        deco->v1A = 0x700;
        deco->v8 = 0;
        deco->v14 = 0;
        deco->v1C = 0;
        deco->v21 = 0xFF;
        deco->v22 = 0x10;
        deco->v25 = 0;
        deco->v28 = -1;
        deco->v10 = 0x2000;
    }
}

#if 0 // matches
void TaskDestructor_Interactable_Decoration(struct Task *t)
{
    Sprite_Decoration *deco = TaskGetStructPtr(t);
    VramFree(deco->main.tilesVram);
}
#endif

#undef decoId