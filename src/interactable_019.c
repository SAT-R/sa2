#include "global.h"
#include "malloc_vram.h"

#include "task.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 displayed;
    s16 unk3C;
} Sprite_019;

// NOTE: This does not only have 2 entries, gUnknown_080D94D8 should be part of this
// array
extern u16 gUnknown_080D94D4[];

extern u32 sub_800C060(struct UNK_0808B3FC_UNK240 *, s32, s32, struct SomeStruct_59E0 *);

static void Task_Interactable_019(void);

// TODO: static
extern void Task_805E35C(void);
extern void Task_805E480(void);
extern void TaskDestructor_Interactable019(struct Task *);

// @TODO: Replace with tile-count from the graphics data itself
#define IA_019_NUM_TILES 32

void initSprite_Interactable_019(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_019, sizeof(Sprite_019), 0x2000, 0,
                                TaskDestructor_Interactable019);
    Sprite_019 *platform = TaskGetStructPtr(t);
    SpriteBase *base = &platform->base;
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    // s16 screenX, screenY;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->ia = ia;
    base->spriteX = ia->x;
    base->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_SPRITE_INITIALIZED
    displayed->unk16 = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->unk18 = SpriteGetScreenPos(ia->y, spriteRegionY);
    displayed->unk4 = VramMalloc(IA_019_NUM_TILES);

    displayed->unkA = gUnknown_080D94D4[gCurrentLevel];

    displayed->unk20 = 0;
    displayed->unk1A = 1152;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;

    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->unk25 = 0;
    displayed->unk10 = 0x2000;

    if (ia->d.sData[0] != 0) {
        displayed->unk10 |= 0x400;
    }

    sub_8004558(displayed);
}

void Task_Interactable_019(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &platform->base;
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    Interactable *ia = base->ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(base->spriteX, base->regionX);
    screenY = SpriteGetScreenPos(ia->y, base->regionY);

    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;

    if (sub_800C060(displayed, screenX, screenY, &gPlayer) & 0x8) {
        gCurTask->main = Task_805E35C;
        platform->unk3C = 0;
    }

    if ((gGameMode >= GAME_MODE_MULTI_PLAYER)
        && ((s8)ia->x == SPRITE_STATE_UNK_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    // _0805E2C2

    if ((screenX > gCamera.unk0 + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
          || (screenX < gCamera.unk0 - (CAM_REGION_WIDTH / 2))
          || (screenY > gCamera.unk4 + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
          || (screenY < gCamera.unk4 - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(displayed->unk16, (s16)displayed->unk18))) {
        ia->x = base->spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}
