#include "global.h"
#include "core.h"
#include "task.h"
#include "trig.h"
#include "flags.h"
#include "malloc_vram.h"
#include "bg_triangles.h"
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/screen_shake.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

typedef struct {
    /* 0x00 */ struct Task *t;
    /* 0x04 */ CamCoord worldY;
    /* 0x04 */ u16 qUnk6;
    /* 0x04 */ u16 qUnk8;
    /* 0x04 */ u16 unkA;
    /* 0x0C */ u16 unkC;
} EggRocketScreenShake; /* 0x10 */

void Task_8028CE4(void);
void Task_8028F20(void);
void Task_8029070(void);
void Task_8029194(void);
void Task_80294A8(void);
void Task_80298C0(void);

void CreateEggRocketStageSeparation(CamCoord worldY)
{
    struct Task *t = TaskCreate(Task_8028CE4, sizeof(EggRocketScreenShake), 0x4000, 0, NULL);
    EggRocketScreenShake *shake = TASK_DATA(t);

    shake->unkA = 0x100;
    shake->worldY = worldY;
    shake->qUnk6 = 0;
    shake->qUnk8 = 0;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPlayer.heldInput = 0;
    gPlayer.qSpeedAirX = Q(0);
    gPlayer.qSpeedGround = Q(0);

    gCamera.maxY = worldY + DISPLAY_HEIGHT;
}

// (91.87%) https://decomp.me/scratch/pMtZY
NONMATCH("asm/non_matching/game/sa1/egg_rocket_trans__Task_8028CE4.inc", void Task_8028CE4(void))
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);
    u32 i;

    if (++gCamera.shiftY >= shake->worldY - gCamera.y + DISPLAY_CENTER_Y) {
        // _08028D1C
        void *tiles;
        struct Task *t;
        NutsAndBolts *nuts;
        CamCoord prevCamX = gCamera.x, prevCamY = gCamera.y - 32;

        for (i = 0; i < 3; i++) {
            s32 index = PseudoRandom32() % 8u;
            s32 index2;

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(prevCamX + (PseudoRandom32() & 0xFF));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x3000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(31);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = PseudoRandom32() & 0x1FF;
            nuts->qUnk3A = (SIN(index2) >> 6);

            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 8) >> 14;
        }

        for (i = 0; i < 3; i++) {
            s32 index = PseudoRandom32() % 8u;
            s32 index2;

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(prevCamX + (PseudoRandom32() % 256u));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x0000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(16);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = (PseudoRandom32() % 512u);
            nuts->qUnk3A = (SIN(index2) >> 5);
            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 9) >> 14;
        }

        shake->t = CreateScreenShake(0x800, 0x8, 0x10, 0xA, 0x80);

        m4aSongNumStart(SE_173);

        gCurTask->main = Task_8028F20;
    }
}
END_NONMATCH

void Task_8028F20(void)
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);
    s16 ip;
    s16 r7;

    shake->qUnk6 += Q(8. / 256.);
    shake->qUnk8 += Q(16. / 256.);

    ip = shake->worldY + I(shake->qUnk6) - gCamera.y;
    r7 = shake->worldY + I(shake->qUnk8) - gCamera.y;

    if ((shake->qUnk6 >= Q(4)) && ((gBossIndex == 2) || ((-(gStageTime * 2) & 0x1FF) == 0x102))) {
        gCurTask->main = Task_8029070;
        shake->unkC = 0;

        if (gBossIndex == 3) {
            gCamera.SA2_LABEL(unk50) |= 0x4000;
        }

        Task_8029070();
    } else if ((ip > 0) && (r7 < DISPLAY_HEIGHT)) {
        if (shake->worldY - gCamera.y > 0) {
            SA2_LABEL(sub_80078D4)(2, 0, shake->worldY - gCamera.y, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);

            SA2_LABEL(sub_8007858)(2, shake->worldY - gCamera.y, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
        } else {
            SA2_LABEL(sub_8007858)(2, 0, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
        }
        SA2_LABEL(sub_80078D4)(2, r7, DISPLAY_HEIGHT, gBgScrollRegs[2][0], gBgScrollRegs[2][1] - I(shake->qUnk8));
    } else {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    }
}

void Task_8029070(void)
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);
    s16 ip;
    s16 r7;

    shake->qUnk6 += Q(8. / 256.);
    shake->qUnk8 += Q(16. / 256.);

    ip = shake->worldY + I(shake->qUnk6) - gCamera.y;
    r7 = shake->worldY + I(shake->qUnk8) - gCamera.y;

    if (shake->unkC++ > 40) {
        gCurTask->main = Task_8029194;

        shake->t = CreateScreenShake(0x800, 0x8, 0x10, -1, 0xD0);

        shake->unkC = 0;

        Task_8029194();
    } else if ((ip > 0) && (r7 < DISPLAY_HEIGHT)) {
        if (shake->worldY - gCamera.y > 0) {
            SA2_LABEL(sub_80078D4)(2, 0, shake->worldY - gCamera.y, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);

            SA2_LABEL(sub_8007858)(2, shake->worldY - gCamera.y, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
        } else {
            SA2_LABEL(sub_8007858)(2, 0, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
        }
        SA2_LABEL(sub_80078D4)(2, r7, DISPLAY_HEIGHT, gBgScrollRegs[2][0], gBgScrollRegs[2][1] - I(shake->qUnk8));
    } else {
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    }
}

// (97.47%) https://decomp.me/scratch/CWQ2v
NONMATCH("asm/non_matching/game/sa1/egg_rocket_trans__Task_8029194.inc", void Task_8029194(void))
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);
    s16 ip;
    s16 r7;
    u32 i;
    s32 index;

    shake->qUnk8 += Q(2);
    shake->qUnk6 += Q(1);
    shake->unkA--;

    ip = shake->worldY + I(shake->qUnk6) - gCamera.y;
    r7 = shake->worldY + I(shake->qUnk8) - gCamera.y;

    if ((shake->unkC++ & 0xF) == 0) {
        void *tiles;
        struct Task *t;
        NutsAndBolts *nuts;
        CamCoord prevCamX = gCamera.x, prevCamY = gCamera.y - 32;

        for (i = 0; i < 3; i++) {
            s32 index2;
            index = PseudoRandBetween(0, 7);

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(PseudoRandBetween(prevCamX, prevCamX + 255));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x3000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(31);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = PseudoRandom32() & 0x1FF;
            nuts->qUnk3A = (SIN(index2) >> 6);

            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 8) >> 14;
        }

        for (i = 0; i < 3; i++) {
            s32 index2;
            index = PseudoRandBetween(0, 7);

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(PseudoRandBetween(prevCamX, prevCamX + 255));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x0000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(16);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = PseudoRandBetween(0, 511);
            nuts->qUnk3A = (SIN(index2) >> 5);
            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 9) >> 14;
        }

        m4aSongNumStart(SE_EXPLOSION);
    }

    if ((r7 > DISPLAY_HEIGHT)) {
        gCurTask->main = Task_80294A8;
        Task_80294A8();
    } else {
        if ((ip > 0) && (r7 < DISPLAY_HEIGHT)) {
            if (shake->worldY - gCamera.y > 0) {
                SA2_LABEL(sub_80078D4)(2, 0, shake->worldY - gCamera.y, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);

                SA2_LABEL(sub_8007858)(2, shake->worldY - gCamera.y, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
            } else {
                SA2_LABEL(sub_8007858)(2, 0, r7, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
            }
            SA2_LABEL(sub_80078D4)(2, r7, DISPLAY_HEIGHT, gBgScrollRegs[2][0], gBgScrollRegs[2][1] - I(shake->qUnk8));
        } else {
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        }
    }
}
END_NONMATCH

// Similar to Task_8029194
// (97.55%) https://decomp.me/scratch/o2r28
NONMATCH("asm/non_matching/game/sa1/egg_rocket_trans__Task_80294A8.inc", void Task_80294A8(void))
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);
    u32 i;
    s32 index;
    CamCoord prevCamX, prevCamY;

    gCamera.shiftY--;

    if ((shake->unkC++ & 0xF) == 0) {
        void *tiles;
        struct Task *t;
        NutsAndBolts *nuts;
        prevCamX = gCamera.x;
        prevCamY = gCamera.y - 32;

        for (i = 0; i < 3; i++) {
            s32 index2;
            index = PseudoRandBetween(0, 7);

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(prevCamX + (PseudoRandom32() & 0xFF));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x3000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(31);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = PseudoRandom32() & 0x1FF;
            nuts->qUnk3A = (SIN(index2) >> 6);

            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 8) >> 14;
        }

        for (i = 0; i < 3; i++) {
            s32 index = PseudoRandBetween(0, 7);
            s32 index2;

            t = CreateNutsAndBoltsTask(0x2000, VramMalloc(gUnknown_080BB434[index]), gUnknown_080BB41C[index], gUnknown_080BB42C[index],
                                       TaskDestructor_NutsAndBolts);
            nuts = TASK_DATA(t);

            nuts->qUnk30 = Q(PseudoRandBetween(prevCamX, prevCamX + 255));
            nuts->qUnk34 = Q(prevCamY);

            nuts->s.frameFlags = 0x0000;
            nuts->s.oamFlags = SPRITE_OAM_ORDER(16);
            nuts->qUnk3E = Q(40. / 256.);
            nuts->qUnk40 = Q(1);

            index2 = PseudoRandBetween(0, 511);
            nuts->qUnk3A = (SIN(index2) >> 5);
            nuts->qUnk3A = ABS(nuts->qUnk3A);

            nuts->qUnk38 = -(COS(index2) << 9) >> 14;
        }

        m4aSongNumStart(SE_EXPLOSION);
    }

    if (gCamera.y <= shake->worldY - DISPLAY_HEIGHT) {
        gCamera.shiftY = 0;

        if (gBossIndex > 1) {
            gCamera.maxY = (58 * 96);
            gStageFlags &= ~FLAGS_UPDATE_BACKGROUND_PALETTES;

            if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
                gStageFlags |= FLAGS_EXECUTE_HBLANK_COPY;
                gCourseTime = TIME(5, 0);
            }
        }

        if (gBossIndex > 2) {
            gCamera.maxY = (34 * 96);

            gStageFlags &= ~1;

            if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
                gStageFlags |= FLAGS_EXECUTE_HBLANK_COPY;
                gCourseTime = TIME(5, 0);
            }
        }

        gPlayer.moveState &= ~0x200000;
        gPlayer.heldInput = 0;

        TaskDestroy(gCurTask);
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

        gCamera.SA2_LABEL(unk50) &= ~0x8000;
    } else if ((shake->worldY - gCamera.y) > 0) {
        SA2_LABEL(sub_80078D4)(2, 0, shake->worldY - gCamera.y, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
        SA2_LABEL(sub_8007858)(2, shake->worldY - gCamera.y, DISPLAY_HEIGHT, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
    } else {
        SA2_LABEL(sub_8007858)(2, 0, DISPLAY_HEIGHT, gBgScrollRegs[2][0], (DISPLAY_HEIGHT + 80));
    }
}
END_NONMATCH

void Task_80297E8(void)
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);

    if ((shake->unkC & 0xF) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (--shake->unkC == 0) {
        if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
            gStageFlags |= STAGE_FLAG__TIMER_REVERSED;
            gCourseTime = TIME(5, 0);
        }

        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput = 0;

        TaskDestroy(gCurTask);
        return;
    }
}

void CreateEggRocketLaunchScreenShakeEffect()
{
    struct Task *t = TaskCreate(Task_80298C0, sizeof(EggRocketScreenShake), 0x4000, 0, NULL);
    EggRocketScreenShake *shake = TASK_DATA(t);

    shake->unkC = TIME(0, 1);

    CreateScreenShake(0x800, 8, 16, 10, SCREENSHAKE_VERTICAL);

    gCamera.minX = 0x422;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPlayer.heldInput = 0;
}

void Task_80298C0()
{
    EggRocketScreenShake *shake = TASK_DATA(gCurTask);

    if (--shake->unkC == 0) {
        shake->unkC = TIME(0, 5);
        CreateScreenShake(0x800, 8, 16, 300, (SCREENSHAKE_VERTICAL | SCREENSHAKE_RANDOM_VALUE));
        gCurTask->main = Task_80297E8;
    }
}
