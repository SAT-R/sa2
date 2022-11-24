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

    u32 unk39C;

    u32 unk3A0[8][2];
    s32 unk3E0[2];

    u32 unk3E8[10][3];
    s32 unk460;
    s32 unk464;
    u8 filler468[8];
    s32 unk470[2];
    u32 unk478;
    s32 unk47C[6][5];
    u32 unk4F4[12][3];
    u32 unk584[6][3];
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
#ifndef NON_MATCHING
            s32 var = 0x474;
#endif
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
            if (var != 0x474)
                break;
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

// void sub_8090CA0(struct ExtraEndingCutScene *scene)
// {
//     if (scene->unk37C > 0xC) {
//         u8 i;
//         for (i = 0; i < 6; i++) {
//             if ((u32)(scene->unk584[i][0] + 0x9FF) < 0x103FF
//                 || (u32)(scene->unk584[i][1] + 0x9FF) < 0xB3FF) {
//                 if (i < 3) {
//                     scene->unk584[i][0] -= scene->unk584[i][2] >> 6;
//                 } else {
//                     scene->unk584[i][0] += scene->unk584[i][2] >> 6;
//                 }

//                 scene->unk584[i][1] -= scene->unk584[i][2] >> 7;
//                 scene->unk584[i][2] += gUnknown_080E1444[i * 3];
//             }
//         }
//     }
// }
