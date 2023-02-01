#include "global.h"
#include "gba/types.h"
#include "m4a.h"
#include "trig.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"

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

    /* 0x1C4 */ Interactable *ia;
    /* 0x1C8 */ u8 spriteX;
    /* 0x1C9 */ u8 spriteY;
} Sprite_HCCrane; /* size: 0x1CC */

extern void sub_80218E4(Player *);
extern void sub_8023B5C(Player *, u32);

extern void Task_8073AA8(void);
void Task_8073B1C(void);
extern void TaskDestructor_80743B8(struct Task *);
extern void sub_8074088(Sprite_HCCrane *);
extern void sub_8074138(Sprite_HCCrane *);
extern void sub_80741B4(Sprite_HCCrane *);
extern bool32 sub_8074260(Sprite_HCCrane *);
extern void sub_80742A8(Sprite_HCCrane *);
extern bool32 sub_807432C(Sprite_HCCrane *);
extern void sub_80743BC(Sprite_HCCrane *);
extern void sub_80743E4(Sprite_HCCrane *);
extern void sub_8074400(Sprite_HCCrane *);
extern u16 sub_8074448(Sprite_HCCrane *, u16);
extern void sub_807447C(Sprite_HCCrane *);
extern void sub_8074490(Sprite_HCCrane *, s16);
extern bool32 sub_80744D0(Sprite_HCCrane *, s16);
extern bool32 sub_80744E0(Sprite_HCCrane *, u16, s16);
extern void sub_8074550(Sprite_HCCrane *);
extern bool32 sub_80745B4(Sprite_HCCrane *);
extern void sub_8074604(Sprite_HCCrane *);

#define CRANE_SOME_ACCELERATION 3072

NONMATCH("asm/non_matching/initSprite_Interactable_HotCrater_Crane.inc",
         void initSprite_Interactable_HotCrater_Crane(Interactable *ia,
                                                      u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY))
{
    struct Task *t = TaskCreate(Task_8073AA8, sizeof(Sprite_HCCrane), 0x2010, 0,
                                TaskDestructor_80743B8);
    Sprite_HCCrane *crane = TaskGetStructPtr(t);
    CraneStruct *cs;
    u16 i;

    crane->unk1B8.unk0 = 0;
    crane->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    crane->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    crane->ia = ia;
    crane->spriteX = crane->ia->x;
    crane->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(crane->ia);

    cs = &crane->cs[0];
    cs->s = &crane->unk128;
    cs->unk4 = 5;
    cs->unk8 = 0x200;
    cs->unkC = 0;
    cs->unk10 = 0;
    cs->s->unk1A = 0x480;

    cs->s->graphics.size = 0;
    cs->s->unk14 = 0;
    cs->s->unk1C = 0;
    cs->s->unk21 = 0xFF;
    cs->s->unk22 = 0x10;
    cs->s->focused = 0;
    cs->s->unk28->unk0 = -1;
    cs->s->unk10 = 0x2000;
    cs->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2BC0);
    cs->s->graphics.anim = SA2_ANIM_CRANE;
    cs->s->variant = 0;
    sub_8004558(cs->s);

    for (i = 0; i < 6; i++) {
        CraneStruct *current = &crane->cs[1 + i];
        current->unk4 = 0;

        if (i == 0) {
            current->unk4 = 2;
            current->s = NULL;
            current->unk8 = 0;
            current->unkC = 0x2C00;
            current->unk10 = 0;
        } else {
            // _08073998
            current->s = &crane->unk188;
            current->unk8 = 0;
            current->unkC = 0;
            current->unk10 = 0xC00;

            if (i == 1) {
                current->unk4 = 4;
                current->s->unk1A = 0x480;

                current->s->graphics.size = 0;
                current->s->unk14 = 0;
                current->s->unk1C = 0;
                current->s->unk21 = 0xFF;
                current->s->unk22 = 0x10;
                current->s->focused = 0;
                current->s->unk28->unk0 = -1;
                current->s->unk10 = 0x2000;
                current->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2B80);
                current->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
                current->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_GREY;
                sub_8004558(current->s);
            }
        }
        // _08073A00
    }

    { // Hook
        CraneStruct *hook = &crane->cs[7];
        hook->s = &crane->unk158;
        hook->unk4 = 5;
        hook->unk8 = 0x100;
        hook->unkC = 0x158;
        hook->unk10 = 0xC00;
        hook->s->unk1A = 0x480;
        hook->s->graphics.size = 0;
        hook->s->unk14 = 0;
        hook->s->unk1C = 0;
        hook->s->unk21 = 0xFF;
        hook->s->unk22 = 0x10;
        hook->s->focused = 0;
        hook->s->unk28->unk0 = -1;
        hook->s->unk10 = 0x2000;
        hook->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
        hook->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
        hook->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_HOOK;
        sub_8004558(hook->s);
    }
    {
        CraneStruct *last = &crane->cs[8];
        last->s = NULL;
        last->unk4 = 2;
        last->unk8 = 0;
        last->unkC = 0x1000;
        last->unk10 = 0;
    }

    sub_807447C(crane);
}
END_NONMATCH

void Task_8073AA8()
{
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

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

void Task_8073B1C(void)
{
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.unk2C == 120)) {
        gPlayer.moveState &= ~MOVESTATE_400000;
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

void Task_8073BD4(void)
{
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.unk2C == 120)) {
        gPlayer.moveState &= ~MOVESTATE_400000;
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

void Task_8073C6C(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

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

void Task_8073D48(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

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

    if ((result_744D0 == FALSE))
        sub_8074400(crane);

    sub_80742A8(crane);
}

NONMATCH("asm/non_matching/IA_Crane_Task_8073E20.inc", void Task_8073E20(void))
{
    Sprite_HCCrane *crane = TaskGetStructPtr(gCurTask);

    sub_8074260(crane);
    sub_807447C(crane);

    // TODO: Fix cast... maybe unk1B8.unk8 is a Q_16_16?
    if (*(u32 *)&crane->unk1B8.unk8 != 0) {
        u16 r2;

        if (crane->unk1B8.unk6 == 0) {
            s32 r6 = -crane->unk1B8.unkA;
            s32 r3 = -crane->unk1B8.unk8;
            s32 r0 = (r6 - r3);
            r2 = (r0 > -32) ? -32 : (r0 >> 4);

            r0 = ((r3 - r6) >> 4) + 256;

            crane->cs[7].unk8 = r0;
        } else {
            // _08073E9C
            if (crane->unk1B8.unk8 == 0) {
                r2 = crane->unk1B8.unkA;

                if (crane->unk1B8.unkA > 0) {
                    if (crane->unk1B8.unkA > 32) {
                        r2 = -32;
                    }
                } else if (crane->unk1B8.unkA < -32) {
                    r2 = 32;
                } else {
                    r2 = -r2;
                }
            } else if (crane->unk1B8.unk8 > 0) {
                // __08073ED0
                s16 temp;
                s16 temp0, temp1;
                if (crane->unk1B8.unkA > 0) {
                    temp0 = crane->unk1B8.unk8;
                    temp1 = crane->unk1B8.unkA;
                } else {
                    // _08073EEC
                    temp0 = crane->unk1B8.accelY;
                    temp1 = crane->unk1B8.unkA;
                }

                temp = ((temp0 - temp1) >> 4);

                if (temp < 32)
                    r2 = 32;
                else
                    r2 = temp;
            } else /* crane->unk1B8.unk8 < 0 */ {
                // _08073F0C
                s16 temp;
                if (crane->unk1B8.unkA > 0) {
                    r2 = crane->unk1B8.unkA - crane->unk1B8.accelY;
                    temp = r2;

                    if (temp > -32)
                        r2 = -32;
                } else {
                    // _08073F3C
                    r2 = crane->unk1B8.unk8 - crane->unk1B8.unkA;
                    temp = r2;

                    if (temp > -32)
                        r2 = -32;
                }
            }
        }
        // _08073F56
        crane->unk1B8.unkA += r2;

        if (((crane->unk1B8.unk8 > 0) && (crane->unk1B8.unk8 <= crane->unk1B8.unkA))
            || ((crane->unk1B8.unk8 < 0)
                && (crane->unk1B8.unk8 >= crane->unk1B8.unkA))) {
            // _08073F88
            u16 unk8 = crane->unk1B8.unk8;
            s16 other;
            crane->unk1B8.unkA = unk8;
            crane->unk1B8.accelY = unk8;

            // crane->unk1B8.unk8 *= -0.75;
            other = -((crane->unk1B8.unk8 * 3) >> 2);
            crane->unk1B8.unk8 = other;

            if (other != 0) {
                if (other < 0)
                    other = -other;

                if (other < 128)
                    crane->unk1B8.unk8 = 0;
            } else {
                // _08073FCC
                crane->unk1B8.unkA = crane->unk1B8.unk8;
            }
            // _08073FCE
            crane->unk1B8.unk6++;
        }
        // _08073FDA
        crane->cs[1].unk8 = (((crane->unk1B8.unkA >> 5) + (crane->cs[1].unk8)) & 0x3FF);

        if (*(u32 *)&crane->unk1B8.unk8 == 0) {
            // _08073FFC
            gCurTask->main = Task_8073AA8;
        }
    } else {
        // _08073FFC
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
            if (!sub_80745B4(crane)) {
                crane->ia->x = crane->spriteX;
                TaskDestroy(gCurTask);
                return;
            }
        }
        // _08074064
        sub_80741B4(crane);
        if (sub_80745B4(crane)) {
            sub_8074604(crane);
        } else {
            sub_80742A8(crane);
        }
    }
}
END_NONMATCH

void sub_8074088(Sprite_HCCrane *crane)
{
    s32 speedY;
    s16 v;

    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 9);

    gPlayer.unk16 = 6;
    gPlayer.unk17 = 9;
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 0x37;

    sub_8074550(crane);
    crane->unk1B8.unk0 = 1;
    crane->unk1B8.accelY = (u16)gPlayer.speedAirY * 2;

    // TODO: Replace with clamp-macro
    if (crane->unk1B8.accelY < Q_8_8(7.5)) {
        crane->unk1B8.accelY = Q_8_8(7.5);
    } else if (crane->unk1B8.accelY > Q_8_8(12)) {
        crane->unk1B8.accelY = Q_8_8(12);
    }

    v = (crane->unk1B8.accelY >> 2) * 15;
    crane->unk1B8.unk6 = v;
    crane->unk1B8.unk8 = 0;

    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gCurTask->main = Task_8073B1C;
}

void sub_8074138(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && crane->unk1B8.unk0 != 0) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk64 = 0x26;
        gPlayer.unk6D = 7;
        gPlayer.speedAirX = 0;
        gPlayer.speedAirY = -crane->unk1B8.accelY;
        crane->unk1B8.unk0 = 0;
    }
    // _08074178
    crane->unk1B8.unk6 = -crane->unk1B8.accelY;
    crane->unk1B8.unk8 = 0;

    gCurTask->main = Task_8073C6C;
}

void sub_80741B4(Sprite_HCCrane *crane)
{
    s32 screenX, screenY;
    u8 i;
    u32 sinIndex = 0;

    screenX = Q_24_8(crane->posX - gCamera.x);
    screenY = Q_24_8(crane->posY - gCamera.y);

    for (i = 0; i < ARRAY_COUNT(crane->cs); i++) {
        CraneStruct *cs = &crane->cs[i];
        s16 cos = Q_2_14_TO_Q_24_8(COS(sinIndex));
        s32 cosV2 = Q_24_8_TO_INT((signed)cs->unkC * cos);
        s16 sin = Q_2_14_TO_Q_24_8(SIN(sinIndex));
        s32 sinV2 = Q_24_8_TO_INT(cs->unk10 * sin);
        s32 diff, temp;

        diff = cosV2 - sinV2;
        screenX += diff;

        temp = Q_24_8_TO_INT(cs->unkC * sin);

        screenY += temp + Q_24_8_TO_INT(cs->unk10 * cos);

        sinIndex += cs->unk8;
        {
#ifndef NON_MATCHING
            register u32 mask asm("r1") = ONE_CYCLE;
            register u32 mask2 asm("r0");
            asm("mov %0, %1\n" : "=r"(mask2) : "r"(mask));
#else
            u32 mask2 = ONE_CYCLE;
#endif
            sinIndex &= mask2;
            cs->unk14 = sinIndex;
            cs->screenX = screenX;
            cs->screenY = screenY;
        }
    }
}

bool32 sub_8074260(Sprite_HCCrane *crane)
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

void sub_80742A8(Sprite_HCCrane *crane)
{
    struct UNK_808D124_UNK180 some;
    u8 i;
    for (i = 0; i < ARRAY_COUNT(crane->cs); i++) {
        CraneStruct *cs = &crane->cs[i];

        if (!(cs->unk4 & 0x2)) {
            cs->s->x = Q_24_8_TO_INT(cs->screenX);
            cs->s->y = Q_24_8_TO_INT(cs->screenY);

            if (cs->unk4 & 0x1) {
                u8 v;
                some.unk0 = cs->unk14;
                some.unk2 = 0x100;
                some.unk4 = 0x100;

                some.unk6[0] = cs->s->x;
                some.unk6[1] = cs->s->y;

                cs->s->unk10 = gUnknown_030054B8++ | 0x00002060;

                sub_8004860(cs->s, &some);
            }
            sub_80051E8(cs->s);
        }
    }
}

/* matches
void sub_807447C(Sprite_HCCrane *crane) {
    u32 r2 = crane->cs.unk8;

    crane->unk28->unk8 = (1024 - r2) & (1024-1);
}

bool32 sub_80744D0(Sprite_HCCrane *crane, u16 p1) { return sub_80744E0(crane, 7, p1); }

bool32 sub_80744E0(Sprite_HCCrane *crane, u16 index, s16 p2)
{
    s32 v, w;

    CraneStruct *cs = &crane->cs[index];

    w = cs->unk10 + p2;
    v = (w < 0) ? -w : w;

    if (v <= CRANE_SOME_ACCELERATION) {
        cs->unk10 = w;
        return TRUE;
    } else {
        s16 r3;
        if (p2 > 0) {
            r3 = w - CRANE_SOME_ACCELERATION;
            cs->unk10 = CRANE_SOME_ACCELERATION;
        } else {
            r3 = w + CRANE_SOME_ACCELERATION;
            cs->unk10 = -CRANE_SOME_ACCELERATION;
        }

        if (--index != 1)
            return sub_80744E0(crane, index, r3);
        else
            return FALSE;
    }
}*/
