#include "global.h"
#include "engine/core.h"
#include "data.h"
#include "multiplayer_communication_outcome.h"
#include "multiplayer_multipak_connection.h"
#include "engine/task.h"
#include "engine/sprite.h"
#include "game/save.h"
#include "title_screen.h"
#include "lib/multi_sio.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "flags.h"
#include "character_select.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

struct CommunicationOutcomeScreen {
    Background unk0;
    u8 filler40[96];
    Sprite unkA0;
    Sprite unkD0;
    Sprite unk100;
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

static const u16 gUnknown_080D9088[2] = { 1075, 1075 };
static const u8 gUnknown_080D908C[2] = { 0, 1 };
static const TileInfo gUnknown_080D9090[][7] = {
    {
        TextElementAlt2(LANG_DEFAULT, 1, 51, 1074),
        TextElementAlt2(LANG_JAPANESE, 1, 51, 1074),
        TextElementAlt2(LANG_ENGLISH, 1, 75, 1079),
        TextElementAlt2(LANG_GERMAN, 1, 75, 1080),
        TextElementAlt2(LANG_FRENCH, 1, 57, 1081),
        TextElementAlt2(LANG_SPANISH, 1, 45, 1082),
        TextElementAlt2(LANG_ITALIAN, 1, 51, 1083),
    },
    {
        TextElementAlt2(LANG_DEFAULT, 3, 66, 1074),
        TextElementAlt2(LANG_JAPANESE, 3, 66, 1074),
        TextElementAlt2(LANG_ENGLISH, 3, 68, 1079),
        TextElementAlt2(LANG_GERMAN, 3, 88, 1080),
        TextElementAlt2(LANG_FRENCH, 3, 60, 1081),
        TextElementAlt2(LANG_SPANISH, 3, 68, 1082),
        TextElementAlt2(LANG_ITALIAN, 3, 60, 1083),
    },
};

void CreateMultipackOutcomeScreen(u8 outcome)
{
    u8 i;
    u8 count;
    struct Task *t;
    struct CommunicationOutcomeScreen *outcomeScreen;
    Sprite *unk100;
    Background *background;
    gDispCnt = 0x3140;
    gBgCntRegs[0] = 0x803;
    gBgScrollRegs[0][0] = 0x100;
    gBgScrollRegs[0][1] = 0;
    gWinRegs[0] = 0xF0;
    gWinRegs[2] = 0xA0;
    gWinRegs[4] = 0x31;
    gWinRegs[5] = 0x31;

    gBldRegs.bldCnt = 0xBF;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(sub_805BC40, sizeof(struct CommunicationOutcomeScreen), 0x2000, 0,
                   NULL);
    outcomeScreen = TaskGetStructPtr(t);

    outcomeScreen->unk203 = outcome;
    outcomeScreen->unk200 = 0x78;
    outcomeScreen->unk1FC = 0;

    for (i = 0, count = 0; i < 4; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            count++;
        }
    }

    outcomeScreen->unk206 = count;

    unk100 = &outcomeScreen->unk100;
    unk100->x = (DISPLAY_WIDTH / 2);
    unk100->y = DISPLAY_HEIGHT - 20;
    unk100->graphics.dest = (void *)OBJ_VRAM0;
    unk100->unk1A = 0x3C0;
    unk100->graphics.size = 0;
    unk100->graphics.anim = SA2_ANIM_MP_MSG;
    unk100->variant = outcome + SA2_ANIM_VARIANT_MP_MSG_OK;
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->focused = 0;
    unk100->unk10 = 0x2000;

    unk100 = &outcomeScreen->unkD0;
    unk100->x = (DISPLAY_WIDTH / 2);
    unk100->y = 36;
    unk100->graphics.dest = (void *)OBJ_VRAM0 + 0x2000;
    unk100->unk1A = 0x3C0;
    unk100->graphics.size = 0;
    unk100->graphics.anim = gUnknown_080D9088[outcome];
    unk100->variant = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->focused = 0;
    unk100->unk10 = 0x2000;

    unk100 = &outcomeScreen->unkA0;
    unk100->x = (DISPLAY_WIDTH / 2);
    unk100->y = DISPLAY_HEIGHT - 40;
    unk100->graphics.dest = (void *)OBJ_VRAM0 + 0x4000;
    unk100->unk1A = 0x3C0;
    unk100->graphics.size = 0;
    unk100->graphics.anim = gUnknown_080D9088[outcome];
    unk100->variant = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->focused = 0;
    unk100->unk10 = 0x2000;

    background = &outcomeScreen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(8);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    background->unk1C = 0x73;
    sub_8002A3C(background);
    m4aMPlayAllStop();
    if (outcome != OUTCOME_CONNECTION_SUCCESS) {
        m4aSongNumStart(MUS_VS_MISS);
    } else {
        m4aSongNumStart(MUS_VS_SUCCESS);
    }
}

static void sub_805BC40(void)
{
    Sprite *element;
    struct CommunicationOutcomeScreen *outcomeScreen = TaskGetStructPtr(gCurTask);
    element = &outcomeScreen->unkA0;
    sub_8004558(element);
    sub_80051E8(element);

    if (outcomeScreen->unk203 == OUTCOME_CONNECTION_SUCCESS) {
        const TileInfo *unk9090;
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        element = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090[0];
        offset = gLoadedSaveGame->language + 7;

        element->graphics.anim = unk9090[offset].anim;
        offset = gLoadedSaveGame->language + 7;
        element->variant = unk9090[offset].variant + unk206 - 2;
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);
    } else {
        const TileInfo *unk9090;
        element = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090[0];

        element->graphics.anim = unk9090[gLoadedSaveGame->language].anim;
        element->variant = unk9090[gLoadedSaveGame->language].variant;
        element->unk21 = 0xFF;
        sub_8004558(element);
        sub_80051E8(element);
    }

    element = &outcomeScreen->unk100;
    sub_8004558(element);
    sub_80051E8(element);

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
            gUnknown_03002260 = gMapHeaders;
            CreateTitleScreenAndSkipIntro();
        }
    }
}
