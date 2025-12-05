#include "global.h"
#include "game/cutscenes/endings.h"
#include "game/cutscenes/extra_ending_slides.h"
#include "game/cutscenes/final_ending_land.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"
#include "game/math.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

struct FinalEndingFallCutScene {
    Background unk0;
    Background unk40;

    Sprite unk80;
    Sprite unkB0[2];

    Sprite unk110;
    Sprite unk140;
    Sprite unk170;
    Sprite unk1A0;

    Sprite unk1D0[2];
    Sprite unk230[6];

    ScreenFade unk350;

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
    void *unk494;

    u8 unk498;
}; /* 0x49C */

void sub_8092690(void);
void sub_8092800(struct Task *);
void sub_8091F68(struct FinalEndingFallCutScene *);
void sub_809205C(struct FinalEndingFallCutScene *);
void sub_80920E4(struct FinalEndingFallCutScene *);
void sub_8092804(struct FinalEndingFallCutScene *);
void sub_80921E8(struct FinalEndingFallCutScene *);
void sub_8092850(struct FinalEndingFallCutScene *);
void sub_80923AC(struct FinalEndingFallCutScene *);
u32 sub_80928C8(struct FinalEndingFallCutScene *);
void sub_80927E8(void);
void sub_809289C(struct FinalEndingFallCutScene *);
void sub_8091E60(void);
void sub_8092780(void);

static const u16 gUnknown_080E1648[4] = {
    TM_CUTSCENE_FINAL_ENDING_FALL_BG,
    TM_CUTSCENE_FINAL_ENDING_FALL_CLOUDS,
    TM_CUTSCENE_FINAL_ENDING_FALL_BG_DARK,
    TM_CUTSCENE_FINAL_ENDING_FALL_BG_DARK_2,
};
static const TileInfo gUnknown_080E1650[29] = {
    { 15, 823, 0 },  { 30, 815, 0 }, { 9, 817, 0 },  { 4, 816, 0 },  { 4, 816, 1 },  { 0, 907, 0 },  { 0, 908, 0 },  { 104, 785, 0 },
    { 104, 785, 2 }, { 80, 786, 0 }, { 80, 786, 2 }, { 99, 787, 0 }, { 99, 787, 2 }, { 72, 788, 0 }, { 72, 788, 2 }, { 56, 789, 0 },
    { 56, 789, 2 },  { 48, 785, 1 }, { 48, 785, 3 }, { 80, 786, 1 }, { 80, 786, 3 }, { 80, 787, 1 }, { 80, 787, 3 }, { 64, 788, 1 },
    { 64, 788, 3 },  { 42, 789, 1 }, { 42, 789, 3 }, { 30, 790, 0 }, { 30, 790, 1 },
};

static const u8 gUnknown_080E1738[] = {
    4, 8, 2, 4, 8, 4, 8, 2, 4, 1,
};

static const u8 gUnknown_080E1742[0x10] = {
    6, 6, 6, 6, 6, 6, 6, 5, 4, 4, 3, 2, 2, 1, 1, 1,
};
static const u8 gUnknown_080E1752[0x10] = {
    6, 6, 6, 6, 6, 5, 5, 4, 3, 3, 2, 1, 1, 1, 1, 1,
};

static const s16 gUnknown_080E1762[][2] = {
    { 15, 20 }, { 10, 5 }, { 50, 20 }, { 80, 10 }, { 100, 5 }, { 130, 10 }, { 200, 15 }, { 230, 8 },
};

static const s16 gUnknown_080E1782[][2] = {
    { 195, 50 }, { 200, 60 }, { 210, 68 }, { 205, 70 }, { 225, 78 }, { 215, 80 },
};

void CreateFinalEndingFallCutScene(void)
{

    Background *background;
    struct Task *t;
    struct FinalEndingFallCutScene *scene = NULL;
    ScreenFade *fade = NULL;

    u8 i, j;

    SeedRng(0, 0xffff);
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x9C03;
    gBgCntRegs[1] = 0x9805;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    INIT_BG_SPRITES_LAYER_32(0);
    INIT_BG_SPRITES_LAYER_32(1);

    m4aMPlayAllStop();
    m4aSongNumStart(MUS_FINAL_ENDING);

    t = TaskCreate(sub_8092690, sizeof(struct FinalEndingFallCutScene), 0x3100, 0, sub_8092800);
    scene = TASK_DATA(t);

    scene->unk35C = 0;
    scene->unk494 = 0;
    scene->unk470 = 0;
    scene->unk364 = 0;
    scene->unk474 = 0;
    scene->unk36E = 160;
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

    fade = &scene->unk350;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->speed = Q(5. / 16.);
    fade->bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;

    scene->unk494 = OBJ_VRAM0;
    {
        Sprite *s;
        s = &scene->unk80;
        s->graphics.dest = OBJ_VRAM0;
        scene->unk494 += gUnknown_080E1650[0].numTiles * 0x20;
        s->graphics.anim = gUnknown_080E1650[0].anim;
        s->variant = gUnknown_080E1650[0].variant;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        s->hitboxes[0].index = -1;
        UpdateSpriteAnimation(s);
    }

    {
        Sprite *s;
        s = &scene->unk110;
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += 0x1A00;
        s->prevVariant = -1;
        s->x = (DISPLAY_WIDTH / 2);
        s->y = (DISPLAY_HEIGHT / 2);
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        s->hitboxes[0].index = -1;
    }

    {
        Sprite *s;

        s = &scene->unk140;
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += 0xC00;
        s->prevVariant = -1;
        s->x = 0x78;
        s->y = 0x50;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        s->hitboxes[0].index = -1;
    }

    {
        Sprite *s;
        s = &scene->unk1A0;
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += 0x3C0;
        s->graphics.anim = gUnknown_080E1650[1].anim;
        s->variant = gUnknown_080E1650[1].variant;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(2);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 2;
        s->frameFlags = 0x2000;
        s->hitboxes[0].index = -1;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < 2; i++) {
        Sprite *s;
        s = &scene->unk1D0[i];
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[(i + 3)].numTiles * 0x20;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 2;
        s->frameFlags = 0x2000;
        s->hitboxes[0].index = -1;
    }

    for (i = 0; i < 6; i++) {
        Sprite *s;
        s = &scene->unk230[i];

        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[2].numTiles * 0x20;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 2;
        s->frameFlags = 0x2000;
        s->hitboxes[0].index = -1;
    }

    if (gSelectedCharacter == 1) {
        Sprite *s;
        s = &scene->unk170;
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += gUnknown_080E1650[27].numTiles * 0x20;
        s->graphics.anim = gUnknown_080E1650[27].anim;
        s->variant = gUnknown_080E1650[27].variant;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 2;
        s->frameFlags = 0;
        s->hitboxes[0].index = -1;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < 2; i++) {
        Sprite *s;
        s = &scene->unkB0[i];
        s->graphics.dest = (void *)scene->unk494;
        scene->unk494 += 1;
        s->graphics.anim = gUnknown_080E1650[(i + 5)].anim;
        s->variant = gUnknown_080E1650[(i + 5)].variant;
        s->prevVariant = -1;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        s->hitboxes[0].index = -1;
        UpdateSpriteAnimation(s);
    }

    background = &scene->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = gUnknown_080E1648[1];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &scene->unk40;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(24);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = gUnknown_080E1648[0];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);
}

// Very likely this function was hand patched for the virtual console
// release. The source is not matchable in C: https://decomp.me/scratch/yWtRm
#if !defined(NON_MATCHING) && defined(VIRTUAL_CONSOLE) && defined(JAPAN)
ASM_FUNC("asm/sub_8091CB0__virtual_console.s", void sub_8091CB0(void))
#else
void sub_8091CB0(void)
{
    struct FinalEndingFallCutScene *scene = TASK_DATA(gCurTask);
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

#ifndef VITUAL_CONSOLE
    if ((scene->unk35C & 1) == 0 && scene->unk35C < 10) {
        gDispCnt |= 0x2000;
        gWinRegs[0] = DISPLAY_HEIGHT;
        gWinRegs[2] = DISPLAY_WIDTH;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;

        gBldRegs.bldY += gUnknown_080E1738[scene->unk35C];

        if (gBldRegs.bldY >= 0x10) {
            scene->unk35C++;
        }
    } else
#endif
        if (scene->unk35C < 10) {
        gDispCnt |= 0x2000;
        gWinRegs[0] = DISPLAY_HEIGHT;
        gWinRegs[2] = DISPLAY_WIDTH;
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;
#ifdef VIRTUAL_CONSOLE
        if ((!(scene->unk35C & 1) && // format
             (gBldRegs.bldY = gUnknown_080E1738[scene->unk35C] + gBldRegs.bldY) > 0xF)
            || ((scene->unk35C & 1)
                && (gBldRegs.bldY = -gUnknown_080E1738[scene->unk35C] + gBldRegs.bldY) <= gUnknown_080E1738[scene->unk35C])) {
            if ((scene->unk35C + 1) == 2) {
                scene->unk35C += 4;
            } else {
                scene->unk35C++;
            }
        }
#else
        gBldRegs.bldY -= gUnknown_080E1738[scene->unk35C];
        if (gBldRegs.bldY <= gUnknown_080E1738[scene->unk35C]) {
            scene->unk35C++;
        }
#endif
    } else if (scene->unk35C == 10) {
        sub_80928C8(scene);
        gDispCnt |= 0x2000;
        gWinRegs[0] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[2] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[4] |= 0x3F;
        gWinRegs[5] |= 0x1F;
        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY--;

        if (gBldRegs.bldY <= 1) {
#ifdef VIRTUAL_CONSOLE
            if ((scene->unk35C + 1) == 2) {
                scene->unk35C += 4;
            } else {
                scene->unk35C++;
            }
#else
            scene->unk35C++;
#endif
        }
    } else {
        gCurTask->main = sub_8091E60;
    }
}
#endif

void sub_8091E60(void)
{
    struct FinalEndingFallCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk350;

    fade->speed = Q(5. / 16.);
    fade->flags = 1;

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
            gWinRegs[0] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gWinRegs[2] = WIN_RANGE(0, DISPLAY_WIDTH);
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

void sub_8091F68(struct FinalEndingFallCutScene *scene)
{
    u32 val = 1;
    u32 val2 = 1;

    if (gBgScrollRegs[1][1] < 0x38) {
        scene->unk474 += (val << (gUnknown_080E1752[scene->unk364])) * 2;
    } else if (gBgScrollRegs[1][1] < 0x60) {
        scene->unk474 += (val << (gUnknown_080E1752[scene->unk364])) * 2;
    }

    if (gBgScrollRegs[0][1] < 0x88 && scene->unk35C < 10) {
        if (scene->unk474 > 0 && (gBgScrollRegs[1][1] & 7) == 0 && (scene->unk474 >> 8) > gBgScrollRegs[1][1]) {
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

void sub_809205C(struct FinalEndingFallCutScene *scene)
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

void sub_80920E4(struct FinalEndingFallCutScene *scene)
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

void sub_80921E8(struct FinalEndingFallCutScene *scene)
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

void sub_80923AC(struct FinalEndingFallCutScene *scene)
{
    u8 i;
    Sprite *s;
    u32 variant = 0;

    s = &scene->unk80;
    for (i = 0; i < 10; i++) {
        s->graphics.anim = gUnknown_080E1650[0].anim;
        s->variant = gUnknown_080E1650[0].variant;

        s->x = scene->unk3F8[i][0];
        s->y = scene->unk3F8[i][1] >> 8;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (scene->unk35C > 8) {
        variant = 1;
    }

    s = &scene->unk1A0;
    s->graphics.anim = gUnknown_080E1650[variant + 1].anim;
    s->variant = gUnknown_080E1650[variant + 1].variant;
    s->x = scene->unk3C0;
    s->y = scene->unk3C4 >> 8;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (scene->unk35C < 10) {
        for (i = 0; i < 6; i++) {
            if (((scene->unk3C4 >> 8) + gBgScrollRegs[1][1]) < 0xE4) {
                s = &scene->unk1D0[i & 1];
                s->graphics.anim = gUnknown_080E1650[(i & 1) + 3].anim;
                s->variant = gUnknown_080E1650[(i & 1) + 3].variant;
                s->x = scene->unk378[i][0];
                s->y = scene->unk378[i][1] >> 8;
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
            }

            if (scene->unk365[i] != 0) {
                s = &scene->unk230[i];
                s->graphics.anim = gUnknown_080E1650[2].anim;
                s->variant = gUnknown_080E1650[2].variant;
                s->x = scene->unk3C8[i][0];
                s->y = scene->unk3C8[i][1] >> 8;

                if (UpdateSpriteAnimation(s) != 1) {
                    s->animCursor = 0;
                    s->qAnimDelay = 0;
                    s->frameFlags &= ~0x4000;
                }
                DisplaySprite(s);
            }
        }
    }

    if (scene->unk35C > 0xB) {
        variant = 1;
    }
    s = &scene->unk110;
    s->graphics.anim = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].anim;
    s->variant = gUnknown_080E1650[(gSelectedCharacter * 2) + 7 + variant].variant;
    s->x = scene->unk3A8;
    s->y = scene->unk3AC >> 8;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (scene->unk35C > 10) {
        variant = 1;
    }

    s = &scene->unk140;
    s->graphics.anim = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].anim;
    s->variant = gUnknown_080E1650[(gSelectedCharacter * 2) + 0x11 + variant].variant;
    s->x = scene->unk3B4;
    s->y = scene->unk3B8 >> 8;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (gSelectedCharacter == CHARACTER_CREAM) {
        s = &scene->unk170;
        s->graphics.anim = gUnknown_080E1650[variant + 0x1B].anim;
        s->variant = gUnknown_080E1650[variant + 0x1B].variant;
        s->x = scene->unk3B4;
        s->y = scene->unk3B8 >> 8;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (scene->unk35C > 10) {
        for (i = 0; i < 2; i++) {
            UpdateSpriteAnimation(&scene->unkB0[i]);
        }
        scene->unk370++;
    }
}

void sub_8092690(void)
{
    struct FinalEndingFallCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk350;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);

    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        if (scene->unk35C == 0) {
            gCurTask->main = sub_8092780;
        } else {
            gCurTask->main = sub_8091CB0;
        }
    }
}

void sub_8092714(void)
{
    struct FinalEndingFallCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unk350;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;

    sub_8091F68(scene);
    sub_809205C(scene);
    sub_80920E4(scene);
    sub_8092804(scene);
    sub_80921E8(scene);
    sub_8092850(scene);
    sub_80923AC(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q(0);
        gCurTask->main = sub_8091CB0;
    }
}

void sub_8092780(void)
{
    struct FinalEndingFallCutScene *scene = TASK_DATA(gCurTask);
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

void sub_80927E8(void)
{
    struct Task UNUSED *t = gCurTask;
    CreateFinalEndingLandingCutScene();
    TaskDestroy(gCurTask);
}

void sub_8092800(struct Task *t)
{
    // unused logic
}

void sub_8092804(struct FinalEndingFallCutScene *scene)
{
    if (scene->unk35C < 10) {
        scene->unk3C0 = 0xD2;
        if ((scene->unk3C4 >> 8) + gBgScrollRegs[1][1] < 0xE7) {
            scene->unk3C4 += 0x20;
        }
        sub_808E8F8((s16 *)&scene->unk3C0, 0xD2, 1);
    }
}

void sub_8092850(struct FinalEndingFallCutScene *scene)
{
    u8 i;

    for (i = 0; i < 6; i++) {
        if (scene->unk365[i] != 0) {
            scene->unk3C8[i][0] = scene->unk378[i][0];
            scene->unk3C8[i][1] = scene->unk378[i][1];
        }
    }
}

void sub_809289C(UNUSED struct FinalEndingFallCutScene *scene)
{
    CpuFastSet((void *)OBJ_PLTT + 0x100, (void *)PLTT + 0x100, 1);
    CpuFastSet((void *)OBJ_PLTT + 0x120, (void *)PLTT + 0x120, 1);
}

u32 sub_80928C8(struct FinalEndingFallCutScene *scene)
{
    Background *background;

    background = &scene->unk0;
    background->tilemapId = gUnknown_080E1648[3];
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &scene->unk40;
    background->tilemapId = gUnknown_080E1648[2];
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);
    return 0;
}
