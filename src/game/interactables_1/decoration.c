#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "game/game.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Decoration;

void Task_Interactable_Decoration(void);
void TaskDestructor_Interactable_Decoration(struct Task *);

static const TileInfo sDecoTileAnimInfo[7] = {
    { 2, SA2_ANIM_FLOWER_BLUE_SMALL, 0 },
    { 4, SA2_ANIM_FLOWER_BLUE, 0 },
    { 2, SA2_ANIM_FLOWER_RED_SMALL, 0 },
    { 4, SA2_ANIM_FLOWER_YELLOW, 0 },
    { 14, SA2_ANIM_ROCK, 0 },
    { 0, SA2_ANIM_552, 0 },
    { 12, SA2_ANIM_WATER_GROUND_SPLASH, 0 },
};

#define decoId d.sData[0]

// InteractableDecorationInit
void initSprite_Interactable_Decoration(MapEntity *me, u16 regionX, u16 regionY,
                                        u8 spriteY)
{
    struct Task *t;
    Sprite_Decoration *decoBase;
    Sprite *deco;

    if (me->decoId >= 0) {
        t = TaskCreate(Task_Interactable_Decoration, sizeof(Sprite_Decoration), 0x2010,
                       0, TaskDestructor_Interactable_Decoration);
        decoBase = TaskGetStructPtr(t);
        deco = &decoBase->displayed;

        decoBase->base.regionX = regionX;
        decoBase->base.regionY = regionY;

        decoBase->base.me = me;
        decoBase->base.spriteX = me->x;
        decoBase->base.spriteY = spriteY;

        deco->x = SpriteGetScreenPos(me->x, regionX);
        deco->y = SpriteGetScreenPos(me->y, regionY);
        SET_SPRITE_INITIALIZED(me);

        deco->graphics.dest = VramMalloc(sDecoTileAnimInfo[me->decoId].numTiles);
        deco->graphics.anim = sDecoTileAnimInfo[me->decoId].anim;
        deco->variant = sDecoTileAnimInfo[me->decoId].variant;

        deco->unk1A = 0x700;
        deco->graphics.size = 0;
        deco->unk14 = 0;
        deco->unk1C = 0;
        deco->unk21 = 0xFF;
        deco->unk22 = 0x10;
        deco->focused = 0;
        deco->unk28[0].unk0 = -1;
        deco->unk10 = 0x2000;
    }
}

void Task_Interactable_Decoration(void)
{
    Sprite_Decoration *decoBase = TaskGetStructPtr(gCurTask);
    Sprite *deco = &decoBase->displayed;
    MapEntity *me = decoBase->base.me;
    s32 screenX;

#ifndef NON_MATCHING
    register s32 screenY asm("r2");
#else
    s32 screenX;
#endif

    screenX = (decoBase->base.spriteX) * TILE_WIDTH;
    screenX += (decoBase->base.regionX) * CAM_REGION_WIDTH;
    screenY = (me->y) * TILE_WIDTH;
    screenY += (decoBase->base.regionY) * CAM_REGION_WIDTH;

    screenX -= gCamera.x;
    deco->x = screenX;
    screenY -= gCamera.y;
    deco->y = screenY;

    if (IS_OUT_OF_CAM_RANGE(screenX, deco->y)) {
        me->x = decoBase->base.spriteX;
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
    VramFree(deco->displayed.graphics.dest);
}

#undef decoId
