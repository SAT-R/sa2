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

typedef struct {
    ScreenFade fade; /* 0xB4 */

    s32 bodyX;
    s32 bodyY;
    s32 bodySpeedX;
    s32 bodySpeedY;

    s32 unkD0;
    s32 unkD4;
    s32 unkD8;
    s32 unkDC;
    s32 unkE0;
    s32 unkE4;

    s32 unkE8;
    s32 unkEC;
    s32 unkF0;
    s32 unkF4;

    s32 unkF8[8][6];
    s32 unk1B8[8][6];
    s32 unk278[4][6];
    u16 unk2D8;

    // unused
    u8 filler2DA;
    u8 filler2DB;

    u8 unk2DC;
    u8 unk2DD;
} DestructionScene;

typedef struct {
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;

    s32 unkC[2][8];
    u32 unk4C;
    u32 unk50;
    s32 unk54[2][8];

    s32 unk94;
    s32 unk98;
    s32 unk9C;
    u32 state;
    u32 unkA4;
    u32 sceneTimer;

    u32 timer;

    u8 health;
    u8 timerInvulnerability;
    u8 unkB2;
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
static void TaskDestructor_EggHammerTankIIMain(struct Task *);
static void Task_803C980(void);
static void Task_803CA1C(void);

static void sub_803CB18(EggHammerTankII *);
static void sub_803AC2C(EggHammerTankII *);
static void sub_803CBFC(EggHammerTankII *boss);
static void HandleBossHit(EggHammerTankII *boss);
static void sub_803CC3C(EggHammerTankII *boss);
static void sub_803B17C(EggHammerTankII *boss);
static void sub_803B264(EggHammerTankII *boss);
static void sub_803CB84(EggHammerTankII *boss);
static void sub_803B2F8(EggHammerTankII *boss);
static void sub_803CBA4(EggHammerTankII *boss);
static void sub_803B4A0(EggHammerTankII *boss);
static void sub_803B57C(EggHammerTankII *boss);
static void sub_803B62C(EggHammerTankII *boss);

static void sub_803CAC8(void);
static void sub_803B018(void);
static bool8 sub_803CA40(void);

static const s16 gUnknown_080D7A18[] = {
    96, 104, 112, 120, 128, 136, 144, 152,
};
static const s16 gUnknown_080D7A28[] = {
    160, 156, 152, 148, 144, 140, 136, 132,
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

static const TaskMain gUnknown_080D7AA8[] = { sub_803CAC8, sub_803B018 };

static const HammertankFunc sBossStateHandlers[] = {
    sub_803B17C, sub_803B264, sub_803CB84, sub_803B2F8, sub_803CBA4, sub_803B4A0, sub_803B57C, sub_803B62C,
};

static const u16 gUnknown_080D7AD0[][16] = {
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
    t = TaskCreate(Task_EggHammerTankII_RollIn, sizeof(EggHammerTankII), 0x4000, 0, TaskDestructor_EggHammerTankIIMain);

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
    boss->unkA4 = 2;
    boss->state = 0;
    boss->timer = 120;

    boss->timerInvulnerability = 0;
    boss->unkB2 = 0;
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
        boss->unkC[1][i] = 0;
        boss->unkC[0][i] = gUnknown_080D7A38[i];
    }

    boss->unk4C = 0;
    boss->unk50 = 0;

    for (i = 0; i < 8; i++) {
        boss->unk54[1][i] = 768;
        boss->unk54[0][i] = gUnknown_080D7A58[i];
    }

    boss->unk94 = 768;
    boss->unk98 = Q(18.5);
    boss->unk9C = Q(18.5);

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

    s->frameFlags = (gUnknown_030054B8++) | 0x2060;

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
        gCurTask->main = Task_803C980;
    }

    gUnknown_080D7AA8[sub_803CA40()]();
    sub_803CB18(boss);
    sub_803AC2C(boss);
}

static void sub_803A8E4(EggHammerTankII *boss)
{
    Vec2_32 pos;
    Sprite *s;

    if (boss->timerInvulnerability == 0) {
        if (boss->state < 5 || boss->state == 6) {
            s32 r0;

#ifndef NON_MATCHING
            register s32 r2 asm("r2");
#else
            s32 r2;
#endif

            r2 = I(boss->x);
            r0 = (((boss->unk54[0][5] * COS(boss->unk54[1][5] & (SIN_PERIOD - 1))) >> 0x17) - 8);
            pos.x = r2 + r0;

            r2 = I(boss->y);
            r0 = ((boss->unk54[0][5] * SIN(boss->unk54[1][5] & (SIN_PERIOD - 1)) >> 0x17));
            pos.y = r2 + r0;

            pos.x -= I(gPlayer.qWorldX);
            pos.y -= I(gPlayer.qWorldY);
            if ((SQUARE(pos.x) + SQUARE(pos.y)) < 0x1A4) {
                sub_803CBFC(boss);
                Player_CollisionDamage(&gPlayer);
            }
        }

        s = &boss->body;
        pos.x = I(boss->x);
        pos.y = I(boss->y);

        s->x = pos.x - gCamera.x;
        s->y = pos.y - gCamera.y;

        Player_EnemyCollision(s, pos.x, pos.y, 1, &gPlayer);
        Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

        if (boss->timerInvulnerability == 0 || ((gPlayer.qSpeedAirY > 0 || !(gPlayer.moveState & 2)) && (gPlayer.moveState & 2))) {
            if (Player_AttackBossCollision(s, pos.x, pos.y, 0, &gPlayer) == 1) {
                HandleBossHit(boss);
            } else {
                Player_EnemyCollision(s, pos.x, pos.y, 0, &gPlayer);
            }

            if (boss->timerInvulnerability == 0 && Cheese_IsSpriteColliding(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
                HandleBossHit(boss);
            }
        }
    }
}

static void sub_803AA40(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    ScreenFade *fade = &boss->destructionScene.fade;
    boss->sceneTimer++;

    if (boss->sceneTimer > 8) {
        switch (boss->sceneTimer) {
            case 9:
                gFlags &= ~FLAGS_4;
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
        Cheese *thing;
        fade->flags = SCREEN_FADE_FLAG_2;
        fade->brightness = Q(0);
        fade->speed = Q(0);
        UpdateScreenFade(fade);

        if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            gPlayer.charState = CHARSTATE_SONIC_CATCHING_CREAM;
        }

        if (IS_FINAL_STAGE(gCurrentLevel) && (boss->sceneTimer == 0x22)) {
            s32 x, y;

            x = gUnknown_080D6DE4[0][0] - I(gPlayer.qWorldX);
            y = gUnknown_080D6DE4[0][1] - I(gPlayer.qWorldY);

            gPlayer.qWorldX += QS(x);
            gPlayer.qWorldY += QS(y);

            gCamera.x += x;
            gCamera.y += y;

            gCamera.unk20 += x;
            gCamera.unk24 += y;

            gCamera.unk10 += x;
            gCamera.unk14 += y;

            thing = gCheese;
            if (thing != NULL) {
                thing->posX += QS(x);
                thing->posY += QS(y);
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

static void sub_803AC2C(EggHammerTankII *boss)
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
    s->y = I(boss->y + boss->unk98 + Q(14.5)) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->wheel;
    s->x = I(boss->x + Q(24)) - gCamera.x;
    s->y = I(boss->y + boss->unk9C + Q(14.5)) - gCamera.y;
    DisplaySprite(s);

    s = &boss->brokenWheel;
    s->x = I(boss->x - Q(22)) - gCamera.x;
    s->y = I(boss->y + boss->unk98 + Q(14.5)) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenWheel;
    s->x = I(boss->x + Q(24)) - gCamera.x;
    s->y = I(boss->y + boss->unk9C + Q(14.5)) - gCamera.y;
    DisplaySprite(s);

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    x = I(boss->x) - gCamera.x;
    y = I(boss->y) - gCamera.y;

    for (i = 6; i >= 0; i--) {
        s->x = x + ((COS((boss->unkC[1][i] + 80) & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 23);
        s->y = y + ((SIN((boss->unkC[1][i] + 80) & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 23);
        DisplaySprite(s);

        if (boss->health != 0) {
            ds->unkF8[i][0] = s->x;
            ds->unkF8[i][1] = s->y;
        }
    }

    s = &boss->hand;
    s->x = x + ((COS((boss->unkC[1][7] + 80) & (SIN_PERIOD - 1)) * boss->unkC[0][7]) >> 23);
    s->y = y + ((SIN((boss->unkC[1][7] + 80) & (SIN_PERIOD - 1)) * boss->unkC[0][7]) >> 23);

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
        s->x = x - 8 + ((COS((boss->unk54[1][i]) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 23);
        s->y = y + ((SIN((boss->unk54[1][i]) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 23);
        DisplaySprite(s);
    }

    s = &boss->hammer;
    transform = &boss->transform;

    s->x = x - 8 + ((COS((boss->unk54[1][5]) & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 23);
    s->y = y + ((SIN((boss->unk54[1][5]) & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 23);
    s->frameFlags = gUnknown_030054B8++ | 0x2060;

    transform->rotation = (boss->unk54[1][5] - (boss->unk94) + boss->unk54[1][5]) & (SIN_PERIOD - 1);
    if (transform->rotation != 768) {
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

static void sub_803B018(void)
{
    s32 result;
    s32 x, y;
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    s32 origY;
    s32 idx;
    boss->speedY = 0;
    origY = boss->y;
    x = (boss->x + Q(24));
    y = (origY + boss->unk9C + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result < 1) {
        boss->y += result * 64;
        idx = -result;
        if (idx > 7) {
            idx = 7;
        }
        boss->unk9C -= (idx * gUnknown_080D7A18[idx] - idx * 64);
    } else {
        boss->unk9C += 288;
    }

    boss->y -= I((Q(18.5) - boss->unk9C) * Q(0.375));

    if (boss->unk9C < Q(14.5)) {
        boss->unk9C = Q(14.5);
    }
    if (boss->unk9C > Q(23.5)) {
        boss->unk9C = Q(23.5);
    }

    x = (boss->x - Q(22));
    y = (origY + boss->unk98 + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result < 1) {
        boss->y += (result * 0x40);

        idx = -result;
        if (idx > 7) {
            idx = 7;
        }
        boss->unk98 -= (idx * gUnknown_080D7A18[idx] - idx * 0x40);
    } else {
        boss->unk98 += 288;
    }

    boss->y -= I((Q(18.5) - boss->unk98) * Q(0.375));

    if (boss->unk98 < Q(14.5)) {
        boss->unk98 = Q(14.5);
    }
    if (boss->unk98 > Q(23.5)) {
        boss->unk98 = Q(23.5);
    }
}

static void sub_803B17C(EggHammerTankII *boss)
{
    u8 i;

    boss->unk94 -= 8;

    if (boss->unk94 < 768) {
        boss->unk94 = 768;
    }
    boss->unk54[1][0] = boss->unk94;

    for (i = 1; i < ARRAY_COUNT(boss->unk54[0]); i++) {
        boss->unk54[1][i] += I((boss->unk54[1][i - 1] - boss->unk54[1][i]) * gUnknown_080D7A78[i + 8]);
    }

    boss->timer -= 1;

    if (boss->timer == 0) {
        boss->timer = 10;
        boss->state = 1;

        for (i = 0; i < ARRAY_COUNT(boss->unk54[0]); i++) {
            boss->unk54[1][i] = 768;
            boss->unk54[0][i] = gUnknown_080D7A58[i];
        }

        boss->unk94 = 768;
        if (boss->unkA4 & 2) {
            boss->unkA4 = 1;
        } else {
            boss->unkA4 = boss->unkA4 << 1;
        }
    }
}

static void sub_803B264(EggHammerTankII *boss)
{
    u8 i, j;
    s16 acc, val;
    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7A98); i++) {
        if ((boss->unkA4 & val)) {
            val = gUnknown_080D7A98[i];
            break;
        }
        val = val << 1;
    }

    acc = 0;
    for (j = 0; j < 8; j++) {
        acc += val;
        boss->unk54[0][j] += acc;
    }

    if (--boss->timer == 0) {
        boss->timer = 15;
        boss->state = 2;
    }
}

static void sub_803B2F8(EggHammerTankII *boss)
{
    s32 x, y;
    u8 i, val;
    s32 result;

    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7AA2); i++) {
        if (boss->unkA4 & val) {
            val = gUnknown_080D7AA2[i];
            break;
        }
        val <<= 1;
    }

    boss->unk94 -= (SIN((60 - boss->timer) * 4) >> 9);
    boss->unk94 &= (SIN_PERIOD - 1);
    boss->unk54[1][0] = boss->unk94;

    for (i = 1; i < ARRAY_COUNT(boss->unk54[0]); i++) {
        boss->unk54[1][i] += I((boss->unk54[1][i - 1] - boss->unk54[1][i]) * gUnknown_080D7A78[i]);
    }

    x = I(boss->x) + ((boss->unk54[0][7] * COS((boss->unk54[1][7] - val) & (SIN_PERIOD - 1))) >> 0x17);
    y = I(boss->y) + ((boss->unk54[0][7] * SIN((boss->unk54[1][7] - val) & (SIN_PERIOD - 1))) >> 0x17);

    result = sub_801E6D4(y, x, 1, 8, NULL, sub_801EE64);

    if (result < 1) {
        m4aSongNumStart(SE_238);
        boss->timer = 30;
        boss->state = 4;

        result = sub_8004418(SIN((boss->unk54[1][7] + val) & (SIN_PERIOD - 1)) >> 6,
                             (COS((boss->unk54[1][7] + val) & (SIN_PERIOD - 1)) >> 6) + result);

        for (i = 0; i < ARRAY_COUNT(boss->unk54[0]); i++) {
            boss->unk54[1][i] = result;
        }
        boss->unk94 = result;
        CreateScreenShake(0x800, 0x10, 0x80, 0x14, 0x83);
    } else if (--boss->timer == 0) {
        boss->timer = 30;
        boss->state = 4;
    }
}

static void sub_803B4A0(EggHammerTankII *boss)
{
    u8 i;
    s32 val;

    boss->unk94 += 8;
    boss->unk54[1][0] = boss->unk94;

    for (i = 1; i < ARRAY_COUNT(boss->unk54[0]); i++) {
        boss->unk54[1][i] += I((boss->unk54[1][i - 1] - boss->unk54[1][i]) * gUnknown_080D7A78[i + 8]);
    }

    for (i = 0, val = 1; i < ARRAY_COUNT(gUnknown_080D7A98); i++) {
        if (boss->unkA4 & val) {
            val = gUnknown_080D7A98[i] * 2;
            break;
        }
        val <<= 1;
    }

    if (boss->timer < 58) {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7A58); i++) {
            boss->unk54[0][i] -= val;
            if (boss->unk54[0][i] < gUnknown_080D7A58[i]) {
                boss->unk54[0][i] = gUnknown_080D7A58[i];
            }
        }
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 0x50;
        boss->state = 0;
    }
}

static void sub_803B57C(EggHammerTankII *boss)
{
    s32 i;
    s32 acc, val;
    for (i = 0, val = 1; i < 5; i++) {
        if ((boss->unkA4 & val)) {
            val = gUnknown_080D7A98[i] >> 2;
            break;
        }
        val = val << 1;
    }

    acc = val;
    for (i = 0; i < 8; i++) {
        acc += val;
        boss->unk54[0][i] -= acc;
        if (boss->unk54[0][i] < gUnknown_080D7A58[i]) {
            boss->unk54[0][i] = gUnknown_080D7A58[i];
            boss->timer = 68;
            boss->state = 5;
        }
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 68;
        boss->state = 5;
    }
}

static void sub_803B62C(EggHammerTankII *boss)
{
    u8 i;
    boss->unk94 += 0xC;
    if (boss->timer > 768) {
        boss->unk94 = 768;
    }

    boss->unk54[1][0] = boss->unk94;
    for (i = 1; i < 8; i++) {
        boss->unk54[1][i] += I((boss->unk54[1][i - 1] - boss->unk54[1][i]) * gUnknown_080D7A78[i]);
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 80;
        boss->state = 0;
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

static void sub_803B7B0(EggHammerTankII *boss)
{
    Sprite *s = &boss->pilot;
    if (boss->timerInvulnerability > 0) {
        boss->unkB2 = 0;

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
        if (boss->unkB2 == 0) {
            return;
        }

        if (--boss->unkB2 != 0) {
            return;
        }

        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 0;
        s->prevVariant = -1;
    }
}

static void sub_803B84C(EggHammerTankII *boss)
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
    if (ds->unk2DC != 0) {
        ds->unk278[0][0] = ds->bodyX - Q(22);
        ds->unk278[0][1] = ds->bodyY + boss->unk98 + Q(14.5);
        ds->unk278[1][0] = ds->bodyX + Q(24);
        ds->unk278[1][1] = ds->bodyY + boss->unk9C + Q(14.5);
        ds->unk278[2][0] = ds->bodyX - Q(22);
        ds->unk278[2][1] = ds->bodyY + boss->unk98 + Q(14.5);
        ds->unk278[3][0] = ds->bodyX + Q(24);
        ds->unk278[3][1] = ds->bodyY + boss->unk9C + Q(14.5);
    } else {
        for (i = 0; i < 4; i++) {
            s32 result1;
            ds->unk278[i][2]--;
            if (ds->unk278[i][2] < 128) {
                ds->unk278[i][2] = 128;
            }
            ds->unk278[i][3] += 0x28;
            ds->unk278[i][0] += ds->unk278[i][2];
            ds->unk278[i][1] += ds->unk278[i][3];

            result1 = sub_801F100(I(ds->unk278[i][1]), I(ds->unk278[i][0]), 1, 8, sub_801EC3C);
            if (result1 < 0) {
                s32 r0;
                if (ds->unk278[i][4] != 0) {
                    ds->unk278[i][4]--;
                }
                ds->unk278[i][1] += Q(result1);
                r0 = ds->unk278[i][3] * 3;
                r0 = (r0 * 4) - ds->unk278[i][3];
                r0 *= 16;
                ds->unk278[i][3] = I(-r0);
            }

            if (ds->unk278[i][4] == 0) {
                if (ds->unk278[i][5] != 0) {
                    ds->unk278[i][5]--;
                }
            }
        }
    }

    if (result < 0) {
        if (ds->unk2DC != 0) {
            ds->unk2DC--;
            ds->bodySpeedY = -ds->bodySpeedY;
        } else {
            s32 r0;
            ds->bodySpeedX -= 32;
            r0 = (ds->bodySpeedY * 27);
            ds->bodySpeedY = I(-(r0 * 8));
        }

        if (ds->bodySpeedY > -160) {
            ds->bodySpeedY = 0;
        }

        ds->bodyY += QS(result);
    }

    for (i = 0; i < 8; i++) {
        ds->unkF8[i][3] += Q(0.125);
        if (ds->unkF8[i][2] > 0) {
            ds->unkF8[i][0] += ds->unkF8[i][2];
        }

        ds->unkF8[i][1] += ds->unkF8[i][3];

        result = sub_801F100(I(ds->unkF8[i][1]) + 5, I(ds->unkF8[i][0]), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (ds->unkF8[i][4] != 0) {
                ds->unkF8[i][4]--;
            }
            ds->unkF8[i][2] -= Q(0.125);
            ds->unkF8[i][1] += QS(result);
            ds->unkF8[i][3] = I(ds->unkF8[i][3] * ((i * 4) - Q(0.25)));
        }

        if (ds->unkF8[i][4] == 0) {
            if (ds->unkF8[i][5] != 0) {
                ds->unkF8[i][5]--;
            }
        }

        ds->unk1B8[i][3] += 40;
        if (ds->unk1B8[i][2] > 0) {
            ds->unk1B8[i][0] += ds->unk1B8[i][2];
        }

        ds->unk1B8[i][1] += ds->unk1B8[i][3];

        result = sub_801F100(I(ds->unk1B8[i][1]) + 5, I(ds->unk1B8[i][0]), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (ds->unk1B8[i][4] != 0) {
                ds->unk1B8[i][4]--;
            }
            ds->unk1B8[i][2] -= 32;
            ds->unk1B8[i][1] += QS(result);
            ds->unk1B8[i][3] = I(ds->unk1B8[i][3] * -((i * 4) + 64));
        }

        if (ds->unk1B8[i][4] == 0) {
            if (ds->unk1B8[i][5] != 0) {
                ds->unk1B8[i][5]--;
            }
        }
    }

    ds->unkDC += Q(0.375);
    ds->unkD0 += ds->unkD8;
    ds->unkD4 += ds->unkDC;

    result = sub_801F100(I(ds->unkD4) + 24, I(ds->unkD0), 1, 8, sub_801EC3C);
    if (result < 0) {
        ExplosionPartsInfo parts;

        if (ds->unkE4 == 0) {
            u32 rand;
            parts.spawnX = I(ds->unkD0) - gCamera.x;
            parts.spawnY = I(ds->unkD4) - gCamera.y;
            parts.velocity = 0;
            parts.rotation = 1000;
            parts.speed = 768;
            parts.vram = (void *)OBJ_VRAM0 + 0x2980;
            parts.anim = SA2_ANIM_EXPLOSION;
            parts.variant = 0;
            parts.unk4 = ds->unkE4;
            CreateBossParticleWithExplosionUpdate(&parts, &ds->unk2DD);

            rand = PseudoRandom32();
            parts.spawnX = (I(ds->unkD0) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(ds->unkD4) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &ds->unk2DD);

            rand = PseudoRandom32();
            parts.spawnX = (I(ds->unkD0) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(ds->unkD4) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &ds->unk2DD);
        }

        if (ds->unkDC < 768) {
            if (ds->unkE4 == 0) {
                ds->unkE4 = 1;
            }
            ds->unkDC = 0;
        }
        if (ds->unkE0 != 0) {
            ds->unkE0 = 0;
        } else {
            ds->unkE0 = 1;
        }
        ds->unkD8 -= 32;

        if (ds->unkD8 < 0) {
            ds->unkD8 = 0;
        }

        ds->unkD4 += QS(result);
        ds->unkDC = I(-(ds->unkDC * 192));
    }

    if (ds->unkE0 != 0) {
        ds->unk2D8 = CLAMP_SIN_PERIOD(ds->unk2D8 + 48);
    } else {
        ds->unk2D8 = CLAMP_SIN_PERIOD(ds->unk2D8 - 48);
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
    ds->unk2DC = 5;
    ds->unk2DD = 0;
    s = &boss->body;
    s->graphics.anim = SA2_ANIM_HAMMERTANK_BODY_DESTROYED;
    s->variant = 0;
    s->prevVariant = -1;

    ds->bodyX = boss->x;
    ds->bodyY = boss->y;
    ds->bodySpeedX = boss->speedX;
    ds->bodySpeedY = -768;

    for (i = 0; i < 4; i++) {
        if (i < 2) {
            ds->unk278[i][0] = boss->x - Q(22);
        } else {
            ds->unk278[i][0] = boss->x + Q(24);
        }

        ds->unk278[i][1] = boss->y + boss->unk98 + Q(14.5);

        if (i < 2) {
            ds->unk278[i][2] = boss->speedX + (i + 2) * 5;
        } else {
            ds->unk278[i][2] = boss->speedX + i * 0x30;
        }

        ds->unk278[i][3] = I((boss->unk98 * (-Q(0.375) - (i * 2))));
        ds->unk278[i][4] = 4;
        ds->unk278[i][5] = 60;
    }

    for (i = 0; i < 8; i++) {
        ds->unkF8[i][0] += gCamera.x;
        ds->unkF8[i][1] += gCamera.y;

        ds->unkF8[i][0] = Q(ds->unkF8[i][0]);
        ds->unkF8[i][1] = Q(ds->unkF8[i][1]);

        ds->unkF8[i][2] = boss->speedX + ((COS(boss->unkC[1][i] & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 18);

        ds->unkF8[i][3] = (SIN(boss->unkC[1][i] & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 18;
        ds->unkF8[i][4] = 3;
        ds->unkF8[i][5] = 30;
    }

    x = boss->x;
    y = boss->y;
    for (i = 0; i < 8; i++) {
        ds->unk1B8[i][0] = x + ((COS((boss->unk54[1][i] + 768) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0xF);
        ds->unk1B8[i][1] = y + ((SIN((boss->unk54[1][i] + 768) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0xf);
        ds->unk1B8[i][2] = boss->speedX + ((COS((boss->unk54[1][i]) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0x12);
        ds->unk1B8[i][3] = (SIN(boss->unk54[1][i] & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 18;
        ds->unk1B8[i][4] = 3;
        ds->unk1B8[i][5] = 30;
    }

    transform = &boss->transform;
    ds->unkD0 = x + ((COS(boss->unk54[1][5] & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 15);
    ds->unkD4 = y + ((SIN(boss->unk54[1][5] & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 15);
    ds->unkD8 = boss->speedX;
    ds->unkDC = boss->speedY - Q(8);
    ds->unk2D8 = transform->rotation;
    ds->unkE0 = 1;
    ds->unkE4 = 0;
}

static void sub_803C198(EggHammerTankII *boss)
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
        CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
            init.speed = 768;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
            init.speed = 768;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
            init.speed = 768;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
            init.speed = 768;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
            init.speed = 768;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &ds->unk2DD);
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
        gCurTask->main = sub_803AA40;
    }

    if (!*pilotEscaped) {
        s = &boss->pilot;
        s->x = I(ds->bodyX) - gCamera.x;
        s->y = I(ds->bodyY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->unk278[0][4] != 0 || (ds->unk278[0][5] & 1)) {
        s = &boss->wheel;
        s->x = I(ds->unk278[0][0]) - gCamera.x;
        s->y = I(ds->unk278[0][1]) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->unk278[1][4] != 0 || (ds->unk278[1][5] & 1)) {
        s = &boss->wheel;
        s->x = I(ds->unk278[1][0]) - gCamera.x;
        s->y = I(ds->unk278[1][1]) - gCamera.y;
        DisplaySprite(s);
    }

    if (ds->unk278[2][4] != 0 || (ds->unk278[2][5] & 1)) {
        s = &boss->brokenWheel;
        s->x = I(ds->unk278[2][0]) - gCamera.x;
        s->y = I(ds->unk278[2][1]) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (ds->unk278[3][4] != 0 || (ds->unk278[3][5] & 1)) {
        s = &boss->brokenWheel;
        s->x = I(ds->unk278[3][0]) - gCamera.x;
        s->y = I(ds->unk278[3][1]) - gCamera.y;
        DisplaySprite(s);
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(18);

    for (i = 6; i > -1; i--) {
        s->x = I(ds->unkF8[i][0]) - gCamera.x;
        s->y = I(ds->unkF8[i][1]) - gCamera.y;
        if (ds->unkF8[i][4] != 0 || (ds->unkF8[i][5] != 0 && boss->sceneTimer & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(25);
    for (i = 0; i < 6; i++) {
        s->x = I(ds->unk1B8[i][0]) - gCamera.x;
        s->y = I(ds->unk1B8[i][1]) - gCamera.y;
        if (ds->unk1B8[i][4] != 0 || (ds->unk1B8[i][5] != 0 && boss->sceneTimer & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->hammer;
    transform = &boss->transform;

    s->x = I(ds->unkD0) - gCamera.x;
    s->y = I(ds->unkD4) - gCamera.y;
    s->frameFlags = gUnknown_030054B8++ | 0x2060;

    if (ds->unkE4 != 0) {
        ds->unkE4 = 2;
    } else {
        transform->rotation = ds->unk2D8;
        transform->qScaleX = 256;
        transform->qScaleY = 256;
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
        ds->unk278[i][0] += x;
        ds->unk278[i][1] += y;
    }

    for (i = 0; i < 8; i++) {
        ds->unkF8[i][0] += x;
        ds->unkF8[i][1] += y;
    }

    for (i = 0; i < 8; i++) {
        ds->unk1B8[i][0] += x;
        ds->unk1B8[i][1] += y;
    }

    ds->unkD0 += x;
    ds->unkD4 += y;
}

static void TaskDestructor_EggHammerTankIIMain(struct Task *t)
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

static void Task_803C980(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    gUnknown_080D7AA8[sub_803CA40()]();
    sBossStateHandlers[boss->state](boss);

    sub_803CB18(boss);
    sub_803A8E4(boss);
    sub_803B7B0(boss);
    sub_803AC2C(boss);
    sub_803CC3C(boss);

    if (boss->health == 0) {
        InitDestructionScene();
        gCurTask->main = Task_803CA1C;
        Player_DisableInputAndBossTimer();
    }
}

static void Task_803CA1C(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);

    sub_803B84C(boss);
    sub_803C198(boss);
}

bool8 sub_803CA40(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    s32 x, y;
    s32 result;
    x = (boss->x + Q(24));
    y = (boss->y + boss->unk9C + Q(14.5));

    result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);
    if (result > 0) {
        x = (boss->x - Q(22));
        y = (boss->y + boss->unk98 + Q(14.5));
        result = sub_801F100(I(y), I(x), 1, 8, sub_801EC3C);

        if (result > 0) {
            return FALSE;
        }
    }

    return TRUE;
}

static void sub_803CAC8(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    boss->speedY += Q(0.25);
    boss->unk9C += Q(1.125);
    boss->unk98 += Q(1.125);

    if (boss->unk9C > Q(23.5)) {
        boss->unk9C = Q(23.5);
    }

    if (boss->unk98 > Q(23.5)) {
        boss->unk98 = Q(23.5);
    }
}

static void sub_803CB18(EggHammerTankII *boss)
{
    u8 i;
    boss->unk4C = (boss->unk4C + 8) & (SIN_PERIOD - 1);
    boss->unk50 = SIN(boss->unk4C) >> 8;
    boss->unkC[1][0] = boss->unk50;

    for (i = 1; i < ARRAY_COUNT(boss->unkC[0]); i++) {
        boss->unkC[1][i] += I((boss->unkC[1][i - 1] - boss->unkC[1][i]) * gUnknown_080D7A28[i] - Q(12));
    }
}

static void sub_803CB84(EggHammerTankII *boss)
{
    if (--boss->timer == 0) {
        boss->timer = 60;
        boss->state = 3;
    }
}

static void sub_803CBA4(EggHammerTankII *boss)
{
    if (--boss->timer == 0) {
        if (PseudoRandBetween(0, 4) != 0) {
            boss->timer = 68;
            boss->state = 5;
        } else {
            m4aSongNumStart(SE_239);
            boss->timer = 60;
            boss->state = 6;
        }
    }
}

static void sub_803CBFC(EggHammerTankII *boss)
{
    boss->unkB2 = 30;
    if (boss->timerInvulnerability == 0) {
        Sprite *s = &boss->pilot;
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void sub_803CC3C(EggHammerTankII *boss)
{
    if (boss->timerInvulnerability > 0) {
        u8 i;

        for (i = 0; i < 16; i++) {
            gObjPalette[8 * 16 + i] = gUnknown_080D7AD0[(boss->timerInvulnerability & 4) >> 2][i];
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }
}
