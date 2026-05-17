#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "bg_triangles.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/enemies/bosses_shared.h" // CreatePreBossCameraPan
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/save.h"
#include "game/shared/stage/dust_effect_braking.h"
#include "game/sa1/stage/extra_stage.h"
#include "game/shared/stage/player.h" // sub_804A8A8
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/stage/enemies/boss_xtra_super_egg_robo.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"

/* Extra Zone Boss - Super Egg Robot */

void sub_804B2BC(s32 a, s32 b);
bool32 sub_80520B8(SuperEggRobo *boss);
void sub_80523D4(SuperEggRobo *boss);
void sub_80523F8(SuperEggRobo *boss);
void sub_8052424(SuperEggRobo *boss);
void sub_8052468(SuperEggRobo *boss);

ExtraBossTaskData gExtraBossTaskData = { 0 };

const u8 gUnknown_084AE560[] = { 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 };

SomeTaskManager_7C *sub_8052474(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3);
SomeTaskManager_7C *sub_80524F0(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3);
SomeTaskManager_7C *sub_8052578(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3);
SomeTaskManager_7C *sub_80525E0(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3);
SomeTaskManager_7C *sub_805265C(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3);
SomeTaskManager_7C *sub_8052838(SuperEggRobo *boss, s32 param1, s32 param2, s32 param3);

SomeTaskManager_7C *sub_80526C4(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4);
SomeTaskManager_7C *sub_8052724(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4);
SomeTaskManager_7C *sub_8052780(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4);
SomeTaskManager_7C *sub_80527DC(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4);

void sub_804B570(s32, s32);
bool32 sub_8052150(s32 arg0, s32 arg1, u16 arg2, SomeTaskManager_7C *arg3);

void Task_SuperEggRobotInit()
{
    SuperEggRobo *boss = TASK_DATA(gCurTask);

    if (!(boss->flags58 & SER_FLAG__400000)) {
        if (boss->flags58 & SER_FLAG__2) {
            sub_8052424(boss);
            sub_8052468(boss);
            sub_80523F8(boss);
        } else {
            sub_80523D4(boss);
            sub_8052424(boss);
        }
    }

    switch (boss->unk6E) {
        case 2: {
            if (!(boss->flags58 & SER_FLAG__2)) {
                boss->unk6F++;
            }
        } break;

        case 3: {
            if (boss->qUnk54++ >= 60) {
                boss->unk6F++;
            }
        } break;

        case 9: {
            if (boss->qUnk54++ >= 300) {
                boss->qUnk56 = 0;
                boss->unk6F++;
            }
        } break;

        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 10:
        case 11: {
            if (boss->unk5C != 0) {
                boss->unk6F++;
            }
        } break;

        case 12: {
            if (boss->unk5C == 0) {

            } else {
                if (++boss->qUnk56 < 4) {
                    boss->unk6F = 0xB;
                } else {
                    boss->unk6F = 3;
                }
            }
        } break;

        case 0: {
            if (boss->qUnk44 < Q(416)) {
                boss->qUnk48 = -Q(128);
                boss->qUnk4E = 0;
                boss->qUnk4C = Q(4);
            } else {
                boss->qUnk50 = -0x10;
                boss->unk6F = 1;
            }
        } break;

        case 1: {
            if (boss->qUnk44 < Q(416)) {
                boss->qUnk50 = 0;
                boss->qUnk4C = 0;
                boss->qUnk44 = Q(416);
                boss->unk6F = 2;
            } else {
                boss->qUnk4C = MAX(-Q(2), boss->qUnk4C);
            }
        } break;

        case 13: {
            if (boss->unk5C != 0) {
                boss->unk6F = 0xE;
            }
        } break;

        case 14: {
            if (!(boss->flags58 & SER_FLAG__2)) {
                boss->qUnk50 = -0x10;
                if (boss->qUnk4C < -Q(6)) {
                    boss->qUnk4C = -Q(6);
                    boss->qUnk50 = 0;
                }
                if (boss->qUnk44 <= -Q(120)) {
                    boss->qUnk4C = 0;
                }
            }
        } break;

        default: {
            boss->qUnk4C = 0;
            boss->qUnk50 = 0;
        } break;
    }
    if (boss->flags58 & SER_FLAG__80) {
        s32 fade = boss->qUnk54 - 120;
        if (fade < 0) {
            fade = 0;
        }
        fade >>= 2;
        if (fade > 0x10) {
            fade = 0x10;
        }

        if (boss->unk69 == 0) {
            gDispCnt &= 0x7FFF;
            gWinRegs[WINREG_WINOUT] = 0x3F3F;
            gBldRegs.bldCnt = 0xBF;
            gBldRegs.bldY = fade;
        }

        if (fade == 0x10) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
            CreateExtraStageResults();
            return;
        }
        sub_80520B8(boss);

        if (++boss->qUnk54 < 0) {
            boss->qUnk54--;
        }
    } else if (boss->unk6E > 1) {
        if (--boss->unk6C <= 0) {
            boss->unk6C = 240;
            sub_804B2BC(Q(boss->unk60) + boss->qUnk44 + -Q(21), Q(boss->qUnk64) + boss->qUnk48 + -Q(10));
        }
    }

    if (boss->unk6E != boss->unk6F) {
        s32 i;
        for (i = 0; i < (s32)ARRAY_COUNT(gExtraBossTaskData.parts); i++) {
            SomeTaskManager_7C *parts = gExtraBossTaskData.parts[i];
            parts->unk0.unk2 = 0;
            parts->unk0.unk4 = 0;
        }

        boss->unk5C = 0;
        boss->qUnk54 = 0;
        boss->unk6E = boss->unk6F;
    }
}

// (90.35%) https://decomp.me/scratch/a1vhA
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8050194.inc", s32 sub_8050194(SuperEggRobo *boss))
{
    SuperEggRobo *sp4;
    u32 sp8;
    u32 spC;
    SomeTaskManager_7C *temp_r8;
    SomeTaskManager_7C *temp_r8_2;
    s32 temp_r0;
    s32 temp_r0_2;
    s32 temp_r1;
    s32 temp_r1_3;
    s32 temp_r1_6;
    s32 temp_r2_3;
    s32 temp_r3;
    s32 temp_r4;
    s32 temp_r4_2;
    s32 temp_r5_3;
    s32 temp_r6;
    s32 temp_r7;
    s32 temp_sb;
    s32 temp_sb_2;
    s32 var_r0;
    s32 var_r0_2;
    s32 var_r0_3;
    s32 var_r1;
    s32 var_r3;
    s32 var_r4;
    s32 var_r6;
    s32 var_r7;
    s32 var_r7_2;
    s32 var_sl;
    u16 temp_r5;
    u32 temp_r5_2;
    s16 temp_r1_2;
    s16 theta;
    s16 temp_r1_5;
    u32 temp_r2;
    u32 temp_r2_2;
    s32 sinV;

    BrakeDustEffect *brakeDust;

    sp4 = boss;
    temp_r8 = gExtraBossTaskData.parts[0xE];
    temp_r5 = gExtraBossTaskData.parts[0xE]->unk70;
    sp8 = gExtraBossTaskData.parts[0xD]->unk70;
    var_r7 = I(temp_r8->unk0.qUnk50) + (gStageTime * 8);
    temp_r1 = var_r7 - 72;
    if (temp_r1 >= 0xA80) {
        var_r7 = temp_r1;
        var_r7 = Mod(var_r7, 0xA80) + 72;
    }
    temp_r1_2 = temp_r5 >> 6;
    var_r3 = I(temp_r8->unk0.qUnk54);
    sinV = (SIN_24_8(temp_r1_2) << 0xC);
    temp_r6 = var_r3 + ((((COS_24_8(temp_r1_2) * Q(9)) - (sinV)) >> 0x10) + 6);
    temp_sb = SA2_LABEL(sub_801F100)(temp_r6, var_r7 + 0x10, 1, 8, SA2_LABEL(sub_801EC3C));
    temp_r4 = I(temp_r8->unk0.qUnk54);
    temp_r2 = sp8 >> 6;
    temp_r4 = (temp_r4 + (((((SIN_24_8(temp_r2)) * Q(21)) + (COS_24_8(temp_r2) << 0xB)) >> 0x10))) + 6;
    var_sl = SA2_LABEL(sub_801F100)(temp_r4, var_r7 + 21, 1, 8, SA2_LABEL(sub_801EC3C));
    if (var_sl > temp_sb) {
        var_sl = temp_sb;
    }
    if ((var_sl <= 0) && (sp4->unk6E != 1) && (gStageTime & 1)) {
        if (!(PseudoRandom32() & 0x30000)) {
            s32 var = I(temp_r8->unk0.qUnk50);
            var_r0_2 = temp_r4;
            if (var_r0_2 < temp_r6) {
                var_r0_2 = temp_r6;
            }
            brakeDust = TASK_DATA(CreateBrakingDustEffect(var, var_r0_2 - 2));
            brakeDust->unk4 = -4;
        }
    }

    temp_r8_2 = gExtraBossTaskData.parts[0x11];
    temp_r5_2 = gExtraBossTaskData.parts[0x11]->unk70;
    spC = gExtraBossTaskData.parts[0x10]->unk70;

    var_r7_2 = (temp_r8_2->unk0.qUnk50 >> 8);
    var_r7_2 += (gStageTime * 8);
    if (var_r7_2 - 72 >= 0xA80) {
        var_r7_2 = Mod(var_r7_2 - 72, 0xA80) + 72;
    }
    var_r3 = I(temp_r8_2->unk0.qUnk54);
    sinV = ((SIN_24_8(temp_r5_2 >> 6)) << 0xC);
    temp_r5_3 = var_r3 + (((((COS_24_8(temp_r5_2 >> 6)) * Q(9)) - sinV) >> 0x10) + 6);
    temp_sb_2 = SA2_LABEL(sub_801F100)(temp_r5_3, var_r7_2 + 16, 1, 8, SA2_LABEL(sub_801EC3C));
    temp_r4_2 = I(temp_r8_2->unk0.qUnk54);
    temp_r4_2 += ((((SIN_24_8(spC >> 6)) * Q(21)) + ((COS_24_8(spC >> 6)) << 0xB)) >> 0x10) + 6;
    var_r6 = SA2_LABEL(sub_801F100)(temp_r4_2, var_r7_2 + 21, 1, 8, SA2_LABEL(sub_801EC3C));
    if (var_r6 > temp_sb_2) {
        var_r6 = temp_sb_2;
    }
    if ((var_r6 <= 0) && (sp4->unk6E != 1) && !(gStageTime & 1)) {
        if (!(PseudoRandom32() & 0x30000)) {
            s32 var = I(temp_r8_2->unk0.qUnk50);
            var_r0_3 = temp_r4_2;
            if (var_r0_3 < temp_r5_3) {
                var_r0_3 = temp_r5_3;
            }
            brakeDust = TASK_DATA(CreateBrakingDustEffect(var, var_r0_3 - 2));
            brakeDust->unk4 = -4;
        }
    }

    theta = (gExtraBossTaskData.parts[0]->unk70 >> 6);
    temp_r2_3 = COS_24_8(theta);
    temp_r3 = SIN_24_8(theta);
    temp_r7 = I(gExtraBossTaskData.parts[0]->unk0.qUnk54) + (((temp_r3 * Q(27)) - (temp_r2_3 * Q(22))) >> 0x10);
    var_r4 = I(gExtraBossTaskData.parts[0]->unk0.qUnk50) + (((temp_r2_3 * Q(27)) + (temp_r3 * Q(22))) >> 0x10) + (gStageTime * 8);

    if (var_r4 - 72 >= 0xA80) {
        var_r4 = Mod(var_r4 - 72, 0xA80) + 72;
    }

    var_r0 = SA2_LABEL(sub_801F100)(temp_r7, var_r4, 1, 8, SA2_LABEL(sub_801EC3C));
    var_r1 = var_r6;
    if (var_r1 > var_sl) {
        var_r1 = var_sl;
    }
    if (var_r0 > var_r1) {
        var_r0 = var_r1;
    }
    return var_r0;
}
END_NONMATCH

// (92.84%) https://decomp.me/scratch/fY0bw
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_80504DC.inc", void sub_80504DC(SuperEggRobo *boss, MapEntity *me))
{
    GfxInfo gfx;
    GfxInfo gfx2;
    SomeTaskManager_7C *strc, *prevStrc;
    s32 index;

    ExtraBossTaskData *extraBoss;
    SomeTaskManager_7C *parts;
    Sprite *s;

    boss->unk60 = 0;
    boss->qUnk64 = TO_WORLD_POS(me->y, boss->base.regionY);
    boss->qUnk44 = -0x10000;
    boss->qUnk48 = -0x3600;
    boss->qUnk4C = 0;
    boss->qUnk4E = 0;
    boss->qUnk50 = 0;
    boss->qUnk52 = 0;
    boss->flags58 = 0x400002;
    boss->unk5C = 0;
    boss->qUnk54 = 0;
    boss->qUnk56 = 0;
    boss->unk6C = 240;
    boss->unk68 = 8;
    boss->unk68 -= (LOADED_SAVE->difficultyLevel * 2);
    boss->unk69 = 0;
    boss->unk6A = 0x24;
    boss->unk6B = 0x36;
    boss->unk6E = 0;
    boss->unk6F = 0;

    extraBoss = &gExtraBossTaskData;
    index = 0;
    prevStrc = sub_8052838(boss, 0, 0, 21);
    extraBoss->parts[index] = prevStrc;
    prevStrc->unk0.unk0 = index;
    index = 1;
    prevStrc = sub_8052474(prevStrc, 0x400, 0xFFFFE400, 0x16);
    extraBoss->parts[index] = prevStrc;
    prevStrc->unk0.unk0 = index;
    index = 2;

    prevStrc = sub_80524F0(extraBoss->parts[0], 0xB00, 0xFFFFE900, 0xF);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);
    index = 3;
    prevStrc = sub_8052578(extraBoss->parts[index - 1], 0, 0x1400, 0x10);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);
    index = 4;
    prevStrc = sub_80525E0(extraBoss->parts[index - 1], 0, 0x1200, 0xF);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);
    index = 5;
    prevStrc = sub_8052578(extraBoss->parts[index - 1], 0, 0x1200, 0x10);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);
    index = 6;
    prevStrc = sub_805265C(extraBoss->parts[index - 1], 0, 0x800, 0xE);
    prevStrc = prevStrc;
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);

    index = 7;
    prevStrc = sub_80524F0(extraBoss->parts[0], 0xFFFFFB00, 0xFFFFE700, 0x1B);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    index = 8;
    prevStrc = sub_8052578(prevStrc, 0, 0x1400, 0x1C);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    index = 9;
    prevStrc = sub_80525E0(prevStrc, 0, 0x1200, 0x1B);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    index = 10;
    prevStrc = sub_8052578(prevStrc, 0, 0x1200, 0x1C);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;
    index = 11;
    prevStrc = sub_805265C(prevStrc, 0, 0x800, 0x1A);
    extraBoss->parts[index] = prevStrc;
    extraBoss->parts[index]->unk0.unk0 = index;

    gfx.tileInfo.anim = 0x29B;
    gfx.tileInfo.variant = 0;
    gfx.vram = VramMalloc(0x10U);
    index = 12;
    strc = sub_80526C4(extraBoss->parts[0], 0x200, 0x500, &gfx, 0x14);
    extraBoss->parts[index] = strc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk76 = 0xE000;
    extraBoss->parts[index]->unk72 = 0x100;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);

    {
        SomeTaskManager_7C *strcInner;
        gfx.tileInfo.anim = 0x29D;
        gfx.tileInfo.variant = 0;
        gfx.vram = VramMalloc(9U);
        strcInner = sub_8052724(strc, 0, 0, &gfx, 0x13);
        strcInner->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        SPRITE_FLAG_SET_VALUE(&strcInner->unk0.s, PRIORITY, 1);
    }

    gfx.tileInfo.anim = 0x29C;
    gfx.tileInfo.variant = 0;
    gfx.vram = VramMalloc(64);
    index = 13;
    strc = sub_8052780(strc, 0xFFFFF700, 0xC00, &gfx, 0x12);
    extraBoss->parts[index] = strc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);

    gfx.tileInfo.anim = 0x29B;
    gfx.tileInfo.variant = 2;
    gfx.vram = VramMalloc(0x10U);
    index = 14;
    extraBoss->parts[index] = sub_80527DC(strc, 0x300, 0x1B00, &gfx, 0x11);
    strc = extraBoss->parts[index];
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk0.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    SPRITE_FLAG_SET_VALUE(&extraBoss->parts[index]->unk0.s, PRIORITY, 1);

    gfx2.tileInfo.anim = 0x29B;
    gfx2.tileInfo.variant = 1;
    gfx2.vram = VramMalloc(0x10U);
    index = 15;
    strc = sub_80526C4(extraBoss->parts[0], 0xFFFFFA00, 0x500, &gfx2, 0x17);
    extraBoss->parts[index] = strc;
    extraBoss->parts[index]->unk0.unk0 = index;
    extraBoss->parts[index]->unk76 = 0x2000;
    extraBoss->parts[index]->unk72 = -0x100;

    {
        SomeTaskManager_7C *strcInner;
        gfx2.tileInfo.anim = 0x29C;
        gfx2.tileInfo.variant = 1;
        gfx2.vram = VramMalloc(0x40U);
        index = 16;
        strc = sub_8052780(strc, 0xFFFFF700, 0xB00, &gfx2, 0x16);
        extraBoss->parts[index] = strc;
        extraBoss->parts[index]->unk0.unk0 = index;
    }

    gfx2.tileInfo.anim = 0x29B;
    gfx2.tileInfo.variant = 3;
    gfx2.vram = VramMalloc(0x10U);
    index = 17;
    extraBoss->parts[index] = sub_80527DC(strc, 0x300, 0x1B00, &gfx2, 0x18);
    extraBoss->parts[index]->unk0.unk0 = index;

    if (gInput == (B_BUTTON | START_BUTTON | DPAD_VERTICAL | DPAD_SIDEWAYS)) {
        boss->flags58 |= 0x80000000;
    }
}
END_NONMATCH

void sub_8050888()
{
    Sprite *s;
    SuperEggRobo *boss;
    Player *p;
    Camera *cam;
    s32 screenY;
    s32 screenX;
    u16 *var_r0;
    u16 var_r1;
    s16 var_r1_2;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);

    boss = gExtraBossTaskData.boss;
    s = &strc->unk0.s;
    p = &gPlayer;
    cam = &gCamera;
    strc->unk0.qUnk50 = strc->unk60 + ((boss->unk60 << 8) + boss->qUnk44);
    strc->unk0.qUnk54 = strc->unk64 + ((boss->qUnk64 << 8) + boss->qUnk48);
    strc->unk70 = strc->unk76;
    screenX = I(strc->unk0.qUnk50) - cam->x;
    screenY = I(strc->unk0.qUnk54) - cam->y;
    if ((p->timerInvulnerability == 0) && !(boss->flags58 & 0x80)) {
        sub_800BFEC(s, I(strc->unk0.qUnk50), I(strc->unk0.qUnk54), p);
    }
    s->x = 0x80;
    s->y = 0x80;
    s->frameFlags = (s->frameFlags & 0xFFFE7FFF) | 0x10000;
    UpdateSpriteAnimation_BG(s);
    DisplaySprite_BG(s);
    SA2_LABEL(sub_8003EE4)((strc->unk70 >> 6), 0x100, 0x100, 0x7C, 0x80, screenX, screenY, gBgAffineRegs);

    switch (boss->unk6E) {
        case 4:
        case 5:
            var_r1_2 = (gExtraBossTaskData.parts[2]->unk76 - Q(64));
            var_r1_2 >>= 2;
            if (boss->unk6E == 4) {
                sub_804CFE0(&strc->unk76, var_r1_2, 64);
            } else {
                strc->unk76 = var_r1_2;
            }

            break;
        case 6:
        case 7:
            var_r1_2 = (gExtraBossTaskData.parts[7]->unk76 - Q(64));
            var_r1_2 >>= 2;
            if (boss->unk6E == 6) {
                sub_804CFE0(&strc->unk76, var_r1_2, 64);
            } else {
                strc->unk76 = var_r1_2;
            }

            break;
        case 0:
            var_r0 = &strc->unk76;
            var_r1 = 0x800;
            sub_804CFE0(var_r0, var_r1, 0x80);
            break;
        case 1:
            var_r0 = &strc->unk76;
            var_r1 = 0xF800;
            sub_804CFE0(var_r0, var_r1, 0x80);
            break;
        case 13:
            var_r0 = &strc->unk76;
            var_r1 = 0;
            sub_804CFE0(var_r0, var_r1, 0x80);
            break;
        case 14:
            sub_804CFE0(&strc->unk76, 0x4000U, 0x200);
            break;
        default:
            sub_804CFE0(&strc->unk76, 0U, 0x80);
            break;
    }
}

// (98.30%) https://decomp.me/scratch/4qGD5
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8050A88.inc", void sub_8050A88())
{
    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    SuperEggRobo *boss = gExtraBossTaskData.boss;
    Sprite *s = &strc->unk0.s;
    SpriteTransform *tf = &strc->unk0.transform;
    s32 sp4, sp8;
    s32 temp_r2_4;

    u16 *unk70 = &strc2->unk70;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (strc->unk6C * SIN_24_8(strc2->unk70 >> 6))) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (strc->unk6C * COS_24_8(strc2->unk70 >> 6))) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    sp4 = I(strc->unk0.qUnk50) - gCamera.x;
    sp8 = I(strc->unk0.qUnk54) - gCamera.y;

    if ((gPlayer.SA2_LABEL(unk62) != 0) && (sub_800C0E0(s, I(strc->unk0.qUnk50), I(strc->unk0.qUnk54), &gPlayer))) {
        if (!(boss->flags58 & SER_FLAG__80) && (boss->unk69 <= 0)) {
            boss->unk69 = 0x20;
            gPlayer.SA2_LABEL(unk62) = 0;
            gPlayer.timerInvulnerability = 8;
            gPlayer.qSpeedAirX = -Q(2);
            gPlayer.qSpeedGround = -Q(2);

            if (--boss->unk68 <= 0) {
                gDispCnt &= 0xDFFF;
                gBldRegs.bldCnt = 0;
                gFlags &= ~4;
                boss->unk6E = 0xD;
                boss->unk6F = 0xD;
                boss->qUnk4C = 0x180;
                boss->qUnk4E = 0xFF00;
                boss->flags58 |= SER_FLAG__80;
                boss->qUnk54 = 0;
                gStageFlags |= 1;

                INCREMENT_SCORE_A(1000);
            }
        }
    } else {
        if ((gPlayer.timerInvulnerability == 0) && !(boss->flags58 & SER_FLAG__80)) {
            sub_800BFEC(s, I(strc->unk0.qUnk50), I(strc->unk0.qUnk54), &gPlayer);
        }
    }
    s->frameFlags &= ~0x180;
    if (!(boss->flags58 & SER_FLAG__80) || (boss->unk69 != 0)) {
        if (PLAYER_IS_ALIVE) {
            gDispCnt &= ~DISPCNT_OBJWIN_ON;
            gWinRegs[WINREG_WINOUT] = 0;
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
        }
        if (boss->unk69 != 0) {
            if (!(gStageTime & 2)) {
                s->frameFlags |= 0x100;
                gDispCnt |= DISPCNT_OBJWIN_ON;
                gWinRegs[WINREG_WINOUT] = 0x3F1F;
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0x10;
            }

            boss->unk69--;
        }
    }
    tf->x = sp4;
    tf->y = sp8;
    tf->rotation = (strc->unk70 >> 6);
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
        case 3:
            sub_804CFE0(&strc->unk76, 0, 0x200);
            break;
        case 10:
            if (sub_804CFE0(&strc->unk76, 0xF000, 0x200) != 0) {
                boss->unk5C |= 1 << strc->unk0.unk0;
            }
            break;
        case 11:
            gDispCnt &= 0xDFFF;
            if (strc->unk0.unk4 == 0) {
                s->graphics.anim = 0x299;
                s->variant = 1;
                s->prevVariant = -1;
                m4aSongNumStart(0x9BU);
            }
            if (strc->unk0.unk4 == 10) {
                m4aSongNumStop(0x9BU);
            }

            if (strc->unk0.unk4 > 0xF) {
                boss->unk5C |= 1 << strc->unk0.unk0;
                gBldRegs.bldCnt = 0;
                gFlags &= ~4;
                s->graphics.anim = 0x299;
                s->variant = 0;
                s->prevVariant = 0xFF;
            } else {
                u16 a = (((Q(1) - COS_24_8((((strc->unk0.unk4 << 10) >> 6) & 0x3FF))) * 32) + Q(92));
                if (PLAYER_IS_ALIVE) {
                    if ((sub_8052150(sp4, sp8, a, strc) == 0))
                        gFlags &= ~4;
                }

                strc->unk0.unk4 += 1;
            }

            break;
        case 12:
            if (!(7 & strc->unk0.unk4)) {
                temp_r2_4 = ((strc->unk0.qUnk50 - (strc->unk0.unk4 << 0xA)) - Q(100));
                if (temp_r2_4 < -Q(32)) {
                    boss->unk5C |= 1 << strc->unk0.unk0;
                } else {
                    sub_804B570(temp_r2_4, Q(boss->qUnk64));
                }
            }

            strc->unk0.unk4 += 1;
            break;
        case 13:
            sub_804CFE0(&strc->unk76, 0x1800, 0x100);
            break;
        case 14:
            sub_804CFE0(&strc->unk76, 0x2000, 0x100);
            break;
        default:
            sub_804CFE0(&strc->unk76, 0, 0x100);
            break;
    }
}
END_NONMATCH

// (97.48%) https://decomp.me/scratch/4UTeN
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8050FB4.inc", void sub_8050FB4())
{
    SpriteTransform *sp0;
    Sprite *s;
    SpriteTransform *tf;
    SuperEggRobo *boss;
    s32 var_r0_2;
    s32 var_r0_3;
    s32 var_r0_4;
    s32 var_r1_2;
    u16 *var_r0;
    u16 var_r1;
    SomeTaskManager_7C *strc2;
    u32 var_r2;
    s32 screenX, screenY;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    boss = gExtraBossTaskData.boss;
    s = &strc->unk0.s;
    tf = &strc->unk0.transform;
    sp0 = tf;
    strc2 = strc->unk0.unk8;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;
    tf->x = screenX;
    tf->y = screenY;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
            sub_804CFE0(&strc->unk76, 0U, 0x100);
            break;
        case 3:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                var_r0 = &strc->unk76;
                var_r1 = 0x1000;
            } else {
                var_r0 = &strc->unk76;
                var_r1 = 0x2000;
            }
            sub_804CFE0(var_r0, var_r1, 0x200);
            break;
        case 4:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                u16 v = 0x6000;
                sub_804CFE0(&strc->unk76, v, 0x100);
                if (strc->unk76 == v) {
                    if (strc->unk0.unk4++ >= 0x1E) {
                        boss->unk5C |= 1 << strc->unk0.unk0;
                    }
                }
            }

            break;
        case 5:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                var_r0_2 = strc->unk0.unk4;
                if (var_r0_2 > 0x10) {
                    var_r0_2 = 0x10;
                }
                var_r2 = (u32)((Q(1) - COS_24_8(((u32)(var_r0_2 << 0x1A) >> 0x16))) << 0x10) >> 0xA;
                var_r0_3 = 0x5800;

                sub_804CFE0(&strc->unk76, (var_r0_3 - var_r2), 0x800);
                if (strc->unk0.unk4++ >= 76) {
                    boss->unk5C |= 1 << strc->unk0.unk0;
                }
            }
            break;
        case 6:
            if (!(gUnknown_084AE560[strc->unk0.unk0] & 0x1)) {
                u16 v = 0x6000;
                sub_804CFE0(&strc->unk76, v, 0x100);
                if (strc->unk76 == v) {
                    if (strc->unk0.unk4++ >= 0x1E) {
                        boss->unk5C |= 1 << strc->unk0.unk0;
                    }
                }
            }
            break;
        case 7:
            if (!(1 & gUnknown_084AE560[strc->unk0.unk0])) {
                u16 val;
                var_r0_4 = strc->unk0.unk4;
                if (var_r0_4 > 0x10) {
                    var_r0_4 = 0x10;
                }
                var_r2 = ((u32)((0x100 - COS_24_8(((u32)(var_r0_4 << 0x1A) >> 0x16))) << 0x10) >> 0xA);
                var_r0_3 = 0x6000;

                sub_804CFE0(&strc->unk76, (var_r0_3 - var_r2), 0x800);
                if (strc->unk0.unk4++ >= 0x4C) {
                    boss->unk5C |= (1 << strc->unk0.unk0);
                }
            }
            break;
        case 8:
        case 9:
            if (sub_804CFE0(&strc->unk76, 0xF000U, 0x100) != 0) {
                if (boss->qUnk54++ >= 0x3C) {
                    boss->unk5C |= (1 << strc->unk0.unk0);
                    asm("");
                }
            }
            break;
        case 13:
            sub_804CFE0(&strc->unk76, 0xD000U, 0x400);
            return;
        case 14:
            sub_804CFE0(&strc->unk76, 0xF000U, 0x100);
            return;
        default:
            sub_804CFE0(&strc->unk76, 0U, 0x100);
            break;
    }
}
END_NONMATCH

// (99.44%) https://decomp.me/scratch/6H87B
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8051344.inc", void sub_8051344())
{
    u16 *var_r0_2;
    u16 *var_r0_3;
    s32 var_r0_4;
    s32 var_r1_2;
    u16 var_r1_3;
    u16 *var_r0;
    u16 var_r1;
    u16 v_r1;
    u32 var_r2;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    SuperEggRobo *boss = gExtraBossTaskData.boss;
    Sprite *s = &strc->unk0.s;
    SpriteTransform *tf = &strc->unk0.transform;
    s32 screenX, screenY;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;
    tf->x = screenX;
    tf->y = screenY;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
            sub_804CFE0((&strc->unk76), 0U, 0x100U);
            break;
        case 3:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                sub_804CFE0(&strc->unk76, 0x6000, 0x200U);
            } else {
                sub_804CFE0(&strc->unk76, 0x6800, 0x200U);
            }

            break;
        case 4:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                var_r0_2 = &strc->unk76;
                var_r1_2 = 0x6000;
                sub_804CFE0(var_r0_2, var_r1_2, 0x100U);
            }
            break;
        case 5:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                var_r0_3 = &strc->unk76;
                var_r1_3 = 0x1000;
                sub_804CFE0(var_r0_3, var_r1_3, 0x400U);
            }
            break;
        case 6:
            if (!(1 & gUnknown_084AE560[strc->unk0.unk0])) {
                var_r0_2 = &strc->unk76;
                var_r1_2 = 0x6000;
                sub_804CFE0(var_r0_2, var_r1_2, 0x100U);
            }
            break;
        case 7:
            if (!(1 & gUnknown_084AE560[strc->unk0.unk0])) {
                var_r0_3 = &strc->unk76;
                var_r1_3 = 0x1000;
                sub_804CFE0(var_r0_3, var_r1_3, 0x400U);
            }
            break;
        case 8:
            var_r0 = &strc->unk76;
            var_r1 = 0x4000;
            sub_804CFE0(var_r0, var_r1, 0x200U);
            break;
        case 9:
            v_r1 = 0x4000;
            v_r1 -= ((u32)(PseudoRandom32() << 0xC) >> 0x14);
            sub_804CFE0((&strc->unk76), v_r1, 0x1000U);
            break;
        case 13:
            var_r0_3 = &strc->unk76;
            var_r1_3 = 0x2000;
            sub_804CFE0(var_r0_3, var_r1_3, 0x400U);
            break;
        case 14:
            var_r0_2 = &strc->unk76;
            var_r1_2 = 0x1000;
            sub_804CFE0(var_r0_2, var_r1_2, 0x100U);
            break;
        default:
            sub_804CFE0((&strc->unk76), 0U, 0x100U);
            break;
    }
}
END_NONMATCH

// (86.20%) https://decomp.me/scratch/UI7fC
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8051604.inc", void sub_8051604())
{
    SpriteTransform *sp0;
    u16 mask;
    Sprite *s;
    SpriteTransform *tf;
    SuperEggRobo *boss;
    u16 *var_r0_2;
    s32 var_r0_3;
    s32 var_r0_4;
    s32 var_r1_2;
    u16 *var_r0;
    u16 var_r1;
    SomeTaskManager_7C *strc2;
    u32 var_r2;
    s32 screenX, screenY;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    strc2 = strc->unk0.unk8;
    boss = gExtraBossTaskData.boss;
    s = &strc->unk0.s;
    tf = &strc->unk0.transform;
    sp0 = tf;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    mask = 0x3FF;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;

    if ((gPlayer.timerInvulnerability == 0) && !(boss->flags58 & 0x80)) {
        s32 temp_r2_5 = ((((u32)strc->unk70 - Q(64)) << 0x10) >> 0x16) & mask;
        sub_800BFEC(s, (strc->unk0.qUnk50 + (-(COS_24_8(temp_r2_5) * Q(23)) >> 0x10)),
                    (strc->unk0.qUnk54 + ((0 - SIN_24_8(temp_r2_5) * 0x1700) >> 0x10)), &gPlayer);
    }

    tf->x = screenX;
    tf->y = screenY;
    tf->y = ((((u32)strc->unk70 - Q(64)) << 16) >> 22);
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
            var_r0 = &strc->unk76;
            var_r1 = 0x4000;
            sub_804CFE0((u16 *)var_r0, var_r1, 0x200U);
            break;
        case 3:
            sub_804CFE0(&strc->unk76, 0U, 0x200);
            break;
        case 8:
            sub_804CFE0(&strc->unk76, -strc->unk70, 0x200U);
            break;
        case 9:
            sub_804CFE0(&strc->unk76, -strc->unk70, 0x200U);
            if (!(gStageTime & 0x1F)) {
                s32 qX = strc->unk0.qUnk50;
                s32 qY = strc->unk0.qUnk54 + 0x1700;
                bool32 var_r2_2 = 0;
                if (!(PseudoRandom32() & 0x30000)) {
                    var_r2_2 = 1;
                }
                sub_804A8A8(qX, qY, var_r2_2);
            }
            break;
        case 13:
            sub_804CFE0((u16 *)(&strc->unk76), 0xB000U, 0x400U);
            break;
        case 14:
            var_r0_2 = &strc->unk76;
            var_r2 = 0x100;
            sub_804CFE0((u16 *)var_r0_2, 0U, var_r2);
            break;
        default:
            sub_804CFE0((u16 *)(&strc->unk76), 0U, 0x100U);
            break;
    }
}
END_NONMATCH

void sub_80518E8()
{
    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    Sprite *s = &strc->unk0.s;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    strc->unk60
        = (s32)((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (((s32)((u16)SIN(strc2->unk70 >> 6) << 0x10) >> 0x16) * strc->unk6C)) >> 8;
    strc->unk64
        = (s32)((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (((s32)((u16)COS(strc2->unk70 >> 6) << 0x10) >> 0x16) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - cam->x;
    screenY = I(strc->unk0.qUnk54) - cam->y;
    s->x = screenX;
    s->y = screenY;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    sub_804CFE0(&strc->unk76, 0U, 0x100U);
}

// (99.62%) https://decomp.me/scratch/OHVMq
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_80519E8.inc", void sub_80519E8())
{
    u16 *var_r0;
    u16 var_r1;
    u16 v_r1;
    u32 var_r2;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    SuperEggRobo *boss = gExtraBossTaskData.boss;
    Sprite *s = &strc->unk0.s;
    SpriteTransform *tf = &strc->unk0.transform;
    s32 screenX, screenY;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;
    tf->x = screenX;
    tf->y = screenY;
    tf->rotation = strc->unk70 >> 6;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
        case 3:
            sub_804CFE0(&strc->unk76, 0U, 0x200U);
            break;
        case 4:
            sub_804CFE0(&strc->unk76, strc2->unk76, 0x100U);
            break;
        case 5:
            if (!(1 & gUnknown_084AE560[strc->unk0.unk0])) {
                sub_804CFE0(&strc->unk76, 0xE800U, 0x200);
            }
            break;
        case 6:
            break;
        case 7:
            if (1 & gUnknown_084AE560[strc->unk0.unk0]) {
                sub_804CFE0(&strc->unk76, 0xE800U, 0x200);
            }
            break;
        case 0:
            sub_804CFE0(&strc->unk76, 0x1000U, 0x80U);
            break;
        case 13:
            sub_804CFE0(&strc->unk76, 0x4000U, 0x200U);
            if ((boss->unk69 == 0) && (strc->unk76 == 0x4000)) {
                boss->unk5C |= 1 << strc->unk0.unk0;
            }
            break;
        case 14:
            var_r0 = &strc->unk76;
            var_r1 = 0xE800;
            sub_804CFE0(var_r0, var_r1, 0x100U);
            return;
        default:
            var_r0 = &strc->unk76;
            var_r1 = 0;
            sub_804CFE0(var_r0, var_r1, 0x80U);
            break;
    }
}
END_NONMATCH

// (99.59%) https://decomp.me/scratch/pfoQe
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8051C44.inc", void sub_8051C44())
{
    u16 *var_r0;
    u16 var_r1;
    u16 v_r1;
    u32 var_r2;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    SuperEggRobo *boss = gExtraBossTaskData.boss;
    Sprite *s = &strc->unk0.s;
    SpriteTransform *tf = &strc->unk0.transform;
    s32 screenX, screenY;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;
    tf->x = screenX;
    tf->y = screenY;
    tf->rotation = strc->unk70 >> 6;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
            sub_804CFE0(&strc->unk76, 0U, 0x200U);
            break;
        case 8:
        case 9:
            sub_804CFE0(&strc->unk76, 0, 0x200U);
            break;
        case 0:
            sub_804CFE0(&strc->unk76, 0x2000U, 0x80U);
            break;
        case 1:
            sub_804CFE0(&strc->unk76, 0xE000U, 0x80U);
            break;
        case 13:
            sub_804CFE0(&strc->unk76, 0, 0x400);
            break;
        case 14:
            sub_804CFE0(&strc->unk76, 0x1800, 0x100U);
            break;
        default:
            sub_804CFE0(&strc->unk76, 0x2000, 0x100U);
            break;
    }
}
END_NONMATCH

// (99.12%) https://decomp.me/scratch/HWqI4
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_xtra__sub_8051E38.inc", void sub_8051E38())
{
    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    SuperEggRobo *boss = gExtraBossTaskData.boss;
    Sprite *s = &strc->unk0.s;
    SpriteTransform *tf = &strc->unk0.transform;
    s32 screenX, screenY;
    strc->unk60 = ((strc->unk68 * COS_24_8(strc2->unk70 >> 6)) - (SIN_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk64 = ((strc->unk68 * SIN_24_8(strc2->unk70 >> 6)) + (COS_24_8(strc2->unk70 >> 6) * strc->unk6C)) >> 8;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = I(strc->unk0.qUnk50) - gCamera.x;
    screenY = I(strc->unk0.qUnk54) - gCamera.y;
    tf->x = screenX;
    tf->y = screenY;
    tf->rotation = strc->unk70 >> 6;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= (u8)(gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    switch (boss->unk6E) {
        case 2:
        case 3:
            break;
        case 4:
        case 5:
        case 6:
        case 7:
            if (strc->unk70 < 0x1000) {
                sub_804CFE0(&strc->unk76, -strc->unk70, 0x100U);
            } else {
                sub_804CFE0(&strc->unk76, 0, 0x100U);
            }
            break;
        case 0:
        case 11:
        case 12:
            sub_804CFE0(&strc->unk76, 0xE000U, 0x100U);
            break;
        case 13:
            sub_804CFE0(&strc->unk76, 0xF800, 0x400);
            break;
        case 14:
            sub_804CFE0(&strc->unk76, 0, 0x100U);
            break;
        default:
            sub_804CFE0(&strc->unk76, 0, 0x100U);
            break;
    }
}
END_NONMATCH

void sub_805202C()
{
    u16 *temp_r1;
    s32 screenX, screenY;

    SomeTaskManager_7C *strc = TASK_DATA(gCurTask);
    SomeTaskManager_7C *strc2 = strc->unk0.unk8;
    Sprite *s = &strc->unk0.s;
    Camera *cam = &gCamera;
    strc->unk0.qUnk50 = strc->unk60 + strc2->unk0.qUnk50;
    strc->unk0.qUnk54 = strc->unk64 + strc2->unk0.qUnk54;
    strc->unk70 = strc->unk76 + strc2->unk70;
    screenX = ((s32)strc->unk0.qUnk50 >> 8) - cam->x;
    screenY = ((s32)strc->unk0.qUnk54 >> 8) - cam->y;
    s->x = screenX;
    s->y = screenY;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    sub_804CFE0(&strc->unk76, 0U, 0x100U);
}

bool32 sub_80520B8(SuperEggRobo *boss)
{
    bool32 result = FALSE;
    s32 temp_r0;
    NutsAndBolts *bolts;
    s32 temp_r3;

    if (!(0xF & gStageTime) || ((boss->unk6E == 0xE) && !(gStageTime & 7))) {
        s32 a, b;
        temp_r0 = (((u32)PseudoRandom32() << 10) >> 18) - Q(32);
        temp_r3 = (((u32)PseudoRandom32() << 9) >> 17) - Q(64);
        a = boss->qUnk44 + Q(boss->unk60) + temp_r0;
        b = boss->qUnk48 + Q(boss->qUnk64) + temp_r3;
        bolts = TASK_DATA(sub_8017540(a, b));
        bolts->s.frameFlags = 0x1000;
        bolts->s.oamFlags = 0x380;

        result = TRUE;
    }

    return result;
}

bool32 sub_8052150(s32 arg0, s32 arg1, u16 arg2, SomeTaskManager_7C *arg3)
{
    int_vcount sp0[8];
    s32 sp8;
    s32 temp_r4_2;
    s32 temp_r2_2;
    s32 temp_r5;
    s32 temp_r6;
    s32 var_r0;
    s32 var_r1;
    s32 var_r2;
    s32 var_r3;
    s32 var_r4;
    s32 var_r4_2;
    s32 var_r5;
    s32 var_r6;
    s32 var_r7;
    s32 var_r8;
    s32 var_sb;
    s32 var_sl;

    s32 v;

    temp_r5 = COS_24_8(arg3->unk70 >> 6);
    temp_r6 = SIN_24_8(arg3->unk70 >> 6);
    v = (temp_r5 * 0xF00);
    var_r7 = arg0 + (((temp_r6 << 0xC) - v) >> 0x10);
    v = (temp_r6 * 0xF00);
    var_r5 = arg1 + (((0 - (temp_r5 << 0xC)) - v) >> 0x10);
    var_r6 = var_r5 + 3;
    var_sl = 0;
    sp8 = 0;
    temp_r4_2 = (s16)Div(SIN_24_8(arg2 >> 6) << 8, COS_24_8(arg2 >> 6));
    temp_r2_2 = Div(0x10000, temp_r4_2);
    var_r1 = var_r5 - ((var_r7 * temp_r4_2) >> 8);
    var_r8 = var_r1 + 3;
    if (var_r7 > (DISPLAY_WIDTH - 1)) {
        var_r0 = I(temp_r4_2 * (DISPLAY_WIDTH - var_r7));
        var_r5 += var_r0;
        var_r6 += var_r0;
        var_r7 = (DISPLAY_WIDTH - 1);
    }

    if (var_r5 >= (DISPLAY_HEIGHT - 1)) {
        return FALSE;
    }

    {
        var_sb = var_r7;
        var_r4 = var_r7;
        if (var_r5 < 0) {
            var_r4 = var_r7 - ((var_r5 * temp_r2_2) >> 8);
            var_r5 = 0;
            if (var_r6 < 0) {
                var_sb = var_r7 - ((var_r6 * temp_r2_2) >> 8);
                var_r6 = 0;
            }
        }

        var_r5 = CLAMP_32(var_r5, 0, (DISPLAY_HEIGHT - 1));
        var_r6 = CLAMP_32(var_r6, 0, (DISPLAY_HEIGHT - 1));

        if (var_r8 > (DISPLAY_HEIGHT - 1)) {
            s32 r8 = (DISPLAY_HEIGHT - var_r8);
            sp8 += (r8 * temp_r2_2) >> 8;
            var_r8 = (DISPLAY_HEIGHT - 1);
            if (var_r1 > (DISPLAY_HEIGHT - 1)) {
                var_sl += (temp_r2_2 * (DISPLAY_HEIGHT - var_r1)) >> 8;
                var_r1 = (DISPLAY_HEIGHT - 1);
            }
        }
        if ((var_sl >= (DISPLAY_WIDTH - 1)) || (var_r5 >= (DISPLAY_HEIGHT - 1)) || (var_r7 == var_sl) || (var_r5 == var_r1)
            || (var_r6 == var_r8)) {
            return FALSE;
        }

        var_sl = CLAMP_32(var_sl, 0, DISPLAY_WIDTH - 1);
        var_r2 = CLAMP_32(sp8, 0, (DISPLAY_WIDTH - 1));

        sp0[0] = var_r4;
        sp0[1] = var_r5;
        sp0[2] = var_sl;
        sp0[3] = var_r1;
        sp0[4] = var_sb;
        sp0[5] = var_r6;
        sp0[6] = var_r2;
        sp0[7] = var_r8;
        SA2_LABEL(sub_8006DB4)(0U, (TriParam1 *)&sp0, 0, var_r7 + 1);

        if (var_r5 >= 0) {
            var_r4_2 = var_r5;
            if (var_r4_2 > (DISPLAY_HEIGHT - 1)) {
                var_r4_2 = (DISPLAY_HEIGHT - 1);
            }
        } else {
            var_r4_2 = 0;
        }

        var_r3 = CLAMP_32(var_r8, 0, (DISPLAY_HEIGHT - 1));

        gDispCnt |= 0x2000;
        gWinRegs[2] = (var_r4_2 << 8) | var_r3;
        gWinRegs[5] = 0x1F1F;
        gWinRegs[4] = 0x3F3F;
        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY = 0xE;
    }

    return TRUE;
}

void CreateEntity_SuperEggRobot(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    } else {
        struct Task *t = TaskCreate(Task_SuperEggRobotInit, sizeof(SuperEggRobo), 0x2000, 0, NULL);
        SuperEggRobo *boss = TASK_DATA(t);

        boss->base.regionX = regionX;
        boss->base.regionY = regionY;
        boss->base.me = me;
        boss->base.meX = me->x;
        boss->base.id = id;
        SET_MAP_ENTITY_INITIALIZED(me);

        sub_80504DC(boss, me);

        gExtraBossTaskData.boss = boss;
    }
}

static void TaskDestructor_unused(struct Task *t)
{
    SuperEggRobo *boss = TASK_DATA(t);
    VramFree(boss->unusedSprite.graphics.dest);
}

void sub_80523D4(SuperEggRobo *boss)
{
    s32 temp_r0;

    temp_r0 = sub_8050194(boss);
    if (temp_r0 <= 3) {
        boss->qUnk4E = Q(temp_r0);
    } else {
        boss->flags58 |= 2;
    }
}

void sub_80523F8(SuperEggRobo *boss)
{
    s32 temp_r0;

    temp_r0 = sub_8050194(boss);
    if (temp_r0 < 0) {
        boss->qUnk48 += Q(temp_r0);
        boss->flags58 &= ~2;
        boss->qUnk4E = 0;
    }
}

void sub_8052424(SuperEggRobo *boss)
{
    boss->qUnk44 += boss->qUnk4C;
    boss->qUnk48 += boss->qUnk4E;
    boss->qUnk4C += boss->qUnk50;
    boss->qUnk4E += boss->qUnk52;
}

void sub_8052468(SuperEggRobo *boss) { boss->qUnk4E += Q(16. / 256.); }

SomeTaskManager_7C *sub_8052474(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_HEAD;
    gfx.tileInfo.variant = 0;
    gfx.vram = ALLOC_TILES(SA1_ANIM_BOSS_XTRA_HEAD);
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_8050A88, TaskDestructor_SomeTaskManager_60_Common);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk72 = 0xFFC0;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_80524F0(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ARM_BEARING;
    gfx.tileInfo.variant = 0;
    gfx.vram = VRAM_RESERVED_BOSS_XTRA_BEARING;
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_8050FB4, NULL);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk76 = 0;
    strc2->unk72 = 0x80;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2040;
    strc2->unk0.transform.qScaleX = Q(1.5);
    strc2->unk0.transform.qScaleY = Q(1.5);
    return strc2;
}

SomeTaskManager_7C *sub_8052578(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ARM_BEARING;
    gfx.tileInfo.variant = 0;
    gfx.vram = VRAM_RESERVED_BOSS_XTRA_BEARING;
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_80518E8, NULL);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_80525E0(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ARM_BEARING;
    gfx.tileInfo.variant = 0;
    gfx.vram = VRAM_RESERVED_BOSS_XTRA_BEARING;
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_8051344, NULL);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk72 = 0x80;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2040;
    strc2->unk0.transform.qScaleX = Q(1.25);
    strc2->unk0.transform.qScaleY = Q(1.25);
    return strc2;
}

SomeTaskManager_7C *sub_805265C(SomeTaskManager_7C *strc, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_ARM;
    gfx.tileInfo.variant = 0;
    gfx.vram = VRAM_RESERVED_BOSS_XTRA_ARM;
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_8051604, NULL);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_80526C4(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4)
{
    SomeTaskManager_7C *strc2;
    struct Task *t;
    Sprite *s;

    t = CreateSomeTaskManager_7C_Task(gfx, sub_80519E8, TaskDestructor_SomeTaskManager_60_Common);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk76 = 0;
    strc2->unk72 = 0x100;
    strc2->unk0.s.oamFlags = (param4 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_8052724(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4)
{
    SomeTaskManager_7C *strc2;
    struct Task *t;
    Sprite *s;

    t = CreateSomeTaskManager_7C_Task(gfx, sub_805202C, TaskDestructor_SomeTaskManager_60_Common);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk76 = 0;
    strc2->unk72 = 0;
    strc2->unk0.s.oamFlags = (param4 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_8052780(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4)
{
    SomeTaskManager_7C *strc2;
    struct Task *t;
    Sprite *s;

    t = CreateSomeTaskManager_7C_Task(gfx, sub_8051C44, TaskDestructor_SomeTaskManager_60_Common);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk76 = 0;
    strc2->unk72 = 0x80;
    strc2->unk0.s.oamFlags = (param4 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

SomeTaskManager_7C *sub_80527DC(SomeTaskManager_7C *strc, s32 param1, s32 param2, GfxInfo *gfx, s32 param4)
{
    SomeTaskManager_7C *strc2;
    struct Task *t;
    Sprite *s;

    t = CreateSomeTaskManager_7C_Task(gfx, sub_8051E38, TaskDestructor_SomeTaskManager_60_Common);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = strc;
    strc2->unk68 = param1;
    strc2->unk6C = param2;
    strc2->unk76 = 0;
    strc2->unk72 = 0x80;
    strc2->unk0.s.oamFlags = (param4 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}

// TODO: This taking a (SuperEggRobo *) as first param is odd...
//       Just like it is set strc2->unk0.unk8 to it.
SomeTaskManager_7C *sub_8052838(SuperEggRobo *boss, s32 param1, s32 param2, s32 param3)
{
    SomeTaskManager_7C *strc2;
    GfxInfo gfx;
    struct Task *t;
    Sprite *s;

    gfx.tileInfo.anim = SA1_ANIM_BOSS_XTRA_PALETTE;
    gfx.tileInfo.variant = 0;
    gfx.vram = ((void *)BG_VRAM + 0x4040);
    t = CreateSomeTaskManager_7C_Task(&gfx, sub_8050888, NULL);
    strc2 = TASK_DATA(t);
    strc2->unk0.unk8 = (void *)boss;
    strc2->unk60 = param1;
    strc2->unk64 = param2;
    strc2->unk72 = 0;
    strc2->unk0.s.oamFlags = (param3 << 6);
    strc2->unk0.s.frameFlags = 0x2000;
    return strc2;
}
