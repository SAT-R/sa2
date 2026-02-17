#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/collision.h"

#include "game/player_callbacks.h"
#include "game/save.h"
#include "game/cheese.h"
#include "game/bosses/boss_1.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/cutscenes/level_endings.h"
#include "game/parameters/bosses.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/results.h"
#include "game/stage/screen_fade.h"
#include "game/stage/screen_shake.h"
#include "game/time_attack/results.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define EGG_HAMMER_TANK_II_STATE_RESET   0
#define EGG_HAMMER_TANK_II_STATE_EXTEND  1
#define EGG_HAMMER_TANK_II_STATE_AIM     2
#define EGG_HAMMER_TANK_II_STATE_PLUNGE  3
#define EGG_HAMMER_TANK_II_STATE_SLAM    4
#define EGG_HAMMER_TANK_II_STATE_HOLD    5
#define EGG_HAMMER_TANK_II_STATE_DRAG    6
#define EGG_HAMMER_TANK_II_STATE_RETRACT 7

typedef struct {
    s32 x;
    s32 y;
    s32 speedX;
    s32 speedY;
    s32 remainingBounces;
    s32 despawnTimeout;
} DestructionComponent;

typedef struct {
    ScreenFade fade; /* 0xB4 */

    s32 bodyX;
    s32 bodyY;
    s32 bodySpeedX;
    s32 bodySpeedY;

    s32 hammerX;
    s32 hammerY;
    s32 hammerSpeedX;
    s32 hammerSpeedY;
    s32 hammerBounceSide;
    s32 hammerState;

    // unused
    u8 fillerE8[16];

    DestructionComponent armSegments[8];
    DestructionComponent hammerArmSegments[8];
    DestructionComponent wheels[4];
    u16 hammerAngle;

    // unused
    u8 filler2DA[2];

    u8 axelsJoinedRemainingBounces;
    u8 numPartsCreated;
} DestructionScene;

typedef struct {
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;

    // Specifically, the positions along the arm
    s32 armSegmentPositions[8];
    // Specifically, the angles of the segment from the base
    s32 armSegmentAngles[8];
    u32 armBaseSin;
    u32 armBaseAngle;
    s32 hammerArmSegmentPositions[8];
    s32 hammerArmSegmentAngles[8];

    s32 hammerAngle;
    s32 frontAxelY;
    s32 rearAxelY;
    u32 hammerState;
    u32 hammerExtension;
    u32 sceneTimer;

    u32 timer;

    u8 health;
    u8 timerInvulnerability;
    u8 timerPilotLaugh;
    bool8 pilotEscaped;

    DestructionScene destructionScene;

    Sprite body;
    Hitbox reserved0;
    Sprite armSegment;
    Sprite hand;
    Sprite pilot;
    Sprite wheel;
    Sprite brokenWheel;
    Sprite hammer;
    SpriteTransform transform; /* 0x438 */

    Sprite cream;
    Sprite cheese;
} EggHammerTankII; /* size 0x4A4 */

typedef void (*HammertankFunc)(EggHammerTankII *);

static void Task_EggHammerTankII_RollIn(void);
static void TaskDestructor_EggHammerTankII(struct Task *);
static void Task_EggHammerTankII_Main(void);
static void Task_DestructionScene_Main(void);

static void UpdateArmSegments(EggHammerTankII *);
static void Render(EggHammerTankII *);
static void PilotLaugh(EggHammerTankII *boss);
static void HandleBossHit(EggHammerTankII *boss);
static void HandleBossHitPalette(EggHammerTankII *boss);
static void StateHandler_HammerReset(EggHammerTankII *boss);
static void StateHandler_HammerExtend(EggHammerTankII *boss);
static void StateHandler_HammerAim(EggHammerTankII *boss);
static void StateHandler_HammerPlunge(EggHammerTankII *boss);
static void StateHandler_HammerSlam(EggHammerTankII *boss);
static void StateHandler_HammerHold(EggHammerTankII *boss);
static void StateHandler_HammerDrag(EggHammerTankII *boss);
static void StateHandler_HammerRetract(EggHammerTankII *boss);

static void PhysicsHandler_Falling(void);
static void PhysicsHandler_OnTerrain(void);
static bool8 IsBossTouchingTerrain(void);

static const s16 gUnknown_080D7A18[] = {
    96, 104, 112, 120, 128, 136, 144, 152,
};
static const s16 sQArmSegmentAngleOffsets[] = {
    Q(0.625), Q(0.609375), Q(0.59375), Q(0.578125), Q(0.5625), Q(0.546875), Q(0.53125), Q(0.515625),
};

static const s32 gUnknown_080D7A38[8] = {
    Q(0.0), Q(12.0), Q(24.0), Q(34.0), Q(44.0), Q(50.0), Q(54.0), Q(56.0),
};

static const s32 gUnknown_080D7A58[8] = {
    Q(0.0), Q(12.0), Q(24.0), Q(36.0), Q(48.0), Q(60.0), Q(72.0), Q(84.0),
};

static const s16 gUnknown_080D7A78[] = {
    256, 256, 256, 256, 256, 256, 256, 256, 144, 128, 112, 96, 80, 64, 48, 48,
};

static const s16 gUnknown_080D7A98[] = {
    576, 320, 576, 320, 320,
};

static const u8 gUnknown_080D7AA2[] = {
    8, 13, 8, 13, 13,
};

static const TaskMain sGroundPhysicsHandlers[] = { PhysicsHandler_Falling, PhysicsHandler_OnTerrain };

static const HammertankFunc sBossStateHandlers[] = {
    [EGG_HAMMER_TANK_II_STATE_RESET] = StateHandler_HammerReset, [EGG_HAMMER_TANK_II_STATE_EXTEND] = StateHandler_HammerExtend,
    [EGG_HAMMER_TANK_II_STATE_AIM] = StateHandler_HammerAim,     [EGG_HAMMER_TANK_II_STATE_PLUNGE] = StateHandler_HammerPlunge,
    [EGG_HAMMER_TANK_II_STATE_SLAM] = StateHandler_HammerSlam,   [EGG_HAMMER_TANK_II_STATE_HOLD] = StateHandler_HammerHold,
    [EGG_HAMMER_TANK_II_STATE_DRAG] = StateHandler_HammerDrag,   [EGG_HAMMER_TANK_II_STATE_RETRACT] = StateHandler_HammerRetract,
};

static const u16 gUnknown_080D7AD0[][PALETTE_LEN_4BPP] = {
    INCBIN_U16("graphics/80D7AD0.gbapal"),
    INCBIN_U16("graphics/80D7AF0.gbapal"),
};

void CreateEggHammerTankII(void)
{
    struct Task *t;
    EggHammerTankII *boss;
    Sprite *s;
    u32 i;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPseudoRandom = gStageTime;
    t = TaskCreate(Task_EggHammerTankII_RollIn, sizeof(EggHammerTankII), 0x4000, 0, TaskDestructor_EggHammerTankII);

    boss = TASK_DATA(t);
    if (IS_FINAL_STAGE(gCurrentLevel)) {
        u8 difficulty = gDifficultyLevel;
        if (difficulty != DIFFICULTY_NORMAL) {
            boss->health = 3;
        } else {
            boss->health = 4;
        }
    } else if (gDifficultyLevel != DIFFICULTY_NORMAL && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->health = 6;
    } else {
        boss->health = 8;
    }

    boss->sceneTimer = 0;
    boss->hammerExtension = 2;
    boss->hammerState = EGG_HAMMER_TANK_II_STATE_RESET;
    boss->timer = 120;

    boss->timerInvulnerability = 0;
    boss->timerPilotLaugh = 0;
    boss->pilotEscaped = FALSE;

    i = Q(980);
    boss->x = i;
    boss->y = Q(155);

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->speedX = BOSS_RUSH_VELOCITY_X;
        boss->speedY = BOSS_RUSH_VELOCITY_Y;
    } else {
        boss->speedX = BOSS1_VELOCITY_X;
        boss->speedY = BOSS1_VELOCITY_Y;
    }

    for (i = 0; i < 8; i++) {
        boss->armSegmentAngles[i] = 0;
        boss->armSegmentPositions[i] = gUnknown_080D7A38[i];
    }

    boss->armBaseSin = 0;
    boss->armBaseAngle = 0;

    for (i = 0; i < 8; i++) {
        boss->hammerArmSegmentAngles[i] = DEG_TO_SIN(270);
        boss->hammerArmSegmentPositions[i] = gUnknown_080D7A58[i];
    }

    boss->hammerAngle = DEG_TO_SIN(270);
    boss->frontAxelY = Q(18.5);
    boss->rearAxelY = Q(18.5);

    s = &boss->body;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x48, SA2_ANIM_HAMMERTANK_BODY, 0, 20, 2);
    UpdateSpriteAnimation(s);

    s = &boss->armSegment;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_HAMMERTANK_ARM_SEGMENT, 0, 18, 2);
    UpdateSpriteAnimation(s);

    s = &boss->wheel;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_SPINNING_WHEEL, 0, 19, 2);

    s = &boss->brokenWheel;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_WHEEL, 0, 21, 2);

    s = &boss->hand;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x40, SA2_ANIM_HAMMERTANK_HAND, 0, 17, 2);
    UpdateSpriteAnimation(s);

    s = &boss->pilot;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0xC, SA2_ANIM_HAMMERTANK_PILOT, 0, 21, 2);

    s = &boss->hammer;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    SPRITE_INIT_ANIM(s, SA2_ANIM_HAMMERTANK_HAMMER, 0, 24);
    SPRITE_INIT_SCRIPT(s, 1.0);

    s->frameFlags
        = (gOamMatrixIndex++) | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

    if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel) {

        s = &boss->cream;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 0xC, SA2_ANIM_CREAM_CAPTURED, 0, 2, 2);

        s = &boss->cheese;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 9, SA2_ANIM_CHEESE_STRUGGLING, 0, 2, 2);
    } else {
        boss->cream.graphics.dest = NULL;
        boss->cheese.graphics.dest = NULL;
    }

    gActiveBossTask = t;
}

static void Task_EggHammerTankII_RollIn(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    u32 sceneTimer = ++boss->sceneTimer;

    if (sceneTimer < 21) {
        boss->speedX = 0;
        return;
    }

    if (sceneTimer < 127) {
        u32 r0, r2;
#ifndef NON_MATCHING
        register u32 UNUSED r1 asm("r1") = (sceneTimer - 61);
#endif

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            r0 = sceneTimer * Q(5);
            r2 = r0 + Q(1210);
            r2 += ((sceneTimer - 61) * (sceneTimer - 61) * (sceneTimer - 61)) >> 1;
            r2 -= ((sceneTimer - 61) * 48 * (sceneTimer - 61)) >> 1;
            r0 = (sceneTimer - 61) >> 1;
            r2 += r0;
            boss->x = r2;
        } else {
            r0 = sceneTimer * Q(5);
            r2 = r0 + Q(1210);
            r2 += ((sceneTimer - 61) * (sceneTimer - 61) * (sceneTimer - 61)) >> 1;
            r2 -= ((sceneTimer - 61) * 48 * (sceneTimer - 61)) >> 1;
            r0 = (sceneTimer - 61) >> 1;
            r2 += r0;
            boss->x = r2;
        }
    }
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    if (sceneTimer > 126) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        boss->speedX = BOSS1_VELOCITY_X;
        gCurTask->main = Task_EggHammerTankII_Main;
    }

    sGroundPhysicsHandlers[IsBossTouchingTerrain()]();
    UpdateArmSegments(boss);
    Render(boss);
}

static void HandleCollision(EggHammerTankII *boss)
{
    Vec2_32 pos;
    Sprite *s;

    if (boss->timerInvulnerability == 0) {
        // Check hammer collision
        if (boss->hammerState == EGG_HAMMER_TANK_II_STATE_RESET || boss->hammerState == EGG_HAMMER_TANK_II_STATE_EXTEND
            || boss->hammerState == EGG_HAMMER_TANK_II_STATE_AIM || boss->hammerState == EGG_HAMMER_TANK_II_STATE_PLUNGE
            || boss->hammerState == EGG_HAMMER_TANK_II_STATE_SLAM || boss->hammerState == EGG_HAMMER_TANK_II_STATE_DRAG) {
            s32 r0;

#ifndef NON_MATCHING
            register s32 r2 asm("r2");
#else
            s32 r2;
#endif

            r2 = I(boss->x);
            r0 = (((boss->hammerArmSegmentPositions[5] * COS(boss->hammerArmSegmentAngles[5] & (SIN_PERIOD - 1))) >> 23) - 8);
            pos.x = r2 + r0;

            r2 = I(boss->y);
            r0 = ((boss->hammerArmSegmentPositions[5] * SIN(boss->hammerArmSegmentAngles[5] & (SIN_PERIOD - 1)) >> 23));
            pos.y = r2 + r0;

            pos.x -= I(gPlayer.qWorldX);
            pos.y -= I(gPlayer.qWorldY);
            if ((SQUARE(pos.x) + SQUARE(pos.y)) < 420) {
                PilotLaugh(boss);
                Coll_DamagePlayer(&gPlayer);
            }
        }

        // Check body collision
        s = &boss->body;
        pos.x = I(boss->x);
        pos.y = I(boss->y);

        s->x = pos.x - gCamera.x;
        s->y = pos.y - gCamera.y;

        Coll_Player_Enemy(s, pos.x, pos.y, 1, &gPlayer);
        Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

        if (boss->timerInvulnerability == 0 || ((gPlayer.qSpeedAirY > 0 || !(gPlayer.moveState & 2)) && (gPlayer.moveState & 2))) {
            if (Coll_Player_Boss_Attack(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
                HandleBossHit(boss);
            } else {
                Coll_Player_Enemy(s, pos.x, pos.y, 0, &gPlayer);
            }

            if (boss->timerInvulnerability == 0 && Coll_Cheese_Enemy_Attack(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
                HandleBossHit(boss);
            }
        }
    }
}

static void Task_DestructionSceneOutro(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    ScreenFade *fade = &boss->destructionScene.fade;
    boss->sceneTimer++;

    if (boss->sceneTimer > 8) {
        switch (boss->sceneTimer) {
            case 9:
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                m4aSongNumStart(SE_333);
                break;
        }
    }

    if (boss->sceneTimer < 33) {
        if (boss->sceneTimer == 1) {
            fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
            fade->brightness = Q(8);
            fade->speed = Q(0.75);
        }
        UpdateScreenFade(fade);
    } else if (boss->sceneTimer < 121) {
        Cheese *cheese;
        fade->flags = SCREEN_FADE_FLAG_2;
        fade->brightness = Q(0);
        fade->speed = Q(0);
        UpdateScreenFade(fade);

        if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            gPlayer.charState = CHARSTATE_SONIC_CATCHING_CREAM;
        }

        if (IS_FINAL_STAGE(gCurrentLevel) && (boss->sceneTimer == 34)) {
            s32 x, y;

            x = gUnknown_080D6DE4[0][0] - I(gPlayer.qWorldX);
            y = gUnknown_080D6DE4[0][1] - I(gPlayer.qWorldY);

            gPlayer.qWorldX += Q(x);
            gPlayer.qWorldY += Q(y);

            gCamera.x += x;
            gCamera.y += y;

            gCamera.unk20 += x;
            gCamera.unk24 += y;

            gCamera.unk10 += x;
            gCamera.unk14 += y;

            cheese = gCheese;
            if (cheese != NULL) {
                cheese->posX += Q(x);
                cheese->posY += Q(y);
            }

            gBossIndex++;
        }
    } else {
        fade->speed = Q(40. / 256.);

        if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
            if (!IS_FINAL_STAGE(gCurrentLevel)) {
                if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
                    CreateTimeAttackResults(gCourseTime);
                } else if (gSelectedCharacter == CHARACTER_SONIC && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
                    CreateStageResultsCutscene(0);
                } else {
                    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
                }
            }

            TaskDestroy(gCurTask);
            return;
        }
    }

    gWinRegs[WINREG_WININ] = WININ_WIN0_ALL;
    gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ);
}

static void Render(EggHammerTankII *boss)
{
    s8 i;
    s16 x, y;
    s16 x3, y3;
    SpriteTransform *transform;
    DestructionScene *ds = &boss->destructionScene;
    Sprite *s = &boss->body;
    s->x = I(boss->x) - gCamera.x;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = I(boss->x) - gCamera.x + 4;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->wheel;
    s->x = I(boss->x - Q(22)) - gCamera.x;
    s->y = I(boss->y + boss->frontAxelY + Q(14.5)) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->wheel;
    s->x = I(boss->x + Q(24)) - gCamera.x;
    s->y = I(boss->y + boss->rearAxelY + Q(14.5)) - gCamera.y;
    DisplaySprite(s);

    s = &boss->brokenWheel;
    s->x = I(boss->x - Q(22)) - gCamera.x;
    s->y = I(boss->y + boss->frontAxelY + Q(14.5)) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenWheel;
    s->x = I(boss->x + Q(24)) - gCamera.x;
    s->y = I(boss->y + boss->rearAxelY + Q(14.5)) - gCamera.y;
    DisplaySprite(s);

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    x = I(boss->x) - gCamera.x;
    y = I(boss->y) - gCamera.y;

    for (i = 6; i >= 0; i--) {
        s->x = x + ((COS((boss->armSegmentAngles[i] + DEG_TO_SIN(28.125)) & (SIN_PERIOD - 1)) * boss->armSegmentPositions[i]) >> 23);
        s->y = y + ((SIN((boss->armSegmentAngles[i] + DEG_TO_SIN(28.125)) & (SIN_PERIOD - 1)) * boss->armSegmentPositions[i]) >> 23);
        DisplaySprite(s);

        if (boss->health != 0) {
            ds->armSegments[i].x = s->x;
            ds->armSegments[i].y = s->y;
        }
    }

    s = &boss->hand;
    s->x = x + ((COS((boss->armSegmentAngles[7] + DEG_TO_SIN(28.125)) & (SIN_PERIOD - 1)) * boss->armSegmentPositions[7]) >> 23);
    s->y = y + ((SIN((boss->armSegmentAngles[7] + DEG_TO_SIN(28.125)) & (SIN_PERIOD - 1)) * boss->armSegmentPositions[7]) >> 23);

    x3 = s->x;
    y3 = s->y;
    DisplaySprite(s);

    if (boss->cream.graphics.dest != NULL) {
        s = &boss->cream;
        s->x = x3 + 5;
        s->y = y3 - 20;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->cheese;
        s->x = x3 + 5;
        s->y = y3 - 20;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(25);

    for (i = 0; i < 6; i++) {
        s->x = x - 8 + ((COS((boss->hammerArmSegmentAngles[i]) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 23);
        s->y = y + ((SIN((boss->hammerArmSegmentAngles[i]) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 23);
        DisplaySprite(s);
    }

    s = &boss->hammer;
    transform = &boss->transform;

    s->x = x - 8 + ((COS((boss->hammerArmSegmentAngles[5]) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[5]) >> 23);
    s->y = y + ((SIN((boss->hammerArmSegmentAngles[5]) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[5]) >> 23);
    s->frameFlags = gOamMatrixIndex++ | 0x2060;

    transform->rotation = (boss->hammerArmSegmentAngles[5] - (boss->hammerAngle) + boss->hammerArmSegmentAngles[5]) & (SIN_PERIOD - 1);
    if (transform->rotation != DEG_TO_SIN(270)) {
        transform->rotation += 10;
    }

    transform->qScaleX = 256;
    transform->qScaleY = 256;
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);
}

static void PhysicsHandler_OnTerrain(void)
{
    s32 result;
    s32 x, y;
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    s32 origY;
    s32 idx;
    boss->speedY = 0;
    origY = boss->y;
    x = (boss->x + Q(24));
    y = (origY + boss->rearAxelY + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result < 1) {
        boss->y += result * 64;
        idx = -result;
        if (idx > 7) {
            idx = 7;
        }
        boss->rearAxelY -= (idx * gUnknown_080D7A18[idx] - idx * 64);
    } else {
        boss->rearAxelY += Q(1.125);
    }

    boss->y -= I((Q(18.5) - boss->rearAxelY) * Q(0.375));

    if (boss->rearAxelY < Q(14.5)) {
        boss->rearAxelY = Q(14.5);
    }
    if (boss->rearAxelY > Q(23.5)) {
        boss->rearAxelY = Q(23.5);
    }

    x = (boss->x - Q(22));
    y = (origY + boss->frontAxelY + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result < 1) {
        boss->y += (result * Q(0.25));

        idx = -result;
        if (idx > 7) {
            idx = 7;
        }
        boss->frontAxelY -= (idx * gUnknown_080D7A18[idx] - idx * Q(0.25));
    } else {
        boss->frontAxelY += Q(1.125);
    }

    boss->y -= I((Q(18.5) - boss->frontAxelY) * Q(0.375));

    if (boss->frontAxelY < Q(14.5)) {
        boss->frontAxelY = Q(14.5);
    }
    if (boss->frontAxelY > Q(23.5)) {
        boss->frontAxelY = Q(23.5);
    }
}

static void StateHandler_HammerReset(EggHammerTankII *boss)
{
    u8 i;

    boss->hammerAngle -= DEG_TO_SIN(2.8125);

    if (boss->hammerAngle < DEG_TO_SIN(270)) {
        boss->hammerAngle = DEG_TO_SIN(270);
    }
    boss->hammerArmSegmentAngles[0] = boss->hammerAngle;

    for (i = 1; i < ARRAY_COUNT(boss->hammerArmSegmentPositions); i++) {
        boss->hammerArmSegmentAngles[i]
            += I((boss->hammerArmSegmentAngles[i - 1] - boss->hammerArmSegmentAngles[i]) * gUnknown_080D7A78[i + 8]);
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 10;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_EXTEND;

        for (i = 0; i < ARRAY_COUNT(boss->hammerArmSegmentPositions); i++) {
            boss->hammerArmSegmentAngles[i] = DEG_TO_SIN(270);
            boss->hammerArmSegmentPositions[i] = gUnknown_080D7A58[i];
        }

        boss->hammerAngle = DEG_TO_SIN(270);
        if (boss->hammerExtension & 2) {
            boss->hammerExtension = 1;
        } else {
            boss->hammerExtension = boss->hammerExtension << 1;
        }
    }
}

static void StateHandler_HammerExtend(EggHammerTankII *boss)
{
    u8 i, j;
    s16 acc, val;
    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7A98); i++) {
        if ((boss->hammerExtension & val)) {
            val = gUnknown_080D7A98[i];
            break;
        }
        val = val << 1;
    }

    acc = 0;
    for (j = 0; j < 8; j++) {
        acc += val;
        boss->hammerArmSegmentPositions[j] += acc;
    }

    if (--boss->timer == 0) {
        boss->timer = 15;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_AIM;
    }
}

static void StateHandler_HammerPlunge(EggHammerTankII *boss)
{
    s32 x, y;
    u8 i, val;
    s32 result;

    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7AA2); i++) {
        if (boss->hammerExtension & val) {
            val = gUnknown_080D7AA2[i];
            break;
        }
        val <<= 1;
    }

    boss->hammerAngle -= (SIN(TURNS_TO_SIN(60 - boss->timer)) >> 9);
    boss->hammerAngle &= (SIN_PERIOD - 1);
    boss->hammerArmSegmentAngles[0] = boss->hammerAngle;

    for (i = 1; i < ARRAY_COUNT(boss->hammerArmSegmentPositions); i++) {
        boss->hammerArmSegmentAngles[i]
            += I((boss->hammerArmSegmentAngles[i - 1] - boss->hammerArmSegmentAngles[i]) * gUnknown_080D7A78[i]);
    }

    x = I(boss->x) + ((boss->hammerArmSegmentPositions[7] * COS((boss->hammerArmSegmentAngles[7] - val) & (SIN_PERIOD - 1))) >> 0x17);
    y = I(boss->y) + ((boss->hammerArmSegmentPositions[7] * SIN((boss->hammerArmSegmentAngles[7] - val) & (SIN_PERIOD - 1))) >> 0x17);

    result = sub_801E6D4(y, x, 1, 8, NULL, sub_801EE64);

    if (result < 1) {
        m4aSongNumStart(SE_238);
        boss->timer = 30;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_SLAM;

        result = sub_8004418(SIN((boss->hammerArmSegmentAngles[7] + val) & (SIN_PERIOD - 1)) >> 6,
                             (COS((boss->hammerArmSegmentAngles[7] + val) & (SIN_PERIOD - 1)) >> 6) + result);

        for (i = 0; i < ARRAY_COUNT(boss->hammerArmSegmentPositions); i++) {
            boss->hammerArmSegmentAngles[i] = result;
        }
        boss->hammerAngle = result;
        CreateScreenShake(0x800, 0x10, 0x80, 0x14, 0x83);
    } else if (--boss->timer == 0) {
        boss->timer = 30;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_SLAM;
    }
}

static void StateHandler_HammerHold(EggHammerTankII *boss)
{
    u8 i;
    s32 val;

    boss->hammerAngle += DEG_TO_SIN(2.8125);
    boss->hammerArmSegmentAngles[0] = boss->hammerAngle;

    for (i = 1; i < ARRAY_COUNT(boss->hammerArmSegmentAngles); i++) {
        boss->hammerArmSegmentAngles[i]
            += I((boss->hammerArmSegmentAngles[i - 1] - boss->hammerArmSegmentAngles[i]) * gUnknown_080D7A78[i + 8]);
    }

    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7A98); i++) {
        if (boss->hammerExtension & val) {
            val = gUnknown_080D7A98[i] * 2;
            break;
        }
        val <<= 1;
    }

    if (boss->timer < 58) {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7A58); i++) {
            boss->hammerArmSegmentPositions[i] -= val;
            if (boss->hammerArmSegmentPositions[i] < gUnknown_080D7A58[i]) {
                boss->hammerArmSegmentPositions[i] = gUnknown_080D7A58[i];
            }
        }
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 0x50;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_RESET;
    }
}

static void StateHandler_HammerDrag(EggHammerTankII *boss)
{
    s32 i;
    s32 acc, val;
    for (i = 0, val = 1; i < 5; i++) {
        if ((boss->hammerExtension & val)) {
            val = gUnknown_080D7A98[i] >> 2;
            break;
        }
        val = val << 1;
    }

    acc = val;
    for (i = 0; i < 8; i++) {
        acc += val;
        boss->hammerArmSegmentPositions[i] -= acc;
        if (boss->hammerArmSegmentPositions[i] < gUnknown_080D7A58[i]) {
            boss->hammerArmSegmentPositions[i] = gUnknown_080D7A58[i];
            boss->timer = 68;
            boss->hammerState = EGG_HAMMER_TANK_II_STATE_HOLD;
        }
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 68;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_HOLD;
    }
}

static void StateHandler_HammerRetract(EggHammerTankII *boss)
{
    u8 i;
    boss->hammerAngle += DEG_TO_SIN(4.21875);
#ifdef BUG_FIX
    if (boss->hammerAngle > DEG_TO_SIN(270)) {
#else
    // shouldn't this be hammer angle?
    if (boss->timer > DEG_TO_SIN(270)) {
#endif
        boss->hammerAngle = DEG_TO_SIN(270);
    }

    boss->hammerArmSegmentAngles[0] = boss->hammerAngle;
    for (i = 1; i < 8; i++) {
        boss->hammerArmSegmentAngles[i]
            += I((boss->hammerArmSegmentAngles[i - 1] - boss->hammerArmSegmentAngles[i]) * gUnknown_080D7A78[i]);
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 80;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_RESET;
    }
}

static void HandleBossHit(EggHammerTankII *boss)
{
    Sprite *s;

    if (boss->health != 0) {
        boss->health--;
        if (boss->health & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->timerInvulnerability = 30;

        s = &boss->pilot;
        if (boss->health == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 2;
        }

        s->prevVariant = -1;
    }

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->health == 4) {
        gMusicManagerState.unk1 = 0x11;
    }
}

static void HandlePilotAnim(EggHammerTankII *boss)
{
    Sprite *s = &boss->pilot;
    if (boss->timerInvulnerability > 0) {
        boss->timerPilotLaugh = 0;

        if (--boss->timerInvulnerability > 0) {
            return;
        }

        if (boss->health == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
        }
        s->prevVariant = -1;
    } else {
        if (boss->timerPilotLaugh == 0) {
            return;
        }

        if (--boss->timerPilotLaugh > 0) {
            return;
        }

        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 0;
        s->prevVariant = -1;
    }
}

static void DestructionScene_UpdateComponents(EggHammerTankII *boss)
{
    s32 result;
    u8 i;
    DestructionScene *ds = &boss->destructionScene;
    if (ds->bodySpeedX < 0) {
        ds->bodySpeedX = 0;
    }

    ds->bodySpeedY += Q(0.25);
    ds->bodyX += ds->bodySpeedX;
    ds->bodyY += ds->bodySpeedY;

    result = sub_801F100(I(ds->bodyY) + 28, I(ds->bodyX), 1, 8, sub_801EC3C);
    if (ds->axelsJoinedRemainingBounces > 0) {
        ds->wheels[0].x = ds->bodyX - Q(22);
        ds->wheels[0].y = ds->bodyY + boss->frontAxelY + Q(14.5);
        ds->wheels[1].x = ds->bodyX + Q(24);
        ds->wheels[1].y = ds->bodyY + boss->rearAxelY + Q(14.5);
        ds->wheels[2].x = ds->bodyX - Q(22);
        ds->wheels[2].y = ds->bodyY + boss->frontAxelY + Q(14.5);
        ds->wheels[3].x = ds->bodyX + Q(24);
        ds->wheels[3].y = ds->bodyY + boss->rearAxelY + Q(14.5);
    } else {
        // Detect the axels
        for (i = 0; i < 4; i++) {
            s32 result1;
            ds->wheels[i].speedX--;
            if (ds->wheels[i].speedX < Q(0.5)) {
                ds->wheels[i].speedX = Q(0.5);
            }
            ds->wheels[i].speedY += Q(0.15625);
            ds->wheels[i].x += ds->wheels[i].speedX;
            ds->wheels[i].y += ds->wheels[i].speedY;

            result1 = sub_801F100(I(ds->wheels[i].y), I(ds->wheels[i].x), 1, 8, sub_801EC3C);
            if (result1 < 0) {
                s32 r0;
                if (ds->wheels[i].remainingBounces != 0) {
                    ds->wheels[i].remainingBounces--;
                }
                ds->wheels[i].y += Q(result1);
                r0 = ds->wheels[i].speedY * 3;
                r0 = (r0 * 4) - ds->wheels[i].speedY;
                r0 *= 16;
                ds->wheels[i].speedY = I(-r0);
            }

            if (ds->wheels[i].remainingBounces == 0) {
                if (ds->wheels[i].despawnTimeout != 0) {
                    ds->wheels[i].despawnTimeout--;
                }
            }
        }
    }

    if (result < 0) {
        if (ds->axelsJoinedRemainingBounces > 0) {
            ds->axelsJoinedRemainingBounces--;
            ds->bodySpeedY = -ds->bodySpeedY;
        } else {
            s32 r0;
            ds->bodySpeedX -= Q(0.125);
            r0 = (ds->bodySpeedY * 27);
            ds->bodySpeedY = I(-(r0 * 8));
        }

        if (ds->bodySpeedY > -160) {
            ds->bodySpeedY = 0;
        }

        ds->bodyY += QS(result);
    }

    for (i = 0; i < 8; i++) {
        ds->armSegments[i].speedY += Q(0.125);
        if (ds->armSegments[i].speedX > 0) {
            ds->armSegments[i].x += ds->armSegments[i].speedX;
        }

        ds->armSegments[i].y += ds->armSegments[i].speedY;

        result = sub_801F100(I(ds->armSegments[i].y) + 5, I(ds->armSegments[i].x), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (ds->armSegments[i].remainingBounces != 0) {
                ds->armSegments[i].remainingBounces--;
            }
            ds->armSegments[i].speedX -= Q(0.125);
            ds->armSegments[i].y += QS(result);
            ds->armSegments[i].speedY = I(ds->armSegments[i].speedY * ((i * 4) - Q(0.25)));
        }

        if (ds->armSegments[i].remainingBounces == 0) {
            if (ds->armSegments[i].despawnTimeout != 0) {
                ds->armSegments[i].despawnTimeout--;
            }
        }

        ds->hammerArmSegments[i].speedY += 40;
        if (ds->hammerArmSegments[i].speedX > 0) {
            ds->hammerArmSegments[i].x += ds->hammerArmSegments[i].speedX;
        }

        ds->hammerArmSegments[i].y += ds->hammerArmSegments[i].speedY;

        result = sub_801F100(I(ds->hammerArmSegments[i].y) + 5, I(ds->hammerArmSegments[i].x), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (ds->hammerArmSegments[i].remainingBounces != 0) {
                ds->hammerArmSegments[i].remainingBounces--;
            }
            ds->hammerArmSegments[i].speedX -= 32;
            ds->hammerArmSegments[i].y += QS(result);
            ds->hammerArmSegments[i].speedY = I(ds->hammerArmSegments[i].speedY * -((i * 4) + 64));
        }

        if (ds->hammerArmSegments[i].remainingBounces == 0) {
            if (ds->hammerArmSegments[i].despawnTimeout != 0) {
                ds->hammerArmSegments[i].despawnTimeout--;
            }
        }
    }

    ds->hammerSpeedY += Q(0.375);
    ds->hammerX += ds->hammerSpeedX;
    ds->hammerY += ds->hammerSpeedY;

    result = sub_801F100(I(ds->hammerY) + 24, I(ds->hammerX), 1, 8, sub_801EC3C);
    if (result < 0) {
        ExplosionPartsInfo parts;

        if (ds->hammerState == 0) {
            u32 rand;
            parts.spawnX = I(ds->hammerX) - gCamera.x;
            parts.spawnY = I(ds->hammerY) - gCamera.y;
            parts.velocity = 0;
            parts.rotation = 1000;
            parts.speed = Q(3);
            parts.vram = (void *)OBJ_VRAM0 + 0x2980;
            parts.anim = SA2_ANIM_EXPLOSION;
            parts.variant = 0;
            parts.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&parts, &ds->numPartsCreated);

            rand = PseudoRandom32();
            parts.spawnX = (I(ds->hammerX) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(ds->hammerY) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &ds->numPartsCreated);

            rand = PseudoRandom32();
            parts.spawnX = (I(ds->hammerX) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(ds->hammerY) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &ds->numPartsCreated);
        }

        if (ds->hammerSpeedY < Q(3)) {
            if (ds->hammerState == 0) {
                ds->hammerState = 1;
            }
            ds->hammerSpeedY = 0;
        }
        if (ds->hammerBounceSide != 0) {
            ds->hammerBounceSide = 0;
        } else {
            ds->hammerBounceSide = 1;
        }
        ds->hammerSpeedX -= 32;

        if (ds->hammerSpeedX < 0) {
            ds->hammerSpeedX = 0;
        }

        ds->hammerY += QS(result);
        ds->hammerSpeedY = I(-(ds->hammerSpeedY * 192));
    }

    if (ds->hammerBounceSide != 0) {
        ds->hammerAngle = CLAMP_SIN_PERIOD(ds->hammerAngle + DEG_TO_SIN(16.875));
    } else {
        ds->hammerAngle = CLAMP_SIN_PERIOD(ds->hammerAngle - DEG_TO_SIN(16.875));
    }
}

static void InitDestructionScene(void)
{
    s8 i;
    EggHammerTankII *boss;
    DestructionScene *ds = &boss->destructionScene;
    s32 x, y;
    SpriteTransform *transform;
    Sprite *s;

    boss = TASK_DATA(gCurTask);

    ds = &boss->destructionScene;

    boss->sceneTimer = 0;
    ds->axelsJoinedRemainingBounces = 5;
    ds->numPartsCreated = 0;
    s = &boss->body;
    s->graphics.anim = SA2_ANIM_HAMMERTANK_BODY_DESTROYED;
    s->variant = 0;
    s->prevVariant = -1;

    ds->bodyX = boss->x;
    ds->bodyY = boss->y;
    ds->bodySpeedX = boss->speedX;
    ds->bodySpeedY = -Q(3);

    for (i = 0; i < 4; i++) {
        if (i < 2) {
            ds->wheels[i].x = boss->x - Q(22);
        } else {
            ds->wheels[i].x = boss->x + Q(24);
        }

        ds->wheels[i].y = boss->y + boss->frontAxelY + Q(14.5);

        if (i < 2) {
            ds->wheels[i].speedX = boss->speedX + (i + 2) * 5;
        } else {
            ds->wheels[i].speedX = boss->speedX + i * 0x30;
        }

        ds->wheels[i].speedY = I((boss->frontAxelY * (-Q(0.375) - (i * 2))));
        ds->wheels[i].remainingBounces = 4;
        ds->wheels[i].despawnTimeout = 60;
    }

    for (i = 0; i < 8; i++) {
        ds->armSegments[i].x += gCamera.x;
        ds->armSegments[i].y += gCamera.y;

        ds->armSegments[i].x = Q(ds->armSegments[i].x);
        ds->armSegments[i].y = Q(ds->armSegments[i].y);

        ds->armSegments[i].speedX
            = boss->speedX + ((COS(boss->armSegmentAngles[i] & (SIN_PERIOD - 1)) * boss->armSegmentPositions[i]) >> 18);

        ds->armSegments[i].speedY = (SIN(boss->armSegmentAngles[i] & (SIN_PERIOD - 1)) * boss->armSegmentPositions[i]) >> 18;
        ds->armSegments[i].remainingBounces = 3;
        ds->armSegments[i].despawnTimeout = 30;
    }

    x = boss->x;
    y = boss->y;
    for (i = 0; i < 8; i++) {
        ds->hammerArmSegments[i].x = x
            + ((COS((boss->hammerArmSegmentAngles[i] + DEG_TO_SIN(270)) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 0xF);
        ds->hammerArmSegments[i].y = y
            + ((SIN((boss->hammerArmSegmentAngles[i] + DEG_TO_SIN(270)) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 0xf);
        ds->hammerArmSegments[i].speedX
            = boss->speedX + ((COS((boss->hammerArmSegmentAngles[i]) & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 0x12);
        ds->hammerArmSegments[i].speedY
            = (SIN(boss->hammerArmSegmentAngles[i] & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[i]) >> 18;
        ds->hammerArmSegments[i].remainingBounces = 3;
        ds->hammerArmSegments[i].despawnTimeout = 30;
    }

    transform = &boss->transform;
    ds->hammerX = x + ((COS(boss->hammerArmSegmentAngles[5] & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[5]) >> 15);
    ds->hammerY = y + ((SIN(boss->hammerArmSegmentAngles[5] & (SIN_PERIOD - 1)) * boss->hammerArmSegmentPositions[5]) >> 15);
    ds->hammerSpeedX = boss->speedX;
    ds->hammerSpeedY = boss->speedY - Q(8);
    ds->hammerAngle = transform->rotation;
    ds->hammerBounceSide = 1;
    ds->hammerState = 0;
}

static void DestructionScene_Render(EggHammerTankII *boss)
{
    u8 result;
    s32 i;
    Sprite *s;
    ExplosionPartsInfo init;
    DestructionScene *ds = &boss->destructionScene;

    SpriteTransform *transform;
    bool8 *pilotEscaped;

    boss->sceneTimer++;

    result = Div(boss->sceneTimer, 60);
    result = boss->sceneTimer + (result * -60);

    if (!(boss->sceneTimer & 7)) {
        i = result - (Div(result, 6) * 6);

        init.spawnX = I(ds->bodyX) - gCamera.x;
        init.spawnY = I(ds->bodyY) - gCamera.y;
        init.velocity = 0x40;
        init.rotation = PseudoRandom32() & (SIN_PERIOD - 1);
        init.speed = 0x600;
        init.vram = (void *)OBJ_VRAM0 + (gTileInfoBossScrews[i][0] * TILE_SIZE_4BPP);
        init.anim = gTileInfoBossScrews[i][1];
        init.variant = gTileInfoBossScrews[i][2];
        init.unk4 = 1;
        CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
    }

    if (Mod(boss->sceneTimer + PseudoRandom32(), 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    s = &boss->body;
    s->x = I(ds->bodyX) - gCamera.x;
    s->y = I(ds->bodyY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    // required for match
    pilotEscaped = &boss->pilotEscaped;

    for (i = 0; i < 2; i++) {
        result += 15;
        if (result == 60) {
            init.spawnX = s->x;
            init.spawnY = s->y;
            init.velocity = 0;
            init.rotation = 1000;
            init.speed = Q_8_8(3);
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }

        result += 15;
        if (result == 60) {
            init.spawnX = s->x + 10;
            init.spawnY = s->y + 16;
            init.velocity = 0;
            init.rotation = 1000;
            init.speed = Q_8_8(3);
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }

        result += 15;
        if (result == 60) {
            init.spawnX = s->x - 10;
            init.spawnY = s->y + 8;
            init.velocity = 0;
            init.rotation = 1000;
            init.speed = Q_8_8(3);
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }

        result += 15;
        if (result == 60) {
            init.spawnX = s->x + 10;
            init.spawnY = s->y - 0x10;
            init.velocity = 0;
            init.rotation = 1000;
            init.speed = Q_8_8(3);
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }

        result += 15;
        if (result == 60) {
            init.spawnX = s->x - 10;
            init.spawnY = s->y - 8;
            init.velocity = 0;
            init.rotation = 1000;
            init.speed = Q_8_8(3);
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->numPartsCreated);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }
    }

    if (s->x < 50 && !*pilotEscaped) {
        *pilotEscaped = TRUE;
        CreateEggmobileEscapeSequence(s->x, s->y, SPRITE_FLAG(PRIORITY, 2));
    }

    if (I(ds->bodyX) - gCamera.x < -200) {
        ds->fade.window = 0;
        ds->fade.brightness = 0;
        ds->fade.flags = 2;
        ds->fade.speed = 0;
        ds->fade.bldCnt = 0xBF;
        ds->fade.bldAlpha = 0;
        boss->sceneTimer = 0;
        gCurTask->main = Task_DestructionSceneOutro;
    }

    if (!*pilotEscaped) {
        s = &boss->pilot;
        s->x = I(ds->bodyX) - gCamera.x;
        s->y = I(ds->bodyY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->wheels[0].remainingBounces != 0 || (ds->wheels[0].despawnTimeout & 1)) {
        s = &boss->wheel;
        s->x = I(ds->wheels[0].x) - gCamera.x;
        s->y = I(ds->wheels[0].y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->wheels[1].remainingBounces != 0 || (ds->wheels[1].despawnTimeout & 1)) {
        s = &boss->wheel;
        s->x = I(ds->wheels[1].x) - gCamera.x;
        s->y = I(ds->wheels[1].y) - gCamera.y;
        DisplaySprite(s);
    }

    if (ds->wheels[2].remainingBounces != 0 || (ds->wheels[2].despawnTimeout & 1)) {
        s = &boss->brokenWheel;
        s->x = I(ds->wheels[2].x) - gCamera.x;
        s->y = I(ds->wheels[2].y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->wheels[3].remainingBounces != 0 || (ds->wheels[3].despawnTimeout & 1)) {
        s = &boss->brokenWheel;
        s->x = I(ds->wheels[3].x) - gCamera.x;
        s->y = I(ds->wheels[3].y) - gCamera.y;
        DisplaySprite(s);
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(18);

    for (i = 6; i > -1; i--) {
        s->x = I(ds->armSegments[i].x) - gCamera.x;
        s->y = I(ds->armSegments[i].y) - gCamera.y;
        if (ds->armSegments[i].remainingBounces != 0 || (ds->armSegments[i].despawnTimeout != 0 && boss->sceneTimer & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(25);
    for (i = 0; i < 6; i++) {
        s->x = I(ds->hammerArmSegments[i].x) - gCamera.x;
        s->y = I(ds->hammerArmSegments[i].y) - gCamera.y;
        if (ds->hammerArmSegments[i].remainingBounces != 0 || (ds->hammerArmSegments[i].despawnTimeout != 0 && boss->sceneTimer & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->hammer;
    transform = &boss->transform;

    s->x = I(ds->hammerX) - gCamera.x;
    s->y = I(ds->hammerY) - gCamera.y;
    s->frameFlags = gOamMatrixIndex++ | 0x2060;

    if (ds->hammerState != 0) {
        ds->hammerState = 2;
    } else {
        transform->rotation = ds->hammerAngle;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
        transform->x = s->x;
        transform->y = s->y;
        TransformSprite(s, transform);
        DisplaySprite(s);
    }
}

void EggHammerTankIIMove(s32 x, s32 y)
{
    u8 i;
    EggHammerTankII *boss = TASK_DATA(gActiveBossTask);
    DestructionScene *ds = &boss->destructionScene;

    ds->bodyX += x;
    boss->x += x;
    ds->bodyY += y;
    boss->y += y;

    for (i = 0; i < 4; i++) {
        ds->wheels[i].x += x;
        ds->wheels[i].y += y;
    }

    for (i = 0; i < 8; i++) {
        ds->armSegments[i].x += x;
        ds->armSegments[i].y += y;
    }

    for (i = 0; i < 8; i++) {
        ds->hammerArmSegments[i].x += x;
        ds->hammerArmSegments[i].y += y;
    }

    ds->hammerX += x;
    ds->hammerY += y;
}

static void TaskDestructor_EggHammerTankII(struct Task *t)
{
    EggHammerTankII *boss = TASK_DATA(t);
    VramFree(boss->body.graphics.dest);
    VramFree(boss->armSegment.graphics.dest);
    VramFree(boss->hand.graphics.dest);
    VramFree(boss->pilot.graphics.dest);
    VramFree(boss->wheel.graphics.dest);
    VramFree(boss->brokenWheel.graphics.dest);
    VramFree(boss->hammer.graphics.dest);

    if (boss->cream.graphics.dest != NULL) {
        VramFree(boss->cream.graphics.dest);
    }
    if (boss->cheese.graphics.dest != NULL) {
        VramFree(boss->cheese.graphics.dest);
    }

    gActiveBossTask = NULL;
}

static void Task_EggHammerTankII_Main(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    sGroundPhysicsHandlers[IsBossTouchingTerrain()]();
    sBossStateHandlers[boss->hammerState](boss);

    UpdateArmSegments(boss);
    HandleCollision(boss);
    HandlePilotAnim(boss);
    Render(boss);
    HandleBossHitPalette(boss);

    if (boss->health == 0) {
        InitDestructionScene();
        gCurTask->main = Task_DestructionScene_Main;
        Player_DisableInputAndBossTimer();
    }
}

static void Task_DestructionScene_Main(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);

    DestructionScene_UpdateComponents(boss);
    DestructionScene_Render(boss);
}

static bool8 IsBossTouchingTerrain(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    s32 x, y;
    s32 result;
    x = (boss->x + Q(24));
    y = (boss->y + boss->rearAxelY + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result > 0) {
        x = (boss->x - Q(22));
        y = (boss->y + boss->frontAxelY + Q(14.5));
        result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);

        if (result > 0) {
            return FALSE;
        }
    }

    return TRUE;
}

static void PhysicsHandler_Falling(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    boss->speedY += Q(0.25);
    boss->rearAxelY += Q(1.125);
    boss->frontAxelY += Q(1.125);

    if (boss->rearAxelY > Q(23.5)) {
        boss->rearAxelY = Q(23.5);
    }

    if (boss->frontAxelY > Q(23.5)) {
        boss->frontAxelY = Q(23.5);
    }
}

static void UpdateArmSegments(EggHammerTankII *boss)
{
    u8 i;
    boss->armBaseSin = (boss->armBaseSin + 8) & (SIN_PERIOD - 1);
    boss->armBaseAngle = SIN(boss->armBaseSin) >> 8;
    boss->armSegmentAngles[0] = boss->armBaseAngle;

    for (i = 1; i < ARRAY_COUNT(boss->armSegmentPositions); i++) {
        boss->armSegmentAngles[i] += I((boss->armSegmentAngles[i - 1] - boss->armSegmentAngles[i]) * sQArmSegmentAngleOffsets[i] - Q(12));
    }
}

/**
 * Called hammer aim but really it's just a slight delay before
 * plunging
 */
static void StateHandler_HammerAim(EggHammerTankII *boss)
{
    if (--boss->timer == 0) {
        boss->timer = 60;
        boss->hammerState = EGG_HAMMER_TANK_II_STATE_PLUNGE;
    }
}

static void StateHandler_HammerSlam(EggHammerTankII *boss)
{
    if (--boss->timer == 0) {
        if (PseudoRandBetween(0, 4) != 0) {
            boss->timer = 68;
            boss->hammerState = EGG_HAMMER_TANK_II_STATE_HOLD;
        } else {
            m4aSongNumStart(SE_239);
            boss->timer = 60;
            boss->hammerState = EGG_HAMMER_TANK_II_STATE_DRAG;
        }
    }
}

static void PilotLaugh(EggHammerTankII *boss)
{
    boss->timerPilotLaugh = 30;
    if (boss->timerInvulnerability == 0) {
        Sprite *s = &boss->pilot;
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void HandleBossHitPalette(EggHammerTankII *boss)
{
    if (boss->timerInvulnerability > 0) {
        u8 i;

        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(8, i, gUnknown_080D7AD0[(boss->timerInvulnerability & 4) >> 2][i]);
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }
}
