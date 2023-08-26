#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/hot_crater/turn_around_bar.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"

typedef struct {
    SpriteBase base;
    Sprite s;
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

void CreateEntity_TurnAroundBar(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_TurnAroundBarMain, sizeof(Sprite_TurnAroundBar),
                                0x2010, 0, TaskDestructor_InteractableTurnAroundBar);
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(t);
    Sprite *s = &turnAroundBar->s;

    turnAroundBar->base.regionX = spriteRegionX;
    turnAroundBar->base.regionY = spriteRegionY;
    turnAroundBar->base.me = me;
    turnAroundBar->base.spriteX = me->x;
    turnAroundBar->base.spriteY = spriteY;

    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;
    s->graphics.dest = VramMalloc(0xC);

    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 0;

    turnAroundBar->x = TO_WORLD_POS(me->x, spriteRegionX);
    turnAroundBar->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    UpdateSpriteAnimation(s);
}

static void sub_8073474(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
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
    gPlayer.rotation = 0;
    gPlayer.speedAirY = 0;
    gPlayer.moveState = gPlayer.moveState ^ 1;
    gPlayer.transition = PLTRANS_PT1;

    s->graphics.anim = 567;
    s->variant = 2;
    UpdateSpriteAnimation(s);
    gCurTask->main = sub_8073600;
}

static u32 sub_8073520(Sprite_TurnAroundBar *turnAroundBar)
{
    s16 temp, temp2, temp3, temp4;
    if (!PLAYER_IS_ALIVE) {
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
    Sprite *s = &turnAroundBar->s;
    MapEntity *me = turnAroundBar->base.me;
    if (sub_8073520(turnAroundBar) == 2) {
        sub_8073670(turnAroundBar);
    }

    if (sub_8073784(turnAroundBar)) {
        me->x = turnAroundBar->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8073760(turnAroundBar);
        sub_80051E8(s);
    }
}

static void sub_8073600(void)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(gCurTask);
    Sprite *s = &turnAroundBar->s;

    if (!PLAYER_IS_ALIVE) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    UpdateSpriteAnimation(s);
    sub_80051E8(s);

    if (s->unk10 & 0x4000) {
        sub_80736E0(turnAroundBar);
    }
}

static void TaskDestructor_InteractableTurnAroundBar(struct Task *t)
{
    Sprite_TurnAroundBar *turnAroundBar = TaskGetStructPtr(t);
    VramFree(turnAroundBar->s.graphics.dest);
}

static void sub_8073818(void);

static void sub_8073670(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_400000;
    turnAroundBar->unk44 = Q_24_8(turnAroundBar->y) - gPlayer.y;
    gPlayer.x = Q_24_8(turnAroundBar->x);
    gPlayer.y = Q_24_8(turnAroundBar->y);
    gPlayer.unk64 = 0x38;

    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 1;

    if (gPlayer.moveState & 1) {
        s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
    }
    UpdateSpriteAnimation(s);
    gCurTask->main = sub_8073818;
}

static void sub_80736E0(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 0;
    s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    gCurTask->main = Task_TurnAroundBarMain;
}

static void sub_807371C(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    Player_ClearMovestate_IsInScriptedSequence();
    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 0;
    s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    gCurTask->main = Task_TurnAroundBarMain;
}

static void sub_8073760(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    s->x = turnAroundBar->x - gCamera.x;
    s->y = turnAroundBar->y - gCamera.y;
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
    Sprite *s = &turnAroundBar->s;
    if (!PLAYER_IS_ALIVE) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    UpdateSpriteAnimation(s);
    sub_80051E8(s);

    if (s->unk10 & 0x4000) {
        sub_8073474(turnAroundBar);
    }
}
