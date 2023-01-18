#include "global.h"

#include "task.h"
#include "game.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s16 unk0;
    /* 0x02 */ s16 unk2;
    /* 0x04 */ s16 unk4;
    /* 0x06 */ s16 unk6;
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
    snow->unk0 = ia->d.sData[0] * 8;
    snow->unk2 = ia->d.sData[1] * 8;
    snow->unk4 = snow->unk0 + ia->d.uData[2] * 8;
    snow->unk6 = snow->unk2 + ia->d.uData[3] * 8;
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

            if (((snowScreenX + snow->unk0) <= playerScreenX)
                && ((snowScreenX + snow->unk0) + (snow->unk4 - snow->unk0)
                    >= playerScreenX)
                && ((snowScreenY + snow->unk2) <= playerScreenY)
                && ((snowScreenY + snow->unk2) + (snow->unk6 - snow->unk2)
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
    // _08077EEE
    if (sub_8077F18(snow)) {
        snow->ia->x = snow->spriteX;
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_Interactable_IceParadise_SlowingSnow(struct Task *t) { }

/*
u32 sub_8077F18(Sprite_Slowing_Snow *snow) {
    s16 screenX, screenY;
    screenX = snow->base.spriteX - gCamera.x;
    screenY = snow->base.spriteY - gCamera.y;

    if (screenX + snow->base.)
        ;
}
*/