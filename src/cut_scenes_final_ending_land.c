#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes_credits.h"
#include "cut_scenes_missing_emeralds.h"
#include "m4a.h"
#include "trig.h"
#include "save.h"
#include "title_screen.h"
#include "random.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

struct FinalEndingLandCutScene {
    Background unk0;
    Background unk40;
    Sprite unk80;
    Sprite unkB0;
    Sprite unkE0;
    Sprite unk110;
    Sprite unk140;
    Sprite unk170;
    Sprite unk1A0;
    Sprite unk1D0;
    Sprite unk200;
    Sprite unk230;
    Sprite unk260[2];
    Sprite unk2C0[2];

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
    s16 unk34A;

    s32 unk34C[20][5];
    s32 unk4DC[13][5];
    s32 unk5E0[7][2];

    // vramPtr
    vu32 unk618;
};

void sub_8093EDC(void);
void sub_8093F9C(struct Task *);

static const u16 gUnknown_080E179C[4] = {
    205,
    206,
    207,
    208,
};

static const TileInfo gUnknown_080E17A4[52] = {
    { 42, 765, 0 },  { 24, 766, 0 },  { 28, 767, 0 },  { 35, 768, 0 },  { 24, 769, 0 },
    { 16, 765, 1 },  { 16, 766, 1 },  { 24, 767, 1 },  { 16, 768, 1 },  { 16, 769, 1 },
    { 20, 0, 0 },    { 16, 91, 0 },   { 30, 182, 0 },  { 20, 273, 0 },  { 20, 364, 0 },
    { 30, 771, 0 },  { 20, 772, 0 },  { 30, 773, 0 },  { 24, 774, 0 },  { 24, 775, 0 },
    { 64, 776, 0 },  { 64, 777, 0 },  { 64, 778, 0 },  { 64, 779, 0 },  { 64, 780, 0 },
    { 168, 804, 0 }, { 140, 808, 0 }, { 210, 806, 0 }, { 192, 805, 0 }, { 176, 807, 0 },
    { 20, 782, 0 },  { 20, 782, 1 },  { 20, 783, 0 },  { 24, 784, 0 },  { 24, 784, 1 },
    { 16, 770, 0 },  { 4, 526, 0 },   { 4, 517, 0 },   { 4, 516, 0 },   { 4, 524, 0 },
    { 48, 781, 0 },  { 26, 781, 1 },  { 32, 781, 2 },  { 9, 457, 0 },   { 9, 455, 0 },
    { 9, 460, 0 },   { 9, 465, 0 },   { 9, 462, 0 },   { 9, 459, 0 },   { 30, 809, 0 },
    { 24, 783, 1 },  { 24, 784, 2 },
};

static const u16 gUnknown_080E1944[][8] = {
    { 171, 177, 177, 177, 180, 140, 140, 0 },
    { 171, 177, 177, 177, 177, 180, 140, 140 },
};

static const u32 gUnknown_080E1964[20][5] = {
    { 298, 96, 1, 50, 170 },   { 384, 32, 2, 180, 130 }, { 480, 64, 0, 60, 115 },
    { 608, 32, 3, 130, 140 },  { 576, 64, 1, 190, 120 }, { 224, 64, 0, 50, 155 },
    { 256, 128, 0, 180, 140 }, { 416, 96, 1, 80, 120 },  { 224, 32, 2, 70, 150 },
    { 544, 96, 1, 70, 140 },   { 352, 32, 2, 50, 160 },  { 320, 96, 1, 170, 128 },
    { 224, 32, 2, 100, 130 },  { 416, 96, 1, 160, 170 }, { 256, 32, 2, 180, 150 },
    { 416, 96, 1, 70, 140 },   { 352, 32, 2, 50, 160 },  { 256, 96, 1, 170, 128 },
    { 224, 32, 2, 100, 130 },  { 544, 96, 1, 160, 170 },
};

static const u16 gUnknown_080E1AF4[0x10] = {
    992,   32400, 1022, 32494, 9081,  14133, 17136, 21128,
    23104, 0,     0,    20478, 17328, 22327, 25329, 28298,
};

static const u16 gUnknown_080E1B14[][7] = {
    { 18, 80, 150, 70, 300, 0, 0 },
    { 18, 30, 112, 88, 70, 300, 0 },
};

static const s32 gUnknown_080E1B30[35][2] = {
    { -2086, -3844 },  { -2086, -5244 },  { -4298, -6129 },  { -5976, -9111 },
    { -5976, -10536 }, { -7056, -12505 }, { -7524, -13461 }, { -7524, -14975 },
    { -7415, -16825 }, { -7415, -18194 }, { -6806, -19801 }, { -6806, -20929 },
    { -5806, -22206 }, { -5806, -23029 }, { -4548, -23921 }, { -4548, -24399 },
    { -3171, -24898 }, { -3171, -25025 }, { -1815, -25159 }, { -1183, -25045 },
    { -600, -24788 },  { -77, -24406 },   { 375, -23921 },   { 752, -23355 },
    { 1048, -22731 },  { 1260, -22073 },  { 1260, -21817 },  { 1389, -21087 },
    { 1389, -20767 },  { 1409, -19499 },  { 1409, -18859 },  { 1152, -17816 },
    { 1152, -16536 },  { 693, -14573 },   { 0, -12013 },
};

static const u8 gUnknown_080E1C48[6] = {
    0, 5, 10, 15, 20, 25,
};
static const u8 gUnknown_080E1C4E[7] = {
    0, 5, 15, 30, 31, 20, 25,
};
static const u8 gUnknown_080E1C55[] = {
    32, 50, 33, 34, 51, 0, 0,
};

void CreateFinalEndingLandingCutScene(void)
{
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;
    struct UNK_808D124_UNK180 *transformer = NULL;
    struct FinalEndingLandCutScene *scene = NULL;

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
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;

    t = TaskCreate(sub_8093EDC, 0x61C, 0x3100, 0, sub_8093F9C);
    scene = TaskGetStructPtr(t);
    // TODO: chaos emeralds are probabyl wrong
    if (gLoadedSaveGame->chaosEmeralds[gSelectedCharacter] & CHAOS_EMERALD(ZONE_FINAL)) {
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
            Sprite *element;
            element = &scene->unk110;
            element->graphics.dest = (void *)scene->unk618;
            scene->unk618 += 0x300;
            element->graphics.anim = gUnknown_080E17A4[32].anim;
            element->variant = gUnknown_080E17A4[32].variant;
            element->unk21 = 0xFF;
            element->x = 200;
            element->y = 100;
            element->unk1A = 0x80;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 1;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
            sub_8004558(element);
        }

        {
            Sprite *element;
            element = &scene->unk140;
            element->graphics.dest = (void *)scene->unk618;
            scene->unk618 += 0x120;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2) - 10;
            element->y = -20;
            element->unk1A = 0x40;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
        }

        {
            Sprite *element;
            element = &scene->unk170;
            element->graphics.dest = (void *)scene->unk618;
            scene->unk618 += gUnknown_080E17A4[49].numTiles * 0x20;
            element->graphics.anim = gUnknown_080E17A4[49].anim;
            element->variant = gUnknown_080E17A4[49].variant;
            element->unk21 = 0xFF;
            element->x = 0;
            element->y = 0;
            element->unk1A = 0x40;
            element->graphics.size = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 2;
            element->unk10 = 0;
            element->unk28[0].unk0 = -1;
            sub_8004558(element);
        }
    }

    {
        Sprite *element;
        element = &scene->unk80;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += 0x800;
        element->graphics.anim = gUnknown_080E17A4[gSelectedCharacter].anim;
        element->variant = gUnknown_080E17A4[gSelectedCharacter].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = -20;
        element->unk1A = 0x40;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        transformer = &scene->unk320;

        element = &scene->unkB0;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += 0x800;
        element->graphics.anim = gUnknown_080E17A4[gSelectedCharacter + 0x14].anim;
        element->variant = gUnknown_080E17A4[gSelectedCharacter + 0x14].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0x40;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0x60;
        element->unk28[0].unk0 = -1;

        transformer->unk0 = 0;
        transformer->unk2 = scene->unk340;
        transformer->unk4 = scene->unk340;
        transformer->unk6[0] = element->x;
        transformer->unk6[1] = element->y;

        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        Sprite *element;
        element = &scene->unk260[i];
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[0x24 + i].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[36].anim;
        element->variant = gUnknown_080E17A4[36].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0xC0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    for (i = 0; i < 2; i++) {
        Sprite *element;
        element = &scene->unk2C0[i];
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[0x26 + i].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[38].anim;
        element->variant = gUnknown_080E17A4[38].variant;
        element->unk21 = 0xFF;
        element->x = 30;
        element->y = 30;
        element->unk1A = 0xC0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        element = &scene->unk1A0;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[35].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[35].anim;
        element->variant = gUnknown_080E17A4[35].variant;
        element->unk21 = 0xFF;
        element->x = 0;
        element->y = 30;
        element->unk1A = 0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        element = &scene->unk1D0;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[40].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[40].anim;
        element->variant = gUnknown_080E17A4[40].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = -20;
        element->unk1A = 0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        element = &scene->unk200;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[41].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[41].anim;
        element->variant = gUnknown_080E17A4[41].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = DISPLAY_HEIGHT + 96;
        element->unk1A = 0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        element = &scene->unk230;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += gUnknown_080E17A4[42].numTiles * 0x20;
        element->graphics.anim = gUnknown_080E17A4[42].anim;
        element->variant = gUnknown_080E17A4[42].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = DISPLAY_HEIGHT + 96;
        element->unk1A = 0;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Sprite *element;
        element = &scene->unkE0;
        element->graphics.dest = (void *)scene->unk618;
        scene->unk618 += 0x1500;
        element->graphics.anim = gUnknown_080E17A4[gSelectedCharacter + 0x19].anim;
        element->variant = gUnknown_080E17A4[gSelectedCharacter + 0x19].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = 0;
        element->unk1A = 0x40;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 1;
        element->unk10 = 0;
        element->unk28[0].unk0 = -1;
        sub_8004558(element);
    }

    {
        Background *background;
        background = &scene->unk40;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        background->graphics.anim = 0;
        background->tilesVram = (void *)BG_SCREEN_ADDR(28);
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
        Background *background;
        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->tilesVram = (void *)BG_SCREEN_ADDR(24);
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

    if (!(gLoadedSaveGame->chaosEmeralds[gSelectedCharacter]
          & CHAOS_EMERALDS_COMPLETED)) {
        memcpy(unk1AF4, gUnknown_080E1AF4, 0x20);
        DmaCopy32(3, unk1AF4, &gBgPalette[0x20], 0x20);
    }
}

void sub_8093FA0(struct FinalEndingLandCutScene *);
void sub_8093FF0(struct FinalEndingLandCutScene *);
void sub_80934B8(struct FinalEndingLandCutScene *);
void sub_8093638(struct FinalEndingLandCutScene *);
void sub_8093740(struct FinalEndingLandCutScene *);
void sub_809401C(struct FinalEndingLandCutScene *);
void sub_8094044(struct FinalEndingLandCutScene *);
void sub_8094060(struct FinalEndingLandCutScene *);
void sub_80940BC(struct FinalEndingLandCutScene *);
void sub_8093868(struct FinalEndingLandCutScene *);
void sub_8093F54(void);

void sub_80932C8(void)
{
    struct FinalEndingLandCutScene *scene = TaskGetStructPtr(gCurTask);
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

void sub_809334C(void)
{
    struct FinalEndingLandCutScene *scene = TaskGetStructPtr(gCurTask);

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

void sub_80934B8(struct FinalEndingLandCutScene *scene)
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

void sub_8093638(struct FinalEndingLandCutScene *scene)
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

void sub_8093740(struct FinalEndingLandCutScene *scene)
{
    u8 i;
    for (i = 0; i < (0xD - (scene->unk33C >> 1)); i++) {
        s32 sin, temp, unused;
        if (scene->unk4DC[i][1] == ((0xBE - gBgScrollRegs[1][1]) * 0x100)) {
            if (PseudoRandom32() < 0) {
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

        scene->unk4DC[i][1] = temp - (sin * 8);
    }
}

void sub_8093868(struct FinalEndingLandCutScene *scene)
{
    u8 i;
    struct UNK_808D124_UNK180 *transformer;
    Sprite *element = NULL;

    transformer = &scene->unk320;

    if ((gSelectedCharacter == 1 && scene->unk338 < 5)
        || (gSelectedCharacter != 1 && scene->unk338 < 4)) {
        element = &scene->unk80;

        if (scene->unk338 < 3) {
            element->graphics.anim = gUnknown_080E17A4[gUnknown_080E1C48[scene->unk338]
                                                       + gSelectedCharacter]
                                         .anim;
            element->variant = gUnknown_080E17A4[gUnknown_080E1C48[scene->unk338]
                                                 + gSelectedCharacter]
                                   .variant;
        } else if (gSelectedCharacter == 1 && scene->unk338 < 5) {
            element->graphics.anim
                = gUnknown_080E17A4[gUnknown_080E1C4E[scene->unk338]].anim;
            element->variant
                = gUnknown_080E17A4[gUnknown_080E1C4E[scene->unk338]].variant;

        } else if (gSelectedCharacter == 1) {
            element->graphics.anim = gUnknown_080E17A4[gUnknown_080E1C4E[scene->unk338]
                                                       + gSelectedCharacter]
                                         .anim;
            element->variant = gUnknown_080E17A4[gUnknown_080E1C4E[scene->unk338]
                                                 + gSelectedCharacter]
                                   .variant;
        } else {
            element->graphics.anim = gUnknown_080E17A4[gUnknown_080E1C48[scene->unk338]
                                                       + gSelectedCharacter]
                                         .anim;
            element->variant = gUnknown_080E17A4[gUnknown_080E1C48[scene->unk338]
                                                 + gSelectedCharacter]
                                   .variant;
        }
        element->x = scene->unk5E0[0][0] >> 8;
        element->y = scene->unk5E0[0][1] >> 8;
    }

    if ((gSelectedCharacter != 1 && scene->unk338 == 4)
        || (gSelectedCharacter == 1 && scene->unk338 == 5)) {
        element = &scene->unkB0;

        element->x = scene->unk5E0[0][0] >> 8;
        element->y = scene->unk5E0[0][1] >> 8;

        transformer->unk2 = scene->unk340;
        transformer->unk4 = scene->unk340;
        transformer->unk6[0] = element->x;
        transformer->unk6[1] = element->y;
        sub_8004860(element, transformer);
    }

    sub_8004558(element);
    sub_80051E8(element);

    if ((gSelectedCharacter != 1 && scene->unk338 > 4)
        || (gSelectedCharacter == 1 && scene->unk338 > 5)) {
        element = &scene->unkE0;
        if (gSelectedCharacter != 1) {
            element->graphics.anim
                = gUnknown_080E17A4[gUnknown_080E1C48[5] + gSelectedCharacter].anim;
            element->variant
                = gUnknown_080E17A4[gUnknown_080E1C48[5] + gSelectedCharacter].variant;
        } else {
            element->graphics.anim
                = gUnknown_080E17A4[gUnknown_080E1C4E[6] + gSelectedCharacter].anim;
            element->variant
                = gUnknown_080E17A4[gUnknown_080E1C4E[6] + gSelectedCharacter].variant;
        }
        element->x = scene->unk5E0[0][0] >> 8;
        element->y = scene->unk5E0[0][1] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (scene->unk338 != 0 && scene->unk33D == 0) {
        element = &scene->unk1A0;
        element->graphics.anim = gUnknown_080E17A4[35].anim;
        element->variant = gUnknown_080E17A4[35].variant;
        element->unk10 |= 0x400;
        element->x = scene->unk80.x;
        element->y = scene->unk80.y + 0x19;
        sub_80051E8(element);

        element->unk10 &= ~0x400;
        element->x = scene->unk80.x;
        element->y = scene->unk80.y + 0x19;

        if (sub_8004558(element) != 1) {
            scene->unk33D = 1;
        }

        sub_80051E8(element);
    }

    for (i = 0; i < (0x14 - scene->unk33C); i++) {
        element = &scene->unk260[i & 1];
        element->graphics.anim = gUnknown_080E17A4[(i & 1) + 0x24].anim;
        element->variant = gUnknown_080E17A4[(i & 1) + 0x24].variant;

        if (scene->unk34C[i][4] != 0) {
            element->unk10 |= 0x400;
        } else {
            element->unk10 &= ~0x400;
        }

        element->x = gUnknown_080E1964[i][3] + (scene->unk34C[i][0] >> 8);
        element->y = (gUnknown_080E1964[i][4] - gBgScrollRegs[1][1])
            + (scene->unk34C[i][1] >> 8);

        sub_8004558(element);
        sub_80051E8(element);
    }

    for (i = 0; i < (0xD - (scene->unk33C >> 1)); i++) {
        element = &scene->unk2C0[i & 1];
        element->graphics.anim = gUnknown_080E17A4[(i & 1) + 0x26].anim;
        element->variant = gUnknown_080E17A4[(i & 1) + 0x26].variant;

        if (scene->unk4DC[i][4] > 0) {
            element->unk10 |= 0x400;
        } else {
            element->unk10 &= ~0x400;
        }

        element->x = scene->unk4DC[i][0] >> 8;
        element->y = scene->unk4DC[i][1] >> 8;

        sub_8004558(element);
        sub_80051E8(element);
    }

    if (scene->unk34A >= 1) {
        element = &scene->unk1D0;
        element->graphics.anim = gUnknown_080E17A4[40].anim;
        element->variant = gUnknown_080E17A4[40].variant;
        element->x = scene->unk5E0[0][4];
        element->y = scene->unk5E0[0][5] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
        scene->unk34A--;
    } else {
        if ((u16)(scene->unk34A + 0x1D) < 0x1E) {
            scene->unk34A--;
        } else if (scene->unk34A <= -0x1E) {
            scene->unk34A = 0x32;
        }
    }

    if ((gSelectedCharacter == 1 && scene->unk338 > 5)
        || (gSelectedCharacter != 1 && scene->unk338 > 4)) {
        element = &scene->unk200;
        element->graphics.anim = gUnknown_080E17A4[41].anim;
        element->variant = gUnknown_080E17A4[41].variant;
        element->x = scene->unk5E0[0][6];
        element->y = scene->unk5E0[0][7] >> 8;
        sub_8004558(element);
        sub_80051E8(element);

        element = &scene->unk230;
        element->graphics.anim = gUnknown_080E17A4[42].anim;
        element->variant = gUnknown_080E17A4[42].variant;
        element->x = scene->unk5E0[0][8];
        element->y = scene->unk5E0[0][9] >> 8;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (gSelectedCharacter == 1) {
        element = &scene->unk110;
        element->graphics.anim
            = gUnknown_080E17A4[gUnknown_080E1C55[scene->unk33A]].anim;
        element->variant = gUnknown_080E17A4[gUnknown_080E1C55[scene->unk33A]].variant;
        element->x = scene->unk5E0[0][2];
        element->y = scene->unk5E0[0][3] >> 8;
        sub_8004558(element);
        sub_80051E8(element);

        if (scene->unk338 < 6) {
            element = &scene->unk140;
            element->graphics.anim = gUnknown_080E17A4[0x2B + scene->unk338].anim;
            element->variant = gUnknown_080E17A4[0x2B + scene->unk338].variant;
            element->unk10 |= 0x400;
            element->x = ((scene->unk5E0[0][0] >> 8) - 0x14);
            element->y = (scene->unk5E0[0][1] >> 8) - 0x14;
        } else {
            element = &scene->unk170;
            element->graphics.anim = gUnknown_080E17A4[49].anim;
            element->variant = gUnknown_080E17A4[49].variant;
            element->unk10 &= ~0x400;
            element->x = scene->unk5E0[0][0] >> 8;
            element->y = scene->unk5E0[0][1] >> 8;
        }
        sub_8004558(element);
        sub_80051E8(element);
    }
}

void sub_8093EDC(void)
{
    struct FinalEndingLandCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unk32C;

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

    if (sub_802D4CC(&scene->unk32C) == 1) {
        transitionConfig->unk4 = 0;
        gCurTask->main = sub_809334C;
    }
}

void sub_8093F54(void)
{
    struct FinalEndingLandCutScene *scene = TaskGetStructPtr(gCurTask);
    if (scene->unk344 != 0) {
        if (scene->unk344-- == 0x3D) {
            m4aSongNumStart(MUS_STAFF_CREDITS);
        }
    } else {
        CreateCreditsCutScene(CREDITS_VARIANT_FINAL_ENDING, 0, 0);
        TaskDestroy(gCurTask);
    }
}

void sub_8093F9C(UNUSED struct Task *t)
{
    // unused logic
}

void sub_8093FA0(struct FinalEndingLandCutScene *scene)
{
    if (gBgScrollRegs[0][1] < 0x4C) {
        scene->unk5E0[6][1] += 0x300;
    } else {
        scene->unk5E0[6][1] += 0x180;
    }

    if (gBgScrollRegs[0][1] < 0x60) {
        gBgScrollRegs[0][1] = scene->unk5E0[6][1] >> 8;
    }
}

void sub_8093FF0(struct FinalEndingLandCutScene *scene)
{
    scene->unk5E0[5][1] += 0x180;
    if (gBgScrollRegs[1][1] < 0x42) {
        gBgScrollRegs[1][1] = scene->unk5E0[5][1] >> 8;
    }
}

void sub_809401C(struct FinalEndingLandCutScene *scene)
{
    scene->unk5E0[1][0] = 0x78;
    scene->unk5E0[1][1] = (0xC2 - gBgScrollRegs[1][1]) * 0x100;
}

void sub_8094044(struct FinalEndingLandCutScene *scene)
{
    scene->unk5E0[2][0] = 0x78;
    scene->unk5E0[2][1] = 0xA00;
}

void sub_8094060(struct FinalEndingLandCutScene *scene)
{
    if ((gSelectedCharacter != 1 && scene->unk338 == 5)
        || (gSelectedCharacter == 1 && scene->unk338 == 6)) {
        scene->unk5E0[3][0] = 0x78;
        if (scene->unk5E0[3][1] > 0x8200) {
            scene->unk5E0[3][1] -= 0x300;
        }
    }
}

void sub_80940BC(struct FinalEndingLandCutScene *scene)
{
    if ((gSelectedCharacter != 1 && scene->unk338 == 5)
        || (gSelectedCharacter == 1 && scene->unk338 == 6)) {
        scene->unk5E0[4][0] = 0x78;
        if (scene->unk5E0[4][1] > 0x9600) {
            scene->unk5E0[4][1] -= 0x300;
        }
    }
}
