#include "global.h"
#include "global.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "sakit/collision.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks_1.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

/* TODO: Merge this file with boss_3.c */

#if 0
void sub_804063C(EggTotem *totem)
{
    Totem3C *t3c, *t3c2;
    s8 r2;
    u8 *bp;
    s8 r6;

    u32 rnd32;
    u8 rnd = PseudoRandom32();
    s8 v = Mod(rnd, 3);
    s8 r4 = gStageTime % 4u;

    t3c = &totem->unk3C[v];

    if(t3c->unk13 == 0) {
        m4aSongNumStart(SE_246);
        
        r2 = r4 * 3 + v;

        rnd32 = PseudoRandom32();

        if((rnd32 % 2u) != 0) {
            if((v == 0) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS-1].unk13 == 0)) {
                r2 = 12;
            } else if((v == 1) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS-1].unk13 == 0)) {
                // _080406D0
                r2 = 13;
            } else if((v == 0) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS-2].unk13 == 0)) {
                r2 = 14;
            }
        }
        // _080406F8

        bp = gUnknown_080D7ED4[r2];
        r6 = *bp++;

        while((--r6) >= 0) {
            s8 r7;
            EggTotemDataA *totemDataA;
            Totem3C *t3c2;
            r7 = *bp++;
            r4 = *bp++;
            totemDataA = gUnknown_080D7E78[r4];
            t3c2 = &totem->unk3C[r7];
            t3c2->unk13 = 1;
            t3c2->unk12 = r4;
            t3c2->unk10 = totemDataA->unk2;
            totemDataA++;

            t3c2->unkE = totemDataA->unk0;
            t3c2->qUnk8 = ((COS((u16)t3c2->unk10) * totemDataA->unk4) >> 14);
            t3c2->qUnkA = ((SIN((u16)t3c2->unk10) * totemDataA->unk4) >> 14);
            t3c2->qUnkC = Q(3);
        }
    }
}
#endif

// (97.68%) https://decomp.me/scratch/RX8Wf
NONMATCH("asm/non_matching/game/bosses/boss_3__sub_80407A4.inc",
         void sub_80407A4(EggTotem *totem))
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk13 != 0) {
            EggTotemDataA *ptr = gUnknown_080D7E78[t3c->unk12];
            ptr = &ptr[t3c->unk13];

            if (--t3c->unkE != 0) {
                // __middle
                s32 x, y;
                register u32 v0 asm("r0");
                register u32 v1 asm("r4");

                v0 = ptr->unk2;
                v1 = t3c->unk10;
                v0 = (v0 + v1) % 1024u;
                t3c->unk10 = v0;
                t3c->qUnk8 = ((COS(t3c->unk10) * ptr->unk4) >> 14);
                t3c->qUnkA = ((SIN(t3c->unk10) * ptr->unk4) >> 14);

                if (ptr->unk0 == 32 && ptr->unk2 == 0 && ptr->unk4 == 0) {
                    // t3c->qUnkC += 22.5°
                    t3c->qUnkC = (t3c->qUnkC + Q(0.0625)) % 1024u;
                }
            } else if ((++ptr)->unk0 == 0) {
                // _08040838
                t3c->unkE = 0;
                t3c->unk13 = 0;
                t3c->unk12 = 0;
                t3c->unk10 = 0;
                t3c->qUnk8 = 0;
                t3c->qUnkA = 0;
            } else {
                register u32 v0 asm("r0");
                register u32 v1 asm("r1");
                // _0804084C
                t3c->unk13++;
                t3c->unkE = ptr->unk0;

                v0 = ptr->unk2;
                v1 = t3c->unk10;
                v0 = (v0 + v1) % 1024u;
                t3c->unk10 = v0;
                t3c->qUnk8 = ((COS(t3c->unk10) * ptr->unk4) >> 14);
                t3c->qUnkA = ((SIN(t3c->unk10) * ptr->unk4) >> 14);
            }
            // _0804088C

            t3c->qWorldX += Q(5) + t3c->qUnk8;
            t3c->qWorldY += t3c->qUnkA - totem->unk30;
        }
    }
}
END_NONMATCH

void sub_80408C4(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk13 != 0) {
            EggTotemDataA *ptr = gUnknown_080D7E78[t3c->unk12];
            ptr = &ptr[t3c->unk13];

            if (ptr->unk0 == 60 && ptr->unk2 == 0 && ptr->unk4 == 0) {

                if ((u16)t3c->unkE == 60) {
                    if (gPlayer.y < t3c->qWorldY) {
                        t3c->unk15 = 1;
                    } else {
                        t3c->unk15 = 0;
                    }

                    t3c->unk16 |= 0x80;
                }

                if ((u16)t3c->unkE >= 48) {
                    if (t3c->unk15 != 0) {
                        t3c->unk17--;
                    } else {
                        t3c->unk17++;
                    }
                } else if ((u16)t3c->unkE == 30 && t3c->unk14 != 0) {
                    if (t3c->unk16 & 0x80) {
                        if ((PseudoRandom32() % 2u) == 0) {
                            s32 qx = t3c->qWorldX;
                            s32 qy = t3c->qWorldY + Q(t3c->unk17);
                            qy -= Q(t3c->unk15 * 3);
                            CreateEggTotemBullet(totem, qx, qy, BOSS5_BULLET_SPEED);
                        }
                    }
                    t3c->unk16 &= ~0x80;
                } else if ((u16)t3c->unkE < 18) {
                    if (t3c->unk17 != 0) {
                        if (t3c->unk15 != 0) {
                            t3c->unk17++;
                        } else {
                            t3c->unk17--;
                        }
                    }
                }

                if ((t3c->unk17 != 0) && (totem->unk36 == 0)
                    && (sub_8040B30(totem, i) << 24 != 0)) {
                    t3c->unk16 &= ~0x80;
                    totem->unk36 = 30;
                }
            }
        }
    }
}

void sub_8040A00(EggTotem *totem)
{
    u8 i;
    Sprite *s;
    Totem3C *t3c;

    if (totem->unk32 == 0) {
        return;
    }

    for (i = 0; i < EGGTOTEM_NUM_PLATFORMS; i++) {
        u32 coll;
        bool32 r7;

        s = &totem->spr188[i].s;
        t3c = &totem->unk3C[i];

        if (sub_800CA20(s, I(t3c->qWorldX), I(t3c->qWorldY), 1, &gPlayer) == FALSE
            && sub_800CA20(s, I(t3c->qWorldX), I(t3c->qWorldY), 2, &gPlayer) == FALSE) {
#ifndef NON_MATCHING
            register Player *p asm("r5");
#else
            Player *p;
#endif
            u32 moveState = (gPlayer.moveState & MOVESTATE_8);
            s32 x, y;
            r7 = FALSE;

            if (moveState && (gPlayer.unk3C == s)) {
                r7 = TRUE;
            }

            x = I(t3c->qWorldX);
            y = I(t3c->qWorldY);
            p = &gPlayer;
            coll = sub_800CCB8(s, x, y, p);

            if ((p->moveState & MOVESTATE_8) && (coll & COLL_FLAG_10000)) {
                p->x += t3c->qUnk8 + Q(5);
                p->y += Q(2) + (s16)Q(coll);

                if (!r7) {
                    p->speedAirX -= Q(5);
                }
            } else {
                // _08040AE0
                if (r7) {
                    gPlayer.moveState &= ~MOVESTATE_8;
                    gPlayer.unk3C = NULL;

                    if (!(gPlayer.moveState & MOVESTATE_100)) {
                        gPlayer.moveState &= ~MOVESTATE_100;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                    }
                }
            }
        }
    }
}

// (90.90%) https://decomp.me/scratch/Nakn1
NONMATCH("asm/non_matching/game/bosses/boss_3__sub_8040B30.inc",
         bool32 sub_8040B30(EggTotem *totem, u8 i))
{
    ExplosionPartsInfo info, info2;
    Sprite *s;
    Totem3C *t3c;

    register bool32 result asm("r6") = FALSE;

    s16 t3CX, t3CY;

    if (i > ARRAY_COUNT(totem->unk3C)) {
        return FALSE;
    }

    t3c = &totem->unk3C[i];
    if ((t3c->unk14 == 0) || (totem->unk32 == 0)) {
        return FALSE;
    }
    // _08040B66

    s = &totem->spr248[0];
    t3CX = I(t3c->qWorldX);
    t3CY = I(t3c->qWorldY) + t3c->unk17;

    if (sub_800C320(s, t3CX, t3CY, 0, &gPlayer) == TRUE) {
        if (--t3c->unk14 == 0) {
            info.spawnX = t3CX - gCamera.x;
            info.spawnY = t3CY - gCamera.y;
            info.velocity = 0;
            info.rotation = DEG_TO_SIN(337.5);
            info.speed = Q(6.0);
            info.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info.anim = SA2_ANIM_EXPLOSION;
            info.variant = 0;
            info.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info, &t3c->unk16);
            INCREMENT_SCORE(500);

            m4aSongNumStart(SE_144);
        } else {
            // _08040C5C
            m4aSongNumStart(SE_143);
        }

        result = TRUE;
    }
    // _08040C64

    Player_UpdateHomingPosition(Q(t3CX), Q(t3CY));

    if (IsColliding_Cheese(s, Q(t3CX), Q(t3CY), 0, &gPlayer) == TRUE) {
        if (--t3c->unk14 == 0) {
            // _middlestep
            info2.spawnX = t3CX - gCamera.x;
            info2.spawnY = t3CY - gCamera.y;
            info2.velocity = 0;
            info2.rotation = DEG_TO_SIN(337.5);
            info2.speed = Q(6.0);
            info2.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info2.anim = SA2_ANIM_EXPLOSION;
            info2.variant = 0;
            info2.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info2, &t3c->unk16);
            INCREMENT_SCORE(500);

            m4aSongNumStart(SE_144);

            Collision_AdjustPlayerSpeed(&gPlayer);
            gUnknown_03005498.t->unk15 = 0;
        } else {
            m4aSongNumStart(SE_143);
        }

        result = TRUE;
    }

    return result;
}
END_NONMATCH

void sub_8040D74(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 == 0) {
        // NOTE: This matches, but it'd be better if this worked without 'a'
        u32 a = totem->unk32;

        if (a > 0) {
            totem->unk32 = a - 1;

            if (((a - 1) % 2u) != 0) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            totem->unk35 = 30;

            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
                INCREMENT_SCORE(1000);
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 2;
            }

            s->prevVariant = -1;
        }

        if (!IS_FINAL_STAGE(gCurrentLevel) && (totem->unk32 == 4)) {
            gUnknown_030054A8.unk1 = 17;
        }
    }
}

void sub_8040E78(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 > 0) {
        totem->unk34 = 0;

        if (--totem->unk35 == 0) {
            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (totem->unk34 > 0) {
        if (--totem->unk34 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

void sub_8040F14(EggTotem *totem)
{
    u8 i;

    if (totem->unk35 != 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F14[1][i];
        }
    }

    if (totem->unk36 > 0) {
        totem->unk36--;

        for (i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F14[1][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void TaskDestructor_EggTotemMain(struct Task *t)
{
    u8 i;
    EggTotem *totem = TASK_DATA(t);

    VramFree(totem->sprC0.s.graphics.dest);

    for (i = 0; i < ARRAY_COUNT(totem->sprF8); i++) {
        VramFree(totem->sprF8[i].graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(totem->spr188); i++) {
        VramFree(totem->spr188[i].s.graphics.dest);
    }

    VramFree(totem->spr248[0].graphics.dest);
    VramFree(totem->spr248[1].graphics.dest);

    VramFree(totem->tilesEggman);

    VramFree(totem->spr2A8.graphics.dest);

    if (totem->spr308.graphics.dest != NULL) {
        VramFree(totem->spr308.graphics.dest);
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        VramFree(totem->spr2D8.graphics.dest);
    }

    gActiveBossTask = NULL;
}

void Task_EggTotemMain(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    totem->qWorldX += Q(3.8125);

    sub_803FB88(totem);
    sub_8041264(totem);
    sub_8040E78(totem);
    sub_803F698(totem);

    if (--totem->unkB4 == 0) {
        gCurTask->main = Task_803F3E8;
    }
}

void Task_8041138(void)
{
    bool8 res;
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        totem->qUnkB8 += Q(5);

        if (totem->qUnkBC > -Q(48)) {
            totem->qUnkBC -= Q(3);
        }
    }

    sub_803FC14(totem);
    sub_8040E78(totem);

    res = sub_803F878(totem);
    if (res != FALSE) {
        gCurTask->main = Task_80411CC;
    }
}

void Task_80411CC(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    sub_803FF44(totem);
    sub_8040E78(totem);
    sub_803F878(totem);

    if (totem->sprC0.s.x < -200) {
        sub_802EF68(-40, 150, 2);

        gCurTask->main = Task_CallTaskDestroyTotem;
    }
}

void Task_CallTaskDestroyTotem(void) { TaskDestroy(gCurTask); }

void Totem_UpdateWorldPos(EggTotem *totem)
{
    totem->qWorldX += totem->unk8;
    totem->qWorldY += totem->unkA;
}

void sub_8041264(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        if (totem->unk3C[i].unk13 == 0) {
            totem->unk3C[i].qWorldX = totem->qWorldX;
            totem->unk3C[i].qWorldY = totem->qWorldY + sTotemDiscYs[i];
        }
    }
}

void sub_80412B4(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    totem->unk34 = 30;

    if (totem->unk35 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void CreateEggTotemBullet(EggTotem *totem, s32 qX, s32 qY, u16 qSpeed)
{
    Sprite *s;
    u16 sinIndex;

    struct Task *t
        = TaskCreate(Task_EggTotemBullet, sizeof(EggTotemBullet), 0x6100, 0, NULL);

    EggTotemBullet *bullet = TASK_DATA(t);

    bullet->qScreenX = qX - Q(gCamera.x);
    bullet->qScreenY = qY - Q(gCamera.y);

    sinIndex = sub_8004418(I(gPlayer.y) - I(qY), I(gPlayer.x) - I(qX));
    bullet->qDX = ((COS(sinIndex) * qSpeed) >> 14);
    bullet->qDX += BOSS_VELOCITY_X;
    bullet->qDY = ((SIN(sinIndex) * qSpeed) >> 14);
    bullet->totem = totem;

    s = &bullet->s;

    s->x = I(qX);
    s->y = I(qY);
    s->graphics.dest = totem->tilesEggman;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_BULLET;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
}

void Task_EggTotemBullet(void)
{
    EggTotem *totem;
    EggTotemBullet *bullet = TASK_DATA(gCurTask);
    Sprite *s = &bullet->s;

    if (!PLAYER_IS_ALIVE) {
        bullet->qScreenX += bullet->qDX;
        bullet->qScreenX -= BOSS_VELOCITY_X;
        bullet->qScreenY += bullet->qDY;
    } else {
        bullet->qScreenX += (bullet->qDX + Q(gCamera.unk38));
        bullet->qScreenY += (bullet->qDY + Q(gCamera.unk3C));
    }

    s->x = I(bullet->qScreenX);
    s->y = I(bullet->qScreenY);

    // TODO: Make stage values global and make this a #define:
    // NOTE: 752 in the last condition =
    //       (Boss 3 Stage width in pixels [8 * 96 = 768]) - (bullet GFX width [16])
    if ((s->x < -32 && bullet->qDX < 0)
        || ((s->x > (DISPLAY_WIDTH + 32)) && bullet->qDX > 0)
        || (s->y < -32 && bullet->qDY < 0)
        || ((s->y > (DISPLAY_HEIGHT + 32)) && bullet->qDY > 0) || (s->x < -Q(2))
        || s->x > 752) {
        TaskDestroy(gCurTask);
        return;
    }

    if (bullet->totem->unk32 != 0) {
        bool32 res;

        res = sub_800CA20(s, I(bullet->qScreenX) + gCamera.x,
                          I(bullet->qScreenY) + gCamera.y, 0, &gPlayer);

        if (res == TRUE && bullet->totem->unk35 == 0) {
            Sprite *s2;
            totem = bullet->totem;
            s2 = &totem->spr2A8;
            totem->unk34 = 30;
            s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s2->variant = res;
            s2->prevVariant = -1;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}