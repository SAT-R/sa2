#include "global.h"
#include "game/cutscenes/level_endings.h"
#include "core.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "game/course_select.h"
#include "game/save.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/results.h"

#if TAS_TESTING
#include "game/title_screen.h"
#endif

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

typedef struct {
    Player *unk0;
    Sprite unk4;
    Sprite unk34;
    ScreenFade unk64;
    u16 unk70;
    u16 unk72;
    u16 unk74;
    u16 unk76;
    u16 unk78;
    u8 unk7A;
    u8 unk7B;
    s8 unk7C;
} ResultsCutScene /* 0x80 */;

struct CharacterUnlockCutScene {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
    ScreenFade unk100;

    // slide
    u16 unk10C;

    // caption
    u16 unk10E;

    u16 unk110;
    u8 unk112;
} /** size 0x114*/;

static void sub_808DD9C(void);
static void sub_808DF88(void);
static void sub_808E114(void);

// slides
static const u16 sTilemapsCharacterSlides[] = {
    TM_STORYFRAME_CREAM_UNLOCK_0,    TM_STORYFRAME_CREAM_UNLOCK_1,    TM_STORYFRAME_CREAM_UNLOCK_2,    TM_STORYFRAME_CREAM_UNLOCK_3,

    TM_STORYFRAME_KNUCKLES_UNLOCK_0, TM_STORYFRAME_KNUCKLES_UNLOCK_1, TM_STORYFRAME_KNUCKLES_UNLOCK_2, TM_STORYFRAME_KNUCKLES_UNLOCK_3,

    TM_STORYFRAME_TAILS_UNLOCK_0,    TM_STORYFRAME_TAILS_UNLOCK_1,    TM_STORYFRAME_TAILS_UNLOCK_2,    TM_STORYFRAME_TAILS_UNLOCK_3,
};

#define SLIDES_GROUP(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14)                                                      \
    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14

static const u16 sTilemapsCharacterDialogue[] = {
    /* LANG_JAPANESE */
    SLIDES_GROUP(270, 271, 272, 273, 274, 304, 305, 306, 307, 308, 338, 339, 340, 341, 342),

    /* LANG_ENGLISH */
    SLIDES_GROUP(275, 276, 277, 278, 279, 309, 310, 311, 312, 313, 343, 344, 345, 346, 347),

    /* LANG_FRENCH */
    SLIDES_GROUP(285, 286, 287, 288, 289, 319, 320, 321, 322, 323, 353, 354, 355, 356, 357),

    /* LANG_GERMAN */
    SLIDES_GROUP(280, 281, 282, 283, 284, 314, 315, 316, 317, 318, 348, 349, 350, 351, 352),

    /* LANG_SPANISH */
    SLIDES_GROUP(295, 296, 297, 298, 299, 329, 330, 331, 332, 333, 363, 364, 365, 366, 367),

    /* LANG_ITALIAN */
    SLIDES_GROUP(290, 291, 292, 293, 294, 324, 325, 326, 327, 328, 358, 359, 360, 361, 362),
};

static const u32 sAnimsCharacterRescued[] = {
    // 0 - Cream
    20,
    135,
    0,

    // 1 - Tails
    30,
    223,
    0,

    // 2 - Knuckles
    35,
    316,
    0,
};

static const TaskMain gUnknown_080E1208[] = {
    sub_808DD9C,
    sub_808DF88,
    sub_808E114,
};

static const u16 gUnknown_080E1214[] = {
    // 0
    Q_8_8(148),
    Q_8_8(0),
    // 1
    Q_8_8(184),
    Q_8_8(0),
    // 2
    Q_8_8(0),
    Q_8_8(136),
};

static const u16 gUnknown_080E1220[] = {
    // 0
    208,
    288,

    // 1
    224,
    288,

    // 2
    256,
    0,
};

static const u16 gUnknown_080E122C[3] = { 0, 5, 4 };

UNUSED static const u16 gUnknown_080E1232[] = {
    0, 26, 0, 757, 1, 26, 0, 757, 2,
};

void sub_808E890(struct Task *);

void CreateStageResultsCutscene(u8 mode)
{
    TaskMain mains[3];
    u16 unk1214[6], unk1220[6], unk122C[3];

    struct Task *t;
    ResultsCutScene *scene;
    Sprite *s;
    ScreenFade *fade;
    memcpy(mains, gUnknown_080E1208, sizeof(gUnknown_080E1208));
    memcpy(unk1214, gUnknown_080E1214, sizeof(gUnknown_080E1214));
    memcpy(unk1220, gUnknown_080E1220, sizeof(gUnknown_080E1220));
    memcpy(unk122C, gUnknown_080E122C, sizeof(gUnknown_080E122C));

    t = TaskCreate(mains[mode], sizeof(ResultsCutScene), 0x5000, 0, sub_808E890);
    scene = TASK_DATA(t);

    scene->unk78 = 0;
    scene->unk7A = 0;
    scene->unk7B = 0;
    scene->unk7C = 0;

    scene->unk70 = unk1214[mode * 2];
    scene->unk72 = unk1214[(mode * 2) + 1];

    scene->unk74 = unk1220[mode * 2];
    scene->unk76 = unk1220[(mode * 2) + 1];

    scene->unk0 = &gPlayer;

    s = &scene->unk4;

    s->graphics.dest = VramMalloc(sAnimsCharacterRescued[mode * 3]);
    s->graphics.anim = sAnimsCharacterRescued[(mode * 3) + 1];
    s->variant = sAnimsCharacterRescued[(mode * 3) + 2];
    s->prevVariant = -1;

    s->x = 0;
    s->y = 0;
    s->graphics.size = 0;
    s->oamFlags = SPRITE_OAM_ORDER(10);
    s->qAnimDelay = 0;

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = unk122C[mode];

    if (mode != 2) {
        s->frameFlags = 0x400;
    } else {
        s->frameFlags = 0;
    }

    UpdateSpriteAnimation(s);

    scene->unk34.graphics.dest = NULL;

    if (mode == 0) {
        s = &scene->unk34;
        s->graphics.dest = VramMalloc(6);
        s->graphics.anim = SA2_ANIM_CHEESE_DOWNWARDS;
        s->variant = 0;
        s->prevVariant = -1;

        s->x = 0;
        s->y = 0;
        s->graphics.size = 0;
        s->oamFlags = SPRITE_OAM_ORDER(9);
        s->qAnimDelay = 0;

        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0x400;
        UpdateSpriteAnimation(s);
        m4aSongNumStart(SE_236);
    }

    fade = &scene->unk64;
    fade->window = 0;
    fade->flags = SCREEN_FADE_FLAG_FF00;
    fade->brightness = Q_8_8(1);
    fade->speed = Q(0);
    fade->bldCnt = 0;
}

static void sub_808DD9C(void)
{
    ResultsCutScene *scene = TASK_DATA(gCurTask);
    Sprite *s = &scene->unk4;
    Player *player = scene->unk0;
    ScreenFade *fade = &scene->unk64;

    scene->unk70 -= scene->unk74;
    scene->unk72 += scene->unk76;

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0xFF) >> 8;
    }

    if (scene->unk76 < 0x800) {
        scene->unk76 = (scene->unk76 * 0x43) >> 6;
    }

    if (scene->unk70 < (player->qWorldX - Q(gCamera.x) - Q(20.0))) {
        scene->unk70 = (player->qWorldX - Q(gCamera.x) - Q(20.0));
    }

    if (scene->unk72 > (player->qWorldY - (gCamera.y * 0x100) - 0xA00)) {
        // Required for match
        scene->unk72 = scene->unk72 = player->qWorldY - (gCamera.y * 0x100) - 0xA00;
        scene->unk70 = player->qWorldX - Q(gCamera.x) - Q(20.0);

        if (scene->unk7A == 0) {
            player->charState = CHARSTATE_SONIC_CAUGHT_CREAM;

            VramFree(scene->unk4.graphics.dest);

            s->graphics.dest = VramMalloc(0x19);
            s->graphics.anim = SA2_ANIM_CREAM_HOLDING_ONTO_SONIC;
            scene->unk4.variant = 0;
            scene->unk4.prevVariant = -1;

            scene->unk7A = 1;

            scene->unk34.graphics.anim = SA2_ANIM_CHEESE_SIDEWAYS_2;
            scene->unk34.variant = 0;
            scene->unk34.prevVariant = -1;
        }
    }

    if (scene->unk7A == 1) {
        fade->window = scene->unk0->rotation * 4;
    }

    s->x = scene->unk70 >> 8;
    s->y = scene->unk72 >> 8;

    fade->speed = scene->unk70 >> 8;
    fade->bldCnt = scene->unk72 >> 8;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    scene->unk34.x = s->x;
    scene->unk34.y = s->y;
    UpdateSpriteAnimation(&scene->unk34);
    DisplaySprite(&scene->unk34);

    scene->unk78++;

    if (scene->unk78 == 200) {
        CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    }
}

static void sub_808DF88(void)
{
    ResultsCutScene *scene = TASK_DATA(gCurTask);
    Sprite *s = &scene->unk4;
    Player *player = scene->unk0;

    scene->unk70 -= scene->unk74;
    scene->unk72 += scene->unk76;

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0x7F) >> 7;
    }

    if (scene->unk76 > 0x60) {
        scene->unk76 = (scene->unk76 * 0x7F) >> 7;
    }

    if (scene->unk70 < (player->qWorldX - Q(gCamera.x) - 0x1C00)) {
        scene->unk70 = player->qWorldX - Q(gCamera.x) - 0x1C00;
    }

    if (scene->unk72 > (player->qWorldY - (gCamera.y * 0x100) - 0x1400)) {
        scene->unk72 = player->qWorldY - (gCamera.y * 0x100) - 0x1400;
        scene->unk70 = player->qWorldX - Q(gCamera.x) - 0x1C00;

        if (scene->unk7A == 0) {
            VramFree(scene->unk4.graphics.dest);

            s->graphics.dest = VramMalloc(0x24);
            s->graphics.anim = SA2_ANIM_TAILS_FLYING;
            scene->unk4.variant = SA2_ANIM_VARIANT_TAILS_FLYING_WAVING_AT_PLAYER;
            scene->unk7A = 1;
            scene->unk7A = 1;
        }
    }

    s->x = scene->unk70 >> 8;

    if (scene->unk7A != 0) {
        s16 sin;
        scene->unk7B += 4;
        sin = SIN(scene->unk7B * 4) >> 12;
        s->y = (scene->unk72 >> 8) + sin;
    } else {
        s->y = (scene->unk72 >> 8);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    scene->unk78++;

    if (scene->unk78 == 200) {
        CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    }
}

static void sub_808E114(void)
{
    s32 result;
    ResultsCutScene *scene = TASK_DATA(gCurTask);
    Sprite *s = &scene->unk4;
    Player *player = scene->unk0;

    if (scene->unk78 < 0x2E) {
        scene->unk70 += scene->unk74;
    } else {
        s16 sin = SIN(((scene->unk78 - 0x2D) * 2 & 0xFF) * 4) >> 6;
        scene->unk7C = (sin * 5) >> 7;
    }

    if (scene->unk74 > 0x60) {
        scene->unk74 = (scene->unk74 * 0x7F) >> 7;
    }

    if (scene->unk70 > (player->qWorldX - (gCamera.x * 256) - 0x4000)) {
        scene->unk70 = player->qWorldX - (gCamera.x * 256) - 0x4000;
    }

    result = sub_801F100((scene->unk72 >> 8) + gCamera.y, (scene->unk70 >> 8) + gCamera.x + scene->unk7C, 1, 8, sub_801EC3C);

    if (result < 0) {
        scene->unk72 += result * 0x100;
    }

    if (result > 0) {
        scene->unk72 += 0x100;
    }

    s->x = (scene->unk70 >> 8) + scene->unk7C;
    s->y = (scene->unk72 >> 8) - 0xE;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (scene->unk78 == 0x28) {
        player->charState = CHARSTATE_SONIC_CAUGHT_CREAM;
    }

    if (scene->unk78 == 200) {
        CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    }

    scene->unk78++;
}

void sub_808E35C(struct CharacterUnlockCutScene *scene);

void sub_808E274(struct CharacterUnlockCutScene *scene)
{
    ScreenFade *fade;
    gDispCnt = 0x1600;
    gDispCnt |= 0x40;

    gBgCntRegs[0] = 0x1c00;
    gBgCntRegs[1] = 0x1d05;
    gBgCntRegs[2] = 0x5e0a;
    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);
    INIT_BG_SPRITES_LAYER_32(0);
    gBgSprites_Unknown1[1] = 0xff;
    gBgSprites_Unknown2[1][0] = 0;
    gBgSprites_Unknown2[1][1] = 0;
    gBgSprites_Unknown2[1][2] = 0xff;
    gBgSprites_Unknown2[1][3] = 0x20;
    INIT_BG_SPRITES_LAYER_32(2);
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = -120;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, gBgAffineRegs);
    sub_808E35C(scene);

    fade = &scene->unk100;
    fade->window = 1;
    fade->brightness = Q_8_8(0);
    fade->flags = 2;
    fade->speed = 0x200;
    fade->bldCnt = 0x3FFF;
    fade->bldAlpha = 0;

    UpdateScreenFade(fade);
}

void sub_808E35C(struct CharacterUnlockCutScene *scene)
{
    Background *background;
    s8 lang = gLoadedSaveGame->language - 1;
    if (lang < 0) {
        lang = 0;
    }

    background = &scene->unk80;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(29);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = sTilemapsCharacterDialogue[scene->unk10E + (lang * 15)];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 30;
    background->targetTilesY = 5;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    background = &scene->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = sTilemapsCharacterSlides[scene->unk10C];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 30;
    background->targetTilesY = 20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(2);
    DrawBackground(background);
}

void sub_808E4C8(void);

void sub_808E424(void)
{
    struct CharacterUnlockCutScene *scene = TASK_DATA(gCurTask);

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

    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, gBgAffineRegs);
    if (UpdateScreenFade(&scene->unk100) == SCREEN_FADE_COMPLETE) {
        scene->unk110 = 0;
        gCurTask->main = sub_808E4C8;
    }
}

void sub_808E63C(void);

void sub_808E4C8(void)
{
    struct CharacterUnlockCutScene *scene;
    s8 lang = gLoadedSaveGame->language - 1;

    if (lang < 0) {
        lang = 0;
    }

    scene = TASK_DATA(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, gBgAffineRegs);

    if (scene->unk110++ > 340) {
        scene->unk110 = 0;

        if ((scene->unk10C & 3) == 3) {
            Background *background;
            gBgScrollRegs[0][1] = 0xFFDC;

            background = &scene->unk40;
            background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
            background->graphics.anim = 0;
            background->layoutVram = (void *)BG_SCREEN_ADDR(28);
            background->unk18 = 0;
            background->unk1A = 0;
            background->tilemapId = sTilemapsCharacterDialogue[scene->unk10E + 1 + (lang * 15)];
            background->unk1E = 0;
            background->unk20 = 0;
            background->unk22 = 0;
            background->unk24 = 0;
            background->targetTilesX = 30;
            background->targetTilesY = 5;
            background->paletteOffset = 0;
            background->flags = BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_FLAGS_BG_ID(0);
            DrawBackground(background);
            gDispCnt |= DISPCNT_BG0_ON;
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
        scene->unk110 = 340;
    }
}

void sub_808E6B0(void);

void sub_808E63C(void)
{
    struct CharacterUnlockCutScene *scene = TASK_DATA(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, gBgAffineRegs);

    if (scene->unk110++ > 300) {
        ScreenFade *fade;
        scene->unk110 = 0;
        fade = &scene->unk100;
        fade->window = 1;
        fade->bldCnt = 0x3FFF;
        fade->brightness = Q_8_8(0);
        fade->flags = 1;
        fade->bldAlpha = 0;

        gCurTask->main = sub_808E6B0;
    }
}

void sub_808E6B0(void)
{
    struct CharacterUnlockCutScene *scene = TASK_DATA(gCurTask);
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 0, gBgAffineRegs);

    if (UpdateScreenFade(&scene->unk100) == SCREEN_FADE_COMPLETE) {
        if (gCurrentLevel >= gLoadedSaveGame->unlockedLevels[gSelectedCharacter]) {
            CreateCourseSelectionScreen(gCurrentLevel, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 1);
        } else {
            CreateCourseSelectionScreen(gCurrentLevel, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 4);
        }
        TaskDestroy(gCurTask);
    }
}

void CreateCharacterUnlockCutScene(u8 zone)
{
#if TAS_TESTING
    // Most TAS tooling resets to the title screen
    // as soon as any cutscene starts
    CreateTitleScreenAndSkipIntro();
#else
    struct Task *t = TaskCreate(sub_808E424, sizeof(struct CharacterUnlockCutScene), 0x1000, 0, NULL);
    struct CharacterUnlockCutScene *scene = TASK_DATA(t);
    scene->unk10C = zone * 4;
    scene->unk10E = zone * 5;
    scene->unk110 = 0;
    scene->unk112 = zone;
    sub_808E274(scene);
#endif
}

void CreateCreamUnlockCutScene(void)
{
    struct Task *t = TaskCreate(sub_808E424, sizeof(struct CharacterUnlockCutScene), 0x1000, 0, NULL);
    struct CharacterUnlockCutScene *scene = TASK_DATA(t);
    scene->unk10C = 0;
    scene->unk10E = 0;
    scene->unk110 = 0;
    sub_808E274(scene);
}

void CreateTailsUnlockCutScene(void)
{
    struct Task *t = TaskCreate(sub_808E424, sizeof(struct CharacterUnlockCutScene), 0x1000, 0, NULL);
    struct CharacterUnlockCutScene *scene = TASK_DATA(t);
    scene->unk10C = 8;
    scene->unk10E = 10;
    scene->unk110 = 0;
    sub_808E274(scene);
}

void CreateKnucklesUnlockCutScene(void)
{
    struct Task *t = TaskCreate(sub_808E424, sizeof(struct CharacterUnlockCutScene), 0x1000, 0, NULL);
    struct CharacterUnlockCutScene *scene = TASK_DATA(t);
    scene->unk10C = 4;
    scene->unk10E = 5;
    scene->unk110 = 0;
    sub_808E274(scene);
}

void sub_808E890(struct Task *t)
{
    ResultsCutScene *scene = TASK_DATA(t);
    VramFree(scene->unk4.graphics.dest);

    if (scene->unk34.graphics.dest != NULL) {
        VramFree(scene->unk34.graphics.dest);
    }
}
