#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "game/game.h"
#include "game/interactables_1/windmill.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite sprite;
    /* 0x30 */ struct UNK_808D124_UNK180 transformConfig;
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
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_WindmillMain, sizeof(InteractableWindmill), 0x2010,
                                0, TaskDestructor_Windmill);
    InteractableWindmill *windmill = TaskGetStructPtr(t);

    sprite = &windmill->center;
    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.spriteX = me->x;
    windmill->base.spriteY = spriteY;

    sprite->x = TO_WORLD_POS(me->x, spriteRegionX);
    sprite->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(sWindmillParts[4].numTiles);
    sprite->graphics.anim = sWindmillParts[4].anim;
    sprite->variant = sWindmillParts[4].variant;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sub_8004558(sprite);

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            sprite = &windmill->blades[i * 4 + j].sprite;
            sprite->x = 0;
            sprite->y = 0;
            if (i == 0) {
                sprite->graphics.dest = VramMalloc(sWindmillParts[j].numTiles);
                ramDests[j] = sprite->graphics.dest;
            } else {
                sprite->graphics.dest = ramDests[j];
            }
            sprite->graphics.anim = sWindmillParts[j].anim;
            sprite->variant = sWindmillParts[j].variant;
            sprite->unk1A = 0x480;
            sprite->graphics.size = 0;
            sprite->unk14 = 0;
            sprite->unk1C = 0;
            sprite->unk21 = 0xFF;
            sprite->unk22 = 0x10;
            sprite->palId = 0;
            sprite->unk28[0].unk0 = -1;
            sprite->unk10 = 0;
            sub_8004558(sprite);
        }
    }
}

static void Task_WindmillMain(void)
{
    u8 i, j;
    struct UNK_808D124_UNK180 *transformConfig;
    InteractableWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &windmill->center;
    MapEntity *me = windmill->base.me;

    s32 screenX, screenY;
    s32 baseX, baseY;

    screenX = TO_WORLD_POS(windmill->base.spriteX, windmill->base.regionX);
    screenY = TO_WORLD_POS(me->y, windmill->base.regionY);
    sprite->x = screenX - gCamera.x;
    sprite->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        me->x = windmill->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_80051E8(sprite);
    screenX = sprite->x;
    screenY = sprite->y;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            u32 temp, mask, r0;

            sprite = &windmill->blades[i * 4 + j].sprite;
            transformConfig = &windmill->blades[i * 4 + j].transformConfig;
            temp = (gUnknown_03005590 * 2 + (i * 256));

            mask = ONE_CYCLE;
#ifndef NON_MATCHING
            asm("add %0, %1, #0" : "=r"(r0) : "r"(mask) : "cc");
#else
            r0 = mask;
#endif

            sprite->x = screenX + ((COS(temp & r0) * ((j + 1) * 16 - 8)) >> 14);
            sprite->y = screenY + ((SIN(temp & r0) * ((j + 1) * 16 - 8)) >> 14);
            transformConfig->unk0 = temp & r0;
            transformConfig->unk2 = 256;
            transformConfig->unk4 = 256;
            transformConfig->unk6[0] = sprite->x;
            transformConfig->unk6[1] = sprite->y;

            sprite->unk10 = (gUnknown_030054B8++ | 0x1060);
            sub_8004860(sprite, transformConfig);
            sub_80051E8(sprite);
        }
    }
}

static void TaskDestructor_Windmill(struct Task *t)
{
    InteractableWindmill *windmill = TaskGetStructPtr(t);
    VramFree(windmill->center.graphics.dest);
    VramFree(windmill->blades[0].sprite.graphics.dest);
    VramFree(windmill->blades[1].sprite.graphics.dest);
    VramFree(windmill->blades[2].sprite.graphics.dest);
    VramFree(windmill->blades[3].sprite.graphics.dest);
}
