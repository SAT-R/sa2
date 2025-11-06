#include "global.h"
#include "sprite.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/camera.h"
#include "game/multiplayer/mp_player.h"

#include "constants/animations.h"

#ifndef COLLECT_RINGS_ROM
#define RESERVED_INDICATOR_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2700)
#else
#define RESERVED_INDICATOR_TILES_VRAM (void *)(OBJ_VRAM0 + 0x3640)
#endif

#define RETURN_IF_PLAYER_ONSCREEN(posX, posY, camX, camY)                                                                                  \
    if (((posX) - (camX) >= 0) && ((posX) - (camX) <= DISPLAY_WIDTH)) {                                                                    \
        if ((((posY) - (camY)) >= 0)) {                                                                                                    \
            if ((((posY) - (camY)) <= DISPLAY_HEIGHT)) {                                                                                   \
                return;                                                                                                                    \
            }                                                                                                                              \
        }                                                                                                                                  \
    }

// This was likely not a macro and instead a copy and paste, but it's
// nicer that we can clean up this code a bit to re-use the logic
#define UPDATE_INDICATOR(targetX, targetY, s, transf)                                                                                      \
    ({                                                                                                                                     \
        s32 opponentDistSq;                                                                                                                \
        s16 rot, tfx, tfy;                                                                                                                 \
        s16 r1 = (targetX);                                                                                                                \
        s16 r4 = (targetY);                                                                                                                \
                                                                                                                                           \
        if (((targetX) != 0) && ((targetY) != 0)) {                                                                                        \
            while ((ABS(r1) >= 128) || (ABS(r4) >= 128)) {                                                                                 \
                r1 = r1 / 2;                                                                                                               \
                r4 = r4 / 2;                                                                                                               \
                                                                                                                                           \
                if (ABS(r1) < 2) {                                                                                                         \
                    break;                                                                                                                 \
                }                                                                                                                          \
                                                                                                                                           \
                if (ABS(r4) < 2) {                                                                                                         \
                    break;                                                                                                                 \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        if (ABS(r1) < 2) {                                                                                                                 \
            if (r4 > 0) {                                                                                                                  \
                rot = 256;                                                                                                                 \
            } else {                                                                                                                       \
                rot = 768;                                                                                                                 \
            }                                                                                                                              \
        } else if (ABS(r4) < 2) {                                                                                                          \
            rot = 512;                                                                                                                     \
            if (r1 > 0) {                                                                                                                  \
                rot = 0;                                                                                                                   \
            }                                                                                                                              \
        } else {                                                                                                                           \
            rot = sub_8004418(r4, r1);                                                                                                     \
        }                                                                                                                                  \
                                                                                                                                           \
        (transf)->rotation = (rot + 256) & ONE_CYCLE;                                                                                      \
        opponentDistSq = SQUARE((targetX)) + SQUARE((targetY));                                                                            \
                                                                                                                                           \
        if (opponentDistSq < 0x10000) {                                                                                                    \
            (s)->animSpeed = opponentDistSq < 0x10000 ? SPRITE_ANIM_SPEED(1.5) : SPRITE_ANIM_SPEED(1.0);                                   \
        } else {                                                                                                                           \
            (s)->animSpeed = SPRITE_ANIM_SPEED(1.0);                                                                                       \
        }                                                                                                                                  \
                                                                                                                                           \
        if (opponentDistSq > 0x06000000) {                                                                                                 \
            (transf)->qScaleX = Q(0.25);                                                                                                   \
            (transf)->qScaleY = Q(0.25);                                                                                                   \
        } else if (opponentDistSq < SQUARE(256)) {                                                                                         \
            (transf)->qScaleX = Q(1.875);                                                                                                  \
            (transf)->qScaleY = Q(1.875);                                                                                                  \
        } else {                                                                                                                           \
            s32 dist = (0x06000000 - opponentDistSq) >> 16;                                                                                \
            s32 scale = Div(dist * Q(1.625), Q(5.99609375)) + Q(0.25);                                                                     \
            (transf)->qScaleX = scale;                                                                                                     \
            (transf)->qScaleY = scale;                                                                                                     \
        }                                                                                                                                  \
                                                                                                                                           \
        if (rot == 0) {                                                                                                                    \
            tfy = (DISPLAY_HEIGHT / 2);                                                                                                    \
            tfx = DISPLAY_WIDTH;                                                                                                           \
        } else if (rot == 256) {                                                                                                           \
            tfy = DISPLAY_HEIGHT;                                                                                                          \
            tfx = (DISPLAY_WIDTH / 2);                                                                                                     \
        } else if (rot == 512) {                                                                                                           \
            tfy = (DISPLAY_HEIGHT / 2);                                                                                                    \
            tfx = 0;                                                                                                                       \
        } else if (rot == 768) {                                                                                                           \
            tfy = 0;                                                                                                                       \
            tfx = (DISPLAY_WIDTH / 2);                                                                                                     \
        } else {                                                                                                                           \
            if ((targetX) > 0) {                                                                                                           \
                s16 divRes = Div(SIN_24_8(rot) * 256, COS_24_8(rot));                                                                      \
                tfy = ((divRes * 15) >> 5) + (DISPLAY_HEIGHT / 2);                                                                         \
                                                                                                                                           \
                if ((targetY) > 0) {                                                                                                       \
                    if (tfy >= DISPLAY_HEIGHT) {                                                                                           \
                        s32 sinVal;                                                                                                        \
                        tfy = DISPLAY_HEIGHT;                                                                                              \
                        sinVal = (256 - rot) & ONE_CYCLE;                                                                                  \
                        divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));                                                            \
                        tfx = ((divRes * 5) >> 4) + (DISPLAY_WIDTH / 2);                                                                   \
                    } else {                                                                                                               \
                        tfx = DISPLAY_WIDTH;                                                                                               \
                    }                                                                                                                      \
                } else {                                                                                                                   \
                    if (tfy < 0) {                                                                                                         \
                        s32 sinVal;                                                                                                        \
                        tfy = 0;                                                                                                           \
                        sinVal = (256 - rot) & ONE_CYCLE;                                                                                  \
                        divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));                                                            \
                        tfx = (DISPLAY_WIDTH / 2) - ((divRes * 5) >> 4);                                                                   \
                    } else {                                                                                                               \
                        tfx = DISPLAY_WIDTH;                                                                                               \
                    }                                                                                                                      \
                }                                                                                                                          \
                                                                                                                                           \
            } else {                                                                                                                       \
                s16 divRes                                                                                                                 \
                    = Div((SIN_24_8((rot - (SIN_PERIOD / 2)) & ONE_CYCLE)) * 0x100, (COS_24_8((rot - (SIN_PERIOD / 2)) & ONE_CYCLE)));     \
                tfy = (DISPLAY_HEIGHT / 2) - ((divRes * 15) >> 5);                                                                         \
                if ((targetY) > 0) {                                                                                                       \
                    if (tfy >= DISPLAY_HEIGHT) {                                                                                           \
                        s32 sinVal;                                                                                                        \
                        tfy = DISPLAY_HEIGHT;                                                                                              \
                        sinVal = (768 - rot) & ONE_CYCLE;                                                                                  \
                        divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));                                                            \
                        tfx = ((divRes * 5) >> 4) + (DISPLAY_WIDTH / 2);                                                                   \
                    } else {                                                                                                               \
                        tfx = 0;                                                                                                           \
                    }                                                                                                                      \
                } else {                                                                                                                   \
                    if (tfy < 0) {                                                                                                         \
                        s32 sinVal;                                                                                                        \
                        tfy = 0;                                                                                                           \
                                                                                                                                           \
                        sinVal = (768 - rot) & ONE_CYCLE;                                                                                  \
                        divRes = Div(SIN_24_8(sinVal) * 256, COS_24_8(sinVal));                                                            \
                        tfx = (DISPLAY_WIDTH / 2) - ((divRes * 5) >> 4);                                                                   \
                    } else {                                                                                                               \
                        tfx = 0;                                                                                                           \
                    }                                                                                                                      \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
        (transf)->x = tfx;                                                                                                                 \
        (transf)->y = tfy;                                                                                                                 \
                                                                                                                                           \
        (s)->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;                                                                                    \
        (s)->frameFlags |= gOamMatrixIndex++;                                                                                              \
        UpdateSpriteAnimation((s));                                                                                                        \
        TransformSprite((s), (transf));                                                                                                    \
        DisplaySprite((s));                                                                                                                \
    })

typedef struct {
    /* 0x00 */ u8 playerId;
    /* 0x04 */ SpriteTransform transform;
    /* 0x10 */ Sprite spr;
} OpponentIndicator; /* size: 0x40 */

typedef struct {
    /* 0x00 */ Sprite spr;
} SelfIndicator; /* size: 0x40 */

#ifndef COLLECT_RINGS_ROM
static void Task_801951C(void);
#endif
static void Task_8019898(void);
static void Task_SelfPositionIndicator(void);
static void TaskDestructor_8019CC8(struct Task *);

void CreateOpponentPositionIndicator(u8 sid)
{
    struct Task *t;
    Sprite *spr;
    SpriteTransform *transform;
    OpponentIndicator *pi;

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_801951C, sizeof(OpponentIndicator), 0x2001, 0, TaskDestructor_8019CC8);
    } else
#endif
    {
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

#ifndef COLLECT_RINGS_ROM
static void Task_801951C(void)
{
    OpponentIndicator *pi = TASK_DATA(gCurTask);
    struct Task *t = gMultiplayerPlayerTasks[pi->playerId];
    MultiplayerPlayer *mpp = TASK_DATA(t);
    Sprite *spr = &pi->spr;
    SpriteTransform *transform = &pi->transform;

    s16 opponentX2, opponentY2;

    RETURN_IF_PLAYER_ONSCREEN(mpp->pos.x, mpp->pos.y, gCamera.x, gCamera.y);

    opponentX2 = (unsigned)(mpp->pos.x - (DISPLAY_WIDTH / 2) - gCamera.x);
    opponentY2 = (unsigned)(mpp->pos.y - (DISPLAY_HEIGHT / 2) - gCamera.y);

    UPDATE_INDICATOR(opponentX2, opponentY2, spr, transform);
}
#endif

static void Task_8019898(void)
{
    OpponentIndicator *pi = TASK_DATA(gCurTask);
    struct Task *t = gMultiplayerPlayerTasks[pi->playerId];
    MultiplayerPlayer *mpp = TASK_DATA(t);
    Sprite *spr = &pi->spr;
    SpriteTransform *transform = &pi->transform;

    s32 normalizedCamX, normalizedCamY;
    s16 opponentX, opponentY;

    RETURN_IF_PLAYER_ONSCREEN(mpp->pos.x, mpp->pos.y, gCamera.x, gCamera.y);
    // _08019576

    opponentX = (unsigned)(mpp->pos.x - (DISPLAY_WIDTH / 2) - gCamera.x);
    opponentY = (unsigned)(mpp->pos.y - (DISPLAY_HEIGHT / 2) - gCamera.y);

    // Only addition is from here
    if (gCamera.x >= 961) {
        normalizedCamX = gCamera.x - 1440;
        normalizedCamY = gCamera.y - 864;
    } else {
        normalizedCamX = gCamera.x + 1440;
        normalizedCamY = gCamera.y + 864;
    }

    RETURN_IF_PLAYER_ONSCREEN(mpp->pos.x, mpp->pos.y, normalizedCamX, normalizedCamY);

    normalizedCamX = ({ mpp->pos.x - (DISPLAY_WIDTH / 2); }) - normalizedCamX;
    normalizedCamY = ({ mpp->pos.y - (DISPLAY_HEIGHT / 2); }) - normalizedCamY;

    if (MAX(ABS(opponentX), ABS(opponentY)) > MAX(ABS(normalizedCamX), ABS(normalizedCamY))) {
        opponentX = normalizedCamX;
        opponentY = normalizedCamY;
    }

    UPDATE_INDICATOR(opponentX, opponentY, spr, transform);
}

static void Task_SelfPositionIndicator(void)
{
    SelfIndicator *pi = TASK_DATA(gCurTask);
    Sprite *s = &pi->spr;
    UpdateSpriteAnimation(s);
}

static void TaskDestructor_8019CC8(struct Task *t) { return; }
