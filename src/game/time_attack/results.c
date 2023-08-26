#include "game/time_attack/results.h"
#include "core.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "game/save.h"
#include "game/game.h"
#include "game/stage/ui.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "trig.h"
#include "task.h"
#include "game/time_attack/lobby.h"

#include "constants/animations.h"
#include "constants/songs.h"

struct TimeAttackResultsCutScene {
    struct TransitionState unk0;
    Sprite unkC[3];
    Sprite unk9C[3];
    Sprite unk12C;
    u32 unk15C;
    u8 filler160[8];
    u32 unk168;
    u8 filler16C[5];
    u8 unk171;
    u8 unk172;
    u8 unk173;
    u8 unk174;
    u8 unk175;
    u8 filler176[2];
    Sprite unk178[7];
    SpriteTransform transform;
    s16 unk2D4;
    s16 unk2D6;
    u8 unk2D8;
};

void sub_8089AEC(void);
void sub_8089BB0(struct Task *);
u8 sub_80899B8(u32 finishTime);

u32 CreateTimeAttackResultsCutScene(u32 finishTime)
{
    struct Task *t;
    struct TimeAttackResultsCutScene *resultsCutScene;
    struct TransitionState *transition;
    Sprite *s = NULL;
    s16 millis, minutes, seconds;
    u8 i;
    u8 isBossLevel;
    u8 level;
    gLoadedSaveGame->score += (s16)gRingCount;

    t = TaskCreate(sub_8089AEC, sizeof(struct TimeAttackResultsCutScene), 0xC100, 0,
                   sub_8089BB0);
    resultsCutScene = TaskGetStructPtr(t);
    transition = &resultsCutScene->unk0;

    resultsCutScene->unk168 = 0;
    resultsCutScene->unk2D4 = 0x800;
    resultsCutScene->unk2D6 = 0x4000;

    transition->unk0 = 0;
    transition->unk2 = 1;
    transition->speed = 0x100;
    transition->unk4 = Q_8_8(0);
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;

    resultsCutScene->unk15C = finishTime;

    if (finishTime < MAX_COURSE_TIME) {
        s16 temp = finishTime % 60;
        u32 temp2 = finishTime - temp;
        resultsCutScene->unk15C = temp2;
        millis = gMillisUnpackTable[temp][0] * 10;
        millis += gMillisUnpackTable[temp][1];
        seconds = temp2 / 60;
        minutes = seconds / 60;
        seconds += minutes * -60;
    } else {
        millis = 99;
        seconds = 59;
        minutes = 9;
    }

    resultsCutScene->unk171 = UNITS_DIGIT(minutes);
    resultsCutScene->unk172 = TENS_DIGIT(seconds);
    resultsCutScene->unk173 = UNITS_DIGIT(seconds);
    resultsCutScene->unk174 = TENS_DIGIT(millis);
    resultsCutScene->unk175 = UNITS_DIGIT(millis);

    for (i = 0; i < 7; i++) {
        s = &resultsCutScene->unk178[i];
        s->x = i * 14 + 72;
        s->y = (DISPLAY_HEIGHT / 2) + 8;
        s->graphics.dest = VramMalloc(4);
        s->graphics.anim = SA2_ANIM_TIME_ATTACK_DIGITS;
        s->variant = SA2_ANIM_VARIANT_TA_DIGITS_0;
        s->unk1A = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = 0;
    }

    resultsCutScene->unk178[0].variant += resultsCutScene->unk171;
    resultsCutScene->unk178[1].variant = DELIMINATOR_DIGIT;
    resultsCutScene->unk178[2].variant += resultsCutScene->unk172;
    resultsCutScene->unk178[3].variant += resultsCutScene->unk173;
    resultsCutScene->unk178[4].variant = DELIMINATOR_DIGIT;
    resultsCutScene->unk178[5].variant += resultsCutScene->unk174;
    resultsCutScene->unk178[6].variant += resultsCutScene->unk175;

    for (i = 0; i < 7; i++) {
        sub_8004558(&resultsCutScene->unk178[i]);
    }

    resultsCutScene->unk2D8 = sub_80899B8(finishTime);

    s = &resultsCutScene->unk12C;
    s->x = 256;
    s->y = (DISPLAY_HEIGHT / 2);
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_TA_WHITE_BAR;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(5);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    s = &resultsCutScene->unkC[0];
    s->x = 256;
    s->y = 41;
    s->graphics.dest = VramMalloc(sAnimsGotThroughCharacterNames[gSelectedCharacter][0]);
    s->graphics.anim = sAnimsGotThroughCharacterNames[gSelectedCharacter][1];
    s->variant = sAnimsGotThroughCharacterNames[gSelectedCharacter][2];
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    isBossLevel = (gCurrentLevel & 3) >> 1;

    s = &resultsCutScene->unkC[1];
    s->x = 256;
    s->y = 49;
    s->graphics.dest = VramMalloc(gUnknown_080D715A[isBossLevel][0]);
    s->graphics.anim = gUnknown_080D715A[isBossLevel][1];
    s->variant = gUnknown_080D715A[isBossLevel][2];
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    if (isBossLevel != 0) {
        level = (gCurrentLevel >> 2) + ACT_BOSS;

    } else {
        level = gCurrentLevel & 1;
    }
    s = &resultsCutScene->unkC[2];
    s->x = 256;
    s->y = 49;
    s->graphics.dest = VramMalloc(sAnimsGotThroughZoneAndActNames[level][0]);
    s->graphics.anim = sAnimsGotThroughZoneAndActNames[level][1];
    s->variant = sAnimsGotThroughZoneAndActNames[level][2];
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    s = &resultsCutScene->unk9C[0];
    s->x = 40;
    s->y = 90;
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_TA_RECORD;
    s->variant = SA2_ANIM_VARIANT_TA_TIME;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    s = &resultsCutScene->unk9C[1];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT * (3. / 4.));
    s->graphics.dest = VramMalloc(16);
    s->graphics.anim = SA2_ANIM_TIME_ATTACK_DIGITS;
    if (resultsCutScene->unk2D8 != 0) {
        s->variant = resultsCutScene->unk2D8 + SA2_ANIM_VARIANT_TA_DIGITS_PLATE_0_BRONZE;
    } else {
        s->variant = SA2_ANIM_VARIANT_TA_DIGITS_PLATE_1_GOLD;
    }
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = gUnknown_030054B8++ | 0x20;
    sub_8004558(s);

    resultsCutScene->transform.width = 0;
    resultsCutScene->transform.height = 0x100;
    resultsCutScene->transform.x = 120;
    resultsCutScene->transform.y = 120;
    resultsCutScene->transform.unk0 = 0;

    s = &resultsCutScene->unk9C[2];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT - 12);
    s->graphics.dest = VramMalloc(0x16);
    s->graphics.anim = SA2_ANIM_TA_RECORD;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    sub_8004558(s);

    gUnknown_030054A8.unk0 = 0xFF;

    if ((gCurrentLevel & ACT_BOSS) && !(gCurrentLevel & ACT_2)) {
        gPlayer.unk64 = 0x20;
    }

    if (resultsCutScene->unk2D8 == 1) {
        m4aSongNumStart(MUS_TIME_ATTACK_3);
    } else {
        m4aSongNumStart(MUS_TIME_ATTACK_2);
    }

    return 600;
}

const s8 gUnknown_080E05C4[] = {
    3, 2, 1, 0, 0, -1, -2, -3, -4, -4, -3, -2, 1, 2, 3, 0,
    0, 0, 0, 0, 0, 0,  0,  0,  0,  0,  0,  0,  0, 0, 0, 0,
};

void sub_80897E8(void)
{
    struct TimeAttackResultsCutScene *resultsCutScene = TaskGetStructPtr(gCurTask);
    Sprite *s;
    u32 unk168 = resultsCutScene->unk168;
    u32 i;

    if (unk168 < 0x18) {
        s32 temp;
        s = &resultsCutScene->unk12C;
        temp = 0;
        if (unk168 < 0x11) {
            temp = (0x10 - unk168) * 0x18;
        }

        for (i = 0; i < 8; i++) {
            s->x = temp + i * 0x20;
            sub_80051E8(s);
        }
    } else {
        s = &resultsCutScene->unk12C;
        for (i = 0; i < 8; i++) {
            s->x = i << 5; // TODO: Does (i * 32) match?
            sub_80051E8(s);
        }
    }

    if (unk168 > 0x1C) {
        s32 temp;
        if ((gCurrentLevel & ACT_BOSS) && !(gCurrentLevel & ACT_2)) {
            temp = 2;
        } else {
            temp = 3;
        }

        for (i = 0; i < temp; i++) {
            s = &resultsCutScene->unkC[i];
            sub_80051E8(s);
        }
    }

    if (unk168 > 0x59) {
        s = &resultsCutScene->unk9C[0];
        if ((unk168 - 0x5A) < 0xB) {
            s->x = (100 - unk168) * 16 + 40;
        }
        sub_80051E8(s);
    }

    if (unk168 > 0x77) {
        s32 temp = (unk168 - 0x7F);
        if (temp > 0x10) {
            if (resultsCutScene->unk2D8) {
                s = &resultsCutScene->unk9C[1];
                resultsCutScene->transform.width
                    = gSineTable[(((u16)resultsCutScene->unk2D6 >> 8) * 4) + 0x100] >> 6;
                resultsCutScene->unk2D6 += resultsCutScene->unk2D4;

                if (resultsCutScene->unk2D6 == 0) {
                    if (resultsCutScene->unk2D4 == 0x800) {
                        resultsCutScene->unk2D4 = 0x400;
                    } else {
                        resultsCutScene->unk2D4 = 0;
                    }
                }

                if (resultsCutScene->transform.width == 0) {
                    resultsCutScene->transform.width = 0x10;
                }
                sub_8004860(s, &resultsCutScene->transform);
                sub_80051E8(s);
            }

            if (resultsCutScene->unk2D8 == 1 && (unk168 & 0x20)) {
                s = &resultsCutScene->unk9C[2];
                sub_80051E8(s);
            }
        }

        for (i = 0; i < 7; i++) {
            s32 index = (unk168 - 0x78) - i;
            if (index < 0) {
                break;
            }

            s = &resultsCutScene->unk178[i];
            if (index < 0x14U) {
                s->y += gUnknown_080E05C4[index];
            }

            sub_80051E8(s);
        }
    }
}

// StoreRecord
u8 sub_80899B8(u32 finishTime)
{
    u32 existingRecords[3];
    u8 i;

    u8 character = gSelectedCharacter;
    u8 zone = gCurrentLevel >> 2;
    s32 currentLevel = gCurrentLevel;
    u8 act = currentLevel - currentLevel / (ACTS_PER_ZONE + 1) * (ACTS_PER_ZONE + 1);
    u8 rank = 0;

    for (i = 0; i < 3; i++) {
        existingRecords[i] = gLoadedSaveGame->timeRecords.table[character][zone][act][i];
    }

    for (i = 0; i < 3; i++) {
        if (finishTime < existingRecords[i]) {
            gLoadedSaveGame->timeRecords.table[character][zone][act][i] = finishTime;
            rank = ++i;
            break;
        }
    }

    for (; i < 3; i++) {
        gLoadedSaveGame->timeRecords.table[character][zone][act][i]
            = existingRecords[i - 1];
    }

    return rank;
}

void sub_80310F0(void);
void sub_8031314(void);
void sub_8089B40(void);

void sub_8089AEC(void)
{
    struct TimeAttackResultsCutScene *resultsCutScene = TaskGetStructPtr(gCurTask);
    u32 unk168 = resultsCutScene->unk168;
    resultsCutScene->unk168 = ++unk168;
    sub_80310F0();
    sub_8031314();
    sub_80897E8();

    if (((unk168 > 0xA0) && (gPressedKeys & (A_BUTTON | START_BUTTON)))
        || (unk168 > 600)) {
        gCurTask->main = sub_8089B40;
    }
}

void sub_8089B40(void)
{
    struct TimeAttackResultsCutScene *resultsCutScene = TaskGetStructPtr(gCurTask);
    if (NextTransitionFrame(&resultsCutScene->unk0) == SCREEN_TRANSITION_COMPLETE) {
        WriteSaveGame();
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateTimeAttackLobbyScreen();
        return;
    }

    sub_80310F0();
    sub_8031314();
    sub_80897E8();
}

void sub_8089BB0(struct Task *t)
{
    u32 i;
    struct TimeAttackResultsCutScene *resultsCutScene = TaskGetStructPtr(t);
    VramFree(resultsCutScene->unk12C.graphics.dest);

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->unkC[i].graphics.dest);
    }

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->unk9C[i].graphics.dest);
    }

    for (i = 0; i < 7; i++) {
        VramFree(resultsCutScene->unk178[i].graphics.dest);
    }

    gUnknown_03005424 &= ~0x200;
}
