#include "main.h"
#include "interactable_098.h"

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} Interactable_GravitySwitch PACKED;

typedef struct {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    u16 unk14;
    u8 unk16[14];
    /* 0x24 */ Interactable_GravitySwitch *ia;
    /* 0x28 */ u8 spriteX;
    /* 0x29 */ u8 spriteY;
} Sprite_IA098;

void sub_80801F8(void);
void sub_8080230(struct Task *);

void initSprite_Interactable098(Interactable *in_ia, u16 spriteRegionX,
                                u16 spriteRegionY, u8 spriteY, u8 unknown)
{
    struct Task *t = TaskCreate(sub_80801F8, 0x2C, 0x2010, 0, sub_8080230);
    Sprite_IA098 *ia098 = TaskGetStructPtr(t);
    Interactable_GravitySwitch *ia = (Interactable_GravitySwitch *)in_ia;
    ia098->unk14 = unknown;
    ia098->unk0 = SpriteGetScreenPos(ia->x, spriteRegionX);
    ia098->unk4 = SpriteGetScreenPos(ia->y, spriteRegionY);
    ia098->unk8 = (ia->offsetX * 8);
    ia098->unkA = (ia->offsetY * 8);
    ia098->unkC = ia098->unk8 + (ia->width * 8);
    ia098->unkE = ia098->unkA + (ia->height * 8);

    ia098->unk10 = ia098->unkC - ia098->unk8;
    ia098->unk12 = ia098->unkE - ia098->unkA;
    ia098->ia = ia;
    ia098->spriteX = ia->x;
    ia098->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}
