#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "game/enemies/star.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 x;
    s32 y;
    u8 timer;
} Sprite_Star;

static void Task_StarIdle(void);
static void Task_StarClose(void);
static void Task_StarSpin(void);
static void Task_StarOpen(void);

#define IDLE_TIME       GBA_FRAMES_PER_SECOND * 2
#define SPIN_TIME       GBA_FRAMES_PER_SECOND * 2
#define OPEN_CLOSE_TIME GBA_FRAMES_PER_SECOND / 3

void CreateEntity_Star(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StarIdle, sizeof(Sprite_Star), 0x4050, 0,
                                TaskDestructor_80095E8);
    Sprite_Star *star = TaskGetStructPtr(t);
    Sprite *s = &star->s;

    star->base.regionX = spriteRegionX;
    star->base.regionY = spriteRegionY;
    star->base.me = me;
    star->base.spriteX = me->x;
    star->base.spriteY = spriteY;

    star->x = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    star->y = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
    star->timer = IDLE_TIME;

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0x19);
    s->graphics.anim = SA2_ANIM_STAR;
    s->variant = 0;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = 0x2000;
}

static void Task_StarIdle(void)
{
    Sprite_Star *star = TaskGetStructPtr(gCurTask);
    Sprite *s = &star->s;
    MapEntity *me = star->base.me;

    Vec2_32 pos;
    pos.x = Q_24_8_TO_INT(star->x);
    pos.y = Q_24_8_TO_INT(star->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((pos.x > gCamera.x + 0x170 || pos.x < gCamera.x - 0x80
         || pos.y > gCamera.y + 0x120 || pos.y < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, star->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--star->timer == 0) {
        star->timer = OPEN_CLOSE_TIME;
        s->graphics.anim = SA2_ANIM_STAR;
        s->variant = 1;
        s->unk21 = -1;
        gCurTask->main = Task_StarClose;
    }

    sub_80122DC(star->x, star->y);
    sub_8004558(s);
    sub_80051E8(s);
}

static void Task_StarClose(void)
{
    Sprite_Star *star = TaskGetStructPtr(gCurTask);
    Sprite *s = &star->s;
    MapEntity *me = star->base.me;

    Vec2_32 pos;
    pos.x = Q_24_8_TO_INT(star->x);
    pos.y = Q_24_8_TO_INT(star->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    sub_800C84C(s, pos.x, pos.y);

    if ((pos.x > gCamera.x + 0x170 || pos.x < gCamera.x - 0x80
         || pos.y > gCamera.y + 0x120 || pos.y < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, star->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--star->timer == 0) {
        star->timer = SPIN_TIME;
        s->graphics.anim = SA2_ANIM_STAR;
        s->variant = 2;
        s->unk21 = -1;
        gCurTask->main = Task_StarSpin;
    }

    sub_80122DC(star->x, star->y);
    sub_8004558(s);
    sub_80051E8(s);
}

static void Task_StarSpin(void)
{
    Sprite_Star *star = TaskGetStructPtr(gCurTask);
    Sprite *s = &star->s;
    MapEntity *me = star->base.me;

    Vec2_32 pos;
    pos.x = Q_24_8_TO_INT(star->x);
    pos.y = Q_24_8_TO_INT(star->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    sub_800C84C(s, pos.x, pos.y);

    if ((pos.x > gCamera.x + 0x170 || pos.x < gCamera.x - 0x80
         || pos.y > gCamera.y + 0x120 || pos.y < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, star->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--star->timer == 0) {
        star->timer = OPEN_CLOSE_TIME;
        s->graphics.anim = SA2_ANIM_STAR;
        s->variant = 3;
        s->unk21 = -1;
        gCurTask->main = Task_StarOpen;
    }

    sub_80122DC(star->x, star->y);
    sub_8004558(s);
    sub_80051E8(s);
}

static void Task_StarOpen(void)
{
    Sprite_Star *star = TaskGetStructPtr(gCurTask);
    Sprite *s = &star->s;
    MapEntity *me = star->base.me;

    Vec2_32 pos;
    pos.x = Q_24_8_TO_INT(star->x);
    pos.y = Q_24_8_TO_INT(star->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    sub_800C84C(s, pos.x, pos.y);

    if ((pos.x > gCamera.x + 0x170 || pos.x < gCamera.x - 0x80
         || pos.y > gCamera.y + 0x120 || pos.y < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, star->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--star->timer == 0) {
        star->timer = IDLE_TIME;
        s->graphics.anim = SA2_ANIM_STAR;
        s->variant = 0;
        s->unk21 = -1;
        gCurTask->main = Task_StarIdle;
    }

    sub_80122DC(star->x, star->y);
    sub_8004558(s);
    sub_80051E8(s);
}
