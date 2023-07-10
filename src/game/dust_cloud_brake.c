#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/game.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ u16 x;
    /* 0x02 */ u16 y;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ Sprite s;
} BrakeDustCloud;

void Task_801F6E0(void);
void TaskDestructor_801F7A8(struct Task *);
void Task_801F7B4(void);
void TaskDestructor_801F7B8(struct Task *);

struct Task *CreateBrakeDustCloud(s32 x, s32 y)
{
    if (gUnknown_030059D0.t == NULL || gUnknown_030059D0.unk0 == 0) {
        return NULL;
    } else {
        struct Task *t;
        BrakeDustCloud *bdc;
        Player *p;
        Sprite *s;

        gUnknown_030059D0.unk0--;

        t = TaskCreate(Task_801F6E0, sizeof(BrakeDustCloud), 0x4001, 0,
                       TaskDestructor_801F7B8);

        bdc = TaskGetStructPtr(t);
        bdc->x = x;
        bdc->y = y;
        bdc->unk4 = 0;
        bdc->unk6 = 0;

        s = &bdc->s;
        p = &gPlayer;

        if (p->moveState & MOVESTATE_8000000) {
            s->graphics.dest = VramMalloc(15);
            s->graphics.anim = SA2_ANIM_BRAKE_EFFECT;
            s->variant = 0;
            s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1));
        } else {
            // _0801F668
            s->graphics.dest = ((void *)OBJ_VRAM0 + 0x2300);
            s->graphics.anim = SA2_ANIM_SMALL_DUST_PARTICLE;
            s->variant = 0;
            s->unk10 = SPRITE_FLAG(PRIORITY, 2);

            s->unk10 |= ((u32)PseudoRandom32()
                         & (SPRITE_FLAG_MASK_Y_FLIP | SPRITE_FLAG_MASK_X_FLIP));
        }

        s->graphics.size = 0;
        s->unk21 = 0xFF;
        s->unk1A = 0x200;
        s->unk1C = 0;
        s->unk22 = 0x10;
        s->palId = 0;

        return t;
    }
}

void Task_801F6E0(void)
{
    UNK_30059D0 *unk = &gUnknown_030059D0;
    BrakeDustCloud *bdc = TaskGetStructPtr(gCurTask);
    Sprite *s = &bdc->s;

    if (unk->t == 0 || (s->unk10 & SPRITE_FLAG_MASK_14) != 0) {
        unk->unk0++;
        TaskDestroy(gCurTask);
        return;
    } else {
        s->x = bdc->x - gCamera.x;
        s->y = bdc->y - gCamera.y;
        sub_8004558(s);
        sub_80051E8(s);

        bdc->x += bdc->unk4;
        bdc->y += bdc->unk6;
    }
}

void sub_801F754(void)
{
    if (gUnknown_030059D0.t == NULL) {
        struct Task *t = TaskCreate(Task_801F7B4, 0, 0x4000, 0, TaskDestructor_801F7A8);
        gUnknown_030059D0.t = t;
        gUnknown_030059D0.unk0 = 20;
    }
}

void sub_801F78C(void)
{
    if (gUnknown_030059D0.t != NULL) {
        TaskDestroy(gUnknown_030059D0.t);
        gUnknown_030059D0.t = NULL;
    }
}

void TaskDestructor_801F7A8(struct Task *t) { gUnknown_030059D0.t = NULL; }

void Task_801F7B4(void) { }

void TaskDestructor_801F7B8(struct Task *t)
{
    BrakeDustCloud *bdc = TaskGetStructPtr(t);
    Sprite *s = &bdc->s;

    if (s->graphics.anim == SA2_ANIM_BRAKE_EFFECT) {
        VramFree(bdc->s.graphics.dest);
    }
}