#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Decoration;

void Task_Decoration(void);
void TaskDestructor_Decoration(struct Task *);

static const TileInfo sDecoTileAnimInfo[7] = {
    { 2, SA2_ANIM_DECORATION__FLOWER_BLUE_SMALL, 0 },
    { 4, SA2_ANIM_DECORATION__FLOWER_BLUE, 0 },
    { 2, SA2_ANIM_DECORATION__FLOWER_RED_SMALL, 0 },
    { 4, SA2_ANIM_DECORATION__FLOWER_YELLOW, 0 },
    { 14, SA2_ANIM_DECORATION__ROCK, 0 },
    { 0, SA2_ANIM_DECORATION__552, 0 },
    { 12, SA2_ANIM_DECORATION__WATER_GROUND_SPLASH, 0 },
};

#define decoId d.sData[0]

void CreateEntity_Decoration(MapEntity *me, u16 regionX, u16 regionY, u8 spriteY)
{
    struct Task *t;
    Sprite_Decoration *base;
    Sprite *s;

    if (me->decoId >= 0) {
        t = TaskCreate(Task_Decoration, sizeof(Sprite_Decoration), 0x2010, 0, TaskDestructor_Decoration);
        base = TASK_DATA(t);
        s = &base->displayed;

        base->base.regionX = regionX;
        base->base.regionY = regionY;

        base->base.me = me;
        base->base.meX = me->x;
        base->base.id = spriteY;

        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(sDecoTileAnimInfo[me->decoId].numTiles);
        s->graphics.anim = sDecoTileAnimInfo[me->decoId].anim;
        s->variant = sDecoTileAnimInfo[me->decoId].variant;

        s->oamFlags = SPRITE_OAM_ORDER(28);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
    }
}

void Task_Decoration(void)
{
    Sprite_Decoration *base = TASK_DATA(gCurTask);
    Sprite *s = &base->displayed;
    MapEntity *me = base->base.me;
    s32 screenX;

#ifndef NON_MATCHING
    register s32 screenY asm("r2");
#else
    s32 screenY;
#endif

    screenX = (base->base.meX) * TILE_WIDTH;
    screenX += (base->base.regionX) * CAM_REGION_WIDTH;
    screenY = (me->y) * TILE_WIDTH;
    screenY += (base->base.regionY) * CAM_REGION_WIDTH;

    screenX -= gCamera.x;
    s->x = screenX;
    screenY -= gCamera.y;
    s->y = screenY;

    if (IS_OUT_OF_CAM_RANGE(screenX, s->y)) {
        me->x = base->base.meX;
        TaskDestroy(gCurTask);
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

// InteractableDecorationOnDestroy
void TaskDestructor_Decoration(struct Task *t)
{
    Sprite_Decoration *s = TASK_DATA(t);
    VramFree(s->displayed.graphics.dest);
}

#undef decoId
