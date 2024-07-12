#include "global.h"

#include "task.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/ice_paradise/slowing_snow.h"

#include "game/entity.h"
#include "sprite.h"

PACKED(Interactable_SlowingSnow, {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
});

typedef struct {
    /* 0x00 */ s16 left;
    /* 0x02 */ s16 top;
    /* 0x04 */ s16 right;
    /* 0x06 */ s16 bottom;
    /* 0x08 */ s32 posX;
    /* 0x0C */ s32 posY;
    /* 0x10 */ Interactable_SlowingSnow *me;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_SlowingSnow; // size = 0x18

static void Task_SlowingSnow(void);
static void TaskDestructor_SlowingSnow(struct Task *t);
static bool32 ShouldDespawn(Sprite_SlowingSnow *);

void CreateEntity_SlowingSnow(MapEntity *in_ia, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SlowingSnow, sizeof(Sprite_SlowingSnow), 0x2010, 0, TaskDestructor_SlowingSnow);

    Sprite_SlowingSnow *snow = TASK_DATA(t);
    Interactable_SlowingSnow *me = (Interactable_SlowingSnow *)in_ia;
    snow->left = me->offsetX * 8;
    snow->top = me->offsetY * 8;
    snow->right = snow->left + me->width * 8;
    snow->bottom = snow->top + me->height * 8;
    snow->me = me;
    snow->spriteX = me->x;
    snow->spriteY = spriteY;

    snow->posX = TO_WORLD_POS(me->x, spriteRegionX);
    snow->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static bool32 PlayerIsTouchingSnow(Sprite_SlowingSnow *snow)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
            s16 snowScreenX = snow->posX - gCamera.x;
            s16 snowScreenY = snow->posY - gCamera.y;
            s16 playerScreenX = I(gPlayer.x) - gCamera.x;
            s16 playerScreenY = I(gPlayer.y) - gCamera.y;

            if (((snowScreenX + snow->left) <= playerScreenX) && ((snowScreenX + snow->left) + (snow->right - snow->left) >= playerScreenX)
                && ((snowScreenY + snow->top) <= playerScreenY)
                && ((snowScreenY + snow->top) + (snow->bottom - snow->top) >= playerScreenY)) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

void Task_SlowingSnow(void)
{
    Sprite_SlowingSnow *snow = TASK_DATA(gCurTask);

    if (PlayerIsTouchingSnow(snow)) {
        gPlayer.speedGroundX = Q_MUL_Q_F32(gPlayer.speedGroundX, 0.95);
    }

    // NOTE: Technically this can be turned into an else-if, because
    //       if the player does touch the snow, it will not need to be destroyed.
    if (ShouldDespawn(snow)) {
        snow->me->x = snow->spriteX;
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_SlowingSnow(struct Task *t) { }

static bool32 ShouldDespawn(Sprite_SlowingSnow *snow)
{
    s16 screenX, screenY;
    screenX = snow->posX - gCamera.x;
    screenY = snow->posY - gCamera.y;

    if ((screenX + snow->right < -(CAM_REGION_WIDTH / 2)) || (screenX + snow->left > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || (screenY + snow->bottom < -(CAM_REGION_WIDTH / 2)) || (screenY + snow->top > CAM_BOUND_Y))
        return TRUE;

    return FALSE;
}
