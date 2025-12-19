#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_1/windmill.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
} BladePiece;

typedef struct {
    SpriteBase base;
    Sprite center;
    BladePiece blades[16];
} InteractableWindmill; /* size: 0x3FC */

static void TaskDestructor_Windmill(struct Task *);
static void Task_WindmillMain(void);

static const TileInfo sWindmillParts[] = {
    { 4, SA2_ANIM_WIND_MILL_PART, 3 }, { 4, SA2_ANIM_WIND_MILL_PART, 2 }, { 4, SA2_ANIM_WIND_MILL_PART, 1 },
    { 4, SA2_ANIM_WIND_MILL_PART, 0 }, { 4, SA2_ANIM_WIND_MILL_PART, 6 },
};

void CreateEntity_Windmill(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u8 i, j;
    void *ramDests[4];
    Sprite *s;
    struct Task *t = TaskCreate(Task_WindmillMain, sizeof(InteractableWindmill), 0x2010, 0, TaskDestructor_Windmill);
    InteractableWindmill *windmill = TASK_DATA(t);

    s = &windmill->center;
    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.meX = me->x;
    windmill->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(sWindmillParts[4].numTiles);
    s->graphics.anim = sWindmillParts[4].anim;
    s->variant = sWindmillParts[4].variant;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            s = &windmill->blades[i * 4 + j].s;
            s->x = 0;
            s->y = 0;
            if (i == 0) {
                s->graphics.dest = VramMalloc(sWindmillParts[j].numTiles);
                ramDests[j] = s->graphics.dest;
            } else {
                s->graphics.dest = ramDests[j];
            }
            s->graphics.anim = sWindmillParts[j].anim;
            s->variant = sWindmillParts[j].variant;
            s->oamFlags = SPRITE_OAM_ORDER(18);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0;
            UpdateSpriteAnimation(s);
        }
    }
}

static void Task_WindmillMain(void)
{
    u8 i, j;
    SpriteTransform *transform;
    InteractableWindmill *windmill = TASK_DATA(gCurTask);
    Sprite *s = &windmill->center;
    MapEntity *me = windmill->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(windmill->base.meX, windmill->base.regionX);
    screenY = TO_WORLD_POS(me->y, windmill->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = windmill->base.meX;
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
    screenX = s->x;
    screenY = s->y;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            u32 sinPeriod;

            s = &windmill->blades[i * 4 + j].s;
            transform = &windmill->blades[i * 4 + j].transform;
            sinPeriod = (gStageTime * 2 + (i * 256));

            s->x = screenX + ((COS(CLAMP_SIN_PERIOD(sinPeriod)) * ((j + 1) * 16 - 8)) >> 14);
            s->y = screenY + ((SIN(CLAMP_SIN_PERIOD(sinPeriod)) * ((j + 1) * 16 - 8)) >> 14);
            transform->rotation = CLAMP_SIN_PERIOD(sinPeriod);
            transform->qScaleX = 256;
            transform->qScaleY = 256;
            transform->x = s->x;
            transform->y = s->y;

            s->frameFlags = (gOamMatrixIndex++ | 0x1060);
            TransformSprite(s, transform);
            DisplaySprite(s);
        }
    }
}

static void TaskDestructor_Windmill(struct Task *t)
{
    InteractableWindmill *windmill = TASK_DATA(t);
    VramFree(windmill->center.graphics.dest);
    VramFree(windmill->blades[0].s.graphics.dest);
    VramFree(windmill->blades[1].s.graphics.dest);
    VramFree(windmill->blades[2].s.graphics.dest);
    VramFree(windmill->blades[3].s.graphics.dest);
}
