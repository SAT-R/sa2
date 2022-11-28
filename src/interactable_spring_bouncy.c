#include "global.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"

extern void sub_805DE60(void);
extern void sub_805E10C(struct Task*);

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 displayed;
} Sprite_BouncySpring;

void initSprite_Interactable_BouncySpring(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task* t = TaskCreate(sub_805DE60, sizeof(Sprite_BouncySpring), 0x2010, 0, sub_805E10C);
    Sprite_BouncySpring* spring = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240* displayed = &spring->displayed;
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
