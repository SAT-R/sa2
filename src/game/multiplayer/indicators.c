#include "global.h"
#include "sprite.h"
#include "game/game.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ u8 playerId;
    /* 0x04 */ SpriteTransform transform;
    /* 0x10 */ Sprite spr;
} OpponentIndicator; /* size: 0x40 */

typedef struct {
    /* 0x00 */ Sprite spr;
} SelfIndicator; /* size: 0x40 */

#define RESERVED_INDICATOR_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2700)

void Task_801951C(void);
void Task_8019898(void);
void Task_SelfPositionIndicator(void);
void TaskDestructor_8019CC8(struct Task *);

void CreateOpponentPositionIndicator(u8 sid)
{
    struct Task *t;
    Sprite *spr;
    SpriteTransform *transform;
    OpponentIndicator *pi;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_801951C, sizeof(OpponentIndicator), 0x2001, 0,
                       TaskDestructor_8019CC8);
    } else {
        t = TaskCreate(Task_8019898, sizeof(OpponentIndicator), 0x2001, 0,
                       TaskDestructor_8019CC8);
    }

    pi = TASK_DATA(t);

    pi->playerId = sid;

    spr = &pi->spr;
    transform = &pi->transform;
    spr->graphics.dest = RESERVED_INDICATOR_TILES_VRAM;
    spr->unk1A = 0x40;
    spr->graphics.size = 0;
    spr->animCursor = 0;
    spr->timeUntilNextFrame = 0;
    spr->prevVariant = -1;
    spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    spr->palId = sid;
    spr->hitboxes[0].index = -1;
    spr->unk10 = SPRITE_FLAG(19, 1) | SPRITE_FLAG(18, 1)
        | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE;

    spr->graphics.anim = SA2_ANIM_INDICATOR_SONIC;
    spr->variant = 0;
    transform->width = 0x100;
    transform->height = 0x100;
    transform->rotation = 0;
}

void CreateSelfPositionIndicator(void)
{
    struct Task *t;
    Sprite *spr;
    SelfIndicator *pi;

    t = TaskCreate(Task_SelfPositionIndicator, sizeof(SelfIndicator), 0x2000, 0, NULL);

    pi = TASK_DATA(t);

    spr = &pi->spr;
    spr->graphics.dest = RESERVED_INDICATOR_TILES_VRAM;
    spr->unk1A = 0x40;
    spr->graphics.size = 0;
    spr->animCursor = 0;
    spr->timeUntilNextFrame = 0;
    spr->prevVariant = -1;
    spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    spr->palId = 0;
    spr->hitboxes[0].index = -1;
    spr->unk10 = SPRITE_FLAG(18, 1);

    spr->graphics.anim = SA2_ANIM_INDICATOR_SONIC;
    spr->variant = 0;
    UpdateSpriteAnimation(spr);
}

/*
 * These two procedures match
 *
void Task_SelfPositionIndicator(void)
{
    SelfIndicator *pi = TASK_DATA(gCurTask);
    Sprite *s = &pi->spr;
    UpdateSpriteAnimation(s);
}

void TaskDestructor_8019CC8(OpponentIndicator *pi)
{
    return;
}
*/