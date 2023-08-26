#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "game/game.h"
#include "game/underwater_effects.h"
#include "game/game_3.h"

#include "constants/animations.h"

static void Task_DrowningCountdown(void);
static void Task_SpawnAirBubbles(void);

static void TaskDestructor_SpawnAirBubbles(struct Task *t);

typedef struct {
    Player *p;
} DrownBubbles;

static void Task_DrowningCountdown(void)
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r2;

    {
        struct Camera *cam = &gCamera;
        transform->x = Q_24_8_TO_INT(ts->x);
        transform->y = Q_24_8_TO_INT(ts->y);
    }

    r2 = ((ts->unk10 + 1) << 3);
    r2 = MIN(r2, 0x100);

    transform->width = r2;
    transform->height = r2;

    if (ts->unk14 & 0x1)
        transform->width = -r2;

    if (ts->unk14 & 0x2)
        transform->height = -transform->height;

    if (((u16)(transform->x + 0x20) > 0x130) || ((u16)(transform->y + 0x20) > 0xE0)
        || (ts->unk10 > 0x80)) {
        TaskDestroy(gCurTask);
        return;
    } else if (ts->unk10 <= 0x40) {
        ts->y += (-COS_24_8(ts->unk10 * 4) * ts->unkA) >> 8;
    }

    ts->unk10 += 1;

    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    s->unk10 |= (gUnknown_030054B8++ | 0x20);

    UpdateSpriteAnimation(s);
    sub_8004860(s, transform);
    sub_80051E8(s);
}

struct Task *SpawnDrowningCountdownNum(Player *p, s32 countdown)
{
    struct Camera *cam = &gCamera;
    struct Task *t
        = sub_801F15C(0, 0, 0, 0, Task_DrowningCountdown, TaskDestructor_801F550);
    TaskStrc_801F15C *ts = TaskGetStructPtr(t);
    Sprite *s;
    SpriteTransform *transform;
    s32 temp;

    ts->x = p->x - Q_24_8(cam->x);
    ts->y = p->y - Q_24_8(cam->y);
    ts->unk8 = 0;
    ts->unkA = 0x120;
    ts->unk10 = 0;
    ts->unk1A = p->unk60;

    s = &ts->s;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_DROWN_COUNTDOWN;
    s->variant = 5 - countdown;

    s->unk1A = SPRITE_OAM_ORDER(9);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    transform = &ts->transform;
    transform->unk0 = 0;
    transform->width = 0;
    transform->height = 0;
    transform->x = 0;
    transform->y = 0;

    return t;
}

// Called when air bubbles spawn underwater
struct Task *SpawnAirBubbles(s32 p0, s32 p1, s32 p2, s32 p3)
{
    if ((s8)gSmallAirBubbleCount > 11) {
        return NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        SpriteTransform *transform;

        gSmallAirBubbleCount++;

        t = sub_801F15C(0, 0, 0, 0, Task_SpawnAirBubbles,
                        TaskDestructor_SpawnAirBubbles);

        ts = TaskGetStructPtr(t);
        s = &ts->s;
        transform = &ts->transform;

        ts->x = p0;
        ts->y = p1;
        ts->unk8 = p2;
        ts->unkA = -0x80;
        ts->unk10 = 0;
        ts->unk12 = 0x100;
        ts->unk14 = 0;

        if (p3 == 0) {
            s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2A40);
            s->graphics.anim = SA2_ANIM_BUBBLES_SMALL;
            s->variant = 0;
        } else {
            s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2AC0);
            s->graphics.anim = SA2_ANIM_BUBBLES_GROUP;
            s->variant = 0;

            ts->unk14 = (((u32)PseudoRandom32() & 0x30000) >> 16);
        }

        s->unk1A = SPRITE_OAM_ORDER(9);

        transform->unk0 = 0;
        transform->width = 0;
        transform->height = 0;
        transform->x = 0;
        transform->y = 0;

        return t;
    }
}

bool32 RandomlySpawnAirBubbles(Player *p)
{
    u32 rand, randX, randY;

    u32 result = FALSE;

    u32 flags = gUnknown_03005590 & 0x7;
    if (!flags) {
        rand = ((u32)PseudoRandom32() & 0x300);
        if (!rand) {
            randX = (((u32)PseudoRandom32() & 0xF00) >> 8);
            randY = (((u32)PseudoRandom32() & 0xF00) >> 8) - 8;

            if (!(p->moveState & MOVESTATE_FACING_LEFT))
                randX = -randX;

            SpawnAirBubbles(p->x - randX, p->y - randY, p->speedAirX,
                            ((u32)PseudoRandom32() & 0x100) >> 8);

            result = TRUE;
        }
    }

    return result;
}

static void Task_SpawnAirBubbles(void)
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r1 = ts->x;
    s32 r4 = ts->y;
    s32 r2;
    s32 unk10 = ts->unk10;

    r1 += SIN((unk10 & 0xFF) * 4) >> 4;
    {
        struct Camera *cam = &gCamera;
        transform->x = Q_24_8_TO_INT(r1) - cam->x;
        transform->y = Q_24_8_TO_INT(r4) - cam->y;
    }

    r2 = ((unk10 + 1) << 4);
    r2 = MIN(r2, 0x100);

    transform->width = r2;
    transform->height = r2;

    if (ts->unk14 & 0x1)
        transform->width = -r2;

    if (ts->unk14 & 0x2)
        transform->height = -transform->height;

    if (((u16)(transform->x + 0x20) > 0x130) || ((u16)(transform->y + 0x20) > 0xE0)
        || ((u16)gUnknown_03005660.unk0 != 1) || (gUnknown_03005660.unk4 < 0)
        || (Q_24_8_TO_INT(r4) - 3 < gUnknown_03005660.unk4) || (ts->unk10 > 0x1E0)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        ts->x += ts->unk8;
        ts->y += ts->unkA;

        ts->unk8 -= (ts->unk8 >> 3);
        ts->unk10 += 1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        s->unk10 |= (gUnknown_030054B8++ | 0x20);

        UpdateSpriteAnimation(s);
        sub_8004860(s, transform);
        sub_80051E8(s);
    }
}

static void Task_SpawnBubblesAfterDrowning(void)
{
    DrownBubbles *db = TaskGetStructPtr(gCurTask);
    Player *p = db->p;

    if (IS_ALIVE(p)) {
        TaskDestroy(gCurTask);
        return;
    } else if (!(gUnknown_03005590 & (0x2 | 0x1))) {
        if ((PseudoRandom32() & 0x300) == 0) {
            s32 r4 = ((u32)PseudoRandom32() & 0x100) >> 8;

            do {
                // TODO: Maybe these could be converted to PseudoRandBetween?
                u32 r3, r2, r1 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r1 -= 0x400;

                r2 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r2 -= 0x400;

                r3 = ((u32)PseudoRandom32() & 0x100) >> 8;

                SpawnAirBubbles(p->x + r1, p->y + r2 - 0xC00, 0, r3);
            } while (r4-- != 0);
        }
    }
}

struct Task *SpawnBubblesAfterDrowning(Player *p)
{
    struct Task *t
        = TaskCreate(Task_SpawnBubblesAfterDrowning, sizeof(Player **), 0x4001, 0, NULL);

    DrownBubbles *db = TaskGetStructPtr(t);
    db->p = p;

    return t;
}

static void TaskDestructor_SpawnAirBubbles(struct Task *t) { gSmallAirBubbleCount--; }