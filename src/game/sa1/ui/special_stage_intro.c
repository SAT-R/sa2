#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/globals.h"
#include "game/sa1/special_stage/main.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/characters.h"
#include "constants/sa1/ui_graphics.h"
#include "constants/sa1/zones.h"

#define FRAME_RELAY_A 90
#define FRAME_RELAY_B 150

typedef struct {
    Sprite s;
    u32 unk30;
    s32 qUnk34;
    s32 qUnk38;
    s32 qUnk3C;
    s32 qUnk40;
} SpecialStageIntro44;

// TODO: Integrate SpecialStageIntro44 into this?
typedef struct {
    Sprite s;
    u32 unk30;
    s32 qUnk34;
    s32 qUnk38;
    s32 qUnk3C;
    s32 qUnk40;
    s32 unk44[16];
    s32 unk84[16];
} SpecialStageIntroC4; /* 0xC4 */

// TODO: Integrate SpecialStageIntro44 into this?
typedef struct {
    Sprite s;
    u32 unk30;
    s32 qUnk34;
    s32 qUnk38;
    s32 qUnk3C;
    s32 qUnk40;
    s32 unk44[8];
} SpecialStageIntro64; /* 0xC4 */

typedef struct {
    StrcUi_805423C strc0;
    struct Task *taskC; // SpecialStageIntro64
    struct Task *task10; // SpecialStageIntro64
    struct Task *task14; // SpecialStageIntro64
    s16 unk18;
    u8 unk1A;
    s16 unk1C;
    s16 unk1E;
} SpecialStageIntro20;

typedef struct {
    StrcUi_805423C strc0;
    struct Task *taskC; // SpecialStageIntro44
    struct Task *task10; // SpecialStageIntro44
    struct Task *task14; // SpecialStageIntro44
    struct Task *task18; // SpecialStageIntro44
    s16 unk1C;
    u8 unk1E;
    s16 unk20;
    s16 unk22;
    u8 unk24;
} SpecialStageIntro28;

void sub_80688E4(s32 someId);
void Task_SpecialStageIntroInit(void);
void Task_8068360(void);
void Task_8069634(void);
void Task_8068948(void);
void Task_8068A78(void);
void Task_8068B10(void);
void Task_8068BB0(void);
void Task_8068CD4(void);
void sub_8068D0C();
void Task_8069100(void);
void Task_80693D0(void);
void Task_80694E8(void);
void Task_nullsub_806954C(void);
void Task_8069550(void);
void Task_strc44_806959C(void);
void sub_805D048(u8 arg0);

extern u16 gUnknown_0868B584[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B594[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B5A4[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B5B4[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B5C4[][NUM_CHARACTERS][2];
extern u16 gUnknown_0868B634[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B644[NUM_CHARACTERS][2];
extern u16 gUnknown_086BBC34[256];
extern u8 gUnknown_086BBE34[0x2980];
extern u8 gUnknown_086BE7B4[0x1000];

extern u8 gUnknown_08487134[NUM_LEVEL_IDS];

void CreateSpecialStageIntro(void)
{
    struct Task *taskC;
    struct Task *task10;
    SpecialStageIntroC4 *temp_r0_3;
    SpecialStageIntro20 *temp_r0_6;
    SpecialStageIntroC4 *temp_r2;
    Sprite *s;
    u8 var_r5;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();
    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x9D86;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0x128;
    task10 = TaskCreate(Task_SpecialStageIntroInit, sizeof(SpecialStageIntroC4), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task10);
    s = &temp_r2->s;
    s->graphics.dest = OBJ_VRAM0 + 0x20;
    s->graphics.anim = gUnknown_0868B584[gSelectedCharacter][0];
    s->variant = gUnknown_0868B584[gSelectedCharacter][1];
    s->x = 120;
    s->y = 180;
    s->oamFlags = SPRITE_OAM_ORDER(6);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 1;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    temp_r2->unk30 = 0;
    temp_r2->qUnk3C = -Q(1);
    temp_r2->qUnk40 = +Q(120);
    temp_r2->qUnk34 = -Q(3.8125);
    temp_r2->qUnk38 = +Q(180);

    taskC = TaskCreate(Task_8068BB0, sizeof(SpecialStageIntroC4), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(taskC);
    s = &temp_r2->s;

    temp_r2->unk30 = 0;
    temp_r2->qUnk34 = 0xF;
    temp_r2->qUnk38 = 0;
    temp_r2->qUnk3C = 0;
    temp_r2->qUnk40 = 0;

    for (var_r5 = 0; var_r5 < 16; var_r5++) {
        temp_r2->unk84[var_r5] = Mod(PseudoRandom32(), 40) - 20;
        temp_r2->unk44[var_r5] = Mod(PseudoRandom32(), 220) + 20;
    }

    s->graphics.dest = OBJ_VRAM0 + 0x820;
    s->graphics.anim = 776;
    s->variant = 0;
    s->x = 120;
    s->y = 80;
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    temp_r0_6 = TASK_DATA(TaskCreate(Task_8068948, sizeof(SpecialStageIntro20), 0x2100U, 0U, NULL));
    temp_r0_6->unk18 = 0;
    temp_r0_6->unk1A = 1;
    temp_r0_6->task10 = task10;
    temp_r0_6->taskC = taskC;
    temp_r0_6->unk1C = 0;
    temp_r0_6->unk1E = 0;
    temp_r0_6->strc0.unk0 = 0;
    temp_r0_6->strc0.unk2 = 1;
    temp_r0_6->strc0.unk4 = 2;
    temp_r0_6->strc0.unk6 = 0;
    temp_r0_6->strc0.unk8 = 0x150;
    temp_r0_6->strc0.unkA = 1;
    sub_80543A4(&temp_r0_6->strc0);

    m4aSongNumStart(0x29U);
}

void sub_80688E4(s32 someId)
{
    UiGfxStackInit();

    if (someId == 1) {
        Strc_80528AC gfx;
        gfx.uiGfxID = UIGFX_OPTIONS;
        gfx.unk2B = 0;
        gfx.tiles = gUnknown_086BBE34;
        gfx.tilesSize = sizeof(gUnknown_086BBE34);
        gfx.palette = gUnknown_086BBC34;
        gfx.paletteSize = sizeof(gUnknown_086BBC34);
        gfx.layout = gUnknown_086BE7B4;
        gfx.layoutSize = sizeof(gUnknown_086BE7B4);
        gfx.unk28 = 0;
        gfx.unk29 = 0;
        gfx.unk2A = 0x15;
        sub_80528AC(&gfx);
    }
}

void Task_8068948()
{
    SpecialStageIntroC4 *temp_r2;
    SpecialStageIntroC4 *temp_r7;
    struct Task *t;
    Sprite *s;
    u32 temp_r5;

    SpecialStageIntro20 *strc20 = TASK_DATA(gCurTask);

    temp_r7 = TASK_DATA(strc20->task10);
    temp_r5 = strc20->unk18 + 1;
    sub_805423C(&strc20->strc0);
    sub_80688E4(temp_r5);
    if (temp_r5 > FRAME_RELAY_A) {
        temp_r5 = 0; // for matching

        strc20->unk18 = 0;
        temp_r7->unk30 = 0U;
        gBgScrollRegs[0][1] = 0;
        strc20->strc0.unk0 = 0;
        strc20->strc0.unk2 = 1;
        strc20->strc0.unk4 = 2;
        strc20->strc0.unk6 = 0;
        strc20->strc0.unk8 = 0x150;
        strc20->strc0.unkA = 1;
        t = TaskCreate(Task_8068CD4, sizeof(SpecialStageIntroC4), 0x2120U, 0U, NULL);
        strc20->task14 = t;
        temp_r2 = TASK_DATA(t);
        s = &temp_r2->s;
        s->graphics.dest = OBJ_VRAM0 + 0xC80;
        s->graphics.anim = 0x32B;
        s->variant = 0;
        s->x = 0x78;
        s->y = 0x78;
        s->oamFlags = 0;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
        TaskDestroy(strc20->taskC);
        strc20->task10->main = Task_8068B10;
        gCurTask->main = Task_8068A78;
        return;
    } else {
        if ((FRAME_RELAY_A - Div(0x2000, 0x150)) == temp_r5) {
            strc20->strc0.unk0 = 0;
            strc20->strc0.unk2 = 1;
            strc20->strc0.unk4 = 1;
            strc20->strc0.unk6 = 0;
            strc20->strc0.unk8 = 0x150;
            strc20->strc0.unkA = 1;
        }
        sub_805423C(&strc20->strc0);
        strc20->unk18 = temp_r5;
        temp_r7->unk30 = temp_r5;
    }
}

void Task_8068A78()
{
    SpecialStageIntro20 *strc20 = TASK_DATA(gCurTask);
    SpecialStageIntroC4 *temp_r7;
    u32 temp_r5;

    temp_r7 = TASK_DATA(strc20->task10);
    temp_r5 = strc20->unk18 + 1;
    if (temp_r5 > FRAME_RELAY_B) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateSpecialStage();
        return;
    } else {
        if ((FRAME_RELAY_B - Div(0x2000, 0x150)) == temp_r5) {
            strc20->strc0.unk0 = 0;
            strc20->strc0.unk2 = 1;
            strc20->strc0.unk4 = 1;
            strc20->strc0.unk6 = 0;
            strc20->strc0.unk8 = 0x150;
            strc20->strc0.unkA = 1;
        }

        sub_805423C(&strc20->strc0);
        strc20->unk18 = (s16)temp_r5;
        temp_r7->unk30 = temp_r5;
    }
}

void Task_8068B10()
{
    SpecialStageIntroC4 *strcC4 = TASK_DATA(gCurTask);
    Sprite *s = &strcC4->s;
    u32 temp_r6 = strcC4->unk30;

    if (temp_r6 == 0) {
        s->graphics.anim = gUnknown_0868B594[gSelectedCharacter][0];
        s->variant = gUnknown_0868B594[gSelectedCharacter][1];
        s->prevVariant = -1;
        strcC4->qUnk34 += -Q(5);
        strcC4->qUnk38 = Q(180);
        strcC4->qUnk40 = Q(150);
    }

    if (temp_r6 > 40) {
        strcC4->qUnk40 += strcC4->qUnk3C;
        strcC4->qUnk34 += Q(0.25);
        strcC4->qUnk38 += strcC4->qUnk34;
        strcC4->s.x = I(strcC4->qUnk40);
        strcC4->s.y = I(strcC4->qUnk38);

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_8068BB0(void)
{
    s32 sp0;
    s32 *temp_r1;
    s32 *temp_r5;
    s32 *var_r2;
    s32 *var_r3;
    s32 temp_r0;
    s32 temp_r0_3;
    s32 temp_r0_4;
    s32 var_r4;
    u8 temp_r0_2;
    u8 var_r8;

    SpecialStageIntroC4 *strcC4 = TASK_DATA(gCurTask);
    Sprite *s = &strcC4->s;

    temp_r0 = strcC4->unk30 + 1;
    strcC4->unk30++;
    sp0 = temp_r0;
    strcC4->s.prevVariant = -1;
    UpdateSpriteAnimation(&strcC4->s);

    for (var_r8 = 0; var_r8 < 16; var_r8++) {
        if ((sp0 + var_r8) & 0xF) {
            strcC4->unk84[var_r8] += 0x10;
        } else {
            strcC4->unk84[var_r8] = Mod(PseudoRandom32(), 0x28) - 0x14;
            strcC4->unk44[var_r8] = Mod(PseudoRandom32(), 0xDC) + 0x14;
        }

        s->x = strcC4->unk44[var_r8];
        s->y = strcC4->unk84[var_r8];
        DisplaySprite(s);
    }
}

void Task_SpecialStageIntroInit(void)
{
    SpecialStageIntroC4 *strcC4 = TASK_DATA(gCurTask);
    Sprite *s = &strcC4->s;
    u16 temp_r4;

    strcC4->qUnk38 -= Q(3.8125);
    s->x = I(strcC4->qUnk40);
    s->y = I(strcC4->qUnk38);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8068CD4(void)
{
    SpecialStageIntroC4 *strcC4 = TASK_DATA(gCurTask);
    Sprite *s = &strcC4->s;

    if ((Div(++strcC4->unk30, 30) % 2u) == 0) {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void sub_8068D0C(void)
{
    struct Task *tasks[4];
    Strc_80528AC gfx;
    struct Task *sp44;
    struct Task *sp48;
    struct Task *sp4C;
    struct Task *t;
    SpecialStageIntro44 *temp_r2;
    SpecialStageIntro44 *temp_r1;
    SpecialStageIntro64 *temp_r1_2;
    SpecialStageIntro28 *temp_r1_4;
    Sprite *s;
    u8 i;

    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x9D86;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0x128;
    t = TaskCreate(Task_nullsub_806954C, sizeof(SpecialStageIntro44), 0x2120U, 0U, NULL);
    sp44 = t;
    temp_r2 = TASK_DATA(t);
    s = &temp_r2->s;
    s->graphics.dest = OBJ_VRAM0 + 0x20;
    s->graphics.anim = gUnknown_0868B5A4[gSelectedCharacter][0];
    s->variant = gUnknown_0868B5A4[gSelectedCharacter][1];
    s->x = 0x78;
    s->y = 0xB4;
    s->oamFlags = 0x180;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    temp_r2->unk30 = 0;
    temp_r2->qUnk3C = 0;
    temp_r2->qUnk40 = +Q(170);
    temp_r2->qUnk34 = 0x4A0;
    temp_r2->qUnk38 = -Q(32);

    t = TaskCreate(Task_strc44_806959C, sizeof(SpecialStageIntro44), 0x2120U, 0U, NULL);
    sp48 = t;
    temp_r2 = TASK_DATA(t);
    s = &temp_r2->s;
    s->graphics.dest = OBJ_VRAM0 + 0x0820;
    s->graphics.anim = gUnknown_0868B5B4[gSelectedCharacter][0];
    s->variant = gUnknown_0868B5B4[gSelectedCharacter][1];
    s->x = 0x12C;
    s->y = 100;
    s->oamFlags = 0x240;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    temp_r2->unk30 = 0;
    temp_r2->qUnk3C = -Q(1);
    temp_r2->qUnk40 = Q(350);
    temp_r2->qUnk34 = Q(0);
    temp_r2->qUnk38 = Q(100);

    t = TaskCreate(Task_strc44_806959C, sizeof(SpecialStageIntro44), 0x2120U, 0U, NULL);
    sp4C = t;
    temp_r2 = TASK_DATA(t);
    s = &temp_r2->s;
    s->graphics.dest = OBJ_VRAM0 + 0x12A0;
    s->graphics.anim = 0x2E0;
    s->variant = 0;
    s->x = 0x15E;
    s->y = 100;
    s->oamFlags = 0x300;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    temp_r2->unk30 = 0;
    temp_r2->qUnk3C = -Q(1);
    temp_r2->qUnk40 = Q(350);
    temp_r2->qUnk34 = Q(0);
    temp_r2->qUnk38 = Q(100);
    for (i = 0; i < 4; i++) {
        tasks[i] = TaskCreate(Task_8068360, sizeof(SpecialStageIntro64), 0x2120U, 0U, NULL);
        temp_r1_2 = TASK_DATA(tasks[i]);
        s = &temp_r1_2->s;
        temp_r1_2->qUnk3C = 0;
        if (i == 0) {
            temp_r1_2->unk44[4] = Q(50);
            temp_r1_2->unk44[0] = Q(80);
            temp_r1_2->unk44[1] = Q(0.5);
            temp_r1_2->unk44[5] = 0;
            s->graphics.dest = OBJ_VRAM0 + 0x6040;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_XS;
            s->variant = 0;
        } else if (i == 1) {
            temp_r1_2->unk44[4] = Q(100);
            temp_r1_2->unk44[0] = Q(40);
            temp_r1_2->unk44[1] = Q(0.25);
            temp_r1_2->unk44[5] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x6180;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_S;
            s->variant = 0;
        } else if (i == 2) {
            temp_r1_2->unk44[4] = Q(120);
            temp_r1_2->unk44[0] = Q(120);
            temp_r1_2->unk44[1] = Q(1.0);
            temp_r1_2->unk44[5] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x6420;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_M;
            s->variant = 0;
        } else {
            temp_r1_2->unk44[4] = Q(20);
            temp_r1_2->unk44[0] = Q(160);
            temp_r1_2->unk44[1] = Q(1.125);
            temp_r1_2->unk44[5] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x7080;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_L;
            s->variant = 0;
        }
        s->x = 180;
        s->y = 80;
        s->oamFlags = SPRITE_OAM_ORDER(27);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = 0x1000;
    }

    temp_r1_4 = TASK_DATA(TaskCreate(Task_80694E8, sizeof(SpecialStageIntro28), 0x2100U, 0U, NULL));

    temp_r1_4->unk1C = 0;
    temp_r1_4->unk1E = 1;
    temp_r1_4->taskC = sp44;
    temp_r1_4->task18 = sp48;
    temp_r1_4->task14 = sp4C;
    temp_r1_4->unk24 = 0;
    temp_r1_4->unk20 = 0;
    temp_r1_4->unk22 = 0;
    temp_r1_4->strc0.unk0 = 0;
    temp_r1_4->strc0.unk2 = 1;
    temp_r1_4->strc0.unk4 = 8;
    temp_r1_4->strc0.unk6 = 0;
    temp_r1_4->strc0.unk8 = 0x128;
    temp_r1_4->strc0.unkA = 1;
    sub_805423C(&temp_r1_4->strc0);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = gUnknown_086BBE34;
    gfx.tilesSize = 0x2980;
    gfx.palette = gUnknown_086BBC34;
    gfx.paletteSize = 0x200;
    gfx.layout = gUnknown_086BE7B4;
    gfx.layoutSize = 0x1000;
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
}

void Task_8069100(void)
{
    SpecialStageIntro44 *sp4;
    SpecialStageIntro44 *sp8;
    SpecialStageIntro44 *strc44_0;
    SpecialStageIntro44 *temp_sl;
    SpecialStageIntro44 *var_r7;
    struct Task *t;
    u32 temp_r0;

    SpecialStageIntro28 *strc28 = TASK_DATA(gCurTask);
    Sprite *s;

    temp_sl = TASK_DATA(strc28->taskC);
    sp4 = TASK_DATA(strc28->task18);
    sp8 = TASK_DATA(strc28->task14);
    temp_r0 = strc28->unk1C + 1;
    if (temp_r0 == 1) {
        strc44_0 = TASK_DATA(TaskCreate(Task_8069634, sizeof(SpecialStageIntro44), 0x2120U, 0U, NULL));
        s = &strc44_0->s;
        s->graphics.dest = OBJ_VRAM0 + 0x3820;
        s->graphics.anim = 0x2FD;
        s->variant = 0;
        s->x = 0x78;
        s->y = 0xB4;
        s->oamFlags = 0;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
        strc44_0->unk30 = 0;
        strc44_0->qUnk3C = -Q(1);
        strc44_0->qUnk40 = temp_sl->qUnk40 - Q(8);
        strc44_0->qUnk34 = Q(0);
        strc44_0->qUnk38 = temp_sl->qUnk38 + Q(10);

        t = TaskCreate(Task_strc44_806959C, sizeof(SpecialStageIntro44), 0x2120U, 0U, NULL);
        strc28->task10 = t;
        var_r7 = TASK_DATA(t);
        s = &var_r7->s;
        s->graphics.dest = OBJ_VRAM0 + 0xAA0;
        s->graphics.anim = gUnknown_0868B5C4[gUnknown_08487134[gCurrentLevel]][gSelectedCharacter][0];
        s->variant = gUnknown_0868B5C4[gUnknown_08487134[gCurrentLevel]][gSelectedCharacter][1];
        s->x = 0x78;
        s->y = 0xB4;
        s->oamFlags = 0x180;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
        var_r7->unk30 = 0;
        var_r7->qUnk3C = -Q(1);
        var_r7->qUnk40 = temp_sl->qUnk40;
        var_r7->qUnk34 = 0;
        var_r7->qUnk38 = temp_sl->qUnk38;
    } else {
        var_r7 = TASK_DATA(strc28->task10);
    }

    if (temp_r0 > 7U) {
        if (sp8->qUnk38 >= Q(100)) {
            sp8->qUnk38 = (s32)(sp8->qUnk38 - Q(1));
            sp4->qUnk38 = (s32)(sp4->qUnk38 - Q(1));
            temp_sl->qUnk38 -= Q(1);
            var_r7->qUnk38 -= Q(1);
        }
    }
    if (temp_r0 == 1) {
        sp8->qUnk38 = (s32)(sp8->qUnk38 + 0xA00);
        sp4->qUnk38 = (s32)(sp4->qUnk38 + 0xA00);
        temp_sl->qUnk38 = (s32)(temp_sl->qUnk38 + 0xA00);
        var_r7->qUnk38 = (s32)(var_r7->qUnk38 + 0xA00);
    }
    if (sub_805423C(&strc28->strc0) && (strc28->strc0.unk4 == 4)) {
        if (strc28->unk24 > 0xAU) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
            sub_805D048(1);
            return;
        }
        strc28->unk24 = strc28->unk24 + 1;
    }
    if ((0x12C - Div(0x2000, 0x128)) == temp_r0) {
        strc28->strc0.unk0 = 0;
        strc28->strc0.unk2 = 1;
        strc28->strc0.unk4 = 4;
        strc28->strc0.unk6 = 0;
        strc28->strc0.unk8 = 0x128;
        strc28->strc0.unkA = 1;
    }
    strc28->unk1C = (s16)temp_r0;
    temp_sl->unk30 = temp_r0;
}

void Task_80693D0()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    if (strc44->unk30 == 0) {
        s->graphics.anim = gUnknown_0868B634[gSelectedCharacter][0];
        s->variant = gUnknown_0868B634[gSelectedCharacter][1];
        s->prevVariant = -1;
        strc44->qUnk38 += Q(16);
    }

    strc44->qUnk40 -= Q(1);
    if (strc44->qUnk40 < -Q(100)) {
        strc44->qUnk40 = -Q(100);
    }

    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_8069464()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    if (strc44->unk30 == 0) {
        s->graphics.anim = gUnknown_0868B644[gSelectedCharacter][0];
        s->variant = gUnknown_0868B644[gSelectedCharacter][1];
        s->prevVariant = -1;
        strc44->qUnk38 = Q(180);
    }

    strc44->qUnk40 += strc44->qUnk3C;
    strc44->qUnk38 += strc44->qUnk34;

    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_80694E8()
{
    SpecialStageIntro28 *strc28 = TASK_DATA(gCurTask);
    SpecialStageIntro44 *temp_r6 = TASK_DATA(strc28->taskC);
    u32 temp_r4;

    temp_r4 = strc28->unk1C + 1;
    sub_805423C(&strc28->strc0);
    if (temp_r4 == 0x8C) {
        strc28->taskC->main = Task_8069550;
    }
    if (temp_r4 > 0xA1U) {
        m4aSongNumStart(0x2DU);

        temp_r4 = 0;
        strc28->unk1C = 0;
        temp_r6->unk30 = 0U;
        strc28->taskC->main = Task_80693D0;
        gCurTask->main = Task_8069100;
        return;
    }
    strc28->unk1C = (s16)temp_r4;
    temp_r6->unk30 = temp_r4;
}

void Task_nullsub_806954C(void) { }

void Task_8069550()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    strc44->qUnk38 += 0x4A0;
    if (strc44->qUnk38 > Q(80)) {
        strc44->qUnk38 = Q(80);
    }
    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_8069598(void) { }

void Task_strc44_806959C()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    strc44->qUnk40 -= Q(1);
    if (strc44->qUnk40 < -Q(100)) {
        strc44->qUnk40 = -Q(100);
    }

    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// indentical to Task_strc44_806959C
void sub_80695E8()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    strc44->qUnk40 -= Q(1);
    if (strc44->qUnk40 < -Q(100)) {
        strc44->qUnk40 = -Q(100);
    }

    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8069634()
{
    SpecialStageIntro44 *strc44 = TASK_DATA(gCurTask);
    Sprite *s = &strc44->s;

    s->x = I(strc44->qUnk40);
    s->y = I(strc44->qUnk38);

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        TaskDestroy(gCurTask);
        return;
    }

    s->frameFlags &= ~0x400;
    DisplaySprite(s);
    s->frameFlags |= 0x400;
    DisplaySprite(s);
}
