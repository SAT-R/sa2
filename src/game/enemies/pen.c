#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "game/enemies/pen.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unused;
    /* 0x50 */ bool8 clampParam;
    /* 0x51 */ bool8 boosting;
} Sprite_Pen; /* 0x54 */

static void Task_PenMove(void);
static void Task_PenTurn(void);

#define PEN_BOOST_SPEED Q(2.0)
#define PEN_MOVE_SPEED  Q(0.5)

void CreateEntity_Pen(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_PenMove, sizeof(Sprite_Pen), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Pen *pen = TASK_DATA(t);
    Sprite *s = &pen->s;
    pen->base.regionX = spriteRegionX;
    pen->base.regionY = spriteRegionY;
    pen->base.me = me;
    pen->base.meX = me->x;
    pen->base.id = spriteY;

    if (me->d.sData[1] != 0) {
        pen->clampParam = TRUE;
    } else {
        pen->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_GROUND(pen, me);

    pen->unused = 0;
    pen->boosting = FALSE;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 12, SA2_ANIM_PEN, SA2_ANIM_PEN_VARIANT_MOVE, 18, 2);
}

static void Task_PenMove(void)
{
    Sprite_Pen *pen = TASK_DATA(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;
    s32 posX_24_8;

    if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
        if (pen->boosting) {
            pen->offsetX += PEN_BOOST_SPEED;
        } else {
            pen->offsetX += PEN_MOVE_SPEED;
        }
    } else {
        if (pen->boosting) {
            pen->offsetX -= PEN_BOOST_SPEED;
        } else {
            pen->offsetX -= PEN_MOVE_SPEED;
        }
    }

    ENEMY_CLAMP_TO_GROUND(pen, pen->clampParam);

    ENEMY_UPDATE_POSITION(pen, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(pen, me, s);

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        s32 playerX = gPlayer.qWorldX;
        // Feels like a fake match, oh well
        posX_24_8 = Q(pos.x);
        if (playerX > posX_24_8 && playerX < Q(pos.x + 100)) {
            if (!pen->boosting) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = SA2_ANIM_PEN_VARIANT_BOOST;
                s->prevVariant = -1;
            }
            pen->boosting = TRUE;
        }
    } else {
        s32 playerX = gPlayer.qWorldX;
        posX_24_8 = Q(pos.x);
        if (playerX < posX_24_8 && playerX > Q(pos.x - 100)) {
            if (!pen->boosting) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = SA2_ANIM_PEN_VARIANT_BOOST;
                s->prevVariant = -1;
            }
            pen->boosting = TRUE;
        }
    }

    // Turn when end of range reached
    if (ENEMY_CROSSED_LEFT_BORDER(pen, me) && !(s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
        gCurTask->main = Task_PenTurn;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_TURN;
        s->prevVariant = -1;
    } else if (ENEMY_CROSSED_RIGHT_BORDER(pen, me) && (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
        gCurTask->main = Task_PenTurn;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_TURN;
        s->prevVariant = -1;
    }

    // TODO: Fix posX_24_8!
    ENEMY_UPDATE_EX_RAW(s, posX_24_8, Q(pos.y), {});
}

static void Task_PenTurn(void)
{
    Sprite_Pen *pen = TASK_DATA(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;

    ENEMY_CLAMP_TO_GROUND(pen, pen->clampParam);

    ENEMY_UPDATE_POSITION(pen, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(pen, me, s);

    Player_UpdateHomingPosition(Q(pos.x), Q(pos.y));
    if (UpdateSpriteAnimation(s) == 0) {
        pen->boosting = FALSE;
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        }
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_MOVE;
        s->prevVariant = -1;
        gCurTask->main = Task_PenMove;
    }
    DisplaySprite(s);
}
