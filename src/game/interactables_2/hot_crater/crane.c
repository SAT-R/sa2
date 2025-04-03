#include <stdlib.h> // abs

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "lib/m4a/m4a.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/crane.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u8 filler6[2];
    /* 0x08 */ u16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler16[2];

    /* 0x18 */ s32 screenX;
    /* 0x1C */ s32 screenY;
} CraneStruct;

typedef struct {
    /* 0x00 */ u32 unk0;
    /* 0x04 */ s16 accelY;
    /* 0x06 */ s16 unk6;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
} unk1B8; /* size: 0x0C */

typedef struct {
    /* 0x000 */ s32 posX;
    /* 0x004 */ s32 posY;
    /* 0x008 */ CraneStruct cs[9];
    /* 0x128 */ Sprite unk128;
    /* 0x158 */ Sprite unk158;
    /* 0x188 */ Sprite unk188;
    /* 0x1B8 */ unk1B8 unk1B8;

    /* 0x1C4 */ MapEntity *me;
    /* 0x1C8 */ u8 spriteX;
    /* 0x1C9 */ u8 spriteY;
} Sprite_HCCrane; /* size: 0x1CC */

static void Task_8073AA8(void);
static void Task_8073B1C(void);
static void TaskDestructor_80743B8(struct Task *);
static void sub_8074088(Sprite_HCCrane *);
static void sub_8074138(Sprite_HCCrane *);
static void sub_80741B4(Sprite_HCCrane *);
static bool32 sub_8074260(Sprite_HCCrane *);
static void sub_80742A8(Sprite_HCCrane *);
static bool32 sub_807432C(Sprite_HCCrane *);
static void sub_80743BC(Sprite_HCCrane *);
static void sub_80743E4(Sprite_HCCrane *);
static void sub_8074400(Sprite_HCCrane *);
static u16 sub_8074448(Sprite_HCCrane *, u16);
static void sub_807447C(Sprite_HCCrane *);
static void sub_8074490(Sprite_HCCrane *, s16);
static bool32 sub_80744D0(Sprite_HCCrane *, s16);
static bool32 sub_80744E0(Sprite_HCCrane *, u16, s16);
static void sub_8074550(Sprite_HCCrane *);
static bool32 sub_80745B4(Sprite_HCCrane *);
static void sub_8074604(Sprite_HCCrane *);

#define CRANE_MAX_ACCELERATION (Q_8_8(12))

void CreateEntity_Crane(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8073AA8, sizeof(Sprite_HCCrane), 0x2010, 0, TaskDestructor_80743B8);
    Sprite_HCCrane *crane = TASK_DATA(t);
    CraneStruct *cs;
    u16 i;

    crane->unk1B8.unk0 = 0;
    crane->posX = TO_WORLD_POS(me->x, spriteRegionX);
    crane->posY = TO_WORLD_POS(me->y, spriteRegionY);
    crane->me = me;
    crane->spriteX = crane->me->x;
    crane->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    cs = &crane->cs[0];
    cs->s = &crane->unk128;
    cs->unk4 = 5;
    cs->unk8 = 0x200;
    cs->unkC = 0;
    cs->unk10 = 0;
    cs->s->oamFlags = SPRITE_OAM_ORDER(18);

    cs->s->graphics.size = 0;
    cs->s->animCursor = 0;
    cs->s->qAnimDelay = 0;
    cs->s->prevVariant = -1;
    cs->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    cs->s->palId = 0;
    cs->s->hitboxes[0].index = -1;
    cs->s->frameFlags = 0x2000;
    cs->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2BC0);
    cs->s->graphics.anim = SA2_ANIM_CRANE;
    cs->s->variant = 0;
    UpdateSpriteAnimation(cs->s);

    for (i = 0; i < 6; i++) {
        cs = &crane->cs[1 + i];
        cs->unk4 = 0;

        if (i == 0) {
            cs->unk4 = 2;
            cs->s = NULL;
            cs->unk8 = 0;
            cs->unkC = 0x2C00;
            cs->unk10 = 0;
        } else {
            cs->s = &crane->unk188;
            cs->unk8 = 0;
            cs->unkC = 0;
            cs->unk10 = 0xC00;

            if (i == 1) {
                cs->unk4 = 4;
                cs->s->oamFlags = SPRITE_OAM_ORDER(18);

                cs->s->graphics.size = 0;
                cs->s->animCursor = 0;
                cs->s->qAnimDelay = 0;
                cs->s->prevVariant = -1;
                cs->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
                cs->s->palId = 0;
                cs->s->hitboxes[0].index = -1;
                cs->s->frameFlags = 0x2000;
                cs->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2B80);
                cs->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
                cs->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_GREY;
                UpdateSpriteAnimation(cs->s);
            }
        }
    }

    { // Hook
        cs = &crane->cs[7];
        cs->s = &crane->unk158;

        cs->unk4 = 5;
        cs->unk8 = 0x100;
        cs->unkC = 0;

        cs->unk10 = 0xC00;
        cs->s->oamFlags = SPRITE_OAM_ORDER(18);
        cs->s->graphics.size = 0;
        cs->s->animCursor = 0;
        cs->s->qAnimDelay = 0;
        cs->s->prevVariant = -1;
        cs->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        cs->s->palId = 0;
        cs->s->hitboxes[0].index = -1;
        cs->s->frameFlags = 0x2000;
        cs->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
        cs->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
        cs->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_HOOK;
        UpdateSpriteAnimation(cs->s);

        cs = &crane->cs[8];
        cs->s = NULL;
        cs->unk4 = 2;
        cs->unk8 = 0;
        cs->unkC = 0x1000;
        cs->unk10 = 0;
    }
    sub_807447C(crane);
}

static void Task_8073AA8()
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    sub_8074260(crane);

    if (crane->cs[7].unk8 != 0x100) {
        if (crane->cs[7].unk8 > 0x100) {
            crane->cs[7].unk8--;
        } else {
            crane->cs[7].unk8++;
        }
    }

    sub_807447C(crane);
    sub_80741B4(crane);
    if (sub_807432C(crane)) {
        sub_8074088(crane);
    }
    if (sub_80745B4(crane)) {
        sub_8074604(crane);
    } else {
        sub_80742A8(crane);
    }
}

static void Task_8073B1C(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.timerInvulnerability == 120)) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        crane->unk1B8.unk0 = 0;
    }

    {
        u16 r0;
        r0 = (((u16)crane->unk1B8.unk6 - (u16)crane->unk1B8.unk8) >> 4);

        if (r0 > 384)
            r0 = 384;
        else if (r0 < 64) {
            r0 = 64;
        }

        crane->unk1B8.unk8 += r0;
        crane->cs[0].unk8 = 512 - ((u16)crane->unk1B8.unk8 >> 6);
    }

    if ((u16)crane->unk1B8.unk6 <= (u16)crane->unk1B8.unk8) {
        sub_80743BC(crane);
    }

    sub_807447C(crane);
    sub_80741B4(crane);
    sub_8074550(crane);
    sub_80742A8(crane);
}

static void Task_8073BD4(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.timerInvulnerability == 120)) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        crane->unk1B8.unk0 = 0;
    }

    {
        u16 r3;

        if (crane->unk1B8.unk6 > (64 - 1)) {
            r3 = 64;
            crane->unk1B8.unk6 -= 64;
        } else {
            r3 = crane->unk1B8.unk6;
            crane->unk1B8.unk6 = 0;
        }

        crane->cs[0].unk8 += r3;
    }

    if (crane->unk1B8.unk6 == 0) {
        sub_8074138(crane);
    }

    sub_807447C(crane);
    sub_80741B4(crane);
    sub_8074550(crane);
    sub_80742A8(crane);
}

static void Task_8073C6C(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    result_744D0 = sub_80744D0(crane, crane->unk1B8.unk6);

    sub_8074490(crane, crane->unk1B8.unk6 >> 4);
    sub_807447C(crane);
    r1 = sub_8074448(crane, 7) - 256;

    if (r1 != 0) {
        u16 r2;
        s32 r0 = (crane->unk1B8.unk6 >> 8);
        r2 = (r0 < 0) ? -r0 : r0;

        if (r2 == 0)
            r2 = 1;

        if (r1 <= (512 - 1)) {
            if (r2 > r1) {
                r1 = 0;
            } else {
                r1 = r1 - r2;
            }
        } else if (r2 <= 1024 - r1) {
            r1 = r1 + r2;
        } else {
            r1 = 0;
        }

        {
            u32 newR0 = r1 + 256;
            crane->cs[7].unk8 = newR0 & (1024 - 1);
        }
    }

    sub_80741B4(crane);
    crane->unk1B8.unk6 += 42;

    if ((crane->unk1B8.unk6 > 0) || (result_744D0 == FALSE))
        sub_80743E4(crane);

    sub_80742A8(crane);

    crane->unk1B8.unk8++;
}

static void Task_8073D48(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    sub_8074260(crane);

    result_744D0 = sub_80744D0(crane, crane->unk1B8.unk6);

    sub_8074490(crane, crane->unk1B8.unk6 >> 4);
    sub_807447C(crane);
    r1 = sub_8074448(crane, 7) - 256;

    if (r1 != 512) {
        u16 r4;
        s32 r0 = (crane->unk1B8.unk6 >> 8);
        r4 = (r0 < 0) ? -r0 : r0;

        if (r4 == 0)
            r4 = 1;

        if (r1 <= (512 - 1)) {
            if (r4 > 512 - r1) {
                r1 = 512;
            } else {
                r1 = r1 + r4;
            }
        } else if (r4 <= r1 - 512) {
            r1 = r1 - r4;
        } else {
            r1 = 512;
        }

        {
            u32 newR0 = r1 + 256;
            crane->cs[7].unk8 = newR0 & (1024 - 1);
        }
    }

    sub_80741B4(crane);
    crane->unk1B8.unk6 += 42;

    if (result_744D0 == FALSE)
        sub_8074400(crane);

    sub_80742A8(crane);
}

static void Task_8073E20(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);
    sub_8074260(crane);
    sub_807447C(crane);

    // TODO: Fix cast... maybe unk1B8.unk8 is a Q_16_16?
    if (crane->unk1B8.unk8 != 0 || crane->unk1B8.unkA != 0) {
        s16 r2;

        if (crane->unk1B8.unk6 == 0) {
            s32 temp = -crane->unk1B8.unkA;
            s32 temp2 = -crane->unk1B8.unk8;
            r2 = (temp - temp2) >> 4;

            if (r2 > -32) {
                r2 = -32;
            }

            crane->cs[7].unk8 = ((temp2 - temp) >> 4) + 256;
        } else if (crane->unk1B8.unk8 == 0) {
            if (crane->unk1B8.unkA > 0) {
                if (crane->unk1B8.unkA > 32) {
                    r2 = -32;
                } else {
                    r2 = -crane->unk1B8.unkA;
                }
            } else {
                if (crane->unk1B8.unkA < -32) {
                    r2 = 32;
                } else {
                    r2 = -crane->unk1B8.unkA;
                }
            }
        } else if (crane->unk1B8.unk8 > 0) {
            if (crane->unk1B8.unkA > 0) {
                r2 = (crane->unk1B8.unk8 - crane->unk1B8.unkA) >> 4;
                if (r2 < 32)
                    r2 = 32;
            } else {
                s32 tempa = crane->unk1B8.accelY;
                s32 tempb = crane->unk1B8.unkA;
                r2 = ((tempb - tempa)) >> 4;
                if (r2 < 32)
                    r2 = 32;
            }
        } else if (crane->unk1B8.unkA > 0) {
            r2 = (crane->unk1B8.unkA - crane->unk1B8.accelY) >> 4;

            if (r2 > -32) {
                r2 = -32;
            }
        } else {
            s32 tempa = crane->unk1B8.unkA;
            s32 tempb = crane->unk1B8.unk8;
            r2 = (tempb - tempa) >> 4;

            if (r2 > -32)
                r2 = -32;
        }

        crane->unk1B8.unkA += r2;

        if (((crane->unk1B8.unk8 > 0) && (crane->unk1B8.unk8 <= crane->unk1B8.unkA))
            || ((crane->unk1B8.unk8 < 0) && (crane->unk1B8.unk8 >= crane->unk1B8.unkA))) {
            u16 unk8 = crane->unk1B8.unk8;
            crane->unk1B8.unkA = unk8;
            crane->unk1B8.accelY = unk8;

            // crane->unk1B8.unk8 *= -0.75;
            crane->unk1B8.unk8 = -((crane->unk1B8.unk8 * 3) >> 2);

            if (crane->unk1B8.unk8 != 0) {
                if (abs(crane->unk1B8.unk8) <= 128)
                    crane->unk1B8.unk8 = 0;
            } else {
                crane->unk1B8.unkA = 0;
            }
            crane->unk1B8.unk6++;
        }

        crane->cs[1].unk8 += ((crane->unk1B8.unkA >> 5));
        crane->cs[1].unk8 = CLAMP_SIN_PERIOD(crane->cs[1].unk8);
    }

    if (crane->unk1B8.unk8 == 0 && crane->unk1B8.unkA == 0) {
        gCurTask->main = Task_8073AA8;
    }

    {
        s32 temp = crane->unk1B8.unk8;
        if (temp < 0)
            temp = -temp;

        if (temp <= 1024) {
            if (sub_807432C(crane)) {
                sub_807447C(crane);
                sub_8074088(crane);
            }

            if (sub_80745B4(crane)) {
                crane->me->x = crane->spriteX;
                TaskDestroy(gCurTask);
                return;
            }
        }

        sub_80741B4(crane);
        if (sub_80745B4(crane)) {
            sub_8074604(crane);
        } else {
            sub_80742A8(crane);
        }
    }
}

static void sub_8074088(Sprite_HCCrane *crane)
{
    s16 v;

    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    Player_SetSpriteOffsetY(&gPlayer, 9);

    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 9;
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_HANGING;

    sub_8074550(crane);
    crane->unk1B8.unk0 = 1;
    crane->unk1B8.accelY = (u16)gPlayer.qSpeedAirY * 2;

    CLAMP_INLINE(crane->unk1B8.accelY, Q_8_8(7.5), Q_8_8(12));

    v = (crane->unk1B8.accelY >> 2) * 15;
    crane->unk1B8.unk6 = v;
    crane->unk1B8.unk8 = 0;

    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    gCurTask->main = Task_8073B1C;
}

static void sub_8074138(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && crane->unk1B8.unk0 != 0) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.charState = CHARSTATE_SPRING_B;
        gPlayer.transition = PLTRANS_PT7;
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedAirY = -crane->unk1B8.accelY;
        crane->unk1B8.unk0 = 0;
    }

    crane->unk1B8.unk6 = -crane->unk1B8.accelY;
    crane->unk1B8.unk8 = 0;

    gCurTask->main = Task_8073C6C;
}

static void sub_80741B4(Sprite_HCCrane *crane)
{
    s32 screenX, screenY;
    u8 i;
    u32 sinIndex = 0;

    screenX = Q(crane->posX - gCamera.x);
    screenY = Q(crane->posY - gCamera.y);

    for (i = 0; i < ARRAY_COUNT(crane->cs); i++) {
        CraneStruct *cs = &crane->cs[i];
        s16 cos = Q_2_14_TO_Q_24_8(COS(sinIndex));
        s32 cosV2 = I((signed)cs->unkC * cos);
        s16 sin = Q_2_14_TO_Q_24_8(SIN(sinIndex));
        s32 sinV2 = I(cs->unk10 * sin);
        s32 diff, temp;
#ifndef NON_MATCHING
        register u32 mask asm("r1");
#else
        u32 mask;
#endif

        diff = cosV2 - sinV2;
        screenX += diff;

        temp = I(cs->unkC * sin);

        screenY += temp + I(cs->unk10 * cos);
        sinIndex += cs->unk8;
        mask = ONE_CYCLE;
        sinIndex &= ONE_CYCLE;
        {
            asm("" ::"r"(mask));
            cs->unk14 = sinIndex;
            cs->screenX = screenX;
            cs->screenY = screenY;
        }
    }
}

static bool32 sub_8074260(Sprite_HCCrane *crane)
{
    CraneStruct *cs = &crane->cs[0];

    if (cs->unk8 == 512) {
        return TRUE;
    } else if (cs->unk8 > 512) {
        if (--cs->unk8 <= 512) {
            cs->unk8 = 512;
            return TRUE;
        }
    } else {
        if (++cs->unk8 >= 512) {
            cs->unk8 = 512;
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_80742A8(Sprite_HCCrane *crane)
{
    SpriteTransform transform;
    u8 i;
    for (i = 0; i < ARRAY_COUNT(crane->cs); i++) {
        CraneStruct *cs = &crane->cs[i];

        if (!(cs->unk4 & 0x2)) {
            cs->s->x = I(cs->screenX);
            cs->s->y = I(cs->screenY);

            if (cs->unk4 & 0x1) {
                transform.rotation = cs->unk14;
                transform.qScaleX = +Q(1);
                transform.qScaleY = +Q(1);

                transform.x = cs->s->x;
                transform.y = cs->s->y;

                cs->s->frameFlags = gUnknown_030054B8++ | 0x00002060;

                TransformSprite(cs->s, &transform);
            }
            DisplaySprite(cs->s);
        }
    }
}

static bool32 sub_807432C(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        if ((gPlayer.moveState & MOVESTATE_IN_AIR) && (gPlayer.qSpeedAirY > 0)) {
            s16 screenX = I(crane->cs[7].screenX);
            s16 screenY = I(crane->cs[7].screenY);
            s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
            s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

            if (((screenX - 24) <= playerX) && ((screenX + 24) >= playerX) && ((screenY - 24) <= playerY) && ((screenY + 24) >= playerY)) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

static void TaskDestructor_80743B8(struct Task *t) { }

static void sub_80743BC(Sprite_HCCrane *crane)
{
    crane->unk1B8.unk6 = (512 - crane->cs[0].unk8) << 1;
    gCurTask->main = Task_8073BD4;
}

static void sub_80743E4(Sprite_HCCrane *crane)
{
    crane->unk1B8.unk6 = 0;
    gCurTask->main = Task_8073D48;
}

static void sub_8074400(Sprite_HCCrane *crane)
{
    crane->unk1B8.unk6 = 0;

    crane->unk1B8.unk8 = (256 - crane->cs[7].unk8) << 4;

    crane->unk1B8.unkA = 0;
    crane->unk1B8.accelY = 0;
    gCurTask->main = Task_8073E20;
}

static u16 sub_8074448(Sprite_HCCrane *crane, u16 max)
{
    u16 result = 0;
    u8 i;

    for (i = 0; i <= max; i++) {
        result = (result + crane->cs[i].unk8) & (1024 - 1);
    }

    return result;
}

static void sub_807447C(Sprite_HCCrane *crane)
{
    u32 r2 = crane->cs[0].unk8;

    crane->cs[1].unk8 = (1024 - r2) & (1024 - 1);
}

static void sub_8074490(Sprite_HCCrane *crane, s16 p1)
{
    u8 i;

    for (i = 2; i < (ARRAY_COUNT(crane->cs) - 1); i++) {
        CraneStruct *cs = &crane->cs[i];

        cs->unk10 += p1;
        if (cs->unk10 > CRANE_MAX_ACCELERATION) {
            cs->unk10 = CRANE_MAX_ACCELERATION;
        } else if (cs->unk10 < -CRANE_MAX_ACCELERATION) {
            cs->unk10 = -CRANE_MAX_ACCELERATION;
        }
    }
}

static bool32 sub_80744D0(Sprite_HCCrane *crane, s16 p1) { return sub_80744E0(crane, 7, p1); }

static bool32 sub_80744E0(Sprite_HCCrane *crane, u16 index, s16 p2)
{
    s32 v, w;

    CraneStruct *cs = &crane->cs[index];

    w = cs->unk10 + p2;
    v = (w < 0) ? -w : w;

    if (v <= CRANE_MAX_ACCELERATION) {
        cs->unk10 = w;
        return TRUE;
    } else {
        s16 r3;
        if (p2 > 0) {
            r3 = w - CRANE_MAX_ACCELERATION;
            cs->unk10 = CRANE_MAX_ACCELERATION;
        } else {
            r3 = w + CRANE_MAX_ACCELERATION;
            cs->unk10 = -CRANE_MAX_ACCELERATION;
        }

        if (--index != 1)
            return sub_80744E0(crane, index, r3);
        else
            return FALSE;
    }
}

static void sub_8074550(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (crane->unk1B8.unk0 != 0)) {
        gPlayer.qWorldY = crane->cs[8].screenY + Q(gCamera.y + 24);

        if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
            gPlayer.qWorldX = crane->cs[8].screenX + Q(gCamera.x + 6);
        } else {
            gPlayer.qWorldX = crane->cs[8].screenX + Q(gCamera.x - 6);
        }
    }
}

static bool32 sub_80745B4(Sprite_HCCrane *crane)
{
    s16 screenX, screenY;
    screenX = crane->posX - gCamera.x;
    screenY = crane->posY - gCamera.y;

    // TODO: Replace constants!
    if (((screenX + 64) < -128) || ((screenX - 64) > (DISPLAY_WIDTH + 128)) || ((screenY + 64) < -128)
        || ((screenY - 64) > (DISPLAY_HEIGHT + 128))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8074604(Sprite_HCCrane *crane)
{
    crane->me->x = crane->spriteX;
    TaskDestroy(gCurTask);
}
