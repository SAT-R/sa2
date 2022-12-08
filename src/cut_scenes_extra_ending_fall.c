#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes.h"
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

extern void sub_808E8F8(s16 *ptr, s16 a, u8 b);
extern void sub_808E95C(s32 *ptr, s32 a, u8 b);

struct ExtraEndingCutScene {
    struct Unk_03002400 unk0;
    struct UNK_0808B3FC_UNK240 unk40;
    struct UNK_0808B3FC_UNK240 unk70;
    struct UNK_0808B3FC_UNK240 unkA0;
    struct UNK_0808B3FC_UNK240 unkD0[6];

    struct UNK_0808B3FC_UNK240 unk1F0;
    struct UNK_0808B3FC_UNK240 unk220;
    struct UNK_0808B3FC_UNK240 unk250;
    struct UNK_0808B3FC_UNK240 unk280[4];
    struct UNK_0808B3FC_UNK240 unk340;

    struct UNK_802D4CC_UNK270 unk370;

    u8 unk37C;
    u8 unk37D;
    u8 unk37E;
    u8 unk37F;
    u8 unk380;

    u8 unk381[6];
    u8 unk387[6];

    u8 filler1;

    u16 unk38E;
    u16 unk390;
    u16 unk392;
    u16 unk394;
    u16 unk396;

    // vramPtr
    vu32 unk398;

    s32 unk39C;

    s32 unk3A0[8][2];
    s32 unk3E0[2];

    s32 unk3E8[10][3];
    s32 unk460;
    s32 unk464;
    u8 filler468[8];
    s32 unk470[2];
    u32 unk478;
    s32 unk47C[6][5];
    s32 unk4F4[12][3];
    s32 unk584[6][3];
}; /* size 0x5CC */

void sub_8090480(void);
void sub_8091480(struct Task *);

extern const u32 gUnknown_080E1484[12][3];
extern const u32 gUnknown_080E13AC[12][3];
extern const u32 gUnknown_080E143C[6][3];

extern const u16 gUnknown_080E1514[14];

// TODO: these are the wrong length
extern const u16 gUnknown_080E1530[10];
extern const u8 gUnknown_080E154A[10];
extern const struct UNK_080E0D64 gUnknown_080E12FC[9];

void CreateExtraEndingFallCutScene(void)
{
    u8 j, i;
    struct Task *t;
    struct ExtraEndingCutScene *scene = NULL;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;

    SeedRng(0, 0xFFFF);
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x9C03;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 64;

    m4aMPlayAllStop();
    m4aSongNumStart(MUS_EXTRA_ENDING);

    t = TaskCreate(sub_8090480, 0x5CC, 0x3100, 0, sub_8091480);
    scene = TaskGetStructPtr(t);
    scene->unk37C = 0;
    scene->unk390 = gUnknown_080E1514[0];
    scene->unk398 = 0;
    scene->unk39C = 0;
    scene->unk37D = gUnknown_080E1530[0];
    scene->unk37F = gUnknown_080E154A[0];
    scene->unk37E = 0;
    scene->unk380 = 5;
    scene->unk38E = 3;
    scene->unk392 = 0xA0;
    scene->unk394 = 0;
    scene->unk396 = 0;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 8; j++) {
            scene->unk3A0[j][i] = 0;
        }
        scene->unk3E0[i] = 0;
        scene->unk470[i] = 0;
    }

    for (i = 0; i < 5; i++) {
        for (j = 0; j < 6; j++) {
            if (i < 2) {
                scene->unk47C[j][i] = gUnknown_080E1484[j][i] << 8;
            } else if (i == 2) {
                scene->unk47C[j][i] = gUnknown_080E1484[j][i];
            } else {
                scene->unk47C[j][i] = 0;
            }
        }
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 12; j++) {
            scene->unk4F4[j][i] = gUnknown_080E13AC[j][i] << 8;
        }

        for (j = 0; j < 6; j++) {
            scene->unk584[j][i] = gUnknown_080E143C[j][i] << 8;
        }
    }

    for (j = 0; j < 12; j++) {
        scene->unk4F4[j][i] = gUnknown_080E13AC[j][i];
    }

    for (j = 0; j < 6; j++) {
        scene->unk584[j][i] = gUnknown_080E143C[j][i];
    }

    for (j = 0; j < 6; j++) {
        scene->unk381[j] = 0;
        scene->unk387[j] = 0;
    }

    for (j = 0; j < 10; j++) {
        scene->unk3E8[j][0] = Random() & 0xFF;
        scene->unk3E8[j][1] = 0;
        scene->unk3E8[j][2] = (1 << ((Random() & 3) + 0xB));
    }

    scene->unk478 = -1;

    transitionConfig = &scene->unk370;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x80;
    transitionConfig->unk8 = 0x3FBF;
    transitionConfig->unkA = 0;

    scene->unk398 = OBJ_VRAM0;

    for (i = 0; i < 4; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk280[i];
        element->vram = (void *)scene->unk398;
        scene->unk398 += 0xA00;
        element->anim = gUnknown_080E12FC[i + 3].anim;
        element->variant = gUnknown_080E12FC[i + 3].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;

        if (i < 2) {
            element->unk1A = (i + 1) << 6;
        } else {
            element->unk1A = (i + 10) << 6;
        }

        element->unk10 = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk40;
        element->vram = (void *)scene->unk398;
        scene->unk398 += 0x540;
        element->anim = gUnknown_080E12FC[0].anim;
        element->variant = gUnknown_080E12FC[0].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x100;
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
        element = &scene->unk70;
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[7].numTiles << 5;
        element->anim = gUnknown_080E12FC[7].anim;
        element->variant = gUnknown_080E12FC[7].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x1C0;
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

        element = &scene->unkA0;
        element->vram = (void *)scene->unk398;
        scene->unk398 += 0x800;
        element->anim = gUnknown_080E12FC[10].anim;
        element->variant = gUnknown_080E12FC[10].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x240;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 6; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unkD0[i];
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[i + 0xD].numTiles * 0x20;
        element->anim = gUnknown_080E12FC[i + 0xD].anim;
        element->variant = gUnknown_080E12FC[i + 0xD].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x180;
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
        element = &scene->unk1F0;
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[19].numTiles << 5;
        element->anim = gUnknown_080E12FC[19].anim;
        element->variant = gUnknown_080E12FC[19].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x140;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 1;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk220;
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[20].numTiles << 5;
        element->anim = gUnknown_080E12FC[20].anim;
        element->variant = gUnknown_080E12FC[20].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0xC0;
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
        element = &scene->unk340;
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[9].numTiles << 6;
        element->anim = gUnknown_080E12FC[9].anim;
        element->variant = gUnknown_080E12FC[9].variant;
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
        element = &scene->unk250;
        element->vram = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[8].numTiles << 5;
        element->anim = gUnknown_080E12FC[8].anim;
        element->variant = gUnknown_080E12FC[8].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x200;
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
        struct Unk_03002400 *background;
        background = &scene->unk0;
        background->unk4 = BG_SCREEN_ADDR(0);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = 0xAA;
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x20;
        background->unk28 = 0x40;
        background->unk2A = 0;
        background->unk2E = 0;
        sub_8002A3C(background);
    }
}

void sub_8090E18(struct ExtraEndingCutScene *scene);
void sub_8091484(struct ExtraEndingCutScene *scene);
void sub_8090EB4(struct ExtraEndingCutScene *scene);
void sub_809066C(struct ExtraEndingCutScene *scene);
void sub_8090904(struct ExtraEndingCutScene *scene);
void sub_8090800(struct ExtraEndingCutScene *scene);
void sub_8090C24(struct ExtraEndingCutScene *scene);
void sub_8090CA0(struct ExtraEndingCutScene *scene);
void sub_8090D60(struct ExtraEndingCutScene *scene);
void sub_8091044(struct ExtraEndingCutScene *scene);
void sub_8090F6C(struct ExtraEndingCutScene *scene);
void sub_80913DC(void);

void sub_8090480(void)
{
    struct ExtraEndingCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk370;
    transitionConfig->unk2 = 2;

    sub_8090E18(scene);
    sub_8091484(scene);

    if (gBgScrollRegs[0][1] > 0x6D) {
        sub_8090EB4(scene);
    }

    sub_809066C(scene);
    sub_8090904(scene);
    sub_8090800(scene);

    if (scene->unk37C < 0xF) {
        sub_8090C24(scene);
        sub_8090CA0(scene);
        sub_8090D60(scene);
    }

    sub_8091044(scene);
    sub_8090F6C(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_80913DC;
    }
}

void sub_8091468(void);

void sub_8090520(void)
{
    struct ExtraEndingCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk370;

    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unk2 = 1;

    sub_8090E18(scene);
    sub_8091484(scene);

    if (gBgScrollRegs[0][1] > 0x6D) {
        sub_8090EB4(scene);
    }

    sub_809066C(scene);
    sub_8090904(scene);
    sub_8090800(scene);

    if (scene->unk37C < 0xF) {
        sub_8090C24(scene);
        sub_8090CA0(scene);
        sub_8090D60(scene);
    }

    sub_8091044(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_8091468;
    }
}

void sub_80905C0(void)
{
    struct ExtraEndingCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk370;
    sub_8090E18(scene);
    sub_8091484(scene);

    if (gBgScrollRegs[0][1] > 0x6D) {
        sub_8090EB4(scene);
    }

    sub_809066C(scene);
    sub_8090904(scene);
    sub_8090800(scene);

    if (scene->unk37C < 0xF) {
        sub_8090C24(scene);
        sub_8090CA0(scene);
        sub_8090D60(scene);
    }

    sub_8091044(scene);
    sub_8090F6C(scene);

    if (scene->unk390 != 0) {
        scene->unk390--;
        return;
    }

    scene->unk37C++;
    scene->unk390 = gUnknown_080E1514[scene->unk37C];
    gCurTask->main = sub_80913DC;
}

void sub_809066C(struct ExtraEndingCutScene *scene)
{
    if (scene->unk37C < 0xD) {
        scene->unk3E0[0] = scene->unk460 << 8;
        scene->unk3E0[1] = 0x5000;
    } else if (scene->unk37C == 0xD) {
        if (scene->unk3E0[1] > -0x3200) {
            scene->unk3E0[1] -= 0x100;

            if (scene->unk3E0[0] < 0xAA00) {
                if (scene->unk38E < 0x400) {
                    scene->unk38E++;
                }
                scene->unk3E0[0] += SIN(scene->unk38E);
            }
        } else {
            scene->unk3E0[0] = 0x7800;
            scene->unk37C++;
        }
    } else if (scene->unk37C == 0xF) {
        if (scene->unk3E0[1] <= 0x54FF) {
            scene->unk3E0[1] += 0x50;
        } else {
            scene->unk37C++;
            scene->unk394 = 0x3C;
        }
    } else if (scene->unk37C < 0x11) {
        u32 val = 1;

        if (scene->unk394 > 0xDB) {
            val = 0;
        }

        scene->unk3E0[1] += (SIN(((scene->unk394 << 1) & 0xFF) * 4) >> 6) >> val;

        if (scene->unk394 < 300) {
            scene->unk394++;
        } else {
            scene->unk37C++;
        }
    } else {
        if ((scene->unk3E0[1] > (scene->unk470[1] - 0x3C00))
            && (scene->unk37C == 0x11)) {
            scene->unk37C++;
        }
        if (scene->unk3E0[1] < (scene->unk470[1] - 0x2800)) {
            scene->unk3E0[1] += 0x100;
        }
    }

    if (scene->unk37C > 0xD) {
        sub_808E95C(scene->unk3E0, 0x7800, 2);
    }
}

void sub_8090800(struct ExtraEndingCutScene *scene)
{
    if (scene->unk37C < 0xD) {
        scene->unk470[0] = 0x7800;
        scene->unk470[1] = 0x4600;
    } else if (scene->unk37C == 0xD && scene->unk470[1] < 0x8C00) {
        scene->unk470[1] += 0x80;
    } else if (scene->unk37C == 0xE) {
        if (scene->unk470[1] >= 0x5501) {
            scene->unk470[1] -= 0x40;
        } else {
            scene->unk37C++;
        }
    } else if (scene->unk37C < 0x11) {
        if (scene->unk470[1] < 0x8700) {
            scene->unk470[1] += 0x40;
        }
    } else {
        scene->unk470[1] -= 8;
    }

    if (scene->unk37C > 0xD) {
        if (scene->unk396 < 0x400) {
            scene->unk396 += 0x20;
        } else {
            scene->unk396 = 0;
        }

        scene->unk470[1] += SIN((scene->unk396 & 0xFF) * 4) >> 6;
    }
}

void sub_8090904(struct ExtraEndingCutScene *scene)
{
    u8 i;

    if (scene->unk37C == 0xE || scene->unk37C == 0xD) {
        for (i = 0; i < 6; i++) {
            if ((scene->unk47C[i][0] > -0xA00 && scene->unk47C[i][0] < 0xFA00)
                || (scene->unk47C[i][1] > -0xA00 && scene->unk47C[i][1] < 0xAA00)) {
                if (i < 3) {
                    scene->unk47C[i][0] -= scene->unk47C[i][2] * 0x100;
                } else {
                    scene->unk47C[i][0] += scene->unk47C[i][2] * 0x100;
                }
                scene->unk47C[i][1] -= scene->unk47C[i][2] * 0x100;
            }
        }
    }

    if (scene->unk37C > 0xE) {
        for (i = 0; i < 6; i++) {
            if (scene->unk381[i] < 0x11) {
                if (i < 3) {
                    if (scene->unk47C[i][0] < (scene->unk470[0] + 0x3C00)) {
                        scene->unk47C[i][0] += scene->unk47C[i][2] * 0x80;
                    } else {
                        scene->unk381[i] |= 0x10;
                    }

                    if ((scene->unk381[i] & 1) == 0) {
                        if (scene->unk47C[i][1] < (scene->unk470[1] - 0x1E00)) {
                            scene->unk47C[i][1] += scene->unk47C[i][2] * 0x80;
                        } else {
                            scene->unk381[i] |= 1;
                        }

                        // Potential bug?
                        scene->unk387[i] = 2;
                    }
                } else {
                    if (scene->unk47C[i][0] > (scene->unk470[0] - 0x3C00)) {
                        scene->unk47C[i][0] -= scene->unk47C[i][2] * 0x80;
                    } else {
                        scene->unk381[i] |= 0x10;
                    }

                    if ((scene->unk381[i] & 1) == 0) {
                        if (scene->unk47C[i][1] < (scene->unk470[1] - 0x1E00)) {
                            scene->unk47C[i][1] += scene->unk47C[i][2] * 0x80;
                        } else {
                            scene->unk381[i] |= 1;
                        }
                    }
                    scene->unk387[i] = 1;
                }
            }

            if (scene->unk381[i] > 0xF) {
                s32 temp;
                scene->unk47C[i][3] += scene->unk47C[i][2] * 2;

                if (scene->unk47C[i][3] > 0x3FF00) {
                    scene->unk47C[i][3] = 0;
                }

                if (COS(((scene->unk47C[i][3] >> 2) & 0xFF) * 4) >> 8 < 0) {
                    scene->unk387[i] = 1;
                } else {
                    scene->unk387[i] = 2;
                }

                scene->unk47C[i][0] += COS(((scene->unk47C[i][3] >> 2) & 0xFF) * 4) >> 8;
            }

            if ((scene->unk381[i] & 1) != 0) {
                scene->unk47C[i][4] += scene->unk47C[i][2] * 2;

                if (scene->unk47C[i][4] > 0x3FF00) {
                    scene->unk47C[i][4] = 0;
                }

                scene->unk47C[i][1] = scene->unk470[1] - 0x1E00
                    + ((SIN((scene->unk47C[i][4] & 0xFF) * 4) >> 6) * 8);
            }
#ifndef NON_MATCHING
            ++i;
            --i;
#endif
        }
    }
}

void sub_8090C24(struct ExtraEndingCutScene *scene)
{
    if (scene->unk37C < 0xD) {
        scene->unk460 = 0x78;
        scene->unk464 = 0x50;
        if (scene->unk390 != 0) {
            scene->unk390--;
        } else {
            scene->unk37C++;
            scene->unk390 = gUnknown_080E1514[scene->unk37C];
        }
    } else {
        if (scene->unk464 > -0x32) {
            scene->unk464--;
        }
    }
    sub_808E8F8((s16 *)&scene->unk460, 0x78, 2);
}

extern const u32 gUnknown_080E1444[18];

void sub_8090CA0(struct ExtraEndingCutScene *scene)
{
    u8 i;
    if (scene->unk37C > 0xC) {
        for (i = 0; i < 6; i++) {
            if ((scene->unk584[i][0] > -0xA00 && scene->unk584[i][0] < 0xFA00)
                || (scene->unk584[i][1] > -0xA00 && scene->unk584[i][1] < 0xAA00)) {

                if (i < 3) {
                    scene->unk584[i][0] -= scene->unk584[i][2] >> 6;
                } else {
                    scene->unk584[i][0] += scene->unk584[i][2] >> 6;
                }

                scene->unk584[i][1] -= scene->unk584[i][2] >> 7;
#ifndef NON_MATCHING
                if (gUnknown_080E1444 != gUnknown_080E1444)
                    break;
#endif
                scene->unk584[i][2] += gUnknown_080E1444[i * 3];
            }
        }
    }
}

void sub_8090D60(struct ExtraEndingCutScene *scene)
{
    u8 i;

    if (scene->unk37C < 0xD) {
        for (i = 0; i < scene->unk37C; i++) {
            if (scene->unk4F4[i][1] > -0xA00 && scene->unk4F4[i][1] < 0xAA00) {
                scene->unk4F4[i][0] = gUnknown_080E13AC[i][0] << 8;
                scene->unk4F4[i][1] -= scene->unk4F4[i][2] >> 3;
                scene->unk4F4[i][2] += gUnknown_080E13AC[i][2];
            } else {
                scene->unk4F4[i][2] = 0;
                scene->unk4F4[i][1] = gUnknown_080E13AC[i][1] << 8;
            }
        }
    }
}

void sub_8090E18(struct ExtraEndingCutScene *scene)
{
    u8 i;
    u32 max;
    if (scene->unk37C == 13) {
        max = 4;
    } else {
        max = 10;
    }

    for (i = 0; i < max; i++) {
        if (scene->unk3E8[i][1] < -0x5A00) {
            scene->unk3E8[i][1] = 0xE600;
            scene->unk3E8[i][2] = (1 << ((Random() & 3) + 0xB)) + 0x100;
            scene->unk3E8[i][0] = Random() & 0xFF;
        }

        scene->unk3E8[i][1] -= scene->unk3E8[i][2];
    }
}

extern const u32 gUnknown_080E15A8[8];

void sub_8090EB4(struct ExtraEndingCutScene *scene)
{
    u8 i;
    for (i = 0; i < 8; i++) {
        if (scene->unk3A0[i][1] < -0x14) {
            scene->unk3A0[i][1] = 0xE600;
            scene->unk3A0[i][0] -= 0x5000;

            if (scene->unk3A0[i][0] < 0) {
                scene->unk3A0[i][0] = 0xF000;
            }
        }

        scene->unk3A0[i][1] -= gUnknown_080E15A8[i] * 2;

        if (scene->unk37C == 0xE && scene->unk470[1] > 0x5000) {
            scene->unk3A0[i][1] -= 0x40;
        }
        if (scene->unk37C == 0xF && scene->unk470[1] < 0x8C00) {
            scene->unk3A0[i][1] += 0x20;
        }
    }
}

extern const u8 gUnknown_080E15C8[4][0x20];

void sub_8090F6C(struct ExtraEndingCutScene *scene)
{
    if (scene->unk37C < 0xD) {
        if (scene->unk37D != 0 && scene->unk37E == 0) {
            scene->unk37D--;
            return;
        }

        if (scene->unk37F != 0) {
            scene->unk37F--;
            if (scene->unk37E <= 3) {
                DmaCopy32(3, gUnknown_080E15C8[scene->unk37E], &gObjPalette[0x30], 0x20);
            } else {
                DmaCopy32(3, gUnknown_080E15C8[6 - scene->unk37E], &gObjPalette[0x30],
                          0x20);
            }
        } else {
            scene->unk37E++;
            scene->unk37F = gUnknown_080E154A[scene->unk37C];
        }

        if (scene->unk37E == 7) {
            scene->unk37E = 0;
            scene->unk37D = gUnknown_080E1530[scene->unk37C];
        }
    }
}

struct UNK_80E1348 {
    AnimId anim;
    u8 variant;
};
extern const struct UNK_80E1348 gUnknown_080E1348[2];

void sub_8091044(struct ExtraEndingCutScene *scene)
{
    u8 i;
    u32 max;
    struct UNK_0808B3FC_UNK240 *element;
    if (scene->unk37C == 13) {
        max = 4;
    } else {
        max = 10;
    }
    element = &scene->unk340;
    for (i = 0; i < max; i++) {
        element->anim = gUnknown_080E1348[0].anim;
#ifndef NON_MATCHING
        while (0)
            ;
#endif
        element->variant = gUnknown_080E1348[0].variant;
        element->x = scene->unk3E8[i][0];
        element->y = scene->unk3E8[i][1] >> 8;
        sub_80051E8(element);
    }

    if (gBgScrollRegs[0][1] > 0x6D) {
        max = 0;
        for (i = 0; i < 8; i++) {
            element = &scene->unk280[i & 3];
            element->anim = gUnknown_080E12FC[(i & 3) + 3].anim;
            element->variant = gUnknown_080E12FC[(i & 3) + 3].variant;

            if (i > 4) {
                max = 1;
            }

            // TODO: Might be able to use Q_24_8_TO_INT() here
            element->x = (scene->unk3A0[i][0] >> 8) - (max * 100);
            element->y = scene->unk3A0[i][1] >> 8;

            sub_80051E8(element);
        }
    }

    element = &scene->unk40;
    if (scene->unk37C == 0xD) {
        element->anim = gUnknown_080E12FC[1].anim;
        element->variant = gUnknown_080E12FC[1].variant;
    } else if (scene->unk37C == 0xE || scene->unk37C == 0xF || scene->unk37C == 0x10) {
        element->anim = gUnknown_080E12FC[2].anim;
        element->variant = gUnknown_080E12FC[2].variant;
    } else if (scene->unk37C >= 0x11) {
        element->anim = gUnknown_080E12FC[21].anim;
        element->variant = gUnknown_080E12FC[21].variant;
    }
    element->x = scene->unk3E0[0] >> 8;
    element->y = scene->unk3E0[1] >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk37C < 0xE) {
        element = &scene->unkA0;
        element->x = scene->unk460;
        element->y = scene->unk464;

        if (scene->unk37C == 10) {
            element->anim = gUnknown_080E12FC[11].anim;
            element->variant = gUnknown_080E12FC[11].variant;
            sub_8004558(element);
        } else if (scene->unk37C == 0xD) {
            element->anim = gUnknown_080E12FC[12].anim;
            element->variant = gUnknown_080E12FC[12].variant;
            sub_8004558(element);
        }
        sub_80051E8(element);
    }

    if (scene->unk37C < 0xD) {
        element = &scene->unk1F0;
        for (i = 0; i < scene->unk37C; i++) {
            element->x = scene->unk4F4[i][0] >> 8;
            element->y = scene->unk4F4[i][1] >> 8;
            sub_8004558(element);
            sub_80051E8(element);
        }
    } else {
        for (i = 0; i < 6; i++) {
            element = &scene->unkD0[i];
            element->anim = gUnknown_080E12FC[i + 0xD].anim;
            element->variant = gUnknown_080E12FC[i + 0xD].variant;
            element->x = scene->unk584[i][0] >> 8;
            element->y = scene->unk584[i][1] >> 8;
            sub_80051E8(element);
        }
    }

    if (gBgScrollRegs[0][1] < 0x6E) {
        element = &scene->unk220;
        element->x = scene->unk460;
        element->y = scene->unk464 + 0x1E;
        sub_8004558(element);

        if (scene->unk380 != 0) {
            scene->unk380--;
            sub_80051E8(element);
        } else {
            scene->unk380 = 2;
        }
    }
    if (scene->unk37C > 0xC) {
        for (i = 0; i < 6; i++) {
            element = &scene->unk70;
            element->x = scene->unk47C[i][0] >> 8;
            element->y = scene->unk47C[i][1] >> 8;

            if (scene->unk37C >= 0xF) {
                if (scene->unk387[i] == 1) {
                    element->unk10 &= ~0x400;
                } else if (scene->unk387[i] == 2) {
                    element->unk10 |= 0x400;
                }
            } else {
                if (i < 3) {
                    element->unk10 &= ~0x400;

                } else {
                    element->unk10 |= 0x400;
                }
            }

            sub_8004558(element);
            sub_80051E8(element);
        }

        element = &scene->unk250;
        element->x = scene->unk470[0] >> 8;
        element->y = scene->unk470[1] >> 8;

        sub_8004558(element);
        sub_80051E8(element);
    }
}

void sub_80913DC(void)
{
    struct ExtraEndingCutScene *scene = TaskGetStructPtr(gCurTask);

    sub_8090E18(scene);
    sub_8091484(scene);

    if (gBgScrollRegs[0][1] > 0x6D) {
        sub_8090EB4(scene);
    }

    sub_809066C(scene);
    sub_8090904(scene);
    sub_8090800(scene);

    if (scene->unk37C < 0xF) {
        sub_8090C24(scene);
        sub_8090CA0(scene);
        sub_8090D60(scene);
    }

    sub_8091044(scene);
    sub_8090F6C(scene);

    if (scene->unk37C != 0xD) {
        if (scene->unk37C == 0x12) {
            gCurTask->main = sub_8090520;
        }
    }
}

void CreateExtraEndingSlidesCutScene(void);

void sub_8091468(void)
{
    CreateExtraEndingSlidesCutScene();
    TaskDestroy(gCurTask);
}

void sub_8091480(struct Task *t)
{
    // unused logic
}

void sub_8091484(struct ExtraEndingCutScene *scene)
{
    if (gBgScrollRegs[0][1] < 0x160) {
        scene->unk39C += 0x20;
    }
    gBgScrollRegs[0][1] = scene->unk39C >> 8;
}
