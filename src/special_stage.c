#include "main.h"
#include "special_stage.h"
#include "special_stage_utils.h"
#include "special_stage_player.h"
#include "special_stage_ui.h"
#include "special_stage_unk_806E6E8.h"
#include "special_stage_unk_806BD94.h"
#include "special_stage_guard_robo.h"
#include "special_stage_unk_806F910.h"
#include "special_stage_tables.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "m4a.h"
#include "task.h"
#include "title_screen.h"
#include "constants/songs.h"

void sub_806C970(void);
void SpecialStageOnDestroy(struct Task*);
void sub_806BD94(void);
void sub_806C864(void);
void sub_806C7B8(void);
void sub_806BE9C(void);
void sub_806BFD0(void);
void sub_806C9CC(void);
void sub_806C050(void);
void sub_806BCB8(void);
void sub_806C638(void);
void sub_806C6A4(void);
void sub_806C560(void);
void sub_806C49C(void);
void sub_806C42C(void);
void sub_806C338(void);
void sub_806CA54(void);
void sub_806CA18(void);
void sub_806C158(void);

void CreateSpecialStage(s16 selectedCharacter, s16 level) {
    struct Task* t;
    struct SpecialStage* stage;
    
    s16 zone, character, temp, i, target;
    
    m4aMPlayAllStop();

    if (level != -1) {
        temp = level >> 2;
    } else {
        temp = gCurrentLevel >> 2;
    }
    zone = temp;

    if (selectedCharacter == -1) {
        character = gSelectedCharacter;
    } else {
        character = selectedCharacter;
    }

    sub_806CEA8();

    t = TaskCreate(sub_806C970, sizeof(struct SpecialStage), 0x2000, 0, SpecialStageOnDestroy);
    stage = TaskGetStructPtr(t);
    stage->unk594 = Q_16_16(256);
    stage->unk598 = Q_16_16(256);
    stage->unk59C = 0;

    stage->unk5A0 = 512;

    if (character <= CHARACTER_AMY) {
        stage->character = character;
        stage->unk5B7 = FALSE;
    } else {
        stage->character = CHARACTER_TAILS;
        stage->unk5B7 = TRUE;
    }

    stage->zone = zone;
    stage->level = level;
    stage->unk5A2 = 0;
    
    stage->unk5BB = 1;
    stage->unk5BC = 2;
    stage->unk5BD = 0;
    stage->unk5BE = 0;

    stage->elapsedTime = 0;
    stage->levelTime = gSpecialStageLevelTimes[zone];

    stage->unk5B4 = 0;
    stage->unk5BA = 0;
    stage->unk5BF = 0;

    stage->unk5C0 = 0;
    stage->unk5C1 = 0;

    stage->unk5C2 = Div(stage->levelTime, 100);
    stage->unk5C3 = Div(stage->levelTime, 10) - (stage->unk5C2 * 10);
    stage->unk5C4 = Mod(stage->levelTime, 10);

    stage->unk5C5 = 0;
    stage->unk5C5 = 0;
    stage->unk5C6 = 0;
    stage->unk5C7 = 0;
    stage->unk5C8 = 0;

    stage->unk5CA = 120;
    stage->unk5CC = 140;
    stage->unk5CE = 64;
    
    stage->unk5D0 = 40;
    stage->unk5D1 = 60;

    // wtf, all this stuff is const
    target = 0x31;
    stage->unk5D2 = target;

    for (i = 1; i < stage->unk5D2; i *= 2);

    stage->unk5D2 = i;
    stage->unk5D3 = ((159 - stage->unk5D1) >> 1) + stage->unk5D1;
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

void sub_806BD94(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    stage->unk5B4 = 2;
    
    switch(stage->unk5A2) {
        case 0:
            stage->unk0 = sub_806F910(stage);
            stage->playerTask = CreateSpecialStagePlayer(stage);
            stage->unk5D4 = gUnknown_03005B5C;
            stage->guardRoboTask = CreateGuardRobo(stage);
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
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);

    if (stage->unk5B4 == 6) {
#ifndef NON_MATCHING
        do 
#endif
        if (player->unkB4 != 0xE && player->unkB4 != 0xF) {
            player->unkB4 = 0xB;
        }
#ifndef NON_MATCHING
        while (0);
#endif
        stage->unk5B4 = 7;
    }

    if (stage->unk5B4 == 6 || stage->unk5B4 == 7) {
        if (player->unkB4 != 0xB && player->unkB4 != 0xC && player->unkB4 != 0xD) {
            player->unkB4 = 0xB;
        }
    }

    switch (player->unkB4) {
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

void sub_806BFD0(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* transitionConfig = &stage->unk88;
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(stage->guardRoboTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);

    guardRobo->unk3C = 0;

    transitionConfig->unk0 = 1;
    transitionConfig->unk2 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x40;
    transitionConfig->unkA = 0;
    transitionConfig->unk8 = 0xBF;
    sub_802D4CC(transitionConfig);

    gDispCnt = 0x9641;
    gWinRegs[5] = 0x103F;

    if (player->unkB4 == 0xD) {
        m4aSongNumStart(MUS_SPECIAL_STAGE_CLEAR);
    }
    gCurTask->main = sub_806C050;
}

void sub_806C050(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk88 = &stage->unk88;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);

    if (sub_802D4CC(unk88) == 0) {
        gDispCnt = 0x9641;
        gWinRegs[5] = 0x103F;
    } else {
        if (stage->guardRoboTask != NULL) {
            TaskDestroy(stage->guardRoboTask);
            stage->guardRoboTask = NULL;
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

        if (player->unkB4 == 0xD) {
            stage->unk5A2 = 0;
            player->unkB4 = 0x10;
            gCurTask->main = sub_806CA18;
        } else {
            gCurTask->main = sub_806C158;
        }
    }
}

void sub_806C158(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);

    gBldRegs.bldY = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;

    stage->unk10 = sub_8070BF0(stage);
    stage->unk5A8 = stage->elapsedTime * 100;
    
    if (stage->unk5A8 > 0x1863C) {
        stage->unk5A8 = 0x1863C;
    }

    stage->unk5AC = stage->unk5C5 ? 10000 : 0;
    stage->unk5B0 = 0;

    if (player->unkB4 == 0x10) {
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

void sub_806C560(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    u8 unk5B6 = stage->character;
    u8 something = gLoadedSaveGame->unkC[unk5B6];

    if (stage->unk5C7 == 1) {
        s32 temp = --stage->unk5C8;
        if (temp == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = temp;
        }
    }

    if (!GetBit(something, stage->zone)) {
        sub_8070C30(stage);
        gLoadedSaveGame->unkC[unk5B6] |= 1 << stage->zone;
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

        if (stage->playerTask != NULL) {
            TaskDestroy(stage->playerTask);
            stage->playerTask = NULL;
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

        gLoadedSaveGame->unk374 += stage->elapsedTime;

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

void SpecialStageOnDestroy(UNUSED struct Task* t) {
    gUnknown_03004D54 = &gUnknown_03001B60[0];
    gUnknown_030022C0 = &gUnknown_03001B60[1];
}

void sub_806C970(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    sub_806BCB8();
    sub_806CA88(&stage->unk18, RENDER_TARGET_SCREEN, 0x28, 0x37C, 0, 0x78, 0x50, 0, 0, 0);

    stage->unk5B4 = 1;
    m4aSongNumStart(MUS_SPECIAL_STAGE_INTRO);

    gCurTask->main = sub_806BD28;
}

void sub_806C9CC(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&stage->unk88) != 0) {
        stage->unk5A2 = 0;
        stage->unk5B4 = 4;
        m4aSongNumStart(MUS_SPECIAL_STAGE);
        gCurTask->main = sub_806BE40;
    }
}

void sub_806CA18(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);

    gBldRegs.bldY = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;

    stage->unk5A2++;

    if (stage->unk5A2 > 0xb3) {
        gCurTask->main = sub_806C158;
    }
}

void sub_806CA54(void) {
    struct SpecialStage* stage = TaskGetStructPtr(gCurTask);
    stage->unk5A2++;

    if (stage->unk5A2 > 0x3B) {
        stage->unk5A2 = 0;
        gCurTask->main = sub_806C25C;
    }
}
