#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"

#if (GAME == GAME_SA1)
#include "constants/sa1/animations.h"
#elif (GAME == GAME_SA2)
#include "constants/sa2/animations.h"
#endif

void Task_CreateEnemyDefeatScore_MoveUp(void);
void Task_CreateEnemyDefeatScore_Hold(void);
void TaskDestructor_CreateEnemyDefeatScore(Task *);

typedef struct {
    Sprite s;
    s16 deltaY;
} EnemyDefeatScore;

void CreateEnemyDefeatScore(s16 x, s16 y)
{
    Task *t = TaskCreate(Task_CreateEnemyDefeatScore_MoveUp, sizeof(EnemyDefeatScore), 0x2000, 0, TaskDestructor_CreateEnemyDefeatScore);
    EnemyDefeatScore *score = TASK_DATA(t);
    Sprite *s = &score->s;

    score->deltaY = 0;
    score->s.x = x;
    score->s.y = y;

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SCORE);
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_SCORE);
#endif
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->graphics.size = 0;
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_SCORE;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_SCORE;
#endif
    s->variant = gPlayer.defeatScoreIndex;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_CreateEnemyDefeatScore_MoveUp(void)
{
    EnemyDefeatScore *score = TASK_DATA(gCurTask);
    Sprite *s = &score->s;

    s16 scoreX = s->x;
    s16 scoreY = s->y;

    score->deltaY++;

    s->x -= gCamera.x;
    s->y -= gCamera.y + score->deltaY;

    if (score->deltaY >= 60) {
        gCurTask->main = Task_CreateEnemyDefeatScore_Hold;

        DisplaySprite(s);
        s->x = scoreX;
        s->y = scoreY - score->deltaY;
        score->deltaY = 0;
    } else {
        DisplaySprite(s);
        s->x = scoreX;
        s->y = scoreY;
    }
}

void Task_CreateEnemyDefeatScore_Hold(void)
{
    EnemyDefeatScore *score = TASK_DATA(gCurTask);
    Sprite *s = &score->s;

    s16 scoreX = s->x;
    s16 scoreY = s->y;

    s->x -= gCamera.x;
    s->y -= gCamera.y;

    score->deltaY++;

    if (score->deltaY > 30) {
        TaskDestroy(gCurTask);
    } else {
        s->x = scoreX - gCamera.x;
        s->y = scoreY - gCamera.y;
        DisplaySprite(s);
        s->x = scoreX;
        s->y = scoreY;
    }
}

void TaskDestructor_CreateEnemyDefeatScore(Task *t)
{
    EnemyDefeatScore *score = TASK_DATA(t);

    VramFree(score->s.graphics.dest);
}