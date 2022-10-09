#include "main.h"
#include "special_stage.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "m4a.h"
#include "task.h"
#include "constants/songs.h"

struct SpecialStage {
    struct Task* unk0;
    struct Task* unk4;
    struct Task* unk8;
    struct Task* unkC; // UNK_806CF78
    struct Task* unk10;
    struct Task* unk14;
    struct UNK_0808B3FC_UNK240 unk18;
    struct Unk_03002400 unk48;
    struct UNK_802D4CC_UNK270 unk88;
    u8 unk94[1280];
    u32 unk594;
    u32 unk598;
    u32 unk59C;
    u16 unk5A0;
    s16 unk5A2;
    u16 unk5A4;

    // time
    s16 unk5A6;

    u8 unk5A8[12];
    u16 unk5B4;
    u8 unk5B6;
    u8 unk5B7;
    u8 unk5B8;
    u8 unk5B9;
    u8 unk5BA;

    s8 unk5BB;
    s8 unk5BC;

    u8 unk5BD;
    u8 unk5BE;
    u8 unk5BF;
    u8 unk5C0;
    u8 unk5C1;

    s8 unk5C2;
    s8 unk5C3;
    u8 unk5C4;

    u8 unk5C5;
    u8 unk5C6;

    s8 unk5C7;
    s8 unk5C8;

    u8 filler5C9;
    u16 unk5CA;
    u16 unk5CC;
    u16 unk5CE;
    u8 unk5D0;
    u8 unk5D1;
    u8 unk5D2;
    u8 unk5D3;
    u32 unk5D4;
}; /* size 0x5D8 */

struct UNK_806BD94 {
    struct SpecialStage* unk0;
    u8 unk4[2644];
    u16 unkA58;
    u16 unkA5A;
}; /* size 0xA5C */

struct UNK_806CF78 {
    u8 unk0[8];
    struct UNK_0808B3FC_UNK240 unk8;
    struct UNK_0808B3FC_UNK240 unk38;
    struct UNK_0808B3FC_UNK240 unk68;
    u8 unk98[28];
    u16 unkB4;
    u8 unkB6[82];
}; /* size 0x108 */

u32 gUnknown_03005B5C;

void sub_806CEA8(void);
void sub_806C970(void);
void sub_806C950(struct Task*);

extern const s16 gUnknown_080DFA02[7];

void sub_806BA84(s16 a, s16 b) {
    struct Task* t;
    struct SpecialStage* stage;
    
    s16 level, character, temp, i, target;
    
    m4aMPlayAllStop();

    if (b != -1) {
        temp = b >> 2;
    } else {
        temp = gCurrentLevel >> 2;
    }
    level = temp;

    if (a == -1) {
        character = gSelectedCharacter;
    } else {
        character = a;
    }

    sub_806CEA8();

    t = TaskCreate(sub_806C970, 0x5D8, 0x2000, 0, sub_806C950);
    stage = TaskGetStructPtr(t);
    stage->unk594 = 0x1000000;
    stage->unk598 = 0x1000000;
    stage->unk59C = 0;
    stage->unk5A0 = 0x200;

    if (character < 5) {
        stage->unk5B6 = character;
        stage->unk5B7 = 0;
    } else {
        stage->unk5B6 = 2;
        stage->unk5B7 = 1;
    }

    stage->unk5B8 = level;
    stage->unk5B9 = b;
    stage->unk5A2 = 0;
    
    stage->unk5BB = 1;
    stage->unk5BC = 2;
    stage->unk5BD = 0;
    stage->unk5BE = 0;

    stage->unk5A4 = 0;
    stage->unk5A6 = gUnknown_080DFA02[level];

    stage->unk5B4 = 0;
    stage->unk5BA = 0;
    stage->unk5BF = 0;

    stage->unk5C0 = 0;
    stage->unk5C1 = 0;

    stage->unk5C2 = Div(stage->unk5A6, 100);
    stage->unk5C3 = Div(stage->unk5A6, 10) - (stage->unk5C2 * 10);
    stage->unk5C4 = Mod(stage->unk5A6, 10);

    stage->unk5C5 = 0;
    stage->unk5C5 = 0;
    stage->unk5C6 = 0;
    stage->unk5C7 = 0;
    stage->unk5C8 = 0;

    stage->unk5CA = 0x78;
    stage->unk5CC = 0x8C;
    stage->unk5CE = 0x40;
    
    stage->unk5D0 = 0x28;
    stage->unk5D1 = 0x3C;

    // wtf, all this stuff is const
    target = 0x31;
    stage->unk5D2 = target;

    for (i = 1; i < stage->unk5D2; i *= 2);

    stage->unk5D2 = i;
    stage->unk5D3 = ((0x9F - stage->unk5D1) >> 1) + stage->unk5D1;
}

void sub_806BCB8(void) {
    gDispCnt = 0x1641;
    gBgCntRegs[1] = 0x703;
    gBgCntRegs[2] = 0xD086;
    gBldRegs.bldCnt = 0xAF;
    gBldRegs.bldY = 0x10;

    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x80;
}

void sub_806BD94(void);

void sub_806BD28(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    struct UNK_802D4CC_UNK270* transitionConfig = &stage->unk88;
    sub_80051E8(&stage->unk18);
    gBldRegs.bldCnt = 0xAF;
    
    stage->unk5A2++;

    if (stage->unk5A2 > 0x8B) {
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10;
        
        transitionConfig->unk0 = 0;
        transitionConfig->unk2 = 2;
        transitionConfig->unk4 = 0;
        transitionConfig->unk6 = 0x100;
        transitionConfig->unkA = 0;
        transitionConfig->unk8 = 0xBF;
        stage->unk5A2 = 0;
        gCurTask->main = sub_806BD94;
    }
}

struct Task* sub_806F910(struct SpecialStage*);
struct Task* sub_806CF78(struct SpecialStage*);
struct Task* sub_806E684(struct SpecialStage*);
struct Task* sub_806E6E8(struct SpecialStage*);
struct Task* sub_8071438(struct SpecialStage*);
struct Task* sub_8070B90(struct SpecialStage*);

void sub_806C9CC(void);

void sub_806BD94(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    stage->unk5B4 = 2;
    
    switch(stage->unk5A2) {
        case 0:
            stage->unk0 = sub_806F910(stage);
            stage->unkC = sub_806CF78(stage);
            stage->unk5D4 = gUnknown_03005B5C;
            stage->unk14 = sub_8071438(stage);
            break;
        case 1:
            stage->unk8 = sub_806E684(stage);
            break;
        case 2:
            stage->unk4 = sub_806E6E8(stage);
            stage->unk10 = sub_8070B90(stage);
            break;
        case 3:
            stage->unk5B4 = 3;
            gCurTask->main = sub_806C9CC;
            return;
    }

    stage->unk5A2++;
}

void sub_806C864(void);
void sub_806C7B8(void);
void sub_806BE9C(void);
void sub_806BFD0(void);

void sub_806BE40(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    sub_806C864();

    if (stage->unk5BA == 0) {
        sub_806C7B8();
        stage->unk5A2++;
    }

    if (stage->unk5A2 > 0x3B) {
        stage->unk5A2 = 0;
        stage->unk5B4 = 5;
        gCurTask->main = sub_806BE9C;
    }
}

void sub_806BE9C(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(stage->unkC);

    if (stage->unk5B4 == 6) {
#ifndef NON_MATCHING
        do 
#endif
        if (unkCF78->unkB4 != 0xE && unkCF78->unkB4 != 0xF) {
            unkCF78->unkB4 = 0xB;
        }
#ifndef NON_MATCHING
        while (0);
#endif
        stage->unk5B4 = 7;
    }

    if (stage->unk5B4 == 6 || stage->unk5B4 == 7) {
        if (unkCF78->unkB4 != 0xB && unkCF78->unkB4 != 0xC && unkCF78->unkB4 != 0xD) {
            unkCF78->unkB4 = 0xB;
        }
    }

    switch (unkCF78->unkB4) {
        case 0xD:
             stage->unk5B4 = 8;
            gCurTask->main = sub_806BFD0;
            return;
        case 0xF:
             stage->unk5B4 = 8;
            gCurTask->main = sub_806BFD0;
            return;
        case 0xE:
            break;
        default:
            sub_806C864();
            break;
    }
    
    if (stage->unk5BA == 0) {
        sub_806C7B8();
        if (stage->unk5C7) {
            s32 temp = --stage->unk5C8;
            if (temp == 0) {
                stage->unk5C7 = temp;
                if (stage->unk5BB == 0 && stage->unk5BC < 3) {
                    m4aSongNumStart(MUS_SPECIAL_STAGE_PINCH);
                } else {
                    m4aSongNumStart(MUS_SPECIAL_STAGE);
                }
            }
        } else {
            if (stage->unk5BB == 0 && stage->unk5BC == 3 && stage->unk5BD == 0 && stage->unk5BE == 0) {
                m4aSongNumStart(MUS_SPECIAL_STAGE_PINCH);
            }
        }
    }
}
