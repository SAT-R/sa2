#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "bg_triangles.h"
#include "task.h"
#include "trig.h"
#include "gba/syscall.h"
#include "game/sa1_sa2_shared/spot_light_beam_task.h"

void Task_SpotlightBeamTask(void);
void TaskDestructor_SpotlightBeamTask(struct Task *);

/* This task is related to spot lights in Ice Paradise. */

struct Task *CreateSpotlightBeamTask(void)
{
    struct Task *t = TaskCreate(Task_SpotlightBeamTask, sizeof(StageUnkTask), 0x2000, 0, TaskDestructor_SpotlightBeamTask);
    StageUnkTask *ut = TASK_DATA(t);

    ut->unk6 = 120;
    ut->unk8 = 200;
    ut->unk0 = 0;
    ut->unk2 = 64;
    ut->unk4 = 0x800;
    ut->unkA = 0;
    ut->unkB = 32;

    return t;
}

// (68.53%) https://decomp.me/scratch/NchTb
// (66.79%) https://decomp.me/scratch/PmbTP
NONMATCH("asm/non_matching/game/stage/Task_SpotlightBeamTask.inc", void Task_SpotlightBeamTask(void))
{
    u32 sinIndex;
    s32 someCos;

    StageUnkTask *ut = TASK_DATA(gCurTask);

    if (ut->unkB != 0) {
        // _08009984

        if (ut->unk0 < Q(2.0)) {
            ut->unk4 -= ut->unk2;
        } else {
            ut->unk4 += ut->unk2;
        }
        // _080099A6
        ut->unk0 = (ut->unk0 - (ut->unk4 >> 8)) & ONE_CYCLE;

        sinIndex = (ut->unk0 + ut->unkB) & ONE_CYCLE;
        someCos = COS_24_8(sinIndex);

        if (someCos != 0) {
            // _080099D6
            s16 divRes;
            int_vcount sp08[8];
            Vec2_16 sp10;
            s16 sp14[2];
            s32 sb;
            s32 r5;
            s32 temp;

            divRes = Div(Q(sinIndex) << 8, someCos);
            sp10.x = ut->unk6 - I(ut->unk8 * divRes);

            if (sp10.x <= 0) {
                sp10.x = 0;

                if (sinIndex >= 256) {
                    s32 newSinIndex = ((sinIndex - 256 - 512) & ONE_CYCLE);
                    s32 newSinValue = Q(SIN_24_8(newSinIndex));

                    divRes = Div(newSinValue, COS_24_8(newSinIndex));
                    sp10.y = I(ut->unk6 * divRes);
                } else {
                    // _08009A50
                    s32 newSinIndex = ((sinIndex - 256) & ONE_CYCLE);
                    s32 newSinValue = SIN_24_8(newSinIndex);

                    divRes = Div(newSinValue, COS_24_8(newSinIndex));
                    sp10.y = I(ut->unk6 * divRes);
                }
            } else if (sp10.x >= DISPLAY_WIDTH) {
                // _08009A86
                s32 r1;
                sp10.x = DISPLAY_WIDTH; // might be DISPLAY_WIDTH?
                if (sinIndex >= 256) {
                    r1 = sinIndex - Q(3.0);
                } else {
                    r1 = sinIndex + sp10.x;
                }

                (SIN_24_8(r1 & ONE_CYCLE));
            } else {
                // _08009ADE
                sp10.y = 0;
            }
            // _08009AE4
            sp08[0] = sp10.x;
            sb = 0;
            sp08[1] = sp10.y;

            // __08009AF4

            divRes = Div((SIN_24_8(sinIndex & ONE_CYCLE) << 8), COS_24_8(sinIndex & ONE_CYCLE));
            sp08[2] = Q((ut->unk8 * divRes) - DISPLAY_HEIGHT);
            sp08[3] = DISPLAY_HEIGHT;

            r5 = (ut->unk0 - ut->unkB);
            r5 &= ONE_CYCLE;

            divRes = Div(SIN_24_8(r5) << 8, COS_24_8(r5));
            sp14[0] = ((ut->unk8 * divRes) >> 8) + ut->unk6;

            if (sp14[0] <= 0) {
                sp14[0] = sb;

                if (r5 >= 256) {
                    sinIndex = r5 - Q(3.0);
                } else {
                    sinIndex = 256 - r5;
                }

                divRes = Div((SIN_24_8(sinIndex & ONE_CYCLE) << 8), COS_24_8(sinIndex & ONE_CYCLE));
                sp14[1] = ut->unk8 - ((ut->unk6 * divRes) >> 8);
            } else if (sp14[0] >= DISPLAY_WIDTH) {
                // _08009BD8
                sb = DISPLAY_WIDTH;
                sp14[0] = DISPLAY_WIDTH;

                if (r5 >= 256) {
                    sinIndex = r5 - Q(3.0);
                } else {
                    sinIndex = 256 - r5;
                }
                // _08009BF6
                divRes = Div((SIN_24_8(sinIndex & ONE_CYCLE) << 8), COS_24_8(sinIndex & ONE_CYCLE));
                sp14[1] = ut->unk8 - (((sb - ut->unk6) * divRes) >> 8);

            } else {
                // _08009C34
                sp14[1] = 0;
            }

            // _08009C3A
            sp08[4] = sp14[0];
            sp08[5] = sp14[1];

            // _08009C46
            divRes = Div(SIN_24_8(r5) << 8, COS_24_8(r5));
            sp08[6] = (((ut->unk8 - DISPLAY_HEIGHT) * divRes) >> 8) + ut->unk6;
            sp08[7] = DISPLAY_HEIGHT;

            if (ut->unk0 < Q(2.0)) {
                if (sp14[1] < DISPLAY_HEIGHT) {
                    // _08009C98
                    if ((u16)sp10.y >= DISPLAY_HEIGHT) {
                        if (ut->unkA & 0x1) {
                            gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp08[5], DISPLAY_HEIGHT);
                        } else {
                            // _08009CCC
                            gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp08[5], DISPLAY_HEIGHT);
                        }

                        sub_8006228(ut->unkA, sp08[4], sp08[5], sp08[6], sp08[7], 0);
                    } else {
                        // _08009CFC
                        if (ut->unkA & 0x1) {
                            gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp08[5], DISPLAY_HEIGHT);
                        } else {
                            // _08009D1C
                            gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp08[5], DISPLAY_HEIGHT);
                        }

                        sub_800724C(ut->unkA, (void *)&sp08);
                    }
                }
            } else if (sp10.y < DISPLAY_HEIGHT) {
                // __08009D44
                if (sp14[1] >= DISPLAY_HEIGHT) {
                    if (ut->unkA & 0x1) {
                        gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp08[1], DISPLAY_HEIGHT);
                    } else {
                        // _08009D70
                        gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp08[1], DISPLAY_HEIGHT);
                    }

                    sub_80064A8(ut->unkA, sp08[0], sp08[1], sp08[2], sp08[3], 0);
                } else {
                    // _08009DA0
                    if (ut->unkA & 0x1) {
                        gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp08[1], DISPLAY_HEIGHT);
                    } else {
                        // _08009D1C
                        gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp08[1], DISPLAY_HEIGHT);
                    }

                    sub_800724C(ut->unkA, (void *)&sp08);
                }
            }
        }
    }
}
END_NONMATCH

void TaskDestructor_SpotlightBeamTask(struct Task *t) { gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY; }