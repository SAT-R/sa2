#include "global.h"
#include "cut_scenes_endings.h"
#include "cut_scenes_extra_ending_slides.h"
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

struct FinalEndingFallCutScene {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;

    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0[2];

    struct UNK_0808B3FC_UNK240 unk110;
    struct UNK_0808B3FC_UNK240 unk140;
    struct UNK_0808B3FC_UNK240 unk170;
    struct UNK_0808B3FC_UNK240 unk1A0;

    struct UNK_0808B3FC_UNK240 unk1D0[2];
    struct UNK_0808B3FC_UNK240 unk230[6];

    struct UNK_802D4CC_UNK270 unk350;

    u8 unk35C;
    u8 unk35D[6];
    u8 unk363;
    u8 unk364;
    u8 unk365[6];
    u8 unk36B;

    u16 unk36C;
    u16 unk36E;

    u16 unk370;
    u16 unk372;
    s32 unk374;

    s32 unk378[6][2];

    u32 unk3A8;
    s32 unk3AC;
    u32 unk3B0;
    s32 unk3B4;
    s32 unk3B8;
    u32 unk3BC;
    s32 unk3C0;
    s32 unk3C4;

    s32 unk3C8[6][2];

    s32 unk3F8[10][3];

    s32 unk470;
    s32 unk474;
    u32 unk478;
    u32 unk47C[6];

    // vramPtr
    vu32 unk494;

    u8 unk498;
}; /* 0x49C */

void sub_8092690(void);
void sub_8092800(struct Task *);

extern const struct UNK_080E0D64 gUnknown_080E1650[29];
extern const u16 gUnknown_080E1648[4];

void CreateFinalEndingFallCutScene(void)
{

    struct Unk_03002400 *background;
    struct Task *t;
    struct FinalEndingFallCutScene *scene = NULL;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;

    u8 i, j;

    SeedRng(0, 0xffff);
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x9C03;
    gBgCntRegs[1] = 0x9805;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 0x20;

    m4aMPlayAllStop();
    m4aSongNumStart(MUS_FINAL_ENDING);

    t = TaskCreate(sub_8092690, 0x49C, 0x3100, 0, sub_8092800);
    scene = TaskGetStructPtr(t);

    scene->unk35C = 0;
    scene->unk494 = 0;
    scene->unk470 = 0;
    scene->unk364 = 0;
    scene->unk474 = 0;
    scene->unk36E = 0xA0;
    scene->unk36C = 200;
    scene->unk363 = 0;
    scene->unk370 = 0;
    scene->unk374 = 0;
    scene->unk372 = 0;

    for (j = 0; j < 6; j++) {
        scene->unk35D[j] = 0;
        scene->unk47C[j] = 0;

        // Bug?
        scene->unk365[0] = 0;
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 6; j++) {
            scene->unk378[j][i] = 0;
            scene->unk3C8[j][i] = 0;
        }
    }

    scene->unk3C0 = 0xD2;
    scene->unk3C4 = 0x5500;
    scene->unk3A8 = 0x78;
    scene->unk3B4 = 0x78;
    scene->unk3AC = 0x5000;
    scene->unk3B8 = 0x5000;
    scene->unk3B0 = 1;
    scene->unk3BC = 1;

    for (j = 0; j < 10; j++) {
        scene->unk3F8[j][0] = Random() & 0xFF;
#ifndef NON_MATCHING
        while (0)
            ;
#endif
        scene->unk3F8[j][1] = 0;
        scene->unk3F8[j][2] = (1 << ((Random() & 1) + 0xC)) + 0x100;
    }

    scene->unk498 = 0;

    transitionConfig = &scene->unk350;
    transitionConfig->unk2 = 2;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x50;
    transitionConfig->unk8 = 0x3FBF;
    transitionConfig->unkA = 0;

    scene->unk494 = OBJ_VRAM0;
    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk80;
        element->vram = (void *)OBJ_VRAM0;
        scene->unk494 += gUnknown_080E1650[0].numTiles * 0x20;
        element->anim = gUnknown_080E1650[0].anim;
        element->variant = gUnknown_080E1650[0].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
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
        element = &scene->unk110;
        element->vram = (void *)scene->unk494;
        scene->unk494 += 0x1A00;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = (DISPLAY_HEIGHT / 2);
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28 = -1;
    }

    {
        struct UNK_0808B3FC_UNK240 *element;

        element = &scene->unk140;
        element->vram = (void *)scene->unk494;
        scene->unk494 += 0xC00;
        element->unk21 = 0xFF;
        element->x = 0x78;
        element->y = 0x50;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28 = -1;
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1A0;
        element->vram = (void *)scene->unk494;
        scene->unk494 += 0x3C0;
        element->anim = gUnknown_080E1650[1].anim;
        element->variant = gUnknown_080E1650[1].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x80;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1D0[i];
        element->vram = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[(i + 3)].numTiles * 0x20;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x40;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
    }

    for (i = 0; i < 6; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk230[i];

        element->vram = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[2].numTiles * 0x20;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
    }

    if (gSelectedCharacter == 1) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk170;
        element->vram = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[27].numTiles * 0x20;
        element->anim = gUnknown_080E1650[27].anim;
        element->variant = gUnknown_080E1650[27].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 2;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unkB0[i];
        element->vram = (void *)scene->unk494;
        scene->unk494 += 1;
        element->anim = gUnknown_080E1650[(i + 5)].anim;
        element->variant = gUnknown_080E1650[(i + 5)].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
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

    background = &scene->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1648[1];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &scene->unk40;
    background->unk4 = BG_SCREEN_ADDR(8);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(24);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1648[0];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);
}

void sub_8091F68(struct FinalEndingFallCutScene *);
void sub_809205C(struct FinalEndingFallCutScene *);
void sub_80920E4(struct FinalEndingFallCutScene *);
void sub_8092804(struct FinalEndingFallCutScene *);
void sub_80921E8(struct FinalEndingFallCutScene *);
void sub_8092850(struct FinalEndingFallCutScene *);
void sub_80923AC(struct FinalEndingFallCutScene *);

u32 sub_80928C8(struct FinalEndingFallCutScene *);

void sub_8091E60(void);

extern const u8 gUnknown_080E1738[10];

void sub_8091CB0(void)
{
    struct FinalEndingFallCutScene *scene = TaskGetStructPtr(gCurTask);
    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (scene->unk36E != 0) {
        scene->unk36E--;
        return;
    }

    if ((scene->unk35C & 1) == 0 && scene->unk35C < 10) {
        gDispCnt |= 0x2000;
        gWinRegs[0] = 0xA0;
        gWinRegs[2] = 0xF0;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;

        gBldRegs.bldY += gUnknown_080E1738[scene->unk35C];

        if (gBldRegs.bldY >= 0x10) {
            scene->unk35C++;
        }
    } else if (scene->unk35C < 10) {
        gDispCnt |= 0x2000;
        gWinRegs[0] = 0xA0;
        gWinRegs[2] = 0xF0;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY -= gUnknown_080E1738[scene->unk35C];

        if (gBldRegs.bldY <= gUnknown_080E1738[scene->unk35C]) {
            scene->unk35C++;
        }
    } else if (scene->unk35C == 10) {
        sub_80928C8(scene);
        gDispCnt |= 0x2000;
        gWinRegs[0] = 0xA0;
        gWinRegs[2] = 0xF0;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY--;

        if (gBldRegs.bldY <= 1) {
            scene->unk35C++;
        }
    } else {
        gCurTask->main = sub_8091E60;
    }
}

void sub_80927E8(void);

void sub_809289C(struct FinalEndingFallCutScene *);

void sub_8091E60(void)
{
    struct FinalEndingFallCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk350;

    transitionConfig->unk6 = 0x50;
    transitionConfig->unk2 = 1;

    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);
    sub_809289C(scene);

    if (scene->unk36C != 0) {
        scene->unk36C--;
        if (scene->unk36C > 0x27) {
            if (scene->unk36E != 0) {
                scene->unk36E--;
            } else {
                scene->unk36E = Random() & 0xF;
            }
        }
    } else {
        if (gBldRegs.bldY < 0x10) {
            gDispCnt |= 0x2000;
            gWinRegs[0] = 0xA0;
            gWinRegs[2] = 0xF0;
            gWinRegs[4] |= 0x3F;
            gWinRegs[5] |= 0x1F;
            gBldRegs.bldCnt = 0x3FBF;
            scene->unk374 += 0x20;
            gBldRegs.bldY = scene->unk374 >> 8;
        } else {
            if (scene->unk36E < 100) {
                scene->unk36E++;
            } else {
                gCurTask->main = sub_80927E8;
            }
        }
    }
}

extern const u8 gUnknown_080E1752[0x30];
extern const u8 gUnknown_080E1742[0x10];

void sub_8091F68(struct FinalEndingFallCutScene *scene)
{
    u32 val = 1;
    u32 val2 = 1;

    if (gBgScrollRegs[1][1] < 0x38) {
        scene->unk474 += (val << (gUnknown_080E1752[scene->unk364])) * 2;
    } else if (gBgScrollRegs[1][1] < 0x60) {
        scene->unk474 += (val << (gUnknown_080E1752[scene->unk364])) * 2;
    }

    if (gBgScrollRegs[0][1] < 0x88 && scene->unk35C < 10) {
        if (scene->unk474 > 0 && (gBgScrollRegs[1][1] & 7) == 0
            && (scene->unk474 >> 8) > gBgScrollRegs[1][1]) {
            scene->unk364++;
        }

        scene->unk470 += (val2 << (gUnknown_080E1742[scene->unk364])) << val;
    }

    if (scene->unk35C >= 10) {
        gBgScrollRegs[0][1] = gBgScrollRegs[1][1];
        sub_808E8F8(gBgScrollRegs[0], 0, 2);

    } else {
        gBgScrollRegs[0][1] = scene->unk470 >> 8;
    }

    gBgScrollRegs[1][1] = scene->unk474 >> 8;
}

void sub_809205C(struct FinalEndingFallCutScene *scene)
{
    u8 i;
    for (i = 0; i < 10; i++) {
        if (scene->unk3F8[i][1] < -0x5A00) {
            scene->unk3F8[i][1] = 0xE600;
            scene->unk3F8[i][2] = (1 << ((Random() & 1) + 0xC)) + 0x100;
            scene->unk3F8[i][0] = Random() & 0xFF;
        }

        scene->unk3F8[i][1] -= scene->unk3F8[i][2];
    }
}

void sub_80920E4(struct FinalEndingFallCutScene *scene)
{
    if (scene->unk35C >= 10) {
        if (scene->unk36C < 0x29) {
            scene->unk3AC += (0x28 - scene->unk36C) * 8;
            sub_808E8F8((s16 *)&scene->unk3A8, 0x52, 2);
            scene->unk3B4 = scene->unk3A8;
            goto end;
        }
    } else {
        if (scene->unk3AC < 0x5000) {
            scene->unk3AC += 0x40;
        }
        scene->unk3A8 = 0x52;
        scene->unk3B4 = 0x52;
        goto afterlab;
    }

    // I think?
    if (scene->unk35C >= 10) {
        sub_808E8F8((s16 *)&scene->unk3A8, 0x52, 2);
        scene->unk3B4 = scene->unk3A8;
    }
afterlab:

    if (scene->unk3AC > 0x4FFF) {
        if ((scene->unk498 == 3 || scene->unk498 == 0)) {
            scene->unk3B0 = -scene->unk3B0;

            if (scene->unk498 == 3) {
                scene->unk498 = 0;
            }
        }
        scene->unk3AC += scene->unk3B0 * 0x80;
        scene->unk498++;
    }

end:
    scene->unk3B8 = scene->unk3AC;
}

extern const s16 gUnknown_080E1782[13][2];

void sub_80921E8(struct FinalEndingFallCutScene *scene)
{
    u8 i;

    for (i = 0; i < 6; i++) {
        if (((scene->unk3C4 >> 8) + gBgScrollRegs[1][1]) < 0xE4) {
            if (scene->unk35D[i] != 0) {
                scene->unk378[i][1] -= scene->unk47C[i];
                scene->unk47C[i] += 4;
                if (scene->unk35D[i] == 1) {
                    scene->unk47C[i] = 0;
                }

                scene->unk35D[i]--;

                if ((u8)(scene->unk35D[i] - 1) < 0xF) {
                    scene->unk365[i] = 1;
                } else {
                    scene->unk365[i] = 0;
                }
            } else {
                scene->unk35D[i] = (Random() & 0x3F) + 0x3C;
                scene->unk378[i][0] = scene->unk3C0 - 0xA + (Random() >> 0xC);

                if (scene->unk378[i][0] < (scene->unk3C0 - 0xF)) {
                    scene->unk378[i][0] = scene->unk3C0 - 0xF;
                }

                if (scene->unk378[i][0] < (scene->unk3C0 - 5)) {
                    scene->unk378[i][0] = (scene->unk3C0 - 5);
                }

                if (gBgScrollRegs[1][1] < 0x60) {
                    scene->unk378[i][1] = scene->unk3C4 + (Random() >> 4);
                } else {
                    scene->unk378[i][1] = scene->unk3C4 + (Random() >> 4);
                }
            }
        } else {
            if (scene->unk365[i] == 0) {
                scene->unk35D[i] = 0xF;
                scene->unk365[i] = 1;
            }

            if (scene->unk35D[i] != 0) {
                scene->unk35D[i]--;
            } else {
                scene->unk378[i][0] = scene->unk3C0;
                scene->unk378[i][1] = scene->unk3C4;
            }
        }
        sub_808E8F8((s16 *)&scene->unk378[i][0], gUnknown_080E1782[i][0], 2);
    }
}

void sub_80923AC(struct FinalEndingFallCutScene *scene)
{
    u8 i;
    struct UNK_0808B3FC_UNK240 *element;
    u32 variant = 0;

    element = &scene->unk80;
    for (i = 0; i < 10; i++) {
        element->anim = gUnknown_080E1650[0].anim;
        element->variant = gUnknown_080E1650[0].variant;

        element->x = scene->unk3F8[i][0];
        element->y = scene->unk3F8[i][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (scene->unk35C > 8) {
        variant = 1;
    }

    element = &scene->unk1A0;
    element->anim = gUnknown_080E1650[variant + 1].anim;
    element->variant = gUnknown_080E1650[variant + 1].variant;
    element->x = scene->unk3C0;
    element->y = scene->unk3C4 >> 8;

    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk35C < 10) {
        for (i = 0; i < 6; i++) {
            if (((scene->unk3C4 >> 8) + gBgScrollRegs[1][1]) < 0xE4) {
                element = &scene->unk1D0[i & 1];
                element->anim = gUnknown_080E1650[(i & 1) + 3].anim;
                element->variant = gUnknown_080E1650[(i & 1) + 3].variant;
                element->x = scene->unk378[i][0];
                element->y = scene->unk378[i][1] >> 8;
                sub_8004558(element);
                sub_80051E8(element);
            }

            if (scene->unk365[i] != 0) {
                element = &scene->unk230[i];
                element->anim = gUnknown_080E1650[2].anim;
                element->variant = gUnknown_080E1650[2].variant;
                element->x = scene->unk3C8[i][0];
                element->y = scene->unk3C8[i][1] >> 8;

                if (sub_8004558(element) != 1) {
                    element->unk14 = 0;
                    element->unk1C = 0;
                    element->unk10 &= ~0x4000;
                }
                sub_80051E8(element);
            }
        }
    }

    if (scene->unk35C > 0xB) {
        variant = 1;
    }
    element = &scene->unk110;
    element->anim = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].anim;
    element->variant = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].variant;
    element->x = scene->unk3A8;
    element->y = scene->unk3AC >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk35C > 10) {
        variant = 1;
    }

    element = &scene->unk140;
    element->anim = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].anim;
    element->variant
        = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].variant;
    element->x = scene->unk3B4;
    element->y = scene->unk3B8 >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (gSelectedCharacter == CHARACTER_CREAM) {
        element = &scene->unk170;
        element->anim = gUnknown_080E1650[variant + 0x1B].anim;
        element->variant = gUnknown_080E1650[variant + 0x1B].variant;
        element->x = scene->unk3B4;
        element->y = scene->unk3B8 >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (scene->unk35C > 10) {
        for (i = 0; i < 2; i++) {
            sub_8004558(&scene->unkB0[i]);
        }
        scene->unk370++;
    }
}

void sub_8092780(void);

void sub_8092690(void)
{
    struct FinalEndingFallCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk350;
    transitionConfig->unk2 = 2;

    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        if (scene->unk35C == 0) {
            gCurTask->main = sub_8092780;
        } else {
            gCurTask->main = sub_8091CB0;
        }
    }
}

void sub_8092714(void)
{
    struct FinalEndingFallCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk350;
    transitionConfig->unk2 = 1;

    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_8091CB0;
    }
}

void sub_8092780(void)
{
    struct FinalEndingFallCutScene *scene = TaskGetStructPtr(gCurTask);
    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (((scene->unk3C4 >> 8) + gBgScrollRegs[1][1]) > 0xDB) {
        gCurTask->main = sub_8091CB0;
    }
}

// Non matching onwards

void CreateFinalEndingLandingCutScene(void);

void sub_80927E8(void)
{
    struct Task *t = gCurTask;
    CreateFinalEndingLandingCutScene();
    TaskDestroy(gCurTask);
}

void sub_8092800(struct Task *t)
{
    // unused logic
}

void sub_8092804(struct FinalEndingFallCutScene *scene)
{
    if (scene->unk35C < 10) {
        scene->unk3C0 = 0xD2;
        if ((scene->unk3C4 >> 8) + gBgScrollRegs[1][1] < 0xE7) {
            scene->unk3C4 += 0x20;
        }
        sub_808E8F8((s16 *)&scene->unk3C0, 0xD2, 1);
    }
}

void sub_8092850(struct FinalEndingFallCutScene *scene)
{
    u8 i;

    for (i = 0; i < 6; i++) {
        if (scene->unk365[i] != 0) {
            scene->unk3C8[i][0] = scene->unk378[i][0];
            scene->unk3C8[i][1] = scene->unk378[i][1];
        }
    }
}

void sub_809289C(UNUSED struct FinalEndingFallCutScene *scene)
{
    CpuFastSet((void *)OBJ_PLTT + 0x100, (void *)PLTT + 0x100, 1);
    CpuFastSet((void *)OBJ_PLTT + 0x120, (void *)PLTT + 0x120, 1);
}

u32 sub_80928C8(struct FinalEndingFallCutScene *scene)
{
    struct Unk_03002400 *background;

    background = &scene->unk0;
    background->unk1C = gUnknown_080E1648[3];
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &scene->unk40;
    background->unk1C = gUnknown_080E1648[2];
    background->unk2E = 1;
    sub_8002A3C(background);
    return 0;
}
