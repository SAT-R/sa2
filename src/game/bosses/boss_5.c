#include "core.h"
#include "sprite.h"
#include "task.h"

#include "game/game.h"
#include "game/bosses/common.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
} EggSaucer_unk134;

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 unk4; // x
    /* 0x08 */ s32 unk8; // y
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;

    /* 0x10 */ s8 unk10;
    /* 0x11 */ s8 unk11;
    /* 0x12 */ s8 unk12;
    /* 0x13 */ s8 unk13;
    /* 0x14 */ s8 unk14;
    /* 0x15 */ s8 unk15;

    /* 0x16 */ s16 unk16;
    /* 0x18 */ s16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ s16 unk1C;

    /* 0x1E */ s8 unk1E;
    /* 0x1F */ s8 unk1F;
    /* 0x20 */ s8 unk20;

    /* 0x22 */ s16 unk22;
    /* 0x24 */ s16 unk24;

    /* 0x28 */ s32 unk28;
    /* 0x2C */ s32 unk2C;

    /* 0x30 */ s16 unk30;
    /* 0x32 */ s16 unk32;

    /* 0x34 */ s16 unk34;

    /* 0x36 */ s16 unk36[2][32];
    /* 0xB6 */ s8 unkB6;

    /* 0xB8 */ s16 unkB8;
    /* 0xBA */ s16 unkBA;
    /* 0xBC */ s16 unkBC;

    /* 0xBE */ s8 unkBE;
    /* 0xBF */ s8 unkBF;
    /* 0xC0 */ s8 unkC0;

    /* 0xC1 */ s8 filler1C[111];

    /* 0x130 */ s32 unk130;

    /* 0x134 */ EggSaucer_unk134 unk134;

    /* 0x140 */ Sprite unk140;
    /* 0x170 */ Sprite unk170;

    /* 0x1A0 */ Sprite_UNK28 unk1A0[2]; // maybe

    /* 0x1B0 */ Sprite unk1B0;
    /* 0x1E0 */ Sprite unk1E0;
    /* 0x210 */ Sprite_UNK28 unk210; // maybe

    /* 0x218 */ Sprite unk218;
    /* 0x248 */ s8 unk248[20];

    /* 0x25C */ Sprite unk25C;
    /* 0x28C */ Sprite unk28C;
    /* 0x2BC */ Sprite_UNK28 unk2BC; // maybe

    /* 0x2C4 */ Sprite unk2C4;
    /* 0x2F4 */ Sprite unk2F4;
    /* 0x324 */ Sprite_UNK28 unk324; // maybe

    /* 0x32C */ Sprite unk32C[8];

    /* 0x4AC */ void *vram;
} EggSaucer; /* 0x4B0 */

void Task_EggSaucerMain(void);
void TaskDestructor_EggSaucerMain(struct Task *);

void CreateEggSaucer(void)
{
    u8 i;
    EggSaucer *boss;
    EggSaucer_unk134 *unk134;

    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x560D;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    gUnknown_03004D80[0] = 0;

    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 64;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    sub_8039ED4();
    gPseudoRandom = gUnknown_03005590;

    m4aSongNumStart(SE_253);

    gUnknown_03005AF0.unk1C &= ~0x4000;
    gUnknown_03005AF0.unk1C |= 0x1000;

    gUnknown_03005AA0.unk1C &= ~0x4000;
    gUnknown_03005AA0.unk1C |= 0x1000;

    gActiveBossTask
        = TaskCreate(Task_EggSaucerMain, 0x4B0, 0x4000, 0, TaskDestructor_EggSaucerMain);
    boss = TaskGetStructPtr(gActiveBossTask);

    unk134 = &boss->unk134;
    unk134->unk0 = 0;
    unk134->unk4 = 0;
    unk134->unk2 = 2;
    unk134->unk6 = 0;
    unk134->unk8 = 12527;
    unk134->unkA = 0;

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unk10 = 6;
        boss->unk11 = 2;
    } else {
        boss->unk10 = 8;
        boss->unk11 = 4;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->unk10 = boss->unk10 >> 1;
        boss->unk11 = boss->unk11 >> 1;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->unk4 = Q_24_8(23044);
        boss->unk8 = Q_24_8(140);
    } else {
        boss->unk4 = Q_24_8(540);
        boss->unk8 = Q_24_8(140);
    }

    boss->unk130 = 0x50;
    boss->unkC = 0x500;
    boss->unkE = 0;
    boss->unk12 = 0;
    boss->unk13 = 0;
    boss->unk16 = 0x155;
    boss->unk18 = 0;
    boss->unk30 = 0x2AA;
    boss->unk1A = 0x200;
    boss->unk1C = 0x3C0;
    boss->unk1E = 0;
    boss->unk34 = 0;
    boss->unkB6 = 0;
    boss->unk32 = 0;
    boss->unkB8 = 0;
    boss->unkBA = 0;
    boss->unkBC = 0;
    boss->unkBE = 0;
    boss->unkBF = 0;
    boss->unkC0 = 0;
    boss->unk1F = 0;
    boss->unk22 = 0x500;
    boss->unk24 = 0;
    boss->unk28 = 0;
    boss->unk2C = 0;
    boss->unk20 = 0;
    boss->unk14 = 0;
    boss->unk15 = 0;

    for (i = 0; i < 0x20; i++) {
        boss->unk36[0][i] = 0;
        boss->unk36[1][i] = 0;
    }
}
