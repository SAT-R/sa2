#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/giant_propeller.h"
#include "lib/m4a.h"

#include "constants/move_states.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 x;
    s32 y;
    s32 unk44;
    s32 unk48;
} Sprite_GiantPropeller;

void sub_807B8FC(Sprite_GiantPropeller *);
void sub_807B74C(Sprite_GiantPropeller *);
void Task_Interactable_SkyCanyon_GiantPropeller(void);
bool32 sub_807B9A4(Sprite_GiantPropeller *);
void sub_807B7BC(Sprite_GiantPropeller *);
void sub_807BA70(void);
void sub_807B930(Sprite_GiantPropeller *);

void sub_807B3E4(void)
{
    Sprite_GiantPropeller *propeller = TaskGetStructPtr(gCurTask);

    if (!PlayerIsAlive) {
        gCurTask->main = Task_Interactable_SkyCanyon_GiantPropeller;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        gPlayer.y -= Q_24_8(4);
        if (Q_24_8_TO_INT(gPlayer.y) <= propeller->y - 0x30) {
            gPlayer.y = Q_24_8(propeller->y - 0x30);
            sub_807B74C(propeller);
        }

        if (gPlayer.unk5C & 0x10) {
            gPlayer.x += Q_24_8(0.5);
        }

        if (gPlayer.unk5C & 0x20) {
            gPlayer.x -= Q_24_8(0.5);
        }

        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) + 2; }) + gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, 8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x += Q_24_8(temp);
        }
        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) - 2; }) - gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x -= Q_24_8(temp);
        }

        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) + gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, 8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y += Q_24_8(temp);
        }
        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) - gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, -8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y -= Q_24_8(temp);
        }
    }

    if (!sub_807B9A4(propeller)) {
        sub_807B7BC(propeller);
    }

    sub_807BA70();
    sub_807B930(propeller);
}
