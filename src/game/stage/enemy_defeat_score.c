#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/game.h"

#include "constants/animations.h"

void Task_CreateEnemyDefeatScore_MoveUp(void);
void Task_CreateEnemyDefeatScore_Hold(void);
void TaskDestructor_CreateEnemyDefeatScore(struct Task *);

typedef struct {
    Sprite s;
    s16 deltaY;
} EnemyDefeatScore;

void CreateEnemyDefeatScore(s16 x, s16 y)
{
    struct Task *t
        = TaskCreate(Task_CreateEnemyDefeatScore_MoveUp, sizeof(EnemyDefeatScore),
                     0x2000, 0, TaskDestructor_CreateEnemyDefeatScore);
    EnemyDefeatScore *score = TaskGetStructPtr(t);
    Sprite *s = &score->s;

    score->deltaY = 0;
    score->s.x = x;
    score->s.y = y;

    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_SCORE);
    s->unk1A = 0;
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SCORE;
    s->variant = gPlayer.defeatScoreIndex;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    sub_8004558(s);
}

void Task_CreateEnemyDefeatScore_MoveUp(void)
{
    EnemyDefeatScore *score = TaskGetStructPtr(gCurTask);
    Sprite *s = &score->s;

    s16 scoreX = s->x;
    s16 scoreY = s->y;

    score->deltaY++;

    s->x -= gCamera.x;
    s->y -= gCamera.y + score->deltaY;

    if (score->deltaY >= 60) {
        gCurTask->main = Task_CreateEnemyDefeatScore_Hold;

        sub_80051E8(s);
        s->x = scoreX;
        s->y = scoreY - score->deltaY;
        score->deltaY = 0;
    } else {
        sub_80051E8(s);
        s->x = scoreX;
        s->y = scoreY;
    }
}

void Task_CreateEnemyDefeatScore_Hold(void)
{
    EnemyDefeatScore *score = TaskGetStructPtr(gCurTask);
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
        sub_80051E8(s);
        s->x = scoreX;
        s->y = scoreY;
    }
}

void TaskDestructor_CreateEnemyDefeatScore(struct Task *t)
{
    EnemyDefeatScore *score = TaskGetStructPtr(t);

    VramFree(score->s.graphics.dest);
}