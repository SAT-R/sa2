#include "global.h"
#include "interactable_051.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "game.h"
#include "trig.h"

typedef struct {
    /* 0x00 */ Sprite sprite;
    /* 0x30 */ struct UNK_808D124_UNK180 transformConfig;
} Sprite_IA051_sprite;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprite;
    /* 0x3C */ Sprite_IA051_sprite unk3C[16];
} Sprite_IA051; /* size: 0x3FC */

void TaskDestructor_80636F0(struct Task *);

void sub_8063598(void);

extern const TileInfo gUnknown_080D9518[];

void initSprite_Interactable051(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    u8 i, j;
    void *ramDests[4];
    Sprite *sprite;
    struct Task *t = TaskCreate(sub_8063598, 0x3FC, 0x2010, 0, TaskDestructor_80636F0);
    Sprite_IA051 *ia051 = TaskGetStructPtr(t);

    sprite = &ia051->sprite;
    ia051->base.regionX = spriteRegionX;
    ia051->base.regionY = spriteRegionY;
    ia051->base.ia = ia;
    ia051->base.spriteX = ia->x;
    ia051->base.spriteY = spriteY;

    sprite->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    sprite->graphics.dest = VramMalloc(gUnknown_080D9518[4].numTiles);
    sprite->graphics.anim = gUnknown_080D9518[4].anim;
    sprite->variant = gUnknown_080D9518[4].variant;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sub_8004558(sprite);

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            sprite = &ia051->unk3C[i * 4 + j].sprite;
            sprite->x = 0;
            sprite->y = 0;
            if (i == 0) {
                sprite->graphics.dest = VramMalloc(gUnknown_080D9518[j].numTiles);
                ramDests[j] = sprite->graphics.dest;
            } else {
                sprite->graphics.dest = ramDests[j];
            }
            sprite->graphics.anim = gUnknown_080D9518[j].anim;
            sprite->variant = gUnknown_080D9518[j].variant;
            sprite->unk1A = 0x480;
            sprite->graphics.size = 0;
            sprite->unk14 = 0;
            sprite->unk1C = 0;
            sprite->unk21 = 0xFF;
            sprite->unk22 = 0x10;
            sprite->focused = 0;
            sprite->unk28[0].unk0 = -1;
            sprite->unk10 = 0;
            sub_8004558(sprite);
        }
    }
}

void sub_8063598(void)
{
    u8 i, j;
    struct UNK_808D124_UNK180 *transformConfig;
    Sprite_IA051 *ia051 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &ia051->sprite;
    Interactable *ia = ia051->base.ia;

    s32 screenX, screenY;
    s32 baseX, baseY;

    screenX = SpriteGetScreenPos(ia051->base.spriteX, ia051->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, ia051->base.regionY);
    sprite->x = screenX - gCamera.x;
    sprite->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        ia->x = ia051->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_80051E8(sprite);
    screenX = sprite->x;
    screenY = sprite->y;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            u32 temp, mask, r0;

            sprite = &ia051->unk3C[i * 4 + j].sprite;
            transformConfig = &ia051->unk3C[i * 4 + j].transformConfig;
            temp = (gUnknown_03005590 * 2 + (i * 0x100));

            mask = ONE_CYCLE;
#ifndef NON_MATCHING
            asm("add %0, %1, #0" : "=r"(r0) : "r"(mask) : "cc");
#else
            r0 = mask;
#endif

            sprite->x = screenX + ((COS(temp & r0) * ((j + 1) * 16 - 8)) >> 0xE);
            sprite->y = screenY + ((SIN(temp & r0) * ((j + 1) * 16 - 8)) >> 0xE);
            transformConfig->unk0 = temp & r0;
            transformConfig->unk2 = 0x100;
            transformConfig->unk4 = 0x100;
            transformConfig->unk6[0] = sprite->x;
            transformConfig->unk6[1] = sprite->y;

            sprite->unk10 = (gUnknown_030054B8++ | 0x1060);
            sub_8004860(sprite, transformConfig);
            sub_80051E8(sprite);
        }
    }
}
