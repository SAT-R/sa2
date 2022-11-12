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
    u8 unk7C;
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

void sub_808E890(struct Task *);

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

    if (scene->unk70 < (player->unk8 - (gUnknown_03005960.unk0 * 0x100) - 0x1400)) {
        scene->unk70 = (player->unk8 - (gUnknown_03005960.unk0 * 0x100) - 0x1400);
    }

    if (scene->unk72 > (player->unkC - (gUnknown_03005960.unk4 * 0x100) - 0xA00)) {
        // Required for match
        scene->unk72 = scene->unk72
            = player->unkC - (gUnknown_03005960.unk4 * 0x100) - 0xA00;
        scene->unk70 = player->unk8 - (gUnknown_03005960.unk0 * 0x100) - 0x1400;

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
