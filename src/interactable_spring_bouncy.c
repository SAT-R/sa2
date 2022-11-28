#include "global.h"
#include "m4a.h"
#include "gba/syscall.h"

#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 displayed;
} Sprite_BouncySpring;

extern void Task_Interactable_BouncySpring(void);
extern void Task_805E02C(void);
extern void TaskDestructor_Interactable_BouncySpring(struct Task *);
extern u32 sub_800CCB8(struct UNK_0808B3FC_UNK240 *, s32, s32, struct SomeStruct_59E0 *);
extern void sub_80218E4(struct SomeStruct_59E0 *);
extern void sub_8023B5C(struct SomeStruct_59E0 *, s8);

const struct UNK_080E0D64 gUnknown_080D948C[3] = {
    { 24, SA2_ANIM_SPRING_BOUNCY, 1 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 2 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 3 },
};

const struct UNK_080E0D64 gUnknown_080D94A4[3] = {
    { 16, SA2_ANIM_570, 1 },
    { 16, SA2_ANIM_570, 2 },
    { 16, SA2_ANIM_570, 3 },
};

const struct UNK_080E0D64 gUnknown_080D94BC[3] = {
    { 16, SA2_ANIM_603, 1 },
    { 16, SA2_ANIM_603, 2 },
    { 24, SA2_ANIM_603, 3 },
};

void initSprite_Interactable_BouncySpring(Interactable *ia, u16 spriteRegionX,
                                          u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_BouncySpring, sizeof(Sprite_BouncySpring), 0x2010,
                     0, TaskDestructor_Interactable_BouncySpring);
    Sprite_BouncySpring *spring = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *displayed = &spring->displayed;
    u32 variant = 0;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.ia = ia;
    spring->base.spriteX = ia->x;
    spring->base.spriteY = spriteY;

    displayed->unk16 = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->unk18 = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
        displayed->unk4 = VramMalloc(16);
        displayed->unkA = SA2_ANIM_570;
        displayed->unk20 = variant;
    } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        displayed->unk4 = VramMalloc(24);
        displayed->unkA = SA2_ANIM_603;
        displayed->unk20 = variant;
    } else {
        displayed->unk4 = VramMalloc(24);
        displayed->unkA = SA2_ANIM_SPRING_BOUNCY;
        displayed->unk20 = variant;
    }

    displayed->unk1A = 0x480;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->unk25 = 0;
    displayed->unk28 = -1;
    displayed->unk10 = 0x2000;
}

void Task_Interactable_BouncySpring()
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *displayed = &spring->displayed;
    Interactable *ia = spring->base.ia;
    s32 screenX, screenY;
    s16 airSpeed;

    screenX = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spring->base.regionY);

    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;
    if (!(gPlayer.unk20 & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        airSpeed = gPlayer.unk12;
        if ((sub_800CCB8(displayed, screenX, screenY, &gPlayer) != 0)) {
            u8 index;

            index = Div(airSpeed, 400);
            if (index > (ARRAY_COUNT(gUnknown_080D948C) - 1))
                index = (ARRAY_COUNT(gUnknown_080D948C) - 1);

            airSpeed = (airSpeed >> 3);
            gPlayer.unk12 = -airSpeed;

            if (gPlayer.unk12 > Q_8_8(-7.5))
                gPlayer.unk12 = Q_8_8(-7.5);

            if (gPlayer.unk12 < Q_8_8(-12))
                gPlayer.unk12 = Q_8_8(-12);

            gPlayer.unk36 = 3;

            sub_80218E4(&gPlayer);
            sub_8023B5C(&gPlayer, 14);

            gPlayer.unk16 = 6;
            gPlayer.unk17 = 14;

            gPlayer.unk20 = (gPlayer.unk20 | MOVESTATE_IN_AIR) & ~MOVESTATE_100;

            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                displayed->unkA = gUnknown_080D94A4[index].unk4;
                spring->displayed.unk20 = gUnknown_080D94A4[index].unk6;
                spring->displayed.unk21 = 0xFF;
            } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                displayed->unkA = gUnknown_080D94BC[index].unk4;
                spring->displayed.unk20 = gUnknown_080D94BC[index].unk6;
                spring->displayed.unk21 = 0xFF;
            } else {
                displayed->unkA = gUnknown_080D948C[index].unk4;
                spring->displayed.unk20 = gUnknown_080D948C[index].unk6;
                spring->displayed.unk21 = 0xFF;
            }

            gPlayer.unk64 = 38;
            gPlayer.unk6D = 7;
            gPlayer.unk66 = -1;

            m4aSongNumStart(SE_SPRINGY_SPRING);

            gCurTask->main = Task_805E02C;
        }
    }
    // _0805DFBA
    if (IS_OUT_OF_CAM_RANGE(displayed->unk16, (s16)displayed->unk18)) {
        ia->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(displayed);
        sub_80051E8(displayed);
    }
}