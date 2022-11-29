#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 displayed;
} Sprite_Booster;

extern void TaskDestructor_80095E8(struct Task *);

extern bool32 sub_800C204(struct UNK_0808B3FC_UNK240 *, s16, s16, s16,
                          struct SomeStruct_59E0 *, u32);
extern void sub_80218E4(struct SomeStruct_59E0 *);
extern void sub_8023B5C(struct SomeStruct_59E0 *, s8);

static void Task_Interactable_Booster(void);

const struct UNK_080E0D64 sBoosterAnimationData[2][6] = {
    {
        { 8, SA2_ANIM_BOOSTER, 0 },
        { 12, SA2_ANIM_BOOSTER, 1 },
        { 12, SA2_ANIM_BOOSTER, 2 },
        { 16, SA2_ANIM_BOOSTER, 3 },
        { 12, SA2_ANIM_BOOSTER, 4 },
        { 8, SA2_ANIM_BOOSTER, 5 },
    },
    {
        { 8, SA2_ANIM_DIR_ARROW_TEC_BAS, 0 },
        { 12, SA2_ANIM_DIR_ARROW_TEC_BAS, 1 },
        { 12, SA2_ANIM_DIR_ARROW_TEC_BAS, 2 },
        { 16, SA2_ANIM_DIR_ARROW_TEC_BAS, 3 },
        { 16, SA2_ANIM_DIR_ARROW_TEC_BAS, 4 },
        { 8, SA2_ANIM_DIR_ARROW_TEC_BAS, 5 },
    },
};

#define BOOSTER_SPEED 3072

// Look left and accelerate
#define BOOSTER_ACCEL_LEFT(player)                                                      \
    (player).unk20 |= MOVESTATE_FACING_LEFT;                                            \
    if (gPlayer.unk14 > -BOOSTER_SPEED)                                                 \
        gPlayer.unk14 = -BOOSTER_SPEED;

// Look right and accelerate
#define BOOSTER_ACCEL_RIGHT(player)                                                     \
    (player).unk20 &= ~MOVESTATE_FACING_LEFT;                                           \
    if (gPlayer.unk14 < BOOSTER_SPEED)                                                  \
        gPlayer.unk14 = BOOSTER_SPEED;

void initSprite_Interactable_Booster(Interactable *ia, u16 spriteRegionX,
                                     u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_Booster, sizeof(Sprite_Booster),
                                0x2000, 0, TaskDestructor_80095E8);
    Sprite_Booster *booster = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *displayed = &booster->displayed;
    u32 value;

    booster->base.regionX = spriteRegionX;
    booster->base.regionY = spriteRegionY;
    booster->base.ia = ia;
    booster->base.spriteX = ia->x;
    booster->base.spriteY = spriteY;

    displayed->unk16 = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->unk18 = SpriteGetScreenPos(ia->y, spriteRegionY);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        value = 1;
    else
        value = 0;

    SET_SPRITE_INITIALIZED(ia);

    displayed->unk4 = VramMalloc(sBoosterAnimationData[value][ia->d.sData[0]].unk0);
    displayed->unkA = sBoosterAnimationData[value][ia->d.sData[0]].unk4;
    displayed->unk20 = sBoosterAnimationData[value][ia->d.sData[0]].unk6;
    displayed->unk1A = 0x480;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->unk25 = 0;
    displayed->unk28 = -1;
    displayed->unk10 = 0x2000;

    if (ia->d.uData[2] != 0) {
        displayed->unk10 |= 0x800;
    }

    if (ia->d.sData[1] != 0) {
        displayed->unk10 |= 0x400;
    }
}

void Task_Interactable_Booster(void)
{
    Sprite_Booster *booster = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *displayed = &booster->displayed;
    Interactable *ia = booster->base.ia;

    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(booster->base.spriteX, booster->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, booster->base.regionY);
    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;

    if (!(gPlayer.unk20 & (MOVESTATE_DEAD | MOVESTATE_IN_AIR))
        && (sub_800C204(displayed, screenX, screenY, 0, &gPlayer, 0) == 1)) {
        sub_80218E4(&gPlayer);

        if (gPlayer.unk20 & MOVESTATE_4) {
            sub_8023B5C(&gPlayer, 9);
            gPlayer.unk16 = 6;
            gPlayer.unk17 = 9;
        } else {
            sub_8023B5C(&gPlayer, 14);
            gPlayer.unk16 = 6;
            gPlayer.unk17 = 14;
        }

        m4aSongNumStart(SE_SPEED_BOOSTER);

        gPlayer.unk62 = 0;
        gPlayer.unk5A = 1;

        if (gUnknown_03005424 & 0x80) {
            if ((displayed->unk10 & 0x800) == 0) {
                if ((displayed->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((displayed->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        } else {
            if ((displayed->unk10 & 0x800) != 0) {
                if ((displayed->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((displayed->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(displayed->unk16, (s16)displayed->unk18)) {
        ia->x = booster->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(displayed);
        sub_80051E8(displayed);
    }
}
