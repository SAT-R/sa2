#include "global.h"
#include "cut_scenes_missing_emeralds.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "m4a.h"
#include "save.h"
#include "title_screen.h"

#include "constants/animations.h"
#include "constants/songs.h"

void sub_8094360(void);
void sub_80945A0(struct Task *);

struct MissingChaosEmaraldsCutScene {
    Background unk0;
    Background unk40;
    Sprite unk80;
    struct UNK_802D4CC_UNK270 unkB0;

    u8 unkBC;
    u8 unkBD;
    u8 unkBE;
    s8 unkBF;

    u32 unkC0;
    vu32 unkC4;
};

static const u16 gUnknown_080E1C5C[34] = {
    175, 176, 178, 177, 180, 179, 181, 181, 182, 184, 183, 186, 185, 187, 187, 188, 190,
    189, 192, 191, 193, 193, 194, 196, 195, 198, 197, 199, 199, 200, 202, 201, 204, 203,
};

static const TileInfo gUnknown_080E1CA0[3] = {
    { 48, 1075, 0 },
    { 63, 810, 0 },
    { 80, 810, 1 },
};

void CreateMissingChaosEmaraldsCutScene(void)
{
    u8 i;
    struct Task *t;
    struct MissingChaosEmaraldsCutScene *scene = NULL;
    struct UNK_802D4CC_UNK270 *transitionConfig = NULL;

    gDispCnt = 0x1040;
    gBgCntRegs[0] = 0x1e03;
    gBgCntRegs[1] = 0x1c05;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0xff;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);

    t = TaskCreate(sub_8094360, 0xC8, 0x3100, 0, sub_80945A0);
    scene = TaskGetStructPtr(t);

    scene->unkBC = 0;
    scene->unkC0 = 0xF0;
    scene->unkBD = 0;
    scene->unkBF = 0xFF;
    scene->unkBE = 0;
    scene->unkBF = gLoadedSaveGame->language;

    if (gLoadedSaveGame->chaosEmeralds[gSelectedCharacter] & CHAOS_EMERALDS_COMPLETED) {
        scene->unkBC = 1;
        for (i = 0; i < 4; i++) {
            if (gLoadedSaveGame->completedCharacters[i]) {
                scene->unkBD++;
            }
        }
    }
    m4aMPlayAllStop();

    if (scene->unkBD == 0) {
        m4aSongNumStart(MUS_MESSAGE);
    } else {
        m4aSongNumStart(MUS_MESSAGE_2);
    }
    transitionConfig = &scene->unkB0;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk6 = 0x80;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    scene->unkC4 = OBJ_VRAM0;

    {
        Sprite *element;
        element = &scene->unk80;
        element->graphics.dest = (void *)OBJ_VRAM0;
        if (scene->unkBD < 4) {
            scene->unkC4 += gUnknown_080E1CA0[0].numTiles * 0x20;
            element->graphics.anim = gUnknown_080E1CA0[0].anim;
            element->variant = gUnknown_080E1CA0[0].variant;
            element->y = 85;
        } else {
            scene->unkC4 += 0xA00;
            element->graphics.anim = gUnknown_080E1CA0[1].anim;
            element->variant = gUnknown_080E1CA0[1].variant;
            element->y = 90;
        }
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
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
        Background *background;
        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        background->graphics.anim = 0;
        background->tilesVram = (void *)BG_SCREEN_ADDR(30);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        background->unk28 = 0x14;
        background->unk2A = 0;
        background->unk2E = 0;
    }
    {
        Background *background;
        background = &scene->unk40;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->tilesVram = (void *)BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->unk26 = 0x1E;
        if (scene->unkBD != 0) {
            background->unk28 = 7;
        } else {
            background->unk28 = 6;
        }
        background->unk2A = 0;
        background->unk2E = 1;
    }
}

void sub_809449C(void);

void sub_8094360(void)
{
    Background *background = NULL;
    struct MissingChaosEmaraldsCutScene *scene = TaskGetStructPtr(gCurTask);

    if (scene->unkBD == 0) {
        if (scene->unkBF > 1) {
            gDispCnt |= 0x200;
            gBgScrollRegs[1][0] = 0;
            gBgScrollRegs[1][1] = 400;
            background = &scene->unk40;
            background->unk1C = gUnknown_080E1C5C[scene->unkBF - 1];
            sub_8002A3C(background);
        }

        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        background = &scene->unk0;
        background->unk1C = gUnknown_080E1C5C[0];
        sub_8002A3C(background);
    } else {
        s32 base;
        u16 index;
        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        background = &scene->unk0;
        background->unk1C = gUnknown_080E1C5C[7];
        sub_8002A3C(background);

        if (scene->unkBD > 1 || scene->unkBF > 1) {
            gDispCnt |= 0x200;
            gBgScrollRegs[1][0] = 0;
            gBgScrollRegs[1][1] = 0xA0;

            background = &scene->unk40;
            base = scene->unkBF;
            index = (base + 6 + ((scene->unkBD - 1) * 7));
            background->unk1C = gUnknown_080E1C5C[index];
            sub_8002A3C(background);
        }
    }

    gCurTask->main = sub_809449C;
}

void sub_80945A4(struct MissingChaosEmaraldsCutScene *scene);
void sub_8094530(void);

void sub_809449C(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unkB0;
    transitionConfig->unk2 = 2;

    sub_80945A4(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;
        scene->unkBE = 1;
        gCurTask->main = sub_8094530;
    }
}

void sub_8094570(void);

void sub_80944EC(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270 *transitionConfig = &scene->unkB0;
    transitionConfig->unk2 = 1;

    sub_80945A4(scene);

    if (sub_802D4CC(transitionConfig) == 1) {
        transitionConfig->unk4 = 0;

        gCurTask->main = sub_8094570;
    }
}

void sub_8094530(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TaskGetStructPtr(gCurTask);
    sub_80945A4(scene);
    if (scene->unkC0 != 0) {
        scene->unkC0--;
    } else {
        scene->unkC0 = 0xB4;
        gCurTask->main = sub_80944EC;
    }
}

void sub_8094570(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TaskGetStructPtr(gCurTask);
    if (scene->unkC0 != 0) {
        scene->unkC0--;
    } else {
        CreateTitleScreen();
        TaskDestroy(gCurTask);
    }
}

void sub_80945A0(struct Task *t)
{
    // unused logic
}

void sub_80945A4(struct MissingChaosEmaraldsCutScene *scene)
{
    if (scene->unkBD != 0) {
        Sprite *element = &scene->unk80;
        if (scene->unkBD > 3 && scene->unkBE != 0) {
            element->graphics.anim = gUnknown_080E1CA0[2].anim;
            element->variant = gUnknown_080E1CA0[2].variant;
        }
        sub_8004558(element);
        sub_80051E8(element);
    }
}
