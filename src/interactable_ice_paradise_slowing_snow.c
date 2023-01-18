#include "global.h"

#include "task.h"
#include "game.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s16 left;
    /* 0x02 */ s16 top;
    /* 0x04 */ s16 right;
    /* 0x06 */ s16 bottom;
    /* 0x08 */ s32 posX;
    /* 0x0C */ s32 posY;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_Slowing_Snow; // size = 0x18

static void Task_Interactable_IceParadise_SlowingSnow(void);
static void TaskDestructor_Interactable_IceParadise_SlowingSnow(struct Task *t);

extern bool32 sub_8077F18(Sprite_Slowing_Snow *);

void initSprite_Interactable_IceParadise_SlowingSnow(Interactable *ia, u16 spriteRegionX,
                                                     u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_IceParadise_SlowingSnow,
                                sizeof(Sprite_Slowing_Snow), 0x2010, 0,
                                TaskDestructor_Interactable_IceParadise_SlowingSnow);

    Sprite_Slowing_Snow *snow = TaskGetStructPtr(t);
    snow->left = ia->d.sData[0] * 8;
    snow->top = ia->d.sData[1] * 8;
    snow->right = snow->left + ia->d.uData[2] * 8;
    snow->bottom = snow->top + ia->d.uData[3] * 8;
    snow->ia = ia;
    snow->spriteX = ia->x;
    snow->spriteY = spriteY;

    snow->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    snow->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
}

bool32 PlayerTouchesSnow(Sprite_Slowing_Snow *snow)
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
    Sprite_Slowing_Snow *snow = TaskGetStructPtr(gCurTask);

    if (PlayerTouchesSnow(snow)) {
        gPlayer.speedGroundX = Q_24_8_MULTIPLY(gPlayer.speedGroundX, 0.95);
    }

    // NOTE: Technically this can be turned into an else-if, because
    //       if the player does touch the snow, it will not need to be destroyed.
    if (sub_8077F18(snow)) {
        snow->ia->x = snow->spriteX;
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_Interactable_IceParadise_SlowingSnow(struct Task *t) { }

bool32 sub_8077F18(Sprite_Slowing_Snow *snow)
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
