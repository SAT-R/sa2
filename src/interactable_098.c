#include "main.h"
#include "interactable_098.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} Interactable_GravityToggle PACKED;

typedef struct {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    s16 unk10;
    s16 unk12;
    u16 unk14;
    u8 filler16[2];
    s16 unk18;
    s16 unk1A;
    u8 filler1C[8];
    /* 0x24 */ Interactable_GravityToggle *ia;
    /* 0x28 */ u8 spriteX;
    /* 0x29 */ u8 spriteY;
} Sprite_GravityToggle;

void Task_80801F8(void);
void TaskDestructor_8080230(struct Task *);
void sub_8080234(Sprite_GravityToggle *);
bool32 sub_8080254(Sprite_GravityToggle *);
void sub_808029C(Sprite_GravityToggle *);

void initSprite_Interactable098(Interactable *in_ia, u16 spriteRegionX,
                                u16 spriteRegionY, u8 spriteY, u8 toggleKind)
{
    struct Task *t = TaskCreate(Task_80801F8, 0x2C, 0x2010, 0, TaskDestructor_8080230);
    Sprite_GravityToggle *toggle = TaskGetStructPtr(t);
    Interactable_GravityToggle *ia = (Interactable_GravityToggle *)in_ia;
    toggle->unk14 = toggleKind;
    toggle->unk0 = SpriteGetScreenPos(ia->x, spriteRegionX);
    toggle->unk4 = SpriteGetScreenPos(ia->y, spriteRegionY);
    toggle->unk8 = (ia->offsetX * 8);
    toggle->unkA = (ia->offsetY * 8);
    toggle->unkC = toggle->unk8 + (ia->width * 8);
    toggle->unkE = toggle->unkA + (ia->height * 8);

    toggle->unk10 = toggle->unkC - toggle->unk8;
    toggle->unk12 = toggle->unkE - toggle->unkA;
    toggle->ia = ia;
    toggle->spriteX = ia->x;
    toggle->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

void sub_80800D4(Sprite_GravityToggle *toggle)
{
    switch (toggle->unk14) {
        case 0: {
            // Regular gravity
            gUnknown_03005424 &= ~EXTRA_STATE__GRAVITY_INVERTED;
        } break;

        case 1: {
            // Upside-down
            gUnknown_03005424 |= EXTRA_STATE__GRAVITY_INVERTED;
        } break;

        case 2: {
            // Maybe collision on enter/exit?
            if (((toggle->unk18 > 0) && (gPlayer.speedAirX > 0))
                || ((toggle->unk18 < 0) && (gPlayer.speedAirX < 0))
                || ((toggle->unk1A > 0) && (gPlayer.speedAirY > 0))
                || ((toggle->unk1A < 0) && (gPlayer.speedAirY < 0))) {
                gUnknown_03005424 ^= EXTRA_STATE__GRAVITY_INVERTED;
            }

        } break;

        default: {
            ;
        } break;
    }

    gCurTask->main = Task_80801F8;
}

bool32 sub_808017C(Sprite_GravityToggle *toggle)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 posX, posY;
        s16 playerX, playerY;
        posX = (toggle->unk0 + toggle->unk8) - gCamera.x;
        posY = (toggle->unk4 + toggle->unkA) - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((posX <= playerX) && ((posX + toggle->unk10) >= playerX) && (posY <= playerY)
            && ((posY + toggle->unk12) >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_80801F8(void)
{
    Sprite_GravityToggle *toggle = TaskGetStructPtr(gCurTask);
    if (sub_808017C(toggle)) {
        sub_8080234(toggle);
    }

    if (sub_8080254(toggle)) {
        sub_808029C(toggle);
    }
}

void TaskDestructor_8080230(UNUSED struct Task *t) { }
