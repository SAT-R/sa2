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
    /* 0x0C */ Sprite displayed;
} Sprite_BouncySpring;

extern u32 sub_800CCB8(Sprite *, s32, s32, Player *);
extern void sub_80218E4(Player *);
extern void sub_8023B5C(Player *, s8);

static void Task_Interactable_BouncySpring(void);
static void Task_805E02C(void);
static void TaskDestructor_Interactable_BouncySpring(struct Task *);

static const TileInfo gUnknown_080D948C[3] = {
    { 24, SA2_ANIM_SPRING_BOUNCY, 1 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 2 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 3 },
};

static const TileInfo gUnknown_080D94A4[3] = {
    { 16, SA2_ANIM_DRUM, 1 },
    { 16, SA2_ANIM_DRUM, 2 },
    { 16, SA2_ANIM_DRUM, 3 },
};

static const TileInfo gUnknown_080D94BC[3] = {
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
    Sprite *displayed = &spring->displayed;
    u32 variant = 0;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.ia = ia;
    spring->base.spriteX = ia->x;
    spring->base.spriteY = spriteY;

    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
        displayed->vram = VramMalloc(16);
        displayed->anim = SA2_ANIM_DRUM;
        displayed->variant = variant;
    } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        displayed->vram = VramMalloc(24);
        displayed->anim = SA2_ANIM_603;
        displayed->variant = variant;
    } else {
        displayed->vram = VramMalloc(24);
        displayed->anim = SA2_ANIM_SPRING_BOUNCY;
        displayed->variant = variant;
    }

    displayed->unk1A = 0x480;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->focused = FALSE;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2000;
}

static void Task_Interactable_BouncySpring()
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &spring->displayed;
    Interactable *ia = spring->base.ia;
    s32 screenX, screenY;
    s16 airSpeed;

    screenX = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spring->base.regionY);

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;
    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        airSpeed = gPlayer.speedAirY;
        if ((sub_800CCB8(displayed, screenX, screenY, &gPlayer) != 0)) {
            u8 index;

            index = Div(airSpeed, 400);
            if (index > (ARRAY_COUNT(gUnknown_080D948C) - 1))
                index = (ARRAY_COUNT(gUnknown_080D948C) - 1);

            gPlayer.speedAirY = -(airSpeed + (airSpeed >> 3));

            if (gPlayer.speedAirY > Q_8_8(-7.5))
                gPlayer.speedAirY = Q_8_8(-7.5);

            if (gPlayer.speedAirY < Q_8_8(-12))
                gPlayer.speedAirY = Q_8_8(-12);

            gPlayer.unk36 = 3;

            sub_80218E4(&gPlayer);
            sub_8023B5C(&gPlayer, 14);

            gPlayer.unk16 = 6;
            gPlayer.unk17 = 14;

            gPlayer.moveState = (gPlayer.moveState | MOVESTATE_IN_AIR) & ~MOVESTATE_100;

            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                displayed->anim = gUnknown_080D94A4[index].anim;
                spring->displayed.variant = gUnknown_080D94A4[index].variant;
                spring->displayed.unk21 = 0xFF;
            } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                displayed->anim = gUnknown_080D94BC[index].anim;
                spring->displayed.variant = gUnknown_080D94BC[index].variant;
                spring->displayed.unk21 = 0xFF;
            } else {
                displayed->anim = gUnknown_080D948C[index].anim;
                spring->displayed.variant = gUnknown_080D948C[index].variant;
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
    if (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y)) {
        ia->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(displayed);
        sub_80051E8(displayed);
    }
}

static void Task_805E02C()
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &spring->displayed;
    Interactable *ia = spring->base.ia;
    s32 screenX, screenY;
    u32 variant = 0;

    screenX = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spring->base.regionY);

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y)) {
        ia->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (sub_8004558(displayed) == 0) {
            gCurTask->main = Task_Interactable_BouncySpring;

            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                displayed->anim = SA2_ANIM_DRUM;
                displayed->variant = variant;
            } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                displayed->anim = SA2_ANIM_603;
                displayed->variant = variant;
            } else {
                displayed->anim = SA2_ANIM_SPRING_BOUNCY;
                displayed->variant = variant;
            }
            displayed->unk21 = -1;
        }

        sub_80051E8(displayed);
    }
}

static void TaskDestructor_Interactable_BouncySpring(struct Task *t)
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(t);
    VramFree(spring->displayed.vram);
}
