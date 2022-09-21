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

struct TimeAttackResultsCutScene {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct UNK_0808B3FC_UNK240 unk9C;
    struct UNK_0808B3FC_UNK240 unkCC;
    struct UNK_0808B3FC_UNK240 unkFC;
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
    struct UNK_802D4CC_UNK270 unk2C8;
    u16 unk2D4;
    u16 unk2D6;
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
    u8 someVal;
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

    element = &resultsCutScene->unkC;
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

    element = &resultsCutScene->unk3C;
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
        someVal = (gCurrentLevel << 0x18 >> 0x1A) + 2;
        
    } else {
        someVal = gCurrentLevel & 1;
    }
    element = &resultsCutScene->unk6C;
    element->unk16 = 0x100;
    element->unk18 = 0x31;
    element->unk4 = VramMalloc(gUnknown_080D7178[someVal][0]);
    element->unkA = gUnknown_080D7178[someVal][1];
    element->unk20 = gUnknown_080D7178[someVal][2];
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

    element = &resultsCutScene->unk9C;
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

    element = &resultsCutScene->unkCC;
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
    resultsCutScene->unk2C8.unk6 = 0x78;
    resultsCutScene->unk2C8.unk8 = 0x78;
    resultsCutScene->unk2C8.unk0 = 0;

    element = &resultsCutScene->unkFC;
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
