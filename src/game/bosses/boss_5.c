#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/game.h"
#include "game/save.h"
#include "game/bosses/common.h"
#include "game/player_callbacks_1.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"
#include "constants/animations.h"

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

    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 unk11;
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
    /* 0xBF */ u8 unkBF;
    /* 0xC0 */ s8 unkC0;

    /* 0xC1 */ s8 fillerC1[111];

    /* 0x130 */ s16 unk130;

    /* 0x134 */ EggSaucer_unk134 unk134;

    /* 0x140 */ Sprite unk140; // disk
    /* 0x170 */ Sprite unk170; // cabin

    /* 0x1A0 */ Sprite_UNK28 unk1A0[2]; // maybe

    /* 0x1B0 */ Sprite unk1B0; // pilot
    /* 0x1E0 */ Sprite unk1E0; // gun
    /* 0x210 */ Sprite_UNK28 unk210; // maybe

    /* 0x218 */ Sprite unk218; // gun base
    /* 0x248 */ s8 unk248[20];

    /* 0x25C */ Sprite unk25C; // gun projectile
    /* 0x28C */ Sprite unk28C; // arm base
    /* 0x2BC */ Sprite_UNK28 unk2BC; // maybe

    /* 0x2C4 */ Sprite unk2C4; // arm segment
    /* 0x2F4 */ Sprite unk2F4; // hand
    /* 0x324 */ Sprite_UNK28 unk324; // maybe

    /* 0x32C */ Sprite unk32C[8]; // smackParticle

    /* 0x4AC */ void *vram;
} EggSaucer; /* 0x4B0 */

extern const TileInfo gUnknown_080D7FB0[];
extern const u16 gUnknown_080D7F94[2];

void Task_EggSaucerMain(void);
void TaskDestructor_EggSaucerMain(struct Task *);

void CreateEggSaucer(void)
{
    u8 i;
    u32 r2;
    EggSaucer *boss;
    EggSaucer_unk134 *unk134;
    Sprite *s;
    void *vram;
    void *vramBase;

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

    gUnknown_03005AF0.unk1C &= ~0x3000;
    gUnknown_03005AF0.unk1C |= 0x1000;

    gUnknown_03005AA0.unk1C &= ~0x3000;
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

    // timer?
    boss->unk130 = 0x50;

    boss->unkC = 0x500;
    boss->unkE = 0;
    boss->unk12 = 0;
    boss->unk13 = 0;
    boss->unk16 = 0x155;
    boss->unk18 = 0;
    boss->unk30 = 0x2AA;
    boss->unk1A = 0x200;
    boss->unk1C = gUnknown_080D7F94[1] << 1;
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

    // TODO: add tiles up to make this value
    vram = VramMalloc(0xEA);
    boss->vram = vram;

    // reserved for smack effect
    vram += 24 * TILE_SIZE_4BPP;
    vramBase = boss->vram;

    s = &boss->unk140;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)VRAM + 0xC000;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_DISK, 0, 0x7C0, 3,
                             SPRITE_FLAG(18, 1));

    sub_80036E0(s);
    sub_8003914(s);

    s = &boss->unk1B0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 15 * TILE_SIZE_4BPP;

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
        s->variant = 0;
    } else {
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
        s->variant = 0;
    }
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 0x500, 1, 0);

    s = &boss->unk170;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 36 * TILE_SIZE_4BPP;

    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_CABIN, 0, 0x540, 1, 0);
    sub_8004558(s);

    s = &boss->unk218;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 25 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_GUN_BASE, 0, 0x580, 1, 0);

    s = &boss->unk1E0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    // Seems a lot of tiles for this
    vram += 64 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM_OR_FLAGS(s, SA2_ANIM_EGG_SAUCER_GUN, 0, 0x5C0);
    s->unk10 = gUnknown_030054B8++ | SPRITE_FLAG(PRIORITY, 1)
        | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

    s = &boss->unk25C;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 4 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_GUN_PROJ, 0, 0x4C0, 1, 0);

    s = &boss->unk28C;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 20 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_ARM_BASE, 0, 0x500, 1, 0);
    sub_8004558(s);

    s = &boss->unk2C4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 4 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_ARM_SEGMENT, 0, 0x4C0, 1, 0);
    sub_8004558(s);

    s = &boss->unk2F4; // hand
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM_OR_FLAGS(s, SA2_ANIM_EGG_SAUCER_HAND, 0, 0x300);
    s->unk28[1].unk0 = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

    for (i = 0; i < 8; i++) {
        s = &boss->unk32C[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vramBase;
        vramBase += gUnknown_080D7FB0[i].numTiles * TILE_SIZE_4BPP;

        SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D7FB0[i].anim,
                                 gUnknown_080D7FB0[i].variant, 0x2C0, 1, 0);
    }
}

void sub_80444DC(EggSaucer *);
void sub_8044784(EggSaucer *);

void sub_80459A0(EggSaucer *);
void sub_80454A4(EggSaucer *);
void sub_80438C4(EggSaucer *);
void sub_8045898(EggSaucer *);

void sub_804352C(void);

typedef void (*EggSaucerCallback)(EggSaucer *);

extern const EggSaucerCallback gUnknown_080D7F98[];

void Task_EggSaucerMain(void)
{
    EggSaucer *boss = TaskGetStructPtr(gCurTask);
    // speed
    boss->unk4 += Q_24_8(4);

    sub_80444DC(boss);
    sub_8044784(boss);

    gUnknown_080D7F98[boss->unkBF](boss);

    sub_80459A0(boss);
    sub_80454A4(boss);
    sub_80438C4(boss);
    sub_8045898(boss);

    if (--boss->unk130 == 0) {
        gCurTask->main = sub_804352C;
    }
}

void sub_8044088(EggSaucer *);
void sub_8043E2C(EggSaucer *);
void sub_80436E4(EggSaucer *);

void sub_80435BC(void);

void sub_804352C(void)
{
    EggSaucer *boss = TaskGetStructPtr(gCurTask);

    sub_80444DC(boss);
    sub_8044784(boss);

    gUnknown_080D7F98[boss->unkBF](boss);

    sub_80459A0(boss);
    sub_8044088(boss);
    sub_80454A4(boss);
    sub_80438C4(boss);
    sub_8043E2C(boss);
    sub_8045898(boss);

    if (boss->unk10 == 0) {
        gBldRegs.bldCnt = 0;
        sub_802A018();
        sub_80436E4(boss);
        boss->unkC = 0x500;
        boss->unk11 = 0;
        gCurTask->main = sub_80435BC;
    }
}
