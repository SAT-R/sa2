#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/menus/title_screen.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"
#include "data/sa1/ui_graphics.h"

#include "constants/sa1/animations.h"

typedef struct {
    Sprite sprites[3];
    StrcUi_805423C strc90;
    u32 unk9C;
} CollectEmeraldsScreen;

void sub_806968C(void);
void Task_80698F4(void);
void sub_8069964(void);

extern AnimId gUnknown_0868B654[2];
extern u8 gUnknown_0868B658[2];
extern const u16 gUnknown_086883E4[10];
extern const u8 gUnknown_086883F8[];
extern const u16 gUnknown_086CC774[16];
extern const u8 gUnknown_086CC834[];

void sub_806968C(void)
{
    Strc_80528AC sp00;
    s8 sp28;

    UiGfxStackInit();

#ifndef NON_MATCHING
    sp00.uiGfxID = 128;
#endif
    sp00.unk2B = 0;
    sp00.uiGfxID = 43;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.tilesSize = 1 * TILE_SIZE_4BPP;
    sp00.palette = gUnknown_086CC774;
    sp00.paletteSize = sizeof(gUnknown_086CC774);
    sp00.layout = gUnknown_086CC834;
    sp00.layoutSize = 0x500;
    sp00.unk28 = 0;
    sp00.unk29 = 0;
    sp00.unk2A = 5;
    sub_80528AC(&sp00);

    gBgSprites_Unknown1[0] = 1;
    gBgSprites_Unknown2[0][0] = 0;
    gBgSprites_Unknown2[0][1] = 0;
    gBgSprites_Unknown2[0][2] = 0xFF;
    gBgSprites_Unknown2[0][3] = 0x14;
}

void CreateGetAllChaosEmeraldsMessage()
{
    CollectEmeraldsScreen *strc;
    Sprite *s;
    StrcUi_805423C *temp_r6;

    sub_80535FC();
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x1D03;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    sub_806968C();
    strc = TASK_DATA(TaskCreate(Task_80698F4, sizeof(CollectEmeraldsScreen), 0x2000U, 0U, NULL));
    temp_r6 = &strc->strc90;

    s = &strc->sprites[0];
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0);
    s->graphics.anim = gUnknown_0868B654[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_0868B658[LOADED_SAVE->uiLanguage];
    s->x = 120;
    s->y = 120;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(strc->sprites);

    s = &strc->sprites[1];
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2000);
    s->graphics.anim = SA1_ANIM_GET_THE_CHAOS_EMERALDS_EGGMAN;
    strc->sprites[1].variant = 0;
    s->x = 136;
    s->y = 90;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    strc->sprites[1].prevVariant = -1;
    strc->sprites[1].animSpeed = 0x10;
    strc->sprites[1].palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strc->sprites[2];
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x4000);
    s->graphics.anim = SA1_ANIM_GET_THE_CHAOS_EMERALDS_EGGMAN;
    strc->sprites[2].variant = 1;
    s->x = 136;
    s->y = 90;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    strc->sprites[2].prevVariant = -1;
    strc->sprites[2].animSpeed = 0x10;
    strc->sprites[2].palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    strc->unk9C = 0;

    temp_r6->unk0 = 0;
    temp_r6->unk2 = 1;
    temp_r6->unk4 = 2;
    temp_r6->unk6 = 0;
    temp_r6->unk8 = 0x100;
    temp_r6->unkA = 8;
    sub_805423C(temp_r6);
}

void Task_80698F4()
{
    CollectEmeraldsScreen *strc = TASK_DATA(gCurTask);
    StrcUi_805423C *strc90 = &strc->strc90;

    if (++strc->unk9C > 400) {
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        TaskDestroy(gCurTask);
        CreateSegaLogo();
    } else {
        if (strc->unk9C == 340) {
            strc90->unk6 = 0;
            strc90->unk4 = 1;
        }

        sub_805423C(strc90);
        sub_8069964();
    }
}

void sub_8069964()
{
    u8 i;

    CollectEmeraldsScreen *strc = TASK_DATA(gCurTask);

    for (i = 0; i < (s32)ARRAY_COUNT(strc->sprites); i++) {
        DisplaySprite(&strc->sprites[i]);
    }
}
