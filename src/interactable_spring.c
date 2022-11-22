#include "global.h"
#include "gba/types.h"
#include "m4a.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"
#include "zones.h"

#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 main;
    /* 0x3C */ struct UNK_0808B3FC_UNK240_UNK30 sub;
} Sprite_Spring;

#define INITIALIZE_SPRING(dirType)                                                      \
    sub_800E19C(dirType, entity, spriteRegionX, spriteRegionY, param3)

extern void sub_800E19C(u8, void *, u16, u16, u8);
extern bool32 sub_800CDBC(struct UNK_0808B3FC_UNK240 *, s16, s16,
                          struct SomeStruct_59E0 *);

extern const u8 gUnknown_080D53D0[10];
// static const u8 gUnknown_080D53D0[10] = {14, 15, 16, 17, 18, 19, 20, 21, 18, 19};

extern const u16 gUnknown_080D53DA[5];
// static const u16 gUnknown_080D53DA[5] = {SE_MUSIC_PLANT_SPRING_1,
// SE_MUSIC_PLANT_SPRING_2, SE_MUSIC_PLANT_SPRING_3, SE_MUSIC_PLANT_SPRING_4, MUS_DUMMY};

#if 0
void initSprite_Interactable_Spring(u8 dirType, void *inEntity, u16 spriteRegionX,
                                    u16 spriteRegionY, u8 param3)
{

}
#endif

bool32 sub_800E490(struct UNK_0808B3FC_UNK240 *p0, Interactable *inEntity,
                   Sprite_Spring *spring, struct SomeStruct_59E0 *player)
{
    s16 xPos = SpriteGetScreenPos(spring->base.spriteX, spring->base.regionX);
    s16 yPos = SpriteGetScreenPos(inEntity->y, spring->base.regionY);
    p0->unk16 = xPos - gCamera.unk0;
    p0->unk18 = yPos - gCamera.unk4;

    if (((player->unk20 & 0x00400000) == 0)
        && sub_800CDBC(p0, xPos, yPos, player) != 0) {

        player->unk6D = gUnknown_080D53D0[spring->sub.unk0];
        player->unk6E = spring->sub.unk1;
        player->unk6C = 1;

        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            m4aSongNumStart(gUnknown_080D53DA[spring->sub.unk1]);
        } else {
            m4aSongNumStart(SE_SPRING);
        }

        return TRUE;
    } else {
        return FALSE;
    }
}

void TaskDestructor_Interactable_Spring(struct Task *t)
{
    Sprite_Spring *spring = TaskGetStructPtr(t);
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) || (spring->sub.unk0 / 2 != 0)) {
        VramFree(spring->main.unk4);
    }
}

void initSprite_Interactable_Spring_Big_DownLeft(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(6);
}

void initSprite_Interactable_Spring_Normal_Down(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(1);
}

void initSprite_Interactable_Spring_Big_DownRight(void *entity, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(7);
}

void initSprite_Interactable_Spring_Normal_Left(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(2);
}

void initSprite_Interactable_Spring_Normal_Right(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(3);
}

void initSprite_Interactable_Spring_Big_UpLeft(void *entity, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(4);
}

void initSprite_Interactable_Spring_Normal_Up(void *entity, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(0);
}

void initSprite_Interactable_Spring_Big_UpRight(void *entity, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(5);
}

void initSprite_Interactable_Spring_Small_UpLeft(void *entity, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(8);
}

void initSprite_Interactable_Spring_Small_UpRight(void *entity, u16 spriteRegionX,
                                                  u16 spriteRegionY, u8 param3)
{
    INITIALIZE_SPRING(9);
}
