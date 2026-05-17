#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/ui/time_over.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/zones.h"

typedef struct {
    StrcUi_805423C strc0;
    Sprite s;
    Sprite s2;
    s32 timer;
} TimeOverState;

typedef struct {
    struct Task *t; // -> TimeOverState
    s16 timer;
} TimeOverTimer;

void Task_TimeOverTimerUpdate(void);
void Task_TimeOverStateUpdate(void);
void TaskDestructor_TimeOverState(struct Task *t);
void TaskDestructor_805BC90(struct Task *t);

void CreateTimeOver()
{
    TimeOverTimer *overTimer;
    Sprite *s;
    struct Task *t2 = NULL;

    struct Task *t = TaskCreate(Task_TimeOverStateUpdate, sizeof(TimeOverState), 0x2220U, 0U, TaskDestructor_TimeOverState);
    TimeOverState *state = TASK_DATA(t);
    StrcUi_805423C *strc0 = &state->strc0;

    state->timer = 0;
    strc0->unk0 = 0;
    strc0->unk2 = 1;
    strc0->unk4 = 1;
    strc0->unk6 = 0;
    strc0->unk8 = 0x40;
    strc0->unkA = 8;

    // "TIME"
    s = &state->s;
    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_GAME_OVER, 4);
    s->graphics.size = 0;
    s->frameFlags = 0;
    s->x = DISPLAY_WIDTH + 60;
    s->y = 60;
    s->oamFlags = 3;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->graphics.anim = SA1_ANIM_GAME_OVER;
    s->variant = 4;

    // "OVER"
    s = &state->s2;
    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_GAME_OVER, 1);
    s->graphics.size = 0;
    s->frameFlags = 0;
    s->x = DISPLAY_WIDTH + 60;
    s->y = 60;
    s->oamFlags = 3;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->graphics.anim = SA1_ANIM_GAME_OVER;
    s->variant = 1;

    gDispCnt &= ~0xE000;
    sub_80543A4(&state->strc0);

    t2 = TaskCreate(Task_TimeOverTimerUpdate, sizeof(TimeOverTimer), 0x2200U, 0U, TaskDestructor_805BC90);
    overTimer = TASK_DATA(t2);
    overTimer->timer = 0;
    overTimer->t = t;
}

void Task_TimeOverTimerUpdate()
{
    TimeOverTimer *overTimer = TASK_DATA(gCurTask);
    TimeOverState *state = TASK_DATA(overTimer->t);

    state->timer = overTimer->timer;
    if (overTimer->timer > TIME(0, 3.5)) {
        if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
            gCamera.SA2_LABEL(unk50) |= 0x2000;
        }
        sub_805423C(&state->strc0);
    }

    if (++overTimer->timer > TIME(0, 5.5)) {
        TaskDestroy(overTimer->t);
        TaskDestroy(gCurTask);

        TasksDestroyAll();

        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();

        gRingCount = 0;
        CreateGameStage();
    }
}

void Task_TimeOverStateUpdate()
{
    Sprite *s;
    s16 timer;

    TimeOverState *state = TASK_DATA(gCurTask);

    timer = state->timer;
    if (timer > TIME(0, 2.0)) {
        state->s2.x = state->s.x = DISPLAY_CENTER_X;
    } else if (timer > TIME(0, 0.5)) {
        state->s2.x = state->s.x = (DISPLAY_WIDTH + 60) - ((timer - TIME(0, 0.5)) * 2);
    }

    s = &state->s;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &state->s2;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_TimeOverState(struct Task *t)
{
    TimeOverState *state;

    state = TASK_DATA(t);
    VramFree(state->s.graphics.dest);
    VramFree(state->s2.graphics.dest);

    gDispCnt &= ~0xE000;
}

void TaskDestructor_805BC90(struct Task *t) { }