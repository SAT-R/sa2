#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/sa1_sa2_shared/collision.h"

#include "game/save.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"

#include "game/player_callbacks.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/screen_mask.h"

#include "game/stage/screen_fade.h"

#include "lib/m4a/m4a.h"
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

    /* 0x10 */ u8 health;
    /* 0x11 */ u8 gunHealth;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 unk15;

    /* 0x16 */ u16 cabinDiskAngle;
    /* 0x18 */ u16 gunDiskAngle;
    /* 0x1A */ u16 gunAngle;
    /* 0x1C */ u16 unk1C;

    /* 0x1E */ u8 chargeBeamWidth;
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
const u16 gUnknown_080D7F94[2] = { 4 * GBA_FRAMES_PER_SECOND, 8 * GBA_FRAMES_PER_SECOND };

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
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_RIGHT, 0 }, { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_RIGHT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN, 0 },  { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_LEFT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_LEFT, 0 },  { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_LEFT, 0 },
    { 2, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP, 0 },    { 4, SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_RIGHT, 0 },
};

static const u16 gUnknown_080D7FF0[][PALETTE_LEN_4BPP] = {
    INCBIN_U16("graphics/80D7FF0.gbapal"),
    INCBIN_U16("graphics/80D8010.gbapal"),
};

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
    EggSaucer *boss;
    ScreenFade *fade;
    Sprite *s;
    void *vram;
    void *vramBase;

    // The TAS is off by 1 frame here, probably
    // becaues of our constant +12 assumed save time
#if TAS_TESTING
    gInputRecorder.playbackHead++;
#endif

    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x560D;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    INIT_BG_SPRITES_LAYER_64(0);

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    sub_8039ED4();
    gPseudoRandom = gStageTime;

    m4aSongNumStart(SE_253);

    gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    gPlayerLimbsPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerLimbsPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    gActiveBossTask = TaskCreate(Task_EggSaucerIntro, sizeof(EggSaucer), 0x4000, 0, TaskDestructor_EggSaucerMain);
    boss = TASK_DATA(gActiveBossTask);

    fade = &boss->screenTransition;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->brightness = 0;
    fade->flags = 2;
    fade->speed = 0;
    fade->bldCnt = (BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1
                    | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3);
    fade->bldAlpha = 0;

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->health = 6;
        boss->gunHealth = 2;
    } else {
        boss->health = 8;
        boss->gunHealth = 4;
    }

    // Due to camera->dx issues in collision the widescreen physics
    // behave differently to non widescreen so set the health to 2
    // so that the TAS has to at least hit the cabin to move on
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
    boss->health = 2;
#endif

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->health = boss->health >> 1;
        boss->gunHealth = boss->gunHealth >> 1;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->x = Q(23044);
        boss->y = Q(140);
    } else {
        boss->x = Q(540);
        boss->y = Q(140);
    }

    boss->introTimer = 80;

    boss->unkC = Q(BOSS_SPEED);
    boss->unkE = 0;
    boss->unk12 = 0;
    boss->unk13 = 0;

    boss->cabinDiskAngle = DEG_TO_SIN(120);
    boss->gunDiskAngle = DEG_TO_SIN(0);
    boss->armDiskAngle = DEG_TO_SIN(240);

    boss->gunAngle = DEG_TO_SIN(180);
    boss->unk1C = gUnknown_080D7F94[1] * 2;
    boss->chargeBeamWidth = 0;
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

    UpdateSpriteAnimation_BG(s);
    DisplaySprite_BG(s);

    s = &boss->pilot;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += PILOT_TILES * TILE_SIZE_4BPP;

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC)
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
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

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
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    for (i = 0; i < 8; i++) {
        s = &boss->smackParticles[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vramBase;
        vramBase += gUnknown_080D7FB0[i].numTiles * TILE_SIZE_4BPP;

        SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D7FB0[i].anim, gUnknown_080D7FB0[i].variant, 11, 1, 0);
    }
}

void Task_EggSaucerIntro(void)
{
    EggSaucer *boss = TASK_DATA(gCurTask);
    // speed
    boss->x += Q(BOSS_INTRO_SPEED);

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

    if (boss->health == 0) {
        gBldRegs.bldCnt = 0;
        Player_DisableInputAndBossTimer();
        sub_80436E4(boss);
        boss->unkC = Q(BOSS_SPEED);
        boss->gunHealth = 0;
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
        m4aSongNumStart(SE_EXPLOSION);
    }

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (boss->unk15 == 0 && I(boss->cabinX) - gCamera.x < 50) {
            boss->unk15 = 1;
        }
    } else {
        if (boss->unk15 == 0 && I(boss->cabinX) - gCamera.x < 50) {
            boss->unk15 = 1;
            CreateEggmobileEscapeSequence(I(boss->cabinX) - gCamera.x, I(boss->cabinY) - gCamera.y, SPRITE_FLAG(PRIORITY, 2));
        }
    }
    sub_8045898(boss);

    if (I(boss->cabinX) - gCamera.x < -200 && boss->unk15 != 0) {
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

    x += Q(2);
    y -= Q(17);

    x2 = 0;
    y2 = 0;

    for (i = 0; i < 6; i++) {
        idx = (((boss->unkB6 - 1) - (i + 1) * 4)) & 31;
        x2 += Q(boss->unk36[0][idx]);
        y2 += Q(boss->unk36[1][idx]);

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
    x2 += boss->unk36[0][idx] * Q(0.5);
    y2 += boss->unk36[1][idx] * Q(0.5);
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

    x = I(boss->x) - gCamera.x;
    y = I(boss->y) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > (DISPLAY_WIDTH + 60)) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
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

    if (boss->gunHealth > 0) {
        s = &boss->gunBase;
        s->x = x + ((COS(boss->gunDiskAngle) * 5) >> 11);
        s->y = y + ((SIN(boss->gunDiskAngle) * 5) >> 11);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->gun;
        transform = &boss->transform;
        s->x = x + ((COS(boss->gunDiskAngle) * 5) >> 11) - 2;
        s->y = y + ((SIN(boss->gunDiskAngle) * 5) >> 11) - 19;
        s->frameFlags = gOamMatrixIndex++ | 0x1060;

        transform->rotation = boss->gunAngle;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
        transform->x = s->x;
        transform->y = s->y;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
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
        s->oamFlags = SPRITE_OAM_ORDER(19 - i);
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
    x = I(boss->x) - gCamera.x;
    y = I(boss->y) - gCamera.y;

    gBgScrollRegs[0][0] = 60 - x;
    gBgScrollRegs[0][1] = 54 - y;

    if (x < -50 || x > 300) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    s = &boss->cabin;
    s->x = I(boss->cabinX) - gCamera.x;
    s->y = I(boss->cabinY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk15 == 0
        || (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel)) {
        s = &boss->pilot;
        s->x = I(boss->cabinX) - gCamera.x;
        s->y = I(boss->cabinY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &boss->armBase;
    s->x = I(boss->armBaseX) - gCamera.x;
    s->y = I(boss->armBaseY) - gCamera.y;
    DisplaySprite(s);

    s = &boss->armSegment;
    for (i = 0; i < 6; i++) {
        s->x = I(boss->unkDC[i][0]) - gCamera.x;
        s->y = I(boss->unkDC[i][1]) - gCamera.y;
        s->oamFlags = SPRITE_OAM_ORDER(19 - i);
        DisplaySprite(s);
    }

    s = &boss->hand;
    s->x = I(boss->handX) - gCamera.x;
    s->y = I(boss->handY) - gCamera.y;
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
    if (boss->gunHealth == 0 && boss->unk20 == 0) {
        boss->unk24 += 16;
        x = boss->unk28 + boss->unk22;
        boss->unk28 = x;
        y = boss->unk2C + boss->unk24;
        boss->unk2C = y;

        bottomX = I(x);
        bottomY = I(y) + 10;
        ground = sub_801E4E4(bottomY, bottomX, 1, 8, NULL, sub_801EE64);
        if (ground < 0) {
            boss->unk2C += Q(ground);
            boss->unk22 = Div(-(boss->unk22 * 80), 100);
            boss->unk20 = 1;
        }

        s = &boss->gunBase;
        s->x = I(x) - gCamera.x;
        s->y = I(y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->gun;
        transform = &boss->transform;
        s->x = (I(x) - gCamera.x) - 2;
        s->y = (I(y) - gCamera.y) - 19;
        s->frameFlags = gOamMatrixIndex++ | 0x1060;

        transform->rotation = boss->gunAngle;
        transform->qScaleX = 256;
        transform->qScaleY = 256;
        transform->x = s->x;
        transform->y = s->y;
        TransformSprite(s, transform);
        DisplaySprite(s);

        if (Mod(gStageTime, 3) == 0) {
            u32 rand;

            rand = PseudoRandom32();
            explosion.spawnX = (I(x) - gCamera.x) + (rand & 15) - 8;
            rand = PseudoRandom32();
            explosion.spawnY = (I(y) - gCamera.y) + (rand & 15) - 8;
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
    u8 idx;
    s32 x, y;
    Sprite *s = &boss->cabin;

    x = I(boss->x) + ((COS(boss->cabinDiskAngle) * 5) >> 11);
    y = I(boss->y) + ((SIN(boss->cabinDiskAngle) * 5) >> 11);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (Coll_Player_Enemy(s, x, y, 2, &gPlayer) == 1) {
        sub_80452F8(boss);
    }

    Coll_Player_Boss_Attack(s, x, y, 1, &gPlayer);

    if (boss->unk13 == 0) {
        if (Coll_Player_Boss_Attack(s, x, y, 0, &gPlayer) == 1) {
            sub_8045368(boss);
        } else {
            if (Coll_Player_Enemy(s, x, y, 0, &gPlayer) == 1) {
                sub_80452F8(boss);
            }
        }
    }

    Player_UpdateHomingPosition(QS(x), QS(y));

    if (boss->unk13 == 0 && Coll_Cheese_Enemy_Attack(s, x, y, 0, &gPlayer) == TRUE) {
        sub_8045368(boss);
        gCheeseTarget.task->unk15 = 0;
    }

    if (boss->gunHealth != 0 && boss->unk1F == 0) {
        s = &boss->gunBase;
        x = I(boss->x) + ((COS(boss->gunDiskAngle) * 5) >> 11);
        y = I(boss->y) + ((SIN(boss->gunDiskAngle) * 5) >> 11);

        s->x = x - gCamera.x;
        s->y = y - gCamera.y;

        if (Coll_Player_Enemy(s, x, y, 1, &gPlayer) == 1) {
            sub_80452F8(boss);
        }

        if (Coll_Player_Boss_Attack(s, x, y, 0, &gPlayer) == 1) {
            boss->unk1F = 0x1E;
            boss->gunHealth--;

            if (boss->gunHealth & 1) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            if (boss->gunHealth == 0) {
                INCREMENT_SCORE(500);
            }
        } else {
            if (Coll_Player_Enemy(s, x, y, 0, &gPlayer) == 1) {
                sub_80452F8(boss);
            }
        }

        Player_UpdateHomingPosition(QS(x), QS(y));

        if (boss->unk1F == 0) {
            if (Coll_Cheese_Enemy_Attack(s, x, y, 0, &gPlayer) == 1) {
                boss->unk1F = 0x1E;
                boss->gunHealth--;

                if (boss->gunHealth & 1) {
                    m4aSongNumStart(SE_143);
                } else {
                    m4aSongNumStart(SE_235);
                }

                gCheeseTarget.task->unk15 = 0;
                if (boss->gunHealth == 0) {
                    INCREMENT_SCORE(500);
                }
            }
        }
        boss->unk28 = QS(x - 5);
        boss->unk2C = QS(y + 1);
    }

    s = &boss->armBase;
    x = I(boss->x) + ((COS(boss->armDiskAngle) * 5) >> 11);
    y = I(boss->y) + ((SIN(boss->armDiskAngle) * 5) >> 11);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (Coll_Player_Enemy(s, x, y, 0, &gPlayer) == 1) {
        sub_80452F8(boss);
    }

    if (Coll_Player_Enemy(s, x, y, 1, &gPlayer) == 1) {
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

    if (Coll_Player_Enemy(s, x, y, 1, &gPlayer) == 1) {
        sub_80452F8(boss);
        // insta kill
        gPlayer.moveState |= MOVESTATE_DEAD;
    }

    if (Coll_Player_Enemy(s, x, y, 0, &gPlayer) == 1) {
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

    bottomX = I(x);
    bottomY = I(y) + (BOSS_HEIGHT / 2);

    boss->y += Q(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));

    boss->cabinDiskAngle = ({ (boss->cabinDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
    boss->gunDiskAngle = ({ (boss->gunDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
    boss->armDiskAngle = ({ (boss->armDiskAngle + DEG_TO_SIN(BOSS_ROTATE_SPEED_DEG)) & (SIN_PERIOD - 1); });
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

    bottomX = I(boss->x);
    bottomY = I(boss->y) + (BOSS_HEIGHT / 2);

    boss->y += Q(sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64));
    boss->unkD6 += 0x30;

    boss->cabinX += boss->unkD4;
    boss->cabinY += boss->unkD6;

    bottomX = I(boss->cabinX);
    bottomY = I(boss->cabinY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->cabinY += QS(res);
        boss->unkD6 = Div(-0x46 * boss->unkD6, 100);
        boss->unkD4 -= 24;
    }

    boss->unkDA += 0x3D;
    boss->armBaseX += boss->unkD8;
    boss->armBaseY += boss->unkDA;

    bottomX = I(boss->armBaseX);
    bottomY = I(boss->armBaseY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->armBaseY += QS(res);
        boss->unkDA = Div(-0x41 * boss->unkDA, 100);
        boss->unkD8 -= 34;
    }

    for (i = 0; i < 6; i++) {
        boss->unk10C[i][1] += 0x38;
        boss->unkDC[i][0] += boss->unk10C[i][0];
        boss->unkDC[i][1] += boss->unk10C[i][1];

        bottomX = I(boss->unkDC[i][0]);
        bottomY = I(boss->unkDC[i][1]);
        res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
        if (res < 0) {
            boss->unkDC[i][1] += QS(res);
            boss->unk10C[i][1] = Div(boss->unk10C[i][1] * (i - 0x41), 100);
            boss->unk10C[i][0] += (i - 0x33);
        }
    }

    boss->unk12E += 0x40;
    boss->handX += boss->unk12C;
    boss->handY += boss->unk12E;

    bottomX = I(boss->handX);
    bottomY = I(boss->handY);
    res = sub_801E4E4(bottomY, bottomX, 1, 8, 0, sub_801EE64);
    if (res < 0) {
        boss->handY += QS(res);
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
        if (fade->brightness != Q(SCREEN_FADE_BLEND_MAX)) {
            fade->brightness = Q(SCREEN_FADE_BLEND_MAX);
            UpdateScreenFade(fade);
        }
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        return;
    }

    if (boss->gunHealth == 0) {
        fade->brightness = Q(SCREEN_FADE_BLEND_MAX);
        UpdateScreenFade(fade);
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        return;
    }

    x = (I(boss->x) - gCamera.x);
    x += ((COS(boss->gunDiskAngle) * 5) >> 11);
    x += ((COS(boss->gunAngle) * 3) >> 11);

    y = (I(boss->y) - gCamera.y);
    y += (SIN(boss->gunDiskAngle) * 5) >> 11;
    y -= 18;
    y += (SIN(boss->gunAngle) * 3) >> 11;

    someBool = FALSE;
    if (boss->chargeBeamWidth != 0 && boss->unk1C == 0) {
        fade->brightness = Q(SCREEN_FADE_BLEND_MAX) - Q_8_8(--boss->chargeBeamWidth);
        ScreenMask_CreateShape(boss->gunAngle, boss->chargeBeamWidth + 8, 6, x, y, 32);

        someBool = TRUE;
        if (boss->chargeBeamWidth == 0) {
            boss->unk1C = gUnknown_080D7F94[boss->health > 4 ? 1 : 0];
        }
    } else {
        s32 tmp;
        fade->brightness = Q(SCREEN_FADE_BLEND_MAX);
        tmp = boss->unk1C;
        boss->unk1C--;
        if (boss->unk1C == 0) {
            m4aSongNumStart(SE_252);
            boss->chargeBeamWidth = 16;
        } else if (boss->unk1C > 10 && boss->unk1C < 40) {
            fade->brightness = Q(SCREEN_FADE_BLEND_MAX) - ((tmp - 11) * Q(0.5));
            ScreenMask_CreateShape(boss->gunAngle, 10, 6, x, y, 32);
        }

        if (boss->unk1C < 13) {
            s = &boss->gunCharge;
            s->x = x;
            s->y = y;

            if (boss->unk1C == 12) {
                s->prevVariant = -1;
                s->graphics.anim = SA2_ANIM_EGG_SAUCER_GUN_CHARGE;
                s->variant = 0;
            }
        }
    }

    UpdateScreenFade(fade);

    y = I(gPlayer.qWorldY);
    y += 19;
    y -= (I(boss->y) + ((SIN(boss->gunDiskAngle) * 5) >> 11));
    x = ({
        s32 temp3;
        x = (I(gPlayer.qWorldX));
        temp3 = x + 2;
        temp3 - (I(boss->x) + ((COS(boss->gunDiskAngle) * 5) >> 11));
    });
    temp = sub_8004418(y, x);
    if (gStageTime & 1) {
        if (boss->gunAngle < temp) {
            if (boss->gunAngle < DEG_TO_SIN(202.5)) {
                boss->gunAngle += 1;
            }
        } else {
            if (boss->gunAngle > DEG_TO_SIN(157.5)) {
                boss->gunAngle -= 1;
            }
        }
    }
    if (someBool && (boss->gunAngle - DEG_TO_SIN(5.625)) < temp && (boss->gunAngle + DEG_TO_SIN(5.625)) > temp) {
        Coll_DamagePlayer(&gPlayer);
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
        if (boss->gunHealth != 0 || (PseudoRandom32() & 1)) {
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
        x = I(boss->x);
        y = I(boss->y);

        x += ((COS(boss->armDiskAngle) * 5) >> 11);
        y += (SIN(boss->armDiskAngle) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = I(gPlayer.qWorldX) - x;
        y = I(gPlayer.qWorldY) - y;
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
        if (boss->gunHealth != 0) {
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
        x = I(boss->x);
        y = I(boss->y);

        x += ((COS(boss->armDiskAngle) * 5) >> 11);
        y += (SIN(boss->armDiskAngle) * 5) >> 11;

        x += 2;
        y -= 0x11;

        x = I(gPlayer.qWorldX) - x;
        y = I(gPlayer.qWorldY) - y;
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
    s32 val;
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
        if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC)
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
    boss->health--;

    if ((boss->health & 1)) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    boss->unk13 = 30;
    boss->unk12 = 0;
    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (!boss->health) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 2;
        }
    } else {
        if (!boss->health) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 2;
        }
    }
    s->prevVariant = -1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && boss->health == 4) {
        gMusicManagerState.unk1 = 0x11;
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

    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) && gSelectedCharacter == CHARACTER_SONIC)
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        if (!boss->health) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES;
            s->variant = 0;
        }
    } else {
        if (!boss->health) {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN;
            s->variant = 0;
        }
    }
    s->prevVariant = -1;
}

// (98.39%) https://decomp.me/scratch/wnQsf
NONMATCH("asm/non_matching/game/bosses/boss_5__sub_8045564.inc", void sub_8045564(EggSaucer *boss))
{
    s32 index;
    s32 new_var = 0xF;

    if (boss->unk15 == 0) {
        ExplosionPartsInfo e;
        s32 rand;

        if (Mod(gStageTime, 7) == 0) {
            rand = ({ (PseudoRandom32() & 0x1f) + 0x18; }) + 0;
            index = CLAMP_SIN_PERIOD(gStageTime * 900) + 0;
            e.spawnX = (Q_24_8_TO_INT(boss->x) - gCamera.x);
            e.spawnX += ((rand * COS(index)) >> 14);
            e.spawnY = (Q_24_8_TO_INT(boss->y) - gCamera.y);
            e.spawnY += ((rand * SIN(index)) >> 14);
            e.velocity = 0;
            e.rotation = ({ 0x407 - (PseudoRandom32() & 0x3F); }) + 0;
            e.speed = 0x500;
            e.vram = (void *)OBJ_VRAM0 + 0x2980;
            e.anim = SA2_ANIM_EXPLOSION;
            e.variant = 0;
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }

        if (Mod(gStageTime, 10) == 0) {
            u8 val2;
            rand = ({ (PseudoRandom32() & 0x1f) + 0x18; }) + 0;
            index = CLAMP_SIN_PERIOD(gStageTime * 900) + 0;
            val2 = Mod(gStageTime, 6);
            e.spawnX = (Q_24_8_TO_INT(boss->x) - gCamera.x);
            e.spawnX += ((rand * COS(index)) >> 14);
            e.spawnY = (Q_24_8_TO_INT(boss->y) - gCamera.y);
            e.spawnY += ((rand * SIN(index)) >> 14);
            e.velocity = 0x40;
            e.rotation = ({ (PseudoRandom32() & 0x3FF); }) + 0;
            e.speed = 0x600;
            e.vram = (void *)OBJ_VRAM0 + (gTileInfoBossScrews[val2][0] * 0x20);
            e.anim = gTileInfoBossScrews[val2][1];
            e.variant = gTileInfoBossScrews[val2][2];
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }

        if (Mod(gStageTime, 9) == 0) {
            u32 r4;
            rand = PseudoRandom32() & 0xf;

            e.spawnX = (Q_24_8_TO_INT(boss->cabinX) - gCamera.x);
            e.spawnX += rand & 0xf;
            e.spawnX -= 8;
            rand = PseudoRandom32() + 0;
            e.spawnY = (Q_24_8_TO_INT(boss->cabinY) - gCamera.y);
            e.spawnY += (rand & 0xf);
            e.spawnY -= 8;
#ifndef NON_MATCHING
            gStageTime = gStageTime;
#endif
            e.velocity = 0;

            e.rotation = ({ 0x407 - (PseudoRandom32() & 63); }) + 0;
            e.speed = 0x500;
            e.vram = (void *)OBJ_VRAM0 + 0x2980;
            e.anim = SA2_ANIM_EXPLOSION;
            e.variant = 0;
            e.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&e, &boss->unk14);
        }

        if (Mod(gStageTime, 0xB) == 0) {
            u32 r3;
            rand = PseudoRandom32() & 0xF;
            e.spawnX = (Q_24_8_TO_INT(boss->armBaseX) - gCamera.x);
            e.spawnX += rand & new_var;
            e.spawnX -= 8;
            rand = PseudoRandom32() + 0;
            e.spawnY = (Q_24_8_TO_INT(boss->armBaseY) - gCamera.y);
            e.spawnY += (rand & new_var);
            e.spawnY -= 8;
            e.velocity = 0;
#ifndef NON_MATCHING
            rand = 0x6000000 + 0x10000;
#endif
            e.rotation = ({ 0x407 - (PseudoRandom32() & 63); }) + 0;
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
            for (i = 0; i < PALETTE_LEN_4BPP; i++) {
                SET_PALETTE_COLOR_OBJ(8, i, gUnknown_080D7FF0[val][i]);
            }
        } else {
            for (i = 0; i < PALETTE_LEN_4BPP; i++) {
                SET_PALETTE_COLOR_OBJ(8, i, gUnknown_080D7FF0[1][i]);
            }
        }

        if (boss->unk1F != 0) {
            boss->unk1F--;
            for (i = 0; i < PALETTE_LEN_4BPP; i++) {
                SET_PALETTE_COLOR_OBJ(9, i, gUnknown_080D7FF0[val][i]);
            }
        } else {
            for (i = 0; i < PALETTE_LEN_4BPP; i++) {
                SET_PALETTE_COLOR_OBJ(9, i, gUnknown_080D7FF0[1][i]);
            }
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }
}

void sub_804598C(void) { TaskDestroy(gCurTask); }

void sub_80459A0(EggSaucer *boss)
{
    if (boss->gunHealth == 0 && boss->armDiskAngle != ((boss->cabinDiskAngle + 0x200) & (SIN_PERIOD - 1))) {
        boss->armDiskAngle = CLAMP_SIN_PERIOD(boss->armDiskAngle + 1);
    }
}

void TaskDestructor_EggSaucerMain(struct Task *t)
{
    EggSaucer *boss = TASK_DATA(t);
    VramFree(boss->vram);
    gActiveBossTask = NULL;
}
