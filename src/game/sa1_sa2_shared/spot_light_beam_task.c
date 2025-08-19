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

typedef struct {
    s16 unk0;
    s16 unk2;

} Struct_SP10;

// (68.53%) https://decomp.me/scratch/NchTb
// (66.79%) https://decomp.me/scratch/PmbTP
// (52.07%) https://decomp.me/scratch/I1Kkn (M2C generated)
NONMATCH("asm/non_matching/game/stage/Task_SpotlightBeamTask.inc", void Task_SpotlightBeamTask(void))

void Task_SpotlightBeamTask(void)
{
    TriParam1 sp8;
    Struct_SP10 sp10;
    Struct_SP10 sp14;
    s32 sp18;
    s16 temp_r0_2;
    s16 temp_r0_3;
    s16 temp_r0_4;
    s16 temp_r0_5;
    s16 temp_r0_6;
    s16 var_r0;
    s16 var_r1;
    s32 temp_r1;
    s32 temp_r1_2;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r1_5;
    s32 temp_r1_6;
    s32 var_r0_2;
    s32 var_r1_2;
    s32 var_r1_3;
    s32 var_r1_4;
    u16 temp_r0;
    u32 temp_r5;
    u32 temp_r5_2;

    StageUnkTask *beam = TASK_DATA(gCurTask);

    if (beam->unkB == 0) {
        return;
    }

    if (beam->unk0 <= 0x1FFU) {
        beam->unk4 = beam->unk4 - beam->unk2;
    } else {
        beam->unk4 = beam->unk2 + beam->unk4;
    }

    temp_r0_2 = (beam->unk0 + ((s32)((u16)beam->unk4 << 0x10) >> 0x18)) & 0x3FF;
    beam->unk0 = temp_r0_2;
    temp_r5 = (temp_r0_2 + beam->unkB) & 0x3FF;

    if (COS(temp_r5) == 0) {
        return;
    }
    sp18 = 0x3FF;
    temp_r0_3 = beam->unk6 - I(Q_DIV(SIN_24_8(temp_r5), COS_24_8(temp_r5)) * beam->unk8);
    sp10.unk0 = temp_r0_3;
    temp_r0_4 = temp_r0_3;
    if ((s32)temp_r0_4 <= 0) {
        sp10.unk0 = 0;
        if (temp_r5 > 0xFFU) {
            temp_r1_2 = (temp_r5 + 0xFFFFFD00) & 0x3FF;
            var_r0_2 = Q_DIV(SIN_24_8(temp_r1_2), COS_24_8(temp_r1_2));
            var_r1 = beam->unk6;
            goto block_16;
        }
        temp_r1_3 = (0x100 - temp_r5) & 0x3FF;
        sp10.unk2 = (s16)(beam->unk8 - I(Q_DIV(SIN_24_8(temp_r1_3), COS_24_8(temp_r1_3)) * beam->unk6));
    } else if ((s32)temp_r0_4 > (DISPLAY_WIDTH - 1)) {
        sp10.unk0 = DISPLAY_WIDTH;
        if (temp_r5 > 0xFFU) {
            var_r1_2 = temp_r5 + 0xFFFFFD00;
        } else {
            var_r1_2 = 0x100 - temp_r5;
        }
        temp_r1_4 = var_r1_2 & 0x3FF;
        var_r0_2 = Div(((s32)((u16)gSineTable[temp_r1_4] << 0x10) >> 0x16) << 8, (s32)((u16)gSineTable[temp_r1_4 + 0x100] << 0x10) >> 0x16);
        var_r1 = DISPLAY_WIDTH - beam->unk6;
    block_16:
        sp10.unk2 = (s16)((u16)beam->unk8 - ((s32)((s16)var_r0_2 * var_r1) >> 8));
    } else {
        sp10.unk2 = 0;
    }
    sp8.unk0 = sp10.unk0;
    sp8.unk1 = sp10.unk2;
    sp8.unk2 = (u8)((u8)beam->unk6
                    - ((s32)((beam->unk8 - DISPLAY_HEIGHT)
                             * (s16)Div(((s32)((u16)gSineTable[temp_r5] << 0x10) >> 0x16) << 8,
                                        (s32)((u16)gSineTable[temp_r5 + 0x100] << 0x10) >> 0x16))
                       >> 8));
    sp8.unk3 = DISPLAY_HEIGHT;
    temp_r5_2 = (0x400 - ((u16)beam->unk0 - beam->unkB)) & 0x3FF;
    temp_r0_5 = ((s32)(beam->unk8
                       * (s16)Div(((s32)((u16)gSineTable[temp_r5_2] << 0x10) >> 0x16) << 8,
                                  (s32)((u16)gSineTable[temp_r5_2 + 0x100] << 0x10) >> 0x16))
                 >> 8)
        + (u16)beam->unk6;
    sp14.unk0 = temp_r0_5;
    temp_r0_6 = temp_r0_5;
    if ((s32)temp_r0_6 <= 0) {
        sp14.unk0 = 0;
        if (temp_r5_2 > 0xFFU) {
            var_r1_3 = temp_r5_2 + 0xFFFFFD00;
        } else {
            var_r1_3 = 0x100 - temp_r5_2;
        }
        temp_r1_5 = var_r1_3 & 0x3FF;
        sp14.unk2 = (s16)((u16)beam->unk8
                          - ((s32)((s16)Div(((s32)((u16)gSineTable[temp_r1_5] << 0x10) >> 0x16) << 8,
                                            (s32)((u16)gSineTable[temp_r1_5 + 0x100] << 0x10) >> 0x16)
                                   * beam->unk6)
                             >> 8));
    } else if ((s32)temp_r0_6 > (DISPLAY_WIDTH - 1)) {
        sp14.unk0 = DISPLAY_WIDTH;
        if (temp_r5_2 > 0xFFU) {
            var_r1_4 = temp_r5_2 + 0xFFFFFD00;
        } else {
            var_r1_4 = 0x100 - temp_r5_2;
        }
        temp_r1_6 = var_r1_4 & 0x3FF;
        sp14.unk2 = (s16)((u16)beam->unk8
                          - ((s32)((s16)Div(((s32)((u16)gSineTable[temp_r1_6] << 0x10) >> 0x16) << 8,
                                            (s32)((u16)gSineTable[temp_r1_6 + 0x100] << 0x10) >> 0x16)
                                   * (DISPLAY_WIDTH - beam->unk6))
                             >> 8));
    } else {
        sp14.unk2 = 0;
    }
    sp8.unk4 = sp14.unk0;
    sp8.unk5 = sp14.unk2;
    sp8.unk6 = (u8)(((s32)((beam->unk8 - DISPLAY_HEIGHT)
                           * (s16)Div(((s32)((u16)gSineTable[temp_r5_2] << 0x10) >> 0x16) << 8,
                                      (s32)((u16)gSineTable[temp_r5_2 + 0x100] << 0x10) >> 0x16))
                     >> 8)
                    + (u8)beam->unk6);
    sp8.unk7 = DISPLAY_HEIGHT;
    if (beam->unk0 <= 0x1FFU) {
        if (sp14.unk2 > (DISPLAY_HEIGHT - 1)) {
            return;
        }
        if (sp10.unk2 > (DISPLAY_HEIGHT - 1)) {
            if (1 & beam->unkA) {
                gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp8.unk5, DISPLAY_HEIGHT);
            } else {
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp8.unk5, DISPLAY_HEIGHT);
            }
            sub_8006228(beam->unkA, sp8.unk4, sp8.unk5, sp8.unk6, sp8.unk7, 0);
            return;
        }
        if (1 & beam->unkA) {
            gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp8.unk5, DISPLAY_HEIGHT);
        } else {
            gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp8.unk5, DISPLAY_HEIGHT);
        }
        sub_800724C(beam->unkA, &sp8);
        return;
    }

    if (sp10.unk2 <= (DISPLAY_HEIGHT - 1)) {
        if (sp14.unk2 > (DISPLAY_HEIGHT - 1)) {
            if (beam->unkA & 0x1) {
                gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp8.unk1, DISPLAY_HEIGHT);
            } else {
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp8.unk1, DISPLAY_HEIGHT);
            }

            sub_80064A8(beam->unkA, sp8.unk0, sp8.unk1, sp8.unk2, (s32)sp8.unk3, 0);
        } else {
            if (beam->unkA & 0x1) {
                gWinRegs[WINREG_WIN1V] = WIN_RANGE(sp8.unk1, DISPLAY_HEIGHT);
            } else {
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(sp8.unk1, DISPLAY_HEIGHT);
            }

            sub_800724C(beam->unkA, &sp8);
        }
    }
}
END_NONMATCH

void TaskDestructor_SpotlightBeamTask(struct Task *t) { gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY; }