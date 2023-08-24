#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "game/game.h"
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
    { 4, SA2_ANIM_WIND_MILL_PART, 3 }, { 4, SA2_ANIM_WIND_MILL_PART, 2 },
    { 4, SA2_ANIM_WIND_MILL_PART, 1 }, { 4, SA2_ANIM_WIND_MILL_PART, 0 },
    { 4, SA2_ANIM_WIND_MILL_PART, 6 },
};

void CreateEntity_Windmill(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    u8 i, j;
    void *ramDests[4];
    Sprite *s;
    struct Task *t = TaskCreate(Task_WindmillMain, sizeof(InteractableWindmill), 0x2010,
                                0, TaskDestructor_Windmill);
    InteractableWindmill *windmill = TaskGetStructPtr(t);

    s = &windmill->center;
    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.spriteX = me->x;
    windmill->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(sWindmillParts[4].numTiles);
    s->graphics.anim = sWindmillParts[4].anim;
    s->variant = sWindmillParts[4].variant;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].unk0 = -1;
    s->unk10 = 0x2000;
    sub_8004558(s);

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
            s->unk1A = 0x480;
            s->graphics.size = 0;
            s->unk14 = 0;
            s->unk1C = 0;
            s->unk21 = 0xFF;
            s->unk22 = 0x10;
            s->palId = 0;
            s->hitboxes[0].unk0 = -1;
            s->unk10 = 0;
            sub_8004558(s);
        }
    }
}

static void Task_WindmillMain(void)
{
    u8 i, j;
    SpriteTransform *transform;
    InteractableWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *s = &windmill->center;
    MapEntity *me = windmill->base.me;

    s32 screenX, screenY;
    s32 baseX, baseY;

    screenX = TO_WORLD_POS(windmill->base.spriteX, windmill->base.regionX);
    screenY = TO_WORLD_POS(me->y, windmill->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = windmill->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_80051E8(s);
    screenX = s->x;
    screenY = s->y;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            u32 temp, mask, r0;

            s = &windmill->blades[i * 4 + j].s;
            transform = &windmill->blades[i * 4 + j].transform;
            temp = (gUnknown_03005590 * 2 + (i * 256));

            s->x = screenX + ((COS(CLAMP_SIN_PERIOD(temp)) * ((j + 1) * 16 - 8)) >> 14);
            s->y = screenY + ((SIN(CLAMP_SIN_PERIOD(temp)) * ((j + 1) * 16 - 8)) >> 14);
            transform->unk0 = CLAMP_SIN_PERIOD(temp);
            transform->width = 256;
            transform->height = 256;
            transform->x = s->x;
            transform->y = s->y;

            s->unk10 = (gUnknown_030054B8++ | 0x1060);
            sub_8004860(s, transform);
            sub_80051E8(s);
        }
    }
}

static void TaskDestructor_Windmill(struct Task *t)
{
    InteractableWindmill *windmill = TaskGetStructPtr(t);
    VramFree(windmill->center.graphics.dest);
    VramFree(windmill->blades[0].s.graphics.dest);
    VramFree(windmill->blades[1].s.graphics.dest);
    VramFree(windmill->blades[2].s.graphics.dest);
    VramFree(windmill->blades[3].s.graphics.dest);
}
