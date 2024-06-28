#include "global.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "multi_sio.h"
#include "flags.h"

#include "lib/m4a.h"

#include "game/character_select.h"
#include "game/save.h"
#include "game/title_screen.h"
#include "game/multiplayer/communication_outcome.h"
#include "game/multiplayer/multipak_connection.h"

#include "game/stage/tilemap_table.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct CommunicationOutcomeScreen {
    Background unk0;
    u8 filler40[96];
    Sprite unkA0;
    Sprite unkD0;
    Sprite s3;
    u8 filler130[204];
    u32 unk1FC;
    u16 unk200;
    u8 filler202;
    u8 unk203;
    u8 unk204[2];
    u8 unk206;
    u8 unk207[21];
}; /* size 0x21C */

static void sub_805BC40(void);

static const u16 sCheeseSittingAnims[2]
    = { SA2_ANIM_MULTIPLAYER_CHEESE_SITTING, SA2_ANIM_MULTIPLAYER_CHEESE_SITTING };
static const u8 sCheeseSittingVariants[2]
    = { SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_HAPPY,
        SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_SAD };
static const TileInfo sCommMessages[][7] = {
    {
        TextElementAlt2(LANG_DEFAULT, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        51, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_JAPANESE, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        51, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_ENGLISH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        75, SA2_ANIM_MP_COMM_MSG_EN),
        TextElementAlt2(LANG_GERMAN, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        75, SA2_ANIM_MP_COMM_MSG_DE),
        TextElementAlt2(LANG_FRENCH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        57, SA2_ANIM_MP_COMM_MSG_FR),
        TextElementAlt2(LANG_SPANISH, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        45, SA2_ANIM_MP_COMM_MSG_ES),
        TextElementAlt2(LANG_ITALIAN, SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR,
                        51, SA2_ANIM_MP_COMM_MSG_IT),
    },
    {
        TextElementAlt2(LANG_DEFAULT, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 66,
                        SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_JAPANESE, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P,
                        66, SA2_ANIM_MP_MSG),
        TextElementAlt2(LANG_ENGLISH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 68,
                        SA2_ANIM_MP_COMM_MSG_EN),
        TextElementAlt2(LANG_GERMAN, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 88,
                        SA2_ANIM_MP_COMM_MSG_DE),
        TextElementAlt2(LANG_FRENCH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 60,
                        SA2_ANIM_MP_COMM_MSG_FR),
        TextElementAlt2(LANG_SPANISH, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 68,
                        SA2_ANIM_MP_COMM_MSG_ES),
        TextElementAlt2(LANG_ITALIAN, SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P, 60,
                        SA2_ANIM_MP_COMM_MSG_IT),
    },
};

void CreateMultipackOutcomeScreen(u8 outcome)
{
    u8 i;
    u8 count;
    struct Task *t;
    struct CommunicationOutcomeScreen *outcomeScreen;
    Sprite *s3;
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

    t = TaskCreate(sub_805BC40, sizeof(struct CommunicationOutcomeScreen), 0x2000, 0,
                   NULL);
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

    s3 = &outcomeScreen->s3;
    s3->x = (DISPLAY_WIDTH / 2);
    s3->y = DISPLAY_HEIGHT - 20;
    s3->graphics.dest = (void *)OBJ_VRAM0;
    s3->oamFlags = 0x3C0;
    s3->graphics.size = 0;
    s3->graphics.anim = SA2_ANIM_MP_MSG;
    s3->variant = outcome + SA2_ANIM_VARIANT_MP_MSG_OK;
    s3->animCursor = 0;
    s3->timeUntilNextFrame = 0;
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s3 = &outcomeScreen->unkD0;
    s3->x = (DISPLAY_WIDTH / 2);
    s3->y = 36;
    s3->graphics.dest = (void *)OBJ_VRAM0 + 0x2000;
    s3->oamFlags = 0x3C0;
    s3->graphics.size = 0;
    s3->graphics.anim = sCheeseSittingAnims[outcome];
    s3->variant = sCheeseSittingVariants[outcome];
    s3->animCursor = 0;
    s3->timeUntilNextFrame = 0;
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s3 = &outcomeScreen->unkA0;
    s3->x = (DISPLAY_WIDTH / 2);
    s3->y = DISPLAY_HEIGHT - 40;
    s3->graphics.dest = (void *)OBJ_VRAM0 + 0x4000;
    s3->oamFlags = 0x3C0;
    s3->graphics.size = 0;
    s3->graphics.anim = sCheeseSittingAnims[outcome];
    s3->variant = sCheeseSittingVariants[outcome];
    s3->animCursor = 0;
    s3->timeUntilNextFrame = 0;
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);

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
    background->tilemapId = TM_MP_MESSAGE_BOX_UNKNOWN;
    DrawBackground(background);
    m4aMPlayAllStop();
    if (outcome != OUTCOME_CONNECTION_SUCCESS) {
        m4aSongNumStart(MUS_VS_MISS);
    } else {
        m4aSongNumStart(MUS_VS_SUCCESS);
    }
}

static void sub_805BC40(void)
{
    Sprite *s;
    struct CommunicationOutcomeScreen *outcomeScreen = TASK_DATA(gCurTask);
    s = &outcomeScreen->unkA0;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (outcomeScreen->unk203 == OUTCOME_CONNECTION_SUCCESS) {
        const TileInfo *unk9090;
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        s = &outcomeScreen->unkD0;
        unk9090 = sCommMessages[0];
        offset = gLoadedSaveGame->language + 7;

        s->graphics.anim = unk9090[offset].anim;
        offset = gLoadedSaveGame->language + 7;
        s->variant = unk9090[offset].variant + unk206 - 2;
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    } else {
        const TileInfo *unk9090;
        s = &outcomeScreen->unkD0;
        unk9090 = sCommMessages[0];

        s->graphics.anim = unk9090[gLoadedSaveGame->language].anim;
        s->variant = unk9090[gLoadedSaveGame->language].variant;
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &outcomeScreen->s3;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

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
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        if (outcome == OUTCOME_CONNECTION_SUCCESS) {
            CreateCharacterSelectionScreen(gSelectedCharacter,
                                           gMultiplayerUnlockedCharacters
                                               & CHARACTER_BIT(CHARACTER_AMY));
        } else {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);

            // TODO: Fix cast!
            gTilemapsRef = (struct MapHeader **)gTilemaps;
            CreateTitleScreenAndSkipIntro();
        }
    }
}
