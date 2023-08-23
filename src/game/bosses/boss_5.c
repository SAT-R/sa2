#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/game.h"
#include "game/save.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/player_callbacks_1.h"

#include "game/screen_transition.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"
#include "constants/animations.h"
#include "flags.h"

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 unk4; // x
    /* 0x08 */ s32 unk8; // y

    /* 0x0C */ s16 unkC; // speedX
    /* 0x0E */ s16 unkE; // speedY

    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 unk11;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 unk15;

    /* 0x16 */ u16 unk16;
    /* 0x18 */ u16 unk18;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 unk1C;

    /* 0x1E */ u8 unk1E;
    /* 0x1F */ u8 unk1F;
    /* 0x20 */ u8 unk20;

    /* 0x22 */ s16 unk22;
    /* 0x24 */ s16 unk24;

    /* 0x28 */ s32 unk28;
    /* 0x2C */ s32 unk2C;

    /* 0x30 */ u16 unk30;
    /* 0x32 */ u16 unk32;

    /* 0x34 */ s16 unk34;

    /* 0x36 */ s16 unk36[2][32];
    /* 0xB6 */ u8 unkB6;

    /* 0xB8 */ s16 unkB8;
    /* 0xBA */ s16 unkBA;
    /* 0xBC */ u16 unkBC;

    /* 0xBE */ u8 unkBE;
    /* 0xBF */ u8 unkBF;
    /* 0xC0 */ u8 unkC0;

    /* 0xC4 */ s32 unkC4;
    /* 0xC8 */ s32 unkC8;

    /* 0xCC */ s32 unkCC;
    /* 0xD0 */ s32 unkD0;

    /* 0xD4 */ s16 unkD4;
    /* 0xD6 */ s16 unkD6;

    /* 0xD8 */ s16 unkD8;
    /* 0xDA */ s16 unkDA;

    /* 0xDC */ s32 unkDC[6][2];

    /* 0x10C */ s16 unk10C[6][2];

    /* 0x124 */ s32 unk124;
    /* 0x128 */ s32 unk128;
    /* 0x12C */ s16 unk12C;
    /* 0x12E */ s16 unk12E;

    /* 0x130 */ s16 unk130; // timer

    /* 0x134 */ struct TransitionState unk134;

    /* 0x140 */ Sprite unk140; // disk
    /* 0x170 */ Sprite unk170; // cabin

    /* 0x1A0 */ Sprite_UNK28 unk1A0[2]; // maybe

    /* 0x1B0 */ Sprite unk1B0; // pilot
    /* 0x1E0 */ Sprite unk1E0; // gun
    /* 0x210 */ Sprite_UNK28 unk210; // maybe

    /* 0x218 */ Sprite unk218; // gun base

    /* 0x248 */ s8 unk248[8];
    /* 0x250 */ SpriteTransform transform;

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
extern const TileInfo gUnknown_080D79D0[];
extern const u16 gUnknown_080D7F94[2];

// stage intro related
extern void sub_802EF68(s16, s16, u8);

void Task_EggSaucerMain(void);
void TaskDestructor_EggSaucerMain(struct Task *);

#define BOSS_SPEED            5
#define BOSS_INTRO_SPEED      4
#define BOSS_ROTATE_SPEED_DEG 0.7038123167155426 // 2 sin units

#define BOSS_HEIGHT 100

void CreateEggSaucer(void)
{
    u8 i;
    u32 r2;
    EggSaucer *boss;
    struct TransitionState *unk134;
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
    unk134->speed = 0;
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

    boss->unkC = Q_24_8(BOSS_SPEED);
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

static void SaucerUpdatePosAndRotate(EggSaucer *);
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
    boss->unk4 += Q_24_8(BOSS_INTRO_SPEED);

    SaucerUpdatePosAndRotate(boss);
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

    SaucerUpdatePosAndRotate(boss);
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
        boss->unkC = Q_24_8(BOSS_SPEED);
        boss->unk11 = 0;
        gCurTask->main = sub_80435BC;
    }
}

void sub_804598C(void);
void sub_8044540(EggSaucer *);
void sub_8043BEC(EggSaucer *);
void sub_8045564(EggSaucer *);

void sub_80435BC(void)
{
    EggSaucer *boss = TaskGetStructPtr(gCurTask);

    sub_8044540(boss);
    sub_8043BEC(boss);
    sub_8043E2C(boss);
    sub_8045564(boss);

    if (boss->unk13 > 0) {
        boss->unk13--;
    }

    if (Mod(gUnknown_03005590, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (boss->unk15 == 0 && Q_24_8_TO_INT(boss->unkC4) - gCamera.x < 50) {
            boss->unk15 = 1;
        }
    } else {
        if (boss->unk15 == 0 && Q_24_8_TO_INT(boss->unkC4) - gCamera.x < 50) {
            boss->unk15 = 1;
            CreateEggmobileEscapeSequence(Q_24_8_TO_INT(boss->unkC4) - gCamera.x,
                                          Q_24_8_TO_INT(boss->unkC8) - gCamera.y,
                                          SPRITE_FLAG(PRIORITY, 2));
        }
    }
    sub_8045898(boss);

    if (Q_24_8_TO_INT(boss->unkC4) - gCamera.x < -200 && boss->unk15 != 0) {
        sub_802EF68(-40, 140, 4);
        gCurTask->main = sub_804598C;
    }
}

void sub_80436E4(EggSaucer *boss)
{
    u8 i;
    u8 idx;
    s32 x = boss->unk4;
    s32 y = boss->unk8;

    s32 x2, y2;
    boss->unkC4 = x + ((COS(boss->unk16) * 5) >> 3); // * 0.625
    boss->unkC8 = y + ((SIN(boss->unk16) * 5) >> 3);

    boss->unkD4 = Q_8_8(5.5);
    boss->unkD6 = -Q_8_8(4.5);

    x += ((COS(boss->unk30) * 5) >> 3);
    y += ((SIN(boss->unk30) * 5) >> 3);

    boss->unkCC = x;
    boss->unkD0 = y;

    boss->unkD8 = Q_8_8(4.75);
    boss->unkDA = -Q_8_8(4);

    x += Q_24_8(2);
    y -= Q_24_8(17);

    x2 = 0;
    y2 = 0;

    for (i = 0; i < 6; i++) {
        idx = (((boss->unkB6 - 1) - (i + 1) * 4)) & 31;
        x2 += Q_24_8(boss->unk36[0][idx]);
        y2 += Q_24_8(boss->unk36[1][idx]);

        boss->unkDC[i][0] = x + (x2 >> 3);
        boss->unkDC[i][1] = y + (y2 >> 3);
#ifndef NON_MATCHING
        boss->unk10C[i][0] = Q_8_8(5.25) - (PseudoRandom32() & 255) + i * 2 - i * 2;
#else
        boss->unk10C[i][0] = Q_8_8(5.25) - (PseudoRandom32() & 255);
#endif
        boss->unk10C[i][1] = -Q_8_8(4) - (i * Q_8_8(0.25));
    }

    idx = (boss->unkB6 + 229) & 31;
    x2 += boss->unk36[0][idx] * Q_24_8(0.5);
    y2 += boss->unk36[1][idx] * Q_24_8(0.5);
    boss->unk124 = x + ((x2) >> 3);
    boss->unk128 = y + ((y2) >> 3);

    boss->unk12C = Q_8_8(5);
    boss->unk12E = -Q_8_8(5.75);
}

void sub_8043D94(EggSaucer *, s32, s32);

void sub_80438C4(EggSaucer *boss)
{
    Sprite *s;
    SpriteTransform *transform;

    u8 i;
    u8 idx;
    s32 x, y;
    s32 x2, y2;

    x = Q_24_8_TO_INT(boss->unk4) - gCamera.x;
    y = Q_24_8_TO_INT(boss->unk8) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > 300) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    s = &boss->unk170;
    s->x = x + ((COS(boss->unk16) * 5) >> 11);
    s->y = y + ((SIN(boss->unk16) * 5) >> 11);
    sub_8004558(s);
    sub_80051E8(s);

    s = &boss->unk1B0;
    s->x = x + ((COS(boss->unk16) * 5) >> 11);
    s->y = y + ((SIN(boss->unk16) * 5) >> 11);
    sub_8004558(s);
    sub_80051E8(s);

    if (boss->unk11) {
        s = &boss->unk218;
        s->x = x + ((COS(boss->unk18) * 5) >> 11);
        s->y = y + ((SIN(boss->unk18) * 5) >> 11);
        sub_8004558(s);
        sub_80051E8(s);

        s = &boss->unk1E0;
        transform = &boss->transform;
        s->x = x + ((COS(boss->unk18) * 5) >> 11) - 2;
        s->y = y + ((SIN(boss->unk18) * 5) >> 11) - 0x13;
        s->unk10 = gUnknown_030054B8++ | 0x1060;

        transform->unk0 = boss->unk1A;
        transform->width = 0x100;
        transform->height = 0x100;
        transform->x = s->x;
        transform->y = s->y;
        sub_8004558(s);
        sub_8004860(s, transform);
        sub_80051E8(s);

        if (PLAYER_IS_ALIVE && (boss->unk1C > 0 && boss->unk1C < 12)) {
            s = &boss->unk25C;
            sub_8004558(s);
            sub_80051E8(s);
        }
    }

    s = &boss->unk28C;
    x += (COS(boss->unk30) * 5) >> 11;
    y += (SIN(boss->unk30) * 5) >> 11;

    s->x = x;
    s->y = y;
    sub_80051E8(s);

    x += 2;
    y -= 17;

    x2 = 0;
    y2 = 0;

    s = &boss->unk2C4;

    for (i = 0; i < 6; i++) {
        idx = (boss->unkB6 - (i + 1) * 4) & 31;
        x2 += (boss->unk36[0][idx]);
        y2 += (boss->unk36[1][idx]);
        s->x = x + (x2 >> 3);
        s->y = y + (y2 >> 3);
        s->unk1A = (19 - i) * 0x40;
        sub_80051E8(s);
    }

    s = &boss->unk2F4;

#ifndef NON_MATCHING
    do {
#endif
        idx = (boss->unkB6 - 28) & 31;
        x2 += boss->unk36[0][idx] >> 1;
        y2 += boss->unk36[1][idx] >> 1;
#ifndef NON_MATCHING
    } while (0);
#endif

    s->x = x + ((x2) >> 3);
    s->y = y + ((y2) >> 3);

    sub_8004558(s);
    sub_80051E8(s);

    if (boss->unkC0) {
        sub_8043D94(boss, (x + ((x2) >> 3)) - 0x10, y + ((y2) >> 3));
    }
}

void sub_8043BEC(EggSaucer *boss)
{
    Sprite *s;
    u8 i;
    s32 x, y;
    x = Q_24_8_TO_INT(boss->unk4) - gCamera.x;
    y = Q_24_8_TO_INT(boss->unk8) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > 300) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    s = &boss->unk170;
    s->x = Q_24_8_TO_INT(boss->unkC4) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unkC8) - gCamera.y;
    sub_8004558(s);
    sub_80051E8(s);

    if (boss->unk15 == 0
        || (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
            && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel)) {
        s = &boss->unk1B0;
        s->x = Q_24_8_TO_INT(boss->unkC4) - gCamera.x;
        s->y = Q_24_8_TO_INT(boss->unkC8) - gCamera.y;
        sub_8004558(s);
        sub_80051E8(s);
    }

    s = &boss->unk28C;
    s->x = Q_24_8_TO_INT(boss->unkCC) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unkD0) - gCamera.y;
    sub_80051E8(s);

    s = &boss->unk2C4;
    for (i = 0; i < 6; i++) {
        s->x = Q_24_8_TO_INT(boss->unkDC[i][0]) - gCamera.x;
        s->y = Q_24_8_TO_INT(boss->unkDC[i][1]) - gCamera.y;
        s->unk1A = (19 - i) * 0x40;
        sub_80051E8(s);
    }

    s = &boss->unk2F4;
    s->x = Q_24_8_TO_INT(boss->unk124) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk128) - gCamera.y;
    sub_8004558(s);
    sub_80051E8(s);
}

void sub_8043D94(EggSaucer *boss, s32 x, s32 y)
{
    u8 i;
    u8 temp;
    Sprite *s;

    boss->unkC0--;

    temp = ((COS(boss->unkC0 * 0x10) * 0xF) >> 0xD) + 0x10;

    for (i = 0; i < 8; i++) {
        s = &boss->unk32C[i];
        s->x = ((temp * COS(i * 0x80)) >> 0xE) + x;
        s->y = ((temp * SIN(i * 0x80)) >> 0xE) + y;

        sub_8004558(s);
        sub_80051E8(s);
    }
}

void sub_8043E2C(EggSaucer *boss)
{
    s32 ground;
    s32 x, y;
    s32 bottomX, bottomY;
    Sprite *s;
    SpriteTransform *transform;
    ExplosionPartsInfo explosion;
    if (boss->unk11 == 0 && boss->unk20 == 0) {
        boss->unk24 += 0x10;
        x = boss->unk28 + boss->unk22;
        boss->unk28 = x;
        y = boss->unk2C + boss->unk24;
        boss->unk2C = y;

        bottomX = Q_24_8_TO_INT(x);
        bottomY = Q_24_8_TO_INT(y) + 10;
        ground = sub_801E4E4(bottomY, bottomX, 1, 8, NULL, sub_801EE64);
        if (ground < 0) {
            boss->unk2C += Q_24_8(ground);
            boss->unk22 = Div(-(boss->unk22 * 0x50), 100);
            boss->unk20 = 1;
        }

        s = &boss->unk218;
        s->x = Q_24_8_TO_INT(x) - gCamera.x;
        s->y = Q_24_8_TO_INT(y) - gCamera.y;
        sub_8004558(s);
        sub_80051E8(s);

        s = &boss->unk1E0;
        transform = &boss->transform;
        s->x = (Q_24_8_TO_INT(x) - gCamera.x) - 2;
        s->y = (Q_24_8_TO_INT(y) - gCamera.y) - 19;
        s->unk10 = gUnknown_030054B8++ | 0x1060;

        transform->unk0 = boss->unk1A;
        transform->width = 0x100;
        transform->height = 0x100;
        transform->x = s->x;
        transform->y = s->y;
        sub_8004860(s, transform);
        sub_80051E8(s);

        if (Mod(gUnknown_03005590, 3) == 0) {
            u32 rand;

            rand = PseudoRandom32();
            explosion.spawnX = (Q_24_8_TO_INT(x) - gCamera.x) + (rand & 0xF) - 8;
            rand = PseudoRandom32();
            explosion.spawnY = (Q_24_8_TO_INT(y) - gCamera.y) + (rand & 0xF) - 8;
            explosion.velocity = 0;

            explosion.rotation = ({ 0x41F - (PseudoRandom32() & 63); });
            explosion.speed = 0x500;
            explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
            explosion.anim = SA2_ANIM_EXPLOSION;
            explosion.variant = 0;
            explosion.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk14);
        }
    }
}

void sub_8043FD0(s32 x, s32 y)
{
    u8 i;
    EggSaucer *boss = TaskGetStructPtr(gActiveBossTask);

    boss->unk4 += x;
    boss->unk8 += y;

    boss->unk28 += x;
    boss->unk2C += y;

    boss->unkC4 += x;
    boss->unkC8 += y;

    boss->unkCC += x;
    boss->unkD0 += y;

    for (i = 0; i < 6; i++) {
        boss->unkDC[i][0] += x;
        boss->unkDC[i][1] += y;
    }

    boss->unk124 += x;
    boss->unk128 += y;
}

void sub_80452F8(EggSaucer *boss);
void sub_8045368(EggSaucer *boss);
void sub_8044088(EggSaucer *boss)
{
    u8 i;
    Sprite *s;
    u8 idx;
    s32 x, y;
    u32 temp;
    s = &boss->unk170;

    x = Q_24_8_TO_INT(boss->unk4) + ((COS(boss->unk16) * 5) >> 11);
    y = Q_24_8_TO_INT(boss->unk8) + ((SIN(boss->unk16) * 5) >> 11);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (sub_800CA20(s, x, y, 2, &gPlayer) == 1) {
        sub_80452F8(boss);
    }

    sub_800C320(s, x, y, 1, &gPlayer);

    if (boss->unk13 == 0) {
        if (sub_800C320(s, x, y, 0, &gPlayer) == 1) {
            sub_8045368(boss);
        } else {
            if (sub_800CA20(s, x, y, 0, &gPlayer) == 1) {
                sub_80452F8(boss);
            }
        }
    }

    sub_80122DC(Q_24_8_NEW(x), Q_24_8_NEW(y));

    if (boss->unk13 == 0 && sub_800C418(s, x, y, 0, &gPlayer) == 1) {
        sub_8045368(boss);
        gUnknown_03005498.t->unk15 = 0;
    }

    if (boss->unk11 != 0 && boss->unk1F == 0) {
        s = &boss->unk218;
        x = Q_24_8_TO_INT(boss->unk4) + ((COS(boss->unk18) * 5) >> 11);
        y = Q_24_8_TO_INT(boss->unk8) + ((SIN(boss->unk18) * 5) >> 11);

        s->x = x - gCamera.x;
        s->y = y - gCamera.y;

        if (sub_800CA20(s, x, y, 1, &gPlayer) == 1) {
            sub_80452F8(boss);
        }

        if (sub_800C320(s, x, y, 0, &gPlayer) == 1) {
            boss->unk1F = 0x1E;
            boss->unk11--;

            if (boss->unk11 & 1) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            if (boss->unk11 == 0) {
                u32 temp2, temp3;
                u32 prev = gLevelScore;
                gLevelScore += 500;
                temp2 = Div(gLevelScore, 50000);
                temp3 = Div(prev, 50000);
                if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                    u16 numLives = (temp2 - temp3);
                    numLives += gNumLives;

                    if (numLives > 0xFF) {
                        numLives = 0xFF;
                    }

                    gNumLives = numLives;
                    gUnknown_030054A8.unk3 = 0x10;
                }
            }
        } else {
            if (sub_800CA20(s, x, y, 0, &gPlayer) == 1) {
                sub_80452F8(boss);
            }
        }

        sub_80122DC(Q_24_8_NEW(x), Q_24_8_NEW(y));

        if (boss->unk1F == 0) {
            if (sub_800C418(s, x, y, 0, &gPlayer) == 1) {
                boss->unk1F = 0x1E;
                boss->unk11--;

                if (boss->unk11 & 1) {
                    m4aSongNumStart(SE_143);
                } else {
                    m4aSongNumStart(SE_235);
                }

                gUnknown_03005498.t->unk15 = 0;
                if (boss->unk11 == 0) {
                    u32 temp2, temp3;
                    u32 prev = gLevelScore;
                    gLevelScore += 500;
                    temp2 = Div(gLevelScore, 50000);
                    temp3 = Div(prev, 50000);
                    if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                        u16 numLives = (temp2 - temp3);
                        numLives += gNumLives;

                        if (numLives > 0xFF) {
                            numLives = 0xFF;
                        }

                        gNumLives = numLives;
                        gUnknown_030054A8.unk3 = 0x10;
                    }
                }
            }
        }
        boss->unk28 = Q_24_8_NEW(x - 5);
        boss->unk2C = Q_24_8_NEW(y + 1);
    }

    s = &boss->unk28C;
    x = Q_24_8_TO_INT(boss->unk4) + ((COS(boss->unk30) * 5) >> 11);
    y = Q_24_8_TO_INT(boss->unk8) + ((SIN(boss->unk30) * 5) >> 11);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (sub_800CA20(s, x, y, 0, &gPlayer) == 1) {
        sub_80452F8(boss);
    }

    if (sub_800CA20(s, x, y, 1, &gPlayer) == 1) {
        sub_80452F8(boss);
    }

    x += 2;
    y -= 17;

    for (i = 0; i < 6; i++) {
        idx = (boss->unkB6 - (i + 1) * 4) & 31;
        x += (boss->unk36[0][idx]) >> 3;
        y += (boss->unk36[1][idx]) >> 3;
    }

    s = &boss->unk2F4;
    idx = (boss->unkB6 - 28) & 31;
    x += boss->unk36[0][idx] >> 4;
    y += boss->unk36[1][idx] >> 4;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (sub_800CA20(s, x, y, 1, &gPlayer) == 1) {
        sub_80452F8(boss);
        // insta kill
        gPlayer.moveState |= MOVESTATE_DEAD;
    }

    if (sub_800CA20(s, x, y, 0, &gPlayer) == 1) {
        // Normal hit
        sub_80452F8(boss);
    }
}

static void SaucerUpdatePosAndRotate(EggSaucer *boss)
{
    s32 x, y;
    s32 bottomY, bottomX;
    x = boss->unk4 + boss->unkC;
    boss->unk4 = x;
    y = boss->unk8 + boss->unkE;
    boss->unk8 = y;

    bottomX = Q_24_8_TO_INT(x);
    bottomY = Q_24_8_TO_INT(y) + (BOSS_HEIGHT / 2);

    boss->unk8 += Q_24_8(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));

    boss->unk16
        = ({ (boss->unk16 + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
    boss->unk18
        = ({ (boss->unk18 + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
    boss->unk30
        = ({ (boss->unk30 + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
}

void sub_8044540(EggSaucer *boss)
{
    u8 i;
    s32 res;
    s32 bottomX, bottomY;
    if (boss->unkC > 0) {
        boss->unkC -= 2;
    }

    boss->unk4 += boss->unkC;
    boss->unk8 += boss->unkE;

    bottomX = Q_24_8_TO_INT(boss->unk4);
    bottomY = Q_24_8_TO_INT(boss->unk8) + (BOSS_HEIGHT / 2);

    boss->unk8 += Q_24_8(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));
    boss->unkD6 += 0x30;

    boss->unkC4 += boss->unkD4;
    boss->unkC8 += boss->unkD6;

    bottomX = Q_24_8_TO_INT(boss->unkC4);
    bottomY = Q_24_8_TO_INT(boss->unkC8);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->unkC8 += Q_24_8_NEW(res);
        boss->unkD6 = Div(-0x46 * boss->unkD6, 100);
        boss->unkD4 -= 24;
    }

    boss->unkDA += 0x3D;
    boss->unkCC += boss->unkD8;
    boss->unkD0 += boss->unkDA;

    bottomX = Q_24_8_TO_INT(boss->unkCC);
    bottomY = Q_24_8_TO_INT(boss->unkD0);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->unkD0 += Q_24_8_NEW(res);
        boss->unkDA = Div(-0x41 * boss->unkDA, 100);
        boss->unkD8 -= 34;
    }

    for (i = 0; i < 6; i++) {
        boss->unk10C[i][1] += 0x38;
        boss->unkDC[i][0] += boss->unk10C[i][0];
        boss->unkDC[i][1] += boss->unk10C[i][1];

        bottomX = Q_24_8_TO_INT(boss->unkDC[i][0]);
        bottomY = Q_24_8_TO_INT(boss->unkDC[i][1]);
        res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
        if (res < 0) {
            boss->unkDC[i][1] += Q_24_8_NEW(res);
            boss->unk10C[i][1] = Div(boss->unk10C[i][1] * (i - 0x41), 100);
            boss->unk10C[i][0] += (i - 0x33);
        }
    }

    boss->unk12E += 0x40;
    boss->unk124 += boss->unk12C;
    boss->unk128 += boss->unk12E;

    bottomX = Q_24_8_TO_INT(boss->unk124);
    bottomY = Q_24_8_TO_INT(boss->unk128);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->unk128 += Q_24_8_NEW(res);
        boss->unk12E = Div(-0x3C * boss->unk12E, 100);
        boss->unk12C -= 0x34;
    }
}

extern void sub_802E784(u16, u16, u16, s16 x, s16 y, s16);

extern const u16 gUnknown_080D7F94[2];

void sub_8044784(EggSaucer *boss)
{
    s32 x, y;
    Sprite *s;
    bool32 someBool;
    u16 temp;

    struct TransitionState *transition = &boss->unk134;

    if (!PLAYER_IS_ALIVE) {
        if (transition->unk4 != 0x2000) {
            transition->unk4 = 0x2000;
            NextTransitionFrame(transition);
        }
        gFlags &= ~FLAGS_4;
        return;
    }

    if (boss->unk11 == 0) {
        transition->unk4 = 0x2000;
        NextTransitionFrame(transition);
        gFlags &= ~FLAGS_4;
        return;
    }

    x = (Q_24_8_TO_INT(boss->unk4) - gCamera.x);
    x += ((COS(boss->unk18) * 5) >> 11);
    x += ((COS(boss->unk1A) * 3) >> 11);

    y = (Q_24_8_TO_INT(boss->unk8) - gCamera.y);
    y += (SIN(boss->unk18) * 5) >> 11;
    y -= 0x12;
    y += (SIN(boss->unk1A) * 3) >> 11;

    someBool = FALSE;
    if (boss->unk1E != 0 && boss->unk1C == 0) {
        transition->unk4 = 0x2000 - Q_8_8((--boss->unk1E));
        sub_802E784(boss->unk1A, boss->unk1E + 8, 6, x, y, 0x20);

        someBool = TRUE;
        if (boss->unk1E == 0) {
            boss->unk1C = gUnknown_080D7F94[boss->unk10 > 4 ? 1 : 0];
        }
    } else {
        s32 tmp;
        transition->unk4 = 0x2000;
        tmp = boss->unk1C;
        boss->unk1C--;
        if (boss->unk1C == 0) {
            m4aSongNumStart(SE_252);
            boss->unk1E = 0x10;
        } else if (boss->unk1C >= 0xB && boss->unk1C < 40) {
            transition->unk4 = 0x2000 - ((tmp - 0xB) * 0x80);
            sub_802E784(boss->unk1A, 10, 6, x, y, 0x20);
        }

        if (boss->unk1C < 0xD) {
            s = &boss->unk25C;
            s->x = x;
            s->y = y;

            if (boss->unk1C == 0xC) {
                s->unk21 = -1;
                s->graphics.anim = SA2_ANIM_EGG_SAUCER_GUN_PROJ;
                s->variant = 0;
            }
        }
    }

    NextTransitionFrame(transition);

    y = Q_24_8_TO_INT(gPlayer.y);
    y += 0x13;
    y -= (Q_24_8_TO_INT(boss->unk8) + ((SIN(boss->unk18) * 5) >> 11));
    x = ({
        s32 temp3;
        x = (Q_24_8_TO_INT(gPlayer.x));
        temp3 = x + 2;
        temp3 - (Q_24_8_TO_INT(boss->unk4) + ((COS(boss->unk18) * 5) >> 11));
    });
    temp = sub_8004418(y, x);
    if (gUnknown_03005590 & 1) {
        if (boss->unk1A < temp) {
            if (boss->unk1A <= 0x23F) {
                boss->unk1A += 1;
            }
        } else {
            if (boss->unk1A >= 0x1C1) {
                boss->unk1A -= 1;
            }
        }
    }
    if (someBool && (boss->unk1A - 0x10) < temp && (boss->unk1A + 0x10) > temp) {
        sub_800CBA4(&gPlayer);
    }
}

// matched
void sub_8044A14(EggSaucer *boss)
{
    Sprite *s;

    s32 val;
    s32 temp;
    temp = SIN((gUnknown_03005590 << 4) & (SIN_PERIOD - 1));
    boss->unk32 = CLAMP_SIN_PERIOD(((temp) >> 9) + 1000);
    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = (COS(boss->unk32) * 5) >> 11;

    if (boss->unkB8 < val) {
        boss->unkB8 += 2;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 2;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = (SIN(boss->unk32) * 5) >> 11;
    if (boss->unkBA < val) {
        boss->unkBA += 2;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 2;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    boss->unkBC++;

    if (boss->unkBC > 0x77) {
        boss->unkBC = 0;
        boss->unkBF = 1;
    }

    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;

    s = &boss->unk2F4;
    // disable collision
    s->unk28[0].unk0 = -1;
    s->unk28[1].unk0 = -1;
}

void sub_8044B28(EggSaucer *boss)
{
    Sprite *s;
    s32 val;
    s32 temp;

    temp = SIN((gUnknown_03005590 << 4) & (SIN_PERIOD - 1));
    boss->unk32 = CLAMP_SIN_PERIOD(((temp) >> 9) + 1000);
    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = (COS(boss->unk32) * 5) >> 10;

    if (boss->unkB8 < val) {
        boss->unkB8 += 2;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 2;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = (SIN(boss->unk32) * 5) >> 10;
    if (boss->unkBA < val) {
        boss->unkBA += 2;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 2;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    if (++boss->unkBC >= 0x50) {
        if (boss->unk11 != 0 || (PseudoRandom32() & 1)) {
            boss->unkBC = 0;
            boss->unkBE = 0x40;
            boss->unkBF = 2;
        } else {
            if (gUnknown_03005590 & 2) {
                boss->unkBC = 0;
                boss->unkBE = 0x40;
                boss->unkBF = 4;

            } else {
                boss->unkBC = 0;
                boss->unkBE = 0x60;
                boss->unkBF = 5;
            }
        }
        s = &boss->unk2F4;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 1;
        s->unk21 = -1;
    } else {
        if (boss->unkBC == 0x46) {
            m4aSongNumStart(SE_250);
        }
    }

    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;
}

void sub_8044CBC(EggSaucer *boss)
{
    u8 i;
    s32 val;
    Sprite *s;
#ifndef NON_MATCHING
    register u8 r3 asm("r3");
#endif
    if (boss->unkBE == 64) {
        s32 x, y;
        x = Q_24_8_TO_INT(boss->unk4);
        y = Q_24_8_TO_INT(boss->unk8);

        x += ((COS(boss->unk30) * 5) >> 11);
        y += (SIN(boss->unk30) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = Q_24_8_TO_INT(gPlayer.x) - x;
        y = Q_24_8_TO_INT(gPlayer.y) - y;
        boss->unk32 = sub_8004418(y, x);
    }

    if (boss->unkBE == 0x1B) {
        m4aSongNumStart(SE_251);
        boss->unkC0 = 0x10;

        for (i = 0; i < 8; i++) {
            s = &boss->unk32C[i];
            s->graphics.anim = gUnknown_080D7FB0[i].anim;
            s->variant = gUnknown_080D7FB0[i].variant;
            s->unk21 = -1;
        }
    }
    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = (COS(boss->unk32) * 5) >> 10;

    if (boss->unkB8 < val) {
        boss->unkB8 += 10;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 10;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = (SIN(boss->unk32) * 5) >> 10;
    if (boss->unkBA < val) {
        boss->unkBA += 10;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 10;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    boss->unkBE--;
#ifndef NON_MATCHING
    r3 = 0xff;
#endif

    if (boss->unkBE == 0) {
        if (boss->unk11 != 0) {
            boss->unkBF = 0;
            s = &boss->unk2F4;
            s->unk28[0].unk0 = -1;
            s->unk28[1].unk0 = -1;
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
            s->variant = 2;
#ifndef NON_MATCHING
            s->unk21 |= r3;
#else
            s->unk21 = -1;
#endif
        } else {
            boss->unkBF = 3;
            boss->unkBE = 0x7F;
        }
    }
    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;
}

void sub_8044EB0(EggSaucer *boss)
{
    Sprite *s;
    s32 val, temp, index;
#ifndef NON_MATCHING
    register u8 r2 asm("r2");
#endif
    index = CLAMP_SIN_PERIOD(boss->unkBE << 4);
    temp = SIN(index);
    boss->unk32 = CLAMP_SIN_PERIOD(((temp * 5) >> 11) + boss->unk32);
    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = (COS(boss->unk32) * 5) >> 10;

    if (boss->unkB8 < val) {
        boss->unkB8 += 10;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 10;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = (SIN(boss->unk32) * 5) >> 10;
    if (boss->unkBA < val) {
        boss->unkBA += 10;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 10;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    boss->unkBE--;
#ifndef NON_MATCHING
    r2 = 0xFF;
#endif

    if (boss->unkBE == 0) {
        boss->unkBF = 0;
        s = &boss->unk2F4;
        s->unk28[0].unk0 = -1;
        s->unk28[1].unk0 = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->unk21 |= r2;
#else
        s->unk21 = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;
}

void sub_8044FE4(EggSaucer *boss)
{
    u8 i;
    s32 val;
    Sprite *s;
#ifndef NON_MATCHING
    register u8 r3 asm("r3");
#endif
    if (boss->unkBE == 64) {
        s32 x, y;
        x = Q_24_8_TO_INT(boss->unk4);
        y = Q_24_8_TO_INT(boss->unk8);

        x += ((COS(boss->unk30) * 5) >> 11);
        y += (SIN(boss->unk30) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = Q_24_8_TO_INT(gPlayer.x) - x;
        y = Q_24_8_TO_INT(gPlayer.y) - y;
        boss->unk32 = sub_8004418(y, x);
    }

    if (boss->unkBE == 0x1B) {
        m4aSongNumStart(SE_251);
        boss->unkC0 = 0x10;

        for (i = 0; i < 8; i++) {
            s = &boss->unk32C[i];
            s->graphics.anim = gUnknown_080D7FB0[i].anim;
            s->variant = gUnknown_080D7FB0[i].variant;
            s->unk21 = -1;
        }
    }

    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = (COS(boss->unk32) * 5) >> 9;

    if (boss->unkB8 < val) {
        boss->unkB8 += 10;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 10;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = (SIN(boss->unk32) * 5) >> 9;
    if (boss->unkBA < val) {
        boss->unkBA += 10;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 10;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    boss->unkBE--;
#ifndef NON_MATCHING
    r3 = 0xff;
#endif
    if (boss->unkBE == 0) {
        boss->unkBF = 0;
        s = &boss->unk2F4;
        s->unk28[0].unk0 = -1;
        s->unk28[1].unk0 = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->unk21 |= r3;
#else
        s->unk21 = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;
}

void sub_80451C4(EggSaucer *boss)
{
    Sprite *s;
    s32 val, temp, index;
#ifndef NON_MATCHING
    register u8 r2 asm("r2");
#endif
    boss->unk32 -= 0xC;
    boss->unk32 &= (SIN_PERIOD - 1);

    boss->unk36[0][boss->unkB6] = boss->unkB8;
    boss->unk36[1][boss->unkB6] = boss->unkBA;

    val = ((COS(boss->unk32) * 0x13) - (boss->unkBE >> 4)) >> 11;

    if (boss->unkB8 < val) {
        boss->unkB8 += 10;
        if (boss->unkB8 > val) {
            boss->unkB8 = val;
        }
    } else {
        boss->unkB8 -= 10;
        if (boss->unkB8 < val) {
            boss->unkB8 = val;
        }
    }

    val = ((SIN(boss->unk32) * 0x13) - (boss->unkBE >> 4)) >> 11;
    if (boss->unkBA < val) {
        boss->unkBA += 10;
        if (boss->unkBA > val) {
            boss->unkBA = val;
        }
    } else {
        boss->unkBA -= 10;
        if (boss->unkBA < val) {
            boss->unkBA = val;
        }
    }

    boss->unkBE--;
#ifndef NON_MATCHING
    r2 = 0xff;
#endif
    if (boss->unkBE == 0) {
        boss->unkBF = 0;
        s = &boss->unk2F4;
        s->unk28[0].unk0 = -1;
        s->unk28[1].unk0 = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->unk21 |= r2;
#else
        s->unk21 = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 0x1F;
}

void sub_80452F8(EggSaucer *boss)
{
    Sprite *s = &boss->unk1B0;
    if (boss->unk13 == 0) {
        boss->unk12 = 0x1E;
        if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
             && gSelectedCharacter == CHARACTER_SONIC)
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 1;

        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 1;
        }
        s->unk21 = -1;
    }
}

void sub_8045368(EggSaucer *boss)
{
    Sprite *s = &boss->unk1B0;
    boss->unk10--;

    if ((boss->unk10 & 1)) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    boss->unk13 = 30;
    boss->unk12 = 0;
    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (!boss->unk10) {
            u32 temp2, temp3, prev;
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 3;

            prev = gLevelScore;
            gLevelScore += 1000;
            temp2 = Div(gLevelScore, 50000);
            temp3 = Div(prev, 50000);
            if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                u16 numLives = (temp2 - temp3);
                numLives += gNumLives;

                if (numLives > 0xFF) {
                    numLives = 0xFF;
                }

                gNumLives = numLives;
                gUnknown_030054A8.unk3 = 0x10;
            }

        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 2;
        }
    } else {
        if (!boss->unk10) {
            u32 temp2, temp3, prev;
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 3;

            prev = gLevelScore;
            gLevelScore += 1000;
            temp2 = Div(gLevelScore, 50000);
            temp3 = Div(prev, 50000);
            if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                u16 numLives = (temp2 - temp3);
                numLives += gNumLives;

                if (numLives > 0xFF) {
                    numLives = 0xFF;
                }

                gNumLives = numLives;
                gUnknown_030054A8.unk3 = 0x10;
            }
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 2;
        }
    }
    s->unk21 = -1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
        && boss->unk10 == 4) {
        gUnknown_030054A8.unk1 = 0x11;
    }
}

void sub_80454A4(EggSaucer *boss)
{
    Sprite *s;
    bool32 someBool = FALSE;

    if (boss->unk13 == 0 || --boss->unk13 != 0) {
        if (boss->unk12 != 0 && --boss->unk12 == 0) {
            someBool = TRUE;
        }
        if (!someBool) {
            return;
        }
    }

    s = &boss->unk1B0;

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (!boss->unk10) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 0;
        }
    } else {
        if (!boss->unk10) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 0;
        }
    }
    s->unk21 = -1;
}

// void sub_8045564(EggSaucer *boss)
// {
//     s32 val;
//     u32 rand;
//     s32 index;
//     u8 val2;
//     ExplosionPartsInfo e;

//     if (boss->unk15 == 0) {
//         val = Mod(gUnknown_03005590, 7);
//         if (val == 0) {
//             rand = (PseudoRandom32() & 0x1f) + 0x18;
//             index = CLAMP_SIN_PERIOD(gUnknown_03005590 * 900);
//             e.spawnX
//                 = (Q_24_8_TO_INT(boss->unk4) - gCamera.x) + (rand * (COS(index) >>
//                 14));
//             e.spawnY
//                 = (Q_24_8_TO_INT(boss->unk8) - gCamera.y) + (rand * (SIN(index) >>
//                 14));
//             e.velocity = 0;
//             rand = (PseudoRandom32() & 0x3F);
//             e.rotation = 0x407 - rand;
//             e.speed = 0x500;
//             e.vram = OBJ_VRAM0 + 0x2980;
//             e.anim = SA2_ANIM_EXPLOSION;
//             e.variant = 0;
//             e.unk4 = val;
//             CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
//         }

//         val = Mod(gUnknown_03005590, 10);
//         if (val == 0) {
//             rand = (PseudoRandom32() & 0x1f) + 0x18;
//             index = CLAMP_SIN_PERIOD(gUnknown_03005590 * 900);
//             val2 = Mod(gUnknown_03005590, 6);
//             e.spawnX
//                 = (Q_24_8_TO_INT(boss->unk4) - gCamera.x) + (rand * (COS(index) >>
//                 14));
//             e.spawnY
//                 = (Q_24_8_TO_INT(boss->unk8) - gCamera.y) + (rand * (SIN(index) >>
//                 14));
//             e.velocity = 0x40;
//             rand = (PseudoRandom32() & 0x3FF);
//             e.rotation = rand;
//             e.speed = 0x600;
//             e.vram = OBJ_VRAM0 + (gUnknown_080D79D0[val2].numTiles * 0x20);
//             e.anim = gUnknown_080D79D0[val2].anim;
//             e.variant = gUnknown_080D79D0[val2].variant;
//             e.unk4 = val;
//             CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
//         }

//         val = Mod(gUnknown_03005590, 9);
//         if (val == 0) {
//             rand = PseudoRandom32();
//             e.spawnX = (Q_24_8_TO_INT(boss->unkC4) - gCamera.x) + (rand & 0xF) - 8;
//             rand = PseudoRandom32();
//             e.spawnY = (Q_24_8_TO_INT(boss->unkC8) - gCamera.y) + (rand & 0xF) - 8;
//             e.velocity = 0;

//             e.rotation = ({ 0x407 - (PseudoRandom32() & 63); });
//             e.speed = 0x500;
//             e.vram = (void *)OBJ_VRAM0 + 0x2980;
//             e.anim = SA2_ANIM_EXPLOSION;
//             e.variant = 0;
//             e.unk4 = 0;
//             CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
//         }

//         val = Mod(gUnknown_03005590, 0xB);
//         if (val == 0) {
//             rand = PseudoRandom32();
//             e.spawnX = (Q_24_8_TO_INT(boss->unkCC) - gCamera.x) + (rand & 0xF) - 8;
//             rand = PseudoRandom32();
//             e.spawnY = (Q_24_8_TO_INT(boss->unkD0) - gCamera.y) + (rand & 0xF) - 8;
//             e.velocity = 0;

//             e.rotation = ({ 0x407 - (PseudoRandom32() & 63); });
//             e.speed = 0x500;
//             e.vram = (void *)OBJ_VRAM0 + 0x2980;
//             e.anim = SA2_ANIM_EXPLOSION;
//             e.variant = 0;
//             e.unk4 = 0;
//             CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
//         }
//     }
// }

// extern const u16 gUnknown_080D8010[];
// extern const u16 gUnknown_080D7FF0[][0x10];

// void sub_8045898(EggSaucer *boss)
// {
//     u8 i;
//     u32 val;
//     if (boss->unk15 == 0) {
//         val = (gUnknown_03005590 & 2) >> 1;
//         if (boss->unk13 == 0) {
//             for (i = 0; i < 0x10; i++) {
//                 gObjPalette[i + 0x80] = gUnknown_080D7FF0[1][i];
//             }
//         } else {
//             for (i = 0; i < 0x10; i++) {
//                 gObjPalette[i + 0x80] = gUnknown_080D7FF0[val][i];
//             }
//         }

//         if (boss->unk1F == 0) {

//             for (i = 0; i < 0x10; i++) {
//                 gObjPalette[i + 0x90] = gUnknown_080D7FF0[1][i];
//             }
//         } else {
//             boss->unk1F--;
//             for (i = 0; i < 0x10; i++) {
//                 gObjPalette[i + 0x90] = gUnknown_080D7FF0[val][i];
//             }
//         }

//         gFlags |= 2;
//     }
// }

// void sub_804598C(void) { TaskDestroy(gCurTask); }

// void sub_80459A0(EggSaucer *boss)
// {
//     if (boss->unk11 == 0 && boss->unk30 != (boss->unk16 + 0x200) & (SIN_PERIOD - 1)) {
//         boss->unk30 = (boss->unk30 + 1) & (SIN_PERIOD - 1);
//     }
// }

// void TaskDestructor_EggSaucerMain(struct Task *t)
// {
//     EggSaucer *boss = TaskGetStructPtr(t);
//     VramFree(boss->vram);
//     gActiveBossTask = NULL;
// }
