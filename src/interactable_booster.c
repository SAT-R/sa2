#include "global.h"
#include "malloc_vram.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 main;
} Sprite_Booster;

extern void Task_Interactable_Booster(void);
extern void TaskDestructor_80095E8(struct Task *);

extern const struct UNK_080E0D64 gUnknown_080D942C[2][6];

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

#if 0
void Task_Interactable_Booster(void)
{
    Sprite_Booster *booster = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK_240 main = &booster->main;
    Interactable *ia = booster->base.ia;
}
#endif