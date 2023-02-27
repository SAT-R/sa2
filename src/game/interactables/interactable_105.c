#include "global.h"
#include "gba/types.h"

#include "game/game.h"
#include "game/interactables/interactable.h"
#include "engine/sprite.h"
#include "engine/task.h"
#include "engine/trig.h"
#include "game/game.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 offsetX;
    /* 0x0A */ u16 offsetY;
    /* 0x0C */ u16 width;
    /* 0x0E */ u16 height;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_IA105;

static void Task_Interactable105(void);
static void TaskDestructor_Interactable105(struct Task *t);
static bool32 sub_80809B8(Sprite_IA105 *);
static bool32 sub_8080A9C(Sprite_IA105 *);
static void sub_8080AE4(Sprite_IA105 *);

void initSprite_Interactable105(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0,
                                TaskDestructor_Interactable105);
    Sprite_IA105 *sprite = TaskGetStructPtr(t);

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    sprite->offsetX = ia->d.sData[0] * TILE_WIDTH;
    sprite->offsetY = ia->d.sData[1] * TILE_WIDTH;
    sprite->width = ia->d.uData[2] * TILE_WIDTH + sprite->offsetX;
    sprite->height = ia->d.uData[3] * TILE_WIDTH + sprite->offsetY;
    sprite->ia = ia;
    sprite->spriteX = ia->x;
    sprite->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

static bool32 sub_80809B8(Sprite_IA105 *sprite)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s16 someX, someY;
        screenX = (sprite->posX + sprite->offsetX) - gCamera.x;
        screenY = (sprite->posY + sprite->offsetY) - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        someX = sprite->width - sprite->offsetX;
        someY = sprite->height - sprite->offsetY;

        if ((screenX <= playerX) && (screenX + someX >= playerX) && (screenY <= playerY)
            && (screenY + someY >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_Interactable105(void)
{
    Sprite_IA105 *sprite = TaskGetStructPtr(gCurTask);

    if (sub_80809B8(sprite)) {
        sub_800CBA4(&gPlayer);
    }

    if (sub_8080A9C(sprite)) {
        sub_8080AE4(sprite);
    }
}

static void TaskDestructor_Interactable105(struct Task UNUSED *t) { }

static bool32 sub_8080A9C(Sprite_IA105 *sprite)
{
    s16 screenX, screenY;
    screenX = sprite->posX - gCamera.x;
    screenY = sprite->posY - gCamera.y;

    // TODO: Use 'IS_OUT_OF_RANGE' instead of 'IS_OUT_OF_RANGE_'
    //       (Fix that in game/game.h)
    if (IS_OUT_OF_RANGE_(0, screenX, screenY, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8080AE4(Sprite_IA105 *sprite)
{
    sprite->ia->x = sprite->spriteX;
    TaskDestroy(gCurTask);
}
