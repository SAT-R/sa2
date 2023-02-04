#include "global.h"
#include "gba/types.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_IA105;

extern void Task_Interactable105(void);
extern void TaskDestructor_Interactable105(struct Task *t);

extern bool32 sub_80809B8(Sprite_IA105 *);
extern bool32 sub_8080A9C(Sprite_IA105 *);
extern void sub_8080AE4(Sprite_IA105 *);
extern bool32 sub_800CBA4(Player *);

void initSprite_Interactable105(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0,
                                TaskDestructor_Interactable105);
    Sprite_IA105 *sprite = TaskGetStructPtr(t);

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    sprite->unk8 = ia->d.sData[0] * TILE_WIDTH;
    sprite->unkA = ia->d.sData[1] * TILE_WIDTH;
    sprite->unkC = ia->d.uData[2] * TILE_WIDTH + sprite->unk8;
    sprite->unkE = ia->d.uData[3] * TILE_WIDTH + sprite->unkA;
    sprite->ia = ia;
    sprite->spriteX = ia->x;
    sprite->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

bool32 sub_80809B8(Sprite_IA105 *sprite)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s16 someX, someY;
        screenX = sprite->posX + sprite->unk8 - gCamera.x;
        screenY = sprite->posY + sprite->unkA - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        someX = sprite->unkC - sprite->unk8;
        someY = sprite->unkE - sprite->unkA;

        if ((screenX <= playerX) && (screenX + someX >= playerX) && (screenY <= playerY)
            && (screenY + someY >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_Interactable105(void)
{
    Sprite_IA105 *sprite = TaskGetStructPtr(gCurTask);

    if (sub_80809B8(sprite)) {
        sub_800CBA4(&gPlayer);
    }

    if (sub_8080A9C(sprite)) {
        sub_8080AE4(sprite);
    }
}

void TaskDestructor_Interactable105(struct Task UNUSED *t) { }