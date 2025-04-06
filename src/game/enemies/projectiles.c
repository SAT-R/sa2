#include "global.h"
#include "game/entity.h"
#include "game/enemies/projectiles.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 x;
    /* 0x34 */ s32 y;
    /* 0x38 */ s16 velocityX;
    /* 0x3A */ s16 velocityY;
} ProjectileA; /* size: 0x3C */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Vec2_32 positions[NUM_PROJECTILES_MAX];
    /* 0x50 */ s16 velocities[NUM_PROJECTILES_MAX][2];
    /* 0x60 */ u8 count;
    /* 0x61 */ bool8 isActive[NUM_PROJECTILES_MAX];
} ProjectileB; /* size: 0x68 */

void Task_805102C(void);
void Task_80510B0(void);
void Task_DestroyProjectileTask(void);
void TaskDestructor_80511EC(struct Task *);
void TaskDestructor_8051200(struct Task *);

void CreateProjectile(ProjInit *init)
{
    struct Task *t = TaskCreate(Task_805102C, sizeof(ProjectileA), 0x4000, 0, TaskDestructor_80511EC);
    ProjectileA *proj = TASK_DATA(t);
    Sprite *s;
    s32 velocityX, velocityY;

    proj->x = init->x;
    proj->y = init->y;

    velocityX = (COS(init->rot) * init->speed) >> 14;
    proj->velocityX = velocityX;

    velocityY = (SIN(init->rot) * init->speed) >> 14;
    proj->velocityY = velocityY;

    s = &proj->s;
    SPRITE_INIT_WITH_POS(s, init->numTiles, init->anim, init->variant, 8, 1);
}

void CreateSeveralProjectiles(ProjInit *init, u8 count, s8 spreadAngle)
{
    struct Task *t = TaskCreate(Task_80510B0, sizeof(ProjectileB), 0x4000, 0, TaskDestructor_8051200);
    ProjectileB *proj = TASK_DATA(t);
    Sprite *s;
    u8 i;

    if (count > NUM_PROJECTILES_MAX)
        count = NUM_PROJECTILES_MAX;

    proj->count = count;

    for (i = 0; i < count; i++) {
        s16 rot;
        proj->positions[i].x = init->x;
        proj->positions[i].y = init->y;

        proj->velocities[i][0] = rot = ((i * spreadAngle) + init->rot) & ONE_CYCLE;

        proj->velocities[i][0] = (COS(rot) * init->speed) >> 14;
        proj->velocities[i][1] = (SIN(rot) * init->speed) >> 14;

        proj->isActive[i] = TRUE;
    }

    s = &proj->s;
    SPRITE_INIT_WITH_POS(s, init->numTiles, init->anim, init->variant, 8, 1);
}

void Task_805102C(void)
{
    ProjectileA *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;

    proj->x += proj->velocityX;
    proj->y += proj->velocityY;

    s->x = I(proj->x) - gCamera.x;
    s->y = I(proj->y) - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
    } else {
        Player_EnemySpriteCollision(s, I(proj->x), I(proj->y));
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_80510B0(void)
{
    ProjectileB *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    u8 count, i;

    UpdateSpriteAnimation(s);

    count = 0;
    for (i = 0; i < proj->count; i++) {
        if (!proj->isActive[i])
            continue;

        count++;

        proj->positions[i].x += proj->velocities[i][0];
        proj->positions[i].y += proj->velocities[i][1];

        s->x = I(proj->positions[i].x) - gCamera.x;
        s->y = I(proj->positions[i].y) - gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            proj->isActive[i] = FALSE;
        }

        Player_EnemySpriteCollision(s, I(proj->positions[i].x), I(proj->positions[i].y));
        DisplaySprite(s);
    }

    if (count == 0) {
        gCurTask->main = Task_DestroyProjectileTask;
    }
}

void Task_DestroyProjectileTask(void) { TaskDestroy(gCurTask); }

void TaskDestructor_80511EC(struct Task *t)
{
    ProjectileA *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}

void TaskDestructor_8051200(struct Task *t)
{
    ProjectileB *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}
