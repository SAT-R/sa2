#include "global.h"
#include "gba/types.h"
#include "m4a.h"

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
    /* 0x0C */ u32 unkC;
    /* 0x10 */ u32 unk10;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler16[4];

    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 unk1C;
} CraneStruct;

typedef struct {
    /* 0x00 */ u32 unk0;
    /* 0x04 */ u8 filler4[0x2];
    /* 0x06 */ s16 unk6;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u8 filler8[0x2];
} unk1B8; /* size: 0x0C */

typedef struct {
    /* 0x000 */ s32 posX;
    /* 0x004 */ s32 posY;
    /* 0x008 */ CraneStruct cs;
    /* 0x028 */ CraneStruct unk28[6];
    /* 0x0E8 */ CraneStruct unkE8;
    /* 0x108 */ CraneStruct unk108;
    /* 0x128 */ Sprite unk128;
    /* 0x158 */ Sprite unk158; // Maybe alos Sprite?
    /* 0x188 */ Sprite unk188;
    /* 0x1B8 */ unk1B8 unk1B8;

    /* 0x1C4 */ Interactable *ia;
    /* 0x1C8 */ u8 spriteX;
    /* 0x1C9 */ u8 spriteY;
} Sprite_HCCrane; /* size: 0x1CC */

extern void Task_8073AA8(void);
extern void TaskDestructor_80743B8(struct Task *);
extern void sub_8074088(Sprite_HCCrane *);
extern void sub_8074138(Sprite_HCCrane *);
extern void sub_80741B4(Sprite_HCCrane *);
extern void sub_8074260(Sprite_HCCrane *);
extern void sub_80742A8(Sprite_HCCrane *);
extern bool32 sub_807432C(Sprite_HCCrane *);
extern void sub_80743BC(Sprite_HCCrane *);
extern void sub_807447C(Sprite_HCCrane *);
extern void sub_8074550(Sprite_HCCrane *);
extern bool32 sub_80745B4(Sprite_HCCrane *);
extern void sub_8074604(Sprite_HCCrane *);

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

    cs = &crane->cs;
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

    for (i = 0; i < ARRAY_COUNT(crane->unk28); i++) {
        CraneStruct *current = &crane->unk28[i];
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
        CraneStruct *hook = &crane->unkE8;
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
        CraneStruct *last = &crane->unk108;
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

    if (crane->unkE8.unk8 != 0x100) {
        if (crane->unkE8.unk8 > 0x100) {
            crane->unkE8.unk8--;
        } else {
            crane->unkE8.unk8++;
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
        r0 = (((u16)crane->unk1B8.unk6 - crane->unk1B8.unk8) >> 4);

        if (r0 > 384)
            r0 = 384;
        else if (r0 < 64) {
            r0 = 64;
        }

        crane->unk1B8.unk8 += r0;
        crane->cs.unk8 = 512 - (crane->unk1B8.unk8 >> 6);
    }

    if ((u16)crane->unk1B8.unk6 <= crane->unk1B8.unk8) {
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

        if (crane->unk1B8.unk6 > 63) {
            r3 = 64;
            crane->unk1B8.unk6 -= 64;
        } else {
            r3 = crane->unk1B8.unk6;
            crane->unk1B8.unk6 = 0;
        }

        crane->cs.unk8 += r3;
        // crane->cs.unk8 = 512 - (crane->unk1B8.unk8 >> 6);
    }

    if (crane->unk1B8.unk6 == 0) {
        sub_8074138(crane);
    }

    sub_807447C(crane);
    sub_80741B4(crane);
    sub_8074550(crane);
    sub_80742A8(crane);
}

/* matches
void sub_807447C(Sprite_HCCrane *crane) {
u32 r2 = crane->cs.unk8;

crane->unk28->unk8 = (1024 - r2) & (1024-1);
}*/