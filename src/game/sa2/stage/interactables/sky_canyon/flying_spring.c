#include "global.h"

#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/shared/stage/entities_manager.h"

#include "game/sa2/stage/interactables/sky_canyon/flying_spring.h"
#include "game/sa2/stage/interactables/sky_canyon_level_task.h"

#include "game/sa2/stage/player_controls.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"

#include "constants/sa2/player_transitions.h"
#include "constants/sa2/songs.h"

#define STATE_JUMPED    2
#define STATE_MOVING_UP 1

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 x;
    s32 y;
    s16 qOffsetX;
    s16 qOffsetY;
    u8 state;
    u8 step;
} Sprite_FlyingSpring;

static bool32 sub_807C424(Sprite_FlyingSpring *);
static void sub_807C4A0(Sprite_FlyingSpring *);
static bool32 sub_807C598(Sprite_FlyingSpring *);
static void sub_807C5E0(Sprite_FlyingSpring *);
static void UpdateSharedFlyingSpringAnimation(void);
static void RenderFlyingSpring(Sprite_FlyingSpring *);
static void TaskDestructor_Interactable085(Task *);
static void sub_807C52C(Sprite_FlyingSpring *);
static void sub_807C4EC(Sprite_FlyingSpring *);
static Sprite *GetSharedFlyingSpringSprite(void);

static void Task_Interactable085(void)
{
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(gCurTask);
    flyingSpring->qOffsetY = SIN_24_8(flyingSpring->step * 4) * 2;
    flyingSpring->step += 2;
    if (sub_807C424(flyingSpring)) {
        sub_807C4A0(flyingSpring);
    }

    if (sub_807C598(flyingSpring)) {
        sub_807C5E0(flyingSpring);
    } else {
        UpdateSharedFlyingSpringAnimation();
        RenderFlyingSpring(flyingSpring);
    }
}

static void sub_807C2E0(void)
{
    s16 r1;
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(gCurTask);
    flyingSpring->qOffsetY = SIN_24_8(flyingSpring->step * 4) * 16;
    sub_807C52C(flyingSpring);

    r1 = (64 - flyingSpring->step) >> 2;

    if (r1 > 3) {
        if (r1 > 6) {
            r1 = 6;
        }
    } else {
#ifndef NON_MATCHING
        do
            r1 = 4;
        while (0);
#else
        r1 = 4;
#endif
    }
    flyingSpring->step += r1;
    if (flyingSpring->step >= 64) {
        sub_807C4EC(flyingSpring);
    }
    UpdateSharedFlyingSpringAnimation();
    RenderFlyingSpring(flyingSpring);
}

static void sub_807C504(Sprite_FlyingSpring *);

static void sub_807C360(void)
{
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(gCurTask);
    flyingSpring->step += 8;
    if (flyingSpring->step == 128) {
        sub_807C504(flyingSpring);
    } else if (flyingSpring->step > 128) {
        flyingSpring->qOffsetY = SIN_24_8(flyingSpring->step * 4) * 6;
    } else {
        flyingSpring->qOffsetY = SIN_24_8(flyingSpring->step * 4) * 3;
    }

    UpdateSharedFlyingSpringAnimation();
    RenderFlyingSpring(flyingSpring);
}

static void sub_807C3DC(Sprite_FlyingSpring *flyingSpring)
{
    if (gPlayer.frameInput & gPlayerControls.jump) {
        if (!(flyingSpring->state & STATE_JUMPED)) {
            if (!(flyingSpring->state & STATE_MOVING_UP)) {
                flyingSpring->state |= STATE_MOVING_UP;
            } else {
                flyingSpring->state &= ~STATE_MOVING_UP;
                flyingSpring->state |= STATE_JUMPED;
            }
        }
    }
}

static bool32 sub_807C424(Sprite_FlyingSpring *flyingSpring)
{
    s16 springScreenX, playerScreenX, sprintScreenY, playerScreenY;
    if (gPlayer.moveState & 0x80 || gPlayer.qSpeedAirY <= 0) {
        return FALSE;
    }

    springScreenX = flyingSpring->x - gCamera.x;
    sprintScreenY = flyingSpring->y - gCamera.y;
    playerScreenX = I(gPlayer.qWorldX) - gCamera.x;
    playerScreenY = I(gPlayer.qWorldY) - gCamera.y;
    if (springScreenX - 20 <= playerScreenX && springScreenX + 20 >= playerScreenX) {
        if (sprintScreenY - 12 <= playerScreenY && sprintScreenY + 12 >= playerScreenY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_807C4A0(Sprite_FlyingSpring *flyingSpring)
{
    gPlayer.transition = PLTRANS_PROPELLER_SPRING;
    if (flyingSpring->state & 1)
        gPlayer.qSpeedAirY = -Q(5.5);
    else
        gPlayer.qSpeedAirY = -Q(5.5);
    flyingSpring->step = 0;
    flyingSpring->state = 0;
    m4aSongNumStart(SE_284);
    gCurTask->main = sub_807C2E0;
}

static void sub_807C6E4(void);

static void sub_807C4EC(Sprite_FlyingSpring *flyingSpring)
{
    flyingSpring->step = 0;
    gCurTask->main = sub_807C6E4;
}

static void sub_807C504(Sprite_FlyingSpring *flyingSpring)
{
    flyingSpring->qOffsetX = 0;
    flyingSpring->qOffsetY = 0;
    flyingSpring->step = 0;
    gCurTask->main = Task_Interactable085;
}

static void sub_807C52C(Sprite_FlyingSpring *flyingSpring)
{
    if (gPlayer.frameInput & gPlayerControls.jump) {
        flyingSpring->state |= STATE_JUMPED;
    }
}

static void RenderFlyingSpring(Sprite_FlyingSpring *flyingSpring)
{
    Sprite *sprite = GetSharedFlyingSpringSprite();
    sprite->x = flyingSpring->x - gCamera.x + I(flyingSpring->qOffsetX);
    sprite->y = flyingSpring->y - gCamera.y + I(flyingSpring->qOffsetY);

    DisplaySprite(sprite);
}

static bool32 sub_807C598(Sprite_FlyingSpring *flyingSpring)
{
    s32 springScreenX, springScreenY;
    s16 x, y;
    springScreenX = flyingSpring->x;
    springScreenX -= gCamera.x;
    springScreenY = flyingSpring->y;
    springScreenY -= gCamera.y;

    x = springScreenX;
    y = springScreenY;
    if (x < -(CAM_REGION_WIDTH / 2) || x > (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)) || y < -(CAM_REGION_WIDTH / 2)
        || y > (DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807C5E0(Sprite_FlyingSpring *flyingSpring)
{
    flyingSpring->base.me->x = flyingSpring->base.meX;
    TaskDestroy(gCurTask);
}

static Sprite *GetSharedFlyingSpringSprite(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    SkyCanyonLevelTask *level = TASK_DATA(em->levelTask);
    return &level->spring;
}

static void UpdateSharedFlyingSpringAnimation(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    SkyCanyonLevelTask *level = TASK_DATA(em->levelTask);

    level->visibleFlyingSprings++;
}

void CreateEntity_PropellerSpring(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Task *t = TaskCreate(Task_Interactable085, sizeof(Sprite_FlyingSpring), 0x2010, 0, TaskDestructor_Interactable085);
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(t);
    flyingSpring->x = TO_WORLD_POS(me->x, spriteRegionX);
    flyingSpring->y = TO_WORLD_POS(me->y, spriteRegionY);

    flyingSpring->qOffsetX = 0;
    flyingSpring->qOffsetY = 0;
    flyingSpring->step = 0;

    flyingSpring->base.regionX = spriteRegionX;
    flyingSpring->base.regionY = spriteRegionY;
    flyingSpring->base.me = me;
    flyingSpring->base.meX = me->x;
    flyingSpring->base.id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807C72C(Sprite_FlyingSpring *);

static void sub_807C6E4(void)
{
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(gCurTask);
    sub_807C3DC(flyingSpring);

    if (++flyingSpring->step > 0) {
        sub_807C72C(flyingSpring);
    }

    UpdateSharedFlyingSpringAnimation();
    RenderFlyingSpring(flyingSpring);
}

static void TaskDestructor_Interactable085(Task *t)
{
    // unused
}

static void sub_807C744(void);

static void sub_807C72C(Sprite_FlyingSpring *flyingSpring)
{
    flyingSpring->step = 64;
    gCurTask->main = sub_807C744;
}

static void sub_807C7A0(Sprite_FlyingSpring *);

static void sub_807C744(void)
{
    Sprite_FlyingSpring *flyingSpring = TASK_DATA(gCurTask);
    flyingSpring->qOffsetY = SIN_24_8(flyingSpring->step * 4) * 16;
    sub_807C3DC(flyingSpring);

    flyingSpring->step += 8;
    if ((s8)flyingSpring->step < 0) {
        sub_807C7A0(flyingSpring);
    }

    UpdateSharedFlyingSpringAnimation();
    RenderFlyingSpring(flyingSpring);
}

static void sub_807C7A0(Sprite_FlyingSpring *flyingSpring)
{
    flyingSpring->step = 128;
    gCurTask->main = sub_807C360;
}
