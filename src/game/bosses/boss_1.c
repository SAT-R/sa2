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

    s32 unkC0;
    s32 unkC4;
    s32 unkC8;
    s32 unkCC;

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
} EggHammerTankII_UNKB4;

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
    u32 unkA0;
    u32 unkA4;
    u32 unkA8;

    u32 timer;

    u8 unkB0;
    u8 unkB1;
    u8 unkB2;
    u8 unkB3;

    EggHammerTankII_UNKB4 unkB4;

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

static void Task_EggHammerTankIIMain(void);
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

static const HammertankFunc gUnknown_080D7AB0[] = {
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
    t = TaskCreate(Task_EggHammerTankIIMain, sizeof(EggHammerTankII), 0x4000, 0, TaskDestructor_EggHammerTankIIMain);

    boss = TASK_DATA(t);
    if (IS_FINAL_STAGE(gCurrentLevel)) {
        u8 difficulty = gDifficultyLevel;
        if (difficulty != DIFFICULTY_NORMAL) {
            boss->unkB0 = 3;
        } else {
            boss->unkB0 = 4;
        }
    } else if (gDifficultyLevel != DIFFICULTY_NORMAL && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unkB0 = 6;
    } else {
        boss->unkB0 = 8;
    }

    boss->unkA8 = 0;
    boss->unkA4 = 2;
    boss->unkA0 = 0;
    boss->timer = 120;

    boss->unkB1 = 0;
    boss->unkB2 = 0;
    boss->unkB3 = 0;

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

static void Task_EggHammerTankIIMain(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    u32 unkA8 = ++boss->unkA8;

    if (unkA8 < 21) {
        boss->speedX = 0;
        return;
    }

    if (unkA8 < 127) {
        u32 r0, r2;
#ifndef NON_MATCHING
        register u32 UNUSED r1 asm("r1") = (unkA8 - 0x3D);
#endif

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            r0 = unkA8 * 0x500;
            r2 = r0 + 0x4BA00;
            r2 += ((unkA8 - 0x3D) * (unkA8 - 0x3D) * (unkA8 - 0x3D)) >> 1;
            r2 -= ((unkA8 - 0x3D) * 0x30 * (unkA8 - 0x3D)) >> 1;
            r0 = (unkA8 - 0x3D) >> 1;
            r2 += r0;
            boss->x = r2;
        } else {
            r0 = unkA8 * 0x500;
            r2 = r0 + 0x4BA00;
            r2 += ((unkA8 - 0x3D) * (unkA8 - 0x3D) * (unkA8 - 0x3D)) >> 1;
            r2 -= ((unkA8 - 0x3D) * 0x30 * (unkA8 - 0x3D)) >> 1;
            r0 = (unkA8 - 0x3D) >> 1;
            r2 += r0;
            boss->x = r2;
        }
    }
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    if (unkA8 > 126) {
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

    if (boss->unkB1 == 0) {
        if (boss->unkA0 < 5 || boss->unkA0 == 6) {
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

        if (boss->unkB1 == 0 || ((gPlayer.qSpeedAirY > 0 || !(gPlayer.moveState & 2)) && (gPlayer.moveState & 2))) {
            if (Player_AttackBossCollision(s, pos.x, pos.y, 0, &gPlayer) == 1) {
                HandleBossHit(boss);
            } else {
                Player_EnemyCollision(s, pos.x, pos.y, 0, &gPlayer);
            }

            if (boss->unkB1 == 0 && Cheese_IsSpriteColliding(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
                HandleBossHit(boss);
            }
        }
    }
}

static void sub_803AA40(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    ScreenFade *ts = &boss->unkB4.fade;
    boss->unkA8++;

    if (boss->unkA8 > 8) {
        switch (boss->unkA8) {
            case 9:
                gFlags &= ~FLAGS_4;
                m4aSongNumStart(SE_333);
                break;
        }
    }

    if (boss->unkA8 < 33) {
        if (boss->unkA8 == 1) {
            ts->flags = SCREEN_FADE_FLAG_LIGHTEN;
            ts->brightness = Q(8);
            ts->speed = Q(0.75);
        }
        UpdateScreenFade(ts);
    } else if (boss->unkA8 < 121) {
        Cheese *thing;
        ts->flags = SCREEN_FADE_FLAG_2;
        ts->brightness = Q(0);
        ts->speed = Q(0);
        UpdateScreenFade(ts);

        if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            gPlayer.charState = CHARSTATE_SONIC_CATCHING_CREAM;
        }

        if (IS_FINAL_STAGE(gCurrentLevel) && (boss->unkA8 == 0x22)) {
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
        ts->speed = Q(40. / 256.);

        if (UpdateScreenFade(ts) == SCREEN_FADE_COMPLETE) {
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
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;
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

        if (boss->unkB0 != 0) {
            unkB4->unkF8[i][0] = s->x;
            unkB4->unkF8[i][1] = s->y;
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
        boss->unkA0 = 1;

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
        boss->unkA0 = 2;
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
        boss->unkA0 = 4;

        result = sub_8004418(SIN((boss->unk54[1][7] + val) & (SIN_PERIOD - 1)) >> 6,
                             (COS((boss->unk54[1][7] + val) & (SIN_PERIOD - 1)) >> 6) + result);

        for (i = 0; i < ARRAY_COUNT(boss->unk54[0]); i++) {
            boss->unk54[1][i] = result;
        }
        boss->unk94 = result;
        CreateScreenShake(0x800, 0x10, 0x80, 0x14, 0x83);
    } else if (--boss->timer == 0) {
        boss->timer = 30;
        boss->unkA0 = 4;
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
        boss->unkA0 = 0;
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
            boss->unkA0 = 5;
        }
    }

    boss->timer--;

    if (boss->timer == 0) {
        boss->timer = 68;
        boss->unkA0 = 5;
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
        boss->unkA0 = 0;
    }
}

static void HandleBossHit(EggHammerTankII *boss)
{
    Sprite *s;

    if (boss->unkB0 != 0) {
        boss->unkB0--;
        if (boss->unkB0 & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->unkB1 = 30;

        s = &boss->pilot;
        if (boss->unkB0 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 2;
        }

        s->prevVariant = -1;
    }

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->unkB0 == 4) {
        gMusicManagerState.unk1 = 0x11;
    }
}

static void sub_803B7B0(EggHammerTankII *boss)
{
    Sprite *s = &boss->pilot;
    if (boss->unkB1 > 0) {
        boss->unkB2 = 0;

        if (--boss->unkB1 > 0) {
            return;
        }

        if (boss->unkB0 == 0) {
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
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;
    if (unkB4->unkC8 < 0) {
        unkB4->unkC8 = 0;
    }

    unkB4->unkCC += Q(0.25);
    unkB4->unkC0 += unkB4->unkC8;
    unkB4->unkC4 += unkB4->unkCC;

    result = sub_801F100(I(unkB4->unkC4) + 28, I(unkB4->unkC0), 1, 8, sub_801EC3C);
    if (unkB4->unk2DC != 0) {
        unkB4->unk278[0][0] = unkB4->unkC0 - Q(22);
        unkB4->unk278[0][1] = unkB4->unkC4 + boss->unk98 + Q(14.5);
        unkB4->unk278[1][0] = unkB4->unkC0 + Q(24);
        unkB4->unk278[1][1] = unkB4->unkC4 + boss->unk9C + Q(14.5);
        unkB4->unk278[2][0] = unkB4->unkC0 - Q(22);
        unkB4->unk278[2][1] = unkB4->unkC4 + boss->unk98 + Q(14.5);
        unkB4->unk278[3][0] = unkB4->unkC0 + Q(24);
        unkB4->unk278[3][1] = unkB4->unkC4 + boss->unk9C + Q(14.5);
    } else {
        for (i = 0; i < 4; i++) {
            s32 result1;
            unkB4->unk278[i][2]--;
            if (unkB4->unk278[i][2] < 128) {
                unkB4->unk278[i][2] = 128;
            }
            unkB4->unk278[i][3] += 0x28;
            unkB4->unk278[i][0] += unkB4->unk278[i][2];
            unkB4->unk278[i][1] += unkB4->unk278[i][3];

            result1 = sub_801F100(I(unkB4->unk278[i][1]), I(unkB4->unk278[i][0]), 1, 8, sub_801EC3C);
            if (result1 < 0) {
                s32 r0;
                if (unkB4->unk278[i][4] != 0) {
                    unkB4->unk278[i][4]--;
                }
                unkB4->unk278[i][1] += Q(result1);
                r0 = unkB4->unk278[i][3] * 3;
                r0 = (r0 * 4) - unkB4->unk278[i][3];
                r0 *= 16;
                unkB4->unk278[i][3] = I(-r0);
            }

            if (unkB4->unk278[i][4] == 0) {
                if (unkB4->unk278[i][5] != 0) {
                    unkB4->unk278[i][5]--;
                }
            }
        }
    }

    if (result < 0) {
        if (unkB4->unk2DC != 0) {
            unkB4->unk2DC--;
            unkB4->unkCC = -unkB4->unkCC;
        } else {
            s32 r0;
            unkB4->unkC8 -= 32;
            r0 = (unkB4->unkCC * 27);
            unkB4->unkCC = I(-(r0 * 8));
        }

        if (unkB4->unkCC > -160) {
            unkB4->unkCC = 0;
        }

        unkB4->unkC4 += QS(result);
    }

    for (i = 0; i < 8; i++) {
        unkB4->unkF8[i][3] += Q(0.125);
        if (unkB4->unkF8[i][2] > 0) {
            unkB4->unkF8[i][0] += unkB4->unkF8[i][2];
        }

        unkB4->unkF8[i][1] += unkB4->unkF8[i][3];

        result = sub_801F100(I(unkB4->unkF8[i][1]) + 5, I(unkB4->unkF8[i][0]), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (unkB4->unkF8[i][4] != 0) {
                unkB4->unkF8[i][4]--;
            }
            unkB4->unkF8[i][2] -= Q(0.125);
            unkB4->unkF8[i][1] += QS(result);
            unkB4->unkF8[i][3] = I(unkB4->unkF8[i][3] * ((i * 4) - Q(0.25)));
        }

        if (unkB4->unkF8[i][4] == 0) {
            if (unkB4->unkF8[i][5] != 0) {
                unkB4->unkF8[i][5]--;
            }
        }

        unkB4->unk1B8[i][3] += 40;
        if (unkB4->unk1B8[i][2] > 0) {
            unkB4->unk1B8[i][0] += unkB4->unk1B8[i][2];
        }

        unkB4->unk1B8[i][1] += unkB4->unk1B8[i][3];

        result = sub_801F100(I(unkB4->unk1B8[i][1]) + 5, I(unkB4->unk1B8[i][0]), 1, 8, sub_801EC3C);

        if (result < 0) {
            if (unkB4->unk1B8[i][4] != 0) {
                unkB4->unk1B8[i][4]--;
            }
            unkB4->unk1B8[i][2] -= 32;
            unkB4->unk1B8[i][1] += QS(result);
            unkB4->unk1B8[i][3] = I(unkB4->unk1B8[i][3] * -((i * 4) + 64));
        }

        if (unkB4->unk1B8[i][4] == 0) {
            if (unkB4->unk1B8[i][5] != 0) {
                unkB4->unk1B8[i][5]--;
            }
        }
    }

    unkB4->unkDC += Q(0.375);
    unkB4->unkD0 += unkB4->unkD8;
    unkB4->unkD4 += unkB4->unkDC;

    result = sub_801F100(I(unkB4->unkD4) + 24, I(unkB4->unkD0), 1, 8, sub_801EC3C);
    if (result < 0) {
        ExplosionPartsInfo parts;

        if (unkB4->unkE4 == 0) {
            u32 rand;
            parts.spawnX = I(unkB4->unkD0) - gCamera.x;
            parts.spawnY = I(unkB4->unkD4) - gCamera.y;
            parts.velocity = 0;
            parts.rotation = 1000;
            parts.speed = 768;
            parts.vram = (void *)OBJ_VRAM0 + 0x2980;
            parts.anim = SA2_ANIM_EXPLOSION;
            parts.variant = 0;
            parts.unk4 = unkB4->unkE4;
            CreateBossParticleWithExplosionUpdate(&parts, &unkB4->unk2DD);

            rand = PseudoRandom32();
            parts.spawnX = (I(unkB4->unkD0) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(unkB4->unkD4) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &unkB4->unk2DD);

            rand = PseudoRandom32();
            parts.spawnX = (I(unkB4->unkD0) - gCamera.x) + (rand & 15);
            rand = PseudoRandom32();
            parts.spawnY = (I(unkB4->unkD4) - gCamera.y) + (rand & 15);

            CreateBossParticleWithExplosionUpdate(&parts, &unkB4->unk2DD);
        }

        if (unkB4->unkDC < 768) {
            if (unkB4->unkE4 == 0) {
                unkB4->unkE4 = 1;
            }
            unkB4->unkDC = 0;
        }
        if (unkB4->unkE0 != 0) {
            unkB4->unkE0 = 0;
        } else {
            unkB4->unkE0 = 1;
        }
        unkB4->unkD8 -= 32;

        if (unkB4->unkD8 < 0) {
            unkB4->unkD8 = 0;
        }

        unkB4->unkD4 += QS(result);
        unkB4->unkDC = I(-(unkB4->unkDC * 192));
    }

    if (unkB4->unkE0 != 0) {
        unkB4->unk2D8 = CLAMP_SIN_PERIOD(unkB4->unk2D8 + 48);
    } else {
        unkB4->unk2D8 = CLAMP_SIN_PERIOD(unkB4->unk2D8 - 48);
    }
}

static void sub_803BDB8(void)
{
    s8 i;
    EggHammerTankII *boss;
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;
    s32 x, y;
    SpriteTransform *transform;
    Sprite *s;

    boss = TASK_DATA(gCurTask);

    unkB4 = &boss->unkB4;

    boss->unkA8 = 0;
    unkB4->unk2DC = 5;
    unkB4->unk2DD = 0;
    s = &boss->body;
    s->graphics.anim = SA2_ANIM_HAMMERTANK_BODY_DESTROYED;
    s->variant = 0;
    s->prevVariant = -1;

    unkB4->unkC0 = boss->x;
    unkB4->unkC4 = boss->y;
    unkB4->unkC8 = boss->speedX;
    unkB4->unkCC = -768;

    for (i = 0; i < 4; i++) {
        if (i < 2) {
            unkB4->unk278[i][0] = boss->x - Q(22);
        } else {
            unkB4->unk278[i][0] = boss->x + Q(24);
        }

        unkB4->unk278[i][1] = boss->y + boss->unk98 + Q(14.5);

        if (i < 2) {
            unkB4->unk278[i][2] = boss->speedX + (i + 2) * 5;
        } else {
            unkB4->unk278[i][2] = boss->speedX + i * 0x30;
        }

        unkB4->unk278[i][3] = I((boss->unk98 * (-Q(0.375) - (i * 2))));
        unkB4->unk278[i][4] = 4;
        unkB4->unk278[i][5] = 60;
    }

    for (i = 0; i < 8; i++) {
        unkB4->unkF8[i][0] += gCamera.x;
        unkB4->unkF8[i][1] += gCamera.y;

        unkB4->unkF8[i][0] = Q(unkB4->unkF8[i][0]);
        unkB4->unkF8[i][1] = Q(unkB4->unkF8[i][1]);

        unkB4->unkF8[i][2] = boss->speedX + ((COS(boss->unkC[1][i] & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 18);

        unkB4->unkF8[i][3] = (SIN(boss->unkC[1][i] & (SIN_PERIOD - 1)) * boss->unkC[0][i]) >> 18;
        unkB4->unkF8[i][4] = 3;
        unkB4->unkF8[i][5] = 30;
    }

    x = boss->x;
    y = boss->y;
    for (i = 0; i < 8; i++) {
        unkB4->unk1B8[i][0] = x + ((COS((boss->unk54[1][i] + 768) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0xF);
        unkB4->unk1B8[i][1] = y + ((SIN((boss->unk54[1][i] + 768) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0xf);
        unkB4->unk1B8[i][2] = boss->speedX + ((COS((boss->unk54[1][i]) & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 0x12);
        unkB4->unk1B8[i][3] = (SIN(boss->unk54[1][i] & (SIN_PERIOD - 1)) * boss->unk54[0][i]) >> 18;
        unkB4->unk1B8[i][4] = 3;
        unkB4->unk1B8[i][5] = 30;
    }

    transform = &boss->transform;
    unkB4->unkD0 = x + ((COS(boss->unk54[1][5] & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 15);
    unkB4->unkD4 = y + ((SIN(boss->unk54[1][5] & (SIN_PERIOD - 1)) * boss->unk54[0][5]) >> 15);
    unkB4->unkD8 = boss->speedX;
    unkB4->unkDC = boss->speedY - 2048;
    unkB4->unk2D8 = transform->rotation;
    unkB4->unkE0 = 1;
    unkB4->unkE4 = 0;
}

static void sub_803C198(EggHammerTankII *boss)
{
    u8 result;
    s32 i;
    Sprite *s;
    ExplosionPartsInfo init;
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;

    SpriteTransform *transform;
    u8 *unkB3;

    boss->unkA8++;

    result = Div(boss->unkA8, 60);
    result = boss->unkA8 + (result * -60);

    if (!(boss->unkA8 & 7)) {
        i = result - (Div(result, 6) * 6);

        init.spawnX = I(unkB4->unkC0) - gCamera.x;
        init.spawnY = I(unkB4->unkC4) - gCamera.y;
        init.velocity = 0x40;
        init.rotation = PseudoRandom32() & (SIN_PERIOD - 1);
        init.speed = 0x600;
        init.vram = (void *)OBJ_VRAM0 + (gTileInfoBossScrews[i][0] * TILE_SIZE_4BPP);
        init.anim = gTileInfoBossScrews[i][1];
        init.variant = gTileInfoBossScrews[i][2];
        init.unk4 = 1;
        CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
    }

    if (Mod(boss->unkA8 + PseudoRandom32(), 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    s = &boss->body;
    s->x = I(unkB4->unkC0) - gCamera.x;
    s->y = I(unkB4->unkC4) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    // required for match
    unkB3 = &boss->unkB3;

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
            CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
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
            CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
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
            CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
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
            CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
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
            CreateBossParticleWithExplosionUpdate(&init, &unkB4->unk2DD);
            result = 0;
        } else if (result > 60) {
            result -= 60;
        }
    }

    if (s->x < 50 && *unkB3 == 0) {
        *unkB3 = 1;
        CreateEggmobileEscapeSequence(s->x, s->y, SPRITE_FLAG(PRIORITY, 2));
    }

    if (I(unkB4->unkC0) - gCamera.x < -200) {
        unkB4->fade.window = 0;
        unkB4->fade.brightness = 0;
        unkB4->fade.flags = 2;
        unkB4->fade.speed = 0;
        unkB4->fade.bldCnt = 0xBF;
        unkB4->fade.bldAlpha = 0;
        boss->unkA8 = 0;
        gCurTask->main = sub_803AA40;
    }

    if (*unkB3 == 0) {
        s = &boss->pilot;
        s->x = I(unkB4->unkC0) - gCamera.x;
        s->y = I(unkB4->unkC4) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (unkB4->unk278[0][4] != 0 || (unkB4->unk278[0][5] & 1)) {
        s = &boss->wheel;
        s->x = I(unkB4->unk278[0][0]) - gCamera.x;
        s->y = I(unkB4->unk278[0][1]) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (unkB4->unk278[1][4] != 0 || (unkB4->unk278[1][5] & 1)) {
        s = &boss->wheel;
        s->x = I(unkB4->unk278[1][0]) - gCamera.x;
        s->y = I(unkB4->unk278[1][1]) - gCamera.y;
        DisplaySprite(s);
    }

    if (unkB4->unk278[2][4] != 0 || (unkB4->unk278[2][5] & 1)) {
        s = &boss->brokenWheel;
        s->x = I(unkB4->unk278[2][0]) - gCamera.x;
        s->y = I(unkB4->unk278[2][1]) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (unkB4->unk278[3][4] != 0 || (unkB4->unk278[3][5] & 1)) {
        s = &boss->brokenWheel;
        s->x = I(unkB4->unk278[3][0]) - gCamera.x;
        s->y = I(unkB4->unk278[3][1]) - gCamera.y;
        DisplaySprite(s);
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(18);

    for (i = 6; i > -1; i--) {
        s->x = I(unkB4->unkF8[i][0]) - gCamera.x;
        s->y = I(unkB4->unkF8[i][1]) - gCamera.y;
        if (unkB4->unkF8[i][4] != 0 || (unkB4->unkF8[i][5] != 0 && boss->unkA8 & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->armSegment;
    s->oamFlags = SPRITE_OAM_ORDER(25);
    for (i = 0; i < 6; i++) {
        s->x = I(unkB4->unk1B8[i][0]) - gCamera.x;
        s->y = I(unkB4->unk1B8[i][1]) - gCamera.y;
        if (unkB4->unk1B8[i][4] != 0 || (unkB4->unk1B8[i][5] != 0 && boss->unkA8 & 1)) {
            DisplaySprite(s);
        }
    }

    s = &boss->hammer;
    transform = &boss->transform;

    s->x = I(unkB4->unkD0) - gCamera.x;
    s->y = I(unkB4->unkD4) - gCamera.y;
    s->frameFlags = gUnknown_030054B8++ | 0x2060;

    if (unkB4->unkE4 != 0) {
        unkB4->unkE4 = 2;
    } else {
        transform->rotation = unkB4->unk2D8;
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
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;

    unkB4->unkC0 += x;
    boss->x += x;
    unkB4->unkC4 += y;
    boss->y += y;

    for (i = 0; i < 4; i++) {
        unkB4->unk278[i][0] += x;
        unkB4->unk278[i][1] += y;
    }

    for (i = 0; i < 8; i++) {
        unkB4->unkF8[i][0] += x;
        unkB4->unkF8[i][1] += y;
    }

    for (i = 0; i < 8; i++) {
        unkB4->unk1B8[i][0] += x;
        unkB4->unk1B8[i][1] += y;
    }

    unkB4->unkD0 += x;
    unkB4->unkD4 += y;
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
    gUnknown_080D7AB0[boss->unkA0](boss);

    sub_803CB18(boss);
    sub_803A8E4(boss);
    sub_803B7B0(boss);
    sub_803AC2C(boss);
    sub_803CC3C(boss);

    if (boss->unkB0 == 0) {
        sub_803BDB8();
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
        boss->unkA0 = 3;
    }
}

static void sub_803CBA4(EggHammerTankII *boss)
{
    if (--boss->timer == 0) {
        if (PseudoRandBetween(0, 4) != 0) {
            boss->timer = 68;
            boss->unkA0 = 5;
        } else {
            m4aSongNumStart(SE_239);
            boss->timer = 60;
            boss->unkA0 = 6;
        }
    }
}

static void sub_803CBFC(EggHammerTankII *boss)
{
    boss->unkB2 = 30;
    if (boss->unkB1 == 0) {
        Sprite *s = &boss->pilot;
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void sub_803CC3C(EggHammerTankII *boss)
{
    if (boss->unkB1 > 0) {
        u8 i;

        for (i = 0; i < 16; i++) {
            gObjPalette[8 * 16 + i] = gUnknown_080D7AD0[(boss->unkB1 & 4) >> 2][i];
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }
}
