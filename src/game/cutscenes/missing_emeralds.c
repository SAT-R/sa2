#include "global.h"
#include "core.h"
#include "game/cutscenes/missing_emeralds.h"
#include "game/stage/screen_fade.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"
#include "game/title_screen.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

void Task_8094360(void);
void TaskDestructor_80945A0(struct Task *);

struct MissingChaosEmaraldsCutScene {
    Background unk0;
    Background unk40;
    Sprite unk80;
    ScreenFade unkB0;

    u8 unkBC;
    u8 unkBD;
    u8 unkBE;
    s8 unkBF;

    u32 unkC0;
    void *unkC4;
};

static const u16 sTilemapsPlayerNotifs[34] = {
    TM_COLLECT_ALL_CHAOS_EMERALDS_JP,
    TM_COLLECT_ALL_CHAOS_EMERALDS_EN,
    TM_COLLECT_ALL_CHAOS_EMERALDS_DE,
    TM_COLLECT_ALL_CHAOS_EMERALDS_FR,
    TM_COLLECT_ALL_CHAOS_EMERALDS_ES,
    TM_COLLECT_ALL_CHAOS_EMERALDS_IT,

    TM_UNLOCKED_TINY_CHAO_GARDEN_JP,
    TM_UNLOCKED_TINY_CHAO_GARDEN_JP,
    TM_UNLOCKED_TINY_CHAO_GARDEN_EN,
    TM_UNLOCKED_TINY_CHAO_GARDEN_DE,
    TM_UNLOCKED_TINY_CHAO_GARDEN_FR,
    TM_UNLOCKED_TINY_CHAO_GARDEN_ES,
    TM_UNLOCKED_TINY_CHAO_GARDEN_IT,

    TM_UNLOCKED_SOUND_TEST_JP,
    TM_UNLOCKED_SOUND_TEST_JP,
    TM_UNLOCKED_SOUND_TEST_EN,
    TM_UNLOCKED_SOUND_TEST_DE,
    TM_UNLOCKED_SOUND_TEST_FR,
    TM_UNLOCKED_SOUND_TEST_ES,
    TM_UNLOCKED_SOUND_TEST_IT,

    TM_UNLOCKED_BOSSES_TIME_ATTACK_JP,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_JP,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_EN,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_DE,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_FR,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_ES,
    TM_UNLOCKED_BOSSES_TIME_ATTACK_IT,

    TM_UNLOCKED_AMY_JP,
    TM_UNLOCKED_AMY_JP,
    TM_UNLOCKED_AMY_EN,
    TM_UNLOCKED_AMY_DE,
    TM_UNLOCKED_AMY_FR,
    TM_UNLOCKED_AMY_ES,
    TM_UNLOCKED_AMY_IT,
};

static const TileInfo gUnknown_080E1CA0[3] = {
    { 48, SA2_ANIM_MULTIPLAYER_CHEESE_SITTING, 0 },
    { 63, SA2_ANIM_AMY_UNLOCKED, 0 },
    { 80, SA2_ANIM_AMY_UNLOCKED, 1 },
};

void CreateMissingChaosEmaraldsCutScene(void)
{
    u8 i;
    struct Task *t;
    struct MissingChaosEmaraldsCutScene *scene = NULL;
    ScreenFade *fade = NULL;

    gDispCnt = 0x1040;
    gBgCntRegs[0] = 0x1e03;
    gBgCntRegs[1] = 0x1c05;
    INIT_BG_SPRITES_LAYER_32(0);
    gBgSprites_Unknown1[1] = 0xff;
    gBgSprites_Unknown2[1][0] = 0;
    gBgSprites_Unknown2[1][1] = 0;
    gBgSprites_Unknown2[1][2] = 0xff;
    gBgSprites_Unknown2[1][3] = 0x20;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);

    t = TaskCreate(Task_8094360, sizeof(struct MissingChaosEmaraldsCutScene), 0x3100, 0, TaskDestructor_80945A0);
    scene = TASK_DATA(t);

    scene->unkBC = 0;
    scene->unkC0 = 240;
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
    fade = &scene->unkB0;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->speed = Q(0.5);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;

    scene->unkC4 = OBJ_VRAM0;

    {
        Sprite *s;
        s = &scene->unk80;
        s->graphics.dest = OBJ_VRAM0;
        if (scene->unkBD < 4) {
            scene->unkC4 += gUnknown_080E1CA0[0].numTiles * TILE_SIZE_4BPP;
            s->graphics.anim = gUnknown_080E1CA0[0].anim;
            s->variant = gUnknown_080E1CA0[0].variant;
            s->y = 85;
        } else {
            scene->unkC4 += 0xA00;
            s->graphics.anim = gUnknown_080E1CA0[1].anim;
            s->variant = gUnknown_080E1CA0[1].variant;
            s->y = 90;
        }
        s->prevVariant = -1;
        s->x = (DISPLAY_WIDTH / 2);
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
        Background *background;
        background = &scene->unk0;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(30);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        background->targetTilesY = 0x14;
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAGS_BG_ID(0);
    }
    {
        Background *background;
        background = &scene->unk40;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
        background->graphics.anim = 0;
        background->layoutVram = (void *)BG_SCREEN_ADDR(28);
        background->unk18 = 0;
        background->unk1A = 0;
        background->unk1E = 0;
        background->unk20 = 0;
        background->unk22 = 0;
        background->unk24 = 0;
        background->targetTilesX = 0x1E;
        if (scene->unkBD != 0) {
            background->targetTilesY = 7;
        } else {
            background->targetTilesY = 6;
        }
        background->paletteOffset = 0;
        background->flags = BACKGROUND_FLAGS_BG_ID(1);
    }
}

void sub_809449C(void);

void Task_8094360(void)
{
    Background *background = NULL;
    struct MissingChaosEmaraldsCutScene *scene = TASK_DATA(gCurTask);

    if (scene->unkBD == 0) {
        if (scene->unkBF > 1) {
            gDispCnt |= 0x200;
            gBgScrollRegs[1][0] = 0;
            gBgScrollRegs[1][1] = 400;
            background = &scene->unk40;
            background->tilemapId = sTilemapsPlayerNotifs[scene->unkBF - 1];
            DrawBackground(background);
        }

        // "Collect all Chaos Emeralds!" message
        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        background = &scene->unk0;
        background->tilemapId = sTilemapsPlayerNotifs[0];
        DrawBackground(background);
    } else {
        s32 base;
        u16 index;
        gDispCnt |= 0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;

        // "Unlocked Tiny Chao Garden" message
        background = &scene->unk0;
        background->tilemapId = sTilemapsPlayerNotifs[7];
        DrawBackground(background);

        if (scene->unkBD > 1 || scene->unkBF > 1) {
            gDispCnt |= 0x200;
            gBgScrollRegs[1][0] = 0;
            gBgScrollRegs[1][1] = DISPLAY_HEIGHT;

            background = &scene->unk40;
            base = scene->unkBF;
            index = (base + 6 + ((scene->unkBD - 1) * 7));
            background->tilemapId = sTilemapsPlayerNotifs[index];
            DrawBackground(background);
        }
    }

    gCurTask->main = sub_809449C;
}

void sub_80945A4(struct MissingChaosEmaraldsCutScene *scene);
void sub_8094530(void);

void sub_809449C(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unkB0;
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);

    sub_80945A4(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q_8_8(0);
        scene->unkBE = 1;
        gCurTask->main = sub_8094530;
    }
}

void sub_8094570(void);

void sub_80944EC(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TASK_DATA(gCurTask);
    ScreenFade *fade = &scene->unkB0;
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;

    sub_80945A4(scene);

    if (UpdateScreenFade(fade) == SCREEN_FADE_COMPLETE) {
        fade->brightness = Q_8_8(0);

        gCurTask->main = sub_8094570;
    }
}

void sub_8094530(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TASK_DATA(gCurTask);
    sub_80945A4(scene);
    if (scene->unkC0 != 0) {
        scene->unkC0--;
    } else {
        scene->unkC0 = 180;
        gCurTask->main = sub_80944EC;
    }
}

void sub_8094570(void)
{
    struct MissingChaosEmaraldsCutScene *scene = TASK_DATA(gCurTask);
    if (scene->unkC0 != 0) {
        scene->unkC0--;
    } else {
        CreateTitleScreen();
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_80945A0(struct Task *t)
{
    // unused logic
}

void sub_80945A4(struct MissingChaosEmaraldsCutScene *scene)
{
    if (scene->unkBD != 0) {
        Sprite *s = &scene->unk80;
        if (scene->unkBD > 3 && scene->unkBE != 0) {
            s->graphics.anim = gUnknown_080E1CA0[2].anim;
            s->variant = gUnknown_080E1CA0[2].variant;
        }
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}
