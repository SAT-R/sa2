#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "mb_programs.h"
#include "multi_boot.h"
#include "sio32_multi_load.h"
#include "game/stage/stage.h"
#include "game/multiboot/connection.h"
#include "game/multiboot/collect_rings/results.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/multiplayer/mode_select.h"
#include "game/stage/rings_scatter.h"

#include "game/stage/player_controls.h"
#include "game/save.h"
#include "game/stage/screen_fade.h"
#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/title_screen.h"
#include "game/dummy_task.h"

#include "data/collect_rings.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

#define SomeSioCheck()         ((*(vu8 *)REG_ADDR_SIOCNT) & SIO_ID)
#define MB_SUBGAME_LOADER_SIZE 0x314C

struct SinglePakConnectScreen {
    ScreenFade fade;
    Sprite unkC;
    Sprite unk3C;
    Sprite unk6C;
    Background unk9C;
    void *mbProgStart;
    u32 mbProgLength;
    u32 unkE4;
    u32 unkE8;
    u16 unkEC;
    u32 unkF0;
    u32 unkF4;
    u8 unkF8;
    u8 unkF9;
    u8 unkFA;
    u8 fillerFB;
};

#if COLLECT_RINGS_ROM
typedef struct {
    Background backgrounds[2];
} ConnectionErrorScreen; /* 0x80 */

void sub_0201299C(void);
#endif

void sub_80818B8(void);
void sub_8081DB4(struct SinglePakConnectScreen *);
void sub_8081C8C(void);
void sub_8081E90(struct SinglePakConnectScreen *);
void sub_8081D04(void);
void sub_8081D58(void);
void sub_8081604(void);
s8 sub_8081D70(struct SinglePakConnectScreen *);
void sub_8081DF0(struct SinglePakConnectScreen *, u8);

void sub_8081AD4(struct SinglePakConnectScreen *);
void sub_8081C50(void);

bool32 sub_8081E38(struct SinglePakConnectScreen *, u16);
void sub_8081CC4(void);

#ifndef COLLECT_RINGS_ROM
void *const gCollectRingsSegments[9] = {
    // collect rings rom
    (void *)gCollectRingsRom_Compressed + SIO32ML_BLOCK_SIZE * 0,
    (void *)gCollectRingsRom_Compressed + SIO32ML_BLOCK_SIZE * 1,
    (void *)gCollectRingsRom_Compressed + SIO32ML_BLOCK_SIZE * 2,

    // Tileset for level
    (void *)&gCollectRingsBgStageTileset,

    // Animations for each client

    // cream
    (void *)&gCollectRingsAnimations_Cream_Compressed,

    // tails
    (void *)&gCollectRingsAnimations_Tails_Compressed,

    // knuckles
    (void *)&gCollectRingsAnimations_Knuckles_Compressed,

    // tile maps copied directly into OBJ_VRAM0
    (void *)gCollectRingsTilemaps + (SIO32ML_BLOCK_SIZE * 1),

    // tile map pointers
    (void *)gCollectRingsTilemaps + (SIO32ML_BLOCK_SIZE * 0),
};

static const u16 gUnknown_080E018C[7][3] = {
    [LANG_DEFAULT] = { 0, 0, 0 },
    [LANG_JAPANESE] = { SA2_ANIM_MP_MSG, 0, 90 },
    [LANG_ENGLISH] = { SA2_ANIM_MP_COMM_MSG_EN, 0, 84 },
    [LANG_GERMAN] = { SA2_ANIM_MP_COMM_MSG_DE, 0, 90 },
    [LANG_FRENCH] = { SA2_ANIM_MP_COMM_MSG_FR, 0, 90 },
    [LANG_SPANISH] = { SA2_ANIM_MP_COMM_MSG_ES, 0, 90 },
    [LANG_ITALIAN] = { SA2_ANIM_MP_COMM_MSG_IT, 0, 45 },
};

// TODO/BUG: gUnknown_080E01B6 is (likely) in the wrong order!
//           But maybe this was fixed in the PAL release?
static const u16 gUnknown_080E01B6[7][3] = {
    [LANG_DEFAULT] = { 0, 0, 0 },
    [LANG_JAPANESE] = { SA2_ANIM_PRESS_START_MSG_JP, 0, 46 },
    [LANG_ENGLISH] = { SA2_ANIM_PRESS_START_MSG_EN, 0, 34 },
    [LANG_GERMAN] = { SA2_ANIM_PRESS_START_MSG_FR, 0, 38 },
    [LANG_FRENCH] = { SA2_ANIM_PRESS_START_MSG_DE, 0, 46 },
    [LANG_SPANISH] = { SA2_ANIM_PRESS_START_MSG_IT, 0, 30 },
    [LANG_ITALIAN] = { SA2_ANIM_PRESS_START_MSG_ES, 0, 30 },
};

static void *const gUnknown_080E01E0[7][2] = {
    { NULL, NULL },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
    { (void *)&gMultiBootProgram_SubgameLoader, &gMultiBootProgram_SubgameLoaderEnd },
};

static const u32 gUnknown_080E0218[7] = {
    [LANG_DEFAULT] = 0,
    [LANG_JAPANESE] = TM_MP_CHEESE_PLEASE_WAIT_JP,
    [LANG_ENGLISH] = TM_MP_CHEESE_PLEASE_WAIT_EN,
    [LANG_GERMAN] = TM_MP_CHEESE_PLEASE_WAIT_DE,
    [LANG_FRENCH] = TM_MP_CHEESE_PLEASE_WAIT_FR,
    [LANG_SPANISH] = TM_MP_CHEESE_PLEASE_WAIT_ES,
    [LANG_ITALIAN] = TM_MP_CHEESE_PLEASE_WAIT_IT,
};
#endif

#if COLLECT_RINGS_ROM
void LinkCommunicationError(void)
{
    struct Task *t;
    Background *background;
    ConnectionErrorScreen *errorScreen;

    gMultiplayerMissingHeartbeats[0] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiSioEnabled = FALSE;
    MultiSioStop();
    MultiSioInit(0);
    t = TaskCreate(sub_0201299C, sizeof(ConnectionErrorScreen), 0x1000, 0, NULL);
    errorScreen = TASK_DATA(t);
    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    gDispCnt = 0x2340;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    DmaFill32(3, 0, VRAM + ((gBgCntRegs[0] & 0xC) * 0x1000), 0x40);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 32;
    gBgCntRegs[0] = 0x1E01;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    background = &errorScreen->backgrounds[1];
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = 4;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);
    gBgCntRegs[1] = 0x1F04;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    switch (gMultiplayerLanguage) {
        case 0:
            gBgScrollRegs[1][1] = -8;
            break;
        case 1:
            gBgScrollRegs[1][1] = -56;
            break;

        case 2:
        default:
            gBgScrollRegs[1][1] = -8;
            break;
    }

    background = &errorScreen->backgrounds[0];
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(31);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = 3;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0xC;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);
    gWinRegs[4] = 3;
    gWinRegs[5] = 1;
    gWinRegs[0] = 0xF0;
    gWinRegs[2] = 0x3868;
}

void sub_0201299C(void) { return; }
#endif

void sub_8081200(void)
{
    u8 i;

    gGameMode = GAME_MODE_MULTI_PLAYER_COLLECT_RINGS;

    gRingsScatterTask = NULL;
    gDummyTask = NULL;
    gGameStageTask = NULL;
    gPlayer.spriteTask = NULL;
    gCamera.movementTask = NULL;
    gUnknown_0300543C = 0;
#ifndef COLLECT_RINGS_ROM
    gGameMode = GAME_MODE_MULTI_PLAYER_COLLECT_RINGS;
#endif
    gEntitiesManagerTask = NULL;

    for (i = 0; i < 4; i++) {
        gMultiplayerPlayerTasks[i] = NULL;
    };

    ApplyGameStageSettings();
#ifndef COLLECT_RINGS_ROM
    gStageFlags &= ~STAGE_FLAG__ACT_START;
    gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
#endif
    gPlayer.heldInput |= gPlayerControls.jump | gPlayerControls.attack;
}
#ifndef COLLECT_RINGS_ROM

void StartSinglePakConnect(void)
{
    struct Task *t;
    struct SinglePakConnectScreen *connectScreen;
    ScreenFade *fade;
    Sprite *s;
    Background *background;
    struct MultiBootParam *mbParams;
    void *ram;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_8081604, sizeof(struct SinglePakConnectScreen), 0x2000, 0, NULL);
    connectScreen = TASK_DATA(t);
    connectScreen->unkFA = gLoadedSaveGame->language;

    if ((u8)LanguageIndex(connectScreen->unkFA) > LanguageIndex(LANG_ITALIAN)) {
        connectScreen->unkFA = 1;
    }

    connectScreen->mbProgStart = gUnknown_080E01E0[connectScreen->unkFA][0];
    connectScreen->mbProgLength
        = (uintptr_t)gUnknown_080E01E0[connectScreen->unkFA][1] - (uintptr_t)gUnknown_080E01E0[connectScreen->unkFA][0];
    connectScreen->unkF0 = 0;
    connectScreen->unkF9 = 0;
    connectScreen->unkE4 = 0;
    connectScreen->unkE8 = 0;
    connectScreen->unkEC = 0;

    fade = &connectScreen->fade;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q_8_8(0);
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->speed = Q(1.0);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    ram = OBJ_VRAM0;
    s = &connectScreen->unkC;
    s->x = 8;
    s->y = 24;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    s->graphics.anim = gUnknown_080E018C[connectScreen->unkFA][0];
    s->variant = gUnknown_080E018C[connectScreen->unkFA][1];
    s->prevVariant = -1;
    s->graphics.dest = ram;
    ram += gUnknown_080E018C[connectScreen->unkFA][2] * 0x20;
    UpdateSpriteAnimation(s);

    s = &connectScreen->unk3C;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT - 38);
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    s->graphics.anim = gUnknown_080E01B6[connectScreen->unkFA][0];
    s->variant = gUnknown_080E01B6[connectScreen->unkFA][1];
    s->prevVariant = -1;
    s->graphics.dest = ram;
    ram += gUnknown_080E01B6[connectScreen->unkFA][2] * 0x20;

    s = &connectScreen->unk6C;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT * (7. / 8.));
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    s->graphics.anim = SA2_ANIM_MP_MSG;
    s->variant = SA2_ANIM_VARIANT_MP_MSG_2;
    s->prevVariant = -1;
    s->graphics.dest = ram;

    background = &connectScreen->unk9C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_WAIT_CONNECTION;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);
    m4aSongNumStart(MUS_CONNECTION_PENDING);

    if (!SomeSioCheck()) {
        gMultiSioEnabled = FALSE;
        mbParams = &gMultiBootParam;
        mbParams->masterp = connectScreen->mbProgStart;
        mbParams->server_type = 0;
        MultiBootInit(mbParams);
        gCurTask->main = sub_8081604;
    } else {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
    }
}

void sub_8081604(void)
{
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    s8 result;
    s32 multiBootFlags;
    struct MultiBootParam *params;
    UpdateScreenFade(&connectScreen->fade);
    DisplaySprite(&connectScreen->unkC);
    result = sub_8081D70(connectScreen);

    if (SomeSioCheck()) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
    }

    if (gMultiBootParam.client_bit & 0xE) {
        if (gMultiBootParam.probe_count == 0 && result > 1) {
            sub_8081DF0(connectScreen, result);
            if (gPressedKeys & START_BUTTON) {
                connectScreen->unkF0 = 1;
                gFlags |= FLAGS_8000;
                gFlags |= FLAGS_4000;
                m4aMPlayAllStop();
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                m4aSoundVSyncOff();
                DmaStop(0);
                DmaStop(1);
                DmaStop(2);
                DmaStop(3);
                MultiBootStartMaster(&gMultiBootParam, connectScreen->mbProgStart + 0xC0, connectScreen->mbProgLength - 0xC0, 4, 1);
            }
        }
    } else {
        connectScreen->unkF0 = 0;
        gFlags &= ~0x4000;
        gFlags &= ~FLAGS_8000;
        m4aSoundVSyncOn();
    }

    if (connectScreen->unkF0 == 0 && gPressedKeys & B_BUTTON) {
        m4aSongNumStop(MUS_CONNECTION_PENDING);
        m4aSongNumStart(SE_RETURN);
        TaskDestroy(gCurTask);
        CreateMultiplayerModeSelectScreen();
        return;
    }

    multiBootFlags = MultiBootMain(&gMultiBootParam);
    if (multiBootFlags == MULTIBOOT_ERROR_NO_PROBE_TARGET || multiBootFlags == MULTIBOOT_ERROR_NO_DLREADY
        || multiBootFlags == MULTIBOOT_ERROR_BOOT_FAILURE || multiBootFlags == MULTIBOOT_ERROR_HANDSHAKE_FAILURE) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        gFlags &= ~0x4000;
        gFlags &= ~FLAGS_8000;
        m4aSoundVSyncOn();
        LinkCommunicationError();
        return;
    }

    if (MultiBootCheckComplete(&gMultiBootParam)) {
        union MultiSioData *send, *recv, *recv0, *recv1, *recv2, *recv3;
        sub_8081AD4(connectScreen);
        connectScreen->unkF9 = 0;
        send = &gMultiSioSend;
        send->pat2.unk0 = 0;

        recv0 = &gMultiSioRecv[0];
        recv0->pat2.unk0 = 0;
        recv1 = &gMultiSioRecv[1];
        recv1->pat2.unk0 = 0;
        recv2 = &gMultiSioRecv[2];
        recv2->pat2.unk0 = 0;
        recv3 = &gMultiSioRecv[3];
        recv3->pat2.unk0 = 0;

        send->pat0.unk2 = 0;
        send->pat0.unk0 = 0xF001;

        recv0->pat2.unk2 = 0;
        recv1--;
        recv1++;
        recv0++;
        recv1->pat2.unk2 = 0;
        recv2->pat2.unk2 = 0;
        recv3->pat2.unk2 = 0;
        gCurTask->main = sub_8081C50;
    }
}

void sub_80818B8(void)
{
    u16 i, j;
    u32 temp;
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    if (gMultiSioStatusFlags & MULTI_SIO_LD_REQUEST && connectScreen->unkF9 < ARRAY_COUNT(gCollectRingsSegments)) {
        gCurTask->main = sub_8081D04;
    }

    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        connectScreen->unkF8 = 1;
    }

    gMultiSioSend.pat2.unk0 = connectScreen->unkFA;
    gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, &gMultiSioRecv, connectScreen->unkF8);

    if (connectScreen->unkF4 == 0) {
        MultiSioStart();
        connectScreen->unkF4 = 1;
    }

    temp = ((gMultiSioStatusFlags & (MULTI_SIO_CONNECTED_ID0 | MULTI_SIO_CONNECTED_ID1 | MULTI_SIO_CONNECTED_ID2 | MULTI_SIO_CONNECTED_ID3))
            >> 8);

    for (i = 1; i < 4; i++) {
        if (!sub_8081E38(connectScreen, i)) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            gFlags &= ~0x4000;
            gFlags &= ~FLAGS_8000;
            m4aSoundVSyncOn();
            LinkCommunicationError();
            return;
        }

        if (temp << i) {
            union MultiSioData *recv = &gMultiSioRecv[i];
            if (recv->pat0.unk0 == 0x4010) {
                for (j = 0; j < 4; j++) {
                    gMultiplayerCharacters[j] = 0;
                    gMPRingCollectWins[j] = 0;
                    gUnknown_030054B4[j] = j;
                    gMultiplayerMissingHeartbeats[j] = 0;
                }
                gCurTask->main = sub_8081D58;
                gDispCnt = 0x40;
                return;
            }
        }
    }

    if (connectScreen->unkF9 != gMultiSioRecv[0].pat0.unk2) {
        connectScreen->unkF9 = gMultiSioRecv[0].pat0.unk2;
    }
}

void sub_8081A5C(void)
{
    u32 progress = 0;
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    if (Sio32MultiLoadMain(&progress) != 0) {
        gCurTask->main = sub_8081C8C;
    }

    if (progress > connectScreen->unkE8) {
        connectScreen->unkE4 = connectScreen->unkE4 + (progress - connectScreen->unkE8);
        connectScreen->unkE8 = progress;
    } else if (progress < connectScreen->unkE8) {
        u32 temp;
        temp = ((connectScreen->unkE4 + 0x2000));
        temp -= connectScreen->unkE8;
        connectScreen->unkE4 = temp;
        connectScreen->unkE4 += progress;
        connectScreen->unkE8 = progress;
    }

    sub_8081E90(connectScreen);
}

void sub_8081AD4(struct SinglePakConnectScreen *connectScreen)
{
    Background *background;
    u16 temp;
    gDispCnt = 0x101;
    gBgCntRegs[0] = 0x1e02;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    background = &connectScreen->unk9C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = gUnknown_080E0218[connectScreen->unkFA];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    CpuFill16(0, &gBgPalette[17], 30);

    gDispCnt |= 0x2200;
    temp = 0x1f01;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gWinRegs[0] = 0x2828;
    gWinRegs[2] = 0x8890;
    gWinRegs[4] = 2;
    gWinRegs[5] = 1;
    gBgCntRegs[1] = temp;

    CpuFill16(0xF3FF, (void *)BG_SCREEN_ADDR(31), 2049);
    CpuFill16(0xFFFF, (void *)VRAM + 1023 * TILE_SIZE_4BPP, TILE_SIZE_4BPP);

    gBgPalette[255] = RGB_RED;
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}

void ShowSinglePakResults(void)
{
    u32 i;
    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        gMultiplayerCharacters[i] = 0;
        gMPRingCollectWins[i] = 0;
        gUnknown_030054B4[i] = i;
        gMultiplayerMissingHeartbeats[i] = 0;
    }

    MultiSioStart();
    CreateMultiplayerSinglePakResultsScreen(0);
}

void sub_8081C50(void)
{
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    sub_8081DB4(connectScreen);
    gCurTask->main = sub_80818B8;
    MultiSioStart();
}

void sub_8081C8C(void)
{
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    sub_8081DB4(connectScreen);
    gCurTask->main = sub_8081CC4;
}

void sub_8081CC4(void)
{
    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        if (gMultiSioStatusFlags & MULTI_SIO_LD_SUCCESS) {
            gMultiSioSend.pat0.unk2 += 1;
        }
        gCurTask->main = sub_80818B8;
    }

    sub_80818B8();
}

// Send next segment
void sub_8081D04(void)
{
    struct SinglePakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    MultiSioStop();
    gIntrTable[0] = Sio32MultiLoadIntr;
    Sio32MultiLoadInit(gMultiSioStatusFlags & MULTI_SIO_PARENT, gCollectRingsSegments[connectScreen->unkF9]);
    gCurTask->main = sub_8081A5C;
}

void sub_8081D58(void)
{
    TaskDestroy(gCurTask);
    CreateMultiplayerSinglePakResultsScreen(0);
}

s8 sub_8081D70(UNUSED struct SinglePakConnectScreen *connectScreen)
{
    u8 i;
    s8 result;

    for (result = 1, i = 1; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiBootParam.response_bit, i) && GetBit(gMultiBootParam.client_bit, i)) {
            result++;
        }
    }

    return result;
}

void sub_8081DB4(struct SinglePakConnectScreen *connectScreen)
{
#ifdef MULTI_SIO_DI_FUNC_FAST
    gIntrTable[0] = (void *)gMultiSioIntrFuncBuf;
#else
    gIntrTable[0] = MultiSioIntr;
#endif
    MultiSioInit((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    connectScreen->unkF8 = 0;
    connectScreen->unkF4 = 0;
    gMultiSioStatusFlags = 0;
}

void sub_8081DF0(struct SinglePakConnectScreen *connectScreen, u8 a)
{
    UpdateSpriteAnimation(&connectScreen->unk3C);
    DisplaySprite(&connectScreen->unk3C);

    connectScreen->unk6C.graphics.anim = SA2_ANIM_MP_MSG;
    connectScreen->unk6C.variant = a + SA2_ANIM_VARIANT_MP_MSG_OK;
    connectScreen->unk6C.prevVariant = -1;

    UpdateSpriteAnimation(&connectScreen->unk6C);
    DisplaySprite(&connectScreen->unk6C);
}

// HeartBeatClient
bool32 sub_8081E38(struct SinglePakConnectScreen *connectScreen, u16 id)
{
    if (MULTI_SIO_RECV_ID(id + 8) & gMultiSioStatusFlags) {
        if (!(MULTI_SIO_RECV_ID(id) & gMultiSioStatusFlags)) {
            if (gMultiplayerMissingHeartbeats[id]++ > 180) {
                return FALSE;
            }
        } else {
            gMultiplayerMissingHeartbeats[id] = 0;
        }
    }

    return TRUE;
}

void sub_8081E90(struct SinglePakConnectScreen *connectScreen)
{
    u8 val = (connectScreen->unkE4 * DISPLAY_HEIGHT) / 0x12000;
    gWinRegs[0] = (val + 40) | 0x2800;
}

#endif
