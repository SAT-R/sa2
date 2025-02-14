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
    u16 unk68;
    u16 unk6A;
    u16 unk6C;
    u16 unk6E;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Cannon;

static void Task_Interactable093(void);
static void TaskDestructor_Interactable093(struct Task *);
static void sub_807E56C(Sprite_Cannon *);
static void sub_807E5F0(Sprite_Cannon *);
static void sub_807E408(Sprite_Cannon *);
static bool16 sub_807E954(Sprite_Cannon *);
static void sub_807E940(Sprite_Cannon *);
static void sub_807E8FC(void);
static void sub_807E884(Sprite_Cannon *);
static void sub_807E834(Sprite_Cannon *cannon);
static void sub_807E86C(Sprite_Cannon *cannon);
static bool32 sub_807E898(Sprite_Cannon *cannon);
static void sub_807E8E0(Sprite_Cannon *cannon);
static void sub_807E7F8(void);
static void sub_807E7B0(void);

void CreateEntity_Cannon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Sprite *s;
    struct Task *t = TaskCreate(Task_Interactable093, sizeof(Sprite_Cannon), 0x2010, 0, TaskDestructor_Interactable093);
    Sprite_Cannon *cannon = TASK_DATA(t);
    cannon->unk68 = me->d.sData[0];
    cannon->x = TO_WORLD_POS(me->x, spriteRegionX);
    cannon->y = TO_WORLD_POS(me->y, spriteRegionY);
    cannon->me = me;
    cannon->spriteX = me->x;
    cannon->spriteY = spriteY;

    if (cannon->unk68 == 0) {
        cannon->unk6A = 0x200;
    } else {
        cannon->unk6A = 0;
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

static void sub_807E314(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE || --cannon->unk6C == 0xFFFF || gPlayer.frameInput & (gPlayerControls.jump | gPlayerControls.attack)) {
        sub_807E408(cannon);
    } else {
        sub_807E56C(cannon);
    }

    sub_807E5F0(cannon);
}

static void sub_807E384(Sprite_Cannon *cannon)
{
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;
    m4aSongNumStart(SE_SPIN_ATTACK);

    if (cannon->unk68 == 0) {
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
    gCurTask->main = sub_807E7B0;
}

static void sub_807E408(Sprite_Cannon *cannon)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.transition = PLTRANS_UNCURL;

        gPlayer.qWorldX += COS_24_8(cannon->unk6A) * 0x20;
        gPlayer.qWorldY += SIN_24_8(cannon->unk6A) * 0x20;
        gPlayer.qSpeedAirX = COS_24_8(cannon->unk6A) * 0xF;
        gPlayer.qSpeedAirY = SIN_24_8(cannon->unk6A) * 0xF;

        if (GRAVITY_IS_INVERTED) {
            gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
        }

        gPlayer.rotation = cannon->unk6A >> 2;
        gPlayer.timerInvulnerability = 4;
        m4aSongNumStart(SE_289);
    }

    cannon->unk6E = 0;
    gCurTask->main = sub_807E7F8;
}

static bool32 sub_807E4E4(Sprite_Cannon *cannon)
{
    u8 temp = 0;
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
        temp++;
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
        temp++;
    }

    return temp == 2 ? TRUE : FALSE;
}

static void sub_807E56C(Sprite_Cannon *cannon)
{
    u16 r3;
    s16 temp2;
    s16 temp3;
    s32 mask;
#ifndef NON_MATCHING
    register s16 r0 asm("r0");
#else
    s16 r0;
#endif
    s32 r1;

    r3 = (cannon->unk68 == 0) ? ((cannon->unk6E == 0) ? 0x280 : 0x180) : ((cannon->unk6E == 0) ? 0x80 : 0x380);
    temp2 = sub_808558C(cannon->unk6A, r3, 10);
    temp3 = temp2;

    if (abs(temp2) >= 5) {
        temp3 = -4;
        if (temp2 > 0) {
            temp3 = 4;
        }

    } else {
        cannon->unk6E ^= 1;
    }

    r0 = cannon->unk6A + temp3;
    mask = ONE_CYCLE;

#ifndef NON_MATCHING
    asm("add %0, %1, #0" : "=r"(r1) : "r"(mask) : "cc");
    r0 &= r1;
#else
    r0 &= mask;
#endif

    cannon->unk6A = r0;
}

static void sub_807E5F0(Sprite_Cannon *cannon)
{
    SpriteTransform transform;
    Sprite *s = &cannon->sprite2;
    s->x = cannon->x - gCamera.x;
    s->y = cannon->y - gCamera.y;

    transform.rotation = cannon->unk6A;
    transform.qScaleX = +Q(1);
    transform.qScaleY = +Q(1);
    transform.x = s->x;
    transform.y = s->y;

    s->frameFlags = 0x2060 | gUnknown_030054B8++;
    if (cannon->unk68 == 0) {
        s->frameFlags |= 0x400;
    }

    TransformSprite(s, &transform);
    DisplaySprite(s);
}

// (68.07%) https://decomp.me/scratch/TDVLh
// (72.09%) https://decomp.me/scratch/sgt5z
// (87.28%) https://decomp.me/scratch/pAFRx
NONMATCH("asm/non_matching/game/interactables_2/egg_utopia/sub_807E66C.inc", bool32 sub_807E66C(Sprite_Cannon *cannon))
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
        register u16 r0 asm("r0") = cannon->unk68;
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

static void Task_Interactable093(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);
    if (sub_807E66C(cannon)) {
        sub_807E384(cannon);
    }

    if (sub_807E898(cannon)) {
        sub_807E8E0(cannon);
    } else {
        sub_807E5F0(cannon);
    }
}

static void sub_807E7B0(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_807E86C(cannon);
    } else {
        if (sub_807E4E4(cannon)) {
            sub_807E834(cannon);
        }
    }
    sub_807E5F0(cannon);
}

static void sub_807E7F8(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (cannon->unk6E++ > 60) {
        sub_807E884(cannon);
    }

    sub_807E5F0(cannon);
}

static void TaskDestructor_Interactable093(struct Task *unused)
{
    // unused
}

static void sub_807E834(Sprite_Cannon *cannon)
{
    cannon->unk6C = 0x200;
    if (cannon->unk68 == 0) {
        cannon->unk6E = 0;
    } else {
        cannon->unk6E = 1;
    }

    gCurTask->main = sub_807E314;
}

static void sub_807E7F8(void);

static void sub_807E86C(Sprite_Cannon *cannon)
{
    cannon->unk6E = 0;
    gCurTask->main = sub_807E7F8;
}

static void sub_807E884(Sprite_Cannon *cannon) { gCurTask->main = sub_807E8FC; }

static bool32 sub_807E898(Sprite_Cannon *cannon)
{
    s16 x = cannon->x - gCamera.x;
    s16 y = cannon->y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_2(x, y)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807E8E0(Sprite_Cannon *cannon)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(cannon->me, cannon->spriteX);
    TaskDestroy(gCurTask);
}

static void sub_807E8FC(void)
{
    Sprite_Cannon *cannon = TASK_DATA(gCurTask);

    if (sub_807E954(cannon)) {
        sub_807E940(cannon);
    }

    if (sub_807E898(cannon)) {
        sub_807E8E0(cannon);
    } else {
        sub_807E5F0(cannon);
    }
}

static void sub_807E940(UNUSED Sprite_Cannon *cannon) { gCurTask->main = Task_Interactable093; }

static bool16 sub_807E954(Sprite_Cannon *cannon)
{
    bool16 ret = FALSE;
    u16 r3;
    s16 temp2, temp3;

    r3 = cannon->unk68 == 0 ? 0x200 : 0;
    temp2 = sub_808558C(cannon->unk6A, r3, 10);
    temp3 = temp2;

    if (abs(temp2) >= 5) {
        temp3 = -4;
        if (temp2 > 0) {
            temp3 = 4;
        }

    } else {
        ret = TRUE;
    }

    cannon->unk6A = CLAMP_SIN_PERIOD(cannon->unk6A + temp3);

    return ret;
}
