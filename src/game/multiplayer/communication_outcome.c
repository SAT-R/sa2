#include "global.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "multi_sio.h"
#include "flags.h"

#include "lib/m4a/m4a.h"

#include "game/character_select.h"
#include "game/save.h"
#include "game/title_screen.h"
#include "game/multiplayer/communication_outcome.h"
#include "game/multiplayer/multipak_connection.h"
#if (GAME == GAME_SA1)
#include "game/multiplayer/results.h"
#endif

#include "game/stage/tilemap_table.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct CommunicationOutcomeScreen {
    Background unk0;
    Sprite spr40;
    Sprite spr70;
    Sprite sprA0;
    Sprite sprD0;
    Sprite spr100;
    u8 filler130[204];
    s32 unk1FC;
    u16 unk200;
    u8 filler202;
    u8 unk203;
    u8 unk204[2];
    u8 unk206;
    u8 unk207[21];
}; /* size 0x21C */

static void Task_MultipackOutcomeScreen(void);

#if (GAME == GAME_SA1)
extern const u8 gUnknown_084ADA08[2];
extern const u16 gUnknown_084ADA10[5];
extern const u16 sBackgroundAnims[2];
extern const u8 sBackgroundVariants[2];
extern const TileInfo sCommMessages[][7];
extern u16 gUnknown_084ADA0A[2];
extern u8 gUnknown_084ADA0E[2];
static const u16 sTilemapIds[2] = { TM_MP_CONNECTION_SUCCESS, TM_MP_CONNECTION_ERROR };
static const u16 sResultSongs[2] = { SE_301, SE_302 };
#elif (GAME == GAME_SA2)
static const u16 sBackgroundAnims[2] = { SA2_ANIM_MULTIPLAYER_CHEESE_SITTING, SA2_ANIM_MULTIPLAYER_CHEESE_SITTING };
static const u8 sBackgroundVariants[2]
    = { SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_HAPPY, SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_SAD };
static const TileInfo sCommMessages[][7] = {
    {
        TextElementAlt2(LANG_DEFAULT, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 51, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_JAPANESE, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 51, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_ENGLISH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 75, SA2_ANIM_MP_COMM_MSG_EN),
        TextElementAlt2(LANG_GERMAN, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 75, SA2_ANIM_MP_COMM_MSG_DE),
        TextElementAlt2(LANG_FRENCH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 57, SA2_ANIM_MP_COMM_MSG_FR),
        TextElementAlt2(LANG_SPANISH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 45, SA2_ANIM_MP_COMM_MSG_ES),
        TextElementAlt2(LANG_ITALIAN, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR, 51, SA2_ANIM_MP_COMM_MSG_IT),
    },
    {
        TextElementAlt2(LANG_DEFAULT, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 66, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_JAPANESE, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 66, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_ENGLISH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 68, SA2_ANIM_MP_COMM_MSG_EN),
        TextElementAlt2(LANG_GERMAN, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 88, SA2_ANIM_MP_COMM_MSG_DE),
        TextElementAlt2(LANG_FRENCH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 60, SA2_ANIM_MP_COMM_MSG_FR),
        TextElementAlt2(LANG_SPANISH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 68, SA2_ANIM_MP_COMM_MSG_ES),
        TextElementAlt2(LANG_ITALIAN, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 60, SA2_ANIM_MP_COMM_MSG_IT),
    },
};
#endif

void CreateMultipackOutcomeScreen(u8 outcome)
{
    u8 i;
    u8 count;
    struct Task *t;
    struct CommunicationOutcomeScreen *outcomeScreen;
    Sprite *s;
    Background *background;
    gDispCnt = 0x3140;
    gBgCntRegs[0] = 0x803;
    gBgScrollRegs[0][0] = 0x100;
    gBgScrollRegs[0][1] = 0;
    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
    gWinRegs[WINREG_WININ] = 0x31;
    gWinRegs[WINREG_WINOUT] = 0x31;

    gBldRegs.bldCnt = 0xBF;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(Task_MultipackOutcomeScreen, sizeof(struct CommunicationOutcomeScreen), 0x2000, 0, NULL);
    outcomeScreen = TASK_DATA(t);

    outcomeScreen->unk203 = outcome;
    outcomeScreen->unk200 = 0x78;
    outcomeScreen->unk1FC = 0;

    for (i = 0, count = 0; i < 4; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            count++;
        }
    }

    outcomeScreen->unk206 = count;

#if (GAME == GAME_SA1)
    s = &outcomeScreen->sprA0;
    s->x = 93;
    s->y = 85;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x300;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_084ADA0A[outcome];
    s->variant = gUnknown_084ADA0E[outcome];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
    s = &outcomeScreen->spr100;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = DISPLAY_HEIGHT - 20;
    s->graphics.dest = (void *)OBJ_VRAM0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_MP_MSG;
    s->variant = outcome + SA2_ANIM_VARIANT_MP_MSG_OK;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#endif

#if (GAME == GAME_SA1)
    s = &outcomeScreen->spr40;
    s->x = 0;
    s->y = 32;
    s->graphics.dest = (void *)OBJ_VRAM0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MP_OUTCOME_MESSAGES;
    s->variant = outcomeScreen->unk203 + 8;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
    s = &outcomeScreen->sprD0;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = 36;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x2000;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = sBackgroundAnims[outcome];
    s->variant = sBackgroundVariants[outcome];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#endif

#if (GAME == GAME_SA1)
    s = &outcomeScreen->spr70;
    s->x = 0;
    s->y = 21;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x180;
    s->oamFlags = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_OPTS_BLACK_RECT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
    s = &outcomeScreen->sprA0;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = DISPLAY_HEIGHT - 40;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x4000;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = sBackgroundAnims[outcome];
    s->variant = sBackgroundVariants[outcome];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#endif

    background = &outcomeScreen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(8);
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
#if (GAME == GAME_SA1)
    background->tilemapId = sTilemapIds[outcome];
    DrawBackground(background);
#elif (GAME == GAME_SA2)
    background->tilemapId = TM_MP_MESSAGE_BOX_UNKNOWN;
    DrawBackground(background);
    m4aMPlayAllStop();
#endif

#if (GAME == GAME_SA1)
    m4aSongNumStart(sResultSongs[outcome]);
#elif (GAME == GAME_SA2)
    if (outcome != OUTCOME_CONNECTION_SUCCESS) {
        m4aSongNumStart(MUS_VS_MISS);
    } else {
        m4aSongNumStart(MUS_VS_SUCCESS);
    }
#endif
}

static void Task_MultipackOutcomeScreen(void)
{
    Sprite *s;
    struct CommunicationOutcomeScreen *outcomeScreen = TASK_DATA(gCurTask);
    u32 i;

    s = &outcomeScreen->sprA0;
    UpdateSpriteAnimation(s);
#if (GAME == GAME_SA2)
    DisplaySprite(s);
#endif

    if (outcomeScreen->unk203 == OUTCOME_CONNECTION_SUCCESS) {
#if (GAME == GAME_SA1)
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        s->x = gUnknown_084ADA10[outcomeScreen->unk206];

        while (unk206 != 0) {
            DisplaySprite(s);
            s->x += 0x2A;
            unk206--;
        }
#elif (GAME == GAME_SA2)
        const TileInfo *unk9090;
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        s = &outcomeScreen->sprD0;
        unk9090 = sCommMessages[0];
        offset = LOADED_SAVE->language + 7;

        s->graphics.anim = unk9090[offset].anim;
        offset = LOADED_SAVE->language + 7;
        s->variant = unk9090[offset].variant + unk206 - 2;
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
#endif
    } else {
#if (GAME == GAME_SA1)
        DisplaySprite(s);
#elif (GAME == GAME_SA2)
        const TileInfo *unk9090;
        s = &outcomeScreen->sprD0;
        unk9090 = sCommMessages[0];

        s->graphics.anim = unk9090[LOADED_SAVE->language].anim;
        s->variant = unk9090[LOADED_SAVE->language].variant;
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
#endif
    }

#if (GAME == GAME_SA1)
    {
        s32 unk203 = gUnknown_084ADA08[outcomeScreen->unk203];
        s32 v, v0;

        outcomeScreen->unk1FC += 0x80;
        if (outcomeScreen->unk1FC > Q(unk203)) {
            outcomeScreen->unk1FC -= Q(unk203);
        }
        s = &outcomeScreen->spr40;
        UpdateSpriteAnimation(s);

        v0 = I(outcomeScreen->unk1FC) - unk203;
        while (251 - v0 > -11) {
            s->x = 251 - v0;
            DisplaySprite(s);
            v0 += unk203;
        }
        s = &outcomeScreen->spr70;
        s->y = 21;
        for (i = 0; i < 8; i++) {
            s->x = i << 5;
            DisplaySprite(s);
        }
    }
#elif (GAME == GAME_SA2)
    s = &outcomeScreen->spr100;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
#endif

    if (outcomeScreen->unk200 != 0) {
        outcomeScreen->unk200--;
        if (gBldRegs.bldY != 0) {
            gBldRegs.bldY--;
        }
        return;
    }

    if (gBldRegs.bldY != 0x10) {
        gBldRegs.bldY++;
    } else {
        u8 outcome = outcomeScreen->unk203;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        SA2_LABEL(gBgSpritesCount) = 0;
        PAUSE_GRAPHICS_QUEUE();
        if (outcome == OUTCOME_CONNECTION_SUCCESS) {

#if (GAME == GAME_SA1)
            CreateMultiplayerResultsScreen(0);
#elif (GAME == GAME_SA2)
            CreateCharacterSelectionScreen(gSelectedCharacter, gMultiplayerUnlockedCharacters & CHARACTER_BIT(CHARACTER_AMY));
#endif
        } else {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);

            gTilemapsRef = (Tilemap **)gTilemaps;
#if (GAME == GAME_SA1)
            CreateMainMenu(1);
#elif (GAME == GAME_SA2)
            CreateTitleScreenAndSkipIntro();
#endif
        }
    }
}
