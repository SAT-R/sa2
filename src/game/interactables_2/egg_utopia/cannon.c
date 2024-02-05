#include "core.h"

#include "game/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/cannon.h"

#include "lib/m4a.h"
#include "trig.h"
#include "game/math.h"

#include "constants/animations.h"
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
    struct Task *t = TaskCreate(Task_Interactable093, sizeof(Sprite_Cannon), 0x2010, 0,
                                TaskDestructor_Interactable093);
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
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;
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
    if (!PLAYER_IS_ALIVE || --cannon->unk6C == 0xFFFF
        || gPlayer.unk5E & (gPlayerControls.jump | gPlayerControls.attack)) {
        sub_807E408(cannon);
    } else {
        sub_807E56C(cannon);
    }

    sub_807E5F0(cannon);
}

static void sub_807E384(Sprite_Cannon *cannon)
{
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;
    m4aSongNumStart(SE_SPIN_ATTACK);

    if (cannon->unk68 == 0) {
        gPlayer.x = Q_24_8(cannon->x + 0x28);
        gPlayer.y = Q_24_8(cannon->y);
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.x = Q_24_8(cannon->x - 0x28);
        gPlayer.y = Q_24_8(cannon->y);
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
    gCurTask->main = sub_807E7B0;
}

static void sub_807E408(Sprite_Cannon *cannon)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.transition = PLTRANS_PT5;

        gPlayer.x += COS_24_8(cannon->unk6A) * 0x20;
        gPlayer.y += SIN_24_8(cannon->unk6A) * 0x20;
        gPlayer.speedAirX = COS_24_8(cannon->unk6A) * 0xF;
        gPlayer.speedAirY = SIN_24_8(cannon->unk6A) * 0xF;

        if (GRAVITY_IS_INVERTED) {
            gPlayer.speedAirY = -gPlayer.speedAirY;
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
    s32 val = Q_24_8(cannon->x);

    if (gPlayer.x > val) {
        gPlayer.x -= Q_24_8(1);

        if (gPlayer.x < val) {
            gPlayer.x = val;
        }
    } else if (gPlayer.x < val) {
        gPlayer.x += Q_24_8(1);

        if (gPlayer.x > val) {
            gPlayer.x = val;
        }

    } else {
        temp++;
    }

    val = Q_24_8(cannon->y);

    if (gPlayer.y > val) {
        gPlayer.y -= Q_24_8(1);

        if (gPlayer.y < val) {
            gPlayer.y = val;
        }
    } else if (gPlayer.y < val) {
        gPlayer.y += Q_24_8(1);

        if (gPlayer.y > val) {
            gPlayer.y = val;
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
    register s16 r0 asm("r0");
    s32 r1;

    r3 = cannon->unk68 == 0  ? cannon->unk6E == 0 ? 0x280 : 0x180
        : cannon->unk6E == 0 ? 0x80
                             : 0x380;
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
    transform.width = 0x100;
    transform.height = 0x100;
    transform.x = s->x;
    transform.y = s->y;

    s->unk10 = 0x2060 | gUnknown_030054B8++;
    if (cannon->unk68 == 0) {
        s->unk10 |= 0x400;
    }

    sub_8004860(s, &transform);
    DisplaySprite(s);
}

// (68.07%) https://decomp.me/scratch/TDVLh
NONMATCH("asm/non_matching/game/interactables_2/egg_utopia/sub_807E66C.inc",
         static bool32 sub_807E66C(Sprite_Cannon *cannon))
{
#ifndef NON_MATCHING
    register Sprite *s asm("r6") = &cannon->sprite2;
#else
    Sprite *s = &cannon->sprite2;
#endif
    s16 x, y;
    s32 biggerX, biggerY, temp2, temp3;
    s32 r4;
    s32 r3;
    s16 playerX, playerY;
    if (PLAYER_IS_ALIVE) {
        // Maybe log
        {
#ifndef NON_MATCHING
            register u16 r0 asm("r0") = cannon->unk68;
            asm("" ::"r"(r0));
#endif
        }

        x = cannon->x - gCamera.x;
        y = cannon->y - gCamera.y;
        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        biggerX = x;
        r4 = s->hitboxes[0].left;
        biggerX += r4;
        temp2 = playerX + gUnknown_03005AF0.s.hitboxes[0].left;
        if (((biggerX > temp2 || biggerX + (s->hitboxes[0].right - r4) >= temp2))
            && biggerX >= temp2
                    + (gUnknown_03005AF0.s.hitboxes[0].right
                       - gUnknown_03005AF0.s.hitboxes[0].left)) {
            biggerY = y;
            r4 = s->hitboxes[0].top;
            biggerY += r4;
            temp3 = playerY + gUnknown_03005AF0.s.hitboxes[0].top;
            if (((biggerY > temp3 || (biggerY) + (s->hitboxes[0].bottom - r4) >= temp3))
                && biggerY >= temp3
                        + (gUnknown_03005AF0.s.hitboxes[0].bottom
                           - gUnknown_03005AF0.s.hitboxes[0].top)) {
                return 1;
            }
        }
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

    if (IS_OUT_OF_GRAV_TRIGGER_RANGE(x, y)) {
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

static void sub_807E940(UNUSED Sprite_Cannon *cannon)
{
    gCurTask->main = Task_Interactable093;
}

static bool16 sub_807E954(Sprite_Cannon *cannon)
{
    bool16 ret = FALSE;
    u16 r3;
    s16 temp2, temp3;
    s32 mask;

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
