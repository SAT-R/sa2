#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/credits.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/save.h"
#include "game/sa1/ui/stage_results.h"
#include "game/sa1/stage/stage_ui.h"
#include "data/sa1/ui_graphics.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"

typedef struct {
    StrcUi_805423C strc0;
    struct Task *taskC;
    struct Task *task10;
    struct Task *task14;
    struct Task *task18; // -> ExtraStageResults_164
    struct Task *task1C;
    struct Task *task20;
    struct Task *task24;
    struct Task *task28;
    struct Task *task2C;
    struct Task *tasks30[4]; // ExtraStageResults_64_2
    s16 unk40;
    s8 unk42;
    s16 unk44;
    s16 unk46;
} CongratulationsAnim_48;

typedef struct {
    Sprite s;
    SpriteTransform transform;
    u32 unk3C;
    s32 unk40;
    // TODO: Could these be two 2x2 matrices?
    s32 qUnk44[4];
    s32 qUnk54[4];
} ExtraStageResults_64;

// TODO:
// This might just have been struct ExtraStageResults_164 all along?
typedef struct {
    Sprite s;
    SpriteTransform transform;
    u16 unk3C;
    s32 qUnk40;
    // TODO: Could these be two 2x2 matrices?
    s32 qUnk44[4];
    s32 qUnk54[4];
} ExtraStageResults_64_2;

typedef struct {
    Sprite s;
    SpriteTransform transform;
    u16 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s16 unk50[64];
    u8 fillerD0[0x6];
    s16 unkD6[15];
    u8 fillerF4[0x54];
    u16 unk148;
    u8 filler14A[0x12];
    s8 unk15C;
    u8 filler15E[0x7];
} ExtraStageResults_164;

typedef struct {
    StrcUi_805423C strc0; // -> ExtraStageResults_64
    struct Task *taskC; // -> ExtraStageResults_64
    struct Task *task10; // -> ExtraStageResults_64
    struct Task *task14; // -> ExtraStageResults_64
    struct Task *task18; // -> ExtraStageResults_64
    struct Task *task1C; // -> ExtraStageResults_64
    struct Task *tasks20[3]; // -> ExtraStageResults_164
    struct Task *tasks2C[3]; // -> ExtraStageResults_64_2
    s32 unk38;
    s32 unk3C;
    u8 unk40;
    s32 unk44;
    s32 unk48;
    u8 filler4C[8];
} ExtraStageResultsState; /* 0x54 */

void Task_8065F5C_48(void);
void Task_8066E5C(void);
void Task_nullsub_8066DC8_164(void);
void Task_nullsub_8067050(void);
void Task_80661A8_48(void);
void Task_806636C_48(void);
void sub_80683D8(void);
void Task_80663EC_48(void);
void Task_8066478(void);
void Task_8066520(void);
void Task_8066628(void);
void Task_80666E0(void);
void Task_8066768(void);
void Task_80669A0(void);
void Task_8066A5C_164(void);
void Task_8066ACC(void);
void Task_8066BA4(void);
void Task_8066C78_164(void);
void Task_8066D64(void);
void Task_8066DD0_164(void);
void Task_8066E58_164(void);
void Task_8066F14_164(void);
void Task_8066F30(void);
void Task_8066FDC(void);
void Task_8067020_164(void);
void Task_8067054(void);
void Task_8067084(void);
void sub_80677C4(s32 i);
void Task_8067824(void);
void sub_8067928(void);
void Task_80679E4(void);
void Task_8067B9C(void);
void Task_8067C24(void);
void Task_8067E68(void);
void Task_8067F38(void);
void Task_8067F9C(void);
void Task_8068004(void);
void Task_806806C(void);
void Task_8068148(void);
void Task_8068214(void);
void Task_8068360(void);
void Task_nullsub_8068448(void);
void Task_80684B4(void);
void Task_806853C(void);
void Task_8068570(void);
void Task_80685C8(void);
void Task_8067B14(void);
void sub_806844C(void);
void Task_806856C(void);
void Task_8068620(void);
void Task_8068624(void);
void Task_8068628(void);
void Task_806862C(void);

void Task_8066EBC(void);
void Task_8066F90(void);
void Task_8066DF4(void);
void Task_80662D0_48(void);

extern const u16 gUnknown_0868B3D8[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B3E8[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B3F8[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B408[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B418[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B428[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B438[NUM_CHARACTERS][2];
extern u16 gUnknown_0868B448[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B458[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B468[NUM_CHARACTERS][2];
extern const u16 gUnknown_0868B478[NUM_CHARACTERS][2];
extern const s8 gUnknown_0868B488[2][NUM_CHARACTERS][2];
extern const s8 gUnknown_0868B498[8][2];
extern const u16 gUnknown_0868B4A8[NUM_CHARACTERS][2];
extern const s16 gUnknown_0868B4B8[2];
extern const s16 gUnknown_0868B4BE[2];

extern const u16 gUnknown_086BBC34[256];
extern const u8 gUnknown_086BBE34[0x2980];
extern const u8 gUnknown_086BE7B4[0x1000];

extern const u16 gUnknown_086C5B74[256];
extern const u8 gUnknown_086C5D74[0x1EC0];
extern const u8 gUnknown_086C7C34[0xA00];

extern const u16 gUnknown_086BF7B4[256];
extern const u8 gUnknown_086BF9B4[0x57C0];
extern const u8 gUnknown_086C5174[0xA00];

extern const u16 gUnknown_086C8634[256];
extern const u8 gUnknown_086C8834[0x3540];
extern const u8 gUnknown_086CBD74[0xA00];

static inline void sub_80684F4__inline(s32 comp)
{
    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    if (comp == 25) {
        UiGfxStackInit();
        sub_80538BC();
    } else if (comp == 30) {
        state->unk3C = CreateStageResults((u32)gRingCount, gCourseTime);
        return;
    }
}

void CreateCongratulationsAnimation(void)
{
    struct Task *tasks[3];
    Strc_80528AC gfx;
    ExtraStageResults_164 *strc164;
    CongratulationsAnim_48 *state;
    struct Task *sp40;
    struct Task *sp44;
    struct Task *sp48;
    struct Task *sp4C;
    struct Task *sp50;
    struct Task *temp_r0;
    Sprite *s;
    u8 i;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    {
        u16 prevIME, prevIE, prevDispstat;

        m4aMPlayAllStop();
        m4aSoundVSyncOff();

        gFlags |= FLAGS_8000;

        prevIE = REG_IE;
        prevIME = REG_IME;
        prevDispstat = REG_DISPSTAT;

        REG_IE = 0;
        REG_IE;
        REG_IME = 0;
        REG_IME;
        REG_DISPSTAT = 0;
        REG_DISPSTAT;

        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

        SlowDmaStop(0);
        SlowDmaStop(1);
        SlowDmaStop(2);
        SlowDmaStop(3);

        WriteSaveGame();

        REG_IE = prevIE;
        REG_IE;
        REG_IME = prevIME;
        REG_IME;
        REG_DISPSTAT = prevDispstat;
        REG_DISPSTAT;

        m4aSoundVSyncOn();

        gFlags &= ~FLAGS_8000;
    }

    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x9D86;
    gBgCntRegs[1] = 0x1B8B;
    gBgCntRegs[2] = 0x9880;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    sp44 = TaskCreate(Task_8066DD0_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(sp44);
    s = &strc164->s;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x20;
    s->graphics.anim = gUnknown_0868B3D8[gSelectedCharacter][0];
    s->variant = gUnknown_0868B3D8[gSelectedCharacter][1];
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->oamFlags = 0x180;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    strc164->unk3C = 0;
    strc164->unk44 = 0x780;
    strc164->unk40 = Q(DISPLAY_CENTER_X);
    strc164->unk4C = 0;
    strc164->unk48 = Q(DISPLAY_CENTER_Y);

    sp4C = TaskCreate(Task_8066E58_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(sp4C);
    s = &strc164->s;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x7D00;
    s->graphics.anim = gUnknown_0868B3F8[gSelectedCharacter][0];
    s->variant = gUnknown_0868B3F8[gSelectedCharacter][1];
    s->x = 0x12C;
    s->y = 0x6C;
    s->oamFlags = 0x240;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    strc164->unk3C = 0;
    strc164->unk44 = 0x780;
    strc164->unk40 = Q(0x12C);
    strc164->unk4C = 0;
    strc164->unk48 = Q(0x6C);

    sp48 = TaskCreate(Task_8066F14_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(sp48);
    s = &strc164->s;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0xBA0;
    s->graphics.anim = 0x2E0;
    s->variant = 0;
    s->x = 0x12C;
    s->y = 0x6C;
    s->oamFlags = 0x300;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    strc164->unk3C = 0;
    strc164->unk44 = 0x780;
    strc164->unk40 = Q(0x12C);
    strc164->unk4C = 0;
    strc164->unk48 = Q(0x6C);

    sp40 = TaskCreate(Task_8066A5C_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(sp40);
    s = &strc164->s;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x0940;
    s->graphics.anim = 0x314;
    s->variant = 0;
    s->x = 0xF8;
    s->y = 0x50;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    strc164->unk3C = 0;
    strc164->unk44 = 0x100;
    strc164->unk40 = Q(0xF8);
    strc164->unk4C = 0;
    strc164->unk48 = Q(0x50);
    strc164->unk15C = 0;

    sp50 = TaskCreate(Task_8067020_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(sp50);
    s = &strc164->s;
    strc164->unk3C = 0;
    strc164->unk4C = 0;
    strc164->unk48 = 0;
    strc164->unk44 = 0;
    strc164->unk40 = 0;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x4020;
    s->graphics.anim = gUnknown_0868B3E8[gSelectedCharacter][0];
    s->variant = gUnknown_0868B3E8[gSelectedCharacter][1];
    s->x = 0x78;
    s->y = 0x50;
    s->oamFlags = 0xC0;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    temp_r0 = TaskCreate(Task_8066C78_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
    strc164 = TASK_DATA(temp_r0);
    s = &strc164->s;
    strc164->unk3C = 0;
    strc164->unk4C = 0xF;
    strc164->unk48 = 0;
    strc164->unk44 = 0;
    strc164->unk40 = 0;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x09C0;
    s->graphics.anim = 0x308;
    s->variant = 0;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 3; i++) {
        tasks[i] = TaskCreate(Task_nullsub_8066DC8_164, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
        strc164 = TASK_DATA(tasks[i]);
        s = &strc164->s;
        strc164->unk3C = 0;
        strc164->unk4C = 0xF;
        strc164->unk48 = 0;
        strc164->unk44 = i;
        strc164->unk40 = 0;

        if (i == 0) {
            s->graphics.dest = OBJ_VRAM0 + 0x1AA0;
            s->graphics.anim = 0x311;
            s->variant = 0;
        } else if (i == 1) {
            s->graphics.dest = OBJ_VRAM0 + 0x2340;
            s->graphics.anim = 0x311;
            s->variant = 1;
        } else {
            s->graphics.dest = OBJ_VRAM0 + 0x2820;
            s->graphics.anim = 0x311;
            s->variant = 2;
        }

        s->x = 0xB4;
        s->y = 80;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x1000;
    }

    state = TASK_DATA(TaskCreate(Task_8065F5C_48, sizeof(CongratulationsAnim_48), 0x2100U, 0U, NULL));
    state->unk40 = 0;
    state->unk42 = 1;
    state->taskC = sp50;
    state->task24 = tasks[0];
    state->task28 = tasks[1];
    state->task2C = tasks[2];
    state->task18 = sp44;
    state->task10 = temp_r0;
    state->task14 = sp40;
    state->task1C = sp48;
    state->task20 = sp4C;
    state->unk44 = 0;
    state->unk46 = 0;
    state->strc0.unk0 = 0;
    state->strc0.unk2 = 1;
    state->strc0.unk4 = 8;
    state->strc0.unk6 = 0;
    state->strc0.unk8 = 0x80;
    state->strc0.unkA = 1;
    sub_80543A4(&state->strc0);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086BBE34[0];
    gfx.tilesSize = sizeof(gUnknown_086BBE34);
    gfx.palette = &gUnknown_086BBC34[0];
    gfx.paletteSize = sizeof(gUnknown_086BBC34);
    gfx.layout = &gUnknown_086BE7B4[0];
    gfx.layoutSize = sizeof(gUnknown_086BE7B4);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
    m4aSongNumStart(MUS_CUTSCENE_TORNADO_RESCUE);
}

void Task_8065F5C_48(void)
{
    struct Task *tasks[4];
    ExtraStageResults_64_2 *sp14;
    ExtraStageResults_64_2 *sp18;
    ExtraStageResults_64_2 *sp1C;
    ExtraStageResults_64_2 *temp_sl;
    s16 var_r0;
    s8 *temp_r3_2;
    struct Task *t;
    u16 temp_r3;
    u32 var_r7;
    u8 var_r6;
    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    sp14 = TASK_DATA(state->taskC);
    sp18 = TASK_DATA(state->task18);
    sp1C = TASK_DATA(state->task1C);
    temp_sl = TASK_DATA(state->task20);
    var_r7 = state->unk40 + 1;
    sub_805423C(&state->strc0);
    if (var_r7 == 0xB4) {
        for (var_r6 = 0; var_r6 < 4; var_r6++) {
            ExtraStageResults_64_2 *strc64;
            Sprite *s;
            tasks[var_r6] = TaskCreate(sub_806844C, sizeof(ExtraStageResults_64_2), 0x2120U, 0U, NULL);
            strc64 = TASK_DATA(tasks[var_r6]);
            s = &strc64->s;
            // TODO: Ugly cast
            *((u32 *)&strc64->unk3C) = 0;
            if (var_r6 == 0) {
                strc64->qUnk54[0] = 0xC800;
                strc64->qUnk44[0] = 0x3C00;
                strc64->qUnk44[1] = 0x80;
                strc64->qUnk54[1] = 0xFFFFFC40;
                s->graphics.dest = OBJ_VRAM0 + 0x2E80;
                s->graphics.anim = 0x316;
                s->variant = 0;
                s->oamFlags = 0x4C0;
            } else if (var_r6 == 1) {
                strc64->qUnk54[0] = 0xC800;
                strc64->qUnk44[0] = 0;
                strc64->qUnk44[1] = 0x40;
                strc64->qUnk54[1] = 0xFFFFFC00;
                s->graphics.dest = OBJ_VRAM0 + 0x2FC0;
                s->graphics.anim = 0x317;
                s->variant = 0;
                s->oamFlags = 0x480;
            } else if (var_r6 == 2) {
                strc64->qUnk54[0] = 0xC800;
                strc64->qUnk44[0] = 0x7800;
                strc64->qUnk44[1] = 0x100;
                strc64->qUnk54[1] = 0xFFFFFC80;
                s->graphics.dest = OBJ_VRAM0 + 0x3260;
                s->graphics.anim = 0x318;
                s->variant = 0;
                s->oamFlags = 0x440;
            } else {
                strc64->qUnk54[0] = 0xC800;
                strc64->qUnk44[0] = 0xB400;
                strc64->qUnk44[1] = 0xC0;
                strc64->qUnk54[1] = 0xFFFFFB80;
                s->graphics.dest = OBJ_VRAM0 + 0x3620;
                s->graphics.anim = 0x319;
                s->variant = 0;
                s->oamFlags = 0x400;
            }
            s->x = 0xB4;
            s->y = 0x50;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x1000;
            state->tasks30[var_r6] = tasks[var_r6];
        }
    }
    if (var_r7 == 0x168) {
        state->tasks30[0]->main = Task_80684B4;
        state->tasks30[1]->main = Task_80684B4;
        state->tasks30[2]->main = Task_80684B4;
        state->tasks30[3]->main = Task_80684B4;
    }
    if (var_r7 > 0x190U) {
        var_r7 = 0;
        TaskDestroy(state->task10);
        state->task20->main = Task_8066E5C;
        state->task1C->main = Task_8066F30;
        state->task18->main = Task_8066628;
        state->taskC->main = Task_nullsub_8067050;
        gCurTask->main = Task_80661A8_48;
    }
    state->unk40 = var_r7;
    sp14->unk3C = var_r7;
    sp18->unk3C = var_r7;
    sp1C->unk3C = var_r7;
    temp_sl->unk3C = var_r7;
}

void Task_80661A8_48()
{
    ExtraStageResults_164 *sp0;
    ExtraStageResults_164 *sp4;
    ExtraStageResults_164 *sp8;
    s16 *temp_r3;
    u32 var_r5;
    void *temp_r1;
    void *temp_r3_2;
    void *temp_r4;
    void *strc64_2;
    void *strc64_3;
    void *strc64_4;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    struct Task *task20;
    ExtraStageResults_164 *strc164_t14;
    ExtraStageResults_164 *strc164_t18;
    ExtraStageResults_164 *strc164_t1C;
    ExtraStageResults_164 *strc164_t20;
    ExtraStageResults_164 *strc164_t34;

    // TODO: There's something weird with its typing.
    // Maybe we have multiple 0x164-byte structs, actually?
    ExtraStageResults_64_2 *strc64;

    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    sp0 = TASK_DATA(state->task18);
    sp4 = TASK_DATA(state->task1C);
    sp8 = TASK_DATA(state->task20);
    var_r5 = state->unk40 + 1;
    if (var_r5 == 0xD0) {

        strc64 = TASK_DATA(state->tasks30[0]);
        strc64->qUnk44[0] = -Q(30);
        strc64->qUnk54[0] = -Q(120);
        strc64->qUnk44[1] = Q(0.5);
        strc64->qUnk54[1] = 0;

        strc64 = TASK_DATA(state->tasks30[1]);
        strc64->qUnk44[0] = -Q(60);
        strc64->qUnk54[0] = -Q(90);
        strc64->qUnk44[1] = Q(1.25);
        strc64->qUnk54[1] = 0;

        strc64 = TASK_DATA(state->tasks30[2]);
        strc64->qUnk44[0] = -Q(90);
        strc64->qUnk54[0] = -Q(60);
        strc64->qUnk44[1] = Q(1.00);
        strc64->qUnk54[1] = 0;

        strc64 = TASK_DATA(state->tasks30[3]);
        strc64->qUnk44[0] = -Q(120);
        strc64->qUnk54[0] = -Q(30);
        strc64->qUnk44[1] = Q(0.75);
        strc64->qUnk54[1] = 0;

        state->tasks30[0]->main = sub_80683D8;
        state->tasks30[1]->main = sub_80683D8;
        state->tasks30[2]->main = sub_80683D8;
        state->tasks30[3]->main = sub_80683D8;
    }
    if (var_r5 > 0x118U) {
        var_r5 = 0;
        state->task20->main = Task_8066EBC;
        state->task1C->main = Task_8066F90;
        state->task18->main = Task_8066DF4;
        gCurTask->main = Task_80662D0_48;
    }
    state->unk40 = (s16)var_r5;
    sp0->unk3C = (s16)var_r5;
    sp4->unk3C = (s16)var_r5;
    sp8->unk3C = (s16)var_r5;
}

void Task_80662D0_48(void)
{
    s16 *temp_r2;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    struct Task *task20;
    ExtraStageResults_164 *strc164_t18;
    ExtraStageResults_164 *strc164_t1C;
    ExtraStageResults_164 *strc164_t20;
    u32 unk3C;

    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    task18 = state->task18;
    strc164_t18 = TASK_DATA(task18);
    task1C = state->task1C;
    strc164_t1C = TASK_DATA(task1C);
    task20 = state->task20;
    strc164_t20 = TASK_DATA(task20);
    unk3C = state->unk40 + 1;
    if (unk3C > 16) {
        unk3C = 0;
        state->tasks30[0]->main = Task_8068360;
        state->tasks30[1]->main = Task_8068360;
        state->tasks30[2]->main = Task_8068360;
        state->tasks30[3]->main = Task_8068360;
        task20->main = Task_80669A0;
        task1C->main = Task_8066FDC;
        task18->main = Task_80666E0;
        gCurTask->main = Task_806636C_48;
    }

    state->unk40 = unk3C;
    strc164_t18->unk3C = unk3C;
    strc164_t1C->unk3C = unk3C;
    strc164_t20->unk3C = unk3C;
}

void Task_806636C_48(void)
{
    s16 *temp_r2;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    struct Task *task20;
    ExtraStageResults_164 *strc164_t14;
    ExtraStageResults_164 *strc164_t18;
    ExtraStageResults_164 *strc164_t1C;
    ExtraStageResults_164 *strc164_t20;
    u32 unk3C;

    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    task18 = state->task18;
    strc164_t18 = TASK_DATA(task18);
    task1C = state->task1C;
    strc164_t1C = TASK_DATA(task1C);
    task20 = state->task20;
    strc164_t20 = TASK_DATA(task20);
    unk3C = state->unk40 + 1;
    if (unk3C > 400) {
        unk3C = 0;
        state->task14->main = Task_8066ACC;
        gCurTask->main = Task_80663EC_48;
    }
    if (unk3C == 0x12C) {
        strc164_t20->unk50[0] = 1;
    }
    state->unk40 = unk3C;
    strc164_t18->unk3C = unk3C;
    strc164_t1C->unk3C = unk3C;
    strc164_t20->unk3C = unk3C;
}

void Task_80663EC_48(void)
{
    s16 *temp_r2;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    struct Task *task20;
    ExtraStageResults_164 *strc164_t14;
    ExtraStageResults_164 *strc164_t18;
    ExtraStageResults_164 *strc164_t1C;
    ExtraStageResults_164 *strc164_t20;
    u32 unk3C;

    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    task18 = state->task18;
    strc164_t18 = TASK_DATA(task18);
    task14 = state->task14;
    strc164_t14 = TASK_DATA(task14);
    task1C = state->task1C;
    strc164_t1C = TASK_DATA(task1C);
    task20 = state->task20;
    strc164_t20 = TASK_DATA(task20);
    unk3C = state->unk40 + 1;
    if (unk3C == 0x3C) {
        task14->main = Task_8066BA4;
    }
    if (unk3C > 200) {
        unk3C = 0;
        state->taskC->main = Task_8067054;
        gCurTask->main = Task_8066478;
    }
    state->unk40 = unk3C;
    strc164_t18->unk3C = (unk3C + 0x3FF);
    strc164_t14->unk3C = unk3C;
    strc164_t1C->unk3C = unk3C;
    strc164_t20->unk3C = unk3C;
}

void Task_8066478(void)
{
    s16 *temp_r2;
    struct Task *temp_r6;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    ExtraStageResults_164 *strc164;
    ExtraStageResults_164 *strc164_2;
    ExtraStageResults_164 *strc164_3;
    ExtraStageResults_164 *strc164_4;
    ExtraStageResults_164 *strc164_5;
    u32 var_r3;

    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);

    task18 = state->task18;
    strc164_5 = TASK_DATA(task18);
    task14 = state->task14;
    strc164_2 = TASK_DATA(state->task14);
    task1C = state->task1C;
    strc164_3 = TASK_DATA(task1C);
    strc164 = TASK_DATA(state->task20);
    var_r3 = state->unk40 + 1;
    if (var_r3 > 0xF0U) {
        var_r3 = 0;
        state->task24->main = Task_8066D64;
        state->task28->main = Task_8066D64;
        state->task2C->main = Task_8066D64;
        task18->main = Task_8066768;
        state->taskC->main = Task_8067084;
        gCurTask->main = Task_8066520;
    }
    if (var_r3 == 1) {
        strc164->unk50[0] = var_r3;
    }
    state->unk40 = var_r3;
    strc164_5->unk3C = var_r3;
    strc164_2->unk3C = var_r3;
    strc164_3->unk3C = var_r3;
    strc164->unk3C = var_r3;
}

// (96.54%) https://decomp.me/scratch/bDXGb
NONMATCH("asm/non_matching/game/sa1/ui/extra_stage_results__Task_8066520.inc", void Task_8066520(void))
{
    ExtraStageResults_164 *sp0;
    ExtraStageResults_164 *sp4;
    ExtraStageResults_164 *sp8;
    u32 temp_r5;
    ExtraStageResults_164 *temp_r6;
    ExtraStageResults_164 *temp_r7;
    ExtraStageResults_164 *temp_r8;
    ExtraStageResults_164 *temp_sl;
    ExtraStageResults_164 *temp_sb;
    CongratulationsAnim_48 *state = TASK_DATA(gCurTask);
    StrcUi_805423C *strc0;
    strc0 = &state->strc0;

    temp_sl = TASK_DATA(state->taskC);
    sp0 = TASK_DATA(state->task24);
    sp4 = TASK_DATA(state->task28);
    sp8 = TASK_DATA(state->task2C);
    temp_sb = TASK_DATA(state->task18);
    temp_r8 = TASK_DATA(state->task14);
    temp_r7 = TASK_DATA(state->task1C);
    temp_r6 = TASK_DATA(state->task20);

    temp_r5 = state->unk40 + 1;
    if (temp_r5 > 0x2BCU) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateStaffCredits();
        return;
    } else {
        if (temp_r5 >= 0x29E) {
            if (temp_r5 == 0x29E) {
                strc0->unk0 = 0;
                strc0->unk2 = 1;
                strc0->unk4 = 1;
                strc0->unk6 = 0;
                strc0->unk8 = 0xC0;
                strc0->unkA = 1;
            }
            sub_805423C(strc0);
        }

        state->unk40 = temp_r5;
        temp_sl->unk3C = temp_r5;
        sp0->unk3C = temp_r5;
        sp4->unk3C = temp_r5;
        sp8->unk3C = temp_r5;
        temp_sb->unk3C = temp_r5;
        temp_r8->unk3C = temp_r5;
        temp_r7->unk3C = temp_r5;
        temp_r6->unk3C = temp_r5;
    }
}
END_NONMATCH

void Task_8066628()
{
    s32 temp_r0;
    s32 temp_r0_2;
    u16 unk3C;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    unk3C = strc164->unk3C;
    if (unk3C == 15) {
        s->graphics.anim = gUnknown_0868B418[gSelectedCharacter][0];
        s->variant = gUnknown_0868B418[gSelectedCharacter][1];
        s->prevVariant = -1;
    } else if (unk3C == 20) {
        s->graphics.anim = gUnknown_0868B428[gSelectedCharacter][0];
        s->variant = gUnknown_0868B428[gSelectedCharacter][1];
        s->prevVariant = -1;
    } else if (unk3C == 30) {
        s->graphics.anim = gUnknown_0868B438[gSelectedCharacter][0];
        s->variant = gUnknown_0868B438[gSelectedCharacter][1];
        s->prevVariant = -1;
    }

    if (unk3C > 20) {
        strc164->unk48 -= Q(8);
        if (strc164->unk48 < -Q(64)) {
            strc164->unk48 = -Q(64);
        }
        s->y = I(strc164->unk48);

        strc164->unk40 -= strc164->unk44;
        if (strc164->unk40 < 0) {
            strc164->unk40 = 0;
        }
        s->x = I(strc164->unk40);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_80666E0()
{
    s32 temp_r0;
    u32 temp_r4;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    temp_r4 = strc164->unk3C;
    if (temp_r4 == 0x12C) {
        s->graphics.anim = gUnknown_0868B448[gSelectedCharacter][0];
        s->variant = gUnknown_0868B448[gSelectedCharacter][1];
        s->prevVariant = 0xFF;
    }

    strc164->unk48 = strc164->unk48 + (SIN((temp_r4 % 256u) * 4) >> 8);
    s->y = I(strc164->unk48);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066768()
{
    SpriteTransform *tf;
    s32 temp_r0;
    s16 temp_r0_2;
    s16 temp_r0_3;
    s32 var_r1;
    u16 unk3C;
    u16 var_r0;
    void *temp_r2;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    tf = &strc164->transform;
    unk3C = strc164->unk3C;
    if (unk3C == 1) {
        s->graphics.anim = gUnknown_0868B458[gSelectedCharacter][0];
        s->variant = gUnknown_0868B458[gSelectedCharacter][1];
        s->prevVariant = -1;
    } else if (unk3C == 0xF0) {
        s->graphics.anim = gUnknown_0868B468[gSelectedCharacter][0];
        s->variant = gUnknown_0868B468[gSelectedCharacter][1];
        s->prevVariant = -1;
        strc164->unk4C = -0x400;
    }
    if (unk3C >= 0x12C) {
        if (unk3C == 0x12C) {
            s->graphics.anim = gUnknown_0868B478[gSelectedCharacter][0];
            s->variant = gUnknown_0868B478[gSelectedCharacter][1];
            s->prevVariant = -1;
            tf->rotation = 0;
            temp_r0 = Div(Q(7), 10);
            tf->qScaleX = temp_r0;
            tf->qScaleY = temp_r0;
            tf->x = (s16)(u16)s->x;
            tf->y = (s16)(u16)s->y;
        }
        strc164->unk4C += 0x1E;
        strc164->unk48 += strc164->unk4C;
    } else {
        strc164->unk48 += (SIN_24_8(((unk3C % 256u) * 4)) >> 0x2);
    }

    s->y = I(strc164->unk48);

    if (unk3C >= 300) {
        if (unk3C == 300) {
            tf->x = tf->x - gUnknown_0868B488[0][gSelectedCharacter][0];
            tf->y = s->y - gUnknown_0868B488[0][gSelectedCharacter][0];
        } else if (unk3C == 301) {
            tf->x = gUnknown_0868B488[1][gSelectedCharacter][0] + (SIN_24_8(44) >> 6) + tf->x;
            tf->y = gUnknown_0868B488[1][gSelectedCharacter][0] + s->y;
        } else {
            tf->x = (SIN(((unk3C - 300) * 12) + 0x20) >> 12) + (u16)tf->x;
            tf->y = (u16)s->y;
        }

        tf->qScaleX += Q(4. / 256.);
        if (tf->qScaleX > Q(1.5)) {
            tf->qScaleX = Q(1.5);
        }

        tf->qScaleY += Q(4. / 256.);
        if (tf->qScaleY > Q(1.5)) {
            tf->qScaleY = Q(1.5);
        }
        s->frameFlags = 0x1061;
        TransformSprite(s, tf);
    } else {
        s->frameFlags = 0x1000;
    }
    UpdateSpriteAnimation(s);
    if (unk3C <= 360) {
        DisplaySprite(s);
    }
}

void Task_80669A0()
{
    u8 *var_r1;
    s32 temp_r0;
    u16 unk3C;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    unk3C = strc164->unk3C;
    if (unk3C == 0x12C) {
        if (strc164->unk50[0] != 0) {
            s->graphics.anim = gUnknown_0868B408[gSelectedCharacter][0];
            s->variant = gUnknown_0868B408[gSelectedCharacter][1];
            s->prevVariant = -1;
            strc164->unk50[0] = 0;
        }
    } else if (unk3C == 1) {
        if (strc164->unk50[0] != 0) {
            s->graphics.anim = gUnknown_0868B3F8[gSelectedCharacter][0];
            s->variant = gUnknown_0868B3F8[gSelectedCharacter][1];
            s->prevVariant = -1;
            strc164->unk50[0] = 0;
        }
    }

    strc164->unk48 += I(SIN((unk3C % 256u) * 4));
    s->y = I(strc164->unk48);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066A5C_164()
{
    s32 modRes;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    u16 unk3C = strc164->unk3C;

    if (++strc164->unk15C > 63) {
        strc164->unk15C = 0;
    }

    modRes = Mod(unk3C, 64);
    strc164->unk50[strc164->unk15C] = SIN(modRes * 8) >> 10;
    strc164->unkD6[strc164->unk15C] = SIN(modRes * 8) >> 10;
}

void Task_8066ACC(void)
{
    s16 *temp_r4;
    s32 temp_r1;
    s32 temp_r2;
    u8 *temp_r5;
    u8 i;
    s32 modRes;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    u16 unk3C = strc164->unk3C;

    if (++strc164->unk15C > 63) {
        strc164->unk15C = 0;
    }

    modRes = Mod(unk3C, 64);
    strc164->unk50[strc164->unk15C] = SIN(modRes * 8) >> 10;
    strc164->unkD6[strc164->unk15C] = SIN(modRes * 8) >> 10;
    UpdateSpriteAnimation(s);

    for (i = 0; i < ARRAY_COUNT(gUnknown_0868B498); i++) {
        s32 index;
        s32 v = gUnknown_0868B498[i][0] + 0xF8;
        s->x = v - unk3C;
        index = ((u8)strc164->unk15C + i * 8) & 0x3F;
        s->y = gUnknown_0868B498[i][1] + DISPLAY_CENTER_Y + strc164->unkD6[index];
        DisplaySprite(s);
    }
}

void Task_8066BA4(void)
{
    s16 *temp_r4;
    s32 temp_r1;
    s32 temp_r2;
    u8 *temp_r5;
    u8 i;
    s32 modRes;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    u16 unk3C = strc164->unk3C;

    if (++strc164->unk15C > 63) {
        strc164->unk15C = 0;
    }

    modRes = Mod(unk3C, 64);
    strc164->unk50[strc164->unk15C] = SIN(modRes * 8) >> 10;
    strc164->unkD6[strc164->unk15C] = SIN(modRes * 8) >> 10;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 8; i++) {
        s32 index;
        s32 v;
        s->x = gUnknown_0868B498[i][0] + 0xBC;
        index = ((u8)strc164->unk15C + i * 8) & 0x3F;
        s->y = gUnknown_0868B498[i][1] + DISPLAY_CENTER_Y + strc164->unkD6[index];
        DisplaySprite(s);
    }
}

void Task_8066C78_164()
{
    u32 unk3C;
    s32 sp0;
    s32 temp_r0_3;
    s32 temp_r0_4;
    s32 temp_r2;
    s32 var_r4;
    u16 *temp_r1;
    u16 temp_r0;
    u8 *temp_r5;
    u8 *var_r2;
    u8 *var_r3;
    u8 temp_r0_2;
    u8 var_r8;

    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    unk3C = ++strc164->unk3C;
    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    for (var_r8 = 0; var_r8 < 15; var_r8++) {
        if ((unk3C + var_r8) & 0xF) {
            temp_r2 = var_r8 * 2;
            strc164->unkD6[var_r8] -= 0x10;
        } else {
            s32 rnd2;
            temp_r0_3 = PseudoRandom32();
            strc164->unkD6[var_r8] = Mod(temp_r0_3, 40) + 0x8C;
            rnd2 = PseudoRandom32();
            strc164->unk50[var_r8] = Mod(rnd2, 0xDC) + 0x14;
            var_r3 = temp_r5;
        }
        s->x = strc164->unk50[var_r8];
        s->y = strc164->unkD6[var_r8];
        DisplaySprite(s);
    }
}

void Task_8066D64()
{
    u32 unk3C;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    unk3C = strc64->unk3C;
    // TODO: Potential signedness bug?
    if (unk3C > gUnknown_0868B4BE[strc64->qUnk44[0]]) {
        unk3C -= gUnknown_0868B4BE[strc64->qUnk44[0]];
        unk3C *= 3;
        s->x = DISPLAY_CENTER_X;
        s->y = 180 - unk3C;
        if (s->y < gUnknown_0868B4B8[strc64->qUnk44[0]]) {
            s->y = gUnknown_0868B4B8[strc64->qUnk44[0]];
        }
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_nullsub_8066DC8_164(void) { ExtraStageResults_164 *strc164; }

void Task_nullsub_8066DCC(void) { }

void Task_8066DD0_164()
{
    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066DF4()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;
    u16 unk3C = strc64->unk3C;

    strc64->qUnk40 += strc64->qUnk44[0];

    s->x = I(strc64->qUnk40) - 20;

    strc64->qUnk44[1] += Q(8);
    s->y = (s16)((s32)strc64->qUnk44[1] >> 8);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// unused, inline?
void sub_8066E34(void)
{
    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066E58_164(void) { }

// Literally identical to Task_8066F30()
void Task_8066E5C()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;
    u16 unk3C = strc64->unk3C;

    strc64->qUnk40 -= strc64->qUnk44[0];
    if (strc64->qUnk40 < 0) {
        strc64->qUnk40 = 0;
    }

    s->x = I(strc64->qUnk40);

    if (unk3C > 20) {
        strc64->qUnk44[1] -= Q(8);
        if (strc64->qUnk44[1] < -Q(30)) {
            strc64->qUnk44[1] = -Q(30);
        }
        s->y = (s16)((s32)strc64->qUnk44[1] >> 8);
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066EBC()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;
    u16 unk3C = strc64->unk3C;

    strc64->qUnk40 += strc64->qUnk44[0];
    if (strc64->qUnk40 < 0) {
        strc64->qUnk40 = 0;
    }

    s->x = I(strc64->qUnk40);

    strc64->qUnk44[1] += Q(8);

    if (strc64->qUnk44[1] < -Q(30)) {
        strc64->qUnk44[1] = -Q(30);
    }
    s->y = (s16)((s32)strc64->qUnk44[1] >> 8);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066F14_164(void)
{
    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    UpdateSpriteAnimation(s);
}

void Task_8066F30()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;
    u16 unk3C = strc64->unk3C;

    strc64->qUnk40 -= strc64->qUnk44[0];
    if (strc64->qUnk40 < 0) {
        strc64->qUnk40 = 0;
    }

    s->x = I(strc64->qUnk40);

    if (unk3C > 20) {
        strc64->qUnk44[1] -= Q(8);
        if (strc64->qUnk44[1] < -Q(30)) {
            strc64->qUnk44[1] = -Q(30);
        }
        s->y = (s16)((s32)strc64->qUnk44[1] >> 8);
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066F90()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    strc64->qUnk40 += strc64->qUnk44[0];
    if (strc64->qUnk40 < 0) {
        strc64->qUnk40 = 0;
    }
    s->x = I(strc64->qUnk40);
    strc64->qUnk44[1] += Q(8);
    s->y = I(strc64->qUnk44[1]);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8066FDC(void)
{
    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;
    u16 unk3C = strc64->unk3C;

    strc64->qUnk44[1] += (SIN((unk3C & 0xFF) * 4) >> 8);
    s->y = I(strc64->qUnk44[1]);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8067020_164(void)
{
    ExtraStageResults_164 *strc164 = TASK_DATA(gCurTask);
    Sprite *s = &strc164->s;

    if (Mod(strc164->unk3C, 2) == 0) {
        gBgScrollRegs[0][1]++;
    }
}

void Task_nullsub_8067050(void) { }

void Task_8067054(void)
{
    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8067084()
{
    ExtraStageResults_64_2 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    if (strc64->unk3C >= 360) {
        if (strc64->unk3C == 360) {
            s->graphics.anim = gUnknown_0868B4A8[gSelectedCharacter][0];
            s->variant = gUnknown_0868B4A8[gSelectedCharacter][1];
            s->prevVariant = -1;
        }
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void CreateExtraStageResults(void)
{
    struct Task *tasks[4];
    Strc_80528AC gfx;
    struct Task *task64_0;
    struct Task *task64_2;
    struct Task *task64_1;
    StrcUi_805423C *temp_r0_11;
    s16 var_r0;
    s16 var_r1;
    s8 *temp_r1_5;
    s8 *temp_r1_6;
    struct Task *task64_3;
    struct Task *task64_4;
    struct Task *temp_r2_6;
    ExtraStageResultsState *state;
    ExtraStageResults_64 *strc64;
    Sprite *s;
    u8 i, i2;

    i = 0;
    LOADED_SAVE->unlockedLevels[0] = 0xF;
    LOADED_SAVE->unk424 = 1;
    {
        u16 prevIME, prevIE, prevDispstat;

        m4aMPlayAllStop();
        m4aSoundVSyncOff();

        gFlags |= FLAGS_8000;

        prevIE = REG_IE;
        prevIME = REG_IME;
        prevDispstat = REG_DISPSTAT;

        REG_IE = 0;
        REG_IE;
        REG_IME = 0;
        REG_IME;
        REG_DISPSTAT = 0;
        REG_DISPSTAT;

        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

        SlowDmaStop(0);
        SlowDmaStop(1);
        SlowDmaStop(2);
        SlowDmaStop(3);

        WriteSaveGame();

        REG_IE = prevIE;
        REG_IE;
        REG_IME = prevIME;
        REG_IME;
        REG_DISPSTAT = prevDispstat;
        REG_DISPSTAT;

        m4aSoundVSyncOn();

        gFlags &= ~FLAGS_8000;
    }

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1740;
    gBgCntRegs[0] = 0x8583;
    gBgCntRegs[1] = 0x9E86;
    gBgCntRegs[2] = 0x9B89;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    task64_0 = TaskCreate(Task_8068628, sizeof(ExtraStageResults_64), 0x2120U, 0U, NULL);
    strc64 = TASK_DATA(task64_0);
    s = &strc64->s;
    strc64->unk3C = 0;
    strc64->qUnk44[0] = Q(160);
    strc64->qUnk54[0] = -Q(32);
    s->graphics.dest = OBJ_VRAM0 + 0x2560;
    s->graphics.anim = SA1_ANIM_FINAL_CUTSCENE_SPARKLE_B;
    s->variant = 0;
#ifdef BUG_FIX
    s->x = 160;
    s->y = -32;
#else
    s->x = Q(160); // NOTE: These shouldn't be Q()!
    s->y = -Q(32); // NOTE: These shouldn't be Q()!
#endif
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;

    task64_1 = TaskCreate(Task_8068620, sizeof(ExtraStageResults_64), 0x2120U, 0U, NULL);
    strc64 = TASK_DATA(task64_1);
    s = &strc64->s;
    strc64->unk3C = 0;
    strc64->qUnk44[0] = Q(DISPLAY_CENTER_X);
    strc64->qUnk54[0] = Q(DISPLAY_CENTER_Y + 10);
    s->graphics.dest = OBJ_VRAM0 + 0x440;
    s->graphics.anim = SA1_END_CUTSCENE_PILOT_FACE;
    s->variant = 1; // Tails
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;

    task64_2 = TaskCreate(Task_8068624, sizeof(ExtraStageResults_64), 0x2120U, 0U, NULL);
    strc64 = TASK_DATA(task64_2);
    s = &strc64->s;
    strc64->unk3C = 0;
    strc64->qUnk44[0] = Q(DISPLAY_CENTER_X);
    strc64->qUnk54[0] = Q(DISPLAY_CENTER_Y + 10);
    s->graphics.dest = OBJ_VRAM0 + 0x560;
    s->graphics.anim = SA1_ANIM_FINAL_CUTSCENE_TORNADO_SIDE;
    s->variant = 0;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->oamFlags = SPRITE_OAM_ORDER(6);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;

    task64_3 = TaskCreate(Task_806806C, sizeof(ExtraStageResults_64), 0x2120U, 0U, NULL);
    strc64 = TASK_DATA(task64_3);
    s = &strc64->s;
    strc64->unk3C = 0;
    strc64->qUnk44[0] = 105;
    strc64->qUnk54[0] = 17;
    strc64->qUnk44[1] = 47;
    strc64->qUnk54[1] = 95;
    strc64->qUnk44[2] = 213;
    strc64->qUnk54[2] = 69;
    strc64->qUnk44[3] = 168;
    strc64->qUnk54[3] = 95;
    s->graphics.dest = OBJ_VRAM0 + 0x20;
    s->graphics.anim = 731;
    s->variant = 0;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    for (i2 = 0; i2 < ARRAY_COUNT(tasks); i2++) {
        struct Task *t = TaskCreate(Task_nullsub_8068448, sizeof(ExtraStageResults_64_2), 0x2120U, 0U, NULL);
        tasks[i2] = t;
        strc64 = TASK_DATA(t);
        s = &strc64->s;
        strc64->unk3C = 0;
        if (i2 == 0) {
            strc64->qUnk54[0] = Q(50);
            strc64->qUnk44[0] = Q(80);
            strc64->qUnk44[1] = 0x80;
            strc64->qUnk54[1] = 0;
            s->graphics.dest = OBJ_VRAM0 + 0x6060;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_XS;
            s->variant = 0;
        } else if (i2 == 1) {
            strc64->qUnk54[0] = Q(100);
            strc64->qUnk44[0] = Q(40);
            strc64->qUnk44[1] = 0x40;
            strc64->qUnk54[1] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x61A0;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_S;
            s->variant = 0;
        } else if (i2 == 2) {
            strc64->qUnk54[0] = Q(120);
            strc64->qUnk44[0] = Q(120);
            strc64->qUnk44[1] = 0x100;
            strc64->qUnk54[1] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x6440;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_M;
            s->variant = 0;
        } else {
            strc64->qUnk54[0] = Q(20);
            strc64->qUnk44[0] = Q(160);
            strc64->qUnk44[1] = 0xC0;
            strc64->qUnk54[1] = 0U;
            s->graphics.dest = OBJ_VRAM0 + 0x70A0;
            s->graphics.anim = SA1_ANIM_SOME_CLOUD_L;
            s->variant = 0;
        }

        s->x = 180;
        s->y = 80;
        s->oamFlags = SPRITE_OAM_ORDER(12);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x1000;
    }

    task64_4 = TaskCreate(Task_8067F38, sizeof(ExtraStageResults_64), 0x2120U, 0U, NULL);
    strc64 = TASK_DATA(task64_4);
    s = &strc64->s;
    strc64->unk3C = 0;
    strc64->qUnk54[0] = 0;
    strc64->qUnk44[0] = 0;
    strc64->qUnk54[1] = 0;
    strc64->qUnk44[1] = 0;
    strc64->qUnk54[2] = 0;
    strc64->qUnk44[2] = 0;
    s->graphics.dest = OBJ_VRAM0 + 0xA0;
    if (LOADED_SAVE->uiLanguage != UILANG_JAPANESE) {
        s->graphics.anim = SA1_ANIM_A_FEW_DAYS_LATER_EN;
        s->variant = 0;
    } else {
        s->graphics.anim = SA1_ANIM_A_FEW_DAYS_LATER_JP;
        s->variant = 0;
    }
    s->x = 120;
    s->y = 80;
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x80;
    temp_r2_6 = TaskCreate(Task_8067824, sizeof(ExtraStageResultsState), 0x2100U, 0U, NULL);
    state = TASK_DATA(temp_r2_6);
    state->unk38 = 0;
    state->unk3C = 0x3C;
    state->unk40 = 1;
    state->taskC = task64_4;
    state->task14 = task64_0;
    state->task10 = task64_3;
    state->task18 = task64_2;
    state->task1C = task64_1;
    state->tasks20[0] = tasks[0];
    state->tasks20[1] = tasks[1];
    state->tasks20[2] = tasks[2];
    state->tasks2C[0] = tasks[3];
    state->unk44 = 0;
    state->unk48 = 0;
    state->strc0.unk0 = 0;
    state->strc0.unk2 = 1;
    state->strc0.unk4 = 8;
    state->strc0.unk6 = 0;
    state->strc0.unk8 = 0x80;
    state->strc0.unkA = 1;
    sub_80543A4(&state->strc0);

    gfx.uiGfxID = 128;
    gfx.unk2B = 2;
    gfx.tiles = &gUnknown_086C5D74[0];
    gfx.tilesSize = sizeof(gUnknown_086C5D74);
    gfx.palette = &gUnknown_086C5B74[0];
    gfx.paletteSize = sizeof(gUnknown_086C5B74);
    gfx.layout = &gUnknown_086C7C34[0];
    gfx.layoutSize = sizeof(gUnknown_086C7C34);
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);

    gfx.uiGfxID = 128;
    gfx.unk2B = 0;
    gfx.tiles = &gUnknown_086BF9B4[0];
    gfx.tilesSize = sizeof(gUnknown_086BF9B4);
    gfx.palette = &gUnknown_086BF7B4[0];
    gfx.paletteSize = sizeof(gUnknown_086BF7B4);
    gfx.layout = &gUnknown_086C5174[0];
    gfx.layoutSize = sizeof(gUnknown_086C5174);
    gfx.unk28 = 0;
    gfx.unk29 = 2;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);

    gfx.uiGfxID = 128;
    gfx.unk2B = 1;
    gfx.tiles = &gUnknown_086C8834[0];
    gfx.tilesSize = sizeof(gUnknown_086C8834);
    gfx.palette = &gUnknown_086C8634[0];
    gfx.paletteSize = sizeof(gUnknown_086C8634);
    gfx.layout = &gUnknown_086CBD74[0];
    gfx.layoutSize = sizeof(gUnknown_086CBD74);
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
}

void sub_80677C4(s32 i)
{
    Strc_80528AC gfx;

    if (i == 1) {
        UiGfxStackInit();
        gfx.uiGfxID = 128;
        gfx.unk2B = 0;
        gfx.tiles = &gUnknown_086BBE34[0];
        gfx.tilesSize = sizeof(gUnknown_086BBE34);
        gfx.palette = &gUnknown_086BBC34[0];
        gfx.paletteSize = sizeof(gUnknown_086BBC34);
        gfx.layout = &gUnknown_086BE7B4[0];
        gfx.layoutSize = sizeof(gUnknown_086BE7B4);
        gfx.unk28 = 0;
        gfx.unk29 = 0;
        gfx.unk2A = 0x15;
        sub_80528AC(&gfx);
    }
}

void Task_8067824(void)
{
    ExtraStageResultsState *state = TASK_DATA(gCurTask);
    ExtraStageResults_64 *strc64_0 = TASK_DATA(state->taskC);
    ExtraStageResults_64 *strc64_1 = TASK_DATA(state->task10);
    s32 v0;
    s32 v1;

    u32 temp_r6 = (state->unk38 + 1);
    sub_80684F4__inline(temp_r6);

    if (temp_r6 == state->unk3C) {
        m4aSongNumStart(MUS_CUTSCENE_A_FEW_DAYS_LATER);
    }

    v0 = Div(0x2000, 0x80);
    v1 = state->unk3C;
    v1 += 0x21C;
    if ((v0 + v1) < temp_r6) {
        temp_r6 = 0;
        state->unk38 = temp_r6;
        strc64_0->unk3C = temp_r6;
        TaskDestroy(state->task10);
        state->taskC->main = Task_806853C;
        gCurTask->main = sub_8067928;
    } else {
        s32 divRes2 = Div(0x2000, 0x80);
        s32 v0 = Div(0x2000, 0x80);
        s32 v1 = state->unk3C;
        v1 += 0x21C;
        if ((divRes2 + v1 - v0) == temp_r6) {
            state->strc0.unk0 = 0;
            state->strc0.unk2 = 1;
            state->strc0.unk4 = 1;
            state->strc0.unk6 = 0;
            state->strc0.unk8 = 0x80;
            state->strc0.unkA = 1;
        }

        sub_805423C(&state->strc0);
        state->unk38 = temp_r6;
        strc64_0->unk3C = temp_r6;
        strc64_1->unk3C = temp_r6;
        strc64_0->unk40 = state->unk3C;
        strc64_1->unk40 = state->unk3C;
    }
}

void sub_8067928()
{
    ExtraStageResults_64 *task;
    u32 var_r5;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    task = TASK_DATA(state->taskC);
    var_r5 = state->unk38 + 1;
    if ((u32)(Div(0x2000, 0x80) + 600) < var_r5) {
        gDispCnt = 0x1140;
        gBgCntRegs[0] = 0x9B83;
        state->strc0.unk0 = 0;
        state->strc0.unk2 = 1;
        state->strc0.unk4 = 2;
        state->strc0.unk6 = 0;
        state->strc0.unk8 = 0x80;
        state->strc0.unkA = 1;
        sub_805423C(&state->strc0);
        var_r5 = 0;
        state->tasks20[0]->main = Task_8068360;
        state->tasks20[1]->main = Task_8068360;
        state->tasks20[2]->main = Task_8068360;
        state->tasks2C[0]->main = Task_8068360;
        state->task14->main = Task_806862C;
        state->task18->main = Task_8068214;
        state->task1C->main = Task_8068148;
        state->taskC->main = Task_806856C;
        gCurTask->main = Task_80679E4;
    }

    state->unk38 = var_r5;
    task->unk3C = var_r5;
}

void Task_80679E4()
{
    ExtraStageResults_64 *sp0;
    ExtraStageResults_64 *sp4;
    ExtraStageResults_64 *temp_sb;
    ExtraStageResults_64 *temp_sl;
    u32 temp_r5;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    temp_sb = TASK_DATA(state->taskC);
    sp0 = TASK_DATA(state->task1C);
    sp4 = TASK_DATA(state->task14);
    temp_sl = TASK_DATA(state->task18);
    temp_r5 = state->unk38 + 1;
    sub_80677C4(temp_r5);
    gBgScrollRegs[0][1] = 0x128;
    if (temp_r5 > 0x336U) {
        temp_r5 = 0;
        state->unk38 = 0;
        temp_sb->unk3C = 0U;
        TaskDestroy(state->tasks20[0]);
        TaskDestroy(state->tasks20[1]);
        TaskDestroy(state->tasks20[2]);
        TaskDestroy(state->tasks2C[0]);
        TaskDestroy(state->task1C);
        TaskDestroy(state->task14);
        TaskDestroy(state->task18);
        state->taskC->main = Task_8068570;
        gCurTask->main = Task_8067B14;
        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x14;
        gBgScrollRegs[0][1] = 0;
        state->strc0.unk0 = 0;
        state->strc0.unk2 = 1;
        state->strc0.unk4 = 2;
        state->strc0.unk6 = 0;
        state->strc0.unk8 = 0x80;
        state->strc0.unkA = 1;
    } else {
        if ((0x336 - Div(0x2000, 0x80)) == temp_r5) {
            state->strc0.unk0 = 0;
            state->strc0.unk2 = 1;
            state->strc0.unk4 = 1;
            state->strc0.unk6 = 0;
            state->strc0.unk8 = 0x80;
            state->strc0.unkA = 1;
        }
        sub_805423C(&state->strc0);
        state->unk38 = (s32)temp_r5;
        temp_sb->unk3C = temp_r5;
        sp0->unk3C = temp_r5;
        sp4->unk3C = temp_r5;
        temp_sl->unk3C = temp_r5;
    }
}

void Task_8067B14()
{
    ExtraStageResults_64 *sp0;
    ExtraStageResults_64 *sp4;
    ExtraStageResults_64 *temp_sb;
    ExtraStageResults_64 *temp_sl;
    u32 temp_r5;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    temp_sb = TASK_DATA(state->taskC);
    sp0 = TASK_DATA(state->task1C);
    sp4 = TASK_DATA(state->task14);
    temp_sl = TASK_DATA(state->task18);
    temp_r5 = state->unk38 + 1;
    if (temp_r5 > 400) {
        temp_r5 = 0;
        state->unk38 = 0;
        temp_sb->unk3C = 0U;
        state->strc0.unk0 = 0;
        state->strc0.unk2 = 1;
        state->strc0.unk4 = 2;
        state->strc0.unk6 = 0;
        state->strc0.unk8 = 0x80;
        state->strc0.unkA = 1;
        state->taskC->main = Task_80685C8;
        gCurTask->main = Task_8067B9C;
    } else {
        if ((400 - Div(0x2000, 0x80)) == temp_r5) {
            state->strc0.unk0 = 0;
            state->strc0.unk2 = 1;
            state->strc0.unk4 = 1;
            state->strc0.unk6 = 0;
            state->strc0.unk8 = 0x80;
            state->strc0.unkA = 1;
        }

        sub_805423C(&state->strc0);
        state->unk38 = (s32)temp_r5;
        temp_sb->unk3C = temp_r5;
    }
}

void Task_8067B9C()
{
    ExtraStageResults_64 *sp0;
    ExtraStageResults_64 *sp4;
    ExtraStageResults_64 *temp_sb;
    ExtraStageResults_64 *temp_sl;
    u32 temp_r5;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    temp_sb = TASK_DATA(state->taskC);
    sp0 = TASK_DATA(state->task1C);
    sp4 = TASK_DATA(state->task14);
    temp_sl = TASK_DATA(state->task18);
    temp_r5 = state->unk38 + 1;
    if (temp_r5 > 400) {
        temp_r5 = 0;
        state->unk38 = 0;
        temp_sb->unk3C = 0U;
        state->strc0.unk0 = 0;
        state->strc0.unk2 = 1;
        state->strc0.unk4 = 2;
        state->strc0.unk6 = 0;
        state->strc0.unk8 = 0x80;
        state->strc0.unkA = 1;
        state->taskC->main = Task_8067F9C;
        gCurTask->main = Task_8067C24;
    } else {
        if ((400 - Div(0x2000, 0x80)) == temp_r5) {
            state->strc0.unk0 = 0;
            state->strc0.unk2 = 1;
            state->strc0.unk4 = 1;
            state->strc0.unk6 = 0;
            state->strc0.unk8 = 0x80;
            state->strc0.unkA = 1;
        }

        sub_805423C(&state->strc0);
        state->unk38 = (s32)temp_r5;
        temp_sb->unk3C = temp_r5;
    }
}

// (81.56%) https://decomp.me/scratch/L5YKY
NONMATCH("asm/non_matching/game/sa1/ui/extra_stage_results__Task_8067C24.inc", void Task_8067C24())
{
    struct Task *tasks[3];
    u32 sp10;
    ExtraStageResults_64 *sp14;
    ExtraStageResults_164 *temp_r3_2;
    Sprite *s;
    s32 temp_r0;
    s32 var_r0;
    s32 var_r0_2;
    s32 var_r3;
    u16 var_r8_2;
    s8 *temp_r1_5;
    struct Task *temp_r0_5;
    u16 temp_r0_3;
    u16 temp_r0_4;
    u16 temp_r1;
    u16 temp_r1_2;
    u16 temp_r1_4;
    u16 var_r8;
    u32 temp_r0_2;
    u32 temp_r1_3;
    u32 temp_r2;
    u32 temp_r3;
    u32 temp_r4;
    u32 temp_r5;
    u32 temp_r6;
    u32 temp_r7;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    sp14 = TASK_DATA(state->taskC);
    temp_r0 = state->unk38;
    sp10 = temp_r0 + 1;
    temp_r0_2 = temp_r0 - 0xB3;
    if (temp_r0_2 <= 0x80U) {
        temp_r7 = temp_r0_2 >> 4;
        for (var_r8 = 2; var_r8 < 16; var_r8++) {
            temp_r1 = gUiPaletteSoundTestBox3[var_r8];
            temp_r3 = 0x1F;
            temp_r3 &= temp_r1;
            temp_r5 = (u32)(0x3E0 & temp_r1) >> 5;
            temp_r4 = (u32)(0x7C00 & temp_r1) >> 0xA;
            temp_r1_2 = gUiPaletteSoundTestBox4[var_r8];
            temp_r2 = 0x1F & temp_r1_2;
            temp_r6 = (u32)(0x3E0 & temp_r1_2) >> 5;
            temp_r1_3 = (u32)(0x7C00 & temp_r1_2) >> 0xA;
            if (temp_r3 > temp_r2) {
                var_r3 = (temp_r3 - ((u32)(temp_r7 * (temp_r3 - temp_r2)) >> 3)) & 0x1F;
            } else {
                var_r3 = (temp_r3 + ((u32)(temp_r7 * (temp_r2 - temp_r3)) >> 3)) & 0x1F;
            }
            if (temp_r5 > temp_r6) {
                var_r0 = temp_r5 - ((u32)(temp_r7 * (temp_r5 - temp_r6)) >> 3);
            } else {
                var_r0 = temp_r5 + ((u32)(temp_r7 * (temp_r6 - temp_r5)) >> 3);
            }
            if (temp_r4 > temp_r1_3) {
                var_r0_2 = (temp_r4 - ((u32)(temp_r7 * (temp_r4 - temp_r1_3)) >> 3)) & 0x1F;
            } else {
                var_r0_2 = (temp_r4 + ((u32)(temp_r7 * (temp_r1_3 - temp_r4)) >> 3)) & 0x1F;
            }
            gObjPalette[14 * 16 + var_r8] = (var_r0_2 << 0xA) | (var_r3 | ((var_r0 & 0x1F) << 5));
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    if (sp10 > 0x190U) {
        sp10 = 0;
        for (var_r8_2 = 0; var_r8_2 < 3; var_r8_2++) {
            temp_r0_5 = TaskCreate(Task_8066D64, sizeof(ExtraStageResults_164), 0x2120U, 0U, NULL);
            tasks[var_r8_2] = temp_r0_5;
            temp_r3_2 = TASK_DATA(temp_r0_5);
            s = &temp_r3_2->s;
            temp_r3_2->unk3C = 0;
            temp_r3_2->unk4C = 0xF;
            temp_r3_2->unk48 = 0;
            temp_r3_2->unk44 = var_r8_2;
            temp_r3_2->unk40 = 0;
            if (var_r8_2 == 0) {
                s->graphics.dest = OBJ_VRAM0 + 0x6060;
                s->graphics.anim = 0x311;
                s->variant = 0;
            } else if (var_r8_2 == 1) {
                s->graphics.dest = OBJ_VRAM0 + 0x6920;
                s->graphics.anim = 0x311;
                s->variant = 1;
            } else {
                s->graphics.dest = OBJ_VRAM0 + 0x6E20;
                s->graphics.anim = 0x311;
                s->variant = 2;
            }
            s->x = 0xB4;
            s->y = 0x50;
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
            state->tasks20[var_r8_2] = tasks[var_r8_2];
        }
        state->taskC->main = Task_8068004;
        gCurTask->main = Task_8067E68;
    }
    sub_805423C(&state->strc0);
    state->unk38 = (s32)sp10;
    sp14->unk3C = sp10;
}
END_NONMATCH

void Task_8067E68()
{
    ExtraStageResults_64_2 *tasks[3];
    ExtraStageResults_64 *temp_r8;
    s16 temp_r1;
    s32 temp_r7;
    u32 temp_r5;

    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    temp_r8 = TASK_DATA(state->taskC);
#ifndef BUG_FIX
    // [0] gets initialized, but not really used...
    tasks[0] = TASK_DATA(state->tasks2C[0]);
    // These never get initialized or used
    tasks[1] = TASK_DATA(state->tasks2C[1]);
    tasks[2] = TASK_DATA(state->tasks2C[2]);
#endif
    temp_r7 = state->unk38;
    temp_r5 = temp_r7 + 1;
    if (temp_r5 > 0x190U) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateStaffCredits();
        return;
    } else {
        if ((0x190 - Div(0x2000, 0x80)) == temp_r5) {
            state->strc0.unk0 = 0;
            state->strc0.unk2 = 1;
            state->strc0.unk4 = 1;
            state->strc0.unk6 = 0;
            state->strc0.unk8 = 0x80;
            state->strc0.unkA = 1;
        }
        sub_805423C(&state->strc0);
        state->unk38 = (s32)temp_r5;
        temp_r8->unk3C = temp_r5;
#ifndef BUG_FIX
        tasks[0]->unk3C = temp_r7 + 0x14B;
        tasks[1]->unk3C = temp_r7 + 0x14B;
        tasks[2]->unk3C = temp_r7 + 0x14B;
#endif
    }
}

void Task_8067F38()
{
    s32 temp_r0;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r0_4;
    s32 temp_r0_5;
    s32 temp_r0_6;
    u32 unk3C;

    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);

    unk3C = strc64->unk3C;
    if ((strc64->unk40 + 60) <= unk3C) {
        strc64->qUnk54[0] += Q(85. / 256.);
        gBgScrollRegs[0][1] = I(strc64->qUnk54[0]);
        if (gBgScrollRegs[0][1] > 71) {
            gBgScrollRegs[0][1] = 71;
        }

        strc64->qUnk54[1] += Q(96. / 256.);
        gBgScrollRegs[1][1] = I(strc64->qUnk54[1]);
        if (gBgScrollRegs[1][1] > 80) {
            gBgScrollRegs[1][1] = 80;
        }

        strc64->qUnk54[2] += Q(0.75);
        gBgScrollRegs[2][1] = I(strc64->qUnk54[2]);
        if (gBgScrollRegs[2][1] > 160) {
            gBgScrollRegs[2][1] = 160;
        }
    }
}

void Task_8067F9C()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);

    if (strc64->unk3C == 0) {
        strc64->s.prevVariant = -1;
        strc64->s.graphics.dest = OBJ_VRAM0 + 0x26E0;
        strc64->s.graphics.anim = SA1_ANIM_FINAL_CUTSCENE_ART_B;
        strc64->s.variant = 0;
        strc64->s.x = DISPLAY_CENTER_X;
        strc64->s.y = DISPLAY_CENTER_Y;
        strc64->s.oamFlags = 0x3C0;
        strc64->s.frameFlags = 0x2000;
    }
    UpdateSpriteAnimation(&strc64->s);
    DisplaySprite(&strc64->s);
}

void Task_8068004()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);

    if (strc64->unk3C == 0) {
        strc64->s.prevVariant = -1;
        strc64->s.graphics.dest = OBJ_VRAM0 + 0x26E0;
        strc64->s.graphics.anim = SA1_ANIM_FINAL_CUTSCENE_ART_B;
        strc64->s.variant = 1;
        strc64->s.x = DISPLAY_CENTER_X;
        strc64->s.y = DISPLAY_CENTER_Y;
        strc64->s.oamFlags = 0x3C0;
        strc64->s.frameFlags = 0x2000;
    }
    UpdateSpriteAnimation(&strc64->s);
    DisplaySprite(&strc64->s);
}

void Task_806806C()
{
    s32 temp_r4;
    u8 remainder;
    u8 whole;
    s32 unk3C;
    s32 *ptr;

    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s;

    temp_r4 = strc64->unk3C;
    unk3C = strc64->unk3C;
    if (unk3C > (u32)strc64->unk40) {
        whole = Div(unk3C - strc64->unk40, 0x10);
        remainder = Mod(unk3C - strc64->unk40, 0x10);

        if (whole == 0 || whole == 2) {
            if (whole == 2) {
                whole = 3;
            }
            s = &strc64->s;
            if (remainder == 0) {
                s->prevVariant = -1;
            }
            s->x = strc64->qUnk44[whole];
            s->y = strc64->qUnk54[whole];
            UpdateSpriteAnimation(&strc64->s);
            DisplaySprite(&strc64->s);
        } else if (whole == 1) {
            s = &strc64->s;
            if (remainder == 0) {
                s->prevVariant = -1;
            }

            ptr = &strc64->qUnk44[1];
            s->x = *ptr;
            ptr = &strc64->qUnk54[1];
            s->y = *ptr;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);

            ptr = &strc64->qUnk44[2];
            s->x = *ptr;
            ptr = &strc64->qUnk54[2];
            s->y = *ptr;
            DisplaySprite(s);
        }
    }
}

void Task_8068148(void)
{
    u32 angle;

    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    angle = strc64->unk3C;
    if (angle == 0x78) {
        s->graphics.anim = 0xBF;
        s->variant = 0;
        s->prevVariant = -1;
    } else if (angle == 0x1E0) {
        s->graphics.anim = 0xBF;
        s->variant = 1;
        s->prevVariant = -1;
    }
    if ((u32)angle <= 0x257U) {
        int index = (angle & 0xFF);
        strc64->qUnk54[0] += SIN(index * 4) >> 9;
    } else if (angle < 663) {
        strc64->qUnk54[0] += Div(SIN((angle - 600) * 4), 0x1A);
    } else {
        strc64->qUnk44[0] = 0x8C00;
    }
    s->x = I(strc64->qUnk44[0]);
    s->y = I(strc64->qUnk54[0]);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8068214()
{
    s16 temp_r4;
    s32 temp_r2;
    u32 angle;
    s32 val;
    SpriteTransform *tf;

    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    tf = &strc64->transform;
    angle = strc64->unk3C;
    if ((u32)angle <= 0x257U) {
        angle &= 0xFF;
        val = (SIN(angle * 4) >> 9);
        strc64->qUnk54[0] += val;
        s->x = I(strc64->qUnk44[0]);
        s->y = I(strc64->qUnk54[0]);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    } else if ((u32)angle <= 0x296U) {
        val = Div(SIN((angle - 600) * 4), 0x1A);
        strc64->qUnk54[0] += val;
        s->x = I(strc64->qUnk44[0]);
        s->y = I(strc64->qUnk54[0]);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    } else if ((u32)angle <= 0x2BBU) {
        strc64->qUnk44[0] = 0xB400;
        strc64->qUnk54[0] = 0xB400;
        if (angle == 0x2BB) {
            s->graphics.anim = 0x2DF;
            s->variant = 0;
            s->prevVariant = -1;
            s->frameFlags = 0x106B;
            UpdateSpriteAnimation(s);
        }
    } else {
        temp_r4 = SIN((0x3BB - angle) * 4);
        strc64->qUnk54[0] += Div((s32)temp_r4, 36);
        strc64->qUnk44[0] += Div((s32)temp_r4, 18);
        temp_r2 = angle + 0xFFFFFD44;
        tf->rotation = (s16)(0x3FF & ~(temp_r2 * 2));
        tf->qScaleX = Q(1.5) - (temp_r2 * 3);
        tf->qScaleY = Q(1.5) - (temp_r2 * 3);
        tf->x = I(strc64->qUnk44[0]);
        tf->y = I(strc64->qUnk54[0]);
        s->x = I(strc64->qUnk44[0]);
        s->y = I(strc64->qUnk54[0]);
        TransformSprite(s, tf);
        DisplaySprite(s);
    }
}

void Task_8068360()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    strc64->qUnk44[0] += strc64->qUnk44[1];
    if (strc64->qUnk44[0] > Q(272)) {
        strc64->qUnk44[0] = -Q(120);
    }
    if (strc64->qUnk44[0] < -Q(120)) {
        strc64->qUnk44[0] = Q(272);
    }

    strc64->qUnk54[0] += strc64->qUnk54[1];
    if (strc64->qUnk54[0] > Q(172)) {
        strc64->qUnk54[0] = -Q(16);
    }
    if (strc64->qUnk54[0] < -Q(16)) {
        strc64->qUnk54[0] = Q(172);
    }

    s->x = I(strc64->qUnk44[0]);
    s->y = I(strc64->qUnk54[0]);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_80683D8(void)
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    strc64->qUnk44[0] += Q(8);
    strc64->qUnk54[0] += Q(8);
    strc64->qUnk44[0] += strc64->qUnk44[1];
    if (strc64->qUnk44[0] > Q(272)) {
        strc64->qUnk44[0] -= Q(300);
    }

    strc64->qUnk54[0] += strc64->qUnk54[1];
    if (strc64->qUnk54[0] > Q(172)) {
        strc64->qUnk54[0] -= Q(300);
    }

    s->x = I(strc64->qUnk44[0]);
    s->y = I(strc64->qUnk54[0]);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_nullsub_8068448(void) { }

void sub_806844C()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    strc64->qUnk54[0] += strc64->qUnk54[1];

    if (strc64->qUnk54[0] < -Q(16)) {
        strc64->qUnk54[0] = +Q(172);
        strc64->qUnk44[0] += strc64->qUnk44[1] * 200;

        if (strc64->qUnk44[0] > Q(272)) {
            strc64->qUnk44[0] -= Q(300);
        }
    }

    s->x = I(strc64->qUnk44[0]);
    s->y = I(strc64->qUnk54[0]);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_80684B4()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    if (strc64->qUnk54[0] >= -Q(16)) {
        strc64->qUnk54[0] += strc64->qUnk54[1];
        s->x = I(strc64->qUnk44[0]);
        s->y = I(strc64->qUnk54[0]);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void sub_80684F4(s32 comp)
{
    ExtraStageResultsState *state = TASK_DATA(gCurTask);

    if (comp == 25) {
        UiGfxStackInit();
        sub_80538BC();
    } else if (comp == 30) {
        state->unk3C = CreateStageResults((u32)gRingCount, gCourseTime);
        return;
    }
}

void sub_8068538(void) { }

void Task_806853C(void)
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    if (strc64->unk3C < 600) {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_806856C(void) { }

void Task_8068570()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    u32 temp_r3;

    if (strc64->unk3C == 0) {
        strc64->s.prevVariant = -1;
        strc64->s.graphics.dest = OBJ_VRAM0 + 0x26E0;
        strc64->s.graphics.anim = SA1_ANIM_FINAL_CUTSCENE_ART_A;
        strc64->s.variant = 0;
        strc64->s.x = DISPLAY_CENTER_X;
        strc64->s.y = DISPLAY_CENTER_Y;
        strc64->s.frameFlags = 0;
    }
    UpdateSpriteAnimation(&strc64->s);
    DisplaySprite(&strc64->s);
}

void Task_80685C8()
{
    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    u32 temp_r3;

    if (strc64->unk3C == 0) {
        strc64->s.prevVariant = -1;
        strc64->s.graphics.dest = OBJ_VRAM0 + 0x26E0;
        strc64->s.graphics.anim = SA1_ANIM_FINAL_CUTSCENE_ART_A;
        strc64->s.variant = 1;
        strc64->s.x = DISPLAY_CENTER_X;
        strc64->s.y = DISPLAY_CENTER_Y;
        strc64->s.frameFlags = 0;
    }
    UpdateSpriteAnimation(&strc64->s);
    DisplaySprite(&strc64->s);
}

void Task_8068620(void) { }

void Task_8068624(void) { }

void Task_8068628(void) { }

void Task_806862C()
{
    s32 temp_r0;
    s32 temp_r0_2;

    ExtraStageResults_64 *strc64 = TASK_DATA(gCurTask);
    Sprite *s = &strc64->s;

    if (strc64->unk3C > 180) {
        strc64->qUnk44[0] -= Q(96. / 256.);
        if (strc64->qUnk44[0] < -Q(64)) {
            strc64->qUnk44[0] = -Q(64);
        }
        strc64->qUnk54[0] += 0x30;
        if (strc64->qUnk54[0] > Q(32)) {
            strc64->qUnk54[0] = Q(32);
        }

        s->x = I(strc64->qUnk44[0]);
        s->y = I(strc64->qUnk54[0]);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}
