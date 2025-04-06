#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"
#include "game/enemies/star.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 spawnX;
    s32 spawnY;
    u8 timer;
} Sprite_Star;

static void Task_StarIdle(void);
static void Task_StarClose(void);
static void Task_StarSpin(void);
static void Task_StarOpen(void);

#define IDLE_TIME       GBA_FRAMES_PER_SECOND * 2
#define SPIN_TIME       GBA_FRAMES_PER_SECOND * 2
#define OPEN_CLOSE_TIME GBA_FRAMES_PER_SECOND / 3

#define STAR_SWITCH_TASK_ON_TIMER_ZERO(_star, _sprite, _time, _anim, _variant, _task)                                                      \
    if (--_star->timer == 0) {                                                                                                             \
        _star->timer = _time;                                                                                                              \
        _sprite->graphics.anim = _anim;                                                                                                    \
        _sprite->variant = _variant;                                                                                                       \
        _sprite->prevVariant = -1;                                                                                                         \
        gCurTask->main = _task;                                                                                                            \
    }

void CreateEntity_Star(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StarIdle, sizeof(Sprite_Star), 0x4050, 0, TaskDestructor_80095E8);
    Sprite_Star *star = TASK_DATA(t);
    Sprite *s = &star->s;
    star->base.regionX = spriteRegionX;
    star->base.regionY = spriteRegionY;
    star->base.me = me;
    star->base.spriteX = me->x;
    star->base.id = spriteY;

    ENEMY_SET_SPAWN_POS_STATIC(star, me);

    star->timer = IDLE_TIME;

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 25, SA2_ANIM_STAR, 0, 18, 2);
}

#define STAR_TASK(_time, _anim, _variant, _nextTask, _code_insert)                                                                         \
    {                                                                                                                                      \
        Sprite_Star *star = TASK_DATA(gCurTask);                                                                                           \
        Sprite *s = &star->s;                                                                                                              \
        MapEntity *me = star->base.me;                                                                                                     \
                                                                                                                                           \
        Vec2_32 pos;                                                                                                                       \
        ENEMY_UPDATE_POSITION_STATIC(star, s, pos.x, pos.y);                                                                               \
                                                                                                                                           \
        { _code_insert };                                                                                                                  \
        ENEMY_DESTROY_IF_OFFSCREEN_RAW(star, me, s, pos.x, pos.y);                                                                         \
                                                                                                                                           \
        STAR_SWITCH_TASK_ON_TIMER_ZERO(star, s, _time, _anim, _variant, _nextTask);                                                        \
                                                                                                                                           \
        ENEMY_UPDATE_EX_RAW(s, star->spawnX, star->spawnY, {});                                                                            \
    }

static void Task_StarIdle(void) { STAR_TASK(OPEN_CLOSE_TIME, SA2_ANIM_STAR, 1, Task_StarClose, { ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos) }); }

static void Task_StarClose(void)
{
    STAR_TASK(SPIN_TIME, SA2_ANIM_STAR, 2, Task_StarSpin, { Player_EnemySpriteCollision(s, pos.x, pos.y); });
}

static void Task_StarSpin(void)
{
    STAR_TASK(OPEN_CLOSE_TIME, SA2_ANIM_STAR, 3, Task_StarOpen, { Player_EnemySpriteCollision(s, pos.x, pos.y); });
}

static void Task_StarOpen(void)
{
    STAR_TASK(IDLE_TIME, SA2_ANIM_STAR, 0, Task_StarIdle, { Player_EnemySpriteCollision(s, pos.x, pos.y); });
}
