#include "time_attack_results.h"
#include "main.h"
#include "sprite.h"
#include "transition.h"
#include "save.h"
#include "game.h"
#include "time.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"
#include "trig.h"
#include "task.h"
#include "time_attack_lobby.h"


struct TimeAttackResultsCutScene {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC[3];
    struct UNK_0808B3FC_UNK240 unk9C[3];
    struct UNK_0808B3FC_UNK240 unk12C;
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
    struct UNK_0808B3FC_UNK240 unk178[7];
    struct UNK_808D124_UNK180 unk2C8;
    s16 unk2D4;
    s16 unk2D6;
    u8 unk2D8;
};

void sub_8089AEC(void);
void sub_8089BB0(struct Task*);
u8 sub_80899B8(u32 finishTime);

extern const u16 gUnknown_080D713C[5][3];
extern const u16 gUnknown_080D715A[5][3];
extern const u16 gUnknown_080D7178[11][3];

u32 CreateTimeAttackResultsCutScene(u32 finishTime) {
    struct Task* t;
    struct TimeAttackResultsCutScene* resultsCutScene;
    struct UNK_802D4CC_UNK270* transitionConfig;
    struct UNK_0808B3FC_UNK240* element = NULL;
    s16 millis, minutes, seconds;
    u8 i;
    u8 isBossLevel;
    u8 level;
    gLoadedSaveGame->unk374 += gUnknown_030053F0;

    t = TaskCreate(sub_8089AEC, sizeof(struct TimeAttackResultsCutScene), 0xC100, 0, sub_8089BB0);
    resultsCutScene = TaskGetStructPtr(t);
    transitionConfig = &resultsCutScene->unk0;
    
    resultsCutScene->unk168 = 0;
    resultsCutScene->unk2D4 = 0x800;
    resultsCutScene->unk2D6 = 0x4000;

    transitionConfig->unk0 = 0;
    transitionConfig->unk2 = 1;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk4 = 0;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

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

    resultsCutScene->unk171 = UnitsDigit(minutes);
    resultsCutScene->unk172 = TensDigit(seconds);
    resultsCutScene->unk173 = UnitsDigit(seconds);
    resultsCutScene->unk174 = TensDigit(millis);
    resultsCutScene->unk175 = UnitsDigit(millis);

    for (i = 0; i < 7; i++) {
        element = &resultsCutScene->unk178[i];
        element->unk16 = i * 0xE + 0x48;
        element->unk18 = 0x58;
        element->unk4 = VramMalloc(4);
        element->unkA = 0x417;
        element->unk20 = 0;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
    }

    resultsCutScene->unk178[0].unk20 += resultsCutScene->unk171;
    resultsCutScene->unk178[1].unk20 = DELIMINATOR_DIGIT;
    resultsCutScene->unk178[2].unk20 += resultsCutScene->unk172;
    resultsCutScene->unk178[3].unk20 += resultsCutScene->unk173;
    resultsCutScene->unk178[4].unk20 = DELIMINATOR_DIGIT;
    resultsCutScene->unk178[5].unk20 += resultsCutScene->unk174;
    resultsCutScene->unk178[6].unk20 += resultsCutScene->unk175;

    for (i = 0; i < 7; i++) {
        sub_8004558(&resultsCutScene->unk178[i]);
    }

    resultsCutScene->unk2D8 = sub_80899B8(finishTime);

    element = &resultsCutScene->unk12C;
    element->unk16 = 0x100;
    element->unk18 = 0x50;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x460;
    element->unk20 = 0;
    element->unk1A = 0x140;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &resultsCutScene->unkC[0];
    element->unk16 = 0x100;
    element->unk18 = 0x29;
    element->unk4 = VramMalloc(gUnknown_080D713C[gSelectedCharacter][0]);
    element->unkA = gUnknown_080D713C[gSelectedCharacter][1];
    element->unk20 = gUnknown_080D713C[gSelectedCharacter][2];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    isBossLevel = (gCurrentLevel & 3) >> 1;

    element = &resultsCutScene->unkC[1];
    element->unk16 = 0x100;
    element->unk18 = 0x31;
    element->unk4 = VramMalloc(gUnknown_080D715A[isBossLevel][0]);
    element->unkA = gUnknown_080D715A[isBossLevel][1];
    element->unk20 = gUnknown_080D715A[isBossLevel][2];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    if (isBossLevel != 0) {
        level = (gCurrentLevel >> 2) + ACT_BOSS;
        
    } else {
        level = gCurrentLevel & 1;
    }
    element = &resultsCutScene->unkC[2];
    element->unk16 = 0x100;
    element->unk18 = 0x31;
    element->unk4 = VramMalloc(gUnknown_080D7178[level][0]);
    element->unkA = gUnknown_080D7178[level][1];
    element->unk20 = gUnknown_080D7178[level][2];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &resultsCutScene->unk9C[0];
    element->unk16 = 0x28;
    element->unk18 = 0x5A;
    element->unk4 = VramMalloc(8);
    element->unkA = 0x430;
    element->unk20 = 1;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &resultsCutScene->unk9C[1];
    element->unk16 = 0x78;
    element->unk18 = 0x78;
    element->unk4 = VramMalloc(0x10);
    element->unkA = 0x417;
    if (resultsCutScene->unk2D8 != 0) {
        element->unk20 = resultsCutScene->unk2D8 + 13;
    } else {
        element->unk20 = 14;
    }
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = gUnknown_030054B8++ | 0x20;
    sub_8004558(element);

    resultsCutScene->unk2C8.unk2 = 0;
    resultsCutScene->unk2C8.unk4 = 0x100;
    resultsCutScene->unk2C8.unk6[0] = 0x78;
    resultsCutScene->unk2C8.unk6[1] = 0x78;
    resultsCutScene->unk2C8.unk0 = 0;

    element = &resultsCutScene->unk9C[2];
    element->unk16 = 0x78;
    element->unk18 = 0x94;
    element->unk4 = VramMalloc(0x16);
    element->unkA = 0x430;
    element->unk20 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

#ifndef NON_MATCHING
    {
        u8 *ptr = &gUnknown_030054A8;
        register s32 var asm("r0") = 1;
        *ptr = -var;
    }
#else
    gUnknown_030054A8 = 0xFF;
#endif
    if ((gCurrentLevel & ACT_BOSS) && !(gCurrentLevel & ACT_2)) {
        gUnknown_030059E0.unk64 = 0x20;
    }

    if (resultsCutScene->unk2D8 == 1) {
        m4aSongNumStart(MUS_TIME_ATTACK_3);
    } else {
        m4aSongNumStart(MUS_TIME_ATTACK_2);
    }

    return 600;
}

extern const s8 gUnknown_080E05C4[0x20];

void sub_80897E8(void) {
    struct TimeAttackResultsCutScene* resultsCutScene = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element;
    u32 unk168 = resultsCutScene->unk168;
    u32 i;

    if (unk168 < 0x18) {
        s32 temp;
        element = &resultsCutScene->unk12C;
        temp = 0;
        if (unk168 < 0x11) {
            temp = (0x10 - unk168) * 0x18;
        }

        for (i = 0; i < 8; i++) {
            element->unk16 = temp + i * 0x20;
            sub_80051E8(element);
        }
    } else {
        element = &resultsCutScene->unk12C;
        for (i = 0; i < 8; i++) {
            element->unk16 = i << 5;
            sub_80051E8(element);
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
            // TODO: fix type
            element = &resultsCutScene->unkC[i];
            sub_80051E8(element);
        }
    }

    if (unk168 > 0x59) {
        element = &resultsCutScene->unk9C[0];
        if ((unk168 - 0x5A) < 0xB) {
            element->unk16 = (100 - unk168) * 0x10 + 0x28;
        }
        sub_80051E8(element);
    }

    if (unk168 > 0x77) {
        s32 temp = (unk168 - 0x7F);
        if (temp > 0x10) {
            if (resultsCutScene->unk2D8) {
                element = &resultsCutScene->unk9C[1];
                resultsCutScene->unk2C8.unk2 = gSineTable[(((u16)resultsCutScene->unk2D6 >> 8) * 4) + 0x100] >> 6;
                resultsCutScene->unk2D6 += resultsCutScene->unk2D4;

                if (resultsCutScene->unk2D6 == 0) {
                    if (resultsCutScene->unk2D4 == 0x800) {
                        resultsCutScene->unk2D4 = 0x400;
                    } else {
                        resultsCutScene->unk2D4 = 0;
                    }
                }

                if (resultsCutScene->unk2C8.unk2 == 0) {
                    resultsCutScene->unk2C8.unk2 = 0x10;
                }
                sub_8004860(element, &resultsCutScene->unk2C8);
                sub_80051E8(element);
            }

            if (resultsCutScene->unk2D8 == 1 && (unk168 & 0x20)) {
                element = &resultsCutScene->unk9C[2];
                sub_80051E8(element);
            }

           
        }

        for (i = 0; i < 7; i++) {
            s32 index = (unk168 - 0x78) - i;
            if (index < 0) {
                break;
            }

            element = &resultsCutScene->unk178[i];
            if (index < 0x14U) {
                element->unk18 += gUnknown_080E05C4[index];
            }

            sub_80051E8(element);
        }
    }
}

// StoreRecord
u8 sub_80899B8(u32 finishTime) {
    u32 existingRecords[3];
    u8 i;

    u8 character = gSelectedCharacter;
    u8 zone = gCurrentLevel >> 2;
    s32 currentLevel = gCurrentLevel;
    u8 act = currentLevel - currentLevel / (ACTS_PER_ZONE + 1) * (ACTS_PER_ZONE + 1);
    u8 rank = 0;

    for (i = 0; i < 3; i++) {
        existingRecords[i] = gLoadedSaveGame->unk34.table[character][zone][act][i];
    }

    for (i = 0; i < 3; i++) {
        if (finishTime < existingRecords[i]) {
            gLoadedSaveGame->unk34.table[character][zone][act][i] = finishTime;
            rank = ++i;
            break;
        }
    }

    for (;i < 3; i++) {
        gLoadedSaveGame->unk34.table[character][zone][act][i] = existingRecords[i - 1];
    }

    return rank;
}

void sub_80310F0(void);
void sub_8031314(void);
void sub_8089B40(void);

void sub_8089AEC(void) {
    struct TimeAttackResultsCutScene* resultsCutScene = TaskGetStructPtr(gCurTask);
    u32 unk168 = resultsCutScene->unk168;
    resultsCutScene->unk168 = ++unk168;
    sub_80310F0();
    sub_8031314();
    sub_80897E8();

    if (((unk168 > 0xA0) && (gPressedKeys & (A_BUTTON | START_BUTTON))) || (unk168 > 600)) {
        gCurTask->main = sub_8089B40;
    }
}

void sub_8089B40(void) {
    struct TimeAttackResultsCutScene* resultsCutScene = TaskGetStructPtr(gCurTask);
    if (sub_802D4CC(&resultsCutScene->unk0) == 1) {
        WriteSaveGame();
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        CreateTimeAttackLobbyScreen();
        return;
    }

    sub_80310F0();
    sub_8031314();
    sub_80897E8();
}

void sub_8089BB0(struct Task* t) {
    u32 i;
    struct TimeAttackResultsCutScene* resultsCutScene = TaskGetStructPtr(t);
    VramFree(resultsCutScene->unk12C.unk4);

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->unkC[i].unk4);
    }

    for (i = 0; i < 3; i++) {
        VramFree(resultsCutScene->unk9C[i].unk4);
    }

    for (i = 0; i < 7; i++) {
        VramFree(resultsCutScene->unk178[i].unk4);
    }

    gUnknown_03005424 &= ~0x200;
}
