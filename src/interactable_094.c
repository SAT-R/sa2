#include "global.h"
#include "interactable.h"
#include "interactable_094.h"
#include "constants/move_states.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    Interactable *ia;
    u8 spriteX;
    u8 spriteY;
} Sprite_IA94;

void Task_Interactable094(void);
void TaskDestructor_Interactable094(struct Task *);

void initSprite_Interactable094(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable094, 0x28, 0x2010, 0,
                                TaskDestructor_Interactable094);
    Sprite_IA94 *ia94 = TaskGetStructPtr(t);
    ia94->unk0 = ia->x * 8 + spriteRegionX * 0x100;
    ia94->unk4 = ia->y * 8 + spriteRegionY * 0x100;

    ia94->unk8 = ia->d.sData[0] * 8;
    ia94->unkA = ia->d.sData[1] * 8;
    ia94->unkC = ia94->unk8 + ia->d.uData[2] * 8;
    ia94->unkE = ia94->unkA + ia->d.uData[3] * 8;

    ia94->unk10 = ia94->unkC - ia94->unk8;
    ia94->unk12 = ia94->unkE - ia94->unkA;

    ia94->unk14 = ((ia94->unk8 + ia94->unkC) >> 1) + ia94->unk0;
    ia94->unk18 = ((ia94->unkA + ia94->unkE) >> 1) + ia94->unk4;
    ia94->ia = ia;
    ia94->spriteX = ia->x;
    ia94->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

void sub_807ED68(Sprite_IA94 *);
void sub_807ED88(Sprite_IA94 *);
bool32 sub_807EBBC(Sprite_IA94 *);
void sub_807ED00(Sprite_IA94 *);
bool32 sub_807EDB8(Sprite_IA94 *);
void sub_807EE1C(Sprite_IA94 *);
void sub_807EB48(Sprite_IA94 *);

void sub_807EA8C(void)
{
    Sprite_IA94 *ia94 = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_807ED68(ia94);
        return;
    }
    if (gPlayer.unk2C == 0x78) {
        sub_807ED88(ia94);
        return;
    }

    if (gUnknown_03005424 & 0x80) {
        gPlayer.y -= Q_24_8(1);
    } else {
        gPlayer.y += Q_24_8(1);
    }

    if (gPlayer.unk5E & gPlayerControls.jump) {
        u16 temp = gPlayer.unk5C & 0x20;
        if (temp != 0) {
            temp = 1;
        }
        ia94->unk1C = temp;
        sub_807EB48(ia94);
    } else {
        if (!sub_807EBBC(ia94)) {
            sub_807ED00(ia94);
        }
    }

    if (sub_807EDB8(ia94)) {
        sub_807EE1C(ia94);
    }
}
