#include "global.h"

#include "engine/task.h"
#include "game/game.h"

#include "game/interactables/interactable.h"
#include "engine/sprite.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} Interactable_SlowingSnow PACKED;

typedef struct {
    /* 0x00 */ s16 left;
    /* 0x02 */ s16 top;
    /* 0x04 */ s16 right;
    /* 0x06 */ s16 bottom;
    /* 0x08 */ s32 posX;
    /* 0x0C */ s32 posY;
    /* 0x10 */ Interactable_SlowingSnow *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_SlowingSnow; // size = 0x18

static void Task_Interactable_IceParadise_SlowingSnow(void);
static void TaskDestructor_Interactable_IceParadise_SlowingSnow(struct Task *t);
static bool32 ShouldDespawn(Sprite_SlowingSnow *);

void initSprite_Interactable_IceParadise_SlowingSnow(Interactable *in_ia,
                                                     u16 spriteRegionX,
                                                     u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_IceParadise_SlowingSnow,
                                sizeof(Sprite_SlowingSnow), 0x2010, 0,
                                TaskDestructor_Interactable_IceParadise_SlowingSnow);

    Sprite_SlowingSnow *snow = TaskGetStructPtr(t);
    Interactable_SlowingSnow *ia = (Interactable_SlowingSnow *)in_ia;
    snow->left = ia->offsetX * 8;
    snow->top = ia->offsetY * 8;
    snow->right = snow->left + ia->width * 8;
    snow->bottom = snow->top + ia->height * 8;
    snow->ia = ia;
    snow->spriteX = ia->x;
    snow->spriteY = spriteY;

    snow->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    snow->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

static bool32 PlayerIsTouchingSnow(Sprite_SlowingSnow *snow)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
            s16 snowScreenX = snow->posX - gCamera.x;
            s16 snowScreenY = snow->posY - gCamera.y;
            s16 playerScreenX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
            s16 playerScreenY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

            if (((snowScreenX + snow->left) <= playerScreenX)
                && ((snowScreenX + snow->left) + (snow->right - snow->left)
                    >= playerScreenX)
                && ((snowScreenY + snow->top) <= playerScreenY)
                && ((snowScreenY + snow->top) + (snow->bottom - snow->top)
                    >= playerScreenY)) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

void Task_Interactable_IceParadise_SlowingSnow(void)
{
    Sprite_SlowingSnow *snow = TaskGetStructPtr(gCurTask);

    if (PlayerIsTouchingSnow(snow)) {
        gPlayer.speedGroundX = Q_24_8_MULTIPLY(gPlayer.speedGroundX, 0.95);
    }

    // NOTE: Technically this can be turned into an else-if, because
    //       if the player does touch the snow, it will not need to be destroyed.
    if (ShouldDespawn(snow)) {
        snow->ia->x = snow->spriteX;
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_Interactable_IceParadise_SlowingSnow(struct Task *t) { }

static bool32 ShouldDespawn(Sprite_SlowingSnow *snow)
{
    s16 screenX, screenY;
    screenX = snow->posX - gCamera.x;
    screenY = snow->posY - gCamera.y;

    if ((screenX + snow->right < -(CAM_REGION_WIDTH / 2))
        || (screenX + snow->left > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || (screenY + snow->bottom < -(CAM_REGION_WIDTH / 2))
        || (screenY + snow->top > CAM_BOUND_Y))
        return TRUE;

    return FALSE;
}
