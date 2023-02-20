#include "global.h"
#include "game.h"
#include "interactable.h"
#include "main.h"
#include "task.h"
#include "interactable_080.h"
#include "malloc_vram.h"
#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s16 unk44;
    s16 unk46;
    s16 unk48;
} Sprite_IA80;

void Task_Interactable080(void);
void TaskDestructor_Interactable080(struct Task *);

void initSprite_Interactable080(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable080, 0x4C, 0x2010, 0,
                                TaskDestructor_Interactable080);
    Sprite_IA80 *ia80 = TaskGetStructPtr(t);
    Sprite *sprite;

    ia80->unk44 = 0;
    ia80->unk46 = 0;
    ia80->unk48 = 0;
    ia80->unk3C = ia->x * 8 + Q_24_8(spriteRegionX);
    ia80->unk40 = ia->y * 8 + Q_24_8(spriteRegionY);
    ia80->base.regionX = spriteRegionX;
    ia80->base.regionY = spriteRegionY;
    ia80->base.ia = ia;
    ia80->base.spriteX = ia->x;
    ia80->base.spriteY = spriteY;

    sprite = &ia80->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(9);
    sprite->graphics.anim = 600;
    sprite->variant = 0;

    SET_SPRITE_INITIALIZED(ia);
}

bool32 sub_807B190(Sprite_IA80 *ia80)
{
    s32 temp3, temp4;
    s16 temp5, temp6;

    temp3 = ia80->unk3C;
    temp3 -= gCamera.x;
    temp3 += (ia80->unk44 >> 8);

    temp4 = ia80->unk40;
    temp4 -= gCamera.y;
    temp4 += (ia80->unk46 >> 8);

    temp5 = temp3;
    temp6 = temp4;

    if (temp5 < -128 || temp5 > 368 || temp6 < -128 || temp6 > 416) {
        return TRUE;
    }
    return FALSE;
}

bool32 sub_807B1F0(Sprite_IA80 *ia80)
{
    s32 r3, r2, r0, r1;
    s16 r3_16, r0_16, r2_16, r1_16, temp2, temp4;
    if (!PlayerIsAlive) {
        return FALSE;
    }

    r3 = ia80->unk3C;
    r3 -= gCamera.x;
    r3 += (ia80->unk44 >> 8);

    r2 = ia80->unk40;
    r2 -= gCamera.y;
    r2 += (ia80->unk46 >> 8);

    r0 = Q_24_8_TO_INT(gPlayer.x);
    r0 -= gCamera.x;
    r1 = Q_24_8_TO_INT(gPlayer.y);
    r1 -= gCamera.y;

    r3_16 = r3;
    r0_16 = r0;
    temp2 = r3_16 - r0_16;
    r2_16 = r2;
    r1_16 = r1;
    temp4 = r2_16 - r1_16;

    if (temp2 * temp2 + temp4 * temp4 < 0x241) {
        return TRUE;
    }
    return FALSE;
}