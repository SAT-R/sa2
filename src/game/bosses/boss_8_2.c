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
#include "game/player_callbacks.h" // UpdateHomingPosition
#include "game/cheese.h"
#include "game/stage/player.h"
#include "game/stage/results.h"
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

#define SWITCH_ARM_VARIANT(boss, arm, vNum)                                             \
    {                                                                                   \
        Sprite *s = &boss->bsArms[arm].s;                                               \
                                                                                        \
        if (arm != BOSS_8_ARM_LEFT) {                                                   \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;                     \
            s->variant = vNum;                                                          \
        } else {                                                                        \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;                      \
            s->variant = vNum;                                                          \
        }                                                                               \
        s->prevVariant = -1;                                                            \
    }

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
} BossSprite; /* size: 0x3C */

typedef struct {
    /*  0x00 */ Vec2_32 pos;
    /*  0x08 */ u8 livesCockpit;
    /*  0x09 */ u8 livesArms[BOSS_8_ARM_COUNT];
    /*  0x0B */ u8 unkB;
    /*  0x0C */ u8 unkC;
    /*  0x0E */ u16 unkE;
    /*  0x10 */ u16 unk10; // rotationHead ?
    /*  0x12 */ u8 unk12;
    /*  0x14 */ u32 unk14;
    /*  0x18 */ Vec2_32 qUnk18[BOSS_8_ARM_COUNT];
    /*  0x28 */ u16 rotation[BOSS_8_ARM_COUNT];
    /*  0x2C */ u16 rotation2[BOSS_8_ARM_COUNT];
    /*  0x30 */ u16 unk30[BOSS_8_ARM_COUNT];
    /*  0x34 */ s16 qUnk34[BOSS_8_ARM_COUNT][2];
    /*  0x3C */ u8 unk3C[BOSS_8_ARM_COUNT];
    /*  0x3E */ u8 unk3E[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 unk40[BOSS_8_ARM_COUNT];
    /*  0x42 */ u8 unk42[BOSS_8_ARM_COUNT];
    /*  0x44 */ void *tilesCloud;
    /*  0x48 */ ScreenFade fade;
    /*  0x54 */ BossSprite bsHead;
    /*  0x90 */ BossSprite bsArms[BOSS_8_ARM_COUNT];
    /* 0x108 */ Background body;
} SuperEggRoboZ; /* size: 0x148 */

typedef void (*EggRoboFn)(SuperEggRoboZ *boss, u8 arm);

void Task_SuperEggRoboZMain(void);
void TaskDestructor_SuperEggRoboZMain(struct Task *);

// TODO: Remove once boss_run.h has its own prototype for this function.
//       (or once it is integrated into this module, if it makes sense)
extern void sub_8049D20(void *vramTiles, SuperEggRoboZ *boss);
void Task_804AB24(void);
void Task_804AD68(void);
u8 sub_804B0EC(SuperEggRoboZ *boss, u8 arm);
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
void Task_ShowResultsAndDelete(void);
void sub_804CC98(SuperEggRoboZ *boss);
void sub_804AE40(SuperEggRoboZ *boss);
void Boss8_HitCockpit(SuperEggRoboZ *boss);
void sub_804C8F4(SuperEggRoboZ *boss);
void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1);
bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 param1);

//
// TODO: Remove!
// (defined in boss_8)
extern void Task_804A9D8(void);

extern const u16 gUnknown_080D8888[2][2];
extern const EggRoboFn gUnknown_080D8890[8];
extern const u16 sArmPalettes[2][16];
// TODO: Remove!

#if 0
// (87.37%) https://decomp.me/scratch/98Mjg
void sub_804C240(SuperEggRoboZ *boss, u8 arm)
{
    ExplosionPartsInfo info;
    s32 x, y;
    s32 index;

    if (boss->unk42[arm] != 0) {
        return;
    }

    y = I(boss->pos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1]);

    if (y > 300) {
        boss->unk42[arm] = 1;
        return;
    }

    boss->rotation[arm] = (boss->rotation[arm] + 800);
    boss->rotation[arm] &= ONE_CYCLE;
    boss->qUnk34[arm][1] += Q(0.125);
    boss->qUnk18[arm].x += boss->qUnk34[arm][0];
    boss->qUnk18[arm].y += boss->qUnk34[arm][1];

    if ((gStageTime & 0x3) == 0) {
        s32 rand;
        x = boss->pos.x;
        x += gUnknown_080D8888[arm][0];
        x += boss->qUnk18[arm].x;
        y = boss->pos.y;
        y += boss->qUnk18[arm].y;
        y += gUnknown_080D8888[arm][1];
        info.spawnX = I(x);
        info.spawnY = I(y);
        info.velocity = 0;
        info.rotation
            = sub_8004418(-(boss->qUnk34[arm][1] >> 3), -(boss->qUnk34[arm][0] >> 3));

        rand = PseudoRandom32();
        index = (info.rotation + (rand & 0x1F));
        info.rotation = (index - 0x10) & ONE_CYCLE;
        info.speed = SIN_24_8((gStageTime * 16) & ONE_CYCLE) + Q(3);
        info.vram = (OBJ_VRAM0 + 0x12980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;
        CreateBossParticleStatic(&info, &boss->unkC);
    }
}
#endif

void sub_804C3AC(SuperEggRoboZ *boss)
{
    Sprite *s;
    SpriteTransform *tf;
    u8 i;

    Vec2_32 sp00;
    Vec2_32 sp08;

    sp08.x = Q(PseudoRandBetween(-3, 4));
    sp08.y = Q(PseudoRandBetween(-3, 4));

    gBgScrollRegs[0][0] = gCamera.x - I(boss->pos.x + sp08.x);
    gBgScrollRegs[0][1] = gCamera.y - I(boss->pos.y + sp08.y);

    sp00.x = I(boss->pos.x + Q(190)) - gCamera.x;

    if ((sp00.x + 50) > 330u) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
    }

    s = &boss->bsHead.s;
    tf = &boss->bsHead.transform;

    sp00.x = boss->pos.x + sp08.x + Q(190);
    sp00.y = boss->pos.y + sp08.y + Q(40);

    s->x = I(sp00.x) - gCamera.x;
    s->y = I(sp00.y) - gCamera.y;

    s->unk10 = (gUnknown_030054B8++
                | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                   | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->width = Q(1);
    tf->height = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    sub_8004860(s, tf);
    DisplaySprite(s);

    for (i = 0; i < BOSS_8_ARM_COUNT; i++) {
        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->pos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->pos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->unk10 = (gUnknown_030054B8++
                    | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                       | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->width = Q(1);
        tf->height = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        sub_8004860(s, tf);
        DisplaySprite(s);
    }
}

void sub_804C5B8(SuperEggRoboZ *boss)
{
    Sprite *s;
    SpriteTransform *tf;
    u8 r3;
    u8 i;

    Vec2_32 sp00;
    Vec2_32 sp08;

    if (boss->unkB > 0) {
        if (boss->unkB < 32) {
            sp08.x = Q(PseudoRandBetween(-3, 4));
            sp08.y = Q(PseudoRandBetween(-3, 4));
        } else {
            sp08.x = Q(PseudoRandBetween(-7, 8));
            sp08.y = Q(PseudoRandBetween(-7, 8));
        }
    } else {
        sp08.x = 0;
        sp08.y = 0;
    }

    gBgScrollRegs[0][0] = gCamera.x - I(boss->pos.x + sp08.x);
    gBgScrollRegs[0][1] = gCamera.y - I(boss->pos.y + sp08.y);

    sp00.x = I(boss->pos.x + Q(190)) - gCamera.x;

    if ((sp00.x + 50) > 330u) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
    }

    s = &boss->bsHead.s;
    tf = &boss->bsHead.transform;

    if (boss->unkB < 32) {
        r3 = boss->unkB >> 3;
    } else {
        r3 = (64 - boss->unkB) >> 3;
    }

    sp00.x = boss->pos.x + sp08.x + Q(190);
    sp00.y = boss->pos.y + sp08.y + Q(40);

    s->x = I(sp00.x) - gCamera.x;
    s->y = I(sp00.y) - gCamera.y + r3;

    s->unk10 = (gUnknown_030054B8++
                | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                   | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->width = Q(1);
    tf->height = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    sub_8004860(s, tf);
    DisplaySprite(s);

    for (i = 0; i < BOSS_8_ARM_COUNT; i++) {
        if (boss->unk42[i] != 0) {
            continue;
        }

        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->pos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->pos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->unk10 = (gUnknown_030054B8++
                    | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                       | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->width = Q(1);
        tf->height = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        sub_8004860(s, tf);
        DisplaySprite(s);
    }
}

void sub_804C830(SuperEggRoboZ *boss)
{
    Sprite *s;
    Player *p;
    Vec2_32 headPos;
#ifdef BUG_FIX
    // Define headPos before the if, so that
    // Player_UpdateHomingPosition doesn't receive garbage values.
    headPos.x = I(boss->pos.x + Q(190));
    headPos.y = I(boss->pos.y + Q(40));
    if (boss->unkB == 0) {
#else
    if (boss->unkB == 0) {
        headPos.x = I(boss->pos.x + Q(190));
        headPos.y = I(boss->pos.y + Q(40));
#endif

        s = &boss->bsHead.s;
        p = &gPlayer;
        if (IsColliding_Cheese(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);
            return;
        } else if (sub_800C320(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);

            {
                s32 speed = p->speedAirX;
                if (speed > 0) {
                    p->speedAirX = -ABS(speed);
                }
            }
        } else if (sub_800CA20(s, headPos.x, headPos.y, 0, p) == TRUE) {
            s32 speed = p->speedAirX;
            if (speed > 0) {
                p->speedAirX = -speed;
            }
        }
    }
    // _0804C8CC

    if (gSelectedCharacter != CHARACTER_SONIC) {
        Player_UpdateHomingPosition(Q(headPos.x), Q(headPos.y));
    }
}

void Boss8_HitCockpit(SuperEggRoboZ *boss)
{
    Sprite *s = &boss->bsHead.s;

    if ((--boss->livesCockpit & 0xFF) & 0x1) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    if (boss->livesCockpit == 3) {
        gUnknown_030054A8.unk1 = 19;
    }

    if (boss->livesCockpit == 0) {
        INCREMENT_SCORE_C(1000);
    }

    boss->unkB = 64;

    s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
    s->variant = 2;
    s->prevVariant = -1;
}

bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 arm)
{
    if (boss->livesArms[arm] > 0) {
        if ((--boss->livesArms[arm] & 0xFF) & 0x1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->unk3E[arm] = 64;
    }

    return (boss->livesArms[arm] == 0) ? 1 : 0;
}

void sub_804CA08(SuperEggRoboZ *boss)
{
    if ((boss->unkB != 0) && (--boss->unkB == 0)) {
        Sprite *s = &boss->bsHead.s;
        if (boss->livesCockpit > 0) {
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
            s->variant = 0;
        } else {
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
            s->variant = 3;
        }
        s->prevVariant = -1;
    }
    // _0804CA4C

    if (boss->unk3E[0] > 0) {
        boss->unk3E[0]--;
    }

    if (boss->unk3E[1] > 0) {
        boss->unk3E[1]--;
    }
}

void sub_804CA70(SuperEggRoboZ *boss)
{
    s32 r6 = (gStageTime & 0x2) >> 1;
    u8 i;

    if (boss->unkB != 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[8 * 16 + i] = sArmPalettes[r6][i];
        }
    } else {
        // _0804CACC
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[8 * 16 + i] = sArmPalettes[0][i];
        }
    }
    // _0804CAFA

    if (boss->unk3E[0] > 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[9 * 16 + i] = sArmPalettes[r6][i];
        }
    } else {
        // _0804CB34
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[9 * 16 + i] = sArmPalettes[0][i];
        }
    }

    if (boss->unk3E[1] > 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[12 * 16 + i] = sArmPalettes[r6][i];
        }
    } else {
        // _0804CB34
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[12 * 16 + i] = sArmPalettes[0][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void Task_SuperEggRoboZMain(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    sub_804C5B8(boss);

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    if ((gPlayer.speedGroundX == 0) && (--boss->unk14 == 0)) {
        boss->unk14 = 300;
        gCurTask->main = Task_804A9D8;
        m4aSongNumStart(SE_260);
        gPlayer.unk64 = 0;
        gPlayer.transition = PLTRANS_PT1;
    }
}

void Task_ShowResultsAndDelete(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    boss->fade.brightness = Q(32);
    UpdateScreenFade(&boss->fade);

    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    m4aSongNumStop(SE_144);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0xFF);
    TaskDestroy(gCurTask);
}

void sub_804CC98(SuperEggRoboZ *boss)
{
    u32 unkB = boss->unkB;

    if (unkB != 0) {
        s32 sin = SIN(unkB * 8);
        s32 val = (sin >> 7);
        boss->unk10 = (val + (SIN_PERIOD / 2)) & ONE_CYCLE;
    } else {
        boss->unk10 = (SIN_PERIOD / 2);
    }
}

void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1)
{
    Vec2_32 pos = { boss->pos.x + Q(190), boss->pos.y + Q(40) };

    if ((I(gPlayer.y) < pos.x) && (gPlayer.y >= (pos.y - qP1))
        && (gPlayer.y <= (qP1 + pos.y))) {
        sub_800CBA4(&gPlayer);
    }
}

void TaskDestructor_SuperEggRoboZMain(struct Task *t)
{
    SuperEggRoboZ *boss = TASK_DATA(t);
    VramFree(boss->tilesCloud);

    VramFree(boss->bsArms[0].s.graphics.dest);
    VramFree(boss->bsArms[1].s.graphics.dest);
    VramFree(boss->bsHead.s.graphics.dest);

    gActiveBossTask = NULL;
}
