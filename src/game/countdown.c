#include "game/countdown.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/multiplayer/mp_player.h"
#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/text.h"

#define ALIGN_DIGITS_HORIZONTALLY TRUE
#define ALIGN_DIGITS_VERTICALLY   !TRUE

#if !PLATFORM_GBA && ALIGN_DIGITS_HORIZONTALLY
#define DIGITS_X (DISPLAY_WIDTH / 2)
#else
#define DIGITS_X ((I(gPlayer.qWorldX) - gCamera.x) + 24)
#endif

#if !PLATFORM_GBA && ALIGN_DIGITS_VERTICALLY
#define DIGITS_Y (DISPLAY_HEIGHT / 2)
#else
#define DIGITS_Y ((I(gPlayer.qWorldY) - gCamera.y) - 24)
#endif

typedef struct {
    Sprite sprMachine;
    Sprite sprCountdownDigits;
    u32 machineScreenX;
    u32 machineScreenY;
    s16 timer;
    bool8 speedBoost;
    bool8 boostDisabled;
} CourseStartCountdown;

typedef struct {
    Sprite sLeft;
    SpriteTransform transformLeft;
    Sprite sRight;
    SpriteTransform transformRight;
    u16 timer;
} RaceStartMessage; /* 0x7C */

void sub_8036168(void);
void TaskDestructor_CourseStartCountdown(struct Task *);
void CreateRaceStartMessage(void);
void sub_8036398(void);
void Task_RaceStartMessageMain(void);
void TaskDestructor_RaceStartMessage(struct Task *);

const TileInfo gUnknown_080D7518[NUM_CHARACTERS] = {
    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_SONIC)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_CREAM)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_TAILS)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_KNUCKLES)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_AMY)),
};

void CreateCourseStartCountdown(bool8 playerSkippedIntro)
{
    struct Task *t;
    CourseStartCountdown *countdown;
    Sprite *s;

    gStageFlags |= STAGE_FLAG__100;
    t = TaskCreate(sub_8036168, sizeof(CourseStartCountdown), 0x3000, 0, TaskDestructor_CourseStartCountdown);
    countdown = TASK_DATA(t);

    countdown->speedBoost = FALSE;
    countdown->boostDisabled = FALSE;

    if (!playerSkippedIntro) {
        countdown->timer = GBA_FRAMES_PER_SECOND * 5 + 10;
    } else {
        countdown->timer = GBA_FRAMES_PER_SECOND * 3;
    }

    s = &countdown->sprCountdownDigits;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_COUNTDOWN;
    s->variant = SA2_ANIM_VARIANT_COUNTDOWN_3;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;

    s = &countdown->sprMachine;
    SPRITE_INIT_FLAGS(s, 14, SA2_ANIM_LEVEL_START_MACHINE, 0, 18, 2, SPRITE_FLAG(X_FLIP, 1));
}

void sub_8036168(void)
{
    CourseStartCountdown *countdown = TASK_DATA(gCurTask);
    Sprite *s;

    // Skip intro
    if (IS_SINGLE_PLAYER && countdown->timer > (GBA_FRAMES_PER_SECOND * 3) && gPressedKeys & (A_BUTTON | B_BUTTON)) {
        countdown->timer = GBA_FRAMES_PER_SECOND * 3;
    }

    if (countdown->timer == GBA_FRAMES_PER_SECOND * 3) {
        m4aSongNumStart(VOICE__ANNOUNCER__3);
    } else if (countdown->timer == GBA_FRAMES_PER_SECOND * 2) {
        m4aSongNumStart(VOICE__ANNOUNCER__2);
    } else if (countdown->timer == GBA_FRAMES_PER_SECOND * 1) {
        m4aSongNumStart(VOICE__ANNOUNCER__1);
    }

    if (--countdown->timer == 0) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        // Uncomment to skip straight to level ending
        // gPlayer.moveState |= MOVESTATE_GOAL_REACHED;
        gStageFlags &= ~STAGE_FLAG__ACT_START;
        gStageFlags &= ~STAGE_FLAG__100;
        gPlayer.charState = CHARSTATE_WALK_A;
        if (countdown->speedBoost) {
            gPlayer.qSpeedGround = Q_8_8(9);
        } else {
            gPlayer.qSpeedGround = Q_8_8(4);
        }

        sub_8018818();
        CreateRaceStartMessage();
        countdown->machineScreenX = I(gPlayer.qWorldX);
        countdown->machineScreenY = I(gPlayer.qWorldY);
        m4aSongNumStart(VOICE__ANNOUNCER__GO);
        gCurTask->main = sub_8036398;
    } else if (countdown->timer < 5) {
        if (gPressedKeys & DPAD_RIGHT && countdown->boostDisabled == FALSE) {
            countdown->speedBoost = TRUE;
        }
    } else {
        if (gPressedKeys & DPAD_RIGHT) {
            countdown->boostDisabled = TRUE;
        }
    }

    s = &countdown->sprMachine;
    s->x = I(gPlayer.qWorldX) - gCamera.x;
    s->y = I(gPlayer.qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (countdown->timer < (GBA_FRAMES_PER_SECOND * 3)) {
        s = &countdown->sprCountdownDigits;
        s->variant = SA2_ANIM_VARIANT_COUNTDOWN_1 - Div(countdown->timer, GBA_FRAMES_PER_SECOND);
        s->prevVariant = -1;
        s->x = DIGITS_X;
        s->y = DIGITS_Y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (countdown->timer >= (int)((1 + 1. / 6.) * GBA_FRAMES_PER_SECOND) && countdown->timer < 3 * GBA_FRAMES_PER_SECOND) {
        gPlayer.anim = gUnknown_080D7518[gSelectedCharacter].anim;
        gPlayer.variant = gUnknown_080D7518[gSelectedCharacter].variant;
        gPlayer.unk6C = 1;

        if (IS_MULTI_PLAYER) {
            gPlayer.spriteInfoBody->s.palId = (SIO_MULTI_CNT)->id;
        } else {
            gPlayer.spriteInfoBody->s.palId = 0;
        }
    }
}

void sub_8036398(void)
{
    CourseStartCountdown *countdown = TASK_DATA(gCurTask);
    Sprite *s = &countdown->sprMachine;

    s->x = countdown->machineScreenX - gCamera.x;
    s->y = countdown->machineScreenY - gCamera.y;
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateRaceStartMessage(void)
{
    struct Task *t = TaskCreate(Task_RaceStartMessageMain, sizeof(RaceStartMessage), 0x3000, 0, TaskDestructor_RaceStartMessage);
    RaceStartMessage *startMessage = TASK_DATA(t);
    Sprite *s;

    startMessage->timer = GBA_FRAMES_PER_SECOND;
    s = &startMessage->sLeft;
    s->graphics.dest = VramMalloc(64);
    s->graphics.anim = SA2_ANIM_COUNTDOWN_START;
    s->variant = SA2_ANIM_VARIANT_COUNTDOWN_START_L;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

    s = &startMessage->sRight;
    s->graphics.dest = VramMalloc(64);
    s->graphics.anim = SA2_ANIM_COUNTDOWN_START;
    s->variant = SA2_ANIM_VARIANT_COUNTDOWN_START_R;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);
}

void Task_RaceStartMessageMain(void)
{
    RaceStartMessage *startMessage = TASK_DATA(gCurTask);
    Sprite *s, *element2;
    SpriteTransform *transform;
    s16 timer;
    startMessage->timer--;

    if (startMessage->timer == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    s = &startMessage->sLeft;
    transform = &startMessage->transformLeft;

    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 4);
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);
    transform->rotation = 0;
    timer = startMessage->timer;
    if (timer < 16) {
        transform->qScaleX = Q(2) - startMessage->timer * 16;
        transform->qScaleY = (startMessage->timer + 1) * 16;
    } else {
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
    }

    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    s = &startMessage->sRight;
    transform = &startMessage->transformRight;

    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 4);
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);
    transform->rotation = 0;
    timer = startMessage->timer;
    if (timer < 16) {
        transform->qScaleX = Q(2) - startMessage->timer * 16;
        transform->qScaleY = (startMessage->timer + 1) * 16;
    } else {
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
    }

    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);
}

void TaskDestructor_CourseStartCountdown(struct Task *t)
{
    CourseStartCountdown *countdown = TASK_DATA(t);
    VramFree(countdown->sprMachine.graphics.dest);
    VramFree(countdown->sprCountdownDigits.graphics.dest);
}

void TaskDestructor_RaceStartMessage(struct Task *t)
{
    RaceStartMessage *startMessage = TASK_DATA(t);
    VramFree(startMessage->sRight.graphics.dest);
    VramFree(startMessage->sLeft.graphics.dest);
}
