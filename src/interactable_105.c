#include "global.h"
#include "gba/types.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

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

void initSprite_Interactable105(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0,
                                TaskDestructor_Interactable105);
    Sprite_IA105 *sprite = TaskGetStructPtr(t);

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    sprite->unk8 = ia->d.sData[0] * 8;
    sprite->unkA = ia->d.sData[1] * 8;
    sprite->unkC = ia->d.uData[2] * 8 + sprite->unk8;
    sprite->unkE = ia->d.uData[3] * 8 + sprite->unkA;
    sprite->ia = ia;
    sprite->spriteX = ia->x;
    sprite->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}