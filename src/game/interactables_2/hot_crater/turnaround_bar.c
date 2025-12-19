#include <stdlib.h> // abs

#include "global.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/turnaround_bar.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/char_states.h"
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

void CreateEntity_TurnAroundBar(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_TurnAroundBarMain, sizeof(Sprite_TurnAroundBar), 0x2010, 0, TaskDestructor_InteractableTurnAroundBar);
    Sprite_TurnAroundBar *turnAroundBar = TASK_DATA(t);
    Sprite *s = &turnAroundBar->s;

    turnAroundBar->base.regionX = spriteRegionX;
    turnAroundBar->base.regionY = spriteRegionY;
    turnAroundBar->base.me = me;
    turnAroundBar->base.meX = me->x;
    turnAroundBar->base.id = spriteY;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
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

    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.qWorldY -= turnAroundBar->unk44;

    if (gPlayer.qSpeedGround > 0) {
        gPlayer.qWorldX = Q(turnAroundBar->x - 6);
        gPlayer.qSpeedGround += Q_8_8(1.25);
    } else {
        gPlayer.qWorldX = Q(turnAroundBar->x + 6);
        gPlayer.qSpeedGround -= Q_8_8(1.25);
    }

    gPlayer.qSpeedGround = ClampSpeed(-gPlayer.qSpeedGround);
    gPlayer.rotation = 0;
    gPlayer.qSpeedAirY = 0;
    gPlayer.moveState = gPlayer.moveState ^ 1;
    gPlayer.transition = PLTRANS_TOUCH_GROUND;

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
    temp2 = I(gPlayer.qWorldX) - gCamera.x;
    temp4 = I(gPlayer.qWorldY) - gCamera.y;
    if (temp - 6 <= temp2 && temp + 6 >= temp2) {
        if (temp3 - 32 <= temp4 && temp3 >= temp4) {
            if (abs(gPlayer.qSpeedGround) < Q_8_8(4)) {
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
    Sprite_TurnAroundBar *turnAroundBar = TASK_DATA(gCurTask);
    Sprite *s = &turnAroundBar->s;
    MapEntity *me = turnAroundBar->base.me;
    if (sub_8073520(turnAroundBar) == 2) {
        sub_8073670(turnAroundBar);
    }

    if (sub_8073784(turnAroundBar)) {
        me->x = turnAroundBar->base.meX;
        TaskDestroy(gCurTask);
    } else {
        sub_8073760(turnAroundBar);
        DisplaySprite(s);
    }
}

static void sub_8073600(void)
{
    Sprite_TurnAroundBar *turnAroundBar = TASK_DATA(gCurTask);
    Sprite *s = &turnAroundBar->s;

    if (!PLAYER_IS_ALIVE) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (s->frameFlags & 0x4000) {
        sub_80736E0(turnAroundBar);
    }
}

static void TaskDestructor_InteractableTurnAroundBar(struct Task *t)
{
    Sprite_TurnAroundBar *turnAroundBar = TASK_DATA(t);
    VramFree(turnAroundBar->s.graphics.dest);
}

static void sub_8073818(void);

static void sub_8073670(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    turnAroundBar->unk44 = Q(turnAroundBar->y) - gPlayer.qWorldY;
    gPlayer.qWorldX = Q(turnAroundBar->x);
    gPlayer.qWorldY = Q(turnAroundBar->y);
    gPlayer.charState = CHARSTATE_TURNAROUND_BAR;

    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 1;

    if (gPlayer.moveState & 1) {
        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    }
    UpdateSpriteAnimation(s);
    gCurTask->main = sub_8073818;
}

static void sub_80736E0(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 0;
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    gCurTask->main = Task_TurnAroundBarMain;
}

static void sub_807371C(Sprite_TurnAroundBar *turnAroundBar)
{
    Sprite *s = &turnAroundBar->s;
    Player_ClearMovestate_IsInScriptedSequence();
    s->graphics.anim = SA2_ANIM_TURNAROUND_BAR;
    s->variant = 0;
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
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

    if (temp4 < -128 || temp4 > (DISPLAY_WIDTH + 128) || temp3 < -128 || temp3 > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }

    return FALSE;
}

static s16 ClampSpeed(s16 speed)
{
    if (gPlayer.isBoosting != 0) {
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
    Sprite_TurnAroundBar *turnAroundBar = TASK_DATA(gCurTask);
    Sprite *s = &turnAroundBar->s;
    if (!PLAYER_IS_ALIVE) {
        sub_807371C(turnAroundBar);
        return;
    }
    sub_8073760(turnAroundBar);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (s->frameFlags & 0x4000) {
        sub_8073474(turnAroundBar);
    }
}
