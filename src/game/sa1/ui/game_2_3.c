#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/stage/mp_chao.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/globals.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

typedef struct {
    u8 filler0[0x48];
    s32 unk48;
    s16 unk4C;
    u8 unk4E;
    u8 unk4F;
    u8 unk50;
    u8 unk51;
} Game_2_3_54;

typedef struct {
    StrcUi_805423C strc0;
    struct Task *taskC; // -> Game_2_3_54
    struct Task *task10; // -> Game_2_3_2DC
    u8 filler14[0x8];
    Sprite s;
    s32 unk4C;
    s16 unk50;
    s16 unk52;
    u8 unk54;
    u8 unk55;
    u8 unk56;
    u8 unk57;
    u8 unk58;
} Game_2_3_5C;

typedef struct {
    Sprite sprites[5];
    u8 fillerF0[0x1E0];
    s32 unk2D0;
    s16 unk2D4;
    u8 unk2D6;
    u8 unk2D7;
    u8 unk2D8;
    u8 unk2D9;
    u8 unk2DA;
} Game_2_3_2DC;

void sub_8062EDC(void);
void Task_80631E8(void);
void Task_80632B4(void);
void Task_80634EC(void);
void Task_8063638(void);
void Task_8063824(void);
void Task_80638B0(void);
void TaskDestructor_8063910(struct Task *t);
void Task_8063914(void);

extern u8 gUnknown_086A17F4[];
extern u8 gUnknown_086A2534[];
extern u8 gUnknown_086A4FB4[];
extern u16 gUnknown_086A4DB4[256];
extern u8 gUnknown_086A5834[];

typedef struct {
    void *vram;
    u32 anim;
    u32 variant;
} TileInfo32;

// TODO: Inline the data, otherwise the VRAM pointers will be wrong and crash!
const TileInfo32 gUnknown_0868B240[5] = { //
    {
        OBJ_VRAM0 + 0x20,
        SA1_ANIM_ZONE_SELECT_ACTS,
        15,
    },
    {
        OBJ_VRAM0 + 0x360,
        SA1_ANIM_ZONE_SELECT_ACTS,
        16,
    },
    {
        OBJ_VRAM0 + 0x6A0,
        SA1_ANIM_ZONE_SELECT_ACTS,
        17,
    },
    {
        OBJ_VRAM0 + 0x9E0,
        SA1_ANIM_ZONE_SELECT_ACTS,
        18,
    },
    {
        OBJ_VRAM0 + 0xF00,
        SA1_ANIM_ZONE_SELECT_ACTS,
        0,
    }
};

void sub_8062EDC(void)
{
    Strc_80528AC gfx;
    s8 *temp_r5;

    UiGfxStackInit();

    gfx.uiGfxID = 128;
    gfx.unk2B = 1;
    gfx.tiles = gUnknown_086A17F4;
    gfx.tilesSize = 0xE00;
    gfx.layout = gUnknown_086A2534;
    gfx.layoutSize = 0x500;
    gfx.unk29 = 1;
    gfx.unk2A = 0x11;
    gfx.unk0.unk4 = 0;
    gfx.unk0.unk8 = 0;
    gfx.unk0.unk9 = 0;
    gfx.unk0.unkA = 0;
    gfx.unk0.unkB = 0;
    sub_80528AC(&gfx);

    gfx.uiGfxID = 128;
    gfx.unk2B = 0;
    gfx.tiles = gUnknown_086A4FB4;
    gfx.tilesSize = 0x1CC0;
    gfx.palette = gUnknown_086A4DB4;
    gfx.paletteSize = 0x200;
    gfx.layout = gUnknown_086A5834;
    gfx.layoutSize = 0x1000;
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
}

void sub_8062F90(void)
{
    struct Task *t;
    Game_2_3_54 *strc54;
    Game_2_3_5C *strc5C;
    Game_2_3_2DC *strc2DC;
    Sprite *s;
    s32 four;
    u8 i;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    m4aSongNumStart(MUS_COURSE_SELECTION);
    four = 4;
    sub_80535FC();
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x1D83;
    gBgCntRegs[1] = 0x1886;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    sub_8062EDC();

    strc5C = TASK_DATA(TaskCreate(Task_80631E8, sizeof(Game_2_3_5C), 0x2000U, 0U, TaskDestructor_8063910));
    strc5C->unk4C = 0;
    strc5C->unk57 = 0;
    strc5C->unk50 = 0x14;
    strc5C->unk52 = 0x14;
    strc5C->unk54 = 0;
    strc5C->unk55 = 0;
    strc5C->unk58 = 4;

    strc5C->strc0.unk0 = 0;
    strc5C->strc0.unk2 = 1;
    strc5C->strc0.unk4 = 2;
    strc5C->strc0.unk6 = 0;
    strc5C->strc0.unk8 = 0x200;
    strc5C->strc0.unkA = 1;

    t = TaskCreate(Task_8063914, sizeof(Game_2_3_54), 0x2030U, 0U, NULL);
    strc54 = TASK_DATA(t);
    strc54->unk48 = 0;
    strc54->unk4C = 0;
    strc54->unk4E = 0;
    strc54->unk51 = 4;
    strc54->unk4F = 0;
    strc5C->taskC = t;

    t = TaskCreate(Task_8063824, sizeof(Game_2_3_2DC), 0x2030U, 0U, NULL);
    strc2DC = TASK_DATA(t);
    strc2DC->unk2D0 = 0;
    strc2DC->unk2D4 = 0;
    strc2DC->unk2D6 = 0;
    strc2DC->unk2D7 = 0;
    strc2DC->unk2DA = four;
    strc2DC->unk2D9 = 0;

    for (i = 0; i < (s32)ARRAY_COUNT(strc2DC->sprites); i++) {
        s = &strc2DC->sprites[i];
        s->graphics.dest = gUnknown_0868B240[i].vram;
        s->graphics.anim = gUnknown_0868B240[i].anim;
        s->variant = gUnknown_0868B240[i].variant;
        s->oamFlags = 0x480;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
        UpdateSpriteAnimation(s);
    }

    strc5C->task10 = t;

    s = &strc5C->s;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = OBJ_VRAM0 + 0xF00;
    s->oamFlags = 0x80;
    s->graphics.size = 0;
    s->graphics.anim = 905;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    sub_805423C(&strc5C->strc0);
}

void Task_80631E8()
{
    s32 *temp_r1;
    s32 temp_r4;
    u8 *temp_r1_2;
    Game_2_3_5C *strc5C = TASK_DATA(gCurTask);
    Game_2_3_54 *strc54 = TASK_DATA(strc5C->taskC);
    Game_2_3_2DC *strc2DC = TASK_DATA(strc5C->task10);

    temp_r4 = strc5C->unk4C + 1;
    strc5C->unk4C = temp_r4;
    strc54->unk48 = temp_r4;
    temp_r1 = &strc2DC->unk2D0;
    *temp_r1 = temp_r4;
    temp_r1_2 = &strc5C->unk55;
    strc54->unk4F = *temp_r1_2;
    strc2DC->unk2D7 = *temp_r1_2;
    strc2DC->unk2D9 = strc5C->unk57;
    sub_805423C(&strc5C->strc0);
    if ((temp_r4 == 0x40) || (1 & gPressedKeys)) {
        strc5C->unk4C = 0x40;
        *temp_r1 = 0x40;
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        gCurTask->main = Task_80632B4;
    }
}

void Task_80632B4()
{
    Sprite *s;
    s32 unk4C;
    struct MultiSioData_0_0 *multisioRecv;
    u32 i;

    Game_2_3_5C *strc5C = TASK_DATA(gCurTask);
    Game_2_3_54 *strc54 = TASK_DATA(strc5C->taskC);
    Game_2_3_2DC *strc2DC = TASK_DATA(strc5C->task10);

    if (IS_MULTI_PLAYER) {
        for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }
    }

    multisioRecv = &gMultiSioRecv->pat0;
    if (!(gMultiSioStatusFlags & 0x80)) {
        if (multisioRecv->unk0 >= 80) {
            strc5C->unk55 = multisioRecv->unk2;
        }

        s = &strc5C->s;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    unk4C = strc5C->unk4C;
    unk4C++;

    if ((gMultiSioStatusFlags & 0x80) && ((u32)strc5C->unk58 > 1U)) {
        if (0x80 & gRepeatedKeys) {
            if (strc5C->unk55 < 3) {
                strc5C->unk55++;
            }
        } else if (0x40 & gRepeatedKeys) {
            if (strc5C->unk55 != 0) {
                strc5C->unk55--;
            }
        }
    }

    if (strc5C->unk55 > (Div(strc5C->unk52, 24) + 5)) {
        strc5C->unk52 = ((strc5C->unk55 - 5) * 24) - 8;
    } else if (strc5C->unk55 <= Div(strc5C->unk52, 0x18)) {
        strc5C->unk52 = ((strc5C->unk55) * 24) - 8;
    }

    strc5C->unk4C = unk4C;
    strc54->unk48 = unk4C;
    strc2DC->unk2D0 = unk4C;
    strc54->unk4F = strc5C->unk55;
    strc2DC->unk2D7 = strc5C->unk55;
    strc2DC->unk2D9 = strc5C->unk57;
    sub_805423C(&strc5C->strc0);
    gMultiSioSend.pat0.unk0 = 0x50;
    gMultiSioSend.pat0.unk2 = strc5C->unk55;
    if ((gMultiSioStatusFlags & 0x80) && (1 & gPressedKeys)) {
        gMultiSioSend.pat0.unk0 = 0x51;
    }

    multisioRecv = &gMultiSioRecv->pat0;
    if (multisioRecv->unk0 == 0x51) {
        strc5C->unk57 = 1;
        gCurTask->main = Task_80634EC;
        m4aSongNumStart(0x6AU);
        m4aSongNumStop(3U);
        strc5C->strc0.unk4 = 1;
        strc5C->strc0.unk6 = 0x2000 - (u16)strc5C->strc0.unk6;
    }
}

void Task_80634EC(void)
{
    Sprite *s;
    s32 unk4C;
    struct MultiSioData_0_0 *multisioRecv;
    u32 i;

    Game_2_3_5C *strc5C = TASK_DATA(gCurTask);
    Game_2_3_54 *strc54 = TASK_DATA(strc5C->taskC);
    Game_2_3_2DC *strc2DC = TASK_DATA(strc5C->task10);

    if (IS_MULTI_PLAYER) {
        for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }
    }

    multisioRecv = &gMultiSioRecv->pat0;
    if (!(gMultiSioStatusFlags & 0x80)) {
        if (multisioRecv->unk0 >= 80) {
            strc5C->unk55 = multisioRecv->unk2;
        }
    }

    unk4C = strc5C->unk4C;
    unk4C++;

    strc5C->unk4C = unk4C;
    strc54->unk48 = unk4C;
    strc2DC->unk2D0 = unk4C;
    strc54->unk4F = strc5C->unk55;
    strc2DC->unk2D7 = strc5C->unk55;
    strc2DC->unk2D9 = strc5C->unk57;
    sub_805423C(&strc5C->strc0);

    if ((strc5C->strc0.unk6 > 0x1800) && (strc5C->strc0.unk4 == 1)) {
        gCurTask->main = Task_8063638;
    }
}

// NOTE: Incomplete
//       Related to MP Chao Hunt
// (67.58%) https://decomp.me/scratch/7bJhx
NONMATCH("asm/non_matching/game/sa1/ui/game2_3__Task_8063638.inc", void Task_8063638())
{
    Sprite *s;
    s32 unk4C;
    struct MultiSioData_0_0 *multisioRecv;
    u32 i;

    s32 temp_r0_2;
    u32 var_r3_4;
    s32 var_r3_5;
    u32 rand;
    u32 temp_r0_4;
    u32 temp_r1;

    Game_2_3_5C *strc5C = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }
    }

    if (gMultiSioRecv->pat0.unk0 == 0x52) {
        struct Task **chaoTasks;
        gCurTask->main = Task_80638B0;

        chaoTasks = gChaoTasks;

        for (i = 0; i < 3; i++) {
            chaoTasks[i] = (void *)(uintptr_t)gMultiSioRecv->pat0.unk3;
        }
    }
    if (gMultiSioStatusFlags & 0x80) {
        i = 1;
        if (!(((s32)gMultiplayerConnections >> 1) & 1) || (gMultiSioRecv[1].pat0.unk0 == 0x51)) {
        loop_15:
            i += 1;
            if ((u32)i <= 3U) {
                if (!(((s32)gMultiplayerConnections >> i) & 1) || (gMultiSioRecv[i].pat0.unk0 == 0x51)) {
                    goto loop_15;
                }
            }
        }
        if (i == 4) {
            gMultiSioSend.pat0.unk0 = 0x52;
            gMultiSioSend.pat0.unk2 = strc5C->unk55;

            while (gMultiSioSend.pat0.unk3 == ((PseudoRandom32() >> 8) & 7))
                ;
            while (gMultiSioSend.pat0.unk4 == ((PseudoRandom32() >> 8) & 7))
                ;

            // gMultiSioSend.pat0.unk5 = (s8) (var_r3_5 & 7);
            return;
        }
        goto block_27;
    }
block_27:
    gMultiSioSend.pat0.unk0 = 0x51;
    gMultiSioSend.pat0.unk2 = strc5C->unk55;
}
END_NONMATCH

void Task_8063824()
{
    Sprite *s;
    u8 *var_r1;
    u8 var_r0;
    u8 i;

    Game_2_3_2DC *strc2DC = TASK_DATA(gCurTask);

    for (i = 0; i < 4; i++) {
        s = &strc2DC->sprites[i];

        if (i == strc2DC->unk2D7) {
            if (strc2DC->unk2D9 != 0) {
                if ((strc2DC->unk2D0 & 1) != 0) {
                    s->palId = 1;
                } else {
                    s->palId = 0;
                }
            } else {
                s->palId = 1;
            }
            s->x = 104;
        } else {
            s->x = 100;
            s->palId = 0;
        }
        s->y = (i << 5) + 24;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_80638B0(void)
{
    u16 chaoHuntStageId;

    Game_2_3_5C *strc5C = TASK_DATA(gCurTask);

    gDispCnt &= 0x1FFF;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    chaoHuntStageId = strc5C->unk55;
    gCurrentLevel = NUM_LEVEL_IDS_SP + chaoHuntStageId;

    ApplyGameStageSettingsAndStart();
    TaskDestroy(strc5C->taskC);
    TaskDestroy(strc5C->task10);
    TaskDestroy(gCurTask);
}

void TaskDestructor_8063910(struct Task *t) { }

void Task_8063914(void) { }
