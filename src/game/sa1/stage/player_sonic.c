#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/globals.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/some_task_manager.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/sa1/stage/player_controls.h"
#include "game/sa1/stage/player_sonic.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

/* Sonic */

s32 sub_8047668(Player *p);
Task *Player_Sonic_InitGfx_InstaShield(Player *p);

void Player_Sonic_80473AC(Player *p)
{
    switch (p->moveState & MOVESTATE_JUMPING) {
        case 0: {
            if (p->moveState & MOVESTATE_1000000) {
                sub_80472B8(p);
            } else {
                // inline of sub_8047774 ?
                if (p->SA2_LABEL(unk62) == 0) {
                    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (sub_8047668(p) == 0)) {
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
                        sub_8047668(p);
                    }

                    SA2_LABEL(sub_80232D0)(p);
                    Player_UpdatePosition(p);
                    SA2_LABEL(sub_8022D6C)(p);
                    SA2_LABEL(sub_8029ED8)(p);
                }
            }
        } break;

        case MOVESTATE_IN_AIR: {
            // inline of sub_804780C
            Player_804726C(p);
            Player_8047280(p);
            Player_8044670(p);
            Player_AirInputControls(p);
            SA2_LABEL(sub_80232D0)(p);
            Player_UpdatePosition(p);
            PlayerFn_Cmd_UpdateAirFallSpeed(p);
            Player_8047224(p);
            SA2_LABEL(sub_8022190)(p);
        } break;

        case MOVESTATE_SPIN_ATTACK: {
            // inline of sub_804784C ?
            Player_804726C(p);
            Player_8047280(p);

            if (!Player_TryJump(p)) {
                SA2_LABEL(sub_8029D14)(p);
                Player_8043DDC(p);

                // _0804749E
                SA2_LABEL(sub_80232D0)(p);
                Player_UpdatePosition(p);
                SA2_LABEL(sub_8022D6C)(p);
                SA2_LABEL(sub_8029ED8)(p);
            }
        } break;

        case MOVESTATE_JUMPING: {
            // Inline of sub_8047890?
            Player_804726C(p);
            Player_8047280(p);

            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                sub_8047714(p);
            }

            Player_8044670(p);
            Player_AirInputControls(p);
            SA2_LABEL(sub_80232D0)(p);
            Player_UpdatePosition(p);
            PlayerFn_Cmd_UpdateAirFallSpeed(p);
            Player_8047224(p);
            SA2_LABEL(sub_8022190)(p);
        } break;
    }
}

void Player_Sonic_StartRoll(Player *p)
{
    if (!(p->moveState & MOVESTATE_SPINDASH) && ((p->rotation + Q(0.25)) << 24 > 0) && !(p->moveState & MOVESTATE_20)
        && (p->frameInput & gPlayerControls.attack)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->qSpeedGround = -Q(2.0);
        } else {
            p->qSpeedGround = +Q(2.0);
        }

        p->qSpeedAirX = 0;
        p->SA2_LABEL(unk62)++;
        p->charState = CHARSTATE_45;
        m4aSongNumStart(SE_SPIN_ATTACK);
    }
}

void Player_Sonic_UpdateRoll(Player *p)
{
    s32 qSpeed = p->qSpeedGround;

    if (qSpeed > 0) {
        if ((qSpeed - Q(8. / 256.)) < 0) {
            qSpeed = 0;
        } else {
            qSpeed -= Q(8. / 256.);
        }

        p->qSpeedGround = qSpeed;
    } else if (qSpeed < 0) {
        if ((qSpeed + Q(8. / 256.)) > 0) {
            qSpeed = 0;
        } else {
            qSpeed += Q(8. / 256.);
        }

        p->qSpeedGround = qSpeed;
    }

    Player_80470AC(p);

    if (p->qSpeedGround == Q(0)) {
        p->charState = 0;
        p->SA2_LABEL(unk62) = 0;
    }

    // Do Somersault
    if (p->frameInput & gPlayerControls.attack) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->qSpeedGround = -Q(3);
        } else {
            p->qSpeedGround = +Q(3);
        }

        p->SA2_LABEL(unk62)++;
        p->SA2_LABEL(unk63) = 0;
        p->charState = CHARSTATE_46;

        m4aSongNumStart(SE_TAILS_TAIL_SWIPE);
    }

    SA2_LABEL(sub_80231C0)(p);
}

void Player_Sonic_UpdateSomersault(Player *p)
{
    s32 qSpeed = p->qSpeedGround;
    s32 v;

    if (qSpeed > 0) {
        if ((qSpeed - Q(8. / 256.)) < 0) {
            qSpeed = 0;
        } else {
            qSpeed -= Q(8. / 256.);
        }

        p->qSpeedGround = qSpeed;
    } else if (qSpeed < 0) {
        if ((qSpeed + Q(8. / 256.)) > 0) {
            qSpeed = 0;
        } else {
            qSpeed += Q(8. / 256.);
        }

        p->qSpeedGround = qSpeed;
    }

    Player_80470AC(p);

    // Figure out, what to do after somersault
    v = p->SA2_LABEL(unk63);
    if (v == 0) {
        if (p->frameInput & gPlayerControls.attack) {
            // -> Slide
            p->SA2_LABEL(unk63) = 1;
        }

        v = p->SA2_LABEL(unk63);
        if (v == 0) {
            if (p->frameInput & gPlayerControls.jump) {
                // -> Spinning Backjump
                p->SA2_LABEL(unk63) = 2;
            }
        }
    }

    SA2_LABEL(sub_80231C0)(p);
}

s32 sub_8047668(Player *p)
{
    switch (p->SA2_LABEL(unk62)) {
        case 0: {
            Player_Sonic_StartRoll(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 1: {
            Player_Sonic_UpdateRoll(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 2: {
            Player_Sonic_UpdateSomersault(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 3: {
            /* Update Slide */
            s32 qSpeed = p->qSpeedGround;

            if (qSpeed > 0) {
                if ((qSpeed - Q(32. / 256.)) < 0) {
                    qSpeed = 0;
                } else {
                    qSpeed -= Q(32. / 256.);
                }

                p->qSpeedGround = qSpeed;
            } else if (qSpeed < 0) {
                if ((qSpeed + Q(32. / 256.)) > 0) {
                    qSpeed = 0;
                } else {
                    qSpeed += Q(32. / 256.);
                }

                p->qSpeedGround = qSpeed;
            }

            Player_80470AC(p);

            if (p->qSpeedGround == 0) {
                p->charState = CHARSTATE_48;
                p->SA2_LABEL(unk62)++;
            }

            SA2_LABEL(sub_80231C0)(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 4: {
            return p->SA2_LABEL(unk62);
        } break;
    }

    return 0;
}

void sub_8047714(Player *p)
{
    if ((p->SA2_LABEL(unk61) == 0) && (p->moveState & MOVESTATE_100)) {
        s32 res = GetAirDashDirection(10);

        if (res != 0) {
            p->SA2_LABEL(unk61) = 2;
            p->charState = CHARSTATE_AIR_DASH;
            m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

            if (res > 0) {
                p->qSpeedAirX += (p->maxSpeed >> 2);
            } else if (res < 0) {
                p->qSpeedAirX -= (p->maxSpeed >> 2);
            }

            p->qSpeedAirY = 0;
        }
    }
}

// inline
void sub_8047774(Player *p)
{
    if (p->SA2_LABEL(unk62) == 0) {
        if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (sub_8047668(p) == 0)) {
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
            sub_8047668(p);
        }

        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    }
}

// inline
void sub_804780C(Player *p)
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

// inline
void sub_804784C(Player *p)
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

// inline
// identical to sub_804780C, except for the MP block
void sub_8047890(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        sub_8047714(p);
    }

    Player_8044670(p);
    Player_AirInputControls(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);
    SA2_LABEL(sub_8022190)(p);
}

// =============== MODULE

/* Sonic Insta Shield */

void Player_Sonic_InitInstaShield(Player *p)
{
    Task *t;
    MultiplayerSpriteTask *mps;
    Sprite *s;

    p->charState = CHARSTATE_43;
    m4aSongNumStart(SE_SONIC_INSTA_SHIELD);

    t = Player_Sonic_InitGfx_InstaShield(p);
    mps = TASK_DATA(t);
    s = &mps->s;

    if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    } else {
        s->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
    }
}

Task *Player_Sonic_InitGfx_InstaShield(Player *p)
{
    Task *t = CreateMultiplayerSpriteTask(0, 0, 160, p->playerID, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *mps = TASK_DATA(t);
    Sprite *s = &mps->s;

    s->graphics.dest = ALLOC_TILES(SA1_CHAR_ANIM_50);
    s->graphics.anim = SA1_CHAR_ANIM_50;
    s->variant = 1;
    s->oamFlags = 0x200;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void nullsub_804798C() { }
