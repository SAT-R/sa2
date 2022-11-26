#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 main;
} Sprite_Booster;

extern void Task_Interactable_Booster(void);
extern void TaskDestructor_80095E8(struct Task *);

extern bool32 sub_800C204(struct UNK_0808B3FC_UNK240 *, s16, s16, s16,
                          struct SomeStruct_59E0 *, u32);
extern void sub_80218E4(struct SomeStruct_59E0 *);
extern void sub_8023B5C(struct SomeStruct_59E0 *, s8);

extern const struct UNK_080E0D64 gUnknown_080D942C[2][6];

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
    struct UNK_0808B3FC_UNK240 *main = &booster->main;
    int value;

    booster->base.regionX = spriteRegionX;
    booster->base.regionY = spriteRegionY;
    booster->base.ia = ia;
    booster->base.spriteX = ia->x;
    booster->base.spriteY = spriteY;

    main->unk16 = SpriteGetScreenPos(ia->x, spriteRegionX);
    main->unk18 = SpriteGetScreenPos(ia->y, spriteRegionY);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        value = 1;
    else
        value = 0;

    SET_SPRITE_INITIALIZED(ia);

    main->unk4 = VramMalloc(gUnknown_080D942C[value][ia->d.sData[0]].unk0);
    main->unkA = gUnknown_080D942C[value][ia->d.sData[0]].unk4;
    main->unk20 = gUnknown_080D942C[value][ia->d.sData[0]].unk6;
    main->unk1A = 0x480;
    main->unk8 = 0;
    main->unk14 = 0;
    main->unk1C = 0;
    main->unk21 = 0xFF;
    main->unk22 = 0x10;
    main->unk25 = 0;
    main->unk28 = -1;
    main->unk10 = 0x2000;

    if (ia->d.uData[2] != 0) {
        main->unk10 |= 0x800;
    }

    if (ia->d.sData[1] != 0) {
        main->unk10 |= 0x400;
    }
}

void Task_Interactable_Booster(void)
{
    Sprite_Booster *booster = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *main = &booster->main;
    Interactable *ia = booster->base.ia;

    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(booster->base.spriteX, booster->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, booster->base.regionY);
    main->unk16 = screenX - gCamera.unk0;
    main->unk18 = screenY - gCamera.unk4;

    if (!(gPlayer.unk20 & (MOVESTATE_DEAD | MOVESTATE_IN_AIR))
        && (sub_800C204(main, screenX, screenY, 0, &gPlayer, 0) == 1)) {
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
            if ((main->unk10 & 0x800) == 0) {
                if ((main->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((main->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        } else {
            if ((main->unk10 & 0x800) != 0) {
                if ((main->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((main->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(main->unk16, (s16)main->unk18)) {
        ia->x = booster->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(main);
        sub_80051E8(main);
    }
}
