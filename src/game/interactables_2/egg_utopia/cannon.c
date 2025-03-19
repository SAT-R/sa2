#include <stdlib.h> // abs

#include "core.h"

#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/cannon.h"

#include "lib/m4a/m4a.h"
#include "trig.h"
#include "game/math.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    // Completely unused, maybe the base?
    Sprite sprite1;

    Sprite sprite2;
    s32 x;
    s32 y;
    u16 facingRight;
    u16 qCannonAngle;
    u16 fireTimeout;
    u16 unk6E;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Cannon;

static void Task_Idle(void);
static void TaskDestructor_Interactable093(struct Task *);
static void HandleMovement(Sprite_Cannon *);
static void Render(Sprite_Cannon *);
static void Fire(Sprite_Cannon *);
static bool16 HandleResetMovement(Sprite_Cannon *);
static void HandleSetIdle(Sprite_Cannon *);
static void Task_Reset(void);
static void StartReset(Sprite_Cannon *);
static void Task_ActivateCannon(Sprite_Cannon *cannon);
static void HandleDeathWhilstActivating(Sprite_Cannon *cannon);
static bool32 ShouldDespawn(Sprite_Cannon *cannon);
static void Despawn(Sprite_Cannon *cannon);
static void Task_IdleBeforeReset(void);
static void Task_Activating(void);

void CreateEntity_Cannon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Sprite *s;
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_Cannon), 0x2010, 0, TaskDestructor_Interactable093);
    Sprite_Cannon *cannon = TASK_DATA(t);
    cannon->facingRight = me->d.sData[0];
    cannon->x = TO_WORLD_POS(me->x, spriteRegionX);
    cannon->y = TO_WORLD_POS(me->y, spriteRegionY);
    cannon->me = me;
    cannon->spriteX = me->x;
    cannon->spriteY = spriteY;

    if (!cannon->facingRight) {
        cannon->qCannonAngle = Q(2);
    } else {
        cannon->qCannonAngle = 0;
    }

    s = &cannon->sprite2;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x2C80;

    // TODO: anim cannon?
    s->graphics.anim = SA2_ANIM_CANNON;
    s->variant = 1;
    UpdateSpriteAnimation(s);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_Active(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE || --cannon->fireTimeout == (u16)-1 || gPlayer.frameInput & (gPlayerControls.jump | gPlayerControls.attack)) {
        Fire(cannon);
    } else {
        HandleMovement(cannon);
    }

    Render(cannon);
}

static void HandlePlayerEnter(Sprite_Cannon *cannon)
{
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;
    m4aSongNumStart(SE_SPIN_ATTACK);

    if (!cannon->facingRight) {
        gPlayer.qWorldX = Q(cannon->x + 40);
        gPlayer.qWorldY = Q(cannon->y);
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.qWorldX = Q(cannon->x - 40);
        gPlayer.qWorldY = Q(cannon->y);
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    gCurTask->main = Task_Activating;
}

static void Fire(Sprite_Cannon *cannon)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.transition = PLTRANS_UNCURL;

        gPlayer.qWorldX += COS_24_8(cannon->qCannonAngle) * 32;
        gPlayer.qWorldY += SIN_24_8(cannon->qCannonAngle) * 32;
        gPlayer.qSpeedAirX = COS_24_8(cannon->qCannonAngle) * 15;
        gPlayer.qSpeedAirY = SIN_24_8(cannon->qCannonAngle) * 15;

        if (GRAVITY_IS_INVERTED) {
            gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
        }

        gPlayer.rotation = cannon->qCannonAngle >> 2;
        gPlayer.timerInvulnerability = 4;
        m4aSongNumStart(SE_289);
    }

    cannon->unk6E = 0;
    gCurTask->main = Task_IdleBeforeReset;
}

static bool32 MovePlayerIntoCannon(Sprite_Cannon *cannon)
{
    u8 conditionsMet = 0;
    s32 val = Q(cannon->x);

    if (gPlayer.qWorldX > val) {
        gPlayer.qWorldX -= Q(1);

        if (gPlayer.qWorldX < val) {
            gPlayer.qWorldX = val;
        }
    } else if (gPlayer.qWorldX < val) {
        gPlayer.qWorldX += Q(1);

        if (gPlayer.qWorldX > val) {
            gPlayer.qWorldX = val;
        }

    } else {
        conditionsMet++;
    }

    val = Q(cannon->y);

    if (gPlayer.qWorldY > val) {
        gPlayer.qWorldY -= Q(1);

        if (gPlayer.qWorldY < val) {
            gPlayer.qWorldY = val;
        }
    } else if (gPlayer.qWorldY < val) {
        gPlayer.qWorldY += Q(1);

        if (gPlayer.qWorldY > val) {
            gPlayer.qWorldY = val;
        }

    } else {
        conditionsMet++;
    }

    return conditionsMet == 2 ? TRUE : FALSE;
}

static void HandleMovement(Sprite_Cannon *cannon)
{
    u16 r3;
    s16 temp2;
    s16 temp3;

    r3 = (!cannon->facingRight) ? ((cannon->unk6E == 0) ? DEG_TO_SIN(225) : DEG_TO_SIN(135))
                                : ((cannon->unk6E == 0) ? DEG_TO_SIN(45) : DEG_TO_SIN(315));
    temp2 = sub_808558C(cannon->qCannonAngle, r3, 10);
    temp3 = temp2;

    if (abs(temp2) >= 5) {
        temp3 = -4;
        if (temp2 > 0) {
            temp3 = 4;
        }

    } else {
        cannon->unk6E ^= 1;
    }

    cannon->qCannonAngle = CLAMP_SIN_PERIOD(cannon->qCannonAngle + temp3);
}

static void Render(Sprite_Cannon *cannon)
{
    SpriteTransform transform;
    Sprite *s = &cannon->sprite2;
    s->x = cannon->x - gCamera.x;
    s->y = cannon->y - gCamera.y;

    transform.rotation = cannon->qCannonAngle;
    transform.qScaleX = +Q(1);
    transform.qScaleY = +Q(1);
    transform.x = s->x;
    transform.y = s->y;

    s->frameFlags = 0x2060 | gUnknown_030054B8++;
    if (!cannon->facingRight) {
        s->frameFlags |= 0x400;
    }

    TransformSprite(s, &transform);
    DisplaySprite(s);
}

// (68.07%) https://decomp.me/scratch/TDVLh
// (72.09%) https://decomp.me/scratch/sgt5z
// (87.28%) https://decomp.me/scratch/pAFRx
NONMATCH("asm/non_matching/game/interactables_2/egg_utopia/cannon__IsPlayerTouching.inc", bool32 IsPlayerTouching(Sprite_Cannon *cannon))
{
    s16 x;
    s16 y;
    s32 biggerX, biggerY, temp2, temp3;
    s32 r4;
    s16 playerX, playerY;
#ifndef NON_MATCHING
    register Sprite_Cannon *r3 asm("r3") = cannon;
#else
    Sprite_Cannon *r3 = cannon;
#endif
    Sprite *s2 = &r3->sprite2;
    if (!PLAYER_IS_ALIVE) {
        return 0;
    }
    // Maybe log
    {
#ifndef NON_MATCHING
        register u16 r0 asm("r0") = cannon->facingRight;
        asm("" ::"r"(r0));
#endif
    }

    x = r3->x - gCamera.x;
    y = r3->y - gCamera.y;
    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;

    // gPlayerBodyPSI.s.hitboxes[0] s-<hitboxes[0]
    if (HB_COLLISION(x, y, s2->hitboxes[0], playerX, playerY, gPlayerBodyPSI.s.hitboxes[0])) {
        return 1;
    }

    return 0;
}
END_NONMATCH

static void Task_Idle(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);
    if (IsPlayerTouching(cannon)) {
        HandlePlayerEnter(cannon);
    }

    if (ShouldDespawn(cannon)) {
        Despawn(cannon);
    } else {
        Render(cannon);
    }
}

static void Task_Activating(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        HandleDeathWhilstActivating(cannon);
    } else if (MovePlayerIntoCannon(cannon)) {
        Task_ActivateCannon(cannon);
    }
    Render(cannon);
}

static void Task_IdleBeforeReset(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (cannon->unk6E++ > 60) {
        StartReset(cannon);
    }

    Render(cannon);
}

static void TaskDestructor_Interactable093(struct Task *unused)
{
    // unused
}

static void Task_ActivateCannon(Sprite_Cannon *cannon)
{
    cannon->fireTimeout = 512;
    if (!cannon->facingRight) {
        cannon->unk6E = 0;
    } else {
        cannon->unk6E = 1;
    }

    gCurTask->main = Task_Active;
}

static void HandleDeathWhilstActivating(Sprite_Cannon *cannon)
{
    cannon->unk6E = 0;
    gCurTask->main = Task_IdleBeforeReset;
}

static void StartReset(Sprite_Cannon *cannon) { gCurTask->main = Task_Reset; }

static bool32 ShouldDespawn(Sprite_Cannon *cannon)
{
    s16 x = cannon->x - gCamera.x;
    s16 y = cannon->y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_2(x, y)) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_Cannon *cannon)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(cannon->me, cannon->spriteX);
    TaskDestroy(gCurTask);
}

static void Task_Reset(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (HandleResetMovement(cannon)) {
        HandleSetIdle(cannon);
    }

    if (ShouldDespawn(cannon)) {
        Despawn(cannon);
    } else {
        Render(cannon);
    }
}

static void HandleSetIdle(UNUSED Sprite_Cannon *cannon) { gCurTask->main = Task_Idle; }

static bool16 HandleResetMovement(Sprite_Cannon *cannon)
{
    bool16 ret = FALSE;
    u16 r3;
    s16 temp2, temp3;

    r3 = cannon->facingRight == 0 ? DEG_TO_SIN(180) : DEG_TO_SIN(0);
    temp2 = sub_808558C(cannon->qCannonAngle, r3, 10);
    temp3 = temp2;

    if (abs(temp2) >= 5) {
        temp3 = -4;
        if (temp2 > 0) {
            temp3 = 4;
        }

    } else {
        ret = TRUE;
    }

    cannon->qCannonAngle = CLAMP_SIN_PERIOD(cannon->qCannonAngle + temp3);

    return ret;
}
