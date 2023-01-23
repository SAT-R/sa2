#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"
#include "main.h"

#include "data.h"
#include "flags.h"
#include "interactable.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
} Sprite_SpecialRing; /* size = 0x44 */

// make static
extern void Task_Interactable_SpecialRing(void);
extern void TaskDestructor_Interactable_SpecialRing(struct Task *);

void initSprite_Interactable_SpecialRing(Interactable *ia, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        struct Task *t
            = TaskCreate(Task_Interactable_SpecialRing, sizeof(Sprite_SpecialRing),
                         0x4040, 0, TaskDestructor_Interactable_SpecialRing);

        Sprite_SpecialRing *ring = TaskGetStructPtr(t);
        Sprite *disp;
        ring->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
        ring->posY = SpriteGetScreenPos(ia->y, spriteRegionY);

        ring->base.regionX = spriteRegionX;
        ring->base.regionY = spriteRegionY;
        ring->base.ia = ia;
        ring->base.spriteX = ia->x;
        ring->base.spriteY = spriteY;

        disp = &ring->displayed;
        disp->unk1A = 0x480;
        disp->graphics.size = 0;
        disp->unk14 = 0;
        disp->unk1C = 0;

        disp->unk21 = 0xFF;
        disp->unk22 = 0x10;
        disp->focused = 0;

        disp->unk28->unk0 = -1;
        disp->unk10 = 0x2000;

        disp->graphics.dest = VramMalloc(9);
        disp->graphics.anim = SA2_ANIM_COLLECTIBLE_SPECIAL_RING;
        disp->variant = 0;
        SET_SPRITE_INITIALIZED(ia);
    }
}
