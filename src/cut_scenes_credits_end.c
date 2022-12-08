#include "global.h"
#include "cut_scenes_credits_end.h"
#include "cut_scenes_missing_emeralds.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "trig.h"
#include "course_select.h"
#include "save.h"
#include "title_screen.h"
#include "random.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

struct CreditsEndCutScene {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;
    struct UNK_0808B3FC_UNK240 unkC0;
    struct UNK_0808B3FC_UNK240 unkF0;
    struct UNK_0808B3FC_UNK240 unk120;
    struct UNK_802D4CC_UNK270 unk150;
    u8 unk15C;
    u8 unk15D;
    u8 unk15E;
    u8 unk15F;
    u8 unk160;
    u8 unk161;
    u16 unk162;
    u32 unk164;
    s16 unk168;
    // vram
    vu32 unk16C;
    s32 unk170[3][2];
}; /* size: 0x188 */

extern const u16 gUnknown_080E12B0[0x20];
extern const struct UNK_080E0D64 gUnknown_080E12D0[4];

void sub_808FB2C(void);
void sub_808FBE4(struct Task *);

void CreateCreditsEndCutScene(u8 variant)
{
    u8 i;
    s32 r6 = 1;
    struct Task *t;
    struct CreditsEndCutScene *scene = NULL;
    struct UNK_802D4CC_UNK270 *transitionConfig;
    gDispCnt = 0x1040;

    gBgCntRegs[0] = 0x160D;
    gBgCntRegs[1] = 0x5480;
    gBgCntRegs[2] = 0x1504;
#ifndef NON_MATCHING
    DmaFill32(3, 0, 0x6000000 + (++r6, --r6) * 0x4000, 0x4000);
#else
    DmaFill32(3, 0, 0x6000000 + r6 * 0x4000, 0x4000);
#endif
    gUnknown_03004D80[2] = 0x5a;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xff;
    gUnknown_03002280[11] = 0x20;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 0x20;

    t = TaskCreate(sub_808FB2C, 0x188, 0x3100, 0, sub_808FBE4);
    scene = TaskGetStructPtr(t);
    scene->unk164 = 0x10E;
    scene->unk15C = variant;
    scene->unk15D = 0;
    scene->unk15E = 0;
    scene->unk15F = 0;
    scene->unk168 = 0x1E;
    scene->unk160 = 0;
    scene->unk161 = 0;
    scene->unk162 = 0xFFFF; // -1?
    if (gLoadedSaveGame->unk6 != LANG_JAPANESE) {
        scene->unk160 = 1;
    }

    for (i = 0; i < 2; i++) {
        scene->unk170[0][i] = 0;
        scene->unk170[1][i] = 0xB400;
        scene->unk170[2][i] = 0xC800;
    }

    transitionConfig = &scene->unk150;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FFF;

    scene->unk16C = OBJ_VRAM0;

    if (scene->unk15C == 2) {
        struct Unk_03002400 *background = &scene->unk40;
        {
            gDispCnt |= 0x100;
            gBgScrollRegs[0][0] = 0;
            gBgScrollRegs[0][1] = 0;

            background->unk4 = BG_SCREEN_ADDR(24);
            background->unkA = 0;
            background->unkC = BG_SCREEN_ADDR(22);
            background->unk18 = 0;
            background->unk1A = 0;
            background->unk1C = gUnknown_080E12B0[2];
            background->unk1E = 0;
            background->unk20 = 0;
            background->unk22 = 0;
            background->unk24 = 0;
            background->unk26 = 0x1E;
            background->unk28 = 0x14;
            background->unk2A = 0;
            background->unk2E = 0;
            sub_8002A3C(background);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unkC0;
            element->vram = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[0].numTiles << 5);
            element->anim = gUnknown_080E12D0[0].anim;
            element->variant = gUnknown_080E12D0[0].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = -20;
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unkF0;
            element->vram = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[1].numTiles << 5);
            element->anim = gUnknown_080E12D0[1].anim;
            element->variant = gUnknown_080E12D0[1].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = DISPLAY_HEIGHT + 96; // Note: 96 is the width of metatiles
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unk120;
            element->vram = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[2].numTiles << 5);
            element->anim = gUnknown_080E12D0[2].anim;
            element->variant = gUnknown_080E12D0[2].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = DISPLAY_HEIGHT + 96;
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background->unk4 = BG_SCREEN_ADDR(24);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[scene->unk15F + 2];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 0;
        sub_8002A3C(background);
        sub_8003638(background);
    }

    if (scene->unk15C == 1) {
        struct Unk_03002400 *background;
        gDispCnt |= 0x200;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;

        background = &scene->unk0;
        background->unk4 = BG_SCREEN_ADDR(0);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(20);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[scene->unk160];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 5;
        sub_8002A3C(background);
    }
}

void sub_808FBE8(struct CreditsEndCutScene *);
void sub_808FC00(struct CreditsEndCutScene *);
void sub_808FC3C(struct CreditsEndCutScene *);
void sub_808FA24(struct CreditsEndCutScene *);

void sub_808F5C4(void);
void sub_808FB94(void);

void sub_808F544(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk150;
    transitionConfig->unk2 = 1;
    if (scene->unk15C == 2) {
        sub_808FBE8(scene);
        sub_808FC00(scene);
        sub_808FC3C(scene);
    }

    sub_808FA24(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;

        if (scene->unk15D == 1) {
            gCurTask->main = sub_808F5C4;
        } else {
            gCurTask->main = sub_808FB94;
        }
    }
}

void sub_808FB2C(void);

void sub_808F5C4(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk164 != 0) {
        scene->unk164--;
        return;
    }
    {
        struct Unk_03002400 *background = &scene->unk40;
        gDispCnt &= ~0x200;
        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background->unk4 = BG_SCREEN_ADDR(24);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(22);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[13];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 0;
        sub_8002A3C(background);
    }

    {
        struct Unk_03002400 *background = &scene->unk80;
        gDispCnt |= 0x400;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0xD190;

        background->unk4 = BG_SCREEN_ADDR(8);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(21);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E12B0[14];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 3;
        background->unk2A = 0;
        background->unk2E = 2;
        sub_8002A3C(background);

        scene->unk15D = 2;
        scene->unk15F++;
        scene->unk164 = 0x10E;
        gCurTask->main = sub_808FB2C;
    }
}

void sub_808FBE8(struct CreditsEndCutScene *);
void sub_808F824(void);

extern const u8 gUnknown_080E12F0[12];

void sub_808F704(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk15C == 2) {
        sub_808FBE8(scene);
        sub_808FC00(scene);
        sub_808FC3C(scene);

        if (scene->unk15F < 0xB) {
            if (scene->unk15E != 0) {
                scene->unk15E--;
            } else {
                struct Unk_03002400 *background = &scene->unk40;
                gDispCnt |= 0x100;
                gBgScrollRegs[0][0] = 0;
                gBgScrollRegs[0][1] = 0;

                background->unk1C = gUnknown_080E12B0[scene->unk15F + 2];
                background->unk26 = 0x1E;
                background->unk28 = 0x14;
                background->unk2E = 0;
                sub_8002A3C(background);
                scene->unk15F++;

                scene->unk15E = gUnknown_080E12F0[scene->unk15F];

                if (scene->unk15F == 9) {
                    m4aSongNumStart(VOICE__ANNOUNCER__CONGRATULATIONS);
                }
            }
        }
    }

    sub_808FA24(scene);
    if (scene->unk164 != 0) {
        scene->unk164--;
        return;
    }

    if (scene->unk15D == 0) {
        scene->unk15D = 1;
        scene->unk164 = 0x1E;
        gCurTask->main = sub_808F544;
    } else {
        if (scene->unk15D == 2) {
            gCurTask->main = sub_808F824;
        }
    }
}

void sub_808F824(void)
{
    u8 sum = 0;
    u8 unlockedLevels = 0;
    u8 i;
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);

#ifndef NON_MATCHING
    u16 var = unlockedLevels;
    asm("" ::"r"(&var));
#endif

    if (scene->unk15C == 1) {
        if (gLoadedSaveGame->unk15[4] == 0) {
            gLoadedSaveGame->unk15[4] = 1;
            WriteSaveGame();
        }

        for (i = 0; i < NUM_CHARACTERS; i++) {
            if (gLoadedSaveGame->unk7[i] > LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                unlockedLevels |= 1 << i;
            }
        }

        if (unlockedLevels > 0xE && (gLoadedSaveGame->unkC[0] & 0x80)
            && gLoadedSaveGame->unk1A == 0) {
            gLoadedSaveGame->unk1A |= 1;
            WriteSaveGame();
        }

        if (gSelectedCharacter != CHARACTER_AMY) {
            if ((gLoadedSaveGame->unkC[gSelectedCharacter] & 0x80)) {
                gLoadedSaveGame->unk15[gSelectedCharacter] = 1;

                for (i = 0; i < 4; i++) {
                    if (gLoadedSaveGame->unk15[i] != 0) {
                        sum++;
                    }
                }

                if ((sum == 1 && gLoadedSaveGame->unk14)
                    || (sum == 2 && gLoadedSaveGame->unk11)
                    || (sum == 3 && gLoadedSaveGame->unk12)
                    || (sum >= 4 && gLoadedSaveGame->unk13 >= 0x10)) {
                    scene->unk161 = 1;
                    scene->unk164 = 0xB4;
                } else {
                    if (sum == 1) {
                        gLoadedSaveGame->unk14 = 1;
                    } else if (sum == 2) {
                        gLoadedSaveGame->unk11 = 1;
                    } else if (sum == 3) {
                        gLoadedSaveGame->unk12 = 1;
                    } else if (sum == 4) {
                        gLoadedSaveGame->unk13 |= 0x10;
                    }
                    WriteSaveGame();
                    scene->unk161 = 0;
                    scene->unk164 = 0x69;
                    scene->unk150.unk8 = 0x3FFF;
                }
            } else {
                scene->unk161 = 0;
                scene->unk150.unk8 = 0x3FFF;
                scene->unk164 = 0x69;
            }
        } else {
            scene->unk161 = 1;
            scene->unk164 = 0xB4;
        }
    } else {
        if (gLoadedSaveGame->unk1B == 0) {
            gLoadedSaveGame->unk1B = 1;
            WriteSaveGame();
        }
        scene->unk161 = 1;
        scene->unk164 = 0xB4;
    }

    scene->unk15D = 3;
    gCurTask->main = sub_808F544;
}

void sub_808FA24(struct CreditsEndCutScene *scene)
{
    struct UNK_0808B3FC_UNK240 *element;
    if (scene->unk15C != 2) {
        return;
    }

    if (scene->unk15F > 0xB) {
        return;
    }

    if (scene->unk168 >= 1) {
        element = &scene->unkC0;
        element->anim = gUnknown_080E12D0[0].anim;
        element->variant = gUnknown_080E12D0[0].variant;
        element->x = scene->unk170[0][0];
        element->y = scene->unk170[0][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
        scene->unk168--;
    } else if (scene->unk168 > -0xF && scene->unk168 < 1) {
        scene->unk168--;
    } else if (scene->unk168 <= -0xF) {
        scene->unk168 = 0x1E;
    }

    if (scene->unk15F == 11) {
        element = &scene->unkF0;
        element->anim = gUnknown_080E12D0[1].anim;
        element->variant = gUnknown_080E12D0[1].variant;
        element->x = scene->unk170[1][0];
        element->y = scene->unk170[1][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);

        element = &scene->unk120;
        element->anim = gUnknown_080E12D0[2].anim;
        element->variant = gUnknown_080E12D0[2].variant;
        element->x = scene->unk170[2][0];
        element->y = scene->unk170[2][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }
}

void sub_808FB2C(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk150;
    transitionConfig->unk2 = 2;

    if (scene->unk15C == 2) {
        sub_808FBE8(scene);
        sub_808FC00(scene);
        sub_808FC3C(scene);
    }

    sub_808FA24(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808F704;
    }
}

void sub_808FB94(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    if (scene->unk164 != 0) {
        scene->unk164--;
        return;
    }

    if (scene->unk161 == 0) {
        CreateMissingChaosEmaraldsCutScene();
        TaskDestroy(gCurTask);
    } else if (scene->unk161 == 1) {
        CreateTitleScreen();
        TaskDestroy(gCurTask);
    }
}

void sub_808FBE4(struct Task *t)
{
    // unused logic
}

void sub_808FBE8(struct CreditsEndCutScene *scene)
{
    scene->unk170[0][0] = 0x78;
    scene->unk170[0][1] = 0xA00;
}

void sub_808FC00(struct CreditsEndCutScene *scene)
{
    if (scene->unk15F == 11) {
        scene->unk170[1][0] = 0x78;
        if (scene->unk170[1][1] > 0x8200) {
            scene->unk170[1][1] -= 0x300;
        }
    }
}

void sub_808FC3C(struct CreditsEndCutScene *scene)
{
    if (scene->unk15F == 11) {
        scene->unk170[2][0] = 0x78;
        if (scene->unk170[2][1] > 0x9400) {
            scene->unk170[2][1] -= 0x300;
        }
    }
}
