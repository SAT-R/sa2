#include "global.h"
#include "game/game.h"
#include "game/interactable.h"
#include "core.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/interactables_2/078.h"
#include "malloc_vram.h"
#include "trig.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
} Sprite_IA78;

void Task_Interactable078(void);
void TaskDestructor_Interactable078(struct Task *);

void sub_807ACF4(Sprite_IA78 *, u32);

void initSprite_Interactable078(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_Interactable078, 0x48, 0x2010, 0,
                                TaskDestructor_Interactable078);
    Sprite_IA78 *ia78 = TaskGetStructPtr(t);

    ia78->base.ia = ia;
    ia78->base.regionX = spriteRegionX;
    ia78->base.regionY = spriteRegionY;
    ia78->base.spriteX = ia->x;
    ia78->base.spriteY = spriteY;

    ia78->unk3C = SpriteGetScreenPos(ia->x, spriteRegionX);
    ia78->unk40 = SpriteGetScreenPos(ia->y, spriteRegionY);

    sprite = &ia78->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x2A);
    sprite->graphics.anim = -1;
    sprite->variant = -1;
    sub_807ACF4(ia78, 1);
    SET_SPRITE_INITIALIZED(ia);
}

extern const u16 gUnknown_080E00B4[][2];

extern const u16 gUnknown_080E00FC[10][2];
extern const u16 gUnknown_080E00D4[10][2];

void sub_807ACF4(Sprite_IA78 *ia78, u32 p2)
{
    u8 i;
    u8 idx;
    Sprite *sprite = &ia78->sprite;
    u32 temp = gUnknown_03005590 % 286;

    if (temp <= 119) {
        temp &= 15;

        if (p2 != 0) {
            if (temp < 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 8;
                sub_8004558(sprite);
            } else {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 9;
                sub_8004558(sprite);
            }
        } else {
            if (temp == 0) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 8;
                sub_8004558(sprite);
            } else if (temp == 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 9;
                sub_8004558(sprite);
            }
        }

        ia78->unk44 = 0;
    } else if (temp < 185) {
        temp -= 120;
        for (i = 1; i < 10; i++) {
            if (temp < gUnknown_080E00FC[i][0]) {
                break;
            }
        }
        idx = (i - 1);
        sprite->graphics.anim = gUnknown_080E00B4[gUnknown_080E00FC[idx][1]][0];
        sprite->variant = gUnknown_080E00B4[gUnknown_080E00FC[idx][1]][1];
        sub_8004558(sprite);
        ia78->unk44 = 0;
    } else if (temp <= 244) {
        temp = (temp - 185) & 15;

        if (p2 != 0) {
            if (temp >= 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 3;
                sub_8004558(sprite);
            } else {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 2;
                sub_8004558(sprite);
            }
        } else {
            if (temp == 0) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 2;
                sub_8004558(sprite);
            } else if (temp == 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_SCREEN;
                sprite->variant = 3;
                sub_8004558(sprite);
            }
        }

        ia78->unk44 = 1;
    } else {
        temp -= 245;
        for (i = 1; i < 10; i++) {
            if (temp < gUnknown_080E00D4[i][0]) {
                break;
            }
        };
        idx = (i - 1);
        sprite->graphics.anim = gUnknown_080E00B4[gUnknown_080E00D4[idx][1]][0];
        sprite->variant = gUnknown_080E00B4[gUnknown_080E00D4[idx][1]][1];
        sub_8004558(sprite);
        ia78->unk44 = 0;
    }
}
