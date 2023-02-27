#include "global.h"
#include "game/game.h"
#include "game/interactable.h"
#include "game/interactables_2/turn_around_bar.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 x;
    s32 y;
    s32 unk44;
} Sprite_TurnAroundBar;

static void Task_TurnAroundBarMain(void);
static void TaskDestructor_InteractableTurnAroundBar(struct Task *);
static void sub_8073670(Sprite_TurnAroundBar *);
static void sub_8073760(Sprite_TurnAroundBar *);
static bool32 sub_8073784(Sprite_TurnAroundBar *);
static s16 ClampSpeed(s16);
static void sub_8073600(void);
static void sub_80736E0(Sprite_TurnAroundBar *);
static void sub_807371C(Sprite_TurnAroundBar *);

void initSprite_InteractableTurnAroundBar(Interactable *ia, u16 spriteRegionX,
                                          u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_TurnAroundBarMain, sizeof(Sprite_TurnAroundBar),
                                0x2010, 0, TaskDestructor_InteractableTurnAroundBar);
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(t);
    Sprite *sprite = &turnAroundBar->sprite;

    turnAroundBar->base.regionX = spriteRegionX;
    turnAroundBar->base.regionY = spriteRegionY;
    turnAroundBar->base.ia = ia;
    turnAroundBar->base.spriteX = ia->x;
    turnAroundBar->base.spriteY = spriteY;

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

    sprite->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    sprite->variant = 0;

    turnAroundBar->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    turnAroundBar->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);
    sub_8004558(sprite);
}

static void sub_8073474(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *sprite = &turnAroundBar->sprite;
    Player_ClearMovestate_IsInScriptedSequence();

    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.y -= turnAroundBar->unk44;

    if (gPlayer.speedGroundX > 0) {
        gPlayer.x = Q_24_8(turnAroundBar->x - 6);
        gPlayer.speedGroundX += Q_8_8(1.25);
    } else {
        gPlayer.x = Q_24_8(turnAroundBar->x + 6);
        gPlayer.speedGroundX -= Q_8_8(1.25);
    }

    gPlayer.speedGroundX = ClampSpeed(-gPlayer.speedGroundX);
    gPlayer.unk24 = 0;
    gPlayer.speedAirY = 0;
    gPlayer.moveState = gPlayer.moveState ^ 1;
    gPlayer.unk6D = 1;

    sprite->graphics.anim = 567;
    sprite->variant = 2;
    sub_8004558(sprite);
    gCurTask->main = sub_8073600;
}

static u32 sub_8073520(Sprite_TurnAroundBar *turnAroundBar)
{
    s16 temp, temp2, temp3, temp4;
    if (!PlayerIsAlive) {
        return 0;
    }

    temp = turnAroundBar->x - gCamera.x;
    temp3 = turnAroundBar->y + -gCamera.y;
    temp2 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    temp4 = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    if (temp - 6 <= temp2 && temp + 6 >= temp2) {
        if (temp3 - 32 <= temp4 && temp3 >= temp4) {
            if (abs(gPlayer.speedGroundX) < Q_8_8(4)) {
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

static void Task_TurnAroundBarMain(void)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &turnAroundBar->sprite;
    Interactable *ia = turnAroundBar->base.ia;
    if (sub_8073520(turnAroundBar) == 2) {
        sub_8073670(turnAroundBar);
    }

    if (sub_8073784(turnAroundBar)) {
        ia->x = turnAroundBar->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8073760(turnAroundBar);
        sub_80051E8(sprite);
    }
}

static void sub_8073600(void)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &turnAroundBar->sprite;

    if (!PlayerIsAlive) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    sub_8004558(sprite);
    sub_80051E8(sprite);

    if (sprite->unk10 & 0x4000) {
        sub_80736E0(turnAroundBar);
    }
}

static void TaskDestructor_InteractableTurnAroundBar(struct Task *t)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(t);
    VramFree(turnAroundBar->sprite.graphics.dest);
}

static void sub_8073818(void);

static void sub_8073670(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *sprite = &turnAroundBar->sprite;
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    turnAroundBar->unk44 = Q_24_8(turnAroundBar->y) - gPlayer.y;
    gPlayer.x = Q_24_8(turnAroundBar->x);
    gPlayer.y = Q_24_8(turnAroundBar->y);
    gPlayer.unk64 = 0x38;

    sprite->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    sprite->variant = 1;

    if (gPlayer.moveState & 1) {
        sprite->unk10 |= 0x400;
    }
    sub_8004558(sprite);
    gCurTask->main = sub_8073818;
}

static void sub_80736E0(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *sprite = &turnAroundBar->sprite;
    sprite->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    sprite->variant = 0;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    gCurTask->main = Task_TurnAroundBarMain;
}

static void sub_807371C(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *sprite = &turnAroundBar->sprite;
    Player_ClearMovestate_IsInScriptedSequence();
    sprite->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    sprite->variant = 0;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    gCurTask->main = Task_TurnAroundBarMain;
}

static void sub_8073760(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *sprite = &turnAroundBar->sprite;
    sprite->x = turnAroundBar->x - gCamera.x;
    sprite->y = turnAroundBar->y - gCamera.y;
}

static bool32 sub_8073784(Sprite_TurnAroundBar *turnAroundBar)
{
    s32 temp, temp2;
    s16 temp3, temp4;

    temp2 = turnAroundBar->x;
    temp2 -= gCamera.x;

    temp = turnAroundBar->y;
    temp -= gCamera.y;

    temp3 = temp;
    temp4 = temp2;

    if (temp4 < -128 || temp4 > 368 || temp3 < -128 || temp3 > 288) {
        return TRUE;
    }

    return FALSE;
}

static s16 ClampSpeed(s16 speed)
{
    if (gPlayer.unk5A != 0) {
        if (speed > Q_8_8(15)) {
            speed = Q_8_8(15);
        } else if (speed < -Q_8_8(15)) {
            speed = -Q_8_8(15);
        }
    } else {
        if (speed > Q_8_8(9)) {
            speed = Q_8_8(9);
        } else if (speed < -Q_8_8(15)) {
            speed = -Q_8_8(15);
        }
    }

    return speed;
}

static void sub_8073818(void)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &turnAroundBar->sprite;
    if (!PlayerIsAlive) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    sub_8004558(sprite);
    sub_80051E8(sprite);

    if (sprite->unk10 & 0x4000) {
        sub_8073474(turnAroundBar);
    }
}
