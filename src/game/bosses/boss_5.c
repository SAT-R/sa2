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

#include "game/screen_fade.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"
#include "constants/animations.h"
#include "flags.h"

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 x;
    /* 0x08 */ s32 y;

    /* 0x0C */ s16 unkC; // speedX
    /* 0x0E */ s16 unkE; // speedY

    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 unk11;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 unk15;

    /* 0x16 */ u16 cabinDiskAngle;
    /* 0x18 */ u16 gunDiskAngle;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 unk1C;

    /* 0x1E */ u8 unk1E;
    /* 0x1F */ u8 unk1F;
    /* 0x20 */ u8 unk20;

    /* 0x22 */ s16 unk22;
    /* 0x24 */ s16 unk24;

    /* 0x28 */ s32 unk28;
    /* 0x2C */ s32 unk2C;

    /* 0x30 */ u16 armDiskAngle;
    /* 0x32 */ u16 unk32;

    /* 0x34 */ s16 unk34;

    /* 0x36 */ s16 unk36[2][32];
    /* 0xB6 */ u8 unkB6;

    /* 0xB8 */ s16 unkB8;
    /* 0xBA */ s16 unkBA;
    /* 0xBC */ u16 unkBC;

    /* 0xBE */ u8 armStateTimer;
    /* 0xBF */ u8 armState;
    /* 0xC0 */ u8 unkC0;

    /* 0xC4 */ s32 cabinX;
    /* 0xC8 */ s32 cabinY;

    /* 0xCC */ s32 armBaseX;
    /* 0xD0 */ s32 armBaseY;

    /* 0xD4 */ s16 unkD4;
    /* 0xD6 */ s16 unkD6;

    /* 0xD8 */ s16 unkD8;
    /* 0xDA */ s16 unkDA;

    /* 0xDC */ s32 unkDC[6][2];

    /* 0x10C */ s16 unk10C[6][2];

    /* 0x124 */ s32 handX;
    /* 0x128 */ s32 handY;
    /* 0x12C */ s16 unk12C;
    /* 0x12E */ s16 unk12E;

    /* 0x130 */ s16 introTimer;

    /* 0x134 */ ScreenFade screenTransition;

    /* 0x140 */ Sprite disk;
    /* 0x170 */ Sprite cabin;

    /* 0x1A0 */ Hitbox cabinReserved[2];

    /* 0x1B0 */ Sprite pilot;
    /* 0x1E0 */ Sprite gun;
    /* 0x210 */ Hitbox gunReserved;

    /* 0x218 */ Sprite gunBase;

    /* 0x248 */ Hitbox gunBaseReserved;

    /* 0x250 */ SpriteTransform transform;

    /* 0x25C */ Sprite gunCharge;
    /* 0x28C */ Sprite armBase;
    /* 0x2BC */ Hitbox armReserved;

    /* 0x2C4 */ Sprite armSegment; // arm segment

    /* 0x2F4 */ Sprite hand;
    /* 0x324 */ Hitbox handReserved;

    /* 0x32C */ Sprite smackParticles[8];

    /* 0x4AC */ void *vram;
} EggSaucer; /* 0x4B0 */

// Attack speeds?
const u16 gUnknown_080D7F94[2]
    = { 4 * GBA_FRAMES_PER_SECOND, 8 * GBA_FRAMES_PER_SECOND };

typedef void (*EggSaucerCallback)(EggSaucer *);

static void sub_8044A14(EggSaucer *);
static void sub_8044B28(EggSaucer *);
static void sub_8044CBC(EggSaucer *);
static void sub_8044EB0(EggSaucer *);
static void sub_8044FE4(EggSaucer *);
static void sub_80451C4(EggSaucer *);

static const EggSaucerCallback gArmFunctions[] = {
    sub_8044A14, sub_8044B28, sub_8044CBC, sub_8044EB0, sub_8044FE4, sub_80451C4,
};

static const TileInfo gUnknown_080D7FB0[] = {
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_RIGHT, 0 },
    { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_RIGHT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN, 0 },
    { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_LEFT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_LEFT, 0 },
    { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_LEFT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP, 0 },
    { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_RIGHT, 0 },
};

static const u16 gUnknown_080D7FF0[][0x10] = {
    INCBIN_U16("graphics/80D7FF0.gbapal"),
    INCBIN_U16("graphics/80D8010.gbapal"),
};

// stage intro related
extern void sub_802EF68(s16, s16, u8);
extern void sub_802E784(u16, u16, u16, s16 x, s16 y, s16);

void Task_EggSaucerIntro(void);
void TaskDestructor_EggSaucerMain(struct Task *);
static void SaucerUpdatePosAndRotate(EggSaucer *);
void sub_8044784(EggSaucer *);

void sub_80459A0(EggSaucer *);
void sub_80454A4(EggSaucer *);
void sub_80438C4(EggSaucer *);
void sub_8045898(EggSaucer *);
void sub_804598C(void);
void sub_8044540(EggSaucer *);
void sub_8043BEC(EggSaucer *);
void sub_8045564(EggSaucer *);
void sub_8043D94(EggSaucer *, s32, s32);
void sub_80452F8(EggSaucer *boss);
void sub_8045368(EggSaucer *boss);

void HandleCollision(EggSaucer *);
void sub_8043E2C(EggSaucer *);
void sub_80436E4(EggSaucer *);

void sub_80435BC(void);

void sub_804352C(void);

#define BOSS_SPEED            5
#define BOSS_INTRO_SPEED      4
#define BOSS_ROTATE_SPEED_DEG 0.7038123167155426 // 2 sin units

#define BOSS_HEIGHT 100

#define PILOT_TILES 15

void CreateEggSaucer(void)
{
    u8 i;
    u32 r2;
    EggSaucer *boss;
    ScreenFade *fade;
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
    gPseudoRandom = gStageTime;

    m4aSongNumStart(SE_253);

    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gActiveBossTask = TaskCreate(Task_EggSaucerIntro, sizeof(EggSaucer), 0x4000, 0,
                                 TaskDestructor_EggSaucerMain);
    boss = TASK_DATA(gActiveBossTask);

    fade = &boss->screenTransition;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->brightness = 0;
    fade->flags = 2;
    fade->speed = 0;
    fade->bldCnt
        = (BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_BD
           | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3);
    fade->bldAlpha = 0;

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
        boss->x = Q_24_8(23044);
        boss->y = Q_24_8(140);
    } else {
        boss->x = Q_24_8(540);
        boss->y = Q_24_8(140);
    }

    boss->introTimer = 80;

    boss->unkC = Q_24_8(BOSS_SPEED);
    boss->unkE = 0;
    boss->unk12 = 0;
    boss->unk13 = 0;

    boss->cabinDiskAngle = DEG_TO_SIN(120);
    boss->gunDiskAngle = DEG_TO_SIN(0);
    boss->armDiskAngle = DEG_TO_SIN(240);

    boss->unk1A = 0x200;
    boss->unk1C = gUnknown_080D7F94[1] * 2;
    boss->unk1E = 0;
    boss->unk34 = 0;
    boss->unkB6 = 0;
    boss->unk32 = 0;
    boss->unkB8 = 0;
    boss->unkBA = 0;
    boss->unkBC = 0;
    boss->armStateTimer = 0;
    boss->armState = 0;
    boss->unkC0 = 0;
    boss->unk1F = 0;
    boss->unk22 = 0x500;
    boss->unk24 = 0;
    boss->unk28 = 0;
    boss->unk2C = 0;
    boss->unk20 = 0;
    boss->unk14 = 0;
    boss->unk15 = 0;

    for (i = 0; i < 32; i++) {
        boss->unk36[0][i] = 0;
        boss->unk36[1][i] = 0;
    }

    // TODO: add tiles up to make this value
    vram = VramMalloc(0xEA);
    boss->vram = vram;

    // reserved for smack effect
    vram += 24 * TILE_SIZE_4BPP;
    vramBase = boss->vram;

    s = &boss->disk;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)VRAM + 0xC000;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_DISK, 0, 31, 3, SPRITE_FLAG(18, 1));

    sub_80036E0(s);
    sub_8003914(s);

    s = &boss->pilot;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += PILOT_TILES * TILE_SIZE_4BPP;

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
        s->variant = 0;
    } else {
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
        s->variant = 0;
    }
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 20, 1, 0);

    s = &boss->cabin;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 36 * TILE_SIZE_4BPP;

    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_CABIN, 0, 21, 1, 0);
    UpdateSpriteAnimation(s);

    s = &boss->gunBase;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 25 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_GUN_BASE, 0, 22, 1, 0);

    s = &boss->gun;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    // Seems a lot of tiles for this
    vram += 64 * TILE_SIZE_4BPP;
    SPRITE_INIT_ANIM_AND_SCRIPT(s, SA2_ANIM_EGG_SAUCER_GUN, 0, 23);
    s->unk10 = gUnknown_030054B8++ | SPRITE_FLAG(PRIORITY, 1)
        | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

    s = &boss->gunCharge;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 4 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_GUN_CHARGE, 0, 19, 1, 0);

    s = &boss->armBase;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 20 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_ARM_BASE, 0, 20, 1, 0);
    UpdateSpriteAnimation(s);

    s = &boss->armSegment;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 4 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_SAUCER_ARM_SEGMENT, 0, 19, 1, 0);
    UpdateSpriteAnimation(s);

    s = &boss->hand;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_ANIM_AND_SCRIPT(s, SA2_ANIM_EGG_SAUCER_HAND, 0, 12);
    s->hitboxes[1].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

    for (i = 0; i < 8; i++) {
        s = &boss->smackParticles[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vramBase;
        vramBase += gUnknown_080D7FB0[i].numTiles * TILE_SIZE_4BPP;

        SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D7FB0[i].anim,
                                 gUnknown_080D7FB0[i].variant, 11, 1, 0);
    }
}

void Task_EggSaucerIntro(void)
{
    EggSaucer *boss = TASK_DATA(gCurTask);
    // speed
    boss->x += Q_24_8(BOSS_INTRO_SPEED);

    SaucerUpdatePosAndRotate(boss);
    sub_8044784(boss);

    gArmFunctions[boss->armState](boss);

    sub_80459A0(boss);
    sub_80454A4(boss);
    sub_80438C4(boss);
    sub_8045898(boss);

    if (--boss->introTimer == 0) {
        gCurTask->main = sub_804352C;
    }
}

void sub_804352C(void)
{
    EggSaucer *boss = TASK_DATA(gCurTask);

    SaucerUpdatePosAndRotate(boss);
    sub_8044784(boss);

    gArmFunctions[boss->armState](boss);

    sub_80459A0(boss);
    HandleCollision(boss);
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

void sub_80435BC(void)
{
    EggSaucer *boss = TASK_DATA(gCurTask);

    sub_8044540(boss);
    sub_8043BEC(boss);
    sub_8043E2C(boss);
    sub_8045564(boss);

    if (boss->unk13 > 0) {
        boss->unk13--;
    }

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
         && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (boss->unk15 == 0 && Q_24_8_TO_INT(boss->cabinX) - gCamera.x < 50) {
            boss->unk15 = 1;
        }
    } else {
        if (boss->unk15 == 0 && Q_24_8_TO_INT(boss->cabinX) - gCamera.x < 50) {
            boss->unk15 = 1;
            CreateEggmobileEscapeSequence(Q_24_8_TO_INT(boss->cabinX) - gCamera.x,
                                          Q_24_8_TO_INT(boss->cabinY) - gCamera.y,
                                          SPRITE_FLAG(PRIORITY, 2));
        }
    }
    sub_8045898(boss);

    if (Q_24_8_TO_INT(boss->cabinX) - gCamera.x < -200 && boss->unk15 != 0) {
        sub_802EF68(-40, 140, 4);
        gCurTask->main = sub_804598C;
    }
}

void sub_80436E4(EggSaucer *boss)
{
    u8 i;
    u8 idx;
    s32 x = boss->x;
    s32 y = boss->y;

    s32 x2, y2;
    boss->cabinX = x + ((COS(boss->cabinDiskAngle) * 5) >> 3); // * 0.625
    boss->cabinY = y + ((SIN(boss->cabinDiskAngle) * 5) >> 3);

    boss->unkD4 = Q_8_8(5.5);
    boss->unkD6 = -Q_8_8(4.5);

    x += ((COS(boss->armDiskAngle) * 5) >> 3);
    y += ((SIN(boss->armDiskAngle) * 5) >> 3);

    boss->armBaseX = x;
    boss->armBaseY = y;

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

        boss->unk10C[i][0] = Q_8_8(5.25) - (PseudoRandom32() & 255)

#ifndef NON_MATCHING
            + i * 2 - i * 2;
#else
            ;
#endif

        boss->unk10C[i][1] = -Q_8_8(4) - (i * Q_8_8(0.25));
    }

    idx = (boss->unkB6 + 229) & 31;
    x2 += boss->unk36[0][idx] * Q_24_8(0.5);
    y2 += boss->unk36[1][idx] * Q_24_8(0.5);
    boss->handX = x + ((x2) >> 3);
    boss->handY = y + ((y2) >> 3);

    boss->unk12C = Q_8_8(5);
    boss->unk12E = -Q_8_8(5.75);
}

void sub_80438C4(EggSaucer *boss)
{
    Sprite *s;
    SpriteTransform *transform;

    u8 i;
    u8 idx;
    s32 x, y;
    s32 x2, y2;

    x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    y = Q_24_8_TO_INT(boss->y) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > 300) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    s = &boss->cabin;
    s->x = x + ((COS(boss->cabinDiskAngle) * 5) >> 11);
    s->y = y + ((SIN(boss->cabinDiskAngle) * 5) >> 11);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = x + ((COS(boss->cabinDiskAngle) * 5) >> 11);
    s->y = y + ((SIN(boss->cabinDiskAngle) * 5) >> 11);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk11) {
        s = &boss->gunBase;
        s->x = x + ((COS(boss->gunDiskAngle) * 5) >> 11);
        s->y = y + ((SIN(boss->gunDiskAngle) * 5) >> 11);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->gun;
        transform = &boss->transform;
        s->x = x + ((COS(boss->gunDiskAngle) * 5) >> 11) - 2;
        s->y = y + ((SIN(boss->gunDiskAngle) * 5) >> 11) - 19;
        s->unk10 = gUnknown_030054B8++ | 0x1060;

        transform->rotation = boss->unk1A;
        transform->width = 0x100;
        transform->height = 0x100;
        transform->x = s->x;
        transform->y = s->y;
        UpdateSpriteAnimation(s);
        sub_8004860(s, transform);
        DisplaySprite(s);

        if (PLAYER_IS_ALIVE && (boss->unk1C > 0 && boss->unk1C < 12)) {
            s = &boss->gunCharge;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    s = &boss->armBase;
    x += (COS(boss->armDiskAngle) * 5) >> 11;
    y += (SIN(boss->armDiskAngle) * 5) >> 11;

    s->x = x;
    s->y = y;
    DisplaySprite(s);

    x += 2;
    y -= 17;

    x2 = 0;
    y2 = 0;

    s = &boss->armSegment;

    for (i = 0; i < 6; i++) {
        idx = (boss->unkB6 - (i + 1) * 4) & 31;
        x2 += (boss->unk36[0][idx]);
        y2 += (boss->unk36[1][idx]);
        s->x = x + (x2 >> 3);
        s->y = y + (y2 >> 3);
        s->unk1A = (19 - i) * 0x40;
        DisplaySprite(s);
    }

    s = &boss->hand;

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

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unkC0 > 0) {
        sub_8043D94(boss, (x + ((x2) >> 3)) - 16, y + ((y2) >> 3));
    }
}

void sub_8043BEC(EggSaucer *boss)
{
    Sprite *s;
    u8 i;
    s32 x, y;
    x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    y = Q_24_8_TO_INT(boss->y) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > 300) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    s = &boss->cabin;
    s->x = Q_24_8_TO_INT(boss->cabinX) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->cabinY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk15 == 0
        || (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
            && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel)) {
        s = &boss->pilot;
        s->x = Q_24_8_TO_INT(boss->cabinX) - gCamera.x;
        s->y = Q_24_8_TO_INT(boss->cabinY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &boss->armBase;
    s->x = Q_24_8_TO_INT(boss->armBaseX) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->armBaseY) - gCamera.y;
    DisplaySprite(s);

    s = &boss->armSegment;
    for (i = 0; i < 6; i++) {
        s->x = Q_24_8_TO_INT(boss->unkDC[i][0]) - gCamera.x;
        s->y = Q_24_8_TO_INT(boss->unkDC[i][1]) - gCamera.y;
        s->unk1A = (19 - i) * 0x40;
        DisplaySprite(s);
    }

    s = &boss->hand;
    s->x = Q_24_8_TO_INT(boss->handX) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->handY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_8043D94(EggSaucer *boss, s32 x, s32 y)
{
    u8 i;
    u8 temp;
    Sprite *s;

    boss->unkC0--;

    temp = ((COS(boss->unkC0 * 0x10) * 0xF) >> 0xD) + 0x10;

    for (i = 0; i < 8; i++) {
        s = &boss->smackParticles[i];
        s->x = ((temp * COS(i * 128)) >> 14) + x;
        s->y = ((temp * SIN(i * 128)) >> 14) + y;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
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
        boss->unk24 += 16;
        x = boss->unk28 + boss->unk22;
        boss->unk28 = x;
        y = boss->unk2C + boss->unk24;
        boss->unk2C = y;

        bottomX = Q_24_8_TO_INT(x);
        bottomY = Q_24_8_TO_INT(y) + 10;
        ground = sub_801E4E4(bottomY, bottomX, 1, 8, NULL, sub_801EE64);
        if (ground < 0) {
            boss->unk2C += Q_24_8(ground);
            boss->unk22 = Div(-(boss->unk22 * 80), 100);
            boss->unk20 = 1;
        }

        s = &boss->gunBase;
        s->x = Q_24_8_TO_INT(x) - gCamera.x;
        s->y = Q_24_8_TO_INT(y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->gun;
        transform = &boss->transform;
        s->x = (Q_24_8_TO_INT(x) - gCamera.x) - 2;
        s->y = (Q_24_8_TO_INT(y) - gCamera.y) - 19;
        s->unk10 = gUnknown_030054B8++ | 0x1060;

        transform->rotation = boss->unk1A;
        transform->width = 256;
        transform->height = 256;
        transform->x = s->x;
        transform->y = s->y;
        sub_8004860(s, transform);
        DisplaySprite(s);

        if (Mod(gStageTime, 3) == 0) {
            u32 rand;

            rand = PseudoRandom32();
            explosion.spawnX = (Q_24_8_TO_INT(x) - gCamera.x) + (rand & 15) - 8;
            rand = PseudoRandom32();
            explosion.spawnY = (Q_24_8_TO_INT(y) - gCamera.y) + (rand & 15) - 8;
            explosion.velocity = 0;

            explosion.rotation = ({ 1055 - (PseudoRandom32() & 63); });
            explosion.speed = Q_8_8(5);
            explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
            explosion.anim = SA2_ANIM_EXPLOSION;
            explosion.variant = 0;
            explosion.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk14);
        }
    }
}

void EggSaucerMove(s32 dX, s32 dY)
{
    u8 i;
    EggSaucer *boss = TASK_DATA(gActiveBossTask);

    boss->x += dX;
    boss->y += dY;

    boss->unk28 += dX;
    boss->unk2C += dY;

    boss->cabinX += dX;
    boss->cabinY += dY;

    boss->armBaseX += dX;
    boss->armBaseY += dY;

    for (i = 0; i < 6; i++) {
        boss->unkDC[i][0] += dX;
        boss->unkDC[i][1] += dY;
    }

    boss->handX += dX;
    boss->handY += dY;
}

void HandleCollision(EggSaucer *boss)
{
    u8 i;
    Sprite *s;
    u8 idx;
    s32 x, y;
    u32 temp;
    s = &boss->cabin;

    x = Q_24_8_TO_INT(boss->x) + ((COS(boss->cabinDiskAngle) * 5) >> 11);
    y = Q_24_8_TO_INT(boss->y) + ((SIN(boss->cabinDiskAngle) * 5) >> 11);

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
        s = &boss->gunBase;
        x = Q_24_8_TO_INT(boss->x) + ((COS(boss->gunDiskAngle) * 5) >> 11);
        y = Q_24_8_TO_INT(boss->y) + ((SIN(boss->gunDiskAngle) * 5) >> 11);

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
                INCREMENT_SCORE(500);
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
                    INCREMENT_SCORE(500);
                }
            }
        }
        boss->unk28 = Q_24_8_NEW(x - 5);
        boss->unk2C = Q_24_8_NEW(y + 1);
    }

    s = &boss->armBase;
    x = Q_24_8_TO_INT(boss->x) + ((COS(boss->armDiskAngle) * 5) >> 11);
    y = Q_24_8_TO_INT(boss->y) + ((SIN(boss->armDiskAngle) * 5) >> 11);

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

    s = &boss->hand;
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
    x = boss->x + boss->unkC;
    boss->x = x;
    y = boss->y + boss->unkE;
    boss->y = y;

    bottomX = Q_24_8_TO_INT(x);
    bottomY = Q_24_8_TO_INT(y) + (BOSS_HEIGHT / 2);

    boss->y += Q_24_8(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));

    boss->cabinDiskAngle = ({
        (boss->cabinDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1);
    });
    boss->gunDiskAngle = ({
        (boss->gunDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1);
    });
    boss->armDiskAngle = ({
        (boss->armDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1);
    });
}

void sub_8044540(EggSaucer *boss)
{
    u8 i;
    s32 res;
    s32 bottomX, bottomY;
    if (boss->unkC > 0) {
        boss->unkC -= 2;
    }

    boss->x += boss->unkC;
    boss->y += boss->unkE;

    bottomX = Q_24_8_TO_INT(boss->x);
    bottomY = Q_24_8_TO_INT(boss->y) + (BOSS_HEIGHT / 2);

    boss->y += Q_24_8(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));
    boss->unkD6 += 0x30;

    boss->cabinX += boss->unkD4;
    boss->cabinY += boss->unkD6;

    bottomX = Q_24_8_TO_INT(boss->cabinX);
    bottomY = Q_24_8_TO_INT(boss->cabinY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->cabinY += Q_24_8_NEW(res);
        boss->unkD6 = Div(-0x46 * boss->unkD6, 100);
        boss->unkD4 -= 24;
    }

    boss->unkDA += 0x3D;
    boss->armBaseX += boss->unkD8;
    boss->armBaseY += boss->unkDA;

    bottomX = Q_24_8_TO_INT(boss->armBaseX);
    bottomY = Q_24_8_TO_INT(boss->armBaseY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->armBaseY += Q_24_8_NEW(res);
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
    boss->handX += boss->unk12C;
    boss->handY += boss->unk12E;

    bottomX = Q_24_8_TO_INT(boss->handX);
    bottomY = Q_24_8_TO_INT(boss->handY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->handY += Q_24_8_NEW(res);
        boss->unk12E = Div(-60 * boss->unk12E, 100);
        boss->unk12C -= 52;
    }
}

void sub_8044784(EggSaucer *boss)
{
    s32 x, y;
    Sprite *s;
    bool32 someBool;
    u16 temp;

    ScreenFade *fade = &boss->screenTransition;

    if (!PLAYER_IS_ALIVE) {
        if (fade->brightness != Q_24_8(SCREEN_FADE_BLEND_MAX)) {
            fade->brightness = Q_24_8(SCREEN_FADE_BLEND_MAX);
            UpdateScreenFade(fade);
        }
        gFlags &= ~FLAGS_4;
        return;
    }

    if (boss->unk11 == 0) {
        fade->brightness = Q_24_8(SCREEN_FADE_BLEND_MAX);
        UpdateScreenFade(fade);
        gFlags &= ~FLAGS_4;
        return;
    }

    x = (Q_24_8_TO_INT(boss->x) - gCamera.x);
    x += ((COS(boss->gunDiskAngle) * 5) >> 11);
    x += ((COS(boss->unk1A) * 3) >> 11);

    y = (Q_24_8_TO_INT(boss->y) - gCamera.y);
    y += (SIN(boss->gunDiskAngle) * 5) >> 11;
    y -= 0x12;
    y += (SIN(boss->unk1A) * 3) >> 11;

    someBool = FALSE;
    if (boss->unk1E != 0 && boss->unk1C == 0) {
        fade->brightness = Q_24_8(SCREEN_FADE_BLEND_MAX) - Q_8_8((--boss->unk1E));
        sub_802E784(boss->unk1A, boss->unk1E + 8, 6, x, y, 0x20);

        someBool = TRUE;
        if (boss->unk1E == 0) {
            boss->unk1C = gUnknown_080D7F94[boss->unk10 > 4 ? 1 : 0];
        }
    } else {
        s32 tmp;
        fade->brightness = Q_24_8(SCREEN_FADE_BLEND_MAX);
        tmp = boss->unk1C;
        boss->unk1C--;
        if (boss->unk1C == 0) {
            m4aSongNumStart(SE_252);
            boss->unk1E = 0x10;
        } else if (boss->unk1C >= 0xB && boss->unk1C < 40) {
            fade->brightness = 0x2000 - ((tmp - 0xB) * 0x80);
            sub_802E784(boss->unk1A, 10, 6, x, y, 0x20);
        }

        if (boss->unk1C < 0xD) {
            s = &boss->gunCharge;
            s->x = x;
            s->y = y;

            if (boss->unk1C == 0xC) {
                s->prevVariant = -1;
                s->graphics.anim = SA2_ANIM_EGG_SAUCER_GUN_CHARGE;
                s->variant = 0;
            }
        }
    }

    UpdateScreenFade(fade);

    y = Q_24_8_TO_INT(gPlayer.y);
    y += 0x13;
    y -= (Q_24_8_TO_INT(boss->y) + ((SIN(boss->gunDiskAngle) * 5) >> 11));
    x = ({
        s32 temp3;
        x = (Q_24_8_TO_INT(gPlayer.x));
        temp3 = x + 2;
        temp3 - (Q_24_8_TO_INT(boss->x) + ((COS(boss->gunDiskAngle) * 5) >> 11));
    });
    temp = sub_8004418(y, x);
    if (gStageTime & 1) {
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

static void sub_8044A14(EggSaucer *boss)
{
    Sprite *s;

    s32 val;
    s32 temp;
    temp = SIN((gStageTime << 4) & (SIN_PERIOD - 1));
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
        boss->armState = 1;
    }

    boss->unkB6 = (boss->unkB6 + 1) & 31;

    s = &boss->hand;
    // disable collision
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
}

static void sub_8044B28(EggSaucer *boss)
{
    Sprite *s;
    s32 val;
    s32 temp;

    temp = SIN((gStageTime << 4) & (SIN_PERIOD - 1));
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
            boss->armStateTimer = 64;
            boss->armState = 2;
        } else {
            if (gStageTime & 2) {
                boss->unkBC = 0;
                boss->armStateTimer = 64;
                boss->armState = 4;

            } else {
                boss->unkBC = 0;
                boss->armStateTimer = 96;
                boss->armState = 5;
            }
        }
        s = &boss->hand;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 1;
        s->prevVariant = -1;
    } else {
        if (boss->unkBC == 0x46) {
            m4aSongNumStart(SE_250);
        }
    }

    boss->unkB6 = (boss->unkB6 + 1) & 31;
}

static void sub_8044CBC(EggSaucer *boss)
{
    u8 i;
    s32 val;
    Sprite *s;
#ifndef NON_MATCHING
    register u8 r3 asm("r3");
#endif
    if (boss->armStateTimer == 64) {
        s32 x, y;
        x = Q_24_8_TO_INT(boss->x);
        y = Q_24_8_TO_INT(boss->y);

        x += ((COS(boss->armDiskAngle) * 5) >> 11);
        y += (SIN(boss->armDiskAngle) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = Q_24_8_TO_INT(gPlayer.x) - x;
        y = Q_24_8_TO_INT(gPlayer.y) - y;
        boss->unk32 = sub_8004418(y, x);
    }

    if (boss->armStateTimer == 0x1B) {
        m4aSongNumStart(SE_251);
        boss->unkC0 = 16;

        for (i = 0; i < 8; i++) {
            s = &boss->smackParticles[i];
            s->graphics.anim = gUnknown_080D7FB0[i].anim;
            s->variant = gUnknown_080D7FB0[i].variant;
            s->prevVariant = -1;
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

    boss->armStateTimer--;
#ifndef NON_MATCHING
    r3 = 0xff;
#endif

    if (boss->armStateTimer == 0) {
        if (boss->unk11 != 0) {
            boss->armState = 0;
            s = &boss->hand;
            s->hitboxes[0].index = -1;
            s->hitboxes[1].index = -1;
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
            s->variant = 2;
#ifndef NON_MATCHING
            s->prevVariant |= r3;
#else
            s->prevVariant = -1;
#endif
        } else {
            boss->armState = 3;
            boss->armStateTimer = 0x7F;
        }
    }
    boss->unkB6 = (boss->unkB6 + 1) & 31;
}

static void sub_8044EB0(EggSaucer *boss)
{
    Sprite *s;
    s32 val, temp, index;
#ifndef NON_MATCHING
    register u8 r2 asm("r2");
#endif
    index = CLAMP_SIN_PERIOD(boss->armStateTimer << 4);
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

    boss->armStateTimer--;
#ifndef NON_MATCHING
    r2 = 0xFF;
#endif

    if (boss->armStateTimer == 0) {
        boss->armState = 0;
        s = &boss->hand;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->prevVariant |= r2;
#else
        s->prevVariant = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 31;
}

static void sub_8044FE4(EggSaucer *boss)
{
    u8 i;
    s32 val;
    Sprite *s;
#ifndef NON_MATCHING
    register u8 r3 asm("r3");
#endif
    if (boss->armStateTimer == 64) {
        s32 x, y;
        x = Q_24_8_TO_INT(boss->x);
        y = Q_24_8_TO_INT(boss->y);

        x += ((COS(boss->armDiskAngle) * 5) >> 11);
        y += (SIN(boss->armDiskAngle) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = Q_24_8_TO_INT(gPlayer.x) - x;
        y = Q_24_8_TO_INT(gPlayer.y) - y;
        boss->unk32 = sub_8004418(y, x);
    }

    if (boss->armStateTimer == 0x1B) {
        m4aSongNumStart(SE_251);
        boss->unkC0 = 16;

        for (i = 0; i < 8; i++) {
            s = &boss->smackParticles[i];
            s->graphics.anim = gUnknown_080D7FB0[i].anim;
            s->variant = gUnknown_080D7FB0[i].variant;
            s->prevVariant = -1;
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

    boss->armStateTimer--;
#ifndef NON_MATCHING
    r3 = 0xff;
#endif
    if (boss->armStateTimer == 0) {
        boss->armState = 0;
        s = &boss->hand;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->prevVariant |= r3;
#else
        s->prevVariant = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 31;
}

static void sub_80451C4(EggSaucer *boss)
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

    val = ((COS(boss->unk32) * 0x13) - (boss->armStateTimer >> 4)) >> 11;

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

    val = ((SIN(boss->unk32) * 0x13) - (boss->armStateTimer >> 4)) >> 11;
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

    boss->armStateTimer--;
#ifndef NON_MATCHING
    r2 = 0xff;
#endif
    if (boss->armStateTimer == 0) {
        boss->armState = 0;
        s = &boss->hand;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
        s->graphics.anim = SA2_ANIM_EGG_SAUCER_HAND;
        s->variant = 2;
#ifndef NON_MATCHING
        s->prevVariant |= r2;
#else
        s->prevVariant = -1;
#endif
    }
    boss->unkB6 = (boss->unkB6 + 1) & 31;
}

void sub_80452F8(EggSaucer *boss)
{
    Sprite *s = &boss->pilot;
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
        s->prevVariant = -1;
    }
}

void sub_8045368(EggSaucer *boss)
{
    Sprite *s = &boss->pilot;
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
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 2;
        }
    } else {
        if (!boss->unk10) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 2;
        }
    }
    s->prevVariant = -1;

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

    s = &boss->pilot;

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
    s->prevVariant = -1;
}

// (86.11%) https://decomp.me/scratch/wnQsf
NONMATCH("asm/non_matching/game/bosses/boss_5__sub_8045564.inc",
         void sub_8045564(EggSaucer *boss))
{
    s32 index;
    u8 val2;

    if (boss->unk15 == 0) {
        ExplosionPartsInfo e;
        s32 rand;
        if (Mod(gStageTime, 7) == 0) {
            rand = (PseudoRandom32() & 31) + 0x18;
            index = CLAMP_SIN_PERIOD(gStageTime * 900);
            e.spawnX = (Q_24_8_TO_INT(boss->x) - gCamera.x);
            e.spawnX += +((rand * COS(index)) >> 14);
            e.spawnY = (Q_24_8_TO_INT(boss->y) - gCamera.y);
            e.spawnY += ((rand * SIN(index)) >> 14);
            e.velocity = 0;
            e.rotation = ({ 0x407 - (PseudoRandom32() & 0x3F); });
            e.speed = 0x500;
            e.vram = (void *)OBJ_VRAM0 + 0x2980;
            e.anim = SA2_ANIM_EXPLOSION;
            e.variant = 0;
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }
        if (Mod(gStageTime, 10) == 0) {
            rand = (PseudoRandom32() & 31) + 0x18;
            index = CLAMP_SIN_PERIOD(gStageTime * 900);
            val2 = Mod(gStageTime, 6);
            e.spawnX = (Q_24_8_TO_INT(boss->x) - gCamera.x);
            e.spawnX += ((rand * COS(index)) >> 14);
            e.spawnY = (Q_24_8_TO_INT(boss->y) - gCamera.y);
            e.spawnY += ((rand * SIN(index)) >> 14);
            e.velocity = 0x40;
            rand = (PseudoRandom32() & ONE_CYCLE);
            e.rotation = rand;
            e.speed = 0x600;
            e.vram = (void *)OBJ_VRAM0 + (gUnknown_080D79D0[val2][0] * 0x20);
            e.anim = gUnknown_080D79D0[val2][1];
            e.variant = gUnknown_080D79D0[val2][2];
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }

        if (Mod(gStageTime, 9) == 0) {
            rand = PseudoRandom32();
            e.spawnX = (Q_24_8_TO_INT(boss->cabinX) - gCamera.x) + (rand & 0xF) - 8;
            rand = PseudoRandom32();
            e.spawnY = (Q_24_8_TO_INT(boss->cabinY) - gCamera.y) + (rand & 0xF) - 8;
            e.velocity = 0;

            e.rotation = ({ 0x407 - (PseudoRandom32() & 63); });
            e.speed = 0x500;
            e.vram = (void *)OBJ_VRAM0 + 0x2980;
            e.anim = SA2_ANIM_EXPLOSION;
            e.variant = 0;
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }

        if (Mod(gStageTime, 0xB) == 0) {
            rand = PseudoRandom32();
            e.spawnX = (Q_24_8_TO_INT(boss->armBaseX) - gCamera.x) + (rand & 0xF) - 8;
            rand = PseudoRandom32();
            e.spawnY = (Q_24_8_TO_INT(boss->armBaseY) - gCamera.y) + (rand & 0xF) - 8;
            e.velocity = 0;

            e.rotation = ({ 0x407 - (PseudoRandom32() & 63); });
            e.speed = 0x500;
            e.vram = (void *)OBJ_VRAM0 + 0x2980;
            e.anim = SA2_ANIM_EXPLOSION;
            e.variant = 0;
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }
    }
}
END_NONMATCH

void sub_8045898(EggSaucer *boss)
{
    u8 i;
    u32 val;
    if (boss->unk15 == 0) {
        val = (gStageTime & 2) >> 1;
        if (boss->unk13 != 0) {
            for (i = 0; i < 0x10; i++) {
                gObjPalette[i + 0x80] = gUnknown_080D7FF0[val][i];
            }
        } else {
            for (i = 0; i < 0x10; i++) {
                gObjPalette[i + 0x80] = gUnknown_080D7FF0[1][i];
            }
        }

        if (boss->unk1F != 0) {
            boss->unk1F--;
            for (i = 0; i < 0x10; i++) {
                gObjPalette[i + 0x90] = gUnknown_080D7FF0[val][i];
            }
        } else {
            for (i = 0; i < 0x10; i++) {
                gObjPalette[i + 0x90] = gUnknown_080D7FF0[1][i];
            }
        }

        gFlags |= 2;
    }
}

void sub_804598C(void) { TaskDestroy(gCurTask); }

void sub_80459A0(EggSaucer *boss)
{
    if (boss->unk11 == 0
        && boss->armDiskAngle != ((boss->cabinDiskAngle + 0x200) & (SIN_PERIOD - 1))) {
        boss->armDiskAngle = CLAMP_SIN_PERIOD(boss->armDiskAngle + 1);
    }
}

void TaskDestructor_EggSaucerMain(struct Task *t)
{
    EggSaucer *boss = TASK_DATA(t);
    VramFree(boss->vram);
    gActiveBossTask = NULL;
}
