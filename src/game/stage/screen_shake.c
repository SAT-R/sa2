#include "global.h"
#include "core.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/screen_shake.h"

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
    ScreenShake *shake = TASK_DATA(gCurTask);

    s32 factor;
    s32 r2;

    if (shake->p3 == 0 || shake->p0 <= 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        struct Camera *cam = &gCamera;

        if (shake->flags & SCREENSHAKE_RANDOM_VALUE) {
            factor = ((u32)(PseudoRandom32() << 15) >> 23) - 0xFF;
        } else {
            factor = SIN_24_8(shake->unk14);
        }

        r2 = (shake->p0 * factor) >> 16;

        switch (shake->flags & SCREENSHAKE_FACTOR_MASK) {
            case SCREENSHAKE_FACTOR_POSITIVE: {
                r2 = +ABS(r2);
            } break;

            case SCREENSHAKE_FACTOR_NEGATIVE: {
                r2 = -ABS(r2);
            } break;
        }

        if (!(shake->flags & 0x20) || ((gStageTime % 2u) == 0)) {
            if (shake->flags & SCREENSHAKE_HORIZONTAL) {
                cam->shakeOffsetX = r2;
            }
            if (shake->flags & SCREENSHAKE_VERTICAL) {
                cam->shakeOffsetY = r2;
            }
        }

        if (shake->p3 > 0)
            shake->p3--;

        if (shake->p0 > 0)
            shake->p0 -= shake->p1;

        shake->unk14 = (shake->unk14 + shake->p2) & ONE_CYCLE;
    }
}

struct Task *CreateScreenShake(u32 p0, u32 p1, u32 p2, u32 p3, u32 flags)
{
    struct Task *t = TaskCreate(Task_ScreenShake, sizeof(ScreenShake), 0xEFF, 0, TaskDestructor_ScreenShake);

    ScreenShake *shake = TASK_DATA(t);
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
    ScreenShake *shake = TASK_DATA(t);

    struct Camera *cam = &gCamera;

    if (shake->flags & SCREENSHAKE_HORIZONTAL) {
        cam->shakeOffsetX = 0;
    }

    if (shake->flags & SCREENSHAKE_VERTICAL) {
        cam->shakeOffsetY = 0;
    }
}