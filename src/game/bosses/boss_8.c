#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "trig.h"
#include "bg_triangles.h"
#include "malloc_vram.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "lib/m4a.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/collision.h"
#include "sakit/player.h"
#include "game/bosses/common.h"
#include "game/stage/player.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/game_7.h"
#include "game/stage/screen_fade.h"
#include "game/stage/screen_shake.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

#define BOSS_8_ARM_LEFT  0
#define BOSS_8_ARM_RIGHT 1
#define BOSS_8_ARM_COUNT 2

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u8 filler30[0xC];
} BossSprite;

typedef struct {
    /*  0x00 */ s32 qUnk0;
    /*  0x04 */ s32 qUnk4;
    /*  0x08 */ u8 livesCockpit;
    /*  0x09 */ u8 livesArmLeft;
    /*  0x0A */ u8 livesArmRight;
    /*  0x0B */ u8 unkB;
    /*  0x0C */ u8 unkC;
    /*  0x0E */ u16 unkE;
    /*  0x10 */ u16 unk10;
    /*  0x12 */ u8 unk12;
    /*  0x14 */ u32 unk14;
    /*  0x28 */ s32 qUnk18[BOSS_8_ARM_COUNT][2];
    /*  0x28 */ u16 unk28[BOSS_8_ARM_COUNT];
    /*  0x2C */ s16 qUnk2C[BOSS_8_ARM_COUNT];
    /*  0x30 */ s16 unk30[BOSS_8_ARM_COUNT];
    /*  0x34 */ s16 qUnk34[BOSS_8_ARM_COUNT][2];
    /*  0x3C */ u8 unk3C[BOSS_8_ARM_COUNT];
    /*  0x3E */ u8 unk3E[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 unk40[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 unk42[BOSS_8_ARM_COUNT];
    /*  0x44 */ void *tilesUnk44;
    /*  0x48 */ ScreenFade fade;
    /*  0x54 */ BossSprite bsHead;
    /*  0x90 */ BossSprite bsArms[BOSS_8_ARM_COUNT];
    /* 0x108 */ Background body;
} SuperEggRoboZ; /* size: 0x148 */

typedef void (*EggRoboFn)(SuperEggRoboZ *, u8);

void Task_SuperEggRoboZMain(void);
void TaskDestructor_SuperEggRoboZMain(struct Task *);

// TODO: Remove once boss_run.h has its own prototype for this function.
//       (or once it is integrated into this module, if it makes sense)
extern void sub_8049D20(void *vramTiles, SuperEggRoboZ *boss);
void Task_804AB24(void);
void Task_804AD68(void);
void sub_804B43C(SuperEggRoboZ *boss, u8 p1);
void sub_804B594(SuperEggRoboZ *boss, u8 p1);
void sub_804B734(SuperEggRoboZ *boss, u8 p1);
void sub_804B984(SuperEggRoboZ *boss, u8 p1);
void sub_804BAC0(SuperEggRoboZ *boss, u8 p1);
void sub_804BC44(SuperEggRoboZ *boss, u8 p1);
void sub_804BE6C(SuperEggRoboZ *boss, u8 p1);
void sub_804C080(SuperEggRoboZ *boss);
void sub_804C240(SuperEggRoboZ *boss, u8 p1);
void sub_804C3AC(SuperEggRoboZ *boss);
void sub_804C5B8(SuperEggRoboZ *boss);
void sub_804C830(SuperEggRoboZ *boss);
void sub_804CA08(SuperEggRoboZ *boss);
void sub_804CA70(SuperEggRoboZ *boss);
void Task_804CC30(void);
void sub_804CC98(SuperEggRoboZ *boss);
void sub_804AE40(SuperEggRoboZ *boss);
void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1);

const s16 gUnknown_080D8888[2][2] = { { Q(188), Q(110) }, { Q(162), Q(110) } };
const EggRoboFn gUnknown_080D8890[8]
    = { sub_804B43C, sub_804B594, sub_804B734, sub_804B984,
        sub_804BC44, sub_804BE6C, sub_804BAC0, sub_804C240 };

void CreateSuperEggRoboZ(void)
{
    struct Task *t;
    SuperEggRoboZ *boss;
    ScreenFade *fade;
    Sprite *s;
    Background *body;
    u8 r4;

    gBgCntRegs[0] = (BGCNT_TXT512x512 | BGCNT_SCREENBASE(20) | BGCNT_CHARBASE(3)
                     | BGCNT_PRIORITY(2));
    gBgCntRegs[2] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(31) | BGCNT_CHARBASE(0)
                     | BGCNT_PRIORITY(1));
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x40;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;
    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    t = TaskCreate(Task_SuperEggRoboZMain, sizeof(SuperEggRoboZ), 0x4000, 0,
                   TaskDestructor_SuperEggRoboZMain);
    gActiveBossTask = t;
    boss = TASK_DATA(t);
    fade = &boss->fade;

    if (gDifficultyLevel != DIFFICULTY_NORMAL) {
        boss->livesCockpit = 6;
        boss->livesArmLeft = 4;
        boss->livesArmRight = 4;
    } else {
        boss->livesCockpit = 8;
        boss->livesArmLeft = 6;
        boss->livesArmRight = 6;
    }

    boss->qUnk0 = Q(42876);
    boss->qUnk4 = Q(370);
    boss->unkE = 360;
    boss->unk10 = 512;
    boss->unkB = 0;
    boss->unkC = 0;
    boss->unk14 = 30;
    boss->tilesUnk44 = VramMalloc(32);
    sub_8049D20(boss->tilesUnk44, boss);

    for (r4 = 0; r4 < BOSS_8_ARM_COUNT; r4++) {
        boss->unk28[r4] = Q(2.0);
        boss->qUnk2C[r4] = Q(2.0);
        boss->qUnk18[r4][0] = Q(0.0);
        boss->qUnk18[r4][1] = Q(0.0);
        boss->unk3C[r4] = 0;
        boss->unk30[r4] = r4 * 360 + 360;
        boss->unk3E[r4] = Q(0.0);
        boss->unk40[r4] = Q(0.0);
        boss->unk42[r4] = Q(0.0);
        boss->qUnk34[r4][0] = Q(0.0);
        boss->qUnk34[r4][1] = Q(0.0);

        s = &boss->bsArms[r4].s;
        s->x = 0;
        s->y = 0;

        if (r4 != 0) {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;
            s->variant = 0;
        } else {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;
            s->variant = 0;
        }

        s->unk1A = SPRITE_OAM_ORDER(27 + (r4 * 4));
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
    }

    fade->window = 0;
    fade->brightness = 0;
    fade->flags = SCREEN_FADE_FLAG_2;
    fade->speed = 0;
    fade->bldCnt = ((BLDCNT_TGT2_ALL & ~BLDCNT_TGT2_BG3) | BLDCNT_EFFECT_LIGHTEN
                    | BLDCNT_TGT1_ALL);
    fade->bldAlpha = 0;

    body = &boss->body;
    body->graphics.dest = (void *)BG_CHAR_ADDR(3);
    body->graphics.anim = 0;
    body->layoutVram = (void *)BG_SCREEN_ADDR(20);
    body->unk18 = 0;
    body->unk1A = 0;
    body->tilemapId = TM_REGULAR_FINAL_BOSS;
    body->unk1E = 0;
    body->unk20 = 0;
    body->unk22 = 0;
    body->unk24 = 0;
    body->targetTilesX = 30;
    body->targetTilesY = 20;
    body->paletteOffset = 0;
    body->flags = 0;
    DrawBackground(body);

    s = &boss->bsHead.s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(8 * 8);
    s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(31);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 3);
    gUnknown_030054A8.unk6 = 200;
    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;
}

void sub_804A9D8(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);

    if (boss->unk14 > 60) {
        boss->qUnk4 -= Q(1.0);

        if ((gStageTime % 32u) == 0) {
            m4aSongNumStart(SE_260);
        }

        if ((gStageTime % 8u) == 0) {
            CreateScreenShake(0x100, 0x10, 0x80, 0x14, (SCREENSHAKE_VERTICAL | 0x3));
        }

        if (Mod(boss->unk14, 30) == 0) {
            s8 v;
            gPlayer.moveState = 0;
            v = ((boss->unk14 - 60) / 30) - 2;

            if (v > 3) {
                v = 3;
            }

            if (v >= 0 && v <= 3) {
                gPlayer.unk64 = 70 - v;
                gPlayer.unk66 = -1;
            }
        }
    }

    boss->unkB = 1;
    sub_804C3AC(boss);

    gPlayer.moveState |= (MOVESTATE_IGNORE_INPUT | MOVESTATE_400000);

    if (--boss->unk14 == 0) {
        gStageFlags &= ~EXTRA_STATE__DISABLE_PAUSE_MENU;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT | MOVESTATE_400000);

        m4aSongNumStart(SE_260);

        gUnknown_030054A8.unk0 = 0;
        gUnknown_030054A8.unk1 = 18;
        gCamera.minX = 42820;
        boss->unkB = 0;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT);

        gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
        gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
        gCurTask->main = Task_804AB24;
    }
}

// (99.89%) https://decomp.me/scratch/kiah8
NONMATCH("asm/non_matching/game/bosses/boss_8__Task_804AB24.inc",
         void Task_804AB24(void))
{
    s32 speed;
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    ScreenFade *fade = &boss->fade;

    sub_804CC98(boss);
    sub_804CA08(boss);
    sub_804AE40(boss);

    gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_LEFT]](boss, BOSS_8_ARM_LEFT);
    gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_RIGHT]](boss, BOSS_8_ARM_RIGHT);

    sub_804C5B8(boss);
    sub_804C830(boss);
    sub_804CA70(boss);

    if ((I(gPlayer.y) > 184) && (I(gPlayer.x) >= 43034)) {
        sub_800CBA4(&gPlayer);

        speed = gPlayer.speedAirX;
        if (speed > 0) {
            gPlayer.speedAirX = -speed;
        }

        speed = gPlayer.speedGroundX;
        if (speed > 0) {
            gPlayer.speedGroundX = -speed;
        }
    }
    // _0804ABC0

    if (I(gPlayer.x) >= 43088) {
        sub_800CBA4(&gPlayer);

        speed = gPlayer.speedAirX;
        if (speed > 0) {
            gPlayer.speedAirX = -speed;
        }

        speed = gPlayer.speedGroundX;
        if (speed > 0) {
            gPlayer.speedGroundX = -speed;
        }
    }
    // _0804ABF2

    if (boss->livesCockpit == 0) {
        u8 i;
        // _0804ABF2

        gFlags &= ~FLAGS_4;
        gCurTask->main = Task_804AD68;
        boss->unk14 = 0xFF;

        Player_DisableInputAndBossTimer_FinalBoss();

        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.unk5C = 0;
        gPlayer.unk5E = 0;

        if (gPlayer.moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) {
            gPlayer.unk64 = 50;
            gPlayer.speedAirX = -Q(2);
            gPlayer.speedAirY = -Q(0);
            gPlayer.transition = PLTRANS_PT5;
        } else {
            // _0804AC68
            gPlayer.speedGroundX = Q(0);
            gPlayer.speedAirX = Q(0);
            gPlayer.speedAirY = Q(0);
        }
        // _0804AC6E

        fade->window = 0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = 16;
        fade->bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;

        for (i = 0; i < BOSS_8_ARM_COUNT; i++) {
            Sprite *sprArm;
            u16 anim;
            // _0804ACB2
            boss->qUnk18[i][0] += (COS(boss->unk28[i]) * 15) >> 6;
            boss->qUnk18[i][1] += (SIN(boss->unk28[i]) * 15) >> 6;

            boss->qUnk34[i][0] = -Q(1.5);
            boss->qUnk34[i][1] = -Q(3);

            boss->unk3C[i] = 7;
            boss->unk30[i] = 60;

            sprArm = &boss->bsArms[i].s;

            if (i != 0) {
                sprArm->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;
                sprArm->variant = 2;
            } else {
                sprArm->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;
                sprArm->variant = 2;
            }
            sprArm->prevVariant = -1;
        }
    }
}
END_NONMATCH

void Task_804AD68(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&boss->fade) == SCREEN_FADE_COMPLETE) {
        TasksDestroyInPriorityRange(0x5010, 0x5011);
        TasksDestroyInPriorityRange(0x5431, 0x5434);

        gStageFlags |= EXTRA_STATE__TURN_OFF_HUD;

        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_400000;
        gCurTask->main = Task_804CC30;
    } else {
        sub_804CC98(boss);
        sub_804CA08(boss);

        gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_LEFT]](boss, BOSS_8_ARM_LEFT);
        gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_RIGHT]](boss, BOSS_8_ARM_RIGHT);

        sub_804C5B8(boss);
        sub_804CA70(boss);
        sub_804C080(boss);
    }
}

#if 01
// (95.06%) https://decomp.me/scratch/of4k0
void sub_804AE40(SuperEggRoboZ *boss)
{
    int v;
    Sprite *s;

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        if (boss->unkE == 0) {
            gBldRegs.bldY = 0;
            boss->fade.brightness = 0;
            gFlags &= ~FLAGS_4;
        }
        boss->unkE = 2;
    }

    if (boss->unkE > 0) {
        if (--boss->unkE == 0) {
            boss->unk12 = 120;
        }
    } else {
        // _0804AEA0

        if (boss->unkB > 0) {
            if (boss->unk12 > 0) {
                boss->unk12 = 120;

                boss->fade.brightness = Q(32);
                UpdateScreenFade(&boss->fade);
            }
            // _0804AEC2

            gFlags &= ~FLAGS_4;
        } else {
            // _0804AED4
            if (--boss->unk12 == 0) {
                u32 livesCockpit;
                gFlags &= ~FLAGS_4;

                boss->fade.brightness = Q(32);
                UpdateScreenFade(&boss->fade);

                livesCockpit = boss->livesCockpit;
                v = 360;
                if (livesCockpit <= 4) {
                    v = 140;
                }
                boss->unkE = v;

                s = &boss->bsHead.s;
                s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
                s->variant = 0;
                s->prevVariant = -1;
            } else {
                // _0804AF34
                s32 r6;
                s32 r8;

                r8 = I(boss->qUnk0 + Q(190));
                r8 += ((COS(boss->unk10) * 11) >> 14);
                r8 -= gCamera.x;

                r6 = I(boss->qUnk4 + Q(40));
                r6 += ((SIN(boss->unk10) * 11) >> 14);
                r6 -= gCamera.y;

                if (boss->unk12 > 90) {
                    s32 val;
                    s32 rand;
                    s16 x, y;
                    InitHBlankBgOffsets(0);
                    x = r8;
                    y = r6;

                    rand = PseudoRandom32();
                    sub_80075D0(0, 0, 160, x, y,
                                I(SIN(((boss->unk12 - 90) * 8) % 256u)) + (rand % 8u));

                    boss->fade.brightness = (boss->unk12 - 90) * 273;
                    UpdateScreenFade(&boss->fade);
                } else {
                    s16 r4;

                    if (boss->unk12 == 90) {
                        // _0804B008+4
                        s = &boss->bsHead.s;
                        s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
                        s->variant = 1;
                        s->prevVariant = -1;
                        m4aSongNumStart(SE_261);
                    }
                    // _0804B02A

                    if (boss->unk12 < 70) {
                        s32 rand = (PseudoRandom32());
                        r4 = (boss->unk12 >> 1) + ((rand % 8u) + 8);

                        if (boss->unk12 > 60) {
                            sub_804CCD0(boss, Q(r4 - 10));
                        }
                    } else {
                        // _0804B074
                        s32 rand = PseudoRandom32();
                        r4 = ((116 - boss->unk12) >> 2) + ((rand % 8u) + 30);
                    }
                    // _0804B096

                    sub_802E784(boss->unk10, r4, 6, r8, r6 + 1, 32);

                    boss->fade.brightness = Q(32) - (boss->unk12 * 91);
                    UpdateScreenFade(&boss->fade);
                }
            }
        }
    }
}
#endif
