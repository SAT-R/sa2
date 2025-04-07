#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/iron_ball.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 posX;
    s32 posY;
    s32 unk44;
    s32 unk48;
    s16 unk4C;
    s16 unk4E;
    u16 unk50;
} Sprite_IronBall;

static void Task_Interactable095Main(void);

static void UpdatePosition(Sprite_IronBall *);
static void Render(Sprite_IronBall *);
static bool32 IsTouchingPlayer(Sprite_IronBall *);
static bool32 ShouldDespawn(Sprite_IronBall *);

static void TaskDestructor_IronBall(struct Task *);
static void Despawn(Sprite_IronBall *);

void CreateEntity_IronBall(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable095Main, sizeof(Sprite_IronBall), 0x2010, 0, TaskDestructor_IronBall);
    Sprite_IronBall *ball = TASK_DATA(t);
    Sprite *s;
    ball->unk44 = 0;
    ball->unk48 = 0;

    ball->base.me = me;
    ball->base.regionX = spriteRegionX;
    ball->base.regionY = spriteRegionY;
    ball->base.spriteX = me->x;
    ball->base.id = spriteY;

    s = &ball->s;
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 18, 2, 0);
    s->graphics.dest = VramMalloc(18);
    s->graphics.anim = SA2_ANIM_IRON_BALL;
    s->variant = 0;
    UpdateSpriteAnimation(s);

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            ball->unk4C = 4;
            ball->unk4E = 0;
            ball->unk50 = 0;
        } else {
            ball->unk4C = 4;
            ball->unk4E = 0;
            ball->unk50 = 0x80;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            ball->unk4C = 0;
            ball->unk4E = 4;
            ball->unk50 = 0;
        } else {
            ball->unk4C = 0;
            ball->unk4E = 4;
            ball->unk50 = 0x80;
        }
    }
    UpdatePosition(ball);
    Render(ball);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void UpdatePosition(Sprite_IronBall *ball)
{
    MapEntity *me = ball->base.me;

    if (ball->unk4C != 0) {
        s32 temp = me->d.uData[2] * Q(8);
        ball->unk44 = (temp * SIN((ball->unk4C * ((gStageTime + ball->unk50) & 255)) & ONE_CYCLE)) >> 15;
    }

    if (ball->unk4E != 0) {
        s32 temp = (me->d.uData[3] * Q(8));
        ball->unk48 = (temp * SIN((ball->unk4E * ((gStageTime + ball->unk50) & 255)) & ONE_CYCLE)) >> 15;
    }

    ball->posX = TO_WORLD_POS(ball->base.spriteX, ball->base.regionX) + I(ball->unk44);
    ball->posY = TO_WORLD_POS(me->y, ball->base.regionY) + I(ball->unk48);
}

static void Task_Interactable095Main(void)
{
    Sprite_IronBall *ball = TASK_DATA(gCurTask);

    UpdatePosition(ball);

    if (IsTouchingPlayer(ball)) {
        Coll_DamagePlayer(&gPlayer);
    }

    if (ShouldDespawn(ball)) {
        Despawn(ball);
        return;
    }
    Render(ball);
}

static void TaskDestructor_IronBall(struct Task *t)
{
    Sprite_IronBall *ball = TASK_DATA(t);
    VramFree(ball->s.graphics.dest);
}

static void Render(Sprite_IronBall *ball)
{
    ball->s.x = ball->posX - gCamera.x;
    ball->s.y = ball->posY - gCamera.y;
    ball->s.frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(&ball->s);
    ball->s.frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(&ball->s);
}

static bool32 ShouldDespawn(Sprite_IronBall *ball)
{
    MapEntity *me = ball->base.me;
    s16 x = ball->posX - gCamera.x;
    s16 y = ball->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_2(x, y, (me->d.uData[2] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2),
                          (me->d.uData[3] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static bool32 IsTouchingPlayer(Sprite_IronBall *ball)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    if (Coll_Player_Entity_Intersection(&ball->s, ball->posX, ball->posY, &gPlayer)
        & (COLL_FLAG_10000 | COLL_FLAG_20000 | COLL_FLAG_40000 | COLL_FLAG_80000)) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_IronBall *ball)
{
    ball->base.me->x = ball->base.spriteX;
    TaskDestroy(gCurTask);
}
