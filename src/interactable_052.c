#include "global.h"
#include "game.h"
#include "interactable.h"
#include "interactable_052.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
} Sprite_IA52;

void sub_80735AC(void);
void sub_807365C(struct Task *);

void initSprite_Interactable052(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t
        = TaskCreate(sub_80735AC, sizeof(Sprite_IA52), 0x2010, 0, sub_807365C);
    Sprite_IA52 *ia52 = TaskGetStructPtr(t);
    Sprite *sprite = &ia52->sprite;

    ia52->base.regionX = spriteRegionX;
    ia52->base.regionY = spriteRegionY;
    ia52->base.ia = ia;
    ia52->base.spriteX = ia->x;
    ia52->base.spriteY = spriteY;

    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0xC);

    sprite->graphics.anim = 567;
    sprite->variant = 0;

    ia52->unk3C = SpriteGetScreenPos(ia->x, spriteRegionX);
    ia52->unk40 = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
    sub_8004558(sprite);
}

s16 sub_80737CC(s16);

void sub_8073600(void);

void sub_8073474(Sprite_IA52 *ia52)
{
    Sprite *sprite = &ia52->sprite;
    Player_ClearMovestate_IsInScriptedSequence();

    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.y -= ia52->unk44;

    if (gPlayer.speedGroundX > 0) {
        gPlayer.x = Q_24_8(ia52->unk3C - 6);
        gPlayer.speedGroundX += 0x140;
    } else {
        gPlayer.x = Q_24_8(ia52->unk3C + 6);
        gPlayer.speedGroundX -= 0x140;
    }

    gPlayer.speedGroundX = sub_80737CC(-gPlayer.speedGroundX);
    gPlayer.unk24 = 0;
    gPlayer.speedAirY = 0;
    gPlayer.moveState = gPlayer.moveState ^ 1;
    gPlayer.unk6D = 1;

    sprite->graphics.anim = 567;
    sprite->variant = 2;
    sub_8004558(sprite);
    gCurTask->main = sub_8073600;
}

u32 sub_8073520(Sprite_IA52 *ia52)
{
    s16 temp, temp2, temp3, temp4;
    if (!PlayerIsAlive) {
        return 0;
    }

    temp = ia52->unk3C - gCamera.x;
    temp3 = ia52->unk40 + -gCamera.y;
    temp2 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    temp4 = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    if (temp - 6 <= temp2 && temp + 6 >= temp2) {
        if (temp3 - 32 <= temp4 && temp3 >= temp4) {
            if (abs(gPlayer.speedGroundX) < 1024) {
                return 1;
            }

            if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
                return 2;
            }
            return 1;
        }
    }

    return 0;
}

void sub_8073670(Sprite_IA52 *);
void sub_8073760(Sprite_IA52 *);

bool32 sub_8073784(Sprite_IA52 *);

void sub_80735AC(void)
{
    Sprite_IA52 *ia52 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &ia52->sprite;
    Interactable *ia = ia52->base.ia;
    if (sub_8073520(ia52) == 2) {
        sub_8073670(ia52);
    }

    if (sub_8073784(ia52)) {
        ia->x = ia52->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8073760(ia52);
        sub_80051E8(sprite);
    }
}

void sub_80736E0(Sprite_IA52 *);
void sub_807371C(Sprite_IA52 *);

void sub_8073600(void)
{
    Sprite_IA52 *ia52 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &ia52->sprite;

    if (!PlayerIsAlive) {
        sub_807371C(ia52);
        return;
    }
    sub_8073760(ia52);
    sub_8004558(sprite);
    sub_80051E8(sprite);

    if (sprite->unk10 & 0x4000) {
        sub_80736E0(ia52);
    }
}

void sub_807365C(struct Task *t)
{
    Sprite_IA52 *ia52 = TaskGetStructPtr(t);
    VramFree(ia52->sprite.graphics.dest);
}

void sub_8073818(void);

void sub_8073670(Sprite_IA52 *ia52)
{
    Sprite *sprite = &ia52->sprite;
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    ia52->unk44 = Q_24_8(ia52->unk40) - gPlayer.y;
    gPlayer.x = Q_24_8(ia52->unk3C);
    gPlayer.y = Q_24_8(ia52->unk40);
    gPlayer.unk64 = 0x38;

    sprite->graphics.anim = 567;
    sprite->variant = 1;

    if (gPlayer.moveState & 1) {
        sprite->unk10 |= 0x400;
    }
    sub_8004558(sprite);
    gCurTask->main = sub_8073818;
}
