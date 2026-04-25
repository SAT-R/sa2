#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/dust_effect_braking.h"
#include "game/shared/stage/mp_sprite_task.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/underwater_effects.h"
#include "game/shared/stage/water_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

/* Knuckles Start */
extern void SA2_LABEL(sub_8022318)(Player *p);
extern void SA2_LABEL(sub_8022838)(Player *p);
void sub_80472B8(Player *p);
void Player_AirInputControls(Player *p);

struct Task *Player_Knuckles_InitGfx_UppercutFlame(Player *p);
struct Task *Player_Knuckles_InitGfx_FloatSplash(Player *p);

extern const u8 gCharStatesKnucklesGlideTurn[];

void Player_Knuckles_InitGlide(Player *p)
{
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 6);
    p->qSpeedAirY += Q(1.5);

    if (p->qSpeedAirY < 0) {
        p->qSpeedAirY = 0;
    }

    p->qSpeedGround = Q(3);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedGround);
    }

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedGround = -p->qSpeedGround;
        p->qSpeedAirX = p->qSpeedGround;
        p->w.kf.shift = -128;
    } else {
        p->qSpeedAirX = p->qSpeedGround;
        p->w.kf.shift = 0;
    }
    p->rotation = 0;
    p->w.kf.flags = 0x2;
}

void Player_Knuckles_GlideUpdateAnim(Player *p)
{
    // TODO: Maybe "w.kf.shift" is a bitfield (7:1) ?
    u8 shift = p->w.kf.shift;
    s32 sgnShift;

    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_FACING_LEFT;

    sgnShift = (s8)shift;
    if ((sgnShift % 128u) == 0) {
        if (p->moveState & MOVESTATE_IN_WATER) {
            p->charState = CHARSTATE_KNUCKLES_SWIM;
            RandomlySpawnAirBubbles(p);
        } else {
            p->charState = CHARSTATE_KNUCKLES_GLIDE;
        }

        if (shift == 0x80) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }
    } else {
        if (sgnShift < 0) {
            shift = -sgnShift;
        }

        p->charState = gCharStatesKnucklesGlideTurn[(shift & 0x7F) >> 5];
    }
}

// TODO: Remove gotos
// (98.53%) https://decomp.me/scratch/3hZ4x
NONMATCH("asm/non_matching/game/sa1/stage/Player__sub_8048230.inc", void sub_8048230(Player *p))
{
    s32 sp08;
    u8 *knuxFlags;
    s32 r6;
    u8 flags;
    u32 mask;

    SA2_LABEL(sub_8022838)(p);

    knuxFlags = &p->w.kf.flags;
    flags = *knuxFlags;
    mask = 2;
    if (!(flags & 2)) {
        if (p->qSpeedAirX <= Q(0)) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        } else {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        }
        // _08048268

        if ((((p->rotation + Q(0.125)) & -Q(0.25)) << 24) != 0) {
            if (((u8)p->w.kf.shift + 0x40) << 24 <= 0) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            p->qSpeedAirY = 0;
            SA2_LABEL(sub_8022318)(p);

            if (p->qSpeedGround != Q(0)) {
                p->charState = CHARSTATE_WALK_A;
            } else {
                p->charState = CHARSTATE_IDLE;
            }
        } else {
            // _080482C2
            p->SA2_LABEL(unk61) = 3;
            p->charState = CHARSTATE_65;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }

    } else if (*knuxFlags & 0x20) {
        // _080482D8 + 0x10
        // _080482E2
        if (p->w.kf.SA2_LABEL(unkAE) >= 0) {
            // _080482F2
            if (((u8)p->w.kf.shift + 0x40) << 24 <= 0) {
                p->moveState |= MOVESTATE_FACING_LEFT;
                r6 = SA2_LABEL(sub_8029A28)(p, NULL, &sp08);

                if (r6 == sp08) {
                    // _08048324

                    if (r6 != 0) {
                        if (GRAVITY_IS_INVERTED) {
                            s32 worldX, worldY;
                            worldY = (I(p->qWorldY) - 1);
                            worldY -= p->spriteOffsetY;
                            worldX = (I(p->qWorldX) - 1);
                            worldX -= p->spriteOffsetX;

                            if (SA2_LABEL(sub_801E4E4)(worldY, worldX, p->layer, -8, NULL, SA2_LABEL(sub_801EE64)) < 0) {
                                p->SA2_LABEL(unk61) = mask;
                                goto _08048454;
                            } else {
                                goto lbl0;
                            }
                        } else {
                            // _08048378
                            s32 worldX, worldY;
                            worldY = (I(p->qWorldY) + 1);
                            worldY += p->spriteOffsetY;
                            worldX = (I(p->qWorldX) - 1);
                            worldX -= p->spriteOffsetX;

                            if (SA2_LABEL(sub_801E4E4)(worldY, worldX, p->layer, +8, NULL, SA2_LABEL(sub_801EE64)) < 0) {
                                goto _08048450;
                            } else {
                            lbl0:
                                p->qWorldX -= Q(r6);

                                goto nullset;
                            }
                        }
                    } else {
                        goto nullset;
                    }
                }
            } else {
                // _080483B4
                p->moveState &= ~MOVESTATE_FACING_LEFT;
                r6 = SA2_LABEL(sub_8029A74)(p, 0, &sp08);
                if (r6 != sp08) {
                    p->SA2_LABEL(unk61) = mask;
                    asm("");
                    goto _08048454;
                } else if (r6 != 0) {
                    if (!GRAVITY_IS_INVERTED) {
                        s32 worldX, worldY;
                        worldY = (I(p->qWorldY) + 1);
                        worldY += p->spriteOffsetY;
                        worldX = (I(p->qWorldX) + 1);
                        worldX += p->spriteOffsetX;

                        if (SA2_LABEL(sub_801E4E4)(worldY, worldX, p->layer, +8, NULL, sa2__sub_801EE64) < 0) {
                            goto _08048450;
                        }
                    }

                    p->qWorldX += Q(r6);
                }
            nullset:
                p->qSpeedGround = 0;
                p->qSpeedAirX = 0;
                p->qSpeedAirY = 0;
                p->SA2_LABEL(unk61) = 4;
                p->w.kf.shift = 3;
                p->charState = 70;
                return;
            }
        }
    _08048450:
        p->SA2_LABEL(unk61) = mask;
    _08048454:
        p->charState = CHARSTATE_63;
    _08048458:
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
        *knuxFlags |= 0x2;
    } else if (!(p->heldInput & gPlayerControls.jump)) {
        p->SA2_LABEL(unk61) = mask;
        p->charState = CHARSTATE_63;

        if (p->qSpeedAirX <= Q(0)) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        } else {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        }

        p->qSpeedAirX >>= 2;
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
    } else {
        Player_Knuckles_GlideUpdateAnim(p);
    }
}
END_NONMATCH

void sub_80484CC(Player *p)
{
    Player_AirInputControls(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    SA2_LABEL(sub_8022838)(p);

    if (!(p->w.kf.flags & 0x2)) {
        p->qSpeedGround = 0;
        p->qSpeedAirX = 0;
        p->qSpeedAirY = 0;
        p->spriteOffsetX = 6;
        p->spriteOffsetY = 14;
        SA2_LABEL(sub_8022318)(p);

        if (((p->rotation + Q(0.125)) & 0xC0) == 0) {
            p->SA2_LABEL(unk2A) = 15;
            p->charState = CHARSTATE_64;
        }
    }
}

// (100.0%) https://decomp.me/scratch/s2CMM
void sub_8048524(Player *inPlayer)
{
#ifndef NON_MATCHING
    register Player *p asm("r4") = inPlayer;
#else
    Player *p = inPlayer;
#endif
    u8 rot;
    s32 sp04;
    s32 offsetY;

    if ((gStageTime % 4u) == 0) {
        offsetY = p->spriteOffsetY;

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        CreateBrakingDustEffect(I(p->qWorldX), I(p->qWorldY) + offsetY);
    }

    SA2_LABEL(sub_8022838)(p);

    offsetY = SA2_LABEL(sub_8029B88)(p, &rot, &sp04);
    if (offsetY < 12) {
        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        p->qWorldY += Q(offsetY);
        p->rotation = rot;
    } else if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
#ifndef NON_MATCHING
        register u32 flag asm("r0");
        register u32 r1 asm("r1");
        register u8 *r2 asm("r2");
#else
        u32 flag;
        u32 r1;
        u8 *r2;
#endif

        p->SA2_LABEL(unk61) = flag = 2;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
        r2 = &p->w.kf.flags;
        r1 = *r2;
        flag = 2;
        *r2 = flag | r1;
    }
}

void sub_80485CC(Player *p)
{
    s32 offsetY;

    if (p->heldInput & gPlayerControls.jump) {
        if (p->qSpeedAirX <= Q(0)) {
            p->qSpeedAirX += Q(24. / 256.);

            if (p->qSpeedAirX < 0) {
                sub_8048524(p);
                return;
            }
        } else {
            p->qSpeedAirX -= Q(24. / 256.);

            if (p->qSpeedAirX > 0) {
                sub_8048524(p);
                return;
            }
        }
    }
    // _0804860C

    p->qSpeedGround = Q(0);
    p->qSpeedAirX = Q(0);
    p->qSpeedAirY = Q(0);

    offsetY = p->spriteOffsetY - 14;

    if (GRAVITY_IS_INVERTED) {
        offsetY = -offsetY;
    }

    p->qWorldY += Q(offsetY);

    SA2_LABEL(sub_8022318)(p);

    p->SA2_LABEL(unk2A) = 15;
    p->charState = CHARSTATE_3;
}

s32 sub_8048650(Player *p)
{
    u8 arr;

    s32 result;
    if (p->moveState & MOVESTATE_FACING_LEFT) {
        s32 worldX, worldY;
        worldX = I(p->qWorldX) - 2;
        worldX -= p->spriteOffsetX;
        worldY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(worldX, worldY, p->layer, -8, &arr, SA2_LABEL(sub_801ED24));

        if (arr & 0x1) {
            p->rotation = +Q(0.25);
        } else {
            p->rotation = arr;
        }
    } else {
        s32 worldX, worldY;
        worldX = I(p->qWorldX) + 2;
        worldX += p->spriteOffsetX;
        worldY = I(p->qWorldY);
        result = SA2_LABEL(sub_801E4E4)(worldX, worldY, p->layer, +8, &arr, SA2_LABEL(sub_801ED24));

        if (!(arr & 0x1)) {
            p->rotation = arr;
        } else {
            p->rotation = -Q(0.25);
        }
    }

    return result;
}

// TODO: Remove gotos and register fake-match
void sub_80486E8(Player *p)
{
    u8 sp00;
    s32 res;
    s32 offsetY;
    s32 qSpeed;

    if (p->w.kf.SA2_LABEL(unkAE) < 0) {
        goto _08048924;
    }

    if (p->moveState & MOVESTATE_STOOD_ON_OBJ) {
        goto _08048924;
    }

    // _08048710
    p->qSpeedGround = Q(0);
    p->qSpeedAirX = Q(0);
    p->qSpeedAirY = Q(0);

    if (p->charState != CHARSTATE_70) {
        p->charState = CHARSTATE_71;
    }
    // _08048728

    if (p->heldInput & DPAD_UP) {
        // __08048738
        offsetY = Q(p->spriteOffsetY);

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }
        // _08048750

        p->qWorldY -= offsetY;
        res = sub_8048650(p);
        p->qWorldY += offsetY;

        if (res > 2) {
            goto _0804893A;
        } else if (res < 0) {
            goto _080488CA;
        } else {
            // _08048770
            offsetY = Q(9);

            if (GRAVITY_IS_INVERTED) {
                offsetY = -offsetY;
            }
            // _08048780

            p->qWorldY -= offsetY;
            res = SA2_LABEL(sub_8029AC0)(p, &sp00, NULL);
            p->qWorldY += offsetY;

            if (res < 0) {
                p->charState = CHARSTATE_72;
                p->qWorldY -= Q(res);

                goto _08048862;
            } else {
                // _080487AC
                p->charState = CHARSTATE_72;
                qSpeed = Q(0.75);

                if (p->moveState & MOVESTATE_IN_WATER) {
                    qSpeed = Q(0.50);
                }
                // _080487C0

                if (p->moveState & MOVESTATE_2000) {
                    qSpeed <<= 1;
                }
                // _080487CC

                p->qSpeedAirY = -qSpeed;
            }
        }

        goto _08048862;
    } else if (p->heldInput & DPAD_DOWN) {
        // _080487D2 + 0xA
        offsetY = Q(p->spriteOffsetY);

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        p->qWorldY += offsetY;
        res = sub_8048650(p);
        p->qWorldY -= offsetY;

        if (res > 0) {
            goto _08048924;
        }
        // _0804880A

        res = SA2_LABEL(sub_8029B0C)(p, &sp00, NULL);

        if (res < 0) {
            p->qWorldY += Q(res);
            p->rotation = sp00;
            p->qSpeedGround = Q(0);
            p->qSpeedAirX = Q(0);
            p->qSpeedAirY = Q(0);

            SA2_LABEL(sub_8022318)(p);
            p->charState = CHARSTATE_63;
            return;
        } else {
            // _08048840
            p->charState = CHARSTATE_73;

            qSpeed = Q(0.75);

            if (p->moveState & MOVESTATE_IN_WATER) {
                qSpeed = Q(0.50);
            }
            // _080487C0

            if (p->moveState & MOVESTATE_2000) {
                qSpeed <<= 1;
            }
            // _080487CC

            p->qSpeedAirY = +qSpeed;
        }

    _08048862:
        Player_8047280(p);
        goto _08048876;
    } else {
        res = sub_8048650(p);
        if (res > 0) {
            goto _08048924;
        }
    }
    // _08048876
_08048876:
    res = 1;

    if (!(p->heldInput & DPAD_VERTICAL)) {
        res = SA2_LABEL(sub_8029B0C)(p, &sp00, NULL);
        if (res < 0) {
            p->qWorldY += Q(res);
            p->rotation = sp00;
            p->qSpeedGround = Q(0);
            p->qSpeedAirX = Q(0);
            p->qSpeedAirY = Q(0);

            SA2_LABEL(sub_8022318)(p);
            p->charState = CHARSTATE_63;
            return;
        }
    }
    // _080488B2

    if (res != 0) {
        if (--p->w.kf.shift == 0) {
            p->w.kf.shift = 3;
        }
    }

_080488CA:
    if (p->frameInput & gPlayerControls.jump) {
#ifndef NON_MATCHING
        register s32 v asm("r1");
#else
        s32 v;
#endif
        p->qSpeedAirY = -Q(2.625);
        p->qSpeedAirX = +Q(3.0);
        p->moveState ^= MOVESTATE_FACING_LEFT;

        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->qSpeedAirX = -p->qSpeedAirX;
        }
        // _080488F2

        p->moveState |= MOVESTATE_SPIN_ATTACK;
        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState |= MOVESTATE_100;
        PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 9);
        v = 0;
        p->charState = 5;
        p->SA2_LABEL(unk61) = v;
    }
    return;
_08048924:
    p->SA2_LABEL(unk61) = 2;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    p->charState = CHARSTATE_63;
    return;
_0804893A:
    p->charState = CHARSTATE_74;

    if (GRAVITY_IS_INVERTED) {
        p->qWorldY += Q(p->spriteOffsetY);
    } else {
        p->qWorldY -= Q(p->spriteOffsetY);
    }

    p->SA2_LABEL(unk61) = 5;
    p->w.kf.shift = 0;
}

// (96.50%) https://decomp.me/scratch/4vHPC
NONMATCH("asm/non_matching/game/sa1/stage/Player__sub_8048980.inc", void sub_8048980(Player *p))
{
    s32 qSpeedGround = ABS(p->qSpeedGround);
    s8 shift = p->w.kf.shift;

    if (p->SA2_LABEL(unk61) == 1) {
        if (qSpeedGround < Q(3)) {
            qSpeedGround += Q(6. / 256.);
        } else if ((qSpeedGround < Q(18)) && ((shift & 0x7F) == 0)) {
            qSpeedGround += Q(3. / 256.);

            if (p->moveState & MOVESTATE_2000) {
                qSpeedGround += Q(6. / 256.);
            }
        }
        // _080489D8

        if (p->moveState & MOVESTATE_IN_WATER) {
            s32 qSpeedCap = Q(3);
            if (qSpeedGround > qSpeedCap) {
                qSpeedGround -= Q(9. / 256.);

                if (p->moveState & MOVESTATE_2000) {
                    qSpeedGround -= Q(3. / 256.);
                }

                if (qSpeedGround < qSpeedCap) {
                    qSpeedGround = qSpeedCap;
                }
            }
        }
        // _080489FC

        if (((u8)p->w.kf.shift + 0x40) << 24 <= 0) {
            p->qSpeedGround = -qSpeedGround;
        } else {
            p->qSpeedGround = +qSpeedGround;
        }
        // _08048A18

        if (p->heldInput & DPAD_LEFT) {
            // _08048A18 + 0xC

            if ((u8)shift != 0x80) {
                if (shift < 0) {
                    shift = -shift;
                }

                shift += 2;
            }
        } else if (p->heldInput & DPAD_RIGHT) {
            // _08048A42 + 0x8
            if (shift != 0) {
                if (shift > 0) {
                    shift = -shift;
                }

                shift += 2;
            }
        } else if ((shift & 0x7F) != 0) {
            shift += 2;
        }
        // _08048A78
        p->w.kf.shift = shift;

        p->qSpeedAirX = Q_MUL(COS_24_8((u8)shift << 2), qSpeedGround);

        if (p->qSpeedAirY < Q(0.5)) {
            p->qSpeedAirY += Q(24. / 256.);
        } else {
            p->qSpeedAirY -= Q(24. / 256.);
        }
    }
    // _08048AB8

    if (gCamera.SA2_LABEL(unk4C) > 0) {
        gCamera.SA2_LABEL(unk4C) -= 2;
    } else if (gCamera.SA2_LABEL(unk4C) < 0) {
        gCamera.SA2_LABEL(unk4C) += 4;
    }
}
END_NONMATCH

bool32 sub_8048ADC(Player *p)
{
    if ((p->moveState & MOVESTATE_SPINDASH) || ((s8)(p->rotation + Q(0.25)) <= Q(0)) || (p->moveState & MOVESTATE_20)
        || !(p->frameInput & gPlayerControls.attack)) {
        return 0;
    } else {
        s32 qSpeed = Q(3);
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            qSpeed = -qSpeed;
        }
        p->qSpeedGround += qSpeed;

        p->SA2_LABEL(unk62)++;
        p->charState = CHARSTATE_76;

        return 1;
    }
}

bool32 sub_8048B38(Player *p)
{
    u8 rot = p->rotation;
    s32 qSpeed;

    if (GRAVITY_IS_INVERTED) {
        rot += Q(0.25);
        rot = -rot;
        rot -= Q(0.25);
    }

    if (SA2_LABEL(sub_8022F58)(rot + Q(0.5), p) < 4) {
        SA2_LABEL(sub_8021BE0)(p);
        return FALSE;
    }

    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);
    p->moveState &= ~(MOVESTATE_ICE_SLIDE);

    /* 1st speed apply */
    if (p->moveState & MOVESTATE_IN_WATER) {
        qSpeed = Q(1);
    } else {
        qSpeed = Q(2);
    }

    rot = p->rotation - Q(0.25); // turn 90 degrees left
    p->qSpeedAirX += Q_MUL(qSpeed, COS_24_8(rot * 4));
    p->qSpeedAirY += Q_MUL(qSpeed, SIN_24_8(rot * 4));

    /* 2nd speed apply */
    if (p->moveState & MOVESTATE_FACING_LEFT) {
        qSpeed = -Q(2);
    } else {
        qSpeed = +Q(2);
    }

    rot += Q(0.25); // turn 90 degrees right (back to original)
    p->qSpeedAirX += Q_MUL(qSpeed, COS_24_8(rot * 4));
    p->qSpeedAirY += Q_MUL(qSpeed, SIN_24_8(rot * 4));

    p->charState = CHARSTATE_79;
    Player_Knuckles_InitGfx_UppercutFlame(p);

    return TRUE;
}

s32 sub_8048C3C(Player *p)
{
    switch (p->SA2_LABEL(unk62)) {
        case 0: {
            sub_8048ADC(p);
            return p->SA2_LABEL(unk62);
        } break;

        case 1: {
            if (p->frameInput & gPlayerControls.attack) {
                p->SA2_LABEL(unk63) = 1;
            }

            return p->SA2_LABEL(unk62);
        } break;

        case 2: {
            if (p->frameInput & gPlayerControls.attack) {
                p->SA2_LABEL(unk63) = 1;
            }

            return p->SA2_LABEL(unk62);
        } break;

        case 3: {
            sub_8048B38(p);
            return p->SA2_LABEL(unk62);
        } break;
    }

    return 0;
}

void sub_8048CB0(Player *p)
{
    if (p->SA2_LABEL(unk62) == 0) {
        if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (sub_8048C3C(p) == 0)) {
            if (Player_TrySpindash(p) || Player_TryJump(p)) {
                return;
            }

            SA2_LABEL(sub_8029CA0)(p);
            Player_8044F7C(p);
        }

        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    } else {
        SA2_LABEL(sub_8029CA0)(p);
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (sub_8048C3C(p) != 3)) {
            s32 qSpeed = p->qSpeedGround;

            if (qSpeed > Q(0)) {
                if ((qSpeed - Q(96. / 256.)) < Q(0)) {
                    qSpeed = 0;
                } else {
                    qSpeed -= Q(96. / 256.);
                }

                p->qSpeedGround = qSpeed;
            } else if (qSpeed < Q(0)) {
                if ((qSpeed + Q(96. / 256.)) > Q(0)) {
                    qSpeed = 0;
                } else {
                    qSpeed += Q(96. / 256.);
                }

                p->qSpeedGround = qSpeed;
            }

            Player_80470AC(p);
            SA2_LABEL(sub_80231C0)(p);
        }

        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        SA2_LABEL(sub_8022D6C)(p);
        SA2_LABEL(sub_8029ED8)(p);
    }
}

void Player_Knuckles_SwimFloat_8048D74(Player *p)
{
    Water *water = &gWater;

    if (p->heldInput & DPAD_DOWN) {
        p->charState = CHARSTATE_18;
        p->SA2_LABEL(unk61) = 0;
        return;
    } else if (p->moveState & MOVESTATE_IN_WATER) {
        s16 qSpeed;
#ifndef NON_MATCHING
        register s32 r3 asm("r3");
#else
        s32 r3;
#endif
        s32 qOldSpeed = (u16)p->qSpeedAirY - Q(24. / 256.);
        p->qSpeedAirY -= Q(24. / 256.);
        r3 = qOldSpeed;
        qSpeed = qOldSpeed;

        if (qSpeed < -Q(1)) {
            r3 = -Q(1);
        }

        p->qSpeedAirY = r3;
    }

    if (I(p->qWorldY) - 4 < water->currentWaterLevel) {
        p->qWorldY = Q(water->currentWaterLevel + 4);
        p->qSpeedAirY = 0;
        p->moveState |= MOVESTATE_IN_WATER;
        p->framesUntilDrownCountDecrement = GBA_FRAMES_PER_SECOND;
        p->secondsUntilDrown = 30;
        m4aSongNumStop(27);
    }

    if (p->heldInput & DPAD_UP) {
        p->charState = CHARSTATE_83;
        Player_8044750(p);
    } else {
        Player_804726C(p);
        Player_8047280(p);

        if (p->charState != CHARSTATE_KNUCKLES_FLOAT) {
            Player_Knuckles_InitGfx_FloatSplash(p);
        }

        p->charState = CHARSTATE_KNUCKLES_FLOAT;
    }
}

void sub_8048E34(Player *p)
{
    if (p->SA2_LABEL(unk61) == 0) {
        Player_804726C(p);
        Player_8047280(p);

        if (p->SA2_LABEL(unk62) == 0) {
            Player_8044670(p);

            if (p->moveState & MOVESTATE_1000) {
                if ((p->moveState & MOVESTATE_IN_WATER) && (p->qSpeedAirY >= Q(0))) {
                    p->SA2_LABEL(unk61) = 9;
                    p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FLIP_WITH_MOVE_DIR);
                    p->charState = CHARSTATE_KNUCKLES_FLOAT;
                    Player_Knuckles_InitGfx_FloatSplash(p);
                }
            }
            Player_AirInputControls(p);
        } else {
            if (p->moveState & MOVESTATE_1000) {
                if ((p->moveState & MOVESTATE_IN_WATER) && (p->qSpeedAirY >= Q(0))) {
                    p->SA2_LABEL(unk61) = 9;
                    p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FLIP_WITH_MOVE_DIR);
                    p->charState = CHARSTATE_KNUCKLES_FLOAT;
                    Player_Knuckles_InitGfx_FloatSplash(p);
                }
            }
        }

        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        PlayerFn_Cmd_UpdateAirFallSpeed(p);
        Player_8047224(p);
        SA2_LABEL(sub_8022190)(p);
    } else if (p->SA2_LABEL(unk61) < 9) {
        Player_804726C(p);
        Player_8047280(p);

        if (p->SA2_LABEL(unk61) == 2) {
            if (p->moveState & MOVESTATE_1000) {
                if ((p->moveState & MOVESTATE_IN_WATER) && (p->qSpeedAirY >= Q(0))) {
                    p->SA2_LABEL(unk61) = 9;
                    p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FLIP_WITH_MOVE_DIR);
                    p->charState = CHARSTATE_KNUCKLES_FLOAT;
                    Player_Knuckles_InitGfx_FloatSplash(p);
                }
            }
        }

        sub_8048980(p);
        sa2__sub_80232D0(p);
        Player_UpdatePosition(p);

        switch (p->SA2_LABEL(unk61)) {
            case 0: {
                return;
            } break;

            case 1: {
                sub_8048230(p);
            } break;

            case 2: {
                sub_80484CC(p);
            } break;

            case 3: {
                sub_80485CC(p);
            } break;

            case 4: {
                sub_80486E8(p);
            } break;

            case 5: {
                return;
            } break;

            case 6: {
                return;
            } break;
        }
    } else if (Player_TryJump(p)) {
        p->qSpeedAirY >>= 1;
        p->SA2_LABEL(unk61) = 0;
    } else {
        Player_AirInputControls(p);
        SA2_LABEL(sub_80232D0)(p);
        Player_UpdatePosition(p);
        Player_Knuckles_SwimFloat_8048D74(p);
        PlayerFn_Cmd_UpdateAirFallSpeed(p);
        Player_8047224(p);
        SA2_LABEL(sub_8022190)(p);
    }
}

void Player_Knuckles_8049000(Player *p)
{
    switch (p->moveState & MOVESTATE_JUMPING) {
        case 0: {
            {
                sub_8048CB0(p);
            }

        } break;

        case MOVESTATE_IN_AIR: {
            sub_8048E34(p);
        } break;

        case MOVESTATE_SPIN_ATTACK: {
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
            // Inline of sub_8049208?
            Player_804726C(p);
            Player_8047280(p);
            Player_8044670(p);

            if (p->moveState & MOVESTATE_1000) {
                if ((p->moveState & MOVESTATE_IN_WATER) && (p->qSpeedAirY >= Q(0))) {
                    p->SA2_LABEL(unk61) = 9;
                    p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FLIP_WITH_MOVE_DIR);

                    p->charState = CHARSTATE_KNUCKLES_FLOAT;

                    Player_Knuckles_InitGfx_FloatSplash(p);
                }
            }
            Player_AirInputControls(p);
            SA2_LABEL(sub_80232D0)(p);
            Player_UpdatePosition(p);
            PlayerFn_Cmd_UpdateAirFallSpeed(p);
            Player_8047224(p);
            SA2_LABEL(sub_8022190)(p);
        } break;
    }
}

void Task_KnucklesFloatSplash(void)
{
    struct Task *t = gCurTask;
    MultiplayerSpriteTask *mps = TASK_DATA(gCurTask);
    u8 mpid = mps->mpPlayerID;
    Sprite *s = &mps->s;
    Camera *cam = &gCamera;
    Water *water;
    Player *p;
    u32 mask;

    if (IS_SINGLE_PLAYER) {
        p = &gPlayer;

        if (mpid != PLAYER_1) {
            p = &gPartner;
        }

        water = &gWater;

        if (p->charState != CHARSTATE_KNUCKLES_FLOAT) {
            TaskDestroy(t);
            return;
        }
    } else {
        TaskDestroy(t);
        return;
    }

    s->x = (I(p->qWorldX) - cam->x) + p->SA2_LABEL(unk7C);
    s->y = (I(p->qWorldY) - ({ (u16) cam->y + 4; }));

    s->frameFlags &= ~0x3000;
    mask = p->spriteInfoBody->s.frameFlags & 0x3000;
    s->frameFlags |= mask;

    if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
        SPRITE_FLAG_SET(s, X_FLIP);
    } else {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    }

    UpdateSpriteAnimation(s);

    if (water->currentWaterLevel >= 0) {
        if (I(p->qWorldY) - 6 < water->currentWaterLevel) {
            DisplaySprite(s);
        }
    }
}

void sub_80491C4(Player *p)
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

void sub_8049208(Player *p)
{
    Player_804726C(p);
    Player_8047280(p);
    Player_8044670(p);

    if (p->moveState & MOVESTATE_1000) {
        if ((p->moveState & MOVESTATE_IN_WATER) && (p->qSpeedAirY >= Q(0))) {
            p->SA2_LABEL(unk61) = 9;
            p->moveState &= ~(MOVESTATE_SPIN_ATTACK | MOVESTATE_FLIP_WITH_MOVE_DIR);

            p->charState = CHARSTATE_KNUCKLES_FLOAT;

            Player_Knuckles_InitGfx_FloatSplash(p);
        }
    }
    Player_AirInputControls(p);
    SA2_LABEL(sub_80232D0)(p);
    Player_UpdatePosition(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    Player_8047224(p);
    SA2_LABEL(sub_8022190)(p);
}

struct Task *Player_Knuckles_InitGfx_UppercutFlame(Player *p)
{
    struct Task *t
        = CreateMultiplayerSpriteTask(0, 0, 224, p->playerID, Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *mps = TASK_DATA(t);
    Sprite *s = &mps->s;

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_KNUCKLES_UPPERCUT);
    s->graphics.anim = SA1_ANIM_CHAR(KNUCKLES, ATTACK);
    s->variant = 3;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

struct Task *Player_Knuckles_InitGfx_FloatSplash(Player *p)
{
    struct Task *t = CreateMultiplayerSpriteTask(0, 0, 96, p->playerID, Task_KnucklesFloatSplash, TaskDestructor_MultiplayerSpriteTask);
    MultiplayerSpriteTask *mps = TASK_DATA(t);
    Sprite *s = &mps->s;

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_KNUCKLES_FLOAT_SPLASH);
    s->graphics.anim = SA1_ANIM_KNUCKLES_FLOAT_SPLASH;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void sub_8049348(Player *p)
{
    p->SA2_LABEL(unk61) = 2;
    p->charState = CHARSTATE_63;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
#ifndef NON_MATCHING
    {
        u32 flag;
        u32 r1 = p->w.kf.flags;
        asm("mov %0, #2" : "=r"(flag));
        p->w.kf.flags = flag | r1;
    }
#else
    // This generates the correct instruction with ANY other value, except for 2, because 2 is used in the 1st line...
    p->w.kf.flags |= 2;
#endif
}

void sub_804936C() { }
