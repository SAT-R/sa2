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
#include "game/time_attack/results.h"
#include "game/cutscenes/level_endings.h"

#include "game/screen_fade.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"
#include "constants/animations.h"
#include "flags.h"

typedef struct {
    ScreenFade fade; /* 0xB4 */
    u8 fillerB4[0x38];

    u32 unkF8[6][6];
} EggHammerTankII_UNKB4;

typedef struct {
    s32 unk0;
    s32 unk4;
    s16 unk8;
    s16 unkA;

    s32 unkC[2][8];
    u32 unk4C;
    u32 unk50;
    s32 unk54[2][8];

    u32 unk94;
    s32 unk98;
    s32 unk9C;
    u32 unkA0;
    u32 unkA4;
    u32 unkA8;
    u32 unkAC;

    u8 unkB0;
    u8 unkB1;
    u8 unkB2;
    u8 unkB3;

    EggHammerTankII_UNKB4 unkB4;

    u8 filler188[0x155];

    Sprite unk2E0;
    Hitbox reserved0;
    Sprite unk318;
    Sprite unk348;
    Sprite unk378;
    Sprite unk3A8;
    Sprite unk3D8;
    Sprite unk408;
    SpriteTransform transform; /* 0x438 */

    Sprite unk444;
    Sprite unk474;
} EggHammerTankII; /* size 0x4A4 */

void Task_EggHammerTankIIMain(void);
void TaskDestructor_EggHammerTankIIMain(struct Task *);

extern const u32 gUnknown_080D7A38[8];
extern const u32 gUnknown_080D7A58[8];

void CreateEggHammerTankII(void)
{

    struct Task *t;
    EggHammerTankII *boss;
    Sprite *s;
    u32 i;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPseudoRandom = gStageTime;
    t = TaskCreate(Task_EggHammerTankIIMain, sizeof(EggHammerTankII), 0x4000, 0,
                   TaskDestructor_EggHammerTankIIMain);

    boss = TASK_DATA(t);
    if (IS_FINAL_STAGE(gCurrentLevel)) {
        u8 difficulty = gDifficultyLevel;
        if (difficulty != DIFFICULTY_NORMAL) {
            boss->unkB0 = 3;
        } else {
            boss->unkB0 = 4;
        }
    } else if (gDifficultyLevel != DIFFICULTY_NORMAL
               && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unkB0 = 6;
    } else {
        boss->unkB0 = 8;
    }

    boss->unkA8 = 0;
    boss->unkA4 = 2;
    boss->unkA0 = 0;
    boss->unkAC = 0x78;

    boss->unkB1 = 0;
    boss->unkB2 = 0;
    boss->unkB3 = 0;

    i = 0x3D400;
    boss->unk0 = i;
    boss->unk4 = 0x9B00;

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->unk8 = 0x500;
        boss->unkA = 0;
    } else {
        boss->unk8 = 0x500;
        boss->unkA = 0;
    }

    for (i = 0; i < 8; i++) {
        boss->unkC[1][i] = 0;
        boss->unkC[0][i] = gUnknown_080D7A38[i];
    }

    boss->unk4C = 0;
    boss->unk50 = 0;

    for (i = 0; i < 8; i++) {
        boss->unk54[1][i] = 0x300;
        boss->unk54[0][i] = gUnknown_080D7A58[i];
    }

    boss->unk94 = 0x300;
    boss->unk98 = 0x1280;
    boss->unk9C = 0x1280;

    s = &boss->unk2E0;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x48, SA2_ANIM_HAMMERTANK_BODY, 0, 20, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk318;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_HAMMERTANK_ARM_SEGMENT, 0, 18, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk3A8;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_SPINNING_WHEEL, 0, 19, 2);

    s = &boss->unk3D8;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_WHEEL, 0, 21, 2);

    s = &boss->unk348;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x40, SA2_ANIM_HAMMERTANK_HAND, 0, 17, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk378;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0xC, SA2_ANIM_HAMMERTANK_PILOT, 0, 21, 2);

    s = &boss->unk408;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    SPRITE_INIT_ANIM(s, SA2_ANIM_HAMMERTANK_HAMMER, 0, 24);
    SPRITE_INIT_SCRIPT(s, 1.0);

    s->unk10 = (gUnknown_030054B8++) | 0x2060;

    if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
        && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel) {

        s = &boss->unk444;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 0xC, SA2_ANIM_CREAM_CAPTURED, 0, 2, 2);

        s = &boss->unk474;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 9, SA2_ANIM_CHEESE_STRUGGLING, 0, 2, 2);
    } else {
        boss->unk444.graphics.dest = NULL;
        boss->unk474.graphics.dest = NULL;
    }

    gActiveBossTask = t;
}

void Task_803C980(void);

u8 sub_803CA40(void);

extern const TaskMain gUnknown_080D7AA8[];

void sub_803CB18(EggHammerTankII *);
void sub_803AC2C(EggHammerTankII *);

void Task_EggHammerTankIIMain(void)
{
    EggHammerTankII *boss = TASK_DATA(gCurTask);
    u32 unkA8 = ++boss->unkA8;

    if (unkA8 < 0x15) {
        boss->unk8 = 0;
        return;
    }

    if (unkA8 < 127) {
        u32 r0, r2;
#ifndef NON_MATCHING
        register u32 r1 asm("r1") = (unkA8 - 0x3D);
#endif

        if (IS_FINAL_STAGE(gCurrentLevel)) {
            r0 = unkA8 * 0x500;
            r2 = r0 + 0x4BA00;
            r2 += ((unkA8 - 0x3D) * (unkA8 - 0x3D) * (unkA8 - 0x3D)) >> 1;
            r2 -= ((unkA8 - 0x3D) * 0x30 * (unkA8 - 0x3D)) >> 1;
            r0 = (unkA8 - 0x3D) >> 1;
            r2 += r0;
            boss->unk0 = r2;
        } else {
            r0 = unkA8 * 0x500;
            r2 = r0 + 0x4BA00;
            r2 += ((unkA8 - 0x3D) * (unkA8 - 0x3D) * (unkA8 - 0x3D)) >> 1;
            r2 -= ((unkA8 - 0x3D) * 0x30 * (unkA8 - 0x3D)) >> 1;
            r0 = (unkA8 - 0x3D) >> 1;
            r2 += r0;
            boss->unk0 = r2;
        }
    }
    boss->unk0 += boss->unk8;
    boss->unk4 += boss->unkA;

    if (unkA8 > 126) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        boss->unk8 = 0x500;
        gCurTask->main = Task_803C980;
    }

    gUnknown_080D7AA8[sub_803CA40()]();
    sub_803CB18(boss);
    sub_803AC2C(boss);
}

void sub_803CBFC(EggHammerTankII *boss);
void sub_803B6AC(EggHammerTankII *boss);
void sub_803A8E4(EggHammerTankII *boss)
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

            r2 = Q_24_8_TO_INT(boss->unk0);
            r0 = (((boss->unk54[0][5] * COS(boss->unk54[1][5] & 0x3FF)) >> 0x17) - 8);
            pos.x = r2 + r0;

            r2 = Q_24_8_TO_INT(boss->unk4);
            r0 = ((boss->unk54[0][5] * SIN(boss->unk54[1][5] & 0x3FF) >> 0x17));
            pos.y = r2 + r0;

            pos.x -= Q_24_8_TO_INT(gPlayer.x);
            pos.y -= Q_24_8_TO_INT(gPlayer.y);
            if ((SQUARE(pos.x) + SQUARE(pos.y)) < 0x1A4) {
                sub_803CBFC(boss);
                sub_800CBA4(&gPlayer);
            }
        }

        s = &boss->unk2E0;
        pos.x = Q_24_8_TO_INT(boss->unk0);
        pos.y = Q_24_8_TO_INT(boss->unk4);

        s->x = pos.x - gCamera.x;
        s->y = pos.y - gCamera.y;

        sub_800CA20(s, pos.x, pos.y, 1, &gPlayer);
        sub_80122DC(Q_24_8_NEW(pos.x), Q_24_8_NEW(pos.y));

        if (boss->unkB1 == 0
            || ((gPlayer.speedAirY > 0 || !(gPlayer.moveState & 2))
                && (gPlayer.moveState & 2))) {
            if (sub_800C320(s, pos.x, pos.y, 0, &gPlayer) == 1) {
                sub_803B6AC(boss);
            } else {
                sub_800CA20(s, pos.x, pos.y, 0, &gPlayer);
            }

            if (boss->unkB1 == 0 && sub_800C418(s, pos.x, pos.y, 0, &gPlayer) == 1) {
                sub_803B6AC(boss);
            }
        }
    }
}

// TODO: move to game_8.h (whatever that is)
extern const u16 gUnknown_080D6DE4[][2];

void sub_803AA40(void)
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

    if (boss->unkA8 < 0x21) {
        if (boss->unkA8 == 1) {
            ts->flags = 1;
            ts->brightness = 0x800;
            ts->speed = 0xC0;
        }
        UpdateScreenFade(ts);
    } else if (boss->unkA8 < 0x79) {
        UNK_30056A4 *thing;
        ts->flags = 2;
        ts->brightness = 0;
        ts->speed = 0;
        UpdateScreenFade(ts);

        if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
            && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
            gPlayer.unk64 = 81;
        }

        if (!IS_FINAL_STAGE(gCurrentLevel)) {
            gWinRegs[4] = 0x3F;
            gWinRegs[5] = 0x1F;
            return;
        }

        if (boss->unkA8 == 0x22) {
            s32 x, y;

            x = gUnknown_080D6DE4[0][0] - Q_24_8_TO_INT(gPlayer.x);
            y = gUnknown_080D6DE4[0][1] - Q_24_8_TO_INT(gPlayer.y);

            gPlayer.x += Q_24_8_NEW(x);
            gPlayer.y += Q_24_8_NEW(y);

            gCamera.x += x;
            gCamera.y += y;

            gCamera.unk20 += x;
            gCamera.unk24 += y;

            gCamera.unk10 += x;
            gCamera.unk14 += y;

            thing = gUnknown_030056A4;
            if (thing != NULL) {
                thing->posX += Q_24_8_NEW(x);
                thing->posY += Q_24_8_NEW(y);
            }

            gUnknown_030055B0++;
        }
    } else {
        ts->speed = 0x28;

        if (UpdateScreenFade(ts) == SCREEN_FADE_COMPLETE) {
            if (!IS_FINAL_STAGE(gCurrentLevel)) {
                if (gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
                    CreateTimeAttackResults(gCourseTime);
                } else if (gSelectedCharacter == CHARACTER_SONIC
                           && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC]
                               <= gCurrentLevel) {
                    CreateStageResultsCutscene(0);
                } else {
                    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
                }
            }
            TaskDestroy(gCurTask);
            return;
        }
    }

    gWinRegs[4] = 0x3F;
    gWinRegs[5] = 0x1F;
}

void sub_803AC2C(EggHammerTankII *boss)
{
    s8 i;
    s16 x, y;
    s16 x3, y3;
    SpriteTransform *transform;
    EggHammerTankII_UNKB4 *unkB4 = &boss->unkB4;
    Sprite *s = &boss->unk2E0;
    s->x = Q_24_8_TO_INT(boss->unk0) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk4) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk378;
    s->x = Q_24_8_TO_INT(boss->unk0) - gCamera.x + 4;
    s->y = Q_24_8_TO_INT(boss->unk4) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk3A8;
    s->x = Q_24_8_TO_INT(boss->unk0 - 0x1600) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk4 + boss->unk98 + 0xE80) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk3A8;
    s->x = Q_24_8_TO_INT(boss->unk0 + 0x1800) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk4 + boss->unk9C + 0xE80) - gCamera.y;
    DisplaySprite(s);

    s = &boss->unk3D8;
    s->x = Q_24_8_TO_INT(boss->unk0 - 0x1600) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk4 + boss->unk98 + 0xE80) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk3D8;
    s->x = Q_24_8_TO_INT(boss->unk0 + 0x1800) - gCamera.x;
    s->y = Q_24_8_TO_INT(boss->unk4 + boss->unk9C + 0xE80) - gCamera.y;
    DisplaySprite(s);

    s = &boss->unk318;
    s->unk1A = 0x480;
    x = Q_24_8_TO_INT(boss->unk0) - gCamera.x;
    y = Q_24_8_TO_INT(boss->unk4) - gCamera.y;

    for (i = 6; i >= 0; i--) {
        s->x = x + ((COS((boss->unkC[1][i] + 0x50) & 0x3FF) * boss->unkC[0][i]) >> 0x17);
        s->y = y + ((SIN((boss->unkC[1][i] + 0x50) & 0x3FF) * boss->unkC[0][i]) >> 0x17);
        DisplaySprite(s);

        if (boss->unkB0 != 0) {
            unkB4->unkF8[i][0] = s->x;
            unkB4->unkF8[i][1] = s->y;
        }
    }

    s = &boss->unk348;
    s->x = x + ((COS((boss->unkC[1][7] + 0x50) & 0x3FF) * boss->unkC[0][7]) >> 0x17);
    s->y = y + ((SIN((boss->unkC[1][7] + 0x50) & 0x3FF) * boss->unkC[0][7]) >> 0x17);

    x3 = s->x;
    y3 = s->y;
    DisplaySprite(s);

    if (boss->unk444.graphics.dest != NULL) {
        s = &boss->unk444;
        s->x = x3 + 5;
        s->y = y3 - 20;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &boss->unk474;
        s->x = x3 + 5;
        s->y = y3 - 20;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &boss->unk318;
    s->unk1A = 0x640;

    for (i = 0; i < 6; i++) {
        s->x = x - 8 + ((COS((boss->unk54[1][i]) & 0x3FF) * boss->unk54[0][i]) >> 0x17);
        s->y = y + ((SIN((boss->unk54[1][i]) & 0x3FF) * boss->unk54[0][i]) >> 0x17);
        DisplaySprite(s);
    }

    s = &boss->unk408;
    transform = &boss->transform;

    s->x = x - 8 + ((COS((boss->unk54[1][5]) & 0x3FF) * boss->unk54[0][5]) >> 0x17);
    s->y = y + ((SIN((boss->unk54[1][5]) & 0x3FF) * boss->unk54[0][5]) >> 0x17);
    s->unk10 = gUnknown_030054B8++ | 0x2060;

    transform->rotation
        = (boss->unk54[1][5] - (boss->unk94) + boss->unk54[1][5]) & 0x3FF;
    if (transform->rotation != 0x300) {
        transform->rotation += 10;
    }

    transform->width = 0x100;
    transform->height = 0x100;
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    sub_8004860(s, transform);
    DisplaySprite(s);
}
