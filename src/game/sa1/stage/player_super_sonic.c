#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/amy_attack_heart_effect.h"
#include "game/globals.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/dust_effect_braking.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/sa1/stage/player_super_sonic.h"
#include "game/sa1/stage/enemies/boss_xtra_super_egg_robo.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/underwater_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"

/* Start of Super Sonic ? */
#include "game/sa1/stage/enemies/boss_xtra_super_egg_robo.h"

void Player_SuperSonic_80499CC(Player *p);
void sub_8049D7C(Player *p);
void Player_8049E3C(Player *p);
bool32 sub_8049BAC(Player *p);
void sub_8049FD0(Player *p);
void Player_804A0B8(Player *p);
void sub_804A1B8(Player *p);
void InitSparkleCount(void);
void Player_804A20C(Player *p);
void Player_804A254(Player *p);
void sub_804A2FC(Player *p);
void sub_804A498(s32 qWorldX, s32 qWorldY, bool32 param2);
void Task_804A54C(void);
void Task_804A71C(void);
void TaskDestructor_804A830(Task *);
void sub_804A854(Player *p);
void Task_804AAC4(void);
void Task_804AD0C(void);
void Task_804B370(void);
void ExtraBossCapsule_UpdateSprite(Sprite *s, s32 screenX, s32 screenY);

// TODO: static
static s32 sSparkleCount = 0;

extern TileInfoFirework gUnknown_084AE1B0[5];

extern void Task_PlayerDied();

void Task_8049898(void)
{
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    const Collision *coll = gRefCollision;
    MaybeSuperSonic *super;
    Sprite *s;
    s32 r3;

    cam->minY = coll->pxHeight - 200;
    cam->maxX = 480;
    cam->shiftX = 64;
    cam->shiftY = 0;

    Player_804A254(p);

    if (!IS_ALIVE(p)) {
        // TODO: This is confusing.
        // Inline functions imply that the player modules were split, but this implies it was one big file after all.
        gCurTask->main = Task_PlayerDied;
        p->charState = CHARSTATE_DEAD;
        p->qSpeedAirX = Q(0);
        p->timerInvulnerability = 2;
        p->itemEffect = 0;
        cam->SA2_LABEL(unk50) |= 3;

        if (IS_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__ACT_START;
        }

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

        p->SA2_LABEL(unk80) = Q(1.0);
        p->SA2_LABEL(unk82) = Q(1.0);
        m4aSongNumStop(0x1C);
        m4aSongNumStop(0x1B);
        m4aSongNumStop(0x78);
    } else if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        sub_8049D7C(p);
    }

    Player_804A20C(p);

    super = TASK_DATA(p->spriteTask);
    r3 = (super->unk8 + 1) & 0xF;

    super->qXs[r3] = p->qWorldX;
    super->qYs[r3] = p->qWorldY;

    super->unk8 = r3;

    Player_8049E3C(p);

    if (p->SA2_LABEL(unk2A) != 0) {
        p->SA2_LABEL(unk2A)--;
    } else if (p->timerInvulnerability > 0) {
        p->timerInvulnerability--;
    }

    Player_SuperSonic_80499CC(p);
}

void Player_SuperSonic_80499CC(Player *p)
{
    if (!(gStageFlags & STAGE_FLAG__ACT_START)) {
#ifdef BUG_FIX
        if (gExtraBossTaskData.boss)
#endif
        {
            if (!(gExtraBossTaskData.boss->flags58 & SER_FLAG__80)) {
                if (++p->timerSpeedup >= GBA_FRAMES_PER_SECOND) {
                    p->timerSpeedup -= GBA_FRAMES_PER_SECOND;

                    if (--gRingCount <= 10) {
                        m4aSongNumStart(SE_TIMER);
                    }

                    if (gRingCount == 0) {
                        // TODO: Is this a macro?
                        gRingCount = 0;
                        p->moveState |= MOVESTATE_DEAD;
                    }
                }
            }
        }
    }
}

void Player_SuperSonic_8049A34(Player *p)
{
    switch (p->heldInput & DPAD_SIDEWAYS) {
        case 0: {
            if (p->qSpeedGround != 0) {
                if (p->qSpeedGround > Q(0)) {
                    p->qSpeedGround -= Q(96. / 256.);

                    if (p->qSpeedGround < Q(0)) {
                        p->qSpeedGround = Q(0);
                    }
                } else if (p->qSpeedGround < Q(0)) {
                    p->qSpeedGround += Q(96. / 256.);
                    if (p->qSpeedGround > Q(0)) {
                        p->qSpeedGround = Q(0);
                    }
                }
            }
        } break;

        case DPAD_LEFT: {
            p->qSpeedGround -= Q(36. / 256.);

            if (p->qSpeedGround < -Q(2)) {
                p->qSpeedGround = -Q(2);
            }
        } break;

        case DPAD_RIGHT: {
            p->qSpeedGround += Q(36. / 256.);

            if (p->qSpeedGround > +Q(2)) {
                p->qSpeedGround = +Q(2);
            }
        } break;
    }

    p->qSpeedAirX = p->qSpeedGround;
}

void Player_SuperSonic_8049AB8(Player *p)
{
    s32 r0, r3;
    s32 qWorldX;

    if (p->SA2_LABEL(unk62) == 0) {
        if (!sub_8049BAC(p)) {
            if (p->frameInput & gPlayerControls.jump) {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState |= MOVESTATE_100;

                p->qSpeedAirY -= Q(4.25);
                m4aSongNumStart(SE_JUMP);
            } else {
                // _08049B04
                Player_SuperSonic_8049A34(p);

                qWorldX = p->qWorldX;
                r3 = qWorldX;
                if (p->qWorldX >= 0) {
                    r0 = qWorldX;
                    if (r0 > Q(480)) {
                        r0 = Q(480);
                    }
                } else {
                    r0 = 0;
                }
                qWorldX = r0;

                if (qWorldX != r3) {
                    if (!(p->moveState & MOVESTATE_IN_AIR)) {
                        p->qSpeedGround = Q(0);
                    }

                    p->qSpeedAirX = 0;
                }

                p->qWorldX = qWorldX;

                Player_UpdatePosition(p);
                Player_UpdatePosition(p);
                Player_804A0B8(p);

                // TODO: Do CHARSTATE_ values have different meanings for Super Sonic?
                p->charState = CHARSTATE_CROUCH;
                return;
            }
        }
    } else {
        sub_804A2FC(p);

        qWorldX = p->qWorldX;
        r3 = qWorldX;
        if (p->qWorldX >= 0) {
            r0 = qWorldX;
            if (r0 > Q(480)) {
                r0 = Q(480);
            }
        } else {
            r0 = 0;
        }
        qWorldX = r0;

        if (qWorldX != r3) {
            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = Q(0);
            }

            p->qSpeedAirX = 0;
        }

        p->qWorldX = qWorldX;

        Player_UpdatePosition(p);
        Player_UpdatePosition(p);
        Player_804A0B8(p);

        // TODO: Do CHARSTATE_ values have different meanings for Super Sonic?
        p->charState = CHARSTATE_3;
        return;
    }
}

// (87.78%) https://decomp.me/scratch/wiHzX
NONMATCH("asm/non_matching/game/sa1/stage/Player__sub_8049BAC.inc", bool32 sub_8049BAC(Player *p))
{
    if ((p->SA2_LABEL(unk61) == 0) || (--p->SA2_LABEL(unk61) == 0)) {
        if (p->frameInput & gPlayerControls.attack) {
            p->SA2_LABEL(unk61) = 8;
            p->SA2_LABEL(unk62) = 1;
            p->qSpeedGround = Q(4);
            p->qSpeedAirX = Q(0);
            p->qSpeedAirY = Q(0);

            sub_804A854(p);
            m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);
            return TRUE;
        }
    }

    return FALSE;
}
END_NONMATCH

// TODO: Fake-match
void Player_SuperSonic_8049C0C(Player *p)
{
    s32 r0;
    s32 r3;
    s32 qWorldX;
    s32 rot;

    if (p->SA2_LABEL(unk62) == 0) {
        if (!sub_8049BAC(p)) {
            if (!(p->heldInput & gPlayerControls.jump) && (p->moveState & MOVESTATE_100)) {
                s32 qSpeed;
                r0 = p->qSpeedAirY;
#ifndef NON_MATCHING
                asm("movs %0, %1" : "=r"(qSpeed) : "r"(r0));
#else
                qSpeed = r0;
#endif

                if (p->qSpeedAirY < -Q(1.5)) {
                    qSpeed = -Q(1.5);
                }

                p->qSpeedAirY = qSpeed;
            }

            switch (p->heldInput & DPAD_SIDEWAYS) {
                case DPAD_LEFT: {
                    p->qSpeedAirX -= Q(72. / 256.);

                    if (p->qSpeedAirX < -Q(2)) {
                        p->qSpeedAirX = -Q(2);
                    }
                } break;

                case DPAD_RIGHT: {
                    p->qSpeedAirX += Q(72. / 256.);

                    if (p->qSpeedAirX > +Q(2)) {
                        p->qSpeedAirX = +Q(2);
                    }
                } break;
            }

            qWorldX = p->qWorldX;
            r3 = qWorldX;
            if (p->qWorldX >= 0) {
                r0 = qWorldX;
                if (r0 > Q(480)) {
                    r0 = Q(480);
                }
            } else {
                r0 = 0;
            }
            qWorldX = r0;

            if (qWorldX != r3) {
                if (!(p->moveState & MOVESTATE_IN_AIR)) {
                    p->qSpeedGround = Q(0);
                }

                p->qSpeedAirX = 0;
            }
            p->qWorldX = qWorldX;

            // TODO: Find out why Player_UpdatePosition is often called twice in Super Sonic code
            Player_UpdatePosition(p);
            Player_UpdatePosition(p);

            p->qSpeedAirY += Q(32. / 256.);

            rot = (s8)p->rotation;
            if (rot < 0) {
                rot += 2;

                if (rot > 0) {
                    rot = 0;
                }
            } else if (rot > 0) {
                rot -= 2;

                if (rot < 0) {
                    rot = 0;
                }
            }

            p->rotation = rot;

            if (p->qSpeedAirY >= 0) {
                sub_8049FD0(p);
            }

            p->charState = CHARSTATE_CROUCH;
        }
    } else {
        p->qSpeedGround -= Q(0.25);

        if (p->qSpeedGround <= Q(0)) {
            p->SA2_LABEL(unk62) = Q(0);
            p->qSpeedAirX = Q(0);
            p->qSpeedAirY = Q(0);
        } else {
            p->qSpeedAirX = p->qSpeedGround;
        }

        qWorldX = p->qWorldX;
        r3 = qWorldX;
        if (p->qWorldX >= 0) {
            r0 = qWorldX;
            if (r0 > Q(480)) {
                r0 = Q(480);
            }
        } else {
            r0 = 0;
        }
        qWorldX = r0;

        if (qWorldX != r3) {
            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = Q(0);
            }

            p->qSpeedAirX = 0;
        }
        p->qWorldX = qWorldX;

        // TODO: Find out why Player_UpdatePosition is often called twice in Super Sonic code
        Player_UpdatePosition(p);
        Player_UpdatePosition(p);
        Player_804A0B8(p);
        p->charState = CHARSTATE_3;
    }
}

void sub_8049D7C(Player *p)
{
    if (p->SA2_LABEL(unk2A) != 0) {
        p->rotation -= Q(12. / 256.);
        Player_UpdatePosition(p);
        Player_UpdatePosition(p);
        Player_804A0B8(p);
    } else {
        if (p->moveState & MOVESTATE_IN_AIR) {
            Player_SuperSonic_8049C0C(p);
        } else {
            Player_SuperSonic_8049AB8(p);
        }

        if ((gStageTime % 4u) == 0) {
            if (PSEUDO_RANDOM_32() & 0x10000) {
                s32 qWorldX, qWorldY;
                s32 qRand;
                qWorldX = p->qWorldX + (((u32)PSEUDO_RANDOM_32() & 0xF0000) >> 8);
                qWorldY = p->qWorldY + (((u32)PSEUDO_RANDOM_32() & 0xF0000) >> 8) - Q(8);
                qRand = (((u32)PSEUDO_RANDOM_32() & 0x10000) >> 16);

                sub_804A498(qWorldX, qWorldY, qRand);
            }
        }
    }
}

// (100.0%) https://decomp.me/scratch/S7Q8B
void Player_8049E3C(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    MaybeSuperSonic *superSonic;
    s32 sp00;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE_ENABLE);
    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    SPRITE_FLAG_SET(s, X_FLIP);
    UpdateSpriteAnimation(s);

    if (IS_ALIVE(p)) {
        if (p->moveState & MOVESTATE_100000) {
            return;
        }

        if ((p->SA2_LABEL(unk2A) == 0) && (p->timerInvulnerability != 0) && (gStageTime & 0x2)) {
            return;
        }
    }

    superSonic = TASK_DATA(p->spriteTask);
    sp00 = superSonic->unk8;

    {
        psiBody->transform.x = s->x = I(p->qWorldX) - gCamera.x;
        psiBody->transform.y = s->y = I(p->qWorldY) - gCamera.y;

        if (p->charState == CHARSTATE_WALK_A) {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
            SPRITE_FLAG_CLEAR(s, ROT_SCALE);
            SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);

            psiBody->transform.rotation = p->rotation * 4;
            psiBody->transform.qScaleX = -Q(1);

            TransformSprite(s, &psiBody->transform);
        }

        DisplaySprite(s);
    }

    s->frameFlags |= (SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1));

    if ((gStageTime & 0x2) == 0) {
        s32 r6 = 1;
#ifndef NON_MATCHING
        register s32 *qXs asm("sl") = &superSonic->qXs[0];
        register s32 *qYs asm("r9") = &superSonic->qYs[0];
#else
        s32 *qXs = &superSonic->qXs[0];
        s32 *qYs = &superSonic->qYs[0];
#endif
        s32 r7 = sp00 - 2;

        for (; r6 < 4; r7 -= 2, r6++) {
            s32 index = r7 % ARRAY_COUNT(superSonic->qXs);
#ifndef NON_MATCHING
            // All this for an add with swapped params...
            s32 x;
            asm("mov r3, %1\n"
                "add %0, r3, %2\n"
                "ldr %0, [%0]\n"
                : "=r"(x)
                : "r"(qXs), "r"(index * 4));
#else
            s32 x = qXs[index];
#endif
            psiBody->transform.x = s->x = I(x) - r6 * 8 - gCamera.x;
            psiBody->transform.y = s->y = I(qYs[index]) - gCamera.y;

            if (p->charState == 4) {
                SPRITE_FLAG_CLEAR(s, X_FLIP);
                SPRITE_FLAG_CLEAR(s, ROT_SCALE);
                SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);
                SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, r6);

                psiBody->transform.rotation = p->rotation * 4;
                psiBody->transform.qScaleX = -Q(1);

                TransformSprite(s, &psiBody->transform);
            }

            DisplaySprite(s);
        }
    }

    s->frameFlags &= ~(SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1));
}

void sub_8049FD0(Player *p)
{
#ifndef NON_MATCHING
    register s32 x asm("r4") = gCamera.x;
#else
    s32 x = gCamera.x;
#endif
    s32 scrollX = (x + gStageTime * 8);
    s32 y;
    s32 sp08;
    s32 px, py;
    s32 res0;
    s32 res1;
    u8 layer;
    // 2688(0xA80) =
    //          3072         -          600
    // Moon Zone Pixel Width - (4 * Metatile_Width)
    const s32 scrollMaxX = (28 * 96);

    if (scrollX - 72 >= scrollMaxX) {
        scrollX -= 72;
        scrollX = Mod(scrollX, scrollMaxX) + 72;
    }

    px = Q(x - scrollX);
    x = p->qWorldX;
    x -= px;

    y = p->qWorldY;

    sp08 = p->SA2_LABEL(unk61);
    layer = p->layer;
    y = I(y);
    py = y + p->spriteOffsetY;
    x = I(x);
    px = x - 2;
    px -= p->spriteOffsetX;
    res0 = SA2_LABEL(sub_801E4E4)(py, px, layer, +8, 0, SA2_LABEL(sub_801EE64));

    y += p->spriteOffsetY;
    x += 2;
    x += p->spriteOffsetX;
    res1 = SA2_LABEL(sub_801E4E4)(y, x, layer, +8, 0, SA2_LABEL(sub_801EE64));

    if (res1 > res0) {
        res1 = res0;
    }

    if (res1 < 0) {
        p->qWorldY += Q(res1);
        p->qSpeedGround = p->qSpeedAirX;
        p->qSpeedAirY = 0;

        SA2_LABEL(sub_8021BE0)(p);

        p->SA2_LABEL(unk61) = sp08;
    }
}

void Player_804A0B8(Player *p)
{
#ifndef NON_MATCHING
    register s32 x asm("r4") = gCamera.x;
#else
    s32 x = gCamera.x;
#endif
    s32 y;
    s32 anotherY;
    s32 scrollX = (x + gStageTime * 8);
    s32 sp08;
    s32 px, py;
    s32 res0;
    s32 res1;
    u8 layer;
    // 2688(0xA80) =
    //          3072         -          600
    // Moon Zone Pixel Width - (4 * Metatile_Width)
    const s32 scrollMaxX = (28 * 96);

    if (scrollX - 72 >= scrollMaxX) {
        scrollX -= 72;
        scrollX = Mod(scrollX, scrollMaxX) + 72;
    }

    px = Q(x - scrollX);
    x = p->qWorldX;
    x -= px;

    y = p->qWorldY;

    layer = p->layer;
    anotherY = I(y);
    py = anotherY + p->spriteOffsetY;
    x = I(x);
    px = x - 2;
    px -= p->spriteOffsetX;
    res0 = SA2_LABEL(sub_801E4E4)(py, px, layer, +8, 0, SA2_LABEL(sub_801EE64));

    anotherY += p->spriteOffsetY;
    x += 2;
    x += p->spriteOffsetX;
    res1 = SA2_LABEL(sub_801E4E4)(anotherY, x, layer, +8, 0, SA2_LABEL(sub_801EE64));

    if (res1 > res0) {
        res1 = res0;
    }

    if (res1 != 0) {
        if (res1 < 0) {
            if (res1 < -11) {
                return;
            }

            y += Q(res1);
        } else {
            // bc:
            s32 airX = I(ABS(p->qSpeedAirX));

            if ((airX += 11) > 11) {
                airX = 11;
            }

            if (res1 > airX) {
                if (!(p->moveState & MOVESTATE_GOAL_REACHED)) {
                    p->moveState |= MOVESTATE_IN_AIR;
                } else {
                    p->qWorldY = y;
                }

                return;
            }

            y += Q(res1);
        }
    }

    p->qWorldY = y;
}

// Called when Super Sonic is initialized
void sub_804A1B8(Player *p)
{
    MaybeSuperSonic *superSonic = TASK_DATA(p->spriteTask);
    s32 ringCount;
    s32 i;

    superSonic->unk8 = 0;
    ringCount = gRingCount;

    for (i = 0; i < (s32)ARRAY_COUNT(superSonic->qXs); i++) {
        superSonic->qXs[i] = p->qWorldX;
        superSonic->qYs[i] = p->qWorldY;
    }

    gRingCount = EXTRA_BOSS__INITIAL_RING_COUNT;

    p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    InitSparkleCount();
}

void Player_804A20C(Player *p)
{
    Sprite *s = &p->spriteInfoBody->s;
    TileInfoFirework *tileInfo = &gUnknown_084AE1B0[p->charState];

    if ((s->graphics.anim != tileInfo->anim) || (s->variant != tileInfo->variant)) {
        s->graphics.anim = tileInfo->anim;
        s->variant = tileInfo->variant;
        s->prevVariant = -1;
    }
}

void Player_804A254(Player *p)
{
    u16 input = p->heldInput;

    if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
        p->heldInput = gInput;
    }

    input ^= p->heldInput;
    input &= p->heldInput;

    p->frameInput = input;
}

bool32 Player_SuperSonic_UnusedJump(Player *p)
{
    bool32 result;

    if (p->frameInput & gPlayerControls.jump) {
        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState |= MOVESTATE_100;

        p->qSpeedAirY -= Q(4.25);

        m4aSongNumStart(SE_JUMP);
        result = TRUE;
    } else {
        result = FALSE;
    }

    return result;
}

void sub_804A2B8(Player *p)
{
    switch (p->heldInput & DPAD_SIDEWAYS) {
        case DPAD_LEFT: {
            p->qSpeedAirX -= Q(72. / 256.);

            if (p->qSpeedAirX < -Q(2)) {
                p->qSpeedAirX = -Q(2);
            }
        } break;

        case DPAD_RIGHT: {
            p->qSpeedAirX += Q(72. / 256.);

            if (p->qSpeedAirX > +Q(2)) {
                p->qSpeedAirX = +Q(2);
            }
        } break;
    }
}

void sub_804A2FC(Player *p)
{
    p->qSpeedGround = (p->qSpeedGround - Q(0.25));

    if (p->qSpeedGround <= Q(0)) {
        p->SA2_LABEL(unk62) = 0;
        p->qSpeedAirX = Q(0);
        p->qSpeedAirY = Q(0);
    } else {
        p->qSpeedAirX = p->qSpeedGround;
    }
}

void sub_804A320(Player *p)
{
    bool32 result;

    if (!(p->heldInput & gPlayerControls.jump) && (p->moveState & MOVESTATE_100)) {
#ifndef NON_MATCHING
        register s32 r3 asm("r3");
#else
        s32 r3;
#endif
        s32 qSpeed = p->qSpeedAirY;
        r3 = qSpeed;
        if (qSpeed < -Q(1.5)) {
            r3 = -Q(1.5);
        }

        p->qSpeedAirY = r3;
    }
}

void sub_804A354(Player *p) { p->qSpeedAirX = p->qSpeedGround; }

void sub_804A35C(Player *p)
{
    s32 rot = (s8)p->rotation;

    if (rot < 0) {
        rot += 2;

        if (rot > 0) {
            rot = 0;
        }
    } else if (rot > 0) {
        rot -= 2;

        if (rot < 0) {
            rot = 0;
        }
    }

    p->rotation = rot;
}

void sub_804A37C(Player *p)
{
    s32 r2 = p->qWorldX;
    s32 r4 = r2;
    s32 r0;

    if (p->qWorldX >= Q(0)) {
        r0 = p->qWorldX;

        if (r0 > Q(480)) {
            r0 = Q(480);
        }
    } else {
        r0 = 0;
    }

    r2 = r0;

    if (r2 != r4) {
        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->qSpeedGround = 0;
        }

        p->qSpeedAirX = 0;
    }

    p->qWorldX = r2;
}

void sub_804A3B8(Player *p) { p->qSpeedAirY += Q(32. / 256.); }

void Task_804A3C0(void)
{
#ifndef NON_MATCHING
    register Task *t asm("r2") = gCurTask;
#else
    Task *t = gCurTask;
#endif
    SomeTaskManager_60 *mgr = TASK_DATA(t);
    Sprite *s = &mgr->s;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 x, y;

    mgr->qUnk50 = p->qWorldX;
    mgr->qUnk54 = p->qWorldY;

    if (!IS_ALIVE(p) || ((mgr->unk2) && (s->frameFlags & 0x4000))) {
        TaskDestroy(t);
        return;
    }

    if ((p->SA2_LABEL(unk62) == 0) || (p->moveState & MOVESTATE_GOAL_REACHED)) {
        mgr->unk2 = 1;

        s->graphics.anim = SA1_ANIM_SUPER_SONIC_DASH;
        s->variant = 1;
    }

    x = I(mgr->qUnk50) - cam->x;
    y = I(mgr->qUnk54) - cam->y;

    s->x = x;
    s->y = y;

    if (gStageTime & 0x2) {
        SPRITE_FLAG_CLEAR(s, PRIORITY);
        SPRITE_FLAG_SET_VALUE(s, PRIORITY, 2);
    } else {
        SPRITE_FLAG_CLEAR(s, PRIORITY);
        SPRITE_FLAG_SET_VALUE(s, PRIORITY, 1);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_804A498(s32 qWorldX, s32 qWorldY, bool32 param2)
{
    Task *t;
    GfxInfo gfx;
    SomeTaskManager_60 *mgr;

    if (sSparkleCount > 0) {
        sSparkleCount--;

        if (param2) {
            gfx.tileInfo.anim = SA1_ANIM_SUPER_SONIC_SPARKLE;
            gfx.tileInfo.variant = 1;

        } else {
            gfx.tileInfo.anim = SA1_ANIM_SUPER_SONIC_SPARKLE;
            gfx.tileInfo.variant = 0;
        }

        gfx.vram = ALLOC_TILES(SA1_ANIM_SUPER_SONIC_SPARKLE);

        t = CreateSomeTaskManager_60_Task(&gfx, Task_804A54C, TaskDestructor_804A830);
        mgr = TASK_DATA(t);
        mgr->qUnk50 = qWorldX;
        mgr->qUnk54 = qWorldY;
        mgr->qUnk58 = 0;
        mgr->qUnk5C = -Q(0.25);
        mgr->s.oamFlags = SPRITE_OAM_ORDER(8);
        mgr->s.frameFlags = SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(PRIORITY, 1);
    }
}

void Task_804A54C(void)
{
    SomeTaskManager_60 *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->s;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(mgr->qUnk50) - cam->x;
    screenY = I(mgr->qUnk54) - cam->y;

    if ((s->frameFlags & 0x4000) || ((screenX < -16) || screenX >= DISPLAY_WIDTH + 16)) {
        TaskDestroy(gCurTask);
        return;
    }

    s->x = screenX;
    s->y = screenY;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    mgr->qUnk50 += mgr->qUnk58;
    mgr->qUnk58 += mgr->qUnk5C;
}

void sub_804A5D8(s32 screenX, s32 screenY)
{
    Task *t;
    SomeTaskManager_60 *mgr;
    GfxInfo gfx, sp08, sp0C, sp10;

    gfx.tileInfo.anim = SA1_ANIM_WARNING;
    gfx.tileInfo.variant = 0;
    gfx.vram = ALLOC_TILES_VARIANT(SA1_ANIM_WARNING, 0);
    t = CreateSomeTaskManager_60_Task(&gfx, Task_804A71C, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);
    mgr->unk0 = 0;
    mgr->qUnk50 = screenX; // NOTE: Q-value set to integer
    mgr->qUnk54 = screenY; // NOTE: Q-value set to integer
    mgr->s.oamFlags = 0;
    mgr->s.frameFlags = 0;
    mgr->transform.qScaleX = Q(1);
    mgr->transform.qScaleY = Q(1);

    sp08.tileInfo.anim = SA1_ANIM_WARNING;
    sp08.tileInfo.variant = 1;
    sp08.vram = ALLOC_TILES_VARIANT(SA1_ANIM_WARNING, 1);
    t = CreateSomeTaskManager_60_Task(&sp08, Task_804A71C, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);
    mgr->unk0 = 1;
    mgr->qUnk50 = screenX; // NOTE: Q-value set to integer
    mgr->qUnk54 = screenY; // NOTE: Q-value set to integer
    mgr->s.oamFlags = 0;
    mgr->transform.qScaleX = Q(1);
    mgr->transform.qScaleY = Q(1);
    mgr->s.frameFlags = SPRITE_FLAG(18, 1);

    sp0C.tileInfo.anim = SA1_ANIM_WARNING;
    sp0C.tileInfo.variant = 2;
    sp0C.vram = ALLOC_TILES_VARIANT(SA1_ANIM_WARNING, 1);
    t = CreateSomeTaskManager_60_Task(&sp0C, Task_804A71C, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);
    mgr->unk0 = 2;
    mgr->qUnk50 = screenX; // NOTE: Q-value set to integer
    mgr->qUnk54 = screenY; // NOTE: Q-value set to integer
    mgr->s.oamFlags = 0;
    mgr->transform.qScaleX = Q(1);
    mgr->transform.qScaleY = Q(1);

#ifndef NON_MATCHING
    asm("lsl %0, %0, #0xB\n"
        "str %0, [%1, #0x28]" ::"r"(0x80),
        "r"(mgr));
#else
    mgr->s.frameFlags = SPRITE_FLAG(18, 1);
#endif

    sp10.tileInfo.anim = SA1_ANIM_WARNING;
    sp10.tileInfo.variant = 3;
    sp10.vram = ALLOC_TILES_VARIANT(SA1_ANIM_WARNING, 1);
    t = CreateSomeTaskManager_60_Task(&sp10, Task_804A71C, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);
    mgr->unk0 = 3;
    mgr->qUnk50 = screenX; // NOTE: Q-value set to integer
    mgr->qUnk54 = screenY; // NOTE: Q-value set to integer
    mgr->s.oamFlags = 0;
    mgr->s.frameFlags = 0;
    mgr->transform.qScaleX = Q(1);
    mgr->transform.qScaleY = Q(1);
    mgr->s.frameFlags = SPRITE_FLAG(18, 1);
}

void Task_804A71C(void)
{
    SomeTaskManager_60 *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->s;
    SpriteTransform *tf;
    s32 x, y;
    s32 v;
#ifndef NON_MATCHING
    register s32 r0 asm("r0");
#else
    s32 r0;
#endif
    s32 r2;

    if (mgr->unk4 >= 0xC0) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((mgr->unk4 == 0x80) && (mgr->unk0 == 0)) {
#ifdef BUG_FIX
        if (gExtraBossTaskData.boss)
#endif
        {
            gExtraBossTaskData.boss->flags58 &= ~0x400000;
        }
    }

    x = I(mgr->qUnk50);
    y = I(mgr->qUnk54);

    v = ((mgr->unk4 & 0x1F) << 11);
    if (v != 0) {
        if (v < 0x4000) {
            r2 = Q(1);

            r0 = SIN_24_8(v >> 6);

        } else if (v >= 0xE000) {
            // TODO: Remove ONE_CYCLE
            s32 theta = (v - 0xE000) << 1;
            r0 = SIN_24_8((theta >> 6) & ONE_CYCLE);
            r2 = r0 + Q(1);
            r0 = Q(1) - r0;
        } else {
            r0 = Q(1);
            r2 = r0;
        }
    } else {
        r0 = Q(1);
        r2 = r0;
    }

    if (r2 == 0) {
        r2 = 2;
    }

    if (r0 == 0) {
        r0 = 2;
    }

    tf = &mgr->transform;
    tf->x = x;
    tf->y = y;
    tf->qScaleX = r2;
    tf->qScaleY = r0;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    s->frameFlags |= SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | gOamMatrixIndex++;

    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    mgr->unk4++;
}

void TaskDestructor_804A830(Task *t)
{
    SomeTaskManager_60 *mgr = TASK_DATA(t);
    sSparkleCount++;
    TaskDestructor_SomeTaskManager_60_Common(t);
}

void InitSparkleCount() { sSparkleCount = 4; }

void sub_804A854(Player *p)
{
    GfxInfo gfx;
    SomeTaskManager_60 *mgr;
    Task *t;

    gfx.tileInfo.anim = SA1_ANIM_SUPER_SONIC_DASH;
    gfx.tileInfo.variant = 0;
    gfx.vram = ALLOC_TILES(SA1_ANIM_SUPER_SONIC_DASH);
    t = CreateSomeTaskManager_60_Task(&gfx, Task_804A3C0, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);
    mgr->s.oamFlags = SPRITE_OAM_ORDER(8);
    mgr->s.frameFlags = SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(PRIORITY, 1);
}

void sub_804A8A8(s32 qX, s32 qY, s32 param2)
{
    GfxInfo gfx;
    Task *t;
    SomeTaskManager_7C *mgr;

    switch (param2) {
        case 0: {
            gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ROCK0;
            gfx.tileInfo.variant = 0;
            gfx.vram = VRAM_RESERVED_BOSS_XTRA_ROCK0;
        } break;

        case 1: {
            gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ROCK1;
            gfx.tileInfo.variant = 0;
            gfx.vram = VRAM_RESERVED_BOSS_XTRA_ROCK1;
        } break;

        case 2: {
            gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ROCK2;
            gfx.tileInfo.variant = 0;
            gfx.vram = VRAM_RESERVED_BOSS_XTRA_ROCK2;
        } break;
    }

    t = CreateSomeTaskManager_7C_Task(&gfx, Task_804AAC4, NULL);
    mgr = TASK_DATA(t);
    mgr->unk0.unk0 = param2;
    mgr->unk0.qUnk50 = qX;
    mgr->unk0.qUnk54 = qY;

    if (qX == Q(512)) {
        mgr->unk0.qUnk58 = -(((u32)PSEUDO_RANDOM_32() << 14) >> 22);
        mgr->unk0.qUnk5A = ((u32)PSEUDO_RANDOM_32() & 0xFF00) >> 8;
    } else {
        mgr->unk0.qUnk58 = (((u32)PSEUDO_RANDOM_32() & 0x3FF00) >> 8) - 0x300;
        mgr->unk0.qUnk5A = -(((u32)PSEUDO_RANDOM_32() & 0x3FF00) >> 8) - 0x80;
    }

    if (param2 == 2) {
        mgr->unk0.qUnk58 >>= 2;
        mgr->unk0.qUnk5A >>= 2;
    }

    mgr->unk0.qUnk5E = Q(7. / 256.);
    mgr->unk70 = (u32)PSEUDO_RANDOM_32() >> 8;
    mgr->unk72 = (((u32)PSEUDO_RANDOM_32() << 11) >> 19) - 0x1000;

    mgr->unk0.s.oamFlags = SPRITE_OAM_ORDER(12);
    mgr->unk0.s.frameFlags = SPRITE_FLAG(PRIORITY, 1);

    if (param2 == 0) {
        s32 a, b;
        u32 v;
        mgr->unk72 >>= 1;

        v = (u32)PSEUDO_RANDOM_32();
        a = mgr->unk0.transform.qScaleX;
        mgr->unk0.transform.qScaleX = a - ((v & 0x4000) >> 8);
        v = (u32)PSEUDO_RANDOM_32();
        b = mgr->unk0.transform.qScaleY;
        mgr->unk0.transform.qScaleY = b - ((v & 0x4000) >> 8);
    }

    if ((u32)PSEUDO_RANDOM_32() & 0x10000) {
        mgr->unk0.transform.qScaleY = -mgr->unk0.transform.qScaleY;
    }
}

void Task_804AAC4(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    SpriteTransform *transform = &mgr->unk0.transform;
    SuperEggRobo *extraBoss = gExtraBossTaskData.boss;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if (((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240 + 32)))
        || ((mgr->unk0.qUnk54 < -Q(32)) || (mgr->unk0.qUnk54 > +Q((DISPLAY_HEIGHT + 128) + 32)))) {
        TaskDestroy(gCurTask);
        return;
    }

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;

    if (p->SA2_LABEL(unk62) != 0) {
        if (sub_800C0E0(s, I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54), p) != 0) {
            s32 i = 3 - mgr->unk0.unk0;

            do {
                sub_804A8A8(mgr->unk0.qUnk50, mgr->unk0.qUnk54, 2);
            } while (--i != 0);

            m4aSongNumStart(SE_126);

            TaskDestroy(gCurTask);
            return;
        }
    } else if ((p->timerInvulnerability == 0) && !(extraBoss->flags58 & SER_FLAG__80)) {
        sub_800BFEC(s, I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54), p);
    }

    transform->x = screenX;
    transform->y = screenY;

    transform->rotation = mgr->unk70 >> 6;
    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    s->frameFlags |= gOamMatrixIndex++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    mgr->unk0.qUnk50 += mgr->unk0.qUnk58;
    mgr->unk0.qUnk54 += mgr->unk0.qUnk5A;
    mgr->unk0.qUnk58 += mgr->unk0.qUnk5C;
    mgr->unk0.qUnk5A += mgr->unk0.qUnk5E;
    mgr->unk70 += mgr->unk72;
}

void Task_804AC4C(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if ((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240))) {
        TaskDestroy(gCurTask);
        return;
    }

    ExtraBossCapsule_UpdateSprite(s, screenX, screenY);
    sub_804CFA0(&mgr->unk0);

    if (--mgr->unk0.unk4 <= 0) {
        s->graphics.anim = SA1_ANIM_BOSS_XTRA_CAPSULE;
        s->variant = 2;
        s->prevVariant = -1;

        mgr->unk0.qUnk58 = 0;
        mgr->unk0.qUnk5A = 0;

        gCurTask->main = Task_804AD0C;
    }
}

void Task_804AD0C(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    SuperEggRobo *extraBoss = gExtraBossTaskData.boss;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if ((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240))) {
        TaskDestroy(gCurTask);
        return;
    }

    switch (ExtraBoss__CapsuleGetCaptureState(mgr, s, extraBoss, p)) {
        case CAPSULE_STATE__DESTROYED: {
            return;
        } break;

        case CAPSULE_STATE__MOVING: {
            ExtraBossCapsule_UpdateSprite(s, screenX, screenY);
        } break;

        case CAPSULE_STATE__CAPTURED: {
            ExtraBossCapsule_UpdateSprite(s, screenX, screenY);
            return;
        } break;
    }

    sub_804CFA0(&mgr->unk0);

    if (p->qWorldY - mgr->unk0.qUnk54 < -Q(8)) {
        mgr->unk0.qUnk5A = -Q(1);
        return;
    } else if (p->qWorldY - mgr->unk0.qUnk54 > +Q(8)) {
        mgr->unk0.qUnk5A = +Q(1);
        return;
    }

    mgr->unk0.qUnk58 = -Q(3);
    mgr->unk0.qUnk5A = +Q(0);

    gCurTask->main = Task_804B370;
}

void sub_804AFCC(s32 qX, s32 qY);
void Task_804AF00(void);
void Task_804B0D8(void);

void Task_804AE14(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    if (p->timerInvulnerability != 0) {
        p->moveState &= ~MOVESTATE_GOAL_REACHED;

        sub_804AFCC(mgr->unk0.qUnk50, mgr->unk0.qUnk54);
        TaskDestroy(gCurTask);
        return;
    }
    // _0804AE6C

    mgr->unk0.qUnk50 = p->qWorldX;
    mgr->unk0.qUnk54 = p->qWorldY;

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;
    ExtraBossCapsule_UpdateSprite(s, screenX, screenY);

    if (s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
        mgr->unk0.unk4 = 240;

        p->qSpeedGround = 0;
        p->qSpeedAirX = 0;
        p->qSpeedAirY = 0;
        p->SA2_LABEL(unk62) = 0;
        p->moveState |= MOVESTATE_IA_OVERRIDE;
        p->moveState |= MOVESTATE_100000;

        s->graphics.anim = SA1_ANIM_BOSS_XTRA_CAPSULE;
        s->variant = 1;
        s->prevVariant = -1;

        gCurTask->main = Task_804AF00;
    }
}

void Task_804AF00(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    if ((p->timerInvulnerability != 0) || (--mgr->unk0.unk4 < 0)) {
        p->moveState &= ~MOVESTATE_GOAL_REACHED;
        p->moveState &= ~MOVESTATE_IA_OVERRIDE;
        p->moveState &= ~MOVESTATE_100000;

        sub_804AFCC(mgr->unk0.qUnk50, mgr->unk0.qUnk54);

        TaskDestroy(gCurTask);
        return;
    } else {
        u32 input;

        if (p->frameInput & DPAD_SIDEWAYS) {
            mgr->unk0.unk4 -= 20;
        }

        Player_804A0B8(p);

        mgr->unk0.qUnk50 = p->qWorldX + mgr->unk68;
        mgr->unk0.qUnk54 = p->qWorldY;
        mgr->unk68 -= mgr->unk68 >> 2;

        input = (p->frameInput & DPAD_RIGHT) << 1;
        input -= (p->frameInput & DPAD_LEFT);
        mgr->unk68 = (input << 5);

        ExtraBossCapsule_UpdateSprite(s, I(mgr->unk0.qUnk50) - cam->x, I(mgr->unk0.qUnk54) - cam->y);
    }
}

void sub_804AFCC(s32 qX, s32 qY)
{
    GfxInfo gfx;
    SomeTaskManager_7C *mgr;
    Task *t;
    s32 i;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_CAPSULE_PART;
    gfx.tileInfo.variant = 0;
    gfx.vram = VRAM_RESERVED_BOSS_XTRA_CAPSULE;

    for (i = 0; i < 2; i++) {
        t = CreateSomeTaskManager_7C_Task(&gfx, Task_804B0D8, NULL);
        mgr = TASK_DATA(t);

        mgr->unk0.qUnk50 = qX;
        mgr->unk0.qUnk54 = qY;

        mgr->unk0.qUnk58 = -((((u32)PSEUDO_RANDOM_32() & 0x7F00) >> 8) + 0x80);
        mgr->unk0.qUnk5A = +((((u32)PSEUDO_RANDOM_32() & 0x7F00) >> 8) + 0x40);
        mgr->unk0.qUnk5E = Q(7. / 256.);

        mgr->unk72 = (((u32)PSEUDO_RANDOM_32() << 13) >> 21) - Q(4);

        if (i & 1) {
            mgr->unk0.transform.qScaleX = -Q(1);
            mgr->unk0.qUnk58 = -mgr->unk0.qUnk58;
        }

        mgr->unk0.s.oamFlags = SPRITE_OAM_ORDER(12);
        mgr->unk0.s.frameFlags = SPRITE_FLAG(PRIORITY, 1);
    }
}

// TODO: Similar to Task_804AAC4, document diffs
void Task_804B0D8(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    SpriteTransform *transform = &mgr->unk0.transform;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if (((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240 + 32)))
        || ((mgr->unk0.qUnk54 < -Q(32)) || (mgr->unk0.qUnk54 > +Q((DISPLAY_HEIGHT + 128) + 32)))) {
        TaskDestroy(gCurTask);
        return;
    }

    transform->x = screenX;
    transform->y = screenY;
    transform->rotation = mgr->unk70 >> 6;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    s->frameFlags |= gOamMatrixIndex++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    mgr->unk0.qUnk50 += mgr->unk0.qUnk58;
    mgr->unk0.qUnk54 += mgr->unk0.qUnk5A;
    mgr->unk0.qUnk58 += mgr->unk0.qUnk5C;
    mgr->unk0.qUnk5A += mgr->unk0.qUnk5E;
    mgr->unk70 += mgr->unk72;
}

// NOTE: If you change this function or use a different compiler to agbcc,
//       you HAVE to remove the NON_MATCHING block.
//       Best by declaring -D NON_MATCHING as a compiler flag, if it isn't set already.
// (100.0%) https://decomp.me/scratch/CSS1H
s32 ExtraBoss__CapsuleGetCaptureState(SomeTaskManager_7C *mgr, Sprite *s, SuperEggRobo *extraBoss, Player *p)
{
    u32 res;
    typedef u32 (*FakematchFuncCast)(Sprite *, CamCoord, CamCoord);
    if (p->moveState & MOVESTATE_GOAL_REACHED) {
        return 0;
    }

#ifndef NON_MATCHING
    // TODO: Fix this, holy [REDACTED]!!!
    //       This only works because p is still in R3 at this point in time, when using agbcc.
    res = ((FakematchFuncCast)sub_800C0E0)(s, I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54));
#else
    res = sub_800C0E0(s, I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54), p);
#endif
    if (res != 0) {
        if (p->SA2_LABEL(unk62) != 0) {
            m4aSongNumStart(SE_ITEM_BOX);
            InitScatteringRings_ExtraBossCapsule(I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54), 8);
            sub_804AFCC(mgr->unk0.qUnk50, mgr->unk0.qUnk54);

            TaskDestroy(gCurTask);
            return CAPSULE_STATE__DESTROYED;
        } else if ((p->timerInvulnerability == 0) && !(extraBoss->flags58 & SER_FLAG__80)) {
            s->graphics.anim = SA1_ANIM_BOSS_XTRA_CAPSULE;
            s->variant = 3;
            s->prevVariant = -1;
            p->moveState |= MOVESTATE_GOAL_REACHED;

            gCurTask->main = Task_804AE14;

            return CAPSULE_STATE__CAPTURED;
        }
    }

    return CAPSULE_STATE__MOVING;
}

void sub_804B2BC(s32 qWorldX, s32 qWorldY)
{
    GfxInfo gfx;
    Task *t;
    SomeTaskManager_7C *mgr;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_CAPSULE;
    gfx.tileInfo.variant = 0;
    gfx.vram = ALLOC_TILES(SA1_ANIM_BOSS_XTRA_CAPSULE);

    t = CreateSomeTaskManager_7C_Task(&gfx, Task_804AC4C, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);

    mgr->unk0.qUnk50 = qWorldX;
    mgr->unk0.qUnk54 = qWorldY;
    mgr->unk0.qUnk58 = -Q(1);
    mgr->unk0.unk4 = 48;
    mgr->unk0.s.oamFlags = SPRITE_OAM_ORDER(12);
    mgr->unk0.s.frameFlags = SPRITE_FLAG(PRIORITY, 1);
}

// TODO: Maybe not just the ring capsule?
void ExtraBossCapsule_UpdateSprite(Sprite *s, s32 screenX, s32 screenY)
{
    s->x = screenX;
    s->y = screenY;
    UpdateSpriteAnimation(s);

    s->frameFlags |= SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1);
    s->frameFlags |= SPRITE_FLAG(Y_FLIP, 1);
    DisplaySprite(s);

    s->frameFlags &= ~(SPRITE_FLAG(18, 1) | SPRITE_FLAG(19, 1));
    s->frameFlags &= ~(SPRITE_FLAG(Y_FLIP, 1));
    DisplaySprite(s);
}

// NOTE: Almost a complete copy of Task_804AD0C, just without lines below sub_804CFA0() call.
// TODO: Maybe this was used as an inline?
void Task_804B370(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    SuperEggRobo *extraBoss = gExtraBossTaskData.boss;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(mgr->unk0.qUnk50) - cam->x;
    screenY = I(mgr->unk0.qUnk54) - cam->y;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if ((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240))) {
        TaskDestroy(gCurTask);
        return;
    }

    switch (ExtraBoss__CapsuleGetCaptureState(mgr, s, extraBoss, p)) {
        case CAPSULE_STATE__DESTROYED: {
            return;
        } break;

        case CAPSULE_STATE__MOVING: {
            ExtraBossCapsule_UpdateSprite(s, screenX, screenY);
        } break;

        case CAPSULE_STATE__CAPTURED: {
            ExtraBossCapsule_UpdateSprite(s, screenX, screenY);
            return;
        } break;
    }

    sub_804CFA0(&mgr->unk0);
}

// =============== MODULE

void Task_804B420(void)
{
    SomeTaskManager_7C *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->unk0.s;
    SuperEggRobo *extraBoss = gExtraBossTaskData.boss;
    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    s32 scrollX;

    // TODO: 2 * DISPLAY_<dim> does not feel correct!
    if ((s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) || ((mgr->unk0.qUnk50 < -Q(32)) || (mgr->unk0.qUnk50 > +Q(DISPLAY_WIDTH + 240 + 32)))) {
        TaskDestroy(gCurTask);
        return;
    }

    {
        s32 screenX, screenY;
        s32 res;
        s32 x;
        s32 scrollX = cam->x;
        const s32 scrollMaxX = (28 * 96);

        scrollX = (scrollX + gStageTime * 8);

        // 2688(0xA80) =
        //          3072         -          600
        // Moon Zone Pixel Width - (4 * Metatile_Width)

        if (scrollX - 72 >= scrollMaxX) {
            scrollX -= 72;
            scrollX = Mod(scrollX, scrollMaxX) + 72;
        }
        // _0804B4A2

        x = scrollX - cam->x;

        res = SA2_LABEL(sub_801F100)(I(mgr->unk0.qUnk54), I(mgr->unk0.qUnk50) + x, 1, +8, SA2_LABEL(sub_801EC3C));

        mgr->unk0.qUnk54 += Q(res);

        screenX = I(mgr->unk0.qUnk50) - cam->x;
        screenY = I(mgr->unk0.qUnk54) - cam->y;

        if ((p->SA2_LABEL(unk62) == 0) && (p->timerInvulnerability == 0) && !(extraBoss->flags58 & SER_FLAG__80)) {
            sub_800BFEC(s, I(mgr->unk0.qUnk50), I(mgr->unk0.qUnk54), p);
        }

        s->x = screenX;
        s->y = screenY;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        mgr->unk0.qUnk50 += mgr->unk0.qUnk58;
        mgr->unk0.qUnk54 += mgr->unk0.qUnk5A;
        mgr->unk0.qUnk58 += mgr->unk0.qUnk5C;
        mgr->unk0.qUnk5A += mgr->unk0.qUnk5E;
    }
}

// Create Laser
void sub_804B570(s32 qWorldX, s32 qWorldY)
{
    GfxInfo gfx;
    Task *t;
    SomeTaskManager_7C *mgr;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_LASER;
    gfx.tileInfo.variant = 0;
    gfx.vram = ALLOC_TILES(SA1_ANIM_BOSS_XTRA_LASER);

    t = CreateSomeTaskManager_7C_Task(&gfx, Task_804B420, TaskDestructor_SomeTaskManager_60_Common);
    mgr = TASK_DATA(t);

    mgr->unk0.qUnk50 = qWorldX;
    mgr->unk0.qUnk54 = qWorldY;

    mgr->unk0.s.oamFlags = SPRITE_OAM_ORDER(12);
    mgr->unk0.s.frameFlags = SPRITE_FLAG(PRIORITY, 1);
}
