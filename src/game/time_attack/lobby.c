#include "game/time_attack/lobby.h"
#include "core.h"
#include "sprite.h"
#include "game/save.h"
#include "game/stage/screen_fade.h"
#include "game/stage/stage.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/character_select.h"
#include "game/course_select.h"
#include "game/options_screen.h"
#include "game/title_screen.h"
#include "constants/zones.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

struct TimeAttackLobbyScreen {
    Background unk0;
    Background unk40;
    Sprite unk80;
    Sprite unkB0[5];
    ScreenFade unk1A0;
    u8 unk1AC;
    u8 cursor;
    u8 unk1AE;
    u8 unk1AF;
};

const TileInfo gUnknown_080E0474[] = {
    TextElementAlt4(0, 20, 0),   TextElementAlt4(0, 16, 91),  TextElementAlt4(0, 30, 182), TextElementAlt4(0, 20, 273),
    TextElementAlt4(0, 20, 364), TextElementAlt4(3, 64, 9),   TextElementAlt4(3, 64, 100), TextElementAlt4(3, 64, 191),
    TextElementAlt4(3, 64, 282), TextElementAlt4(3, 64, 373),
};

const TileInfo gUnknown_080E04C4[] = {
    TextElementAlt4(0, 9, 455),
    TextElementAlt4(0, 9, 456),
};

const TileInfo gUnknown_080E04D4[] = {
    TextElementAlt4(0, 22, 1051), TextElementAlt4(1, 32, 1051), TextElementAlt4(2, 22, 1051), TextElementAlt4(3, 22, 1051),
    TextElementAlt4(4, 10, 1051), TextElementAlt4(0, 24, 1052), TextElementAlt4(1, 42, 1052), TextElementAlt4(2, 36, 1052),
    TextElementAlt4(3, 30, 1052), TextElementAlt4(4, 8, 1052),  TextElementAlt4(0, 24, 1053), TextElementAlt4(1, 36, 1053),
    TextElementAlt4(2, 42, 1053), TextElementAlt4(3, 36, 1053), TextElementAlt4(4, 20, 1053), TextElementAlt4(0, 24, 1054),
    TextElementAlt4(1, 48, 1054), TextElementAlt4(2, 36, 1054), TextElementAlt4(3, 32, 1054), TextElementAlt4(4, 8, 1054),
    TextElementAlt4(0, 44, 1055), TextElementAlt4(1, 44, 1055), TextElementAlt4(2, 38, 1055), TextElementAlt4(3, 32, 1055),
    TextElementAlt4(4, 8, 1055),  TextElementAlt4(0, 20, 1056), TextElementAlt4(1, 44, 1056), TextElementAlt4(2, 40, 1056),
    TextElementAlt4(3, 28, 1056), TextElementAlt4(4, 12, 1056),
};

#define IsBossTimeAttack() ((gGameMode / 2) % 2)

void sub_8088944(struct TimeAttackLobbyScreen *lobbyScreen)
{
    ScreenFade *fade;
    Background *background;
    Sprite *s;
    s8 lang = gLoadedSaveGame->language - 1;
    u32 i;

    if (lang < 0) {
        lang = 0;
    }

    gDispCnt = 1;
    gDispCnt |= 0x1341;
    gBgCntRegs[0] = 0x1D05;
    gBgCntRegs[1] = 0x702;

    INIT_BG_SPRITES_LAYER_32(0);
    INIT_BG_SPRITES_LAYER_32(1);
    INIT_BG_SPRITES_LAYER_32(2);

    gBgScrollRegs[0][0] = -8;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    for (i = 0; i < 5; i++) {
        s = &lobbyScreen->unkB0[i + 1];
        if (i != 3) {
            if (i > 3) {
                s = &lobbyScreen->unkB0[i];
            }

            if (i == 2 && (gGameMode & GAME_MODE_BOSS_TIME_ATTACK)) {
                s = &lobbyScreen->unkB0[3];
                i = 3;
            }
            s->graphics.dest = VramMalloc(gUnknown_080E04D4[lang * 5 + i].numTiles);
            s->graphics.anim = gUnknown_080E04D4[lang * 5 + i].anim;
            s->variant = gUnknown_080E04D4[lang * 5 + i].variant;
            s->prevVariant = -1;
            s->x = (DISPLAY_WIDTH / 2);
            s->y = i * 16 + 24;
            if (i > 2) {
                s->y -= 16;
            }
            s->oamFlags = SPRITE_OAM_ORDER(4);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x1000;
            UpdateSpriteAnimation(s);
        }
    }

    s = &lobbyScreen->unk80;
    s->graphics.dest = NULL;
    s->graphics.anim = SA2_ANIM_MSG_JP_TRY_AGAIN;
    s->variant = 5;
    s->prevVariant = -1;
    s->x = 0;
    s->y = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    s = &lobbyScreen->unk80;
    s->graphics.dest = VramMalloc(gUnknown_080E0474[gSelectedCharacter].numTiles);
    s->graphics.anim = gUnknown_080E0474[gSelectedCharacter].anim;
    s->variant = gUnknown_080E0474[gSelectedCharacter].variant;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT * (13. / 16.));
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1400;
    UpdateSpriteAnimation(s);

    lobbyScreen->unkB0[0].graphics.dest = 0;

    if (gSelectedCharacter == CHARACTER_CREAM) {
        lobbyScreen->unk1AC = 1;
        s = &lobbyScreen->unkB0[0];
        s->graphics.dest = VramMalloc(gUnknown_080E04C4[0].numTiles);
        s->graphics.anim = gUnknown_080E04C4[0].anim;
        s->variant = gUnknown_080E04C4[0].variant;
        s->prevVariant = -1;
        s->x = (DISPLAY_WIDTH * (5. / 12.));
        s->y = (DISPLAY_HEIGHT * (11. / 16.));
        s->oamFlags = SPRITE_OAM_ORDER(5);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x1400;
        UpdateSpriteAnimation(s);
    }

    background = &lobbyScreen->unk40;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(29);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MESSAGE_BOX_BLACK;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1C;
    background->targetTilesY = 0xC;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &lobbyScreen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(7);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_GREEN_CARET;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    fade = &lobbyScreen->unk1A0;
    fade->window = 1;
    fade->brightness = Q_8_8(0);
    fade->flags = 2;
    fade->speed = 0x200;
    fade->bldCnt = 0x3FFF;
    fade->bldAlpha = 0;

    m4aSongNumStart(MUS_TIME_ATTACK_MENU);
    UpdateScreenFade(fade);
}

void sub_8088EB4(void);

void sub_8088CC4(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
    Sprite *s;
    u32 i;

    for (i = 0; i < 4; i++) {
        s = &lobbyScreen->unkB0[i + 1];
        if (i == lobbyScreen->cursor) {
            s->palId = 0;
        } else {
            s->palId = 1;
        }
        DisplaySprite(s);
    }
    s = &lobbyScreen->unk80;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (lobbyScreen->unk1AC != 0) {
        s = &lobbyScreen->unkB0[0];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (UpdateScreenFade(&lobbyScreen->unk1A0) == SCREEN_FADE_COMPLETE) {
        gCurTask->main = sub_8088EB4;
    }
}

void sub_8088D60(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
    Sprite *s;
    u32 i;
    if (UpdateScreenFade(&lobbyScreen->unk1A0) == SCREEN_FADE_COMPLETE) {
#ifdef BUG_FIX
        u8 selection = lobbyScreen->cursor;
        TaskDestroy(gCurTask);
        switch (selection)
#else
        // This is a use-after-free bug.
        // It usually works out because per default Task data is not cleared on destruction.
        TaskDestroy(gCurTask);
        switch (lobbyScreen->cursor)
#endif
        {
            case 0:
                GameStageStart();
                break;
            case 1:
                CreateCharacterSelectionScreen(gSelectedCharacter, gLoadedSaveGame->unlockedCharacters & CHARACTER_BIT(CHARACTER_AMY));
                gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
                break;
            case 2:
                CreateTimeAttackLevelSelectScreen(IsBossTimeAttack(), gSelectedCharacter, gCurrentLevel);
                break;
            case 3:
                CreateTitleScreenAndSkipIntro();
                break;
        }
        return;
    }

    for (i = 0; i < 4; i++) {
        s = &lobbyScreen->unkB0[i + 1];
        DisplaySprite(s);
    }

    s = &lobbyScreen->unk80;
    switch (lobbyScreen->cursor) {
        case 1:
            s->x -= 4;
            break;
        case 0:
        case 2:
            s->x += 4;
            break;
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (lobbyScreen->unk1AC == 0) {
        return;
    }

    s = &lobbyScreen->unkB0[0];
    switch (lobbyScreen->cursor) {
        case 1:
            s->x -= 2;
            break;
        case 0:
        case 2:
            s->x += 3;
            break;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_8088EB4(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
    Sprite *s;
    ScreenFade *fade;
    u32 i;

    if (gRepeatedKeys & (DPAD_UP) && lobbyScreen->cursor != 0) {
        lobbyScreen->cursor--;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if (gRepeatedKeys & DPAD_DOWN && lobbyScreen->cursor != 3) {
        lobbyScreen->cursor++;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    for (i = 0; i < 4; i++) {
        s = &lobbyScreen->unkB0[i + 1];
        if (i == lobbyScreen->cursor) {
            s->palId = 0;
        } else {
            s->palId = 1;
        }
        DisplaySprite(s);
    }
    s = &lobbyScreen->unk80;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (lobbyScreen->unk1AC != 0) {
        s = &lobbyScreen->unkB0[0];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (gRepeatedKeys & A_BUTTON) {
        if (lobbyScreen->cursor != 3) {
            s = &lobbyScreen->unk80;
            VramFree(s->graphics.dest);
            s->graphics.dest = VramMalloc(gUnknown_080E0474[gSelectedCharacter + 5].numTiles);
            s->graphics.anim = gUnknown_080E0474[gSelectedCharacter + 5].anim;
            s->variant = gUnknown_080E0474[gSelectedCharacter + 5].variant;
            s->prevVariant = -1;
            s->animSpeed = 0x40;
            if (lobbyScreen->cursor == 1) {
                s->frameFlags &= ~0x400;
            }
            UpdateSpriteAnimation(s);

            if (lobbyScreen->unk1AC != 0) {
                s = &lobbyScreen->unkB0[0];
                VramFree(s->graphics.dest);

                s->graphics.dest = VramMalloc(gUnknown_080E04C4[1].numTiles);
                s->graphics.anim = gUnknown_080E04C4[1].anim;
                s->variant = gUnknown_080E04C4[1].variant;
                s->prevVariant = -1;
                s->animSpeed = 0x40;
                if (lobbyScreen->cursor == 1) {
                    s->frameFlags &= ~0x400;
                }
                UpdateSpriteAnimation(s);
            }
        }

        lobbyScreen->unk1A0.bldAlpha = 0;
        lobbyScreen->unk1A0.brightness = 0;
        lobbyScreen->unk1A0.flags = 1;
        m4aSongNumStart(SE_SELECT);
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 0x1000);
        gCurTask->main = sub_8088D60;
    }
}

void sub_8089104(struct Task *);

void CreateTimeAttackLobbyScreen()
{
    struct Task *t = TaskCreate(sub_8088CC4, sizeof(struct TimeAttackLobbyScreen), 0x1000, 0, sub_8089104);
    struct TimeAttackLobbyScreen *lobbyScreen = TASK_DATA(t);

    lobbyScreen->cursor = 0;
    lobbyScreen->unk1AC = 0;
    sub_8088944(lobbyScreen);
}

void sub_8089104(struct Task *t)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TASK_DATA(t);
    VramFree(lobbyScreen->unkB0[1].graphics.dest);
    VramFree(lobbyScreen->unkB0[2].graphics.dest);
    VramFree(lobbyScreen->unkB0[3].graphics.dest);
    VramFree(lobbyScreen->unkB0[4].graphics.dest);
    VramFree(lobbyScreen->unk80.graphics.dest);
    if (lobbyScreen->unk1AC != 0) {
        VramFree(lobbyScreen->unkB0[0].graphics.dest);
    }
}
