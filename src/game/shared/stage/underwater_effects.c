#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"

#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/underwater_effects.h"
#include "game/shared/stage/water_effects.h"

#if (GAME == GAME_SA1)
#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#elif (GAME == GAME_SA2)
#include "constants/sa2/animations.h"
#include "constants/sa2/vram_hardcoded.h"
#endif

#define MAX_SMALL_BUBBLE_COUNT 11

typedef struct {
    Player *p;
} DrownBubbles;

u8 gSmallAirBubbleCount = 0;

static void Task_DrowningCountdown(void);
static void Task_SpawnAirBubbles(void);
static void TaskDestructor_SpawnAirBubbles(struct Task *t);

void Task_DrowningCountdown(void)
{
    MultiplayerSpriteTask *ts = TASK_DATA(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r2;

    transform->x = I(ts->x);
    transform->y = I(ts->y);

    r2 = ((ts->unk10 + 1) << 3);
    r2 = MIN(r2, 0x100);

    transform->qScaleX = r2;
    transform->qScaleY = r2;

    if (ts->unk14 & 0x1)
        transform->qScaleX = -r2;

    if (ts->unk14 & 0x2)
        transform->qScaleY = -transform->qScaleY;

    if ((transform->x < -32 || transform->x > DISPLAY_WIDTH + 32) || (transform->y < -32 || transform->y > DISPLAY_HEIGHT + 32)
        || (ts->unk10 > 0x80)) {
        TaskDestroy(gCurTask);
        return;
    } else if (ts->unk10 <= 0x40) {
        ts->y += (-COS_24_8(ts->unk10 * 4) * ts->unkA) >> 8;
    }

    ts->unk10 += 1;

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->frameFlags |= (gOamMatrixIndex++ | 0x20);

    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);
}

struct Task *SpawnDrowningCountdownNum(Player *p, s32 countdown)
{
    Camera *cam = &gCamera;
    struct Task *t = CreateMultiplayerSpriteTask(0, 0, 0, 0, Task_DrowningCountdown, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *ts = TASK_DATA(t);
    Sprite *s;
    SpriteTransform *transform;
    s32 temp;

    ts->x = p->qWorldX - Q(cam->x);
    ts->y = p->qWorldY - Q(cam->y);
    ts->unk8 = 0;
    ts->unkA = 0x120;
    ts->unk10 = 0;
    ts->mpPlayerID = p->playerID;

    s = &ts->s;
#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_DROWN_COUNTDOWN);
    s->graphics.anim = SA1_ANIM_DROWN_COUNTDOWN;
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_DROWN_COUNTDOWN;
#endif
    s->variant = 5 - countdown;

    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    transform = &ts->transform;
    transform->rotation = 0;
    transform->qScaleX = 0;
    transform->qScaleY = 0;
    transform->x = 0;
    transform->y = 0;

    return t;
}

// Called when air bubbles spawn underwater
struct Task *SpawnAirBubbles(s32 x, s32 y, s32 p2, s32 p3)
{
    if ((s8)gSmallAirBubbleCount > MAX_SMALL_BUBBLE_COUNT) {
        return NULL;
    } else {
        struct Task *t;
        MultiplayerSpriteTask *ts;
        Sprite *s;
        SpriteTransform *transform;

        gSmallAirBubbleCount++;

        t = CreateMultiplayerSpriteTask(0, 0, 0, 0, Task_SpawnAirBubbles, TaskDestructor_SpawnAirBubbles);

        ts = TASK_DATA(t);
        s = &ts->s;
        transform = &ts->transform;

        ts->x = x;
        ts->y = y;
        ts->unk8 = p2;
        ts->unkA = -0x80;
        ts->unk10 = 0;
        ts->unk12 = 0x100;
        ts->unk14 = 0;

        if (p3 == 0) {
            s->graphics.dest = VRAM_RESERVED_BUBBLES_SMALL;
#if (GAME == GAME_SA1)
            s->graphics.anim = SA1_ANIM_BUBBLES_SMALL;
#elif (GAME == GAME_SA2)
            s->graphics.anim = SA2_ANIM_BUBBLES_SMALL;
#endif
            s->variant = 0;
        } else {
            s->graphics.dest = VRAM_RESERVED_BUBBLES_GROUP;
#if (GAME == GAME_SA1)
            s->graphics.anim = SA1_ANIM_BUBBLES_GROUP;
#elif (GAME == GAME_SA2)
            s->graphics.anim = SA2_ANIM_BUBBLES_GROUP;
#endif
            s->variant = 0;

            ts->unk14 = (((u32)PseudoRandom32() & 0x30000) >> 16);
        }

        s->oamFlags = SPRITE_OAM_ORDER(9);

        transform->rotation = 0;
        transform->qScaleX = 0;
        transform->qScaleY = 0;
        transform->x = 0;
        transform->y = 0;

        return t;
    }
}

bool32 RandomlySpawnAirBubbles(Player *p)
{
    u32 rand, randX, randY;

    u32 result = FALSE;

    if ((gStageTime % 8u) == 0) {
        rand = ((u32)PseudoRandom32() & 0x300);
        if (!rand) {
            randX = (((u32)PseudoRandom32() & 0xF00) >> 8);
            randY = (((u32)PseudoRandom32() & 0xF00) >> 8) - 8;

            if (!(p->moveState & MOVESTATE_FACING_LEFT))
                randX = -randX;

            SpawnAirBubbles(p->qWorldX - randX, p->qWorldY - randY, p->qSpeedAirX, ((u32)PseudoRandom32() & 0x100) >> 8);

            result = TRUE;
        }
    }

    return result;
}

static void Task_SpawnAirBubbles(void)
{
    MultiplayerSpriteTask *ts = TASK_DATA(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r1 = ts->x;
    s32 r4 = ts->y;
    s32 r2;
    s32 unk10 = ts->unk10;

    r1 += SIN((unk10 & 0xFF) * 4) >> 4;
    {
        Camera *cam = &gCamera;
        transform->x = I(r1) - cam->x;
        transform->y = I(r4) - cam->y;
    }

    r2 = ((unk10 + 1) << 4);
    r2 = MIN(r2, 0x100);

    transform->qScaleX = r2;
    transform->qScaleY = r2;

    if (ts->unk14 & 0x1)
        transform->qScaleX = -r2;

    if (ts->unk14 & 0x2)
        transform->qScaleY = -transform->qScaleY;

    if ((transform->x < -32 || transform->x > DISPLAY_WIDTH + 32) || (transform->y < -32 || transform->y > DISPLAY_HEIGHT + 32)
#if (GAME == GAME_SA2)
        || (gWater.isActive != TRUE)
#endif
        || (gWater.currentWaterLevel < 0) || (I(r4) - 3 < gWater.currentWaterLevel) || (ts->unk10 > 0x1E0)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        ts->x += ts->unk8;
        ts->y += ts->unkA;

        ts->unk8 -= (ts->unk8 >> 3);
        ts->unk10 += 1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        s->frameFlags |= (gOamMatrixIndex++ | 0x20);

        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
        DisplaySprite(s);
    }
}

static void Task_SpawnBubblesAfterDrowning(void)
{
    DrownBubbles *db = TASK_DATA(gCurTask);
    Player *p = db->p;

    if (IS_ALIVE(p)) {
        TaskDestroy(gCurTask);
        return;
    } else if (!(gStageTime & (0x2 | 0x1))) {
        if ((PseudoRandom32() & 0x300) == 0) {
            s32 r4 = ((u32)PseudoRandom32() & 0x100) >> 8;

            do {
                // TODO: Maybe these could be converted to PseudoRandBetween?
                u32 r3, r2, r1 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r1 -= 0x400;

                r2 = ((u32)PseudoRandom32() & 0x7FF00) >> 8;
                r2 -= 0x400;

                r3 = ((u32)PseudoRandom32() & 0x100) >> 8;

                SpawnAirBubbles(p->qWorldX + r1, p->qWorldY + r2 - 0xC00, 0, r3);
            } while (r4-- != 0);
        }
    }
}

struct Task *SpawnBubblesAfterDrowning(Player *p)
{
    struct Task *t = TaskCreate(Task_SpawnBubblesAfterDrowning, sizeof(Player **), 0x4001, 0, NULL);

    DrownBubbles *db = TASK_DATA(t);
    db->p = p;

    return t;
}

static void TaskDestructor_SpawnAirBubbles(struct Task *t) { gSmallAirBubbleCount--; }
