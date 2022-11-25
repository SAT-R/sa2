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

void initSprite_Interactable_Booster(Interactable *interactable, u16 spriteRegionX,
                                     u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_Booster, sizeof(Sprite_Booster),
                                0x2000, 0, TaskDestructor_80095E8);
    Sprite_Booster *booster = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *main = &booster->main;
    int value;

    booster->base.regionX = spriteRegionX;
    booster->base.regionY = spriteRegionY;
    booster->base.entity = interactable;

    booster->base.spriteX = interactable->x;
    booster->base.spriteY = spriteY;

    main->unk16 = SpriteGetScreenPos(interactable->x, spriteRegionX);
    main->unk18 = SpriteGetScreenPos(interactable->y, spriteRegionY);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        value = 1;
    else
        value = 0;

    SET_SPRITE_INITIALIZED(interactable);


    main->unk4 = VramMalloc(gUnknown_080D942C[value][interactable->d.sData[0]].unk0);
    main->unkA = gUnknown_080D942C[value][interactable->d.sData[0]].unk4;
    main->unk20 = gUnknown_080D942C[value][interactable->d.sData[0]].unk6;
    main->unk1A = 0x480;
    main->unk8 = 0;
    main->unk14 = 0;
    main->unk1C = 0;
    main->unk21 = 0xFF;
    main->unk22 = 0x10;
    main->unk25 = 0;
    main->unk28 = -1;
    main->unk10 = 0x2000;

    if (interactable->d.uData[2] != 0) {
        main->unk10 |= 0x800;
    }

    if (interactable->d.sData[1] != 0) {
        main->unk10 |= 0x400;
    }
}
