#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "trig.h"
#include "course_select.h"
#include "save.h"
#include "title_screen.h"
#include "random.h"

/** cut_scenes_courses */

struct ResultsCutScene {
    struct SomeStruct_59E0 *unk0;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_802D4CC_UNK270 unk64;
    u16 unk70;
    u16 unk72;
    u16 unk74;
    u16 unk76;
    u16 unk78;
    u8 unk7A;
    u8 unk7B;
    s8 unk7C;
} /* 0x80 */;

extern const TaskMain gUnknown_080E1208[3];
extern const u16 gUnknown_080E1214[6];
extern const u16 gUnknown_080E1220[6];
extern const u16 gUnknown_080E122C[3];
extern const u32 gUnknown_080E11E4[9];

void sub_808E890(struct Task *);

void CreateCourseResultsCutScene(u8 mode)
{
    TaskMain mains[3];
    u16 unk1214[6];

    u16 unk1220[6];
    u16 unk122C[3];

    struct Task *t;
    struct ResultsCutScene *scene;
    struct UNK_0808B3FC_UNK240 *element;
    struct UNK_802D4CC_UNK270 *transitionConfig;
    memcpy(mains, gUnknown_080E1208, 0xC);
    memcpy(unk1214, gUnknown_080E1214, 0xC);
    memcpy(unk1220, gUnknown_080E1220, 0xC);
    memcpy(unk122C, gUnknown_080E122C, 6);

    t = TaskCreate(mains[mode], 0x80, 0x5000, 0, sub_808E890);
    scene = TaskGetStructPtr(t);

    scene->unk78 = 0;
    scene->unk7A = 0;
    scene->unk7B = 0;
    scene->unk7C = 0;

    scene->unk70 = unk1214[mode * 2];
    scene->unk72 = unk1214[(mode * 2) + 1];

    scene->unk74 = unk1220[mode * 2];
    scene->unk76 = unk1220[(mode * 2) + 1];

    scene->unk0 = &gPlayer;

    element = &scene->unk4;

    element->unk4 = VramMalloc(gUnknown_080E11E4[mode * 3]);
    element->unkA = gUnknown_080E11E4[(mode * 3) + 1];
    element->unk20 = gUnknown_080E11E4[(mode * 3) + 2];
    element->unk21 = 0xFF;

    element->unk16 = 0;
    element->unk18 = 0;
    element->unk8 = 0;
    element->unk1A = 0x280;
    element->unk1C = 0;

    element->unk22 = 0x10;
    element->unk25 = unk122C[mode];

    if (mode != 2) {
        element->unk10 = 0x400;
    } else {
        element->unk10 = 0;
    }

    sub_8004558(element);

    scene->unk34.unk4 = NULL;

    if (mode == 0) {
        element = &scene->unk34;
        element->unk4 = VramMalloc(6);
        element->unkA = 0x1D4;
        element->unk20 = 0;
        element->unk21 = 0xFF;

        element->unk16 = 0;
        element->unk18 = 0;
        element->unk8 = 0;
        element->unk1A = 0x240;
        element->unk1C = 0;

        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0x400;
        sub_8004558(element);
        m4aSongNumStart(SE_236);
    }

    transitionConfig = &scene->unk64;
    transitionConfig->unk0 = 0;
    transitionConfig->unk2 = 0xFF00;
    transitionConfig->unk4 = 0x100;
    transitionConfig->unk6 = 0;
    transitionConfig->unk8 = 0;
}

extern void sub_80304DC(u32, u16, u8);

void sub_808DD9C(void)
{
    struct ResultsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element = &scene->unk4;
    struct SomeStruct_59E0 *player = scene->unk0;
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk64;

    scene->unk70 -= scene->unk74;
    scene->unk72 += scene->unk76;

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0xFF) >> 8;
    }

    if (scene->unk76 < 0x800) {
        scene->unk76 = (scene->unk76 * 0x43) >> 6;
    }

    if (scene->unk70 < (player->unk8 - (gCamera.unk0 * 0x100) - 0x1400)) {
        scene->unk70 = (player->unk8 - (gCamera.unk0 * 0x100) - 0x1400);
    }

    if (scene->unk72 > (player->unkC - (gCamera.unk4 * 0x100) - 0xA00)) {
        // Required for match
        scene->unk72 = scene->unk72 = player->unkC - (gCamera.unk4 * 0x100) - 0xA00;
        scene->unk70 = player->unk8 - (gCamera.unk0 * 0x100) - 0x1400;

        if (scene->unk7A == 0) {
            player->unk64 = 0x52;

            VramFree(scene->unk4.unk4);

            element->unk4 = VramMalloc(0x19);
            element->unkA = 0x82;
            scene->unk4.unk20 = 0;
            scene->unk4.unk21 = 0xFF;

            scene->unk7A = 1;

            scene->unk34.unkA = 0x1D3;
            scene->unk34.unk20 = 0;
            scene->unk34.unk21 = 0xFF;
        }
    }

    if (scene->unk7A == 1) {
        transitionConfig->unk0 = scene->unk0->unk24 << 2;
    }

    element->unk16 = scene->unk70 >> 8;
    element->unk18 = scene->unk72 >> 8;

    transitionConfig->unk6 = scene->unk70 >> 8;
    transitionConfig->unk8 = scene->unk72 >> 8;

    sub_8004558(element);
    sub_80051E8(element);

    scene->unk34.unk16 = element->unk16;
    scene->unk34.unk18 = element->unk18;
    sub_8004558(&scene->unk34);
    sub_80051E8(&scene->unk34);

    scene->unk78++;

    if (scene->unk78 == 200) {
        sub_80304DC(gUnknown_03005490, gCourseTime, gUnknown_030054F4);
    }
}

void sub_808DF88(void)
{
    struct ResultsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element = &scene->unk4;
    struct SomeStruct_59E0 *player = scene->unk0;

    scene->unk70 -= scene->unk74;
    scene->unk72 += scene->unk76;

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0x7F) >> 7;
    }

    if (scene->unk76 > 0x60) {
        scene->unk76 = (scene->unk76 * 0x7F) >> 7;
    }

    if (scene->unk70 < (player->unk8 - (gCamera.unk0 * 0x100) - 0x1C00)) {
        scene->unk70 = player->unk8 - (gCamera.unk0 * 0x100) - 0x1C00;
    }

    if (scene->unk72 > (player->unkC - (gCamera.unk4 * 0x100) - 0x1400)) {
        scene->unk72 = player->unkC - (gCamera.unk4 * 0x100) - 0x1400;
        scene->unk70 = player->unk8 - (gCamera.unk0 * 0x100) - 0x1C00;

        if (scene->unk7A == 0) {
            VramFree(scene->unk4.unk4);

            element->unk4 = VramMalloc(0x24);
            element->unkA = 0xDF;
            scene->unk4.unk20 = 1;
            scene->unk7A = 1;
            scene->unk7A = 1;
        }
    }

    element->unk16 = scene->unk70 >> 8;

    if (scene->unk7A != 0) {
        s16 sin;
        scene->unk7B += 4;
        sin = SIN(scene->unk7B * 4) >> 12;
        element->unk18 = (scene->unk72 >> 8) + sin;
    } else {
        element->unk18 = scene->unk72 >> 8;
    }

    sub_8004558(element);
    sub_80051E8(element);

    scene->unk78++;

    if (scene->unk78 == 200) {
        sub_80304DC(gUnknown_03005490, gCourseTime, gUnknown_030054F4);
    }
}

extern s32 sub_801F100(u32, u32, u8, u8, TaskMain);
void sub_801EC3C(void);

void sub_808E114(void)
{
    s32 result;
    struct ResultsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element = &scene->unk4;
    struct SomeStruct_59E0 *player = scene->unk0;

    if (scene->unk78 < 0x2E) {
        scene->unk70 += scene->unk74;
    } else {
        s16 sin = SIN(((scene->unk78 - 0x2D) * 2 & 0xFF) * 4) >> 6;
        scene->unk7C = (sin * 5) >> 7;
    }

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0x7F) >> 7;
    }

    if (scene->unk70 > (player->unk8 - (gCamera.unk0 * 256) - 0x4000)) {
        scene->unk70 = player->unk8 - (gCamera.unk0 * 256) - 0x4000;
    }

    result = sub_801F100((scene->unk72 >> 8) + gCamera.unk4,
                         (scene->unk70 >> 8) + gCamera.unk0 + scene->unk7C, 1, 8,
                         sub_801EC3C);

    if (result < 0) {
        scene->unk72 += result * 0x100;
    }

    if (result > 0) {
        scene->unk72 += 0x100;
    }

    element->unk16 = (scene->unk70 >> 8) + scene->unk7C;
    element->unk18 = (scene->unk72 >> 8) - 0xE;

    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk78 == 0x28) {
        player->unk64 = 0x52;
    }

    if (scene->unk78 == 200) {
        sub_80304DC(gUnknown_03005490, gCourseTime, gUnknown_030054F4);
    }

    scene->unk78++;
}

struct CutScene {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;
    struct Unk_03002400 unkC0;
    struct UNK_802D4CC_UNK270 unk100;

    // slide
    u16 unk10C;

    // caption
    u16 unk10E;

    u16 unk110;
    u8 unk112;
} /** size 0x114*/;

void sub_808E35C(struct CutScene *scene);

void sub_808E274(struct CutScene *scene)
{
    struct UNK_802D4CC_UNK270 *transitionConfig;
    gDispCnt = 0x1600;
    gDispCnt |= 0x40;

    gBgCntRegs[0] = 0x1c00;
    gBgCntRegs[1] = 0x1d05;
    gBgCntRegs[2] = 0x5e0a;
    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0xff;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xff;
    gUnknown_03002280[11] = 0x20;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0xff88;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, &gBgAffineRegs);
    sub_808E35C(scene);

    transitionConfig = &scene->unk100;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unk6 = 0x200;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    sub_802D4CC(transitionConfig);
}

extern const u16 gUnknown_080E1130[90];
extern const u16 gUnknown_080E1118[24];

void sub_808E35C(struct CutScene *scene)
{
    struct Unk_03002400 *background;
    s8 lang = gLoadedSaveGame->unk6 - 1;
    if (lang < 0) {
        lang = 0;
    }

    background = &scene->unk80;
    background->unk4 = BG_SCREEN_ADDR(8);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(29);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1130[scene->unk10E + (lang * 15)];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1e;
    background->unk28 = 5;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    background = &scene->unk0;
    background->unk4 = BG_SCREEN_ADDR(16);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1118[scene->unk10C];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1e;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 2;
    sub_8002A3C(background);
}

void sub_808E4C8(void);

void sub_808E424(void)
{
    struct CutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk110 == 0) {
        scene->unk110 = 1;
        switch (scene->unk112) {
            case 0:
            case 2:
                m4aSongNumStart(MUS_DEMO_1);
                break;
            case 1:
                m4aSongNumStart(MUS_DEMO_2);
                break;
        }
    }

    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, &gBgAffineRegs);
    if (sub_802D4CC(&scene->unk100) == 1) {
        scene->unk110 = 0;
        gCurTask->main = sub_808E4C8;
    }
}

void sub_808E63C(void);

void sub_808E4C8(void)
{
    struct CutScene *scene;
    s8 lang = gLoadedSaveGame->unk6 - 1;

    if (lang < 0) {
        lang = 0;
    }

    scene = TaskGetStructPtr(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, &gBgAffineRegs);

    if (scene->unk110++ > 0x154) {
        scene->unk110 = 0;

        if ((scene->unk10C & 3) == 3) {
            struct Unk_03002400 *background;
            gBgScrollRegs[0][1] = 0xFFDC;

            background = &scene->unk40;
            background->unk4 = BG_SCREEN_ADDR(0);
            background->unkA = 0;
            background->unkC = BG_SCREEN_ADDR(28);
            background->unk18 = 0;
            background->unk1A = 0;
            background->unk1C = gUnknown_080E1130[scene->unk10E + 1 + (lang * 15)];
            background->unk1E = 0;
            background->unk20 = 0;
            background->unk22 = 0;
            background->unk24 = 0;
            background->unk26 = 0x1e;
            background->unk28 = 5;
            background->unk2A = 0;
            background->unk2E = 0x10;
            sub_8002A3C(background);
            gDispCnt |= 0x100;
            m4aSongNumStart(MUS_GOT_ALL_CHAOS_EMERALDS);
            gCurTask->main = sub_808E63C;
        } else {
            scene->unk10C++;
            scene->unk10E++;
            sub_808E35C(scene);
            gCurTask->main = sub_808E4C8;
        }
    }

    if (gPressedKeys & START_BUTTON && scene->unk110 > 8) {
        scene->unk110 = 0x154;
    }
}

void sub_808E6B0(void);

void sub_808E63C(void)
{
    struct CutScene *scene = TaskGetStructPtr(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, &gBgAffineRegs);

    if (scene->unk110++ > 300) {
        struct UNK_802D4CC_UNK270 *transitionConfig;
        scene->unk110 = 0;
        transitionConfig = &scene->unk100;
        transitionConfig->unk0 = 1;
        transitionConfig->unk8 = 0x3FFF;
        transitionConfig->unk4 = 0;
        transitionConfig->unk2 = 1;
        transitionConfig->unkA = 0;

        gCurTask->main = sub_808E6B0;
    }
}

void sub_808E6B0(void)
{
    struct CutScene *scene = TaskGetStructPtr(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, &gBgAffineRegs);

    if (sub_802D4CC(&scene->unk100) == 1) {
        if (gCurrentLevel >= gLoadedSaveGame->unk7[gSelectedCharacter]) {
            CreateCourseSelectionScreen(gCurrentLevel,
                                        gLoadedSaveGame->unk7[gSelectedCharacter], 1);
        } else {
            CreateCourseSelectionScreen(gCurrentLevel,
                                        gLoadedSaveGame->unk7[gSelectedCharacter], 4);
        }
        TaskDestroy(gCurTask);
    }
}

// CreateCreamCutScene
void sub_808E740(u8 variant)
{
    struct Task *t = TaskCreate(sub_808E424, 0x114, 0x1000, 0, NULL);
    struct CutScene *scene = TaskGetStructPtr(t);
    scene->unk10C = variant * 4;
    scene->unk10E = variant * 5;
    scene->unk110 = 0;
    scene->unk112 = variant;
    sub_808E274(scene);
}

// CreateCreamCutScene2
void sub_808E79C(void)
{
    struct Task *t = TaskCreate(sub_808E424, 0x114, 0x1000, 0, NULL);
    struct CutScene *scene = TaskGetStructPtr(t);
    scene->unk10C = 0;
    scene->unk10E = 0;
    scene->unk110 = 0;
    sub_808E274(scene);
}

// CreateTailsCutScene
void sub_808E7E8(void)
{
    struct Task *t = TaskCreate(sub_808E424, 0x114, 0x1000, 0, NULL);
    struct CutScene *scene = TaskGetStructPtr(t);
    scene->unk10C = 8;
    scene->unk10E = 10;
    scene->unk110 = 0;
    sub_808E274(scene);
}

// CreateKnucklesCutScene
void sub_808E83C(void)
{
    struct Task *t = TaskCreate(sub_808E424, 0x114, 0x1000, 0, NULL);
    struct CutScene *scene = TaskGetStructPtr(t);
    scene->unk10C = 4;
    scene->unk10E = 5;
    scene->unk110 = 0;
    sub_808E274(scene);
}

void sub_808E890(struct Task *t)
{
    struct ResultsCutScene *scene = TaskGetStructPtr(t);
    VramFree(scene->unk4.unk4);

    if (scene->unk34.unk4 != 0) {
        VramFree(scene->unk34.unk4);
    }
}

/** cut_scenes_endings **/

struct EndingCutScene {
    u8 unk0[0x6C];
    u8 unk6C;
    u8 unk6D;
    u16 unk6E;
    u8 filler[4];
} /* 0x74 */;

void sub_808E9AC(void);
void sub_808E9F8(struct Task *);

// CreateEndingCutScene
void sub_808E8B0(void)
{
    struct Task *t = TaskCreate(sub_808E9AC, 0x74, 0x3100, 0, sub_808E9F8);
    struct EndingCutScene *scene = TaskGetStructPtr(t);

    scene->unk6C = 0;
    scene->unk6D = 0;
    scene->unk6E = 0xB4;
}

void sub_808E8F8(s16 *ptr, s16 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 temp;
        gUnknown_030053B8 = (gUnknown_030053B8 * 0x196225) + 0x3C6EF35F;

        temp = gUnknown_030053B8;
        if (temp >> 8 != 0) {
            *ptr += ((temp) >> ((0x10 - b)));
        } else {
            *ptr -= ((temp) >> ((8 - b)));
        }
    }
}

void sub_808E95C(s32 *ptr, s32 a, u8 b)
{
    if (*ptr != a) {
        *ptr = a;
    } else {
        u16 temp;
        gUnknown_030053B8 = (gUnknown_030053B8 * 0x196225) + 0x3C6EF35F;

        temp = gUnknown_030053B8;
        if (temp >> 8 != 0) {
            *ptr += ((temp) >> ((8 - b)));
        } else {
            *ptr -= (temp);
        }
    }
}

void sub_808FC78(void);
void sub_8091684(void);

void sub_808E9AC(void)
{
    struct EndingCutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk6E != 0) {
        scene->unk6E--;
    } else {
        if (gCurrentLevel == (LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) + 1)) {
            sub_808FC78();
        } else {
            sub_8091684();
        }
        TaskDestroy(gCurTask);
    }
}

void sub_808E9F8(UNUSED struct Task *t) { }

void sub_808E9FC(void)
{
    struct EndingCutScene *scene = TaskGetStructPtr(gCurTask);
    if (gLoadedSaveGame->unk7[gSelectedCharacter]
        > (LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        scene->unk6D = 2;
    } else {
        scene->unk6D = 1;
    }

    gCurTask->main = sub_808E9AC;
}

struct CreditsCutScene {
    struct Unk_03002400 unk0;
    struct UNK_802D4CC_UNK270 unk40;

    u8 unk4C;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u16 unk52;
    u32 unk54;
}; /* 0x58 */

void sub_808ED5C(struct Task *);
void sub_808EBC4(void);

extern const u16 gUnknown_080E1244[26];

// CreateCreditsCutScene
void sub_808EA50(u8 a, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsCutScene *scene = NULL;
    struct Unk_03002400 *background;
    struct UNK_802D4CC_UNK270 *transitionConfig;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5c00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 0x20;

    t = TaskCreate(sub_808EBC4, 0x58, 0x3100, 0, sub_808ED5C);

    // BUG: assigning to null pointer
    scene->unk52 = 0;

    scene = TaskGetStructPtr(t);
    scene->unk4C = a;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk54 = 0xB4;

    if (scene->unk4C == 2) {
        scene->unk50 = 5;
    } else {
        scene->unk50 = 0;
    }

    if ((scene->unk4C == 1 && gLoadedSaveGame->unk15[4] != 0)) {
        scene->unk4D = 1;
    } else if (scene->unk4C == 2 && gLoadedSaveGame->unk1B != 0) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    transitionConfig = &scene->unk40;
    transitionConfig->unk0 = 0;
    transitionConfig->unk4 = 0;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FFF;

    background = &scene->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E1244[scene->unk50 + scene->unk4E];
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

void sub_808ECB4(void);

void sub_808EC64(void);

void sub_808EBC4(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 2;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808EC64;
    }
}

void sub_808ED04(void);

void sub_808EC28(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808ED04;
    }
}

void sub_808EC64(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808ECB4;
    }

    if (scene->unk54 != 0) {
        scene->unk54--;
    } else {
        gCurTask->main = sub_808EC28;
    }
}

void sub_808F14C(u8);

void sub_808ECB4(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        sub_808F14C(scene->unk4C);
        TaskDestroy(gCurTask);
    }
}

void sub_808ED60(u8, u8, u8);

void sub_808ED04(void)
{
    struct CreditsCutScene *scene = TaskGetStructPtr(gCurTask);
    scene->unk4E++;
    if (scene->unk4F < 4) {
        sub_808ED60(scene->unk4C, scene->unk4E, scene->unk4F);
    } else {
        sub_808F14C(scene->unk4C);
    }
    TaskDestroy(gCurTask);
}

void sub_808ED5C(UNUSED struct Task *t) { }

struct CreditsCutScene2 {
    struct Unk_03002400 unk0;
    struct UNK_802D4CC_UNK270 unk40;

    u8 unk4C;
    u8 unk4D;

    u8 unk4E;

    u8 unk4F;
    u8 unk50;
    u8 unk51;
    u8 unk52;
    u32 unk54;
    u32 unk58;
};

void sub_808F004(void);
void sub_808F148(struct Task *);

extern const u8 gUnknown_080E12AA[6];
extern const u16 gUnknown_080E1278[25];

void sub_808ED60(u8 a, u8 b, u8 c)
{
    struct Task *t;
    struct CreditsCutScene2 *scene = NULL;
    struct Unk_03002400 *background;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;
    u8 i;

    gDispCnt = 0x1241;
    gBgCntRegs[1] = 0x1C04;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 0x20;

    t = TaskCreate(sub_808F004, 0x5C, 0x3100, 0, sub_808F148);
    scene = TaskGetStructPtr(t);
    scene->unk4C = a;
    scene->unk4E = b;
    scene->unk4F = c;
    scene->unk52 = 0;
    scene->unk54 = 0x96;
    scene->unk50 = 0;

    if (scene->unk4C == 1 && gLoadedSaveGame->unk15[4] != 0) {
        scene->unk4D = 1;
    } else if (scene->unk4C == 2 && gLoadedSaveGame->unk1B != 0) {
        scene->unk4D = 2;
    } else {
        scene->unk4D = 0;
    }

    for (i = 0; i < scene->unk4F; i++) {
        scene->unk50 += gUnknown_080E12AA[i];
    }

    scene->unk51 = scene->unk50 + gUnknown_080E12AA[scene->unk4F];

    transitionConfig = &scene->unk40;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unkA = 0;
    transitionConfig->unk6 = 0x200;
    transitionConfig->unk8 = 0x3FFF;

    if (gUnknown_080E1278[scene->unk50] != 0) {
        background = &scene->unk0;
        background->unk4 = BG_SCREEN_ADDR(8);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E1278[scene->unk50];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 1;
        sub_8002A3C(background);
    }
}

void sub_808F10C(void);

void sub_808EF38(void)
{
    struct CreditsCutScene2 *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 1;
    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        scene->unk50++;

        if (scene->unk50 < scene->unk51) {
            if (gUnknown_080E1278[scene->unk50] != 0) {
                struct Unk_03002400 *background = &scene->unk0;
                background->unk4 = BG_SCREEN_ADDR(8);
                background->unkA = 0;
                background->unkC = BG_SCREEN_ADDR(28);
                background->unk18 = 0;
                background->unk1A = 0;
                background->unk1C = gUnknown_080E1278[scene->unk50];
                background->unk1E = 0;
                background->unk20 = 0;
                background->unk22 = 0;
                background->unk24 = 0;
                background->unk26 = 0x1E;
                background->unk28 = 0x14;
                background->unk2A = 0;
                background->unk2E = 1;
                sub_8002A3C(background);
            }
            gCurTask->main = sub_808F004;
        } else {
            gCurTask->main = sub_808F10C;
        }
    }
}

void sub_808F0BC(void);
void sub_808F068(void);

void sub_808F004(void)
{
    struct CreditsCutScene2 *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 2;

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808F0BC;
    }

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_808F068;
    }
}

void sub_808F068(void)
{
    struct CreditsCutScene2 *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk54 != 0) {
        scene->unk54--;
    } else {
        scene->unk54 = 0x96;
        gCurTask->main = sub_808EF38;
    }

    if (scene->unk4D != 0 && (gPressedKeys & START_BUTTON)) {
        gCurTask->main = sub_808F0BC;
    }
}

void sub_808F0BC(void)
{
    struct CreditsCutScene2 *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 24);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        sub_808F14C(scene->unk4C);
        TaskDestroy(gCurTask);
    }
}

void sub_808F10C(void)
{
    struct CreditsCutScene2 *scene = TaskGetStructPtr(gCurTask);
    scene->unk4F++;
    sub_808EA50(scene->unk4C, scene->unk4E, scene->unk4F);
    TaskDestroy(gCurTask);
}

void sub_808F148(UNUSED struct Task *t) { }

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
    vu32 unk16C;
    s32 unk170[3][2];
}; /* size: 0x188 */

extern const u16 gUnknown_080E12B0[0x20];
extern const struct UNK_080E0D64 gUnknown_080E12D0[4];

void sub_808FB2C(void);
void sub_808FBE4(struct Task *);

void sub_8003638(struct Unk_03002400 *);

void sub_808F14C(u8 mode)
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
    DmaFill32(3, 0, 0x6000000 + (++r6, --r6) * 0x4000, 0x4000);
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
    scene->unk15C = mode;
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
            element->unk4 = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[0].unk0 << 5);
            element->unkA = gUnknown_080E12D0[0].unk4;
            element->unk20 = gUnknown_080E12D0[0].unk6;
            element->unk21 = 0xFF;
            element->unk16 = 0x78;
            element->unk18 = -0x14;
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unkF0;
            element->unk4 = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[1].unk0 << 5);
            element->unkA = gUnknown_080E12D0[1].unk4;
            element->unk20 = gUnknown_080E12D0[1].unk6;
            element->unk21 = 0xFF;
            element->unk16 = 0x78;
            element->unk18 = 0x100;
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unk120;
            element->unk4 = (void *)scene->unk16C;
            scene->unk16C += (gUnknown_080E12D0[2].unk0 << 5);
            element->unkA = gUnknown_080E12D0[2].unk4;
            element->unk20 = gUnknown_080E12D0[2].unk6;
            element->unk21 = 0xFF;
            element->unk16 = 0x78;
            element->unk18 = 0x100;
            element->unk1A = 0;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 0;
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
        element->unkA = gUnknown_080E12D0[0].unk4;
        element->unk20 = gUnknown_080E12D0[0].unk6;
        element->unk16 = scene->unk170[0][0];
        element->unk18 = scene->unk170[0][1] >> 8;
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
        element->unkA = gUnknown_080E12D0[1].unk4;
        element->unk20 = gUnknown_080E12D0[1].unk6;
        element->unk16 = scene->unk170[1][0];
        element->unk18 = scene->unk170[1][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);

        element = &scene->unk120;
        element->unkA = gUnknown_080E12D0[2].unk4;
        element->unk20 = gUnknown_080E12D0[2].unk6;
        element->unk16 = scene->unk170[2][0];
        element->unk18 = scene->unk170[2][1] >> 8;
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

void sub_8094118(void);

void sub_808FB94(void)
{
    struct CreditsEndCutScene *scene = TaskGetStructPtr(gCurTask);
    if (scene->unk164 != 0) {
        scene->unk164--;
        return;
    }

    if (scene->unk161 == 0) {
        sub_8094118();
        TaskDestroy(gCurTask);
    } else if (scene->unk161 == 1) {
        CreateTitleScreen();
        TaskDestroy(gCurTask);
    }
}

void sub_808FBE4(struct Task *t) { }

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

// CreateExtraEndingCutScene
void sub_808FC78(void)
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
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += 0xA00;
        element->unkA = gUnknown_080E12FC[i + 3].unk4;
        element->unk20 = gUnknown_080E12FC[i + 3].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;

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
        element->unk25 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk40;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += 0x540;
        element->unkA = gUnknown_080E12FC[0].unk4;
        element->unk20 = gUnknown_080E12FC[0].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk70;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[7].unk0 << 5;
        element->unkA = gUnknown_080E12FC[7].unk4;
        element->unk20 = gUnknown_080E12FC[7].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x1C0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;

        element = &scene->unkA0;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += 0x800;
        element->unkA = gUnknown_080E12FC[10].unk4;
        element->unk20 = gUnknown_080E12FC[10].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x240;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 6; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unkD0[i];
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[i + 0xD].unk0 * 0x20;
        element->unkA = gUnknown_080E12FC[i + 0xD].unk4;
        element->unk20 = gUnknown_080E12FC[i + 0xD].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x180;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1F0;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[19].unk0 << 5;
        element->unkA = gUnknown_080E12FC[19].unk4;
        element->unk20 = gUnknown_080E12FC[19].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x140;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 1;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk220;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[20].unk0 << 5;
        element->unkA = gUnknown_080E12FC[20].unk4;
        element->unk20 = gUnknown_080E12FC[20].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0xC0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk340;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[9].unk0 << 6;
        element->unkA = gUnknown_080E12FC[9].unk4;
        element->unk20 = gUnknown_080E12FC[9].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk250;
        element->unk4 = (void *)scene->unk398;
        scene->unk398 += gUnknown_080E12FC[8].unk0 << 5;
        element->unkA = gUnknown_080E12FC[8].unk4;
        element->unk20 = gUnknown_080E12FC[8].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x200;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
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
    u16 unk0;
    u8 unk2;
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
        element->unkA = gUnknown_080E1348[0].unk0;
#ifndef NON_MATCHING
        while (0)
            ;
#endif
        element->unk20 = gUnknown_080E1348[0].unk2;
        element->unk16 = scene->unk3E8[i][0];
        element->unk18 = scene->unk3E8[i][1] >> 8;
        sub_80051E8(element);
    }

    if (gBgScrollRegs[0][1] > 0x6D) {
        max = 0;
        for (i = 0; i < 8; i++) {
            element = &scene->unk280[i & 3];
            element->unkA = gUnknown_080E12FC[(i & 3) + 3].unk4;
            element->unk20 = gUnknown_080E12FC[(i & 3) + 3].unk6;

            if (i > 4) {
                max = 1;
            }

            element->unk16 = (scene->unk3A0[i][0] >> 8) - (max * 100);
            element->unk18 = scene->unk3A0[i][1] >> 8;

            sub_80051E8(element);
        }
    }

    element = &scene->unk40;
    if (scene->unk37C == 0xD) {
        element->unkA = gUnknown_080E12FC[1].unk4;
        element->unk20 = gUnknown_080E12FC[1].unk6;
    } else if (scene->unk37C == 0xE || scene->unk37C == 0xF || scene->unk37C == 0x10) {
        element->unkA = gUnknown_080E12FC[2].unk4;
        element->unk20 = gUnknown_080E12FC[2].unk6;
    } else if (scene->unk37C >= 0x11) {
        element->unkA = gUnknown_080E12FC[21].unk4;
        element->unk20 = gUnknown_080E12FC[21].unk6;
    }
    element->unk16 = scene->unk3E0[0] >> 8;
    element->unk18 = scene->unk3E0[1] >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk37C < 0xE) {
        element = &scene->unkA0;
        element->unk16 = scene->unk460;
        element->unk18 = scene->unk464;

        if (scene->unk37C == 10) {
            element->unkA = gUnknown_080E12FC[11].unk4;
            element->unk20 = gUnknown_080E12FC[11].unk6;
            sub_8004558(element);
        } else if (scene->unk37C == 0xD) {
            element->unkA = gUnknown_080E12FC[12].unk4;
            element->unk20 = gUnknown_080E12FC[12].unk6;
            sub_8004558(element);
        }
        sub_80051E8(element);
    }

    if (scene->unk37C < 0xD) {
        element = &scene->unk1F0;
        for (i = 0; i < scene->unk37C; i++) {
            element->unk16 = scene->unk4F4[i][0] >> 8;
            element->unk18 = scene->unk4F4[i][1] >> 8;
            sub_8004558(element);
            sub_80051E8(element);
        }
    } else {
        for (i = 0; i < 6; i++) {
            element = &scene->unkD0[i];
            element->unkA = gUnknown_080E12FC[i + 0xD].unk4;
            element->unk20 = gUnknown_080E12FC[i + 0xD].unk6;
            element->unk16 = scene->unk584[i][0] >> 8;
            element->unk18 = scene->unk584[i][1] >> 8;
            sub_80051E8(element);
        }
    }

    if (gBgScrollRegs[0][1] < 0x6E) {
        element = &scene->unk220;
        element->unk16 = scene->unk460;
        element->unk18 = scene->unk464 + 0x1E;
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
            element->unk16 = scene->unk47C[i][0] >> 8;
            element->unk18 = scene->unk47C[i][1] >> 8;

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
        element->unk16 = scene->unk470[0] >> 8;
        element->unk18 = scene->unk470[1] >> 8;

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

void sub_80914B8(void);

void sub_8091468(void)
{
    sub_80914B8();
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

struct ExtraEndingCutSceneSlides {
    struct Unk_03002400 unk0;
    struct UNK_802D4CC_UNK270 unk40;
    u16 unk4C;
}; /* 0x50 */

void sub_8091590(void);
void sub_8091680(struct Task *);

// CreateExtraEndingCutSceneSlides
void sub_80914B8(void)
{
    struct Task *t = NULL;
    struct ExtraEndingCutSceneSlides *scene;
    struct Unk_03002400 *background;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x5C00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;

    t = TaskCreate(sub_8091590, 0x50, 0x3100, 0, sub_8091680);
    scene = TaskGetStructPtr(t);

    scene->unk4C = 0xF0;

    transitionConfig = &scene->unk40;
    transitionConfig->unk2 = 1;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x80;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    background = &scene->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0xD2;
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

void sub_8091608(void);

void sub_8091590(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 2;
    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_8091608;
    }
}

void sub_8091638(void);

void sub_80915CC(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk40;

    transitionConfig->unk2 = 1;
    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_8091638;
    }
}

void sub_8091608(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk4C != 0) {
        scene->unk4C--;
    } else {
        scene->unk4C = 0xF0;
        gCurTask->main = sub_80915CC;
    }
}

void sub_8091638(void)
{
    struct ExtraEndingCutSceneSlides *scene = TaskGetStructPtr(gCurTask);

    if (scene->unk4C != 0) {
        scene->unk4C--;
        if (scene->unk4C == 0x3C) {
            m4aSongNumStart(MUS_STAFF_CREDITS);
        }
    } else {
        sub_808EA50(2, 0, 0);
        TaskDestroy(gCurTask);
    }
}

void sub_8091680(struct Task *t)
{
    // unused logic
}

struct FinalEndingCutScene2 {
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

// CreateFinalEndingCutScene2
void sub_8091684(void)
{

    struct Unk_03002400 *background;
    struct Task *t;
    struct FinalEndingCutScene2 *scene = NULL;
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
        element->unk4 = (void *)OBJ_VRAM0;
        scene->unk494 += gUnknown_080E1650[0].unk0 * 0x20;
        element->unkA = gUnknown_080E1650[0].unk4;
        element->unk20 = gUnknown_080E1650[0].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk110;
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += 0x1A00;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0x50;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
    }

    {
        struct UNK_0808B3FC_UNK240 *element;

        element = &scene->unk140;
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += 0xC00;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0x50;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1A0;
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += 0x3C0;
        element->unkA = gUnknown_080E1650[1].unk4;
        element->unk20 = gUnknown_080E1650[1].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x80;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1D0[i];
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[(i + 3)].unk0 * 0x20;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x40;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
    }

    for (i = 0; i < 6; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk230[i];

        element->unk4 = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[2].unk0 * 0x20;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 2;
        element->unk10 = 0x2000;
        element->unk28 = -1;
    }

    if (gSelectedCharacter == 1) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk170;
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[27].unk0 * 0x20;
        element->unkA = gUnknown_080E1650[27].unk4;
        element->unk20 = gUnknown_080E1650[27].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 2;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unkB0[i];
        element->unk4 = (void *)scene->unk494;
        scene->unk494 += 1;
        element->unkA = gUnknown_080E1650[(i + 5)].unk4;
        element->unk20 = gUnknown_080E1650[(i + 5)].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
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

void sub_8091F68(struct FinalEndingCutScene2 *);
void sub_809205C(struct FinalEndingCutScene2 *);
void sub_80920E4(struct FinalEndingCutScene2 *);
void sub_8092804(struct FinalEndingCutScene2 *);
void sub_80921E8(struct FinalEndingCutScene2 *);
void sub_8092850(struct FinalEndingCutScene2 *);
void sub_80923AC(struct FinalEndingCutScene2 *);

u32 sub_80928C8(struct FinalEndingCutScene2 *);

void sub_8091E60(void);

extern const u8 gUnknown_080E1738[10];

void sub_8091CB0(void)
{
    struct FinalEndingCutScene2 *scene = TaskGetStructPtr(gCurTask);
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

void sub_809289C(struct FinalEndingCutScene2 *);

void sub_8091E60(void)
{
    struct FinalEndingCutScene2 *scene = TaskGetStructPtr(gCurTask);
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

void sub_8091F68(struct FinalEndingCutScene2 *scene)
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

void sub_809205C(struct FinalEndingCutScene2 *scene)
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

void sub_80920E4(struct FinalEndingCutScene2 *scene)
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

void sub_80921E8(struct FinalEndingCutScene2 *scene)
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

void sub_80923AC(struct FinalEndingCutScene2 *scene)
{
    u8 i;
    struct UNK_0808B3FC_UNK240 *element;
    u32 variant = 0;

    element = &scene->unk80;
    for (i = 0; i < 10; i++) {
        element->unkA = gUnknown_080E1650[0].unk4;
        element->unk20 = gUnknown_080E1650[0].unk6;

        element->unk16 = scene->unk3F8[i][0];
        element->unk18 = scene->unk3F8[i][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (scene->unk35C > 8) {
        variant = 1;
    }

    element = &scene->unk1A0;
    element->unkA = gUnknown_080E1650[variant + 1].unk4;
    element->unk20 = gUnknown_080E1650[variant + 1].unk6;
    element->unk16 = scene->unk3C0;
    element->unk18 = scene->unk3C4 >> 8;

    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk35C < 10) {
        for (i = 0; i < 6; i++) {
            if (((scene->unk3C4 >> 8) + gBgScrollRegs[1][1]) < 0xE4) {
                element = &scene->unk1D0[i & 1];
                element->unkA = gUnknown_080E1650[(i & 1) + 3].unk4;
                element->unk20 = gUnknown_080E1650[(i & 1) + 3].unk6;
                element->unk16 = scene->unk378[i][0];
                element->unk18 = scene->unk378[i][1] >> 8;
                sub_8004558(element);
                sub_80051E8(element);
            }

            if (scene->unk365[i] != 0) {
                element = &scene->unk230[i];
                element->unkA = gUnknown_080E1650[2].unk4;
                element->unk20 = gUnknown_080E1650[2].unk6;
                element->unk16 = scene->unk3C8[i][0];
                element->unk18 = scene->unk3C8[i][1] >> 8;

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
    element->unkA = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].unk4;
    element->unk20 = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].unk6;
    element->unk16 = scene->unk3A8;
    element->unk18 = scene->unk3AC >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (scene->unk35C > 10) {
        variant = 1;
    }

    element = &scene->unk140;
    element->unkA = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].unk4;
    element->unk20 = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].unk6;
    element->unk16 = scene->unk3B4;
    element->unk18 = scene->unk3B8 >> 8;
    sub_8004558(element);
    sub_80051E8(element);

    if (gSelectedCharacter == CHARACTER_CREAM) {
        element = &scene->unk170;
        element->unkA = gUnknown_080E1650[variant + 0x1B].unk4;
        element->unk20 = gUnknown_080E1650[variant + 0x1B].unk6;
        element->unk16 = scene->unk3B4;
        element->unk18 = scene->unk3B8 >> 8;
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
    struct FinalEndingCutScene2 *scene = TaskGetStructPtr(gCurTask);
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
    struct FinalEndingCutScene2 *scene = TaskGetStructPtr(gCurTask);
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
    struct FinalEndingCutScene2 *scene = TaskGetStructPtr(gCurTask);
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

void sub_80928F8(void);

void sub_80927E8(void)
{
    struct Task *t = gCurTask;
    sub_80928F8();
    TaskDestroy(gCurTask);
}

void sub_8092800(struct Task *t)
{
    // unused logic
}

void sub_8092804(struct FinalEndingCutScene2 *scene)
{
    if (scene->unk35C < 10) {
        scene->unk3C0 = 0xD2;
        if ((scene->unk3C4 >> 8) + gBgScrollRegs[1][1] < 0xE7) {
            scene->unk3C4 += 0x20;
        }
        sub_808E8F8((s16 *)&scene->unk3C0, 0xD2, 1);
    }
}

void sub_8092850(struct FinalEndingCutScene2 *scene)
{
    u8 i;

    for (i = 0; i < 6; i++) {
        if (scene->unk365[i] != 0) {
            scene->unk3C8[i][0] = scene->unk378[i][0];
            scene->unk3C8[i][1] = scene->unk378[i][1];
        }
    }
}

void sub_809289C(UNUSED struct FinalEndingCutScene2 *scene)
{
    CpuFastSet((void *)OBJ_PLTT + 0x100, (void *)PLTT + 0x100, 1);
    CpuFastSet((void *)OBJ_PLTT + 0x120, (void *)PLTT + 0x120, 1);
}

u32 sub_80928C8(struct FinalEndingCutScene2 *scene)
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

struct FinalEndingLandingCutScene {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 unk110;
    struct UNK_0808B3FC_UNK240 unk140;
    struct UNK_0808B3FC_UNK240 unk170;
    struct UNK_0808B3FC_UNK240 unk1A0;
    struct UNK_0808B3FC_UNK240 unk1D0;
    struct UNK_0808B3FC_UNK240 unk200;
    struct UNK_0808B3FC_UNK240 unk230;
    struct UNK_0808B3FC_UNK240 unk260[2];
    struct UNK_0808B3FC_UNK240 unk2C0[2];

    struct UNK_808D124_UNK180 unk320;
    struct UNK_802D4CC_UNK270 unk32C;

    u8 unk338;
    u8 unk339;
    u8 unk33A;
    u8 unk33B;
    u8 unk33C;
    u8 unk33D;
    u8 unk33E;
    u8 unk33F;
    u16 unk340;
    u16 unk342;
    u16 unk344;
    u16 unk346;
    u16 unk348;
    u16 unk34A;

    s32 unk34C[20][5];
    s32 unk4DC[13][5];
    s32 unk5E0[7][2];

    // vramPtr
    vu32 unk618;
};

void sub_8093EDC(void);
void sub_8093F9C(struct Task *);

extern const struct UNK_080E0D64 gUnknown_080E17A4[52];
extern const u16 gUnknown_080E179C[4];
extern const u16 gUnknown_080E1AF4[0x10];

// CreateFinalEndingCutSceneLanding
void sub_80928F8(void)
{
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;
    struct UNK_808D124_UNK180 *transformer = NULL;
    struct FinalEndingLandingCutScene *scene = NULL;

    u8 i, j;
    u16 unk1AF4[0x10];

    u32 value = 0;
    struct Task *t = NULL;

    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x9c03;
    gBgCntRegs[1] = 0x1806;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
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

    t = TaskCreate(sub_8093EDC, 0x61C, 0x3100, 0, sub_8093F9C);
    scene = TaskGetStructPtr(t);
    // TODO: chaos emeralds are probabyl wrong
    if (gLoadedSaveGame->unkC[gSelectedCharacter] & CHAOS_EMERALD(ZONE_FINAL)) {
        value = 2;
        scene->unk33C = 0;
    } else {
        scene->unk33C = 10;
    }

    scene->unk338 = 0;
    scene->unk339 = 1;
    scene->unk33A = 0;
    scene->unk342 = 0;
    scene->unk346 = 0;
    scene->unk348 = 0;
    scene->unk340 = 0x100;
    scene->unk34A = 0x32;
    scene->unk344 = 0xF0;
    scene->unk33D = 0;
    scene->unk33E = 0;

    if (gSelectedCharacter == 1) {
        scene->unk33B = 1;
    } else {
        scene->unk33B = 0;
    }

    for (i = 0; i < 5; i++) {
        for (j = 0; j < 0x14; j++) {
            scene->unk34C[j][i] = 0;
        }

        for (j = 0; j < 0xD; j++) {
            scene->unk4DC[j][i] = 0;
        }
    }

    for (i = 0; i < 2; i++) {
        scene->unk5E0[0][i] = 0;
        scene->unk5E0[1][i] = 0;
        scene->unk5E0[2][i] = 0;
        scene->unk5E0[3][i] = 0xB400;
        scene->unk5E0[4][i] = 0xC800;
        scene->unk5E0[5][i] = 0;
        scene->unk5E0[6][i] = 0;
    }

    for (j = 0; j < 0xD; j++) {
        scene->unk4DC[j][0] = Random() & 0x7F;
    }

    scene->unk618 = OBJ_VRAM0;
    transitionConfig = &scene->unk32C;
    transitionConfig->unk2 = 2;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x100;
    transitionConfig->unk8 = 0x3FBF;
    if (gSelectedCharacter == 1) {
        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unk110;
            element->unk4 = (void *)scene->unk618;
            scene->unk618 += 0x300;
            element->unkA = gUnknown_080E17A4[32].unk4;
            element->unk20 = gUnknown_080E17A4[32].unk6;
            element->unk21 = 0xFF;
            element->unk16 = 200;
            element->unk18 = 100;
            element->unk1A = 0x80;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 1;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unk140;
            element->unk4 = (void *)scene->unk618;
            scene->unk618 += 0x120;
            element->unk21 = 0xFF;
            element->unk16 = 0x6E;
            element->unk18 = 0xFFEC;
            element->unk1A = 0x40;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0;
            element->unk28 = -1;
        }

        {
            struct UNK_0808B3FC_UNK240 *element;
            element = &scene->unk170;
            element->unk4 = (void *)scene->unk618;
            scene->unk618 += gUnknown_080E17A4[49].unk0 * 0x20;
            element->unkA = gUnknown_080E17A4[49].unk4;
            element->unk20 = gUnknown_080E17A4[49].unk6;
            element->unk21 = 0xFF;
            element->unk16 = 0;
            element->unk18 = 0;
            element->unk1A = 0x40;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->unk25 = 2;
            element->unk10 = 0;
            element->unk28 = -1;
            sub_8004558(element);
        }
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk80;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += 0x800;
        element->unkA = gUnknown_080E17A4[gSelectedCharacter].unk4;
        element->unk20 = gUnknown_080E17A4[gSelectedCharacter].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0xFFEC;
        element->unk1A = 0x40;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        transformer = &scene->unk320;

        element = &scene->unkB0;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += 0x800;
        element->unkA = gUnknown_080E17A4[gSelectedCharacter + 0x14].unk4;
        element->unk20 = gUnknown_080E17A4[gSelectedCharacter + 0x14].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0x40;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0x60;
        element->unk28 = -1;

        transformer->unk0 = 0;
        transformer->unk2 = scene->unk340;
        transformer->unk4 = scene->unk340;
        transformer->unk6[0] = element->unk16;
        transformer->unk6[1] = element->unk18;

        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk260[i];
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[0x24 + i].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[36].unk4;
        element->unk20 = gUnknown_080E17A4[36].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0xC0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk2C0[i];
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[0x26 + i].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[38].unk4;
        element->unk20 = gUnknown_080E17A4[38].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x1E;
        element->unk18 = 0x1E;
        element->unk1A = 0xC0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1A0;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[35].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[35].unk4;
        element->unk20 = gUnknown_080E17A4[35].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0;
        element->unk18 = 0x1E;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk1D0;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[40].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[40].unk4;
        element->unk20 = gUnknown_080E17A4[40].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0xFFEC;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk200;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[41].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[41].unk4;
        element->unk20 = gUnknown_080E17A4[41].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0x100;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unk230;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[42].unk0 * 0x20;
        element->unkA = gUnknown_080E17A4[42].unk4;
        element->unk20 = gUnknown_080E17A4[42].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0x100;
        element->unk1A = 0;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct UNK_0808B3FC_UNK240 *element;
        element = &scene->unkE0;
        element->unk4 = (void *)scene->unk618;
        scene->unk618 += 0x1500;
        element->unkA = gUnknown_080E17A4[gSelectedCharacter + 0x19].unk4;
        element->unk20 = gUnknown_080E17A4[gSelectedCharacter + 0x19].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0;
        element->unk1A = 0x40;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 1;
        element->unk10 = 0;
        element->unk28 = -1;
        sub_8004558(element);
    }

    {
        struct Unk_03002400 *background;
        background = &scene->unk40;
        background->unk4 = BG_SCREEN_ADDR(0);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E179C[value + 1];
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x20;
        background->unk28 = 0x20;
        background->unk2A = 0;
        background->unk2E = 0;
        sub_8002A3C(background);
    }

    if (value == 2) {
        gBgScrollRegs[1][0] = 8;
    }

    {
        struct Unk_03002400 *background;
        background = &scene->unk0;
        background->unk4 = BG_SCREEN_ADDR(8);
        background->unkA = 0;
        background->unkC = BG_SCREEN_ADDR(24);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1C = gUnknown_080E179C[value];
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

    if (!(gLoadedSaveGame->unkC[gSelectedCharacter] & 0x80)) {
        memcpy(unk1AF4, gUnknown_080E1AF4, 0x20);
        DmaCopy32(3, unk1AF4, &gBgPalette[0x20], 0x20);
    }
}

void sub_8093FA0(struct FinalEndingLandingCutScene *);
void sub_8093FF0(struct FinalEndingLandingCutScene *);
void sub_80934B8(struct FinalEndingLandingCutScene *);
void sub_8093638(struct FinalEndingLandingCutScene *);
void sub_8093740(struct FinalEndingLandingCutScene *);
void sub_809401C(struct FinalEndingLandingCutScene *);
void sub_8094044(struct FinalEndingLandingCutScene *);
void sub_8094060(struct FinalEndingLandingCutScene *);
void sub_80940BC(struct FinalEndingLandingCutScene *);
void sub_8093868(struct FinalEndingLandingCutScene *);
void sub_8093F54(void);

void sub_80932C8(void)
{
    struct FinalEndingLandingCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk32C;

    transitionConfig->unk2 = 1;
    transitionConfig->unk8 = 0x3FFF;
    sub_8093FA0(scene);
    sub_8093FF0(scene);
    sub_80934B8(scene);
    sub_8093638(scene);
    sub_8093740(scene);
    sub_809401C(scene);
    sub_8094044(scene);
    sub_8094060(scene);
    sub_80940BC(scene);
    sub_8093868(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_8093F54;
    }
}

extern const u16 gUnknown_080E1944[4][8];
extern const u16 gUnknown_080E1B14[2][7];

void sub_809334C(void)
{
    struct FinalEndingLandingCutScene *scene = TaskGetStructPtr(gCurTask);

    sub_8093FA0(scene);
    sub_8093FF0(scene);
    sub_80934B8(scene);
    sub_8093638(scene);
    sub_8093740(scene);
    sub_809401C(scene);
    sub_8094044(scene);
    sub_8094060(scene);
    sub_80940BC(scene);
    sub_8093868(scene);

    if ((scene->unk5E0[0][1]
             == ((gUnknown_080E1944[scene->unk33B][scene->unk338] - gBgScrollRegs[1][1])
                 * 0x100)
         || (scene->unk33B == 0 && scene->unk338 > 3))
        || (scene->unk33B == 1 && scene->unk338 > 4)) {
        if ((scene->unk33B == 0 && scene->unk338 < 6)
            || (scene->unk33B == 1 && scene->unk338 < 7)) {
            if (scene->unk342 != 0) {
                scene->unk342--;
            } else {
                scene->unk342 = gUnknown_080E1B14[scene->unk33B][scene->unk338];
                scene->unk338++;
                if (scene->unk33B != 0) {
                    if (scene->unk338 == 1) {
                        scene->unk33A = 1;
                    } else if ((u8)(scene->unk338 - 3) < 2) {
                        scene->unk33A++;
                    } else if (scene->unk338 > 4) {
                        scene->unk33A = 4;
                    }
                }
            }
        } else {
            gCurTask->main = sub_80932C8;
        }
    }
}

extern const u32 gUnknown_080E1B30[35][2];

void sub_80934B8(struct FinalEndingLandingCutScene *scene)
{
    if (scene->unk5E0[0][1]
            < ((gUnknown_080E1944[scene->unk33B][scene->unk338] - gBgScrollRegs[1][1])
               * 0x100)
        && scene->unk338 == 0) {
        scene->unk5E0[0][1] += 0x320;
        scene->unk5E0[0][0] = 0x7800;
    } else if (scene->unk338 == 0) {
        scene->unk5E0[0][1]
            = ((gUnknown_080E1944[scene->unk33B][scene->unk338] - gBgScrollRegs[1][1])
               * 0x100);
        scene->unk5E0[0][0] = 0x7800;
    } else if (scene->unk338 == 1) {
        scene->unk5E0[0][1]
            = (gUnknown_080E1944[scene->unk33B][scene->unk338] - gBgScrollRegs[1][1])
            * 0x100;
        scene->unk5E0[0][0] = 0x7800;
    } else {
        if ((gSelectedCharacter == 1 && scene->unk338 == 5)
            || (gSelectedCharacter != 1 && scene->unk338 == 4)) {
            if (scene->unk342 & 1) {
                if (scene->unk33E < 0x23) {
                    scene->unk33E++;
                }

                scene->unk5E0[0][0] = gUnknown_080E1B30[scene->unk33E][0] + 0x7800;
                scene->unk5E0[0][1] = gUnknown_080E1B30[scene->unk33E][1] + 0x8200;
            }

            if (scene->unk342 < 0x32) {
                scene->unk340 += 4;
                scene->unk320.unk0 += 3;
            } else {
                scene->unk340 += 8;
                scene->unk320.unk0 += 0x14;
            }

            if (scene->unk342 == 1) {
                m4aSongNumStart(VOICE__ANNOUNCER__CONGRATULATIONS);
            }
            return;
        }
        scene->unk5E0[0][1]
            = (gUnknown_080E1944[scene->unk33B][scene->unk338] - gBgScrollRegs[1][1])
            * 0x100;
        scene->unk5E0[0][0] = 0x7800;
    }
}

extern const u32 gUnknown_080E1964[][5];

void sub_8093638(struct FinalEndingLandingCutScene *scene)
{
    u8 i;

    for (i = 0; i < (0x14 - scene->unk33C); i++) {
        scene->unk34C[i][2] += gUnknown_080E1964[i][0] * 2;
        if ((u32)scene->unk34C[i][2] <= 0x20000) {
            scene->unk34C[i][4] = 0;
        } else {
            scene->unk34C[i][4] = 1;
        }

        if (scene->unk34C[i][2] > 0x3FFFF) {
            scene->unk34C[i][2] = 0;
        }

        scene->unk34C[i][0] = COS(scene->unk34C[i][2] >> 8);
        scene->unk34C[i][3] += gUnknown_080E1964[i][1] * 8;

        if (scene->unk34C[i][3] > 0x3FFFF) {
            scene->unk34C[i][3] = 0;
        }

        scene->unk34C[i][1] = (SIN(((scene->unk34C[i][3] >> 8) & 0xFF) * 4) >> 6) * 8;
    }
}

void sub_8093740(struct FinalEndingLandingCutScene *scene)
{
    u8 i;
    for (i = 0; i < (0xD - (scene->unk33C >> 1)); i++) {
        s32 sin, temp, unused;
        if (scene->unk4DC[i][1] == ((0xBE - gBgScrollRegs[1][1]) * 0x100)) {
            gUnknown_030053B8 = gUnknown_030053B8 * 0x196225 + 0x3C6EF35F;
            if (gUnknown_030053B8 < 0) {
                scene->unk4DC[i][4] = -1;
            } else {
                scene->unk4DC[i][4] = 1;
            }
        }

        scene->unk4DC[i][0] += scene->unk4DC[i][4] * 0x80;

        if (scene->unk4DC[i][0] > 0x10000) {
            scene->unk4DC[i][0] = -10;
        } else if (scene->unk4DC[i][0] < -10) {
            scene->unk4DC[i][0] = 0x10000;
        }

#ifndef NON_MATCHING
        unused = scene->unk4DC[i][1];
#endif

        temp = (0xBE - gBgScrollRegs[1][1]) * 0x100;
        sin = SIN((((scene->unk4DC[i][0] >> 7) * 8) & 0xFF) * 4) >> 6;

        if (sin < 0) {
            sin = -sin;
        };

        scene->unk4DC[i][1] = ((0xBE - gBgScrollRegs[1][1]) * 0x100) - (sin * 8);
    }
}
