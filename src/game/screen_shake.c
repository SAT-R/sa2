#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/game.h"

#include "game/screen_shake.h"

typedef struct {
    /* 0x00 */ s32 p0;
    /* 0x04 */ s32 p1;
    /* 0x08 */ s32 p2;
    /* 0x0C */ s32 p3;
    /* 0x10 */ u32 flags;
    /* 0x14 */ s32 unk14;
} ScreenShake; /* size: 0x18 */

void Task_ScreenShake(void);
static void TaskDestructor_ScreenShake(struct Task *);

void Task_ScreenShake(void)
{
    ScreenShake *shake = TaskGetStructPtr(gCurTask);

    s32 factor;
    s32 r2;

    if (shake->p3 == 0 || shake->p0 <= 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        struct Camera *cam = &gCamera;

        if (shake->flags & 0x10) {
            factor = ((u32)(PseudoRandom32() << 15) >> 23) - 0xFF;
        } else {
            // _0802B458
            factor = SIN_24_8(shake->unk14);
        }
        // _0802B466

        r2 = (shake->p0 * factor) >> 16;

        switch (shake->flags & 0x3) {
            case 1: {
                if (r2 < 0)
                    r2 = -r2;
            } break;

            case 2: {
                s32 r2_2 = r2;
                if (r2 < 0)
                    r2_2 = -r2;

                r2 = -r2_2;
            } break;
        }
        // _0802B496

        if (!(shake->flags & 0x20) || !(gUnknown_03005590 & 0x1)) {
            if (shake->flags & SCREENSHAKE_HORIZONTAL) {
                cam->unk60 = r2;
            }
            if (shake->flags & SCREENSHAKE_VERTICAL) {
                cam->unk62 = r2;
            }
        }
        // _0802B4C8

        if (shake->p3 > 0)
            shake->p3--;

        if (shake->p0 > 0)
            shake->p0 -= shake->p1;

        shake->unk14 = (shake->unk14 + shake->p2) & ONE_CYCLE;
    }
}

struct Task *CreateScreenShake(u32 p0, u32 p1, u32 p2, u32 p3, u32 flags)
{
    struct Task *t = TaskCreate(Task_ScreenShake, sizeof(ScreenShake), 0xEFF, 0,
                                TaskDestructor_ScreenShake);

    ScreenShake *shake = TaskGetStructPtr(t);
    shake->p0 = p0;
    shake->p1 = p1;
    shake->p2 = p2;
    shake->unk14 = 0;
    shake->p3 = p3;
    shake->flags = flags;

    return t;
}

static void TaskDestructor_ScreenShake(struct Task *t)
{
    ScreenShake *shake = TaskGetStructPtr(t);

    struct Camera *cam = &gCamera;

    if (shake->flags & SCREENSHAKE_HORIZONTAL) {
        cam->unk60 = 0;
    }

    if (shake->flags & SCREENSHAKE_VERTICAL) {
        cam->unk62 = 0;
    }
}