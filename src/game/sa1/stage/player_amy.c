#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/amy_attack_heart_effect.h"
#include "game/globals.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/dust_effect_braking.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/underwater_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

/* Amy Start */

void Player_Amy_804948C(Player *p);

static inline void Player_Amy_8049854_inline(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);
    Player_Amy_804948C(p);
    Player_8044670(p);
    Player_AirInputControls(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);
    SA2_LABEL(sub_8022190)(p);
}

// NOTE:
// Technically this function does not appear to have been inlined, because it
// was not put anywhere as its own unused function (an (old?) GCC quirk),
// but it makes more sense to be close to Player_Amy_8049854_inline.
static inline void Player_Amy_unk_inline(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);
    // Player_Amy_804948C(p); // These calls missing is different to
    // Player_8044670(p);     // Player_Amy_8049854_inline
    Player_AirInputControls(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);
    SA2_LABEL(sub_8022190)(p);
}

bool32 Player_Amy_8049370(Player *p)
{
    s32 qSpeed;
    u8 rot; // r3

    if ((p->frameInput & gPlayerControls.attack) && !(p->moveState & MOVESTATE_8000)) {
        rot = p->rotation;

        if (!(p->heldInput & DPAD_DOWN)) {
            if (((p->rotation + Q(0.25)) << 24 > Q(0)) && !(p->moveState & MOVESTATE_20)) {
                p->SA2_LABEL(unk62) = 1;
                p->charState = CHARSTATE_87;
                CreateAmyAttackHeartEffect();
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            if (GRAVITY_IS_INVERTED) {
                rot += Q(0.25);
                rot = -rot;
                rot -= Q(0.25);
            }

            if (SA2_LABEL(sub_8022F58)(rot + Q(0.5), p) < 4) {
                return FALSE;
            }
        }
    } else {
        return FALSE;
    }

    p->charState = CHARSTATE_86;

    qSpeed = (p->moveState & MOVESTATE_IN_WATER) ? Q(3.375) : Q(6.0);

    rot = p->rotation - Q(0.25);
    p->qSpeedAirX += Q_MUL(qSpeed, COS_24_8(rot * 4));
    p->qSpeedAirY += Q_MUL(qSpeed, SIN_24_8(rot * 4));

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    p->moveState |= MOVESTATE_100;
    p->moveState &= ~MOVESTATE_ICE_SLIDE;

    m4aSongNumStart(SE_JUMP);

    p->moveState &= ~MOVESTATE_4000000;
    p->moveState |= MOVESTATE_2000000;

    return TRUE;
}

void Player_Amy_804948C(Player *p)
{
    if ((p->SA2_LABEL(unk62) == 0) && (p->frameInput & gPlayerControls.attack) && (p->charState != CHARSTATE_HIT_AIR)) {
        p->SA2_LABEL(unk62) = 1;

        if (p->heldInput & DPAD_DOWN) {
            // Downwards "Hammer Swirl"
            m4aSongNumStart(SE_AMY_HAMMER_SWIRL);
            p->charState = CHARSTATE_90;
            p->qSpeedAirX = Q(0);
        } else {
            // "Super Hammer Attack"
            m4aSongNumStart(SE_AMY_SUPER_HAMMER_ATTACK);
            p->charState = CHARSTATE_89;
        }

        CreateAmyAttackHeartEffect();
    }
}

void Player_Amy_80494E8(Player *p)
{
    if (p->SA2_LABEL(unk62) == 0) {
        if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (Player_Amy_8049370(p) == 0)) {
            if (!Player_TryJump(p)) {
                if (!(p->moveState & MOVESTATE_200)) {
                    SA2_LABEL(sub_8029CA0)(p);
                } else {
                    SA2_LABEL(sub_8029D14)(p);
                }

                Player_8044F7C(p);
                SA2_LABEL(sub_80232D0)(p);
                Player_UpdatePosition(p);
                SA2_LABEL(sub_8022D6C)(p);
                SA2_LABEL(sub_8029ED8)(p);
            }
        }
    } else {
        s32 qSpeed;

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            s8 unk62 = p->SA2_LABEL(unk62);

            if ((unk62 == 1) && !(p->moveState & MOVESTATE_SPINDASH) && ((p->rotation + Q(0.25)) << 24 > Q(0))
                && !(p->moveState & MOVESTATE_20) && (p->SA2_LABEL(unk63) == 0) && (p->frameInput & gPlayerControls.attack)) {
                p->SA2_LABEL(unk63) = 1;
            }
        }

        SA2_LABEL(sub_8029CA0)(p);

        qSpeed = p->qSpeedGround;
        if (qSpeed > Q(0)) {
            qSpeed -= Q(0.375);

            if (qSpeed < 0) {
                qSpeed = Q(0);
            }
            p->qSpeedGround = qSpeed;
        } else if (qSpeed < Q(0)) {
            qSpeed += Q(0.375);

            if (qSpeed > 0) {
                qSpeed = Q(0);
            }
            p->qSpeedGround = qSpeed;
        }

        Player_80470AC(p);
        SA2_LABEL(sub_80231C0)(p);
        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    }
}

void Player_Amy_80495F0(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);

    switch (p->SA2_LABEL(unk62)) {
        case 0: {
            if ((p->frameInput & gPlayerControls.attack) && (p->charState != CHARSTATE_HIT_AIR)) {
                p->charState = CHARSTATE_92;
                p->SA2_LABEL(unk62) = 1;
            }

            SA2_LABEL(sub_8022190)(p);
        } break;

        case 1: {
            SA2_LABEL(sub_8022838)(p);

            if (!(p->w.kf.flags & 0x2)) {
                // _08049676
#ifndef NON_MATCHING
                register s32 r0 asm("r0");
#else
                s32 r0;
#endif

                u32 isInWater = p->moveState & MOVESTATE_IN_WATER;
                s32 qSpeed = Q(2);

                if (isInWater) {
                    qSpeed -= Q(0.75);
                }

                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    s32 r1 = -p->qSpeedAirX;
                    r0 = qSpeed;
                    if (r0 < r1) {
                        r0 = r1;
                    }
                    r0 = -r0;
                } else {
                    // _0804969E
                    s32 r1 = +p->qSpeedAirX;
                    r0 = qSpeed;
                    if (r0 < r1) {
                        r0 = r1;
                    }
                }
                p->qSpeedAirX = r0;

#ifndef NON_MATCHING
                p->qSpeedGround = *(volatile s16 *)&p->qSpeedAirX;
#else
                p->qSpeedGround = p->qSpeedAirX;
#endif
                p->SA2_LABEL(unk62) = 2;

                m4aSongNumStart(SE_SONIC_SKID_ATTACK);
            }
        } break;

        case 2: {
            SA2_LABEL(sub_8022838)(p);

            if (!(p->w.kf.flags & 0x2)) {
                if (p->qSpeedAirX <= 0) {
                    p->qSpeedAirX += Q(24. / 256.);

                    if (p->qSpeedAirX < Q(0)) {
                        goto _08049720;
                    }
                } else {
                    // _080496EC
                    p->qSpeedAirX -= Q(24. / 256.);

                    if (p->qSpeedAirX > Q(0)) {
                        goto _08049720;
                    }
                }
                // _080496F8

                p->qSpeedGround = Q(0);
                p->qSpeedAirX = Q(0);
                p->qSpeedAirY = Q(0);

                SA2_LABEL(sub_8022318)(p);

                p->moveState &= ~MOVESTATE_4000000;
                p->SA2_LABEL(unk2A) = 15;

                p->charState = CHARSTATE_93;
                return;
            }
        _08049720:
            // _08049720

            { // TODO: Not direct inline of sub_8048524, but similar structure!
                s32 offsetY;
                u8 rot;

                if ((gStageTime % 4u) == 0) {
                    offsetY = p->spriteOffsetY;

                    if (GRAVITY_IS_INVERTED) {
                        offsetY = -offsetY;
                    }

                    CreateBrakingDustEffect(I(p->qWorldX), I(p->qWorldY) + offsetY);
                }

                SA2_LABEL(sub_8022838)(p);

                offsetY = SA2_LABEL(sub_8029B88)(p, &rot, NULL);
                if (offsetY < 7) {
                    if (GRAVITY_IS_INVERTED) {
                        offsetY = -offsetY;
                    }

                    p->qWorldY += Q(offsetY);
                    p->rotation = rot;
                } else if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
                    p->SA2_LABEL(unk62) = 1;
                    p->w.kf.flags |= 2;
                }
            }
        } break;
    }
}

void Player_Amy_80497AC(Player *p)
{
    switch (p->moveState & MOVESTATE_IN_AIR) {
        case 0: {
            if (p->moveState & MOVESTATE_1000000) {
                sub_80472B8(p);
            } else {
                Player_Amy_80494E8(p);
            }
        } break;

        case MOVESTATE_IN_AIR: {
            switch (p->moveState & (MOVESTATE_2000000 | MOVESTATE_4000000)) {
                case 0: {
                    Player_Amy_8049854_inline(p);
                } break;

                case MOVESTATE_2000000: {
                    Player_Amy_unk_inline(p);
                } break;

                case MOVESTATE_4000000: {
                    Player_Amy_80495F0(p);
                } break;
            }
        } break;
    }
}

void Player_Amy_8049854(Player *p) { Player_Amy_8049854_inline(p); }
