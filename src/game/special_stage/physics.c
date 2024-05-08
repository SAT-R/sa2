#include <string.h> // memcpy

#include "core.h"
#include "game/stage/player_controls.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/physics.h"
#include "game/special_stage/guard_robo.h"
#include "game/special_stage/data.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"

#define MIN_BOUNCE_SPEED 1536

void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806EFB4(void);
void sub_806F034(void);
void sub_806F3C4(void);
void sub_806F36C(void);
void sub_806F9E4(void);
void sub_806F0C4(void);
void sub_806F154(void);
void sub_806F1E8(void);
static void PlayerStatePhysics_SlowToStop(void);
void sub_806FB00(void);
void sub_806F300(void);
void sub_806F300(void);

static s16 CalcGuardRoboPointerAngle(struct SpecialStage *);
void sub_806FAA0(void);
static void HandleBoost1(void);
void HandleBoost2(void);
static void HandleJumpControls(void);

static const struct UNK_8C87920_SWAPPED gUnknown_080DF794[3] = {
    { SA2_ANIM_VARIANT_SP_STAGE_ARROW_RED, SA2_ANIM_SP_STAGE_ARROW },
    { SA2_ANIM_VARIANT_SP_STAGE_ARROW_YELLOW, SA2_ANIM_SP_STAGE_ARROW },
    { SA2_ANIM_VARIANT_SP_STAGE_ARROW_GREEN, SA2_ANIM_SP_STAGE_ARROW },
};

typedef void (*PlayerStatePhysicsHandler)(void);

static PlayerStatePhysicsHandler const sPlayerStatePhysicsHandlers[18] = {
    NULL,        sub_806F9CC,
    sub_806F9CC, sub_806F9CC,
    sub_806F9CC, sub_806EFB4,
    sub_806F034, sub_806F3C4,
    sub_806F36C, sub_806F9E4,
    sub_806F0C4, sub_806F154,
    sub_806F1E8, PlayerStatePhysics_SlowToStop,
    sub_806FB00, sub_806F300,
    sub_806F300, NULL,
};

static void Task_PhysicsMain(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStage *stage = physics->stage;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    PlayerStatePhysicsHandler stateHandlers[18];
    memcpy(stateHandlers, sPlayerStatePhysicsHandlers,
           sizeof(sPlayerStatePhysicsHandlers));

    switch (stage->state) {
        case 4:
        case 5:
        case 6:
            if (stage->paused == FALSE) {
                stateHandlers[player->state + 1]();
            }
            break;
        case 7:
            if (player->state < 11) {
                player->state = 11;
            }
            if (stage->paused == FALSE) {
                stateHandlers[player->state + 1]();
            }
            break;
    }

    if (player->state < 11) {
        s32 screenX, screenY;
        s16 arrowAngle = CalcGuardRoboPointerAngle(stage);
        s32 sin = SIN(arrowAngle) * 4;
        s32 cos = COS(arrowAngle) * 4;

        screenX = sin * 20;
        screenY = cos * 20;

        screenX = Q_16_16_TO_INT(screenX) + 112;
        screenY = -(Q_16_16_TO_INT(screenY) >> 1) + 120;

        player->roboArrow.x = screenX;
        player->roboArrow.y = screenY;

        if (arrowAngle > 256 && arrowAngle < 768) {
            player->roboArrow.unk1A = 0;
        } else {
            player->roboArrow.unk1A = 0x280;
        }

        sub_80047A0(arrowAngle, 256, 256, 30);

        if (stage->paused == FALSE) {
            UpdateSpriteAnimation(&player->roboArrow);
        }
        DisplaySprite(&player->roboArrow);
    }

    sub_806FAA0();
    stage->cameraX = player->x;
    stage->cameraY = player->y;
    stage->cameraBearing = player->bearing;

    gBgScrollRegs[2][1] = -Q_16_16_TO_INT(player->y);
    gBgScrollRegs[2][0] = -Q_16_16_TO_INT(player->x);
}

void HandleMovementControls(UNUSED u32 unused)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    s32 speed = player->speed;
    s32 maxSpeed = player->maxSpeed;

    u16 bearing = player->bearing;
    s32 sin = SIN(bearing);
    s32 cos = COS(bearing);

    if (gInput & DPAD_UP) {
        s32 acceleration = player->acceleration;
        if (speed < maxSpeed) {
            if ((speed + acceleration) < maxSpeed) {
                player->speed = speed + acceleration;
                speed = player->speed;

                if (player->speed > 0x2300) {
                    player->state = 2;
                } else {
                    player->state = 1;
                }
            } else {
                player->speed = maxSpeed;
                speed = player->speed;
                player->state = 2;
            }
        } else {
            player->speed = speed + player->coastResistence;
            speed = player->speed;
            player->state = 2;
        }
        player->animSpeed = speed >> 9;
    } else if (gInput & DPAD_DOWN) {
        s32 deceleration = player->deceleration;
        if (player->state == 0) {
            player->state = 7;
            return;
        }

        if ((speed + deceleration) > 0) {
            player->speed = speed + deceleration;
            speed = player->speed;
        } else {
            player->speed = 0;
            speed = 0;
        }

        if (speed == 0) {
            player->animSpeed = 0;
            player->state = 8;
        } else {
            player->state = 3;
        }
    } else {
        if (speed + player->coastResistence > 0) {
            player->speed = speed + player->coastResistence;
            speed = player->speed;
        } else {
            player->speed = 0;
            speed = 0;
        }

        if (speed == 0) {
            player->animSpeed = 0;
            player->state = 0;
        } else {
            if (speed > 0x2300) {
                player->state = 2;
                player->animSpeed = speed >> 9;
            } else {
                player->state = 1;
                player->animSpeed = speed >> 9;
            }
        }
    }
    {
        s32 dX = (sin * speed) >> 10;
        s32 dY = (cos * speed) >> 10;
        player->x -= dX;
        player->y -= dY;
    }
}

void HandleRotationControls(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    u16 bearing = player->bearing;

    if (gInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (gInput & DPAD_LEFT) {
            bearing += player->rotateSpeed;
        }
        if (gInput & DPAD_RIGHT) {
            bearing -= player->rotateSpeed;
        }

        player->bearing = bearing;
        player->bearing &= 0x3FF;
    }
}

void sub_806EFB4(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);
    HandleRotationControls();
    HandleBoost1();

    player->unkBA++;

    player->unkB8 += player->unkF2;

    if (player->unkBA >= player->unkF0 || !(gInput & gPlayerControls.jump)) {
        player->state = 5;
    }
}

void sub_806F034(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);
    HandleRotationControls();
    HandleBoost1();

    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        s32 speed = player->speed;
        player->unkB0 = 0;
        if (speed < 1) {
            player->state = 8;
        } else if (speed < 0x2301) {
            player->state = 1;
        } else {
            player->state = 2;
        }
    }
}

void sub_806F0C4(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);
    HandleRotationControls();
    HandleBoost2();

    player->unkB8 += player->unkF6;

    if (player->unkB0 < 1) {
        s32 speed = player->speed;
        player->unkB0 = 0;
        if (speed < 1) {
            player->state = 8;
        } else if (speed < 0x2301) {
            player->state = 1;
        } else {
            player->state = 2;
        }
    }
}

void sub_806F154(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    HandleRotationControls();
    HandleBoost2();

    player->x += player->unkD0;
    player->y += player->unkD4;
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        player->speed = 0x2000;
        player->unkB0 = 0;
        player->state = 1;
    }
}

void sub_806F1E8(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);
    physics->animFrame++;
    player->unkB8 += player->unkFA;
    HandleBoost1();

    if (player->unkB0 < 1) {
        physics->animFrame = 0;
        player->unkB8 = 0;
        player->unkB0 = 0;

        if (player->speed == 0) {
            player->state = 13;
        } else {
            player->state = 12;
        }
    }
}

static void PlayerStatePhysics_SlowToStop(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    s32 deceleration = player->deceleration;
    s32 speed = player->speed;
    u16 bearing = player->bearing;

    s32 sin = SIN(bearing);
    s32 cos = COS(bearing);
    if ((speed + deceleration) > 0) {
        player->speed = speed + deceleration;
        speed += deceleration;
    } else {
        player->speed = 0;
        speed = 0;
    }

    {
        s32 temp2 = I(sin * speed) >> 2;
        s32 temp3 = I(cos * speed) >> 2;
        player->x -= temp2;
        player->y -= temp3;
    }

    if (speed == 0) {
        player->state = 13;
    }
}

void sub_806F300(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    physics->animFrame++;
    player->unkB8 += player->unkFE;

    if (player->unkB0 < -0x4000) {
        physics->animFrame = 0;
        player->unkB8 = 0;
        player->unkB0 = -0x4000;
        player->state = 0xF;
    }
}

void sub_806F36C(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    u16 bearing = (player->bearing + 0x10);
    player->bearing = bearing & 0x3FF;
    physics->animFrame++;

    if (physics->animFrame > 0x1F) {
        physics->animFrame = 0;
        player->speed = 0;
        player->state = 8;
    }
}

void sub_806F3C4(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    if (player->x <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->x >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }

    physics->animFrame++;

    player->unkB8 += player->unkFA;

    if (player->unkB0 < 0) {
        player->unkB0 = 0;
        player->unkB8 = 0;
        physics->animFrame = 0;

        // TODO: must be a macro
        player->unkB8 = 0;
        player->unkB0 = 0;
        player->state = 0;
    }
}

void sub_806F468(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStage *stage = physics->stage;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);
    const struct UNK_8C87904 *worldElements = gUnknown_08C87904[stage->zone];

    s16 playerX = Q_16_16_TO_INT(player->x);
    s16 playerY = Q_16_16_TO_INT(player->y);

    while (worldElements->type != -1) {
        if (playerX >= worldElements->x
            && playerX < (worldElements->x + worldElements->width)) {
            if (playerY >= worldElements->y
                && playerY < (worldElements->y + worldElements->length)) {
                switch (worldElements->type) {
                    case 0:
                        player->speed = player->unkE8;
                        // BOOSTING
                        player->state = 2;
                        m4aSongNumStart(SE_DASH_RING);
                        return;
                    case 1:
                        player->speed = player->speed < MIN_BOUNCE_SPEED
                            ? MIN_BOUNCE_SPEED
                            : player->speed;

                        // BOUNCING
                        player->state = 9;

                        player->unkB0 = 0;
                        player->unkB8 = player->unkEE;
                        player->unkBA = 0;
                        m4aSongNumStart(SE_276);
                        return;
                }
            }
        }
        worldElements++;
    }
}

static void HandleBoost1(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    s32 speed = player->speed;
    u16 bearing = player->bearing;
    s32 unk100 = player->unk100;

    s32 sin = SIN(bearing);
    s32 cos = COS(bearing);

    if ((speed + unk100) > 0) {
        player->speed = (speed + unk100);
        speed = (speed + unk100);
    } else {
        player->speed = 0;
        speed = 0;
    }
    {
        s32 temp1 = (sin * speed) >> 10;
        s32 temp2 = (cos * speed) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

void HandleBoost2(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    s32 c8 = player->speed;
    u16 b2 = player->bearing;
    s32 unk104 = player->unk104;

    s32 sin = SIN(b2);
    s32 cos = COS(b2);

    if ((c8 + unk104) > 0) {
        player->speed = c8 + unk104;
        c8 += unk104;
    } else {
        player->speed = 0;
        c8 = 0;
    }

    {
        s32 temp1 = (sin * c8) >> 10;
        s32 temp2 = (cos * c8) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

static s16 CalcGuardRoboPointerAngle(struct SpecialStage *stage)
{
    u32 i;
    s32 cos, sin;
    Sprite *s;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(stage->guardRoboTask);

    u32 temp1;
    u32 temp2;
    u16 temp3;
    s32 f_dX;
    s32 f_dY;
    s16 dX;
    s16 dY;

    u16 bearing = -player->bearing & 0x3FF;

    f_dX = guardRobo->x - player->x;
    f_dY = guardRobo->y - player->y;
    dX = f_dX >> 0x10;
    dY = f_dY >> 0x10;

    if (dX > -16 && dX < 16 && dY > -16 && dY < 16) {
        temp1 = 0xC;
    } else {
        if (dX > -256 && dX < 256 && dY > -256 && dY < 256) {
            temp1 = 0x10;
        } else {
            temp1 = 0x14;
        }
    }

    if (dX > -48 && dX < 48 && dY > -48 && dY < 48) {
        temp2 = 0;
    } else {
        if (dX > -96 && dX < 96 && dY > -96 && dY < 96) {
            temp2 = 1;
        } else {
            temp2 = 2;
        }
    }

    player->roboArrow.variant = gUnknown_080DF794[temp2].variant;
    player->roboArrow.graphics.anim = gUnknown_080DF794[temp2].anim;

    temp3 = temp1;
    f_dX >>= temp3;
    f_dY >>= temp3;

    sin = SIN(bearing);
    cos = COS(bearing);

    {
        s32 sin5 = sin * f_dY;
        s32 sin6 = cos * f_dX;
        s32 sin3 = -sin * f_dX;
        s32 sin4 = cos * f_dY;

        f_dX = sin5 + sin6;
        f_dY = sin3 + sin4;
    }

    for (i = 256; i > 0; i >>= 1) {
        sin = SIN(bearing) >> 6;
        cos = COS(bearing) >> 6;

        if ((sin * f_dY + cos * f_dX) > 0) {
            bearing = (bearing + i) & 0x3FF;
        } else {
            if ((sin * f_dY + cos * f_dX) >= 0) {
                s32 a = -sin * f_dX;
                s32 b = cos * f_dY;
                b = a + cos * f_dY;
                if (b >= 0) {
                    return (bearing + 0x200) & 0x3FF;
                }
                break;
            }
            bearing = (bearing - i) & 0x3FF;
        }
    }

    return bearing;
}

s16 sub_806F84C(s32 dX, s32 dY)
{
    u32 r2, r3;
    u16 r1, r3_2;
    s32 r4;

    s32 x = (dX >> 8);
    s32 y = (dY >> 8);
    s16 i = 0;

    x *= x;
    y *= y;
    r4 = (x + y);

    if (r4 == 0 || r4 == 1) {
        return r4;
    }

    while (r4 > 0) {
        r4 *= 2;
        i++;
    };

    r2 = (u16)(~Q_16_16_TO_INT((u32)r4));

#ifndef NON_MATCHING
    r2++;
    r2--;
#endif

    r3 = (r2 >> 1);
    r1 = r3;
    r3 = (r3 * r2) >> 0x12;
    r1 += r3;
    r3 = (r3 * r2) >> 0x11;
    r1 += r3;
    r3 = (r3 * r2) >> 0x10;
    r3_2 = (r3 * 0xA000) >> 0x10;

    r1 = r1 + r3_2;
    r3_2 = (r3_2 * r2) >> 0x10;
    r3_2 = (r3_2 * 0xB333) >> 0x10;
    r1 += r3_2;
    r3_2 = r1 ^ 0xFFFF;
    r3_2 = r3_2 + ((r4 - (r3_2 * r3_2)) >> 0x11);

    if (i & 1) {
        r3_2 = (((r3_2 >> (i >> 1)) * 0xB505) + 0x8000) >> 0x10;
    } else {
        r3_2 = r3_2 >> (i >> 1);
    }

    return r3_2;
}

struct Task *CreateSpecialStagePhysics(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(Task_PhysicsMain, sizeof(struct SpecialStagePhysics),
                                0x4000, 0, NULL);
    struct SpecialStagePhysics *physics = TASK_DATA(t);

    physics->stage = stage;
    physics->animFrame = 0;
    physics->unk6 = 0x3C;

    return t;
}

void sub_806F944(struct SpecialStage *stage)
{
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(stage->guardRoboTask);

    s32 playerX = player->x;
    s32 playerY = player->y;
    s32 guardRoboX = guardRobo->x;
    s32 guardRoboY = guardRobo->y;

    s16 result = sub_806F84C((playerX - guardRoboX) >> 4, (playerY - guardRoboY) >> 4);
    player->unkD0 = ((playerX - guardRoboX) * 0x20) / result;
    player->unkD4 = ((playerY - guardRoboY) * 0x20) / result;

    player->unkB8 = 0x300;
}

void sub_806F9CC(void)
{
    HandleMovementControls(0);
    HandleRotationControls();
    HandleJumpControls();
    sub_806F468();
}

void sub_806F9E4(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    HandleMovementControls(1);
    HandleRotationControls();
    HandleJumpControls();
    if (!(gInput & DPAD_DOWN)) {
        player->state = 0;
    }
    sub_806F468();
}

static void HandleJumpControls(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    if (gPressedKeys & gPlayerControls.jump) {
        player->state = 4;
        player->unkB0 = 0;
        player->unkB8 = player->unkEC;
        player->unkBA = 0;
        m4aSongNumStart(SE_JUMP);
    }
}

void sub_806FAA0(void)
{
    struct SpecialStagePhysics *physics = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(physics->stage->playerTask);

    if (player->x < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->x > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }
}

void sub_806FB00(void) { }
