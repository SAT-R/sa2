#include "global.h"
#include "gba/types.h"

#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 offsetX;
    /* 0x0A */ u16 offsetY;
    /* 0x0C */ u16 width;
    /* 0x0E */ u16 height;
    /* 0x10 */ MapEntity *me;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_IA105;

static void Task_Interactable105(void);
static void TaskDestructor_Interactable105(struct Task *t);
static bool32 sub_80809B8(Sprite_IA105 *);
static bool32 sub_8080A9C(Sprite_IA105 *);
static void sub_8080AE4(Sprite_IA105 *);

void CreateEntity_Interactable105(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0, TaskDestructor_Interactable105);
    Sprite_IA105 *ia105 = TASK_DATA(t);

    ia105->posX = TO_WORLD_POS(me->x, spriteRegionX);
    ia105->posY = TO_WORLD_POS(me->y, spriteRegionY);
    ia105->offsetX = me->d.sData[0] * TILE_WIDTH;
    ia105->offsetY = me->d.sData[1] * TILE_WIDTH;
    ia105->width = me->d.uData[2] * TILE_WIDTH + ia105->offsetX;
    ia105->height = me->d.uData[3] * TILE_WIDTH + ia105->offsetY;
    ia105->me = me;
    ia105->spriteX = me->x;
    ia105->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static bool32 sub_80809B8(Sprite_IA105 *ia105)
{
    if (PLAYER_IS_ALIVE) {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s16 someX, someY;
        screenX = (ia105->posX + ia105->offsetX) - gCamera.x;
        screenY = (ia105->posY + ia105->offsetY) - gCamera.y;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        someX = ia105->width - ia105->offsetX;
        someY = ia105->height - ia105->offsetY;

        if ((screenX <= playerX) && (screenX + someX >= playerX) && (screenY <= playerY) && (screenY + someY >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_Interactable105(void)
{
    Sprite_IA105 *ia105 = TASK_DATA(gCurTask);

    if (sub_80809B8(ia105)) {
        Player_CollisionDamage(&gPlayer);
    }

    if (sub_8080A9C(ia105)) {
        sub_8080AE4(ia105);
    }
}

static void TaskDestructor_Interactable105(struct Task UNUSED *t) { }

static bool32 sub_8080A9C(Sprite_IA105 *ia105)
{
    s16 screenX, screenY;
    screenX = ia105->posX - gCamera.x;
    screenY = ia105->posY - gCamera.y;

    // TODO: Use 'IS_OUT_OF_RANGE' instead of 'IS_OUT_OF_RANGE_'
    //       (Fix that in game/game.h)
    if (IS_OUT_OF_RANGE_(0, screenX, screenY, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8080AE4(Sprite_IA105 *ia105)
{
    ia105->me->x = ia105->spriteX;
    TaskDestroy(gCurTask);
}
