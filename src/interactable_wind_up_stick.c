#include "global.h"
#include "game.h"
#include "interactable.h"
#include "interactable_wind_up_stick.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    u8 unk10;
    u8 unk11;

    Interactable *ia;
    s8 spriteX;
    s8 spriteY;
} Sprite_WindUpStick;

void sub_8072998(void);
void sub_80729D4(struct Task *);

void initSprite_Interactable_WindUpStick(Interactable *ia, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8072998, 0x1C, 0x2010, 0, sub_80729D4);
    Sprite_WindUpStick *windUpStick = TaskGetStructPtr(t);
    windUpStick->unk11 = 0;
    windUpStick->unk0 = SpriteGetScreenPos(ia->x, spriteRegionX);
    windUpStick->unk4 = SpriteGetScreenPos(ia->y, spriteRegionY);
    windUpStick->unk8 = ia->d.sData[0] * 8;
    windUpStick->unkA = ia->d.sData[1] * 8;
    windUpStick->unkC = ia->d.uData[2] * 8 + windUpStick->unk8;
    windUpStick->unkE = ia->d.uData[3] * 8 + windUpStick->unkA;
    windUpStick->ia = ia;
    windUpStick->spriteX = ia->x;
    windUpStick->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

u32 sub_8072A28(Sprite_WindUpStick *);
u32 sub_80729F4(Sprite_WindUpStick *);
void sub_80727F4(Sprite_WindUpStick *);
void sub_80729D8(Sprite_WindUpStick *);

void sub_8072650(void)
{
    Sprite_WindUpStick *windUpStick = TaskGetStructPtr(gCurTask);

    if (!PlayerIsAlive) {
        sub_80729D8(windUpStick);
        return;
    }

    if ((u8)(windUpStick->unk10 - 1) < 2) {
        if (gPlayer.unk5C & 0x10) {
            if (sub_8072A28(windUpStick)) {
                gPlayer.x += 0x80;
            }
        }

        if (gPlayer.unk5C & 0x20) {
            if (sub_80729F4(windUpStick)) {
                gPlayer.x -= 0x80;
            }
        }
    }

    if (gPlayer.unk90->unk1C & 0x4000) {
        sub_80727F4(windUpStick);
    }
}
