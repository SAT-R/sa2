#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/underwater_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

/* Tails Start */
void Player_Tails_8047A3C(Player *p);
s32 Player_Tails_8047B04(Player *p);

Task *Player_Tails_InitGfx_TailSwipe(Player *p);

static inline void sub_8047E94_inline(Player *p)
{
    if (p->SA2_LABEL(unk62) == 0) {
        if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (Player_Tails_8047B04(p) == 0)) {
            if (!Player_TrySpindash(p) && !Player_TryJump(p)) {
                SA2_LABEL(sub_8029CA0)(p);
                Player_8044F7C(p);
                SA2_LABEL(sub_80232D0)(p);
                Player_UpdatePosition(p);
                SA2_LABEL(sub_8022D6C)(p);
                SA2_LABEL(sub_8029ED8)(p);
            }
        }
    } else {
        SA2_LABEL(sub_8029CA0)(p);

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            Player_Tails_8047B04(p);
        }

        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    }
}

static inline void sub_8047F2C_inline(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);

    if (p->SA2_LABEL(unk61) == 0) {
        Player_8044670(p);
        Player_AirInputControls(p);
        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        PlayerFn_Cmd_UpdateAirFallSpeed(p);
        Player_8047224(p);
        SA2_LABEL(sub_8022190)(p);
    } else {
        Player_Tails_8047A3C(p);
        Player_AirInputControls(p);
        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        Player_8047224(p);
        SA2_LABEL(sub_8022190)(p);
    }
}

static inline void sub_8047FA0_inline(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);

    if (!Player_TryJump(p)) {
        SA2_LABEL(sub_8029D14)(p);
        Player_8043DDC(p);
        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    }
}

static inline void sub_8047FE4_inline(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);
    Player_8044670(p);
    Player_AirInputControls(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);
    SA2_LABEL(sub_8022190)(p);
}

static inline void sub_80480C4_inline(Player *p)
{
    if ((!(p->moveState & MOVESTATE_SPINDASH)) && (((p->rotation + Q(0.25)) << 24) > 0) && !(p->moveState & MOVESTATE_20)
        && (p->frameInput & gPlayerControls.attack)) {
        p->SA2_LABEL(unk62)++;
        p->charState = CHARSTATE_GROUND_ATTACK;
        Player_Tails_InitGfx_TailSwipe(p);
    }
}

static inline void sub_8048110_inline(Player *p)
{
    s32 qSpeed = p->qSpeedGround;

    if (qSpeed > Q(0)) {
        qSpeed -= (p->deceleration >> 1);
        if (qSpeed < 0) {
            qSpeed = 0;
        }
    } else {
        qSpeed += (p->deceleration >> 1);
        if (qSpeed > Q(0)) {
            qSpeed = 0;
        }
    }

    p->qSpeedGround = qSpeed;

    Player_80470AC(p);
    SA2_LABEL(sub_80231C0)(p);
}

void Player_Tails_8047990(Player *p)
{
    if (p->w.tf.flyingDuration == 0) {
        p->charState = CHARSTATE_FLY_EXHAUSTED;
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    } else if (p->moveState & MOVESTATE_IN_WATER) {
        if (((p->heldInput & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->heldInput & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->charState = CHARSTATE_58;
        } else if (p->charState != CHARSTATE_54) {
            p->charState = CHARSTATE_SWIMMING;
        }

        RandomlySpawnAirBubbles(p);

        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    } else {
        if (((p->heldInput & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->heldInput & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->charState = CHARSTATE_54;
        } else if (p->charState != CHARSTATE_54) {
            p->charState = CHARSTATE_FLYING;
        }

        m4aSongNumStartOrChange(SE_TAILS_PROPELLER_FLYING);
    }
}

void Player_Tails_8047A3C(Player *p)
{
    if ((gStageTime & 0x1) != 0) {
        if (p->w.tf.flyingDuration != 0) {
            p->w.tf.flyingDuration--;
        }
    }

    if (p->SA2_LABEL(unk61) != 1) {
        if (p->qSpeedAirY >= -Q(0.75)) {
            p->qSpeedAirY -= Q(24. / 256.);

            if (++p->SA2_LABEL(unk61) == 32) {
                p->SA2_LABEL(unk61) = 1;
            }
        } else {
            p->SA2_LABEL(unk61) = 1;
        }
    } else {
        // _08047A94
        if (p->frameInput & gPlayerControls.jump) {
            s32 qSpeed = p->qSpeedAirY;
            if (qSpeed >= -Q(0.75)) {
                if (p->w.tf.flyingDuration != 0) {
                    p->SA2_LABEL(unk61) = 2;
                }
            }
        }
        // _08047ABA

        if (p->moveState & MOVESTATE_10000) {
            p->qSpeedAirY += Q(16. / 256.);
        } else {
            p->qSpeedAirY += Q(8. / 256.);
        }
    }
    // _08047AD6

    if (p->qWorldY < Q(gCamera.minY)) {
        p->qWorldY = Q(gCamera.minY);

        if (p->qSpeedAirY < Q(0)) {
            p->qSpeedAirY = Q(0);
        }
    }

    Player_Tails_8047990(p);
}

s32 Player_Tails_8047B04(Player *p)
{
    switch (p->SA2_LABEL(unk62)) {
        case 0: {
            sub_80480C4_inline(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 1: {
            sub_8048110_inline(p);
            return p->SA2_LABEL(unk62);
        } break;
    }
    return 0;
}

void Player_Tails_8047BA0(Player *p)
{
    switch (p->moveState & MOVESTATE_JUMPING) {
        case 0: {
            sub_8047E94_inline(p);
        } break;

        case MOVESTATE_IN_AIR: {
            sub_8047F2C_inline(p);
        } break;

        case MOVESTATE_SPIN_ATTACK: {
            sub_8047FA0_inline(p);
        } break;

        case MOVESTATE_JUMPING: {
            sub_8047FE4_inline(p);
        } break;
    }
}

void Task_8047D04(void)
{
    MultiplayerSpriteTask *mps = TASK_DATA(gCurTask);
    u8 mpid = mps->mpPlayerID;
    Sprite *s = &mps->s;
    SpriteTransform *tf = &mps->transform;
    Camera *cam = &gCamera;
    Player *p;
    s32 v, w;

    if (IS_MULTI_PLAYER) {
        TaskDestroy(gCurTask);
        return;
    }

    p = &gPlayer;
    if (mpid != PLAYER_1) {
        p = &gPartner;
    }

    if ((p->character != CHARACTER_TAILS) || (p->charState != CHARSTATE_32) || (p->SA2_LABEL(unk99)[0] == 0x7F)) {
        TaskDestroy(gCurTask);
        return;
    }

    tf->x = (I(p->qWorldX) - cam->x) + p->SA2_LABEL(unk7C);
    tf->y = (I(p->qWorldY) - cam->y);

    s->frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    s->frameFlags |= SPRITE_FLAG(PRIORITY, 0);

    s->frameFlags |= p->spriteInfoLimbs->s.frameFlags & 0x3000;
    s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
    s->frameFlags |= gOamMatrixIndex++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    tf->rotation = (u8)p->w.tf.shift * 4;
    tf->qScaleX = Q(1.0);
    tf->qScaleY = Q(1.0);
    v = p->SA2_LABEL(unk80);
    w = p->SA2_LABEL(unk82);
    tf->qScaleX = v;
    tf->qScaleY = w;

    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
}

Task *Player_Tails_InitGfxMarbleTrack(Player *p)
{
    Task *t = CreateMultiplayerSpriteTask(0, 0, 96, p->playerID, Task_8047D04, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *mps = TASK_DATA(t);
    Sprite *s = &mps->s;
    SpriteTransform *tf = &mps->transform;

    s->graphics.dest = ALLOC_TILES(SA1_CHAR_ANIM_MARBLE_TRACK);
    s->graphics.anim = SA1_CHAR_ANIM_MARBLE_TRACK + SA1_ANIM_TAILS_IDLE;
    s->variant = 1;
    s->oamFlags = 0x400;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    tf->rotation = 0;
    tf->qScaleX = Q(1.0);
    tf->qScaleY = Q(1.0);
    tf->x = 0;
    tf->y = 0;
    return t;
}

void sub_8047E94(Player *p) { sub_8047E94_inline(p); }

void sub_8047F2C(Player *p) { sub_8047F2C_inline(p); }

void sub_8047FA0(Player *p) { sub_8047FA0_inline(p); }

void sub_8047FE4(Player *p) { sub_8047FE4_inline(p); }

// TODO: There are inline functions *below* Player_Tails_InitFlying and Player_Tails_InitGfx_TailSwipe,
//       but also above them. The functions below get used, not in these two, but above the other inline procs.
//       That does not make sense.
void Player_Tails_InitFlying(Player *p)
{
    if (p->moveState & MOVESTATE_SPIN_ATTACK) {
        p->moveState &= ~MOVESTATE_SPIN_ATTACK;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->w.tf.flyingDuration = TIME(0, 4);
    Player_Tails_8047990(p);
}

Task *Player_Tails_InitGfx_TailSwipe(Player *p)
{
    Task *t = CreateMultiplayerSpriteTask(0, 0, 224, p->playerID, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *mps = TASK_DATA(t);
    Sprite *s = &mps->s;

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_TAILS_TAIL_SWIPE);
    s->graphics.anim = SA1_ANIM_TAILS_TAIL_SWIPE;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void sub_80480C4(Player *p) { sub_80480C4_inline(p); }

void sub_8048110(Player *p) { sub_8048110_inline(p); }
