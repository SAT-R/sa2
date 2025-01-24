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

struct CourseStartCountdown {
    Sprite sprMachine;
    Sprite sprCountdownDigits;
    u32 machineScreenX;
    u32 machineScreenY;
    s16 unk68;
    u8 unk6A;
    u8 unk6B;
};

const TileInfo gUnknown_080D7518[NUM_CHARACTERS] = {
    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_SONIC)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_CREAM)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_TAILS)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_KNUCKLES)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_AMY)),
};

void sub_8036168(void);
void sub_8036638(struct Task *);

void CreateCourseStartCountdown(bool8 playerSkippedIntro)
{
    struct Task *t;
    struct CourseStartCountdown *countdown;
    Sprite *s;

    gStageFlags |= STAGE_FLAG__100;
    t = TaskCreate(sub_8036168, sizeof(struct CourseStartCountdown), 0x3000, 0, sub_8036638);
    countdown = TASK_DATA(t);

    countdown->unk6A = 0;
    countdown->unk6B = 0;

    if (!playerSkippedIntro) {
        countdown->unk68 = GBA_FRAMES_PER_SECOND * 5 + 10;
    } else {
        countdown->unk68 = GBA_FRAMES_PER_SECOND * 3;
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
    s->graphics.dest = VramMalloc(0xE);
    s->graphics.anim = SA2_ANIM_LEVEL_START_MACHINE;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2400;
}

void CreateRaceStartMessage(void);
void sub_8036398(void);

void sub_8036168(void)
{
    struct CourseStartCountdown *countdown = TASK_DATA(gCurTask);
    Sprite *s;

    // Skip intro
    if (IS_SINGLE_PLAYER && countdown->unk68 > (GBA_FRAMES_PER_SECOND * 3) && gPressedKeys & (A_BUTTON | B_BUTTON)) {
        countdown->unk68 = GBA_FRAMES_PER_SECOND * 3;
    }

    if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 3) {
        m4aSongNumStart(VOICE__ANNOUNCER__3);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 2) {
        m4aSongNumStart(VOICE__ANNOUNCER__2);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 1) {
        m4aSongNumStart(VOICE__ANNOUNCER__1);
    }

    if (--countdown->unk68 == 0) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        // Uncomment to skip straight to level ending
        // gPlayer.moveState |= MOVESTATE_GOAL_REACHED;
        gStageFlags &= ~STAGE_FLAG__ACT_START;
        gStageFlags &= ~STAGE_FLAG__100;
        gPlayer.charState = CHARSTATE_WALK_A;
        if (countdown->unk6A != 0) {
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
    } else {
        if (countdown->unk68 < 5) {
            if (gPressedKeys & DPAD_RIGHT && countdown->unk6B == 0) {
                countdown->unk6A = 1;
            }
        } else {
            if (gPressedKeys & DPAD_RIGHT) {
                countdown->unk6B = 1;
            }
        }
    }

    s = &countdown->sprMachine;
    s->x = I(gPlayer.qWorldX) - gCamera.x;
    s->y = I(gPlayer.qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (countdown->unk68 < (GBA_FRAMES_PER_SECOND * 3)) {
        s = &countdown->sprCountdownDigits;
        s->variant = SA2_ANIM_VARIANT_COUNTDOWN_1 - Div(countdown->unk68, GBA_FRAMES_PER_SECOND);
        s->prevVariant = -1;
        s->x = DIGITS_X;
        s->y = DIGITS_Y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (countdown->unk68 >= (int)((1 + 1. / 6.) * GBA_FRAMES_PER_SECOND) && countdown->unk68 < 3 * GBA_FRAMES_PER_SECOND) {
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
    struct CourseStartCountdown *countdown = TASK_DATA(gCurTask);
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

void sub_8036524(void);
void sub_8036654(struct Task *);

struct RaceStartMessage {
    Sprite unk0;
    SpriteTransform unk30;
    Sprite unk3C;
    SpriteTransform unk6C;
    u16 unk78;
    u16 filler7A;
}; /* 0x7C */

void CreateRaceStartMessage(void)
{
    struct Task *t = TaskCreate(sub_8036524, sizeof(struct RaceStartMessage), 0x3000, 0, sub_8036654);
    struct RaceStartMessage *startMessage = TASK_DATA(t);
    Sprite *s;

    startMessage->unk78 = 0x3C;
    s = &startMessage->unk0;
    s->graphics.dest = VramMalloc(0x40);
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
    s->frameFlags = gUnknown_030054B8++ | 0x60;

    s = &startMessage->unk3C;
    s->graphics.dest = VramMalloc(0x40);
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
    s->frameFlags = gUnknown_030054B8++ | 0x60;
}

void sub_8036524(void)
{
    struct RaceStartMessage *startMessage = TASK_DATA(gCurTask);
    Sprite *s, *element2;
    SpriteTransform *transform;
    s16 unk78;
    startMessage->unk78--;

    if (startMessage->unk78 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    s = &startMessage->unk0;
    transform = &startMessage->unk30;

    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 4);
    s->frameFlags = gUnknown_030054B8++ | 0x60;
    transform->rotation = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transform->qScaleX = Q(2) - startMessage->unk78 * 0x10;
        transform->qScaleY = (startMessage->unk78 + 1) * 0x10;
    } else {
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
    }

    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    s = &startMessage->unk3C;
    transform = &startMessage->unk6C;

    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 4);
    s->frameFlags = gUnknown_030054B8++ | 0x60;
    transform->rotation = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transform->qScaleX = Q(2) - startMessage->unk78 * 0x10;
        transform->qScaleY = (startMessage->unk78 + 1) * 0x10;
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

void sub_8036638(struct Task *t)
{
    struct CourseStartCountdown *countdown = TASK_DATA(t);
    VramFree(countdown->sprMachine.graphics.dest);
    VramFree(countdown->sprCountdownDigits.graphics.dest);
}

void sub_8036654(struct Task *t)
{
    struct RaceStartMessage *startMessage = TASK_DATA(t);
    VramFree(startMessage->unk3C.graphics.dest);
    VramFree(startMessage->unk0.graphics.dest);
}
