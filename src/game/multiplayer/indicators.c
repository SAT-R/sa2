#include "global.h"
#include "sprite.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/camera.h"
#include "game/multiplayer/mp_player.h"

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
        t = TaskCreate(Task_801951C, sizeof(OpponentIndicator), 0x2001, 0, TaskDestructor_8019CC8);
    } else {
        t = TaskCreate(Task_8019898, sizeof(OpponentIndicator), 0x2001, 0, TaskDestructor_8019CC8);
    }

    pi = TASK_DATA(t);

    pi->playerId = sid;

    spr = &pi->spr;
    transform = &pi->transform;
    spr->graphics.dest = RESERVED_INDICATOR_TILES_VRAM;
    spr->oamFlags = SPRITE_OAM_ORDER(1);
    spr->graphics.size = 0;
    spr->animCursor = 0;
    spr->qAnimDelay = 0;
    spr->prevVariant = -1;
    spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    spr->palId = sid;
    spr->hitboxes[0].index = -1;
    spr->frameFlags = SPRITE_FLAG(19, 1) | SPRITE_FLAG(18, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE;

    spr->graphics.anim = SA2_ANIM_INDICATOR_SONIC;
    spr->variant = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
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
    spr->oamFlags = SPRITE_OAM_ORDER(1);
    spr->graphics.size = 0;
    spr->animCursor = 0;
    spr->qAnimDelay = 0;
    spr->prevVariant = -1;
    spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    spr->palId = 0;
    spr->hitboxes[0].index = -1;
    spr->frameFlags = SPRITE_FLAG(18, 1);

    spr->graphics.anim = SA2_ANIM_INDICATOR_SONIC;
    spr->variant = 0;
    UpdateSpriteAnimation(spr);
}

void Task_801951C(void)
{
    s32 opponentX, opponentY;
    s32 opponentDistSq;

    s16 opponentX2, opponentY2;
    s16 r1, r4;

    s16 r4_2;
    s16 tfx, tfy;
    s32 sinVal;
    Sprite *spr;
    SpriteTransform *transform;
    OpponentIndicator *pi;
    struct Task *t;
    MultiplayerPlayer *mpp;

    pi = TASK_DATA(gCurTask);
    t = gMultiplayerPlayerTasks[pi->playerId];
    mpp = TASK_DATA(t);
    spr = &pi->spr;
    transform = &pi->transform;

    opponentX = mpp->pos.x - gCamera.x;

    if ((opponentX >= 0) && (opponentX <= DISPLAY_WIDTH)) {
        opponentY = mpp->pos.y - gCamera.y;

        if ((opponentY >= 0)) {
            if ((opponentY <= DISPLAY_HEIGHT)) {
                return;
            }
        }
    }
    // _08019576

    opponentX2 = (unsigned)(mpp->pos.x - (DISPLAY_WIDTH / 2) - gCamera.x);
    opponentY2 = (unsigned)(mpp->pos.y - (DISPLAY_HEIGHT / 2) - gCamera.y);

    r1 = opponentX2;
    r4 = opponentY2;

    if ((opponentX2 != 0) && (opponentY2 != 0)) {
        while ((ABS(r1) >= 128) || (ABS(r4) >= 128)) {
            r1 = r1 / 2;
            r4 = r4 / 2;

            if (ABS(r1) < 2) {
                break;
            }

            if (ABS(r4) < 2) {
                break;
            }
        }
    }
    // _08019616

    if (ABS(r1) < 2) {
        // _08019622+4
        if (r4 > 0) {
            r4_2 = Q_24_8(1.0);
        } else {
            r4_2 = Q_24_8(3.0);
        }
    } else if (ABS(r4) < 2) {
        // _08019636
        r4_2 = Q_24_8(2.0);
        if (r1 > 0) {
            r4_2 = Q_24_8(0);
        }
    } else {
        r4_2 = sub_8004418(r4, r1);
    }
    transform->rotation = (r4_2 + Q_24_8(1.0)) & ONE_CYCLE;
    // __0801966E
    opponentDistSq = SQUARE(opponentX2) + SQUARE(opponentY2);

    if (opponentDistSq < SQUARE(256)) {
        spr->animSpeed = opponentDistSq < SQUARE(256) ? SPRITE_ANIM_SPEED(1.5) : SPRITE_ANIM_SPEED(1.0);
    } else {
        spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    if (opponentDistSq > 0x06000000) {
        transform->qScaleX = Q(0.25);
        transform->qScaleY = Q(0.25);
    } else if (opponentDistSq < SQUARE(256)) {
        transform->qScaleX = Q(1.875);
        transform->qScaleY = Q(1.875);
    } else {
        // _080196C0
        s32 dist = (0x06000000 - opponentDistSq) >> 16;
        s32 scale = Div(dist * Q(1.625), Q(5.99609375)) + Q(0.25);
        transform->qScaleX = scale;
        transform->qScaleY = scale;
    }
    // _080196DC

    if (r4_2 == 0) {
        tfy = (DISPLAY_HEIGHT / 2);
        tfx = DISPLAY_WIDTH;
    } else if (r4_2 == 256) {
        tfy = DISPLAY_HEIGHT;
        tfx = (DISPLAY_WIDTH / 2);
    } else if (r4_2 == 512) {
        tfy = (DISPLAY_HEIGHT / 2);
        tfx = 0;
    } else if (r4_2 == 768) {
        tfy = 0;
        tfx = (DISPLAY_WIDTH / 2);
    } else {
        // _08019716
        if (opponentX2 > 0) {
            s16 divRes = Div(SIN_24_8(r4_2) * 256, COS_24_8(r4_2));
            tfy = ((divRes * 15) >> 5) + (DISPLAY_HEIGHT / 2);

            if (opponentY2 > 0) {
                if (tfy >= DISPLAY_HEIGHT) {
                    tfy = DISPLAY_HEIGHT;

                    sinVal = (256 - r4_2) & ONE_CYCLE;
                    divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));
                    tfx = ((divRes * 5) >> 4) + (DISPLAY_WIDTH / 2);
                } else {
                    tfx = DISPLAY_WIDTH;
                }
            } else {
                // _08019768
                if (tfy < 0) {
                    tfy = 0;

                    sinVal = (256 - r4_2) & ONE_CYCLE;
                    divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));
                    tfx = (DISPLAY_WIDTH / 2) - ((divRes * 5) >> 4);
                } else {
                    tfx = DISPLAY_WIDTH;
                }
            }

            // _08019818
        } else {
            // _0801977C
            s16 divRes = Div((SIN_24_8((r4_2 - (SIN_PERIOD / 2)) & ONE_CYCLE)) * 256, (COS_24_8((r4_2 - (SIN_PERIOD / 2)) & ONE_CYCLE)));
            tfy = (DISPLAY_HEIGHT / 2) - ((divRes * 15) >> 5);

            if (opponentY2 > 0) {
                if (tfy >= DISPLAY_HEIGHT) {
                    tfy = DISPLAY_HEIGHT;

                    sinVal = (768 - r4_2) & ONE_CYCLE;
                    divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));
                    tfx = ((divRes * 5) >> 4) + (DISPLAY_WIDTH / 2);
                } else {
                    tfx = 0;
                }

            } else {
                // _08019808
                if (tfy < 0) {
                    tfy = 0;

                    sinVal = (768 - r4_2) & ONE_CYCLE;
                    divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));
                    tfx = (DISPLAY_WIDTH / 2) - ((divRes * 5) >> 4);
                } else {
                    // _08019848
                    tfx = 0;
                }
            }
        }
    }
    transform->x = tfx;
    transform->y = tfy;

    // _0801984A+6
    spr->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
    spr->frameFlags |= gUnknown_030054B8++;
    UpdateSpriteAnimation(spr);
    TransformSprite(spr, transform);
    DisplaySprite(spr);
}

// Almost identical to Task_801951C
NONMATCH("asm/non_matching/Task_8019898.inc", void Task_8019898()) { }
END_NONMATCH

void Task_SelfPositionIndicator(void)
{
    SelfIndicator *pi = TASK_DATA(gCurTask);
    Sprite *s = &pi->spr;
    UpdateSpriteAnimation(s);
}

void TaskDestructor_8019CC8(struct Task *t) { return; }
