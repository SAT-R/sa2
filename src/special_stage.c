#include "main.h"
#include "special_stage.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "m4a.h"
#include "task.h"
#include "constants/songs.h"
#include "title_screen.h"


struct SpecialStage {
    struct Task* unk0;
    struct Task* unk4;
    struct Task* unk8;
    struct Task* unkC; // UNK_806CF78
    struct Task* unk10;
    struct Task* unk14; // UNK_8071438
    struct UNK_0808B3FC_UNK240 unk18;
    struct Unk_03002400 unk48;
    struct UNK_802D4CC_UNK270 unk88;
    u8 unk94[1280];
    u32 unk594;
    u32 unk598;
    u32 unk59C;

    s16 unk5A0;
    s16 unk5A2;
    s16 unk5A4;

    // time
    s16 unk5A6;

    s32 unk5A8;
    s32 unk5AC;
    s32 unk5B0;

    u16 unk5B4;
    u8 unk5B6;
    u8 unk5B7;
    u8 unk5B8;
    u8 unk5B9;
    u8 unk5BA;

    s8 unk5BB;
    s8 unk5BC;
    s8 unk5BD;
    s8 unk5BE;

    u8 unk5BF;
    u8 unk5C0;
    u8 unk5C1;

    s8 unk5C2;
    s8 unk5C3;
    u8 unk5C4;

    s8 unk5C5;
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

struct UNK_8071438 {
    struct SpecialStage* unk0;
    u8 filler4[56];
    u16 unk3C;
    u8 filler3E[26];
}; /* size 0x58 */

struct UNK_8070BF0 {
    struct SpecialStage* unk0;
    u8 unk4[1308];
}; /* size 0x520 */

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

void sub_806C050(void);

void sub_806BFD0(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* transitionConfig = &stage->unk88;
    struct UNK_8071438* unk1438 = TaskGetStructPtr(stage->unk14);
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(stage->unkC);

    unk1438->unk3C = 0;

    transitionConfig->unk0 = 1;
    transitionConfig->unk2 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x40;
    transitionConfig->unkA = 0;
    transitionConfig->unk8 = 0xBF;
    sub_802D4CC(transitionConfig);

    gDispCnt = 0x9641;
    gWinRegs[5] = 0x103F;

    if (unkCF78->unkB4 == 0xD) {
        m4aSongNumStart(MUS_SPECIAL_STAGE_CLEAR);
    }
    gCurTask->main = sub_806C050;
}

void sub_806CEC4(struct Unk_03002400 *, u32 ,u32 ,u16 ,u16 ,u16 ,u8 ,u16 ,u16 ,u16);

void sub_806CA18(void);
void sub_806C158(void);

void sub_806C050(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk88 = &stage->unk88;
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(stage->unkC);

    if (sub_802D4CC(unk88) == 0) {
        gDispCnt = 0x9641;
        gWinRegs[5] = 0x103F;
    } else {
        if (stage->unk14 != NULL) {
            TaskDestroy(stage->unk14);
            stage->unk14 = NULL;
        }

        if (stage->unk0 != NULL) {
            TaskDestroy(stage->unk0);
            stage->unk0 = NULL;
        }

        if (stage->unk4 != NULL) {
            TaskDestroy(stage->unk4);
            stage->unk4 = NULL;
        }

        if (stage->unk8 != NULL) {
            TaskDestroy(stage->unk8);
            stage->unk8 = NULL;
        }

        if (stage->unk10 != NULL) {
            TaskDestroy(stage->unk10);
            stage->unk10 = NULL;
        }

        sub_806CEC4(&stage->unk48, 0, 7, 0x8B, 0x20, 0x20, 0, 1, 0, 0);
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;
        gDispCnt = 0x1240;

        if (unkCF78->unkB4 == 0xD) {
            stage->unk5A2 = 0;
            unkCF78->unkB4 = 0x10;
            gCurTask->main = sub_806CA18;
        } else {
            gCurTask->main = sub_806C158;
        }
    }
}

struct Task* sub_8070BF0(struct SpecialStage*);
void sub_806CA54(void);

void sub_806C158(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(stage->unkC);

    gBldRegs.bldY = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;

    stage->unk10 = sub_8070BF0(stage);
    stage->unk5A8 = stage->unk5A4 * 100;
    
    if (stage->unk5A8 > 0x1863C) {
        stage->unk5A8 = 0x1863C;
    }

    stage->unk5AC = stage->unk5C5 ? 10000 : 0;
    stage->unk5B0 = 0;

    if (unkCF78->unkB4 == 0x10) {
        if (stage->unk5C5 != 0) {
            m4aSongNumStart(MUS_CHAOS_EMERALD);
            stage->unk5C7 = 1;
            stage->unk5C8 = 0x96;
        } else {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
            stage->unk5C8 = 0;
           
        }
    } else {
        m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT_LOSE);
    }

    stage->unk5A2 = 0;
    gCurTask->main = sub_806CA54;
}

void sub_806C42C(void);
void sub_806C338(void);

void sub_806C25C(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    if (gPressedKeys & A_BUTTON) {
        gCurTask->main = sub_806C42C;
        return;
    }

    if (stage->unk5A8 < 100) {
        stage->unk5B0 += stage->unk5A8;
        stage->unk5A8 = 0;
    } else {
        stage->unk5B0 += 100;
        stage->unk5A8 -= 100;
    }

    if (stage->unk5B0  > 0x1863C) {
        stage->unk5B0 = 0x1863C;
    }

    stage->unk5A2++;

    if ((stage->unk5A2 & 3) == 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
    }

    if (stage->unk5A8 == 0) {
        stage->unk5A8 = 0;
        gCurTask->main = sub_806C338;
    }   
}

void sub_806C49C(void);

void sub_806C338(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    if (gPressedKeys & A_BUTTON) {
        gCurTask->main = sub_806C42C;
        return;
    }

    if (stage->unk5AC < 100) {
        stage->unk5B0 += stage->unk5AC;
        stage->unk5AC = 0;
    } else {
        stage->unk5B0 += 100;
        stage->unk5AC -= 100;
    }

    if (stage->unk5B0  > 0x1863C) {
        stage->unk5B0 = 0x1863C;
    }

    stage->unk5A2++;

    if ((stage->unk5A2 & 3) == 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
    }

    if (stage->unk5AC == 0) {
        if (stage->unk5B0 != 0) {
            m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
        }
    
        stage->unk5AC = 0;
        stage->unk5A2 = 0;
        gCurTask->main = sub_806C49C;
    }
}

void sub_806C42C(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    stage->unk5B0 += stage->unk5A8;
    stage->unk5A8 = 0;
    
    stage->unk5B0 += stage->unk5AC;
    stage->unk5AC = 0;

    if (stage->unk5B0 > 0x1863C) {
        stage->unk5B0 = 0x1863C;
    }

    if (stage->unk5B0 != 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
    }

    stage->unk5A2 = 0;
    gCurTask->main = sub_806C49C;
}

void sub_806C6A4(void);
void sub_806C560(void);

void sub_806C49C(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* transitionConfig = &stage->unk88;
    stage->unk5A2++;

    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    if (gPressedKeys & A_BUTTON || stage->unk5A2 > 0x3C) {
        transitionConfig->unk0 = 0;
        transitionConfig->unk2 = 1;
        transitionConfig->unk4 = 0;
        transitionConfig->unk6 = 0x40;
        transitionConfig->unkA = 0;
        transitionConfig->unk8 = 0xBF;

        stage->unk5A2 = 0;
        if (stage->unk5C5 != 0) {
            gCurTask->main = sub_806C560;
        } else {
            gCurTask->main = sub_806C6A4;
        }
    }
}

void sub_8070C30(struct SpecialStage*);
void sub_806C638(void);

void sub_806C560(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    u8 unk5B6 = stage->unk5B6;
    u8 something = gLoadedSaveGame->unkC[unk5B6];

    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    if (!GetBit(something, stage->unk5B8)) {
        sub_8070C30(stage);
        gLoadedSaveGame->unkC[unk5B6] |= 1 << stage->unk5B8;
        stage->unk5A2 = 0x78;
    } else {
        stage->unk5A2 = 0xC;
    }

    if ((gLoadedSaveGame->unkC[unk5B6] & 0x7F) == 0x7F) {
        gLoadedSaveGame->unkC[unk5B6] = 0xFF;
    }

    gCurTask->main = sub_806C638;
}

void sub_806C638(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    stage->unk5A2--;

    if (stage->unk5A2 < 1) {
        stage->unk5A2 = 0;
        gCurTask->main = sub_806C6A4;
    }
}

void sub_806C6A4(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    if (sub_802D4CC(&stage->unk88) == 0) {
        return;
    }
    
    stage->unk5A2++;
    if (stage->unk5A2 > 0x77) {
        s32 temp2, temp3, temp4;
        s32 temp = stage->unk5B0;

        if (stage->unkC != NULL) {
            TaskDestroy(stage->unkC);
            stage->unkC = NULL;
        }

        if (stage->unk10 != NULL) {
            TaskDestroy(stage->unk10);
            stage->unk10 = NULL;
        }

        temp4 = gUnknown_03005450;
        gUnknown_03005450 += temp;

        temp2 = Div(gUnknown_03005450, 50000);
        temp3 = Div(temp4, 50000);

        if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
            u16 temp5 = (temp2 - temp3);
            temp5 += gUnknown_03005448;

            if (temp5 > 0xFF) {
                temp5 = 0xFF;
            }

            gUnknown_03005448 = temp5;
        }

        gLoadedSaveGame->unk374 += stage->unk5A4;

        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        WriteSaveGame();
        sub_801A770();
    }
}

void sub_806C7B8(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    if (stage->unk5BE > 0) {
        stage->unk5BE--;
        return;
    }

    if (stage->unk5BD > 0) {
        stage->unk5BD--;
    } else if (stage->unk5BC > 0) {
        stage->unk5BC--;
        stage->unk5BD = 9;
    } else if (stage->unk5BB > 0) {
        stage->unk5BB--;
        stage->unk5BC = 9;
        stage->unk5BD = 9;
    } else {
        stage->unk5BB = 0;
        stage->unk5BC = 0;
        stage->unk5BD = 0;
        stage->unk5BE = 0;

        if (stage->unk5B4 != 7) {
            stage->unk5B4 = 6;
        }
        return;
    }

    stage->unk5BE = 0x3B;
}

void sub_806C864(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    if (stage->unk5BA == 1) {
        if (gPressedKeys & (DPAD_UP | DPAD_DOWN)) {
            u8 temp = stage->unk5C6;

            if (gPressedKeys & DPAD_UP) {
                stage->unk5C6 = 0;
            }

            if (gPressedKeys & DPAD_DOWN) {
                stage->unk5C6 = 1;
            }

            if (temp != stage->unk5C6) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            return;
        }

        if (gPressedKeys & A_BUTTON) {
            if (stage->unk5C6 == 0) {
                stage->unk5BA = 0;
                gPressedKeys &= ~A_BUTTON;
                return;
            }
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            CreateTitleScreenAndSkipIntro();
            return;
        }
    }

    if (gPressedKeys & START_BUTTON) {
        stage->unk5BA = stage->unk5BA == 0 ? 1 : 0;
        stage->unk5C6 = 0;
    }
}

void sub_806C950(UNUSED struct Task* t) {
    gUnknown_03004D54 = &gUnknown_03001B60[0];
    gUnknown_030022C0 = &gUnknown_03001B60[1];
}
