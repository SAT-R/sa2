#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "constants/sa1/ui_graphics.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/stage/spot_light_beam_task.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"

#define INTRO_SPOTLIGHT_COUNT 2

#define EMERALD_START_X DISPLAY_CENTER_X
#define EMERALD_START_Y -36
typedef struct IntroSprite {
    Sprite s;
    u16 unk30;
    u8 unk32;
    s32 unk34;
    s32 qUnk38;
    s32 qUnk3C;
    s32 qUnk40;
} IntroSprite; /* 0x44 */

typedef struct Intro_C8 {
    Sprite sprites[3];
    u8 filler60[0x24];
    u16 unkB4;
    u8 fillerB6[0x12];
} Intro_C8; /* 0xC8 */

typedef struct Intro_54 {
    StrcUi_805423C strc0;
    struct Task *taskC;
    struct Task *beamTasks[INTRO_SPOTLIGHT_COUNT]; // -> SpotlightBeam
    struct Task *tasks18[NUM_CHARACTERS]; // -> Intro_C8
    u8 filler28[0x24];
    s16 unk4C;
    u8 unk4E;
    u16 unk50;
    u16 unk52;
} Intro_54; /* 0x54 */

void Task_IntroChaosEmeraldUpdate(void);
void sub_8063B8C(void);
void sub_8063C4C(void);
void sub_8063D0C(void);
void sub_8063DCC(void);
void sub_8063E8C(u16 arg0);
void Task_80640C8(void);
void sub_8064244(void);
void sub_80645E4(void);
void sub_80648D4(void);
void sub_8064BB4(void);
void sub_8064E84(void);
void IntroOpenTitlescreenSilent(void);
void IntroOpenTitlescreenPlayMusic(void);
void Task_8065058(void);
void Task_806515C(void);
void Task_RenderSonic(void);
void Task_IntroRenderTails(void);
void Task_IntroRenderKnuckles(void);
void Task_IntroRenderAmy(void);
void Task_806562C(void);
void sub_80656A4(void);
void sub_806571C(void);
void sub_8065794(void);
void TaskDestructor_8065810(struct Task *t);

extern u16 gUnknown_086B1AB4[16][16];
extern u8 gUnknown_086B1CB4[0x540];
extern u8 gUnknown_086B21F4[0x800];
extern u16 gUnknown_086B29F4[256];
extern u8 gUnknown_086B2BF4[0x1E00];
extern u8 gUnknown_086B49F4[0x800];
extern u16 gUnknown_086B51F4[16][16];
extern u8 gUnknown_086B53F4[0x1B80];

extern u8 gUnknown_086B6F74[0x800];
extern u16 gUnknown_086B7774[256];
extern u8 gUnknown_086B7974[0x1880];

extern u8 gUnknown_086B91F4[0x800];
extern u16 gUnknown_086B99F4[256];
extern u8 gUnknown_086B9BF4[0x1840];
extern u16 gUnknown_086B1B14[16];
extern u8 gUnknown_086BB434[0x800];

extern u16 gUnknown_086A5D34[256];
extern u8 gUnknown_086A5F34[0x2E00];
extern u8 gUnknown_086A8E34[1];

extern u8 gUnknown_086A9834[0x2840];
extern u8 gUnknown_086AC074[0x8C0];

extern u8 gUnknown_086B13F4[0x6C0];
extern u8 gUnknown_086AFFB4[0x1440];

extern u8 gUnknown_086ACB34[0x2840];
extern u8 gUnknown_086AF4F4[0x8C0];

const s16 gUnknown_0868B27C[2] = { 0x14, 0x70 };
const s16 gUnknown_0868B280[2] = { 0x5C, 0x5A };
const s16 gUnknown_0868B284[2] = { 0x58, 0x70 };
const s16 gUnknown_0868B288[2] = { 0x1C, 0x5A };
// TODO: This struct already appeared somewhere else. Merge them!
typedef struct LocalTileInfo {
    u32 anim;
    u32 variant;
    void *vram;
} LocalTileInfo;
const LocalTileInfo gUnknown_0868B28C[6] = {
    { SA1_ANIM_INTRO_TEXTS_SONIC, 0, OBJ_VRAM0 + 0x2840 }, //
    { SA1_ANIM_INTRO_TEXTS_SONIC, 1, OBJ_VRAM0 + 0x2B40 }, //
    { SA1_ANIM_INTRO_TEXTS_SONIC, 2, OBJ_VRAM0 + 0x2F40 }, //
    { SA1_ANIM_INTRO_TEXTS_SONIC, 3, OBJ_VRAM0 + 0x3240 }, //
    { SA1_ANIM_INTRO_TEXTS_SONIC, 4, OBJ_VRAM0 + 0x3440 }, //
    { SA1_ANIM_INTRO_TEXTS_SONIC, 5, OBJ_VRAM0 + 0x3740 }, //
};
const LocalTileInfo gUnknown_0868B2D4[6] = {
    { SA1_ANIM_INTRO_TEXTS_TAILS, 0, OBJ_VRAM0 + 0x6440 }, //
    { SA1_ANIM_INTRO_TEXTS_TAILS, 1, OBJ_VRAM0 + 0x6740 }, //
    { SA1_ANIM_INTRO_TEXTS_TAILS, 2, OBJ_VRAM0 + 0x6B40 }, //
    { SA1_ANIM_INTRO_TEXTS_TAILS, 3, OBJ_VRAM0 + 0x6D40 }, //
    { SA1_ANIM_INTRO_TEXTS_TAILS, 4, OBJ_VRAM0 + 0x7040 }, //
    { SA1_ANIM_INTRO_TEXTS_TAILS, 5, OBJ_VRAM0 + 0x7440 }, //
};
const LocalTileInfo gUnknown_0868B31C[9] = {
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        0,
        OBJ_VRAM0 + 0x6440,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        1,
        OBJ_VRAM0 + 0x6640,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        2,
        OBJ_VRAM0 + 0x6840,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        3,
        OBJ_VRAM0 + 0x6B40,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        4,
        OBJ_VRAM0 + 0x6E40,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        5,
        OBJ_VRAM0 + 0x7140,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        6,
        OBJ_VRAM0 + 0x7440,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        7,
        OBJ_VRAM0 + 0x7640,
    },
    {
        SA1_ANIM_INTRO_TEXTS_KNUCKLES,
        8,
        OBJ_VRAM0 + 0x7840,
    },
};
const LocalTileInfo gUnknown_0868B388[4] = {
    {
        SA1_ANIM_INTRO_TEXTS_AMY,
        0,
        OBJ_VRAM0 + 0x2840,
    }, //
    {
        SA1_ANIM_INTRO_TEXTS_AMY,
        1,
        OBJ_VRAM0 + 0x2D40,
    }, //
    {
        SA1_ANIM_INTRO_TEXTS_AMY,
        2,
        OBJ_VRAM0 + 0x3240,
    }, //
    {
        SA1_ANIM_INTRO_TEXTS_AMY,
        3,
        OBJ_VRAM0 + 0x3740,
    }, //
};

const u16 gUnknown_0868B3B8[2][2] = { { SA1_ANIM_INTRO_CHARACTERS, 0 }, { SA1_ANIM_INTRO_CHARACTERS, 1 } };

const u16 gUnknown_0868B3C0[2][2] = { { SA1_ANIM_INTRO_CHARACTERS, 2 }, { SA1_ANIM_INTRO_CHARACTERS, 3 } };

const u16 gUnknown_0868B3C8[2][2] = { { SA1_ANIM_INTRO_CHARACTERS, 4 }, { SA1_ANIM_INTRO_CHARACTERS, 5 } };

const u16 gUnknown_0868B3D0[2][2] = { { SA1_ANIM_INTRO_CHARACTERS, 6 }, { SA1_ANIM_INTRO_CHARACTERS, 7 } };

void CreateIntroAnimation(void)
{
    s32 temp_r0_2;
    s32 temp_r1;
    s32 temp_r6;
    s32 temp_r6_2;
    u16 temp_r2;
    u16 temp_r3;
    u16 temp_r5;
    u8 i;
    struct Task *t, *t2;
    Sprite *s;
    IntroSprite *emerald;
    IntroSprite *introSpr;
    Intro_54 *strc54;
    StrcUi_805423C *strc0;
    s32 qVal;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();
    sub_80535FC();

    UiGfxStackInit();
    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    gBgCntRegs[0] = 0x9D86;
    gBgCntRegs[1] = 0x1B8B;
    gBgCntRegs[2] = 0x9880;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    t = TaskCreate(Task_IntroChaosEmeraldUpdate, sizeof(IntroSprite), 0x2120U, 0U, NULL);
    emerald = TASK_DATA(t);
    s = &emerald->s;
    emerald->unk30 = 0;
    qVal = -Q(36);
    emerald->unk34 = 0;
    emerald->qUnk38 = qVal;
    emerald->qUnk3C = qVal;
    emerald->qUnk40 = Q(2.25);
    s->graphics.dest = OBJ_VRAM0 + 0x20;
    s->graphics.anim = SA1_ANIM_INTRO_EMERALD;
    s->variant = 0;
    s->x = EMERALD_START_X;
    s->y = EMERALD_START_Y;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 8; i++) {
        s32 chunkOffset;
        t2 = TaskCreate(Task_8065058, sizeof(IntroSprite), (i * 2) | 0x6800, 0U, NULL);
        introSpr = TASK_DATA(t2);
        s = &introSpr->s;
        introSpr->unk30 = (0x2F - (i * 6));
        introSpr->unk32 = i;
        introSpr->unk34 = introSpr->unk30;
        introSpr->qUnk38 = qVal;
        introSpr->qUnk3C = qVal;
        introSpr->qUnk40 = Q(2.25);
        chunkOffset = (i * (4 * TILE_SIZE_4BPP));
        s->graphics.dest = (chunkOffset + OBJ_VRAM0 + (31 * TILE_SIZE_4BPP));
        s->graphics.anim = SA1_ANIM_SUPER_SONIC_SPARKLE;
        s->variant = 0;
        s->x = EMERALD_START_X + Div(SIN(i << 6), 650);
        s->y = EMERALD_START_Y;
        s->oamFlags = 0;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
    }

    t2 = TaskCreate(Task_80640C8, sizeof(Intro_54), 0x2100U, 0U, TaskDestructor_8065810);
    strc54 = TASK_DATA(t2);
    strc54->unk4C = 0;
    strc54->unk4E = 1;
    strc54->taskC = t;
    strc54->beamTasks[0] = NULL;
    strc54->beamTasks[1] = NULL;
    strc54->tasks18[CHARACTER_SONIC] = NULL;
    strc54->tasks18[CHARACTER_TAILS] = NULL;
    strc54->tasks18[CHARACTER_KNUCKLES] = NULL;
    strc54->tasks18[CHARACTER_AMY] = NULL;
    strc54->unk50 = 0;
    strc54->unk52 = 0;

    strc54->strc0.unk0 = 0;
    strc54->strc0.unk2 = 1;
    strc54->strc0.unk4 = 2;
    strc54->strc0.unk6 = 0;
    strc54->strc0.unk8 = 0x80;
    strc54->strc0.unkA = 1;
    sub_805423C(&strc54->strc0);
    m4aSongNumStart(1U);
}

void sub_8063B8C(void)
{
    Strc_80528AC gfx;
    s8 *temp_r6;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086B1CB4[0];
    gfx.tilesSize = sizeof(gUnknown_086B1CB4);
    gfx.palette = &gUnknown_086B1AB4[0][0];
    gfx.paletteSize = sizeof(gUnknown_086B1AB4);
    gfx.layout = &gUnknown_086B21F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B21F4);
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = &gUnknown_086B2BF4[0];
    gfx.tilesSize = sizeof(gUnknown_086B2BF4);
    gfx.palette = &gUnknown_086B29F4[0];
    gfx.paletteSize = sizeof(gUnknown_086B29F4);
    gfx.layout = &gUnknown_086B49F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B49F4);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x11;
    sub_80528AC(&gfx);
}

void sub_8063C4C(void)
{
    Strc_80528AC gfx;
    s8 *temp_r6;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086B1CB4[0];
    gfx.tilesSize = sizeof(gUnknown_086B1CB4);
    gfx.palette = &gUnknown_086B1AB4[1][0];
    gfx.paletteSize = sizeof(gUnknown_086B1AB4[1]);
    gfx.layout = &gUnknown_086B21F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B21F4);
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x14;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = &gUnknown_086B53F4[0];
    gfx.tilesSize = sizeof(gUnknown_086B53F4);
    gfx.palette = &gUnknown_086B51F4[0][0];
    gfx.paletteSize = sizeof(gUnknown_086B51F4);
    gfx.layout = &gUnknown_086B6F74[0];
    gfx.layoutSize = sizeof(gUnknown_086B6F74);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x11;
    sub_80528AC(&gfx);
}

void sub_8063D0C(void)
{
    Strc_80528AC gfx;
    s8 *temp_r6;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086B1CB4[0];
    gfx.tilesSize = sizeof(gUnknown_086B1CB4);
    gfx.palette = &gUnknown_086B1AB4[2][0];
    gfx.paletteSize = sizeof(gUnknown_086B1AB4[2]);
    gfx.layout = &gUnknown_086B21F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B21F4);
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x14;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = &gUnknown_086B7974[0];
    gfx.tilesSize = sizeof(gUnknown_086B7974);
    gfx.palette = &gUnknown_086B7774[0];
    gfx.paletteSize = sizeof(gUnknown_086B7774);
    gfx.layout = &gUnknown_086B91F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B91F4);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x11;
    sub_80528AC(&gfx);
}

void sub_8063DCC(void)
{
    Strc_80528AC gfx;
    s8 *temp_r6;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086B1CB4[0];
    gfx.tilesSize = sizeof(gUnknown_086B1CB4);
    gfx.palette = &gUnknown_086B1B14[0];
    gfx.paletteSize = sizeof(gUnknown_086B1B14);
    gfx.layout = &gUnknown_086B21F4[0];
    gfx.layoutSize = sizeof(gUnknown_086B21F4);
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x14;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = &gUnknown_086B9BF4[0];
    gfx.tilesSize = sizeof(gUnknown_086B9BF4);
    gfx.palette = &gUnknown_086B99F4[0];
    gfx.paletteSize = sizeof(gUnknown_086B99F4);
    gfx.layout = &gUnknown_086BB434[0];
    gfx.layoutSize = sizeof(gUnknown_086BB434);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x11;
    sub_80528AC(&gfx);
}

void sub_8063E8C(u16 arg0)
{
    Strc_80528AC gfx;
    s32 temp_r1;
    s32 temp_r1_2;
    s32 temp_r1_3;
    s32 chunkOffset;
    s32 var_r1;
    s8 var_r0;
    u16 temp_r6;
    s32 qVal;
    u8 i;
    struct Task *t;
    IntroSprite *introSpr;
    Sprite *s;

    if (arg0 == 0) {
        for (i = 0; i < 8; i++) {
            t = TaskCreate(Task_806515C, sizeof(IntroSprite), (i * 2) | 0x6801, 0U, NULL);
            introSpr = TASK_DATA(t);
            introSpr->unk30 = (u16)(i * 6);
            introSpr->unk32 = i;
            qVal = -Q(36);
            introSpr->unk34 = (s32)introSpr->unk30;
            introSpr->qUnk38 = qVal;
            introSpr->qUnk3C = qVal;
            introSpr->qUnk40 = Q(2.25);

            s = &introSpr->s;
            chunkOffset = (i * (4 * TILE_SIZE_4BPP));
            s->graphics.dest = (OBJ_VRAM0 + 0xBE0 + chunkOffset);
            s->graphics.anim = SA1_ANIM_SUPER_SONIC_SPARKLE;
            s->variant = 1;
            s->x = (Div(SIN(i << 6), 650) + 120);
            s->y = -36;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x1000;
            UpdateSpriteAnimation((Sprite *)s);
        }
    } else if (arg0 == 1) {
        gDispCnt = 0x1240;
        gfx.uiGfxID = 0x80;
        gfx.unk2B = 0;
        gfx.tiles = &gUnknown_086A5F34[0];
        gfx.tilesSize = 0x2F00;
        gfx.palette = &gUnknown_086A5D34[0];
        gfx.paletteSize = 0x200;
        gfx.layout = &gUnknown_086A8E34[0];
        gfx.layoutSize = 0x800;
        gfx.unk28 = 0;
        gfx.unk29 = 1;
        gfx.unk2A = 0x15;
        sub_80528AC(&gfx);
    } else if (arg0 == 2) {
        gDispCnt = 0x1340;
        gfx.uiGfxID = 0x80;
        gfx.unk2B = 1;
        gfx.tiles = &gUnknown_086A9834[0];
        gfx.tilesSize = sizeof(gUnknown_086A9834);
        gfx.layout = &gUnknown_086AC074[0];
        gfx.layoutSize = sizeof(gUnknown_086AC074);
        gfx.unk28 = 0;
        gfx.unk29 = 0;
        gfx.unk2A = 0x11;
        sub_80528AC(&gfx);
    } else if (arg0 == 3) {
        gDispCnt = 0x1740;
        gfx.uiGfxID = 0x80;
        gfx.unk2B = 0;
        gfx.tiles = &gUnknown_086AFFB4[0];
        gfx.tilesSize = sizeof(gUnknown_086AFFB4);
        gfx.layout = &gUnknown_086B13F4[0];
        gfx.layoutSize = sizeof(gUnknown_086B13F4);
        gfx.unk28 = 0;
        gfx.unk29 = 2;
        gfx.unk2A = 0x11;
        sub_80528AC(&gfx);
    } else if (arg0 == 310) {
        gfx.uiGfxID = 0x80;
        gfx.unk2B = 1;
        gfx.tiles = &gUnknown_086ACB34[0];
        gfx.tilesSize = sizeof(gUnknown_086ACB34);
        gfx.layout = &gUnknown_086AF4F4[0];
        gfx.layoutSize = sizeof(gUnknown_086AF4F4);
        gfx.unk28 = 0;
        gfx.unk29 = 0;
        gfx.unk2A = 0x11;
        sub_80528AC(&gfx);
    }
}

static inline u32 maskColor(u32 c) { return Div(c, 40) & 0x1F; }

static inline u32 maskRedColor(u32 c)
{
#ifndef NON_MATCHING
    u32 result;
    asm("mov %0, #0x1F\n"
        "and %0, %1\n"
        : "=r"(result)
        : "r"(c));
    return result;
#else
    return (c % 32u);
#endif
}

// (99.14%) https://decomp.me/scratch/gBBjz
NONMATCH("asm/non_matching/game/sa1/intro_anim__Task_80640C8.inc", void Task_80640C8())
{
    s16 *temp_r2;
    s16 temp_r0;
    s16 temp_r0_3;
    u32 r, g, b;
    u16 temp_r0_2;
    u16 temp_r6;
    u16 colorIndex;
    u32 unk4C;
    u32 var_r7;

    Intro_54 *strc54 = TASK_DATA(gCurTask);
    IntroSprite *introSpr = TASK_DATA(strc54->taskC);

    introSpr->unk30 = (u16)strc54->unk4C;
    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    if (strc54->unk4C > 0x97) {
        var_r7 = (u32)((strc54->unk4C - 0x98) << 0xF) >> 0x10;
        if (var_r7 > 40) {
            var_r7 = 40;
        }

        for (colorIndex = 0; colorIndex < 32; colorIndex++) {
            u16 color = gUnknown_086A5D34[colorIndex];
            r = (maskRedColor(color) >> 0);
            g = ((color & RGB_GREEN) >> 5);
            b = ((color & RGB_BLUE) >> 10);

            {
                r = maskColor(r * var_r7);
                g = maskColor(g * var_r7);
                b = maskColor(b * var_r7);
                gBgPalette[colorIndex] = RGB16(r, g, b);
            }
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        }
    }

    if (strc54->unk4C > 0xB5) {
        gBgScrollRegs[0][1] += 2;
        if (gBgScrollRegs[0][1] > 100) {
            gBgScrollRegs[0][1] = 100;
        }
        if (gBgScrollRegs[0][1] > 80) {
            gBgScrollRegs[2][1] = gBgScrollRegs[0][1] - 0x50;
        }
    }
    gBgScrollRegs[1][1] += 0xA;
    sub_8063E8C(strc54->unk4C);
    if (strc54->unk4C > 0x13F) {
        strc54->unk4C = 0;
        gCurTask->main = sub_8064244;
    } else {
        sub_805423C(&strc54->strc0);
    }
    strc54->unk4C++;
}
END_NONMATCH

void sub_8064244()
{
    Sprite *s;
    s16 *temp_r3;
    s16 temp_r0;
    s16 temp_r1;
    u32 temp_r4;
    s32 temp_r0_4;
    s32 temp_r0_6;
    s32 temp_r1_3;
    s8 *temp_r1_2;
    u16 temp_r0_3;
    u16 temp_r0_5;
    u16 temp_r2;
    u16 temp_r7;
    u8 i;
    void *temp_r7_2;
    void *var_r0;
    struct Task *t;

    Intro_C8 *temp_r0_7;
    Intro_54 *strc54 = TASK_DATA(gCurTask);

    temp_r4 = strc54->unk4C;

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    if (temp_r4 < 0x60) {
        TasksDestroyInPriorityRange(0x6800U, ((temp_r4 >> 2) + 0x6802));
    }
    if (temp_r4 == 0x3C) {
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 1;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0x40;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    }
    gBgScrollRegs[1][1] += 10;
    if (++strc54->unk4C >= 506) {
        TaskDestroy(strc54->taskC);
        strc54->taskC = NULL;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;
        strc54->unk50 = 0x4000;
        strc54->unk52 = 0;
        strc54->unk4C = 0;
        TaskDestroy(strc54->beamTasks[0]);
        strc54->beamTasks[0] = NULL;
        TaskDestroy(strc54->beamTasks[1]);
        strc54->beamTasks[1] = NULL;
        gDispCnt = 0; // needed for matching
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        gDispCnt = 0x1340;
        gBgCntRegs[0] = 0x1D86;
        gBgCntRegs[1] = 0x1883;
        t = TaskCreate(Task_RenderSonic, sizeof(Intro_C8), 0x2210U, 0U, NULL);
        strc54->tasks18[CHARACTER_SONIC] = t;
        temp_r0_7 = TASK_DATA(t);
        temp_r0_7->unkB4 = 0;

        for (i = 0; i < 2; i++) {
            s = &temp_r0_7->sprites[i];
            if (i != 0) {
                s->graphics.dest = OBJ_VRAM0 + 0x4000;
            } else {
                s->graphics.dest = OBJ_VRAM0 + 0x1440;
            }
            s->graphics.anim = 0x301;
            s->variant = 0;
            s->x = 0xB4;
            s->y = 0x82;
            s->oamFlags = 0x3C0;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;
            UpdateSpriteAnimation(s);
        }

        for (i = 0; i < 6; i++) {
            IntroSprite *introSpr;
            t = TaskCreate(Task_806562C, sizeof(IntroSprite), 0x6820U, 0U, NULL);
            introSpr = TASK_DATA(t);
            s = &introSpr->s;
            introSpr->unk30 = 0;
            introSpr->unk32 = 0;
            introSpr->unk34 = i;
            introSpr->qUnk3C = gUnknown_0868B27C[0] + 0x118;
            s->graphics.dest = gUnknown_0868B28C[i].vram;
            s->graphics.anim = gUnknown_0868B28C[i].anim;
            s->variant = gUnknown_0868B28C[i].variant;
            s->x = 280;
            s->y = 70;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = 0xFF;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;
            UpdateSpriteAnimation(s);
        }
        gCurTask->main = sub_80645E4;
    } else {
        if ((s32)strc54->unk4C > 0xE0) {
            SpotlightBeam *beam;

            if (strc54->unk4C == 0xE1) {
                struct Task *tBeam = CreateSpotlightBeamTask();
                strc54->beamTasks[0] = tBeam;
                beam = TASK_DATA(tBeam);
                beam->unk6 = 120;
                beam->unk8 = 250;
                beam->unk0 = 0;
                beam->unk2 = 0;
                beam->unk4 = 0;
                beam->bg = 2;
                beam->unkB = 6;
                tBeam = CreateSpotlightBeamTask();
                strc54->beamTasks[1] = tBeam;
                beam = TASK_DATA(tBeam);
                beam->unk6 = 120;
                beam->unk8 = 250;
                beam->unk0 = 0;
                beam->unk2 = 0;
                beam->unk4 = 0;
                beam->bg = 3;
                beam->unkB = 6;
                gDispCnt |= 0x6000;
                gWinRegs[4] = 0x1F1F;
                gWinRegs[5] = 0x3F;
                gBldRegs.bldCnt = 0x3FDF;
                gBldRegs.bldY = 8;
                return;
            }
            temp_r4 = strc54->unk4C - 0xE1;
            beam = TASK_DATA(strc54->beamTasks[0]);
            beam->unk0 = (s16)((0x18 - Mod(temp_r4, 25)) * 6);
            if (((u32)temp_r4 <= 0x3FU) && (Mod(temp_r4, 6) == 0)) {
                beam->unkB++;
            }
            beam = TASK_DATA(strc54->beamTasks[1]);
            beam->unk0 = (s16)(((0x18 - Mod(temp_r4, 0x19)) * 6) + 0x370);
            if (((u32)temp_r4 <= 0x3FU) && (Mod(temp_r4, 6) == 0)) {
                beam->unkB++;
            }
        } else {
            if (temp_r4 >= 30 && temp_r4 < 120) {
                sub_805423C(&strc54->strc0);
            }
        }
    }
}

void sub_80645E4()
{
    Sprite *s;
    s16 *temp_r3;
    s16 temp_r0;
    s16 temp_r1;
    s16 temp_r4;
    s32 temp_r0_4;
    s32 temp_r0_6;
    s32 temp_r1_3;
    s8 *temp_r1_2;
    u16 temp_r0_3;
    u16 temp_r0_5;
    u16 temp_r2;
    u16 temp_r7;
    u8 i;
    void *temp_r7_2;
    void *var_r0;
    u32 unk4C;
    struct Task *t;

    Intro_C8 *strcC8;
    Intro_54 *strc54 = TASK_DATA(gCurTask);
    StrcUi_805423C *strc0;

    strcC8 = TASK_DATA(strc54->tasks18[CHARACTER_SONIC]);
    temp_r4 = strc54->unk4C;
    strcC8->unkB4 = temp_r4;
    strc54->unk50 -= 0x20;
    strc54->unk52 += 0x20;

    gBgScrollRegs[0][0] = I(strc54->unk50);
    gBgScrollRegs[0][1] = I(strc54->unk52);

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    unk4C = strc54->unk4C;
    if (unk4C < 30) {
        if (unk4C == 1) {
            sub_8063B8C();
        }
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 2;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 42) {
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 8;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0x100;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 102) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 242) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 0x16A) {
        sub_805423C(&strc54->strc0);
    }
    if (++strc54->unk4C >= 414) {
        TasksDestroyInPriorityRange(0x6820, 0x6821);
        TaskDestroy(strc54->tasks18[CHARACTER_SONIC]);
        strc54->tasks18[CHARACTER_SONIC] = NULL;
        strc54->unk50 = 0xE000;
        strc54->unk52 = 0x6000;
        strc54->unk4C = 0;

        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 2;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);

        t = TaskCreate(Task_IntroRenderTails, sizeof(Intro_C8), 0x2280U, 0U, NULL);
        strc54->tasks18[CHARACTER_TAILS] = t;
        strcC8 = TASK_DATA(t);
        strcC8->unkB4 = 0;

        for (i = 0; i < 3; i++) {
            s = &strcC8->sprites[i];
            if (i == 2) {
                s->graphics.dest = OBJ_VRAM0 + 0x3280;
            } else if (i == 1) {
                s->graphics.dest = OBJ_VRAM0 + 0x1980;
            } else {
                s->graphics.dest = OBJ_VRAM0 + 0x400;
            }
            s->graphics.anim = 0x301;
            s->variant = 1;
            s->x = 48;
            s->y = 108;
            s->oamFlags = 0x300;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;

            if (i == 0) {
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
            }
        }

        for (i = 0; i < 6; i++) {
            IntroSprite *introSpr;
            t = TaskCreate(sub_80656A4, sizeof(IntroSprite), 0x6820U, 0U, NULL);
            introSpr = TASK_DATA(t);
            s = &introSpr->s;
            introSpr->unk30 = 0;
            introSpr->unk32 = 0;
            introSpr->unk34 = i;
            introSpr->qUnk3C = gUnknown_0868B280[0] + 0x118;
            s->graphics.dest = gUnknown_0868B2D4[i].vram;
            s->graphics.anim = gUnknown_0868B2D4[i].anim;
            s->variant = gUnknown_0868B2D4[i].variant;
            s->x = 280;
            s->y = 70;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = 0xFF;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
        gCurTask->main = sub_80648D4;
    } else {
        if (strc54->unk4C > 0x160) {
            if (strc54->unk4C == 0x161) {
                strc54->strc0.unk4 = 4;
                strc54->strc0.unk6 = 0;
                strc54->strc0.unk8 = 0x180;
            }
            sub_805423C(&strc54->strc0);
        }
    }
}

void sub_80648D4()
{
    Sprite *s;
    s16 *temp_r3;
    s16 temp_r0;
    s16 temp_r1;
    s16 temp_r4;
    s32 temp_r0_4;
    s32 temp_r0_6;
    s32 temp_r1_3;
    s8 *temp_r1_2;
    u16 temp_r0_3;
    u16 temp_r0_5;
    u16 temp_r2;
    u16 temp_r7;
    u8 i;
    void *temp_r7_2;
    void *var_r0;
    u32 unk4C;
    struct Task *t;

    Intro_C8 *strcC8;
    Intro_54 *strc54 = TASK_DATA(gCurTask);
    StrcUi_805423C *strc0;

    strcC8 = TASK_DATA(strc54->tasks18[CHARACTER_TAILS]);
    temp_r4 = strc54->unk4C;
    strcC8->unkB4 = temp_r4;
    strc54->unk50 += 0x20;
    strc54->unk52 -= 0x20;

    gBgScrollRegs[0][0] = I(strc54->unk50);
    gBgScrollRegs[0][1] = I(strc54->unk52);

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    unk4C = strc54->unk4C;
    if (unk4C < 30) {
        if (unk4C == 1) {
            sub_8063C4C();
        }
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 42) {
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 8;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0x100;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 102) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 242) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 0x16A) {
        sub_805423C(&strc54->strc0);
    }
    if (++strc54->unk4C >= 414) {
        TasksDestroyInPriorityRange(0x6820, 0x6821);
        strc54->unk50 = 0xE000;
        strc54->unk52 = 0x1000;
        TaskDestroy(strc54->tasks18[CHARACTER_TAILS]);
        strc54->tasks18[CHARACTER_TAILS] = NULL;
        strc54->unk4C = 0;

        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 2;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);

        t = TaskCreate(Task_IntroRenderKnuckles, sizeof(Intro_C8), 0x2230U, 0U, NULL);
        strc54->tasks18[CHARACTER_KNUCKLES] = t;
        strcC8 = TASK_DATA(t);
        strcC8->unkB4 = 0;

        for (i = 0; i < 3; i++) {
            s = &strcC8->sprites[i];
            if (i == 2) {
                s->graphics.dest = OBJ_VRAM0 + 0x3280;
            } else if (i == 1) {
                s->graphics.dest = OBJ_VRAM0 + 0x1980;
            } else {
                s->graphics.dest = OBJ_VRAM0 + 0x80;
            }
            s->graphics.anim = 0x301;
            s->variant = 2;
            s->x = 48;
            s->y = 130;
            s->oamFlags = 0x3C0;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;

            if (i == 0) {
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
            }
        }

        for (i = 0; i < 9; i++) {
            IntroSprite *introSpr;
            t = TaskCreate(sub_806571C, sizeof(IntroSprite), 0x6820U, 0U, NULL);
            introSpr = TASK_DATA(t);
            s = &introSpr->s;
            introSpr->unk30 = 0;
            introSpr->unk32 = 0;
            introSpr->unk34 = i;
            introSpr->qUnk3C = gUnknown_0868B284[0] + 0x118;
            s->graphics.dest = gUnknown_0868B31C[i].vram;
            s->graphics.anim = gUnknown_0868B31C[i].anim;
            s->variant = gUnknown_0868B31C[i].variant;
            s->x = 280;
            s->y = 70;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = 0xFF;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x40080;
            UpdateSpriteAnimation(s);
        }
        gCurTask->main = sub_8064BB4;
    } else {
        if (strc54->unk4C > 0x160) {
            if (strc54->unk4C == 0x161) {
                strc54->strc0.unk4 = 4;
                strc54->strc0.unk6 = 0;
                strc54->strc0.unk8 = 0x180;
            }
            sub_805423C(&strc54->strc0);
        }
    }
}

void sub_8064BB4()
{
    Sprite *s;
    s16 *temp_r3;
    s16 temp_r0;
    s16 temp_r1;
    s16 temp_r4;
    s32 temp_r0_4;
    s32 temp_r0_6;
    s32 temp_r1_3;
    s8 *temp_r1_2;
    u16 temp_r0_3;
    u16 temp_r0_5;
    u16 temp_r2;
    u16 temp_r7;
    u8 i;
    void *temp_r7_2;
    void *var_r0;
    u32 unk4C;
    struct Task *t;

    Intro_C8 *strcC8;
    Intro_54 *strc54 = TASK_DATA(gCurTask);
    StrcUi_805423C *strc0;

    strcC8 = TASK_DATA(strc54->tasks18[CHARACTER_KNUCKLES]);
    temp_r4 = strc54->unk4C;
    strcC8->unkB4 = temp_r4;
    strc54->unk50 += 0x00;
    strc54->unk52 += 0x20;

    gBgScrollRegs[0][0] = I(strc54->unk50);
    gBgScrollRegs[0][1] = I(strc54->unk52);

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    unk4C = strc54->unk4C;
    if (unk4C < 30) {
        if (unk4C == 1) {
            sub_8063D0C();
        }
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 42) {
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 8;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0x100;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 102) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 242) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 0x16A) {
        sub_805423C(&strc54->strc0);
    }
    if (++strc54->unk4C >= 414) {
        TasksDestroyInPriorityRange(0x6820, 0x6821);
        strc54->unk50 = 0x3000;
        strc54->unk52 = 0x5000;
        TaskDestroy(strc54->tasks18[CHARACTER_KNUCKLES]);
        strc54->tasks18[CHARACTER_KNUCKLES] = NULL;
        strc54->unk4C = 0;

        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 2;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);

        t = TaskCreate(Task_IntroRenderAmy, sizeof(Intro_C8), 0x2230U, 0U, NULL);
        strc54->tasks18[CHARACTER_AMY] = t;
        strcC8 = TASK_DATA(t);
        strcC8->unkB4 = 0;

        for (i = 0; i < 2; i++) {
            s = &strcC8->sprites[i];
            if (i != 0) {
                s->graphics.dest = OBJ_VRAM0 + 0x6400;
            } else {
                s->graphics.dest = OBJ_VRAM0 + 0x1440;
            }
            s->graphics.anim = 0x301;
            s->variant = 3;
            s->x = 180;
            s->y = 108;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x80;
            UpdateSpriteAnimation(s);

            if (i == 0) {
                DisplaySprite(s);
            }
        }

        for (i = 0; i < ARRAY_COUNT(gUnknown_0868B388); i++) {
            IntroSprite *introSpr;
            t = TaskCreate(sub_8065794, sizeof(IntroSprite), 0x6820U, 0U, NULL);
            introSpr = TASK_DATA(t);
            s = &introSpr->s;
            introSpr->unk30 = 0;
            introSpr->unk32 = 0;
            introSpr->unk34 = i;
            introSpr->qUnk3C = gUnknown_0868B288[0] + 0x118;
            s->graphics.dest = gUnknown_0868B388[i].vram;
            s->graphics.anim = gUnknown_0868B388[i].anim;
            s->variant = gUnknown_0868B388[i].variant;
            s->x = 280;
            s->y = 70;
            s->oamFlags = 0x180;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = 0xFF;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x40080;
            UpdateSpriteAnimation(s);
        }
        gCurTask->main = sub_8064E84;
    } else {
        if (strc54->unk4C > 0x160) {
            if (strc54->unk4C == 0x161) {
                strc54->strc0.unk4 = 4;
                strc54->strc0.unk6 = 0;
                strc54->strc0.unk8 = 0x180;
            }
            sub_805423C(&strc54->strc0);
        }
    }
}

void sub_8064E84()
{
    Sprite *s;
    s16 *temp_r3;
    s16 temp_r0;
    s16 temp_r1;
    s16 temp_r4;
    s32 temp_r0_4;
    s32 temp_r0_6;
    s32 temp_r1_3;
    s8 *temp_r1_2;
    u16 temp_r0_3;
    u16 temp_r0_5;
    u16 temp_r2;
    u16 temp_r7;
    u8 i;
    void *temp_r7_2;
    void *var_r0;
    u32 unk4C;
    struct Task *t;

    Intro_C8 *strcC8;
    Intro_54 *strc54 = TASK_DATA(gCurTask);
    StrcUi_805423C *strc0;

    strcC8 = TASK_DATA(strc54->tasks18[CHARACTER_AMY]);
    temp_r4 = strc54->unk4C;
    strcC8->unkB4 = temp_r4;
    strc54->unk50 -= 0x20;
    strc54->unk52 -= 0x20;

    gBgScrollRegs[0][0] = I(strc54->unk50);
    gBgScrollRegs[0][1] = I(strc54->unk52);

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gPressedKeys) {
        gCurTask->main = IntroOpenTitlescreenPlayMusic;
        return;
    }

    unk4C = strc54->unk4C;
    if (unk4C < 30) {
        if (unk4C == 1) {
            sub_8063DCC();
        }
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 42) {
        strc54->strc0.unk0 = 0;
        strc54->strc0.unk2 = 1;
        strc54->strc0.unk4 = 8;
        strc54->strc0.unk6 = 0;
        strc54->strc0.unk8 = 0x100;
        strc54->strc0.unkA = 1;
        sub_80543A4(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 102) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 242) {
        sub_805423C(&strc54->strc0);
    } else if (unk4C >= 0 && unk4C < 0x16A) {
        sub_805423C(&strc54->strc0);
    }
    if (++strc54->unk4C >= 414) {
        gCurTask->main = IntroOpenTitlescreenSilent;
        sub_805423C(&strc54->strc0);
    } else {
        if (strc54->unk4C > 0x160) {
            if (strc54->unk4C == 0x161) {
                strc54->strc0.unk4 = 4;
                strc54->strc0.unk6 = 0;
                strc54->strc0.unk8 = 0x180;
            }
            sub_805423C(&strc54->strc0);
        }
    }
}

void IntroOpenTitlescreenSilent(void)
{
    TasksDestroyAll();

    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    CreateTitleScreen(TITLESCREEN_PARAM__BOOT_SILENT);
}

void IntroOpenTitlescreenPlayMusic(void)
{
    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    m4aSongNumStop(MUS_INTRO);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    CreateTitleScreen(TITLESCREEN_PARAM__PLAY_MUSIC);
}

void Task_8065058(void)
{
    s16 unk30;

    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;

    unk30 = ++introSpr->unk30;
    if (unk30 < 90 || unk30 >= 234) {
        introSpr->qUnk3C += introSpr->qUnk40;
    }
    if (unk30 < 90) {
        introSpr->qUnk40 -= 6;
        if (introSpr->qUnk40 < 0) {
            introSpr->qUnk40 = 0;
        }
    }

    if (unk30 == 0xE9) {
        introSpr->qUnk40 = 0x140;
    }

    if (introSpr->qUnk3C > Q(180)) {
        introSpr->qUnk3C = Q(180);
    }

    if (introSpr->unk34 == 0) {
        s->prevVariant = -1;
        introSpr->unk34 = 0x2F;
        introSpr->qUnk38 = introSpr->qUnk3C;
    }

    introSpr->qUnk38 -= Div(SIN((0x100 - (introSpr->unk34 * 6)) % 256u), 24);
    s->x = Div(SIN(((introSpr->unk34 * 12) + (unk30 << 5)) & 0x3FF), 650) + 120;
    s->y = I(introSpr->qUnk38);

    introSpr->unk34 -= 1;

    if (1 & introSpr->unk32) {
        s->oamFlags = SPRITE_OAM_ORDER(0);
    } else {
        s->oamFlags = SPRITE_OAM_ORDER(6);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806515C(void)
{
    s16 unk30;

    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;

    unk30 = ++introSpr->unk30;
    if (unk30 < 90 || unk30 >= 234) {
        introSpr->qUnk3C += introSpr->qUnk40;
    }
    if (unk30 < 90) {
        introSpr->qUnk40 -= 6;
        if (introSpr->qUnk40 < 0) {
            introSpr->qUnk40 = 0;
        }
    }

    if (unk30 == 0xE9) {
        introSpr->qUnk40 = Q(1.25);
    }

    if (introSpr->qUnk3C > Q(212)) {
        introSpr->qUnk3C = Q(212);
    }

    if (introSpr->unk34 == 0) {
        s->prevVariant = -1;
        introSpr->unk34 = 0x2F;
        introSpr->qUnk38 = introSpr->qUnk3C;
    }

    introSpr->qUnk38 -= Div(SIN((introSpr->unk34 * 6)), 24);
    s->x = 120 - Div(SIN(((introSpr->unk34 * 12) + (unk30 << 5)) & 0x3FF), 650);
    s->y = I(introSpr->qUnk38);

    introSpr->unk34 -= 1;

    if (1 & introSpr->unk32) {
        s->oamFlags = SPRITE_OAM_ORDER(0);
    } else {
        s->oamFlags = SPRITE_OAM_ORDER(6);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_RenderSonic(void)
{
    Intro_C8 *strcC8 = TASK_DATA(gCurTask);
    s16 unkB4 = strcC8->unkB4;
    u8 i;
    u8 count = 1;

    for (i = 0; i < count; i++) {
        Sprite *s = &strcC8->sprites[i];

        if (unkB4 == 0x1E) {
            s->prevVariant = -1;
            s->graphics.anim = gUnknown_0868B3B8[i * 2][0];
            s->variant = gUnknown_0868B3B8[i * 2][1];
            UpdateSpriteAnimation(s);
        }

        if (unkB4 > 0) {
            if (unkB4 > 0x161) {
                s->frameFlags = 0;
                UpdateSpriteAnimation(s);
            } else if (unkB4 > 0xBD) {
                if (unkB4 == 0xBE) {
                    s->prevVariant = 0xFF;
                    s->graphics.anim = gUnknown_0868B3B8[i * 2 + 1][0];
                    s->variant = gUnknown_0868B3B8[i * 2 + 1][1];
                }
                UpdateSpriteAnimation(s);
            }
            DisplaySprite(s);
        }
    }
}

void Task_IntroRenderTails(void)
{
    Intro_C8 *strcC8 = TASK_DATA(gCurTask);
    s16 temp_r0 = strcC8->unkB4;
    Intro_C8 *sp0;
    u8 var_r6;
    u8 count = 1;
    for (var_r6 = 0; var_r6 < count; var_r6++) {
        Sprite *s = &strcC8->sprites[var_r6];
        if (temp_r0 == 0x1E) {
            if (var_r6 == 2) {
                s->graphics.dest = (void *)OBJ_VRAM0 + 0x3280;
            } else if (var_r6 == 1) {
                s->graphics.dest = (void *)OBJ_VRAM0 + 0x1980;
            } else {
                s->graphics.dest = (void *)OBJ_VRAM0 + 0x80;
            }
            s->prevVariant = 0xFF;
            s->graphics.anim = gUnknown_0868B3C0[var_r6 * 2][0];
            s->variant = gUnknown_0868B3C0[var_r6 * 2][1];
            UpdateSpriteAnimation(s);
        }
        if (temp_r0 >= 0) {
            if (temp_r0 <= 0x1D) {
                UpdateSpriteAnimation(s);
            }
            if (temp_r0 > 0x161) {
                s->frameFlags = 0;
                UpdateSpriteAnimation(s);
            } else if (temp_r0 > 0xBD) {
                if (temp_r0 == 0xBE) {
                    s->prevVariant = -1;
                    s->graphics.anim = gUnknown_0868B3C0[var_r6 * 2 + 1][0];
                    s->variant = gUnknown_0868B3C0[var_r6 * 2 + 1][1];
                }
                UpdateSpriteAnimation(s);
            }
            if ((temp_r0 > 0x1D) || (var_r6 == 0)) {
                DisplaySprite(s);
            }
        }
    }
}

void Task_IntroRenderKnuckles(void)
{
    Intro_C8 *strcC8 = TASK_DATA(gCurTask);
    s16 temp_r0 = strcC8->unkB4;
    Intro_C8 *sp0;
    u8 var_r6;
    u8 count = 1;
    for (var_r6 = 0; var_r6 < count; var_r6++) {
        Sprite *s = &strcC8->sprites[var_r6];
        if (var_r6 == 2) {
            s->graphics.dest = (void *)OBJ_VRAM0 + 0x3280;
        } else if (var_r6 == 1) {
            s->graphics.dest = (void *)OBJ_VRAM0 + 0x1980;
        } else {
            s->graphics.dest = (void *)OBJ_VRAM0 + 0x80;
        }

        if (temp_r0 == 0x1E) {
            s->prevVariant = -1;
            s->graphics.anim = gUnknown_0868B3C8[var_r6 * 2][0];
            s->variant = gUnknown_0868B3C8[var_r6 * 2][1];
        }
        if (temp_r0 >= 0) {
            if (temp_r0 > 0x161) {
                s->frameFlags = 0;
                UpdateSpriteAnimation(s);
            } else if (temp_r0 > 0xEA) {
                if (temp_r0 == 0xEB) {
                    s->prevVariant = -1;
                    s->graphics.anim = gUnknown_0868B3C8[var_r6 * 2 + 1][0];
                    s->variant = gUnknown_0868B3C8[var_r6 * 2 + 1][1];
                }
            }
            if ((temp_r0 > 0x1D) || (var_r6 == 0)) {
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
            }
        }
    }
}

void Task_IntroRenderAmy(void)
{
    Intro_C8 *strcC8 = TASK_DATA(gCurTask);
    s16 unkB4 = strcC8->unkB4;
    u8 i;
    u8 count = 1;

    if (unkB4 > 410) {
        return;
    }

    for (i = 0; i < count; i++) {
        Sprite *s = &strcC8->sprites[i];

        if (strcC8->unkB4 == 0x161) {
            s->frameFlags = 0;
        }
        if (unkB4 == 0x1E) {
            s->prevVariant = -1;
            s->graphics.anim = gUnknown_0868B3D0[i * 2][0];
            s->variant = gUnknown_0868B3D0[i * 2][1];
            UpdateSpriteAnimation(s);
        }

        if (unkB4 >= 0) {
            if (unkB4 > 353) {
                s->frameFlags = 0;
                UpdateSpriteAnimation(s);
            } else if (unkB4 > 164) {
                if (unkB4 == 165) {
                    s->prevVariant = 0xFF;
                    s->graphics.anim = gUnknown_0868B3D0[i * 2 + 1][0];
                    s->variant = gUnknown_0868B3D0[i * 2 + 1][1];
                }
                UpdateSpriteAnimation(s);
            }
            DisplaySprite(s);
        }
    }
}

void Task_806562C()
{
    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;
    s16 temp_r0 = ++introSpr->unk30;

    if ((introSpr->unk30) == 0x161) {
        s->frameFlags = 0;
    }

    if (temp_r0 > 90) {
        temp_r0 -= 90;
        if ((introSpr->unk34 * 0xF) < temp_r0) {
            introSpr->qUnk3C -= 0x10;
            if (introSpr->qUnk3C < gUnknown_0868B27C[0]) {
                introSpr->qUnk3C = gUnknown_0868B27C[0];
            }
            s->x = introSpr->qUnk3C;
            s->y = gUnknown_0868B27C[1];
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_80656A4(void)
{
    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;
    s16 temp_r0 = ++introSpr->unk30;

    if ((introSpr->unk30) == 353) {
        s->frameFlags = 0;
    }

    if (temp_r0 > 90) {
        temp_r0 -= 90;
        if ((introSpr->unk34 * 0xF) < temp_r0) {
            introSpr->qUnk3C -= 0x10;
            if (introSpr->qUnk3C < gUnknown_0868B280[0]) {
                introSpr->qUnk3C = gUnknown_0868B280[0];
            }
            s->x = introSpr->qUnk3C;
            s->y = gUnknown_0868B280[1];
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_806571C(void)
{

    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;
    s16 temp_r0 = ++introSpr->unk30;

    if ((introSpr->unk30) == 353) {
        s->frameFlags = 0;
    }

    if (temp_r0 > 90) {
        temp_r0 -= 90;
        if ((introSpr->unk34 * 0xF) < temp_r0) {
            introSpr->qUnk3C -= 0x10;
            if (introSpr->qUnk3C < gUnknown_0868B284[0]) {
                introSpr->qUnk3C = gUnknown_0868B284[0];
            }
            s->x = introSpr->qUnk3C;
            s->y = gUnknown_0868B284[1];
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_8065794(void)
{

    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;
    s16 temp_r0 = ++introSpr->unk30;

    if (temp_r0 > 410) {
        return;
    }

    if ((introSpr->unk30) == 0x161) {
        s->frameFlags = 0;
    }

    if (temp_r0 > 90) {
        temp_r0 -= 90;
        if ((introSpr->unk34 * 0xF) < temp_r0) {
            introSpr->qUnk3C -= 0x10;
            if (introSpr->qUnk3C < gUnknown_0868B288[0]) {
                introSpr->qUnk3C = gUnknown_0868B288[0];
            }
            s->x = introSpr->qUnk3C;
            s->y = gUnknown_0868B288[1];
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void TaskDestructor_8065810(struct Task *t) { }

void Task_IntroChaosEmeraldUpdate()
{
    IntroSprite *introSpr = TASK_DATA(gCurTask);
    Sprite *s = &introSpr->s;
    s16 unk30 = introSpr->unk30;

    if ((unk30 < 90) || (unk30 > 233)) {
        introSpr->qUnk3C += introSpr->qUnk40;
    }

    if (unk30 < 90) {
        introSpr->qUnk40 -= Q(6. / 256.);
        if (introSpr->qUnk40 < Q(0)) {
            introSpr->qUnk40 = Q(0);
        }
    }

    if (unk30 == 233) {
        introSpr->qUnk40 = Q(1.25);
    }

    if (introSpr->qUnk3C > Q(180)) {
        introSpr->qUnk3C = Q(180);
    }

    s->y = I(introSpr->qUnk3C);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
