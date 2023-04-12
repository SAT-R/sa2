#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/097.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 x; /* 0x3C */
    s32 y; /* 0x40 */
    s32 unk44;
    s32 unk48;

    s32 unk4C;
    s16 unk50;
    s16 unk52;

    s32 unk54;
    s16 unk58;
    s16 unk5A;
    s16 unk5C;
    u8 unk5E;
    s32 unk60[3][2];
} Sprite_IA97; /* size 0x78 */

void Task_Interactable097(void);
void TaskDestructor_Interactable097(struct Task *);

void initSprite_Interactable097(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    u32 i;
    struct Task *t = TaskCreate(Task_Interactable097, 0x78, 0x2010, 0,
                                TaskDestructor_Interactable097);
    Sprite_IA97 *ia97 = TaskGetStructPtr(t);
    Sprite *sprite;
    ia97->unk54 = 0;
    ia97->unk58 = 0;
    ia97->unk5A = 0;
    ia97->unk5C = 0;
    ia97->unk5E = 0x20;

    ia97->x = SpriteGetScreenPos(me->x, spriteRegionX);
    ia97->y = SpriteGetScreenPos(me->y, spriteRegionY);

    ia97->unk44 = 0x2000;
    ia97->unk48 = 0x1200;

    ia97->base.regionX = spriteRegionX;
    ia97->base.regionY = spriteRegionY;
    ia97->base.me = me;
    ia97->base.spriteX = me->x;
    ia97->base.spriteY = spriteY;

    for (i = 0; i < 3; i++) {
        ia97->unk60[i][0] = ia97->unk44;
        ia97->unk60[i][1] = ia97->unk48;
    }

    sprite = &ia97->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x10);
    sprite->graphics.anim = SA2_ANIM_SPEEDING_PLATFORM;
    sprite->variant = 0;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_807FF04(Sprite_IA97 *);
void sub_807FB1C(Sprite_IA97 *);
u32 sub_807FE90(Sprite_IA97 *);
void sub_807FEEC(Sprite_IA97 *);
void sub_807FC20(Sprite_IA97 *);

void sub_807F9F0(void)
{
    Sprite_IA97 *ia97 = TaskGetStructPtr(gCurTask);
    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_807FF04(ia97);
    }

    sub_807FB1C(ia97);
    if (ia97->unk4C != 0 && ia97->unk5A > -1) {
        s32 res = sub_801F100(ia97->y + Q_24_8_TO_INT(ia97->unk48),
                              ia97->x + Q_24_8_TO_INT(ia97->unk44), 1, 8, sub_801EC3C);
        if (res < 0) {
            ia97->unk4C = 0;
            gPlayer.unk6D = 3;
            gPlayer.moveState &= ~8;
            gPlayer.unk3C = 0;
        }
    }

    if (sub_807FE90(ia97)) {
        sub_807FEEC(ia97);
    } else {
        sub_807FC20(ia97);
    }
}

void sub_807FA98(Sprite_IA97 *ia97)
{
    ia97->unk44 = Q_24_8(814);
    ia97->unk48 = Q_24_8(576);

    ia97->unk5E = 0xE0;
    ia97->unk5C = 0x800;
    ia97->unk58 = COS_24_8(ia97->unk5E * 4) << 3;
    ia97->unk5A = Q_24_8_TO_INT(ia97->unk5C * SIN_24_8(ia97->unk5E * 4));
    ia97->unk54 = 1;
    m4aSongNumStop(SE_288);
    gCurTask->main = sub_807F9F0;
}

s32 sub_807FC9C(Sprite_IA97 *);

void sub_807FB1C(Sprite_IA97 *ia97)
{
    if (ia97->unk54 == 0) {
        ia97->unk5C = ia97->unk5C > 0xF00 ? 0xF00 : ia97->unk5C;
        ia97->unk58 = Q_24_8_TO_INT(ia97->unk5C * COS_24_8(ia97->unk5E * 4));
        ia97->unk5A = Q_24_8_TO_INT(ia97->unk5C * SIN_24_8(ia97->unk5E * 4));
    } else {
        ia97->unk5A += 0x2A;
        ia97->unk5A = ia97->unk5A > 0x800 ? 0x800 : ia97->unk5A;
    }

    ia97->unk44 += ia97->unk58;
    ia97->unk48 += ia97->unk5A;

    if (PlayerIsAlive && ia97->unk4C != 0) {
        gPlayer.x = ia97->unk50 + ((ia97->x * 0x100) + ia97->unk44);
        gPlayer.y
            = ia97->unk52 + ((ia97->y * 0x100) + ia97->unk48) - (gPlayer.unk17 * 0x100);
        ia97->unk50 += gPlayer.speedAirX;
        ia97->unk52 += gPlayer.speedAirY;
    }

    ia97->unk4C = sub_807FC9C(ia97);
}
