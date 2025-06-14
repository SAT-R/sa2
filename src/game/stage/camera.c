#include "global.h"
#include "core.h"
#include "sprite.h"
#include "animation_commands_bg.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/spot_light.h"

#include "game/stage/player_super_sonic.h"

#include "game/stage/camera.h"
#include "game/stage/stage.h"
#include "game/stage/player.h"
#include "game/stage/terrain_collision.h"

#include "constants/tilemaps.h"
#include "constants/zones.h"
#include "constants/characters.h"

#define BOSS_CAM_FRAME_DELTA_PIXELS 5

#define STGBG_SCRN_DIM(w, h, charBase, screenBase)                                                                                         \
    {                                                                                                                                      \
        ((w) / TILE_WIDTH), ((h) / TILE_WIDTH), charBase, screenBase                                                                       \
    }
#define STGBG_WIDTH(arr)      ((arr)[0])
#define STGBG_HEIGHT(arr)     ((arr)[1])
#define STGBG_CHARBASE(arr)   ((arr)[2])
#define STGBG_SCREENBASE(arr) ((arr)[3])

#define CAMBG_MAP_FRONT_LAYER 0
#define CAMBG_MAP_BACK_LAYER  1
#define CAMBG_BACK_A_LAYER    2
#define CAMBG_BACK_B_LAYER    3

#if !WIDESCREEN_HACK
#define CAM_SCREENBASE_BACK_A    28
#define CAM_SCREENBASE_BACK_B    29
#define CAM_SCREENBASE_BACK_C    26
#define CAM_SCREENBASE_MAP_FRONT 30
#define CAM_SCREENBASE_MAP_BACK  31
#else
#define CAM_SCREENBASE_BACK_A    48
#define CAM_SCREENBASE_BACK_B    50
#define CAM_SCREENBASE_BACK_C    58
#define CAM_SCREENBASE_MAP_FRONT 52
#define CAM_SCREENBASE_MAP_BACK  56
#endif

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

// Probably a array (as it's aligned 16)
struct Backgrounds ALIGNED(16) gStageBackgroundsRam = {};

#ifndef COLLECT_RINGS_ROM
UNUSED u32 unused_3005950[3] = {};
#endif

struct Camera ALIGNED(8) gCamera = {};
const Collision *gRefCollision = NULL;

void RenderMetatileLayers(s32, s32);

void Task_CallUpdateCamera(void);
void TaskDestructor_Camera(struct Task *);
void Task_CallUpdateCameraInternal(void);

// Dummy callbacks
void CreateStageBg_Default(void);
void CreateStageBg_Dummy(void);
void StageBgUpdate_Dummy(s32 x, s32 y);

// Hblank utils
void sub_801E3F0(void);
void HBlankCB_801E434(int_vcount vcount);
void HBlankCB_801E454(int_vcount vcount);
void nullsub_801E494(void);
void HBlankCB_BgUpdateZone5ActBoss(int_vcount vcount);
void HBlankCB_BgUpdateZoneFinalActXX(int_vcount vcount);

// SA2 Zone specific backgrounds
void CreateStageBg_Zone1(void);
void StageBgUpdate_Zone1Acts12(s32 a, s32 b);
void StageBgUpdate_Zone1ActBoss(s32 a, s32 b);

void CreateStageBg_Zone2(void);
void StageBgUpdate_Zone2Acts12(s32 a, s32 b);
void StageBgUpdate_Zone2ActBoss(s32 a, s32 b);

void CreateStageBg_Zone3(void);
void StageBgUpdate_Zone3Acts12(s32 a, s32 b);
void StageBgUpdate_Zone3ActBoss(s32 a, s32 b);

void CreateStageBg_Zone4(void);
void StageBgUpdate_Zone4Acts12(s32 a, s32 b);
void StageBgUpdate_Zone4ActBoss(s32 a, s32 b);

void CreateStageBg_Zone5(void);
void StageBgUpdate_Zone5Acts12(s32 a, s32 b);
void StageBgUpdate_Zone5ActBoss(s32 a, s32 b);

void CreateStageBg_Zone6_Acts(void);
void CreateStageBg_Zone6_Boss(void);
void StageBgUpdate_Zone6Acts12(s32 a, s32 b);
void StageBgUpdate_Zone6ActBoss(s32 a, s32 b);

void CreateStageBg_Zone7(void);
void StageBgUpdate_Zone7Acts12(s32, s32);
void StageBgUpdate_Zone7ActBoss(s32, s32);
void Zone7BgUpdate_Inside(s32, s32);
void Zone7BgUpdate_Outside(s32, s32);

void CreateStageBg_ZoneFinal_0(void);
void StageBgUpdate_Dummy(s32, s32);
void StageBgUpdate_ZoneFinalActXX(s32, s32);
void StageBgUpdate_ZoneFinalActTA53(s32, s32);

const Background gStageCameraBgTemplates[4] = {
    [CAMBG_MAP_FRONT_LAYER] = {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(CAM_SCREENBASE_MAP_FRONT),
        .layout = NULL,
        .xTiles = 0,
        .yTiles = 0,
        .unk18 = 0,
        .unk1A = 0,
        .tilemapId = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .targetTilesX = (DISPLAY_WIDTH / TILE_WIDTH) + 1,
        .targetTilesY = (DISPLAY_HEIGHT / TILE_WIDTH) + 1,
        .paletteOffset = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .flags = BACKGROUND_FLAG_IS_LEVEL_MAP | BACKGROUND_FLAG_20 | BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_DISABLE_TILESET_UPDATE | BACKGROUND_FLAGS_BG_ID(1),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
    [CAMBG_MAP_BACK_LAYER] = {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(CAM_SCREENBASE_MAP_BACK),
        .layout = NULL,
        .xTiles = 0,
        .yTiles = 0,
        .unk18 = 0,
        .unk1A = 0,
        .tilemapId = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .targetTilesX = (DISPLAY_WIDTH / TILE_WIDTH) + 1,
        .targetTilesY = (DISPLAY_HEIGHT / TILE_WIDTH) + 1,
        .paletteOffset = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .flags = BACKGROUND_FLAG_IS_LEVEL_MAP | BACKGROUND_FLAG_20 | BACKGROUND_FLAGS_BG_ID(2),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
    [CAMBG_BACK_A_LAYER] = {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_SCREEN_ADDR(16),  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(CAM_SCREENBASE_BACK_B),
        .layout = NULL,
        .xTiles = 0,
        .yTiles = 0,
        .unk18 = 0,
        .unk1A = 0,
        .tilemapId = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .targetTilesX = 32,
        .targetTilesY = 32,
        .paletteOffset = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .flags = BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_FLAGS_BG_ID(3),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
    [CAMBG_BACK_B_LAYER] = {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_CHAR_ADDR(3),  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(CAM_SCREENBASE_BACK_A),
        .layout = NULL,
        .xTiles = 0,
        .yTiles = 0,
        .unk18 = 0,
        .unk1A = 0,
        .tilemapId = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .targetTilesX = 32,
        .targetTilesY = 32,
        .paletteOffset = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .flags = BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_FLAGS_BG_ID(0),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
};

#ifndef COLLECT_RINGS_ROM

const u16 gBossCameraYClamps[][2] = {
    [ZONE_1] = { 32, DISPLAY_HEIGHT + 56 },  [ZONE_2] = { 32, DISPLAY_HEIGHT + 44 },      [ZONE_3] = { 32, DISPLAY_HEIGHT + 56 },
    [ZONE_4] = { 32, DISPLAY_HEIGHT + 48 },  [ZONE_5] = { 32, DISPLAY_HEIGHT + 48 },      [ZONE_6] = { 32, DISPLAY_HEIGHT + 72 },
    [ZONE_7] = { 32, DISPLAY_HEIGHT + 104 }, [ZONE_FINAL] = { 32, DISPLAY_HEIGHT + 104 }, [ZONE_FINAL + 1] = { 32, DISPLAY_HEIGHT + 104 },
};
#endif

static const VoidFn sStageBgInitProcedures[NUM_LEVEL_IDS] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = CreateStageBg_Zone1,
#ifndef COLLECT_RINGS_ROM
    [LEVEL_INDEX(ZONE_1, ACT_2)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = NULL, // Anti-Formatting
    [LEVEL_INDEX(ZONE_2, ACT_1)] = CreateStageBg_Default,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = CreateStageBg_Default,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = CreateStageBg_Default,
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_3, ACT_1)] = CreateStageBg_Zone3,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = CreateStageBg_Zone3,
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = CreateStageBg_Zone3,
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_4, ACT_1)] = CreateStageBg_Zone4,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = CreateStageBg_Zone4,
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = CreateStageBg_Dummy,
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_5, ACT_1)] = CreateStageBg_Zone5,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = CreateStageBg_Zone5,
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = NULL,
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_6, ACT_1)] = CreateStageBg_Zone6_Acts,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = CreateStageBg_Zone6_Acts,
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = CreateStageBg_Zone6_Boss,
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_7, ACT_1)] = CreateStageBg_Zone7,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = CreateStageBg_Zone7,
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = CreateStageBg_Zone7,
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = NULL, // This doesn't make sense...
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = CreateStageBg_ZoneFinal_0,
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = NULL, //
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = NULL,
#endif
};

static const BgUpdate sStageBgUpdateFuncs[NUM_LEVEL_IDS] = {
#if COLLECT_RINGS_ROM
    [LEVEL_INDEX(ZONE_1, ACT_1)] = StageBgUpdate_Dummy,
#else
    // Zone 1
    [LEVEL_INDEX(ZONE_1, ACT_1)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = StageBgUpdate_Zone1ActBoss,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 2
    [LEVEL_INDEX(ZONE_2, ACT_1)] = StageBgUpdate_Zone2Acts12,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = StageBgUpdate_Zone2Acts12,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = StageBgUpdate_Zone2ActBoss,
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 3
    [LEVEL_INDEX(ZONE_3, ACT_1)] = StageBgUpdate_Zone3Acts12,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = StageBgUpdate_Zone3Acts12,
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = StageBgUpdate_Zone3ActBoss,
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 4
    [LEVEL_INDEX(ZONE_4, ACT_1)] = StageBgUpdate_Zone4Acts12,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = StageBgUpdate_Zone4Acts12,
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = StageBgUpdate_Dummy,
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 5
    [LEVEL_INDEX(ZONE_5, ACT_1)] = StageBgUpdate_Zone5Acts12,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = StageBgUpdate_Zone5Acts12,
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = StageBgUpdate_Zone5ActBoss,
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 6
    [LEVEL_INDEX(ZONE_6, ACT_1)] = StageBgUpdate_Zone6Acts12,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = StageBgUpdate_Zone6Acts12,
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = StageBgUpdate_Zone6ActBoss,
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone 7
    [LEVEL_INDEX(ZONE_7, ACT_1)] = StageBgUpdate_Zone7Acts12,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = StageBgUpdate_Zone7Acts12,
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = StageBgUpdate_Zone7ActBoss,
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = StageBgUpdate_Dummy,

    // Zone Final
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = StageBgUpdate_ZoneFinalActXX,
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = StageBgUpdate_ZoneFinalActTA53,
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = StageBgUpdate_Zone2Acts12,

    // Zone Unused
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = StageBgUpdate_Zone6Acts12,
#endif
};

static const s8 sStageBgDimensions[NUM_LEVEL_IDS][4] = {

    [LEVEL_INDEX(ZONE_1, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
#ifndef COLLECT_RINGS_ROM
    [LEVEL_INDEX(ZONE_1, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_2, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_2, ACT_2)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_3, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_3, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_4, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_4, ACT_2)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_5, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_5, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_6, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_6, ACT_2)] = STGBG_SCRN_DIM(512, 256, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_7, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_7, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = STGBG_SCRN_DIM(512, 256, 2, CAM_SCREENBASE_BACK_A),
#endif
};

void InitCamera(u32 level)
{
    u32 txtSize;

    struct Backgrounds *bgs;
    const Background *bgTemplates;
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    const s8 *bgDim = sStageBgDimensions[level];

    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_1D_MAP);
#ifndef COLLECT_RINGS_ROM
    if (level == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gDispCnt
            = (DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    }
#endif

#if !WIDESCREEN_HACK
    gBgCntRegs[1] = BGCNT_TXT256x256 | (BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(CAM_SCREENBASE_MAP_FRONT) | BGCNT_16COLOR | BGCNT_CHARBASE(0));
    gBgCntRegs[2] = BGCNT_TXT256x256 | (BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(CAM_SCREENBASE_MAP_BACK) | BGCNT_16COLOR | BGCNT_CHARBASE(0));
#else
    gBgCntRegs[1] = BGCNT_TXT512x512 | (BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(CAM_SCREENBASE_MAP_FRONT) | BGCNT_16COLOR | BGCNT_CHARBASE(0));
    gBgCntRegs[2] = BGCNT_TXT512x512 | (BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(CAM_SCREENBASE_MAP_BACK) | BGCNT_16COLOR | BGCNT_CHARBASE(0));
#endif
    txtSize = ((STGBG_WIDTH(bgDim) + 0x1F) >> 6 | ((STGBG_HEIGHT(bgDim) + 0x1F) >> 6) << 1) << 0xE;
    gBgCntRegs[3] = txtSize | BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(STGBG_SCREENBASE(bgDim)) | BGCNT_CHARBASE(STGBG_CHARBASE(bgDim));

#ifndef COLLECT_RINGS_ROM
    if (IS_EXTRA_STAGE(level)) {
        gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    }
#endif

    bgs = &gStageBackgroundsRam;
    bgTemplates = gStageCameraBgTemplates;

    memcpy(&gStageBackgroundsRam.unk40, &bgTemplates[0], sizeof(Background));
    bgs->unk40.tilemapId = TM_LEVEL_METATILES_0(level);

    memcpy(&gStageBackgroundsRam.unk80, &bgTemplates[1], sizeof(Background));
    bgs->unk80.tilemapId = TM_LEVEL_METATILES_1(level);

    memcpy(&gStageBackgroundsRam.unkC0, &bgTemplates[2], sizeof(Background));
    bgs->unkC0.tilemapId = TM_LEVEL_BG(level);

    bgs->unkC0.graphics.dest = (void *)BG_CHAR_ADDR(STGBG_CHARBASE(bgDim));
    bgs->unkC0.layoutVram = (void *)BG_SCREEN_ADDR(STGBG_SCREENBASE(bgDim));
    bgs->unkC0.targetTilesX = STGBG_WIDTH(bgDim);
    bgs->unkC0.targetTilesY = STGBG_HEIGHT(bgDim);

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 0x20;

#ifndef COLLECT_RINGS_ROM
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
#endif
    {
        bgs->unk40.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_DISABLE_TILESET_UPDATE;
        bgs->unk80.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_DISABLE_TILESET_UPDATE;
    }

#ifndef COLLECT_RINGS_ROM
    if (level != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        DrawBackground(&bgs->unk40);
        DrawBackground(&bgs->unk80);
        DrawBackground(&bgs->unkC0);
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gRefCollision = gCollisionTable[level];
    } else
#endif
    {
        gRefCollision = *(Collision **)(EWRAM_START + 0x33004);
    }

    camera->minY = 0;
    camera->maxY = gRefCollision->pxHeight;
    camera->minX = 0;
    camera->maxX = gRefCollision->pxWidth;
#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            SuperSonicGetPos(&player->qWorldX, &player->qWorldY);
            gBossCameraClampYLower = gBossCameraYClamps[ZONE_FINAL + 1][0];
            gBossCameraClampYUpper = gBossCameraYClamps[ZONE_FINAL + 1][1];
            camera->x = 600;
            camera->unk10 = (DISPLAY_WIDTH / 2);
            camera->unk14 = 0;
            camera->y = 0;
            camera->unk64 = -4;
        } else {
            camera->x = I(player->qWorldX);
            // TODO: Handle boss camera restrictions for large screen sizes
            // for now we use the original GBA values as otherwise the boss
            // goes off the screen (not sure why yet)
            camera->unk10 = I(player->qWorldX) - (2 * 240);
            camera->y = I(player->qWorldY) - ((DISPLAY_HEIGHT / 2) + 4);
            camera->unk14 = camera->y;
            camera->unk64 = player->spriteOffsetY - 4;
        }
    } else
#endif
    {
        camera->x = I(player->qWorldX) - (DISPLAY_WIDTH / 2);
        camera->y = I(player->qWorldY) - ((DISPLAY_HEIGHT / 2) + 4);

        if (camera->x < 0) {
            camera->x = 0;
        }

        if (camera->y < 0) {
            camera->y = 0;
        }

        camera->unk10 = camera->x;
        camera->unk14 = camera->y;
        camera->unk64 = player->spriteOffsetY - 4;
    }

    camera->unk8 = 0x1000;
    camera->unkC = 0xc;
    camera->unk56 = 0;
    camera->shiftX = 0;
    camera->shiftY = 0;
    camera->unk20 = 0;
    camera->unk24 = 0;
    camera->unk40 = 0;
    camera->unk44 = 8;
    camera->unk48 = 0;
    camera->unk4C = 0;
    camera->unk50 = 0;
    camera->unk52 = 0;
    camera->unk54 = 0;
    camera->shakeOffsetX = 0;
    camera->shakeOffsetY = 0;

    camera->movementTask = TaskCreate(Task_CallUpdateCamera, 0, 0xF00, 0, TaskDestructor_Camera);

    camera->fnBgUpdate = sStageBgUpdateFuncs[level];

    if (sStageBgInitProcedures[level] != NULL) {
        sStageBgInitProcedures[level]();
    }
}

// Only need to use the original value for these zones
#define DISPLAY_WIDTH_FOR_BOSS_TAS                                                                                                         \
    ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_2 || LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) ? (240 / 2) : (DISPLAY_WIDTH / 2))

void UpdateCamera(void)
{
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    s32 newX, newY;
    newX = camera->x;
    newY = camera->y;
    camera->dx = camera->x;
    camera->dy = camera->y;

    newX = CLAMP(newX, camera->minX, camera->maxX - (DISPLAY_WIDTH + 1));
    newY = CLAMP(newY, camera->minY, camera->maxY - (DISPLAY_HEIGHT + 1));

#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 delta, playerY;
        if (!IS_ALIVE(player)) {
            if (camera->fnBgUpdate != NULL) {
                camera->fnBgUpdate(gCamera.x, gCamera.y);
            }
            return;
        }

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            SuperSonicGetPos(&player->qWorldX, &player->qWorldY);
        }

        camera->unk10 += BOSS_CAM_FRAME_DELTA_PIXELS;
        newX += BOSS_CAM_FRAME_DELTA_PIXELS;

// Most TASes were written with the expection that
// the player gets pushed forwards when touching the boss
// and the camera is moving (due to a physics bug).
// So we need to emulate that behaviour on some specific
// levels
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
        if (newX + (DISPLAY_WIDTH_FOR_BOSS_TAS + 1) < I(player->qWorldX)) {
#else
        if (newX + ((DISPLAY_WIDTH / 2) + 1) < I(player->qWorldX)) {
#endif
            if ((camera->unk10 + (DISPLAY_HEIGHT / 2)) > newX) {
                s32 playerScreenX = I(player->qWorldX);
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
                playerScreenX -= DISPLAY_WIDTH_FOR_BOSS_TAS;
#else
                playerScreenX -= DISPLAY_WIDTH / 2;
#endif
                camera->shiftX = playerScreenX - newX;
            } else {
                newX = (camera->unk10 + (DISPLAY_HEIGHT / 2));
                camera->shiftX = 0;
            }
        } else {
            camera->shiftX = 0;
            if ((newX + 96) > I(player->qWorldX)) {
                newX = I(player->qWorldX);
                newX -= 96;
                if (newX < camera->unk10) {
                    newX = camera->unk10;
                }
            }
        }

        playerY = I(player->qWorldY);
        delta = playerY - newY;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            if (delta <= 48) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else if (delta >= (gBossCameraClampYUpper - 208)) {
                s32 temp = newY - 112;
                newY = delta + temp;
                camera->shiftY = 0;
            }
        } else {
            if (delta <= 48) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else {
                newY += 2;
            }
        }
        newY = CLAMP(newY, gBossCameraClampYLower, gBossCameraClampYUpper - DISPLAY_HEIGHT);

        newX = newX + camera->shiftX;
        newY = newY + camera->shiftY;
        newX += camera->shakeOffsetX;
        newY += camera->shakeOffsetY;

    } else
#endif
    {
        if (camera->unk40 != 0) {
            camera->unk40--;
        } else {
            if (!(camera->unk50 & 1)) {
                s16 airSpeedX = player->qSpeedAirX;
                camera->unk10 = I(player->qWorldX) + camera->shiftX - (DISPLAY_WIDTH / 2);
                camera->unk56 = (airSpeedX + (camera->unk56 * 15)) >> 4;
                camera->unk10 += (camera->unk56 >> 5);
            }
            if (!(camera->unk50 & 2)) {
                s32 unk64 = camera->unk64;
                s32 temp8 = player->spriteOffsetY - 4;
                if (GRAVITY_IS_INVERTED) {
                    temp8 = -temp8;
                }

                if (unk64 != temp8) {
                    if (unk64 < temp8) {
                        unk64 += 5;
                        if (unk64 > temp8) {
                            unk64 = temp8;
                        }
                    } else {
                        unk64 -= 5;
                        if (unk64 < temp8) {
                            unk64 = temp8;
                        }
                    }
                    camera->unk64 = unk64;
                }

                camera->unk14 = I(player->qWorldY) + camera->shiftY - (DISPLAY_HEIGHT / 2) + camera->unk4C + unk64;
            }
        }

        if ((camera->unk10 - newX) > camera->unk44) {
            s32 temp = camera->unk10 - newX - camera->unk44;
            s32 temp2 = I(camera->unk8);
            if (temp2 > temp) {
                temp2 = temp;
            }
            newX += temp2;
        } else if ((camera->unk10 - newX) < -camera->unk44) {
            s32 temp = (camera->unk10 - newX) + camera->unk44;
            s32 temp2 = -I(camera->unk8);
            if (temp2 < temp) {
                temp2 = temp;
            }

            newX += temp2;
        }

        newX = CLAMP(newX, camera->minX, camera->maxX - DISPLAY_WIDTH);

        if (camera->unk8 < Q(16)) {
            camera->unk8 += Q(0.125);
        }

        if ((player->moveState & MOVESTATE_IN_AIR) && (player->character != CHARACTER_KNUCKLES || player->unk61 != 9)) {
            camera->unk48 += 4;
            camera->unk48 = MIN(camera->unk48, 24);
        } else {
            camera->unk48 -= 4;
            camera->unk48 = MAX(camera->unk48, 0);
        }

        if ((camera->unk14 - newY) > camera->unk48) {
            newY += (camera->unkC > ((camera->unk14 - newY) - camera->unk48)) ? ((camera->unk14 - newY) - camera->unk48) : camera->unkC;
        } else if ((camera->unk14 - newY) < -(camera->unk48)) {
            newY += (-camera->unkC < (camera->unk14 - newY) + camera->unk48) ? (camera->unk14 - newY) + camera->unk48 : -camera->unkC;
        }

        newY = CLAMP(newY, camera->minY, camera->maxY - DISPLAY_HEIGHT);

        // maybe a macro, these values are already clamped
        newX = CLAMP(newX, camera->minX, camera->maxX - DISPLAY_WIDTH);
        newY = CLAMP(newY, camera->minY, camera->maxY - DISPLAY_HEIGHT);
        newX = newX + camera->shakeOffsetX;
        newY = newY + camera->shakeOffsetY;
    }

    camera->x = newX;
    camera->y = newY;

    camera->dx -= newX;
    camera->dy -= newY;

    RenderMetatileLayers(newX, newY);

    if (camera->fnBgUpdate != NULL) {
        camera->fnBgUpdate(newX, newY);
    }
}

void RenderMetatileLayers(s32 x, s32 y)
{
#ifndef COLLECT_RINGS_ROM
    if (!IS_EXTRA_STAGE(gCurrentLevel))
#endif
    {
        Background *layer = &gStageBackgroundsRam.unk40;
        gBgScrollRegs[1][0] = x % 8u;
        gBgScrollRegs[1][1] = y % 8u;
        layer->scrollX = x;
        layer->scrollY = y;
        DrawBackground(layer);
        UpdateBgAnimationTiles(layer);

        layer = &gStageBackgroundsRam.unk80;
        gBgScrollRegs[2][0] = x % 8u;
        gBgScrollRegs[2][1] = y % 8u;
        layer->scrollX = x;
        layer->scrollY = y;
        DrawBackground(layer);
    }
}

/************************************ ZONE 1 ************************************/

void CreateStageBg_Zone1(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], sizeof(Background));

        background->tilemapId = TM_STAGE_1_BG_0_COPY;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 0x20;
        background->targetTilesY = 0x20;
    } else
#endif
    {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], sizeof(Background));
        background->tilemapId = TM_LEVEL_BG(LEVEL_INDEX(ZONE_1, ACT_1));

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 0x20;
        background->targetTilesY = 0x1E;
    }

    DrawBackground(background);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

#ifndef COLLECT_RINGS_ROM

void StageBgUpdate_Zone1Acts12(s32 UNUSED a, s32 UNUSED b)
{
    s32 i;
    s32 initial1, initial2;
    s16 camY;
    u16 bgScroll;
    u16 *cursor;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 7 : 0xF;

            val = gBgScrollRegs[0][0];
            if ((gStageTime & temp) == temp) {
                val++;
            }
            gBgScrollRegs[0][0] = val;
            gBgScrollRegs[0][0] &= 0xFF;
        } else {
            gBgScrollRegs[0][0] = gCamera.x >> 6;
            gBgScrollRegs[0][0] &= 0xFF;
        }

        gBgScrollRegs[0][1] = gCamera.y >> 9;
        gFlags |= 4;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 4;
        cursor = gBgOffsetsHBlank;
        initial1 = 0;

        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 0xF : 0x1F;

            val = gBgScrollRegs[3][0];
            if ((gStageTime & temp) == temp) {
                val++;
            }
            gBgScrollRegs[3][0] = val;
            gBgScrollRegs[3][0] &= 0xFF;
            bgScroll = gBgScrollRegs[3][0];
        } else {
            bgScroll = gCamera.x >> 7;
            gBgScrollRegs[3][0] = bgScroll;
        }

        camY = gCamera.y >> 8;
        initial2 = 0;

#ifdef BUG_FIX
        if (cursor != NULL)
#endif
        {
            for (i = 71; i >= 0; i--) {
                *cursor++ = initial1;
                *cursor++ = initial2;
            }

            for (i = 86; i >= 0; i--) {
                *cursor++ = bgScroll;
                *cursor++ = camY;
            }
        }
    }
}

/************************************ ZONE 2 ************************************/

// (88.05%) https://decomp.me/scratch/ekyaq
// (91.40%) https://decomp.me/scratch/vapLV
// (94.83%) https://decomp.me/scratch/Naixp (more accurate)
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone2Acts12.inc", void StageBgUpdate_Zone2Acts12(s32 cameraX, s32 cameraY))
{
    s16 something;
    u8 i, j;
    s16 camFracY, camFracX;

    u16 *cursor;
    s32 x0 = 0;
    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= 7) {
        if (gBgScrollRegs[3][0] == 0) {
            gBgScrollRegs[3][0] = cameraX;
        }
        gBgScrollRegs[3][0] += (gPlayer.qSpeedGround >> 8);
        cameraX = gBgScrollRegs[3][0];
    }

    if (!IS_SINGLE_PLAYER) {
        gBgScrollRegs[3][0] = cameraX >> 4;
        camFracY = Div(cameraY, 0x10);
        if (camFracY > 0x100) {
            camFracY = 0x100;
        }
        gBgScrollRegs[3][1] = camFracY;
    } else {
        s32 unk5590_1;

        camFracY = Div(cameraY, 0x10);
        if (camFracY > 0x100) {
            camFracY = 0x100;
        }

        camFracX = Div(cameraX, 0x69);
        if (camFracX > 0x100) {
            camFracX = 0x100;
        }

        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 4;

        cursor = gBgOffsetsHBlank;
        unk5590_1 = gStageTime * 0x18;

        // Sky and Clouds
        for (i = 0; i < DISPLAY_HEIGHT - 1; i++) {
            if ((u32)((camFracY + i) - 111) < 10) {
                camFracX = ((((camFracY + i) - 110) * cameraX) >> 5) & 0xFF;
            } else {
                camFracX = (camFracY + i) > 120 ? ((cameraX * 10) >> 5) & 0xFF : camFracX;
            }
            *cursor++ = camFracX;
            *cursor++ = camFracY;
            if ((camFracY + i) + (SIN(((i * 8) + (camFracY << 3)) & ONE_CYCLE) >> 12) >= 178) {
                break;
            }
        }

        // Red Bottom
        something = (cameraX >> 3);
        for (j = 0; i < DISPLAY_HEIGHT - 1; i++, j++) {
            x0 = CLAMP_SIN_PERIOD(x0 + 8);
            *cursor++ = something + (SIN(x0) >> 13) + (COS(CLAMP_SIN_PERIOD((gStageTime * 2) + x0)) >> 11)
                + (SIN(CLAMP_SIN_PERIOD(unk5590_1 + (i * 0x40))) >> 13);
            *cursor++ = (j / 2) + camFracY + (SIN(x0) >> 12) + (COS((gStageTime + (i * 8)) & ONE_CYCLE) >> 10);
        };
    }
}
END_NONMATCH

// TODO: make this static!
extern const u8 gUnknown_080D5B20[16][3];

const u8 gUnknown_080D5B20[16][3] = {
    { 14, 0, 1 }, //
    { 22, 0, 3 }, //
    { 30, 0, 2 }, //
    { 38, 0, 1 }, //
    { 46, 0, 3 }, //
    { 62, 0, 1 }, //
    { 70, 0, 2 }, //
    { 86, 0, 1 }, //
    { 94, 0, 2 }, //
    { 126, 0, 1 }, //
    { 168, 1, 1 }, //
    { 174, 1, 2 }, //
    { 182, 2, 3 }, //
    { 198, 3, 4 }, //
    { 222, 4, 5 }, //
    { 255, 5, 6 }, //
};

// TODO: This data is unused in this module
//       But the place that references this is
//       further down in code than the .rodata after this.
const u8 gUnknown_080D5B50[DISPLAY_HEIGHT] = { // 0-105
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 10, //
                                               10, 10, 8, //
                                               8, 8, 8, //
                                               7, 7, 7, //
                                               7, 6, 6, //

                                               // 106-159 | This data appears to be unused
                                               6, 6, 6, //
                                               6, 6, 6, //
                                               5, 5, 5, //
                                               5, 5, 5, //
                                               5, 5, 4, //
                                               4, 4, 4, //
                                               4, 4, 4, //
                                               4, 3, 3, //
                                               3, 3, 3, //
                                               3, 3, 3, //
                                               3, 3, 3, //
                                               3, 3, 3, //
                                               3, 3, 2, //
                                               2, 2, 2, //
                                               2, 2, 2, //
                                               2, 2, 2, //
                                               2, 2, 2, //
                                               2, 2, 2, //

                                               // Maybe padding?
                                               0
};

/************************************ ZONE 3 ************************************/

static s16 sUnknown_03000408;

void CreateStageBg_Zone3(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

    *background = gStageCameraBgTemplates[3];

    background->tilemapId = TM_MUSIC_PLANT_MOVING_STARS;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(27);
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    DrawBackground(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

// (85.02%) https://decomp.me/scratch/Esyzr
#if 01
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone3Acts12.inc", void StageBgUpdate_Zone3Acts12(s32 a, s32 b))
#else
void StageBgUpdate_Zone3Acts12(s32 a, s32 b)
#endif
{
    s16 r6;
    u8 i;
    u8 sp40;
    Vec2_16 sp[16];
    Vec2_16 *cursorStack;
    u8 *cursor;
    s32 pFlags;
#ifndef NON_MATCHING
    register s16 sl asm("sl") = 0;
    register u16 *bgBuffer asm("r5") = gBgOffsetsHBlank;
    register s16 r3 asm("r3") = (Div(b, 60) << 16) >> 16;
#else
    s16 sl = 0;
    u16 *bgBuffer = gBgOffsetsHBlank;
    s16 r3 = (Div(b, 60) << 16) >> 16;
#endif

    gBgScrollRegs[0][1] = r3;
    gBgScrollRegs[3][1] = r3;

    if (IS_SINGLE_PLAYER) {
        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            if (sUnknown_03000408 == 0) {
                sUnknown_03000408 = a;
            }
            sUnknown_03000408 += I(gPlayer.qSpeedGround);
            a = sUnknown_03000408;
        } else {
            sUnknown_03000408 = 0;
        }
        // _0801CC72
        i = 0;

        {
            s32 r6 = r3;
            cursor = (u8 *)gUnknown_080D5B20;
            sp40 = r3;

            while (r6 >= cursor[i * 3]) {
                if (++i >= ARRAY_COUNT(gUnknown_080D5B20)) {
                    break;
                }
                {
                    sl = i;
                }
            }
        }
        //_0801CCA8:

        for (i = 0; i < ARRAY_COUNT(gUnknown_080D5B20); i++) {
            sp[i].x = (((gUnknown_080D5B20[i][1] * a) >> 5) & 0xFF);
            sp[i].y = (((gUnknown_080D5B20[i][2] * a) >> 5) & 0xFF);
        }
        // __0801CCF0

        cursorStack = &sp[sl];
        cursor = (u8 *)gUnknown_080D5B20[sl];
        for (i = 0; (u8)i < DISPLAY_HEIGHT - 1; sp40++, i++) {
            *bgBuffer = cursorStack->y;
            bgBuffer++;

            *bgBuffer = cursorStack->x;
            bgBuffer++;

            if (sp40 >= *cursor) {
                cursor += 3;
                cursorStack++;
            }
        }

        // __0801CD2C
        gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E454;
        gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
    }
}
#if 01
END_NONMATCH
#endif

/************************************ ZONE 4 ************************************/

static s16 sCameraShiftX;

void CreateStageBg_Zone4(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    const Background *templates;
    gBgCntRegs[0] = 0x1B0F;

    *background = gStageCameraBgTemplates[CAMBG_BACK_B_LAYER];

    background->tilemapId = TM_SPOTLIGHT_SNOW;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(27);
    background->targetTilesX = 32;
    background->targetTilesY = 32;
    background->flags = BACKGROUND_DISABLE_PALETTE_UPDATE | BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    if (IS_SINGLE_PLAYER) {
#if !TEMP_FIX
        // Calling this will lead to crashes
        CreateSpotLightBeams();
#endif
    }
}

void StageBgUpdate_Zone4Acts12(s32 camX, s32 camY)
{
    Player *player = &gPlayer;

    if ((player->moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
        if (sCameraShiftX == 0) {
            sCameraShiftX = camX;
        }
        sCameraShiftX += I(player->qSpeedGround);
        camX = sCameraShiftX;
    } else {
        sCameraShiftX = 0;
    }

    if (IS_SINGLE_PLAYER && !(gStageFlags & STAGE_FLAG__100)) {
        gWinRegs[WINREG_WINOUT] = 0x3e;
        gWinRegs[WINREG_WININ] = 0x3f3f;
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gBldRegs.bldY = 7;
        gBldRegs.bldCnt = 0x3f41;
        gBldRegs.bldAlpha = 0xc0c;
    }

    DrawBackground(&gStageBackgroundsRam.unk0);
    UpdateBgAnimationTiles(&gStageBackgroundsRam.unk0);

    if ((gStageTime % 16u) == 0) {
        gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 1) & 0xff;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xff;
    }
    gBgScrollRegs[3][0] = camX >> 4;
    gBgScrollRegs[3][1] = camY >> 6;
}

/************************************ ZONE 5 ************************************/

#define SCREENBASE_SKY_CANYON_CLOUDS 27

void CreateStageBg_Zone5(void)
{
    Background *background = &gStageBackgroundsRam.unk0;

    if (IS_SINGLE_PLAYER) {
        gDispCnt |= DISPCNT_BG0_ON;
        gBgCntRegs[0] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(SCREENBASE_SKY_CANYON_CLOUDS) | BGCNT_CHARBASE(3));
        *background = gStageCameraBgTemplates[3];
        background->tilemapId = TM_SKY_CANYON_CLOUDS_FOREGROUND;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(SCREENBASE_SKY_CANYON_CLOUDS);
        background->targetTilesX = (256 / TILE_WIDTH);
        background->targetTilesY = (256 / TILE_WIDTH);
        DrawBackground(background);
    }

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 160 - DISPLAY_HEIGHT;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

#define BG_CLOUD_START_Y 96

void StageBgUpdate_Zone5Acts12(s32 UNUSED a, s32 UNUSED b)
{
    s32 num;
    u16 *cursor, i, val;
    gBgScrollRegs[0][0]++;
    gBgScrollRegs[3][0] = 0;
    num = gStageTime * 2;

    if (IS_SINGLE_PLAYER) {
        gFlags = gFlags | FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 2;
        cursor = gBgOffsetsHBlank;

        if (gCurrentLevel != LEVEL_INDEX(ZONE_5, ACT_BOSS)) {
            gDispCnt |= DISPCNT_BG0_ON;
            gDispCnt |= DISPCNT_WIN0_ON;
            gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
            gWinRegs[WINREG_WININ] = (WININ_WIN0_ALL | WININ_WIN1_ALL);
            gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
            gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
            gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gBldRegs.bldY = 7;
            gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
            gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 16);
        }

        // Move the parallax clouds

        for (i = 0; i < BG_CLOUD_START_Y; i++) {
            *cursor++ = 0;
        }

        val = Div(num, 8);
        for (; i < BG_CLOUD_START_Y + 4; i++) {
            *cursor++ = val;
        }

        val = Div(num, 7);
        for (; i < BG_CLOUD_START_Y + 8; i++) {
            *cursor++ = val;
        }

        val = Div(num, 6);
        for (; i < BG_CLOUD_START_Y + 16; i++) {
            *cursor++ = val;
        }

        val = Div(num, 5);
        for (; i < BG_CLOUD_START_Y + 24; i++) {
            *cursor++ = val;
        }

        val = Div(num, 4);
        for (; i < BG_CLOUD_START_Y + 32; i++) {
            *cursor++ = val;
        }

        val = Div(num, 3);
        for (; i < BG_CLOUD_START_Y + 48; i++) {
            *cursor++ = val;
        }

        val = Div(num, 2);
        for (; i < BG_CLOUD_START_Y + 63; i++) {
            *cursor++ = val;
        }
    }
}

/************************************ ZONE 6 ************************************/

const s16 gUnknown_080D5BF0[] = {
    Q_8_8(0.00), Q_8_8(0.25), Q_8_8(2.25), Q_8_8(2.50), Q_8_8(3.50), Q_8_8(3.625), Q_8_8(5.625), Q_8_8(5.75), Q_8_8(6.75),
};

// TODO: Make static and Rename to sBlendColors
const u8 gUnknown_080D5C02[2][16][3] = {
    {
        //   r,    g,    b
        { 0x1F, 0x00, 0x1F },
        { 0x01, 0x07, 0x14 },
        { 0x01, 0x09, 0x14 },
        { 0x00, 0x0A, 0x13 },
        { 0x00, 0x0C, 0x13 },
        { 0x00, 0x0D, 0x12 },
        { 0x00, 0x0F, 0x12 },
        { 0x00, 0x10, 0x11 },
        { 0x00, 0x12, 0x10 },
        { 0x00, 0x13, 0x10 },
        { 0x00, 0x15, 0x0F },
        { 0x00, 0x16, 0x0F },
        { 0x00, 0x18, 0x0E },
        { 0x00, 0x19, 0x0E },
        { 0x00, 0x1B, 0x0D },
        { 0x1F, 0x07, 0x00 },
    },
    {
        //   r,    g,    b
        { 0x1F, 0x00, 0x00 },
        { 0x0F, 0x00, 0x1B },
        { 0x0E, 0x00, 0x19 },
        { 0x0D, 0x01, 0x17 },
        { 0x0C, 0x01, 0x15 },
        { 0x0B, 0x02, 0x13 },
        { 0x0A, 0x02, 0x11 },
        { 0x08, 0x03, 0x0F },
        { 0x07, 0x03, 0x0D },
        { 0x06, 0x04, 0x0B },
        { 0x05, 0x04, 0x09 },
        { 0x04, 0x05, 0x07 },
        { 0x03, 0x05, 0x05 },
        { 0x02, 0x06, 0x03 },
        { 0x01, 0x06, 0x01 },
        { 0x00, 0x07, 0x00 },
    },
};

void CreateStageBg_Zone6_Acts(void)
{
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), sizeof(Background));
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gStageTime = 0x380;

    if (IS_MULTI_PLAYER) {
        CreateStageBg_Zone6_Boss();
    }
    gBgCntRegs[3] &= ~(1 | 2);
    gBgCntRegs[3] |= 2;
}

void CreateStageBg_Zone6_Boss(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), sizeof(Background));
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    *background = gStageCameraBgTemplates[3];
    background->tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(26);
    background->targetTilesX = 32;
    background->targetTilesY = 32;

    DrawBackground(background);
}

// (82.58%) https://decomp.me/scratch/tB3Bs
// (85.82%) https://decomp.me/scratch/pNyvP
NONMATCH("asm/non_matching/game/stage/background/sub_801D24C.inc", void sub_801D24C(u8 p0, s16 p1, u8 p2))
{
    s16 r6;
    u16 *hOffsets;
    s32 stageTime;
    s32 stageTime2;
    s16 i;
    s16 r4;
    s32 sl;
    s32 p1_2;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 4;

    gWinRegs[WINREG_WINOUT] = WINOUT_WIN01_ALL;
    gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_BG0);
    gBldRegs.bldAlpha = BLDALPHA_BLEND(16, 8);
    gBldRegs.bldY = 16 * 10;

    hOffsets = gBgOffsetsHBlank;

    stageTime = (gStageTime & 0x3FF);
    stageTime2 = ((gStageTime >> 1) & 0x3FF);

    // p1 *= 2.5

    p1_2 = p1;
    r6 = (DISPLAY_HEIGHT - 1) - ((p1_2 * 2) + (p1_2 >> 1));

    if (r6 > (DISPLAY_HEIGHT - 1)) {
        r6 = (DISPLAY_HEIGHT - 1);
    }

    if (p2 != 0) {
        s16 r2;
        // _0801D2CA
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1_2 >> 4)));

        for (r4 = 0; r4 < r6; r4++) {
            *hOffsets++ = 0;
            *hOffsets++ = (-15 - r4) & 0xFF;
        }
        // _0801D312

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            // _0801D31C
            s32 sin = SIN_24_8(CLAMP_SIN_PERIOD(r4 * 16 + stageTime2 + stageTime)) >> 1;
            sin++;
            sin = (sin)-r4 * 2;
            *hOffsets++ = sin & 0xFF;

            if ((r4 - 15) < r6) {
                s32 r0 = (1 - r4);
                r0 -= (((r4 - r6) - 15) * 8);
                *hOffsets++ = r0 & 0xFE;
            } else {
                // _0801D3A0
                s32 sin = (SIN_24_8(CLAMP_SIN_PERIOD(stageTime + r4 * 4)) >> 1) + 1;
                sin = sin - r4;
                *hOffsets++ = (stageTime2 + sin) & 0xFF;
            }

            r4++;
        }
    } else {
        // _0801D3D6
        gBldRegs.bldAlpha = BLDALPHA_BLEND(16, (16 - (p1_2 >> 5)));
        r4 = 0;

        // _0801D3FC
        for (; r4 < r6; r4++) {
            s32 sin = SIN_24_8(CLAMP_SIN_PERIOD(r4 * 16 + stageTime2 + stageTime)) >> 1;
            sin += 1;
            sin = sin - r4 * 2;
            *hOffsets++ = sin & 0xFF;

            sin = SIN_24_8((CLAMP_SIN_PERIOD(stageTime2 + r4 * 4))) >> 1;
            sin++;
            sin = (sin)-r4 * 2;
            *hOffsets++ = (stageTime2 + sin) & 0xFF;
        }

        // _0801D44C

        while (r4 < (DISPLAY_HEIGHT - 1)) {
            *hOffsets++ = 0;

            if ((r4 - 15) < r6) {
                *hOffsets++ = ((((r4 - r6) - 15) << 3) - (r4 - 1)) & 0xFF;
            } else {
                *hOffsets++ = ((-r4 + 1) & 0xFF);
            }

            r4++;
        }
    }
    // _0801D498

    if (p0 > 16) {
        p0 = 16;
    }
    // _0801D4A2

    for (i = 0; i < 16; i++) {
        s32 b, g, r;
        r = (p0 * gUnknown_080D5C02[1][i][0]) >> 4;
        r &= 0x1F;

        g = (p0 * gUnknown_080D5C02[1][i][1]) >> 4;
        g &= 0x1F;

        b = (p0 * gUnknown_080D5C02[1][i][2]) >> 4;
        b &= 0x1F;

        gBgPalette[15 * 16 + i] = ((b << 10) + (g << 5) + (r << 0));
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}
END_NONMATCH

// (84.63%) https://decomp.me/scratch/W9B0j
// (82.95%) https://decomp.me/scratch/ZEtCx (newer)
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone6Acts12.inc", void StageBgUpdate_Zone6Acts12(s32 x, s32 UNUSED y))
{
    u16 r6;
    u8 r5;
    u8 r2;
    Background *bg = &gStageBackgroundsRam.unk0;

    gBgScrollRegs[3][0] = x >> 4;

    r6 = Mod(gStageTime, 0x680);
    r5 = 0;
    r2 = 8;

    if (r6 > gUnknown_080D5BF0[7]) {
        r5 = 7;
    } else
        while (1) {
            u32 r3;
            u32 r0 = (r2 << 24);
            r0 += (0xFF << 24);
            r2 = r0 >> 24;
            r3 = r2 << 24;
            r0 = r3 >> 24;
            if (((signed)r0 >= 0) || (r6 > gUnknown_080D5BF0[r0])) {
                break;
            }
        }

    if (IS_MULTI_PLAYER) {
        r5 = 5;
    }

    gBgPalette[0] = RGB_BLACK;
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    switch (r5) {
        case 0: {
            if (r6 == 1) {
                const Background *bgTemplate = gStageCameraBgTemplates;
                memcpy(bg, (bgTemplate + 3), sizeof(Background));
                bg->tilemapId = TM_TECHNO_BASE_BG_PURPLE_GRID;
                bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
                bg->layoutVram = (void *)BG_SCREEN_ADDR(26);
                bg->targetTilesX = 32;
                bg->targetTilesY = 32;
                DrawBackground(bg);
            } else if (r6 > 1) {
                // _0801D636
                gDispCnt |= DISPCNT_BG0_ON;
                gBgCntRegs[0] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[0] |= BGCNT_PRIORITY(3);
                gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
                gBgCntRegs[3] |= BGCNT_PRIORITY(3);

                r2 = r6;
                if (r2 > 63)
                    r2 = 63;

                r6 /= 4u;

                sub_801D24C(r6, 63 - r2, 0);
            }
        } break;

        case 1: {
            sub_801D24C(15, 0, 0);
        } break;

        case 2: {
            u32 r0 = (r6 - 577);
            r0 <<= 16;
            r2 = (r0 << 8) >> 24;
            r6 /= 4u;
            r6 = (15 - r6);

            if (r6 != 0) {
                sub_801D24C(r6, 63 - r2, 1);
            } else {
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                gBldRegs.bldCnt = r6;
            }
        } break;

        case 3: {
            s8 i;
            gBgCntRegs[0] &= ~BGCNT_PRIORITY(3);
            gBgCntRegs[0] |= BGCNT_PRIORITY(3);
            gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
            gBgCntRegs[3] |= BGCNT_PRIORITY(2);

            for (i = 0; i < 16; i++) {
                gBgPalette[(15 * 16) + i] = RGB_BLACK;
            }

            // jumps to _0801D8EE for this
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 4: {
            s8 i;
            s32 v;

            if (r6 == 897) {
                memcpy(&gStageBackgroundsRam.unk0, &gStageCameraBgTemplates[3], sizeof(Background));
                gStageBackgroundsRam.unk0.tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
                bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
                bg->layoutVram = (void *)BG_SCREEN_ADDR(26);
                bg->targetTilesX = 32;
                bg->targetTilesY = 32;
                DrawBackground(bg);
            } else {
                gDispCnt |= DISPCNT_BG0_ON;
                gBgCntRegs[0] |= BGCNT_PRIORITY(3);
            }
            // _0801D76C

            v = r6 - 897;
            r6 = v;

            for (i = 0; i < 16; i++) {
                u32 red = ((gUnknown_080D5C02[0][i][0] * r6) >> 5) & 0x1F;
                u32 green = ((gUnknown_080D5C02[0][i][1] * r6) >> 5) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[0][i][2] * r6) >> 5) & 0x1F;

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            // jumps to _0801D83C for this
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
        } break;

        case 5: {
            // _0801D7F8_case5
            s8 i;

            for (i = 0; i < 16; i++) {
                u32 red = gUnknown_080D5C02[0][i][0];
                u32 green = gUnknown_080D5C02[0][i][1];
                u32 blue = gUnknown_080D5C02[0][i][2];

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            // _0801D83C
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
        } break;

        case 6: {
            s8 i;
            s32 v;

            gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
            gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;

            v = r6 - 1441;
            r6 = v;
            r6 = (31 - r6) / 2u;

            for (i = 0; i < 16; i++) {
                u32 red = ((gUnknown_080D5C02[0][i][0] * r6) >> 4) & 0x1F;
                u32 green = ((gUnknown_080D5C02[0][i][1] * r6) >> 4) & 0x1F;
                u32 blue = ((gUnknown_080D5C02[0][i][2] * r6) >> 4) & 0x1F;

                gBgPalette[(15 * 16) + i] = ((blue << 10) | (green << 5) | red);
            }

            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        } break;

        case 7: {
            s8 i;
            for (i = 0; i < 16; i++) {
                gBgPalette[(15 * 16) + i] = RGB_BLACK;
            }
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
            gDispCnt &= ~(DISPCNT_BG0_ON);
        } break;
    }
}
END_NONMATCH

/************************************ ZONE 7 ************************************/

const s16 gUnknown_080D5C62[8][2] = {
    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.00), -Q_8_8(0.0859375) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(0.75), -Q_8_8(0.125) }, //
};

static const u16 sPalette_Zone7BgCeiling[16] = INCBIN_U16("graphics/080D5C82.gbapal");

void CreateStageBg_Zone7(void)
{
    Background *bg = &gStageBackgroundsRam.unk0;
    const Background *src;
    gDispCnt = DISPCNT_OBJ_ON | DISPCNT_BG2_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;

    gBgCntRegs[0] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(22) | BGCNT_16COLOR | BGCNT_PRIORITY(15));

    src = gStageCameraBgTemplates;
    memcpy(bg, &src[3], sizeof(Background));

    bg->tilemapId = TM_UNK_SPACE_BG;
    bg->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    bg->layoutVram = (void *)BG_SCREEN_ADDR(22);
    bg->targetTilesX = 32;
    bg->targetTilesY = 20;
    DrawBackground(bg);

    gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
    gBgCntRegs[3] |= BGCNT_PRIORITY(3);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

// (98.52%) https://decomp.me/scratch/DUPkY
// (99.82%) https://decomp.me/scratch/pfVTf (fake match)
NONMATCH("asm/non_matching/game/stage/background/Zone7BgUpdate_Inside.inc", void Zone7BgUpdate_Inside(s32 x, s32 y))
{
    u16 *dst;
    s32 someX;
    s32 lineY;
    s32 ip;
    u8 j;
    u8 r1;
    u8 r2;
    u8 r5;

    if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
        if (gBgScrollRegs[3][0] == 0)
            gBgScrollRegs[3][0] = x;

        gBgScrollRegs[3][0] += I(gPlayer.qSpeedGround);

        x = gBgScrollRegs[3][0];
    }

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG3_ON;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG3HOFS;
    gHBlankCopySize = 4;

    dst = (u16 *)gBgOffsetsHBlank;

#ifndef NON_MATCHING
    // Why call Div without using its return value?
    someX = Div(x * 42, 400);
#endif

    // Move BG3 to the "ceiling" for the first 40 lines
    for (lineY = 0; lineY < 40; lineY++) {
        *dst++ = 8;
        *dst++ = 16;
    }

    // ip = Div(25*x, 400);
    ip = Div(25 * x, 400) & 0xFF;

    for (lineY = 0; lineY < 119; lineY++) {
        *dst++ = ip;
        *dst++ = 17;
    }

    // _0801DAA6
    // Draw the small, green-shining, moving pillars
    // NOTE: j stored in *sp
    j = 0;
    do {
        ip = (((gStageTime + x) / 8)) & 0xFF;

        r5 = (((100 * j) + 64) - (y >> 4));
        if (r5 < 240) {
            // __0801DACA
            if (r5 > 80) {
                dst = gBgOffsetsHBlank;
                r1 = ((r5 - 80) >> 4);
                dst += (r5 - r1) << 1;

                lineY = r5;
                for (r2 = 0; ((lineY < r1 + 160) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 208 - r5;
                }
            }
            // _0801DB1C
            dst = gBgOffsetsHBlank;
            dst = ((void *)dst) + (r5 * 4);

            for (lineY = r5, r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < 16)); lineY++, r2++) {
                *dst++ = ip;
                *dst++ = (240 - r5);
            }

            if (lineY < 80) {
                s32 r0 = (80 - lineY) >> 4;
                r1 = r0;

                for (r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = (184 - r5);
                }
            }
        } else {
            // _0801DBAC
            dst = gBgOffsetsHBlank;

            for (lineY = 255 - r5; lineY < 16; lineY++) {
                *dst++ = ip;
                *dst++ = 495 - r5;
            }
            // _0801DBD2

            for (r2 = 0; r2 < 4; r2++) {
                *dst++ = 0;
                *dst++ = 439 - r5;
            }
        }
    } while (++j < 2); // _0801DBEE == continue of (j < 2)
    // _0801DBFA

    ip = ((gStageTime + x) / 2) & 0xFF;

    {
        r5 = -(y >> 1);

        if (r5 < 224) {
            u8 val;
            if (r5 > 80) {
                dst = gBgOffsetsHBlank;

                val = ((r5 - 80) >> 4);
                dst += (r5 - val) << 1;

                lineY = r5, r2 = 0;
                for (; ((lineY < (160 + val)) && (r2 < val)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 208 - r5;
                }
            }
            // _0801DC66
            dst = gBgOffsetsHBlank;
            dst = ((void *)dst) + (r5 * 4);

            for (lineY = r5, r2 = 0; ((lineY < DISPLAY_HEIGHT) && (r2 < 32)); lineY++, r2++) {
                *dst++ = ip;
                *dst++ = 208 - r5;
            }

            if (lineY < 80) {
                for (r1 = (80 - lineY) >> 4, r2 = 0; ((lineY < 160) && (r2 < r1)); lineY++, r2++) {
                    *dst++ = 0;
                    *dst++ = 168 - r5;
                }
            }
        } else {
            // _0801DCDC
            dst = gBgOffsetsHBlank;

            for (lineY = 255 - r5; lineY < 32; lineY++) {
                *dst++ = ip;
                *dst++ = 463 - r5;
            }

            for (r2 = 0; r2 < 4; r2++) {
                *dst++ = 0;
                *dst++ = 423 - r5;
            }
        }
// _0801DD1A
#if 001
        { // Draw the "ceiling" movement
            u32 new_r1 = (x >> 4) << 16;
            const u16 *src;
            s32 r6 = 0x7;
            src = sPalette_Zone7BgCeiling;
            dst = gBgPalette;
            dst += 209;
            new_r1 >>= 16;

            for (lineY = 0; lineY < 8; new_r1--, lineY++) {
                s32 index = (new_r1 & r6) + 1;
                *dst++ = src[index];
            }
        }
#else
        { // Draw the "ceiling" movement
            for (lineY = 0; lineY < 8; lineY++) {
                dst = gBgPalette;
                dst += 209;
                dst[lineY] = sPalette_Zone7BgCeiling[((x >> 4) & 0x7) + 1];
            }
        }
#endif
    }

    gFlags = gFlags | FLAGS_UPDATE_BACKGROUND_PALETTES;
}
END_NONMATCH

void Zone7BgUpdate_Outside(s32 x, s32 y)
{
    u16 *lineShiftX;
    u8 frameCount;
    int_vcount i;
    u16 sp[32];
    u32 stageTime;

    gDispCnt &= ~DISPCNT_BG3_ON;
    gDispCnt |= DISPCNT_BG0_ON;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 2;
    lineShiftX = (u16 *)gBgOffsetsHBlank;

    stageTime = gStageTime;
    frameCount = ((stageTime >> 3) & 0x1F);
    if (frameCount >= 16) {
        // Likely some sort of debug log
#ifndef NON_MATCHING
        register u32 r1 asm("r1");
        register u8 r0 asm("r0");
        r0 = 31 - frameCount;
        asm("" ::"r"(r0));
        r1 = r0;
        asm("" ::"r"(r1));
#endif
    }

    for (i = 0; i < ARRAY_COUNT(sp); i++) {
        sp[i] = 0xFF & (I(gUnknown_080D5C62[(i & 0x7)][0] * stageTime) + gUnknown_080D5C62[(i & 0x7)][1]);
    }

    {
        u16 sinVal, value;
        u32 cosVal;
        u32 scrollSpeed = (Q(80.5) - 1);

        for (i = 0; i < DISPLAY_HEIGHT / 2; i++) {
            sinVal = SIN_24_8(((gStageTime * 4) + i * 2) & ONE_CYCLE) >> 3;
            value = (COS_24_8(((i * scrollSpeed) >> 5) & ONE_CYCLE) >> 4) + sinVal;
            value = (value + sp[(i & 0x1F)]) & 0xFF;
            *lineShiftX++ = value;
        }

        for (; i < DISPLAY_HEIGHT - 1; i++) {
            sinVal = SIN_24_8(((gStageTime << 2) + i * 2) & ONE_CYCLE) >> 3;
            cosVal = (COS_24_8((((DISPLAY_HEIGHT - i) * scrollSpeed) >> 5) & ONE_CYCLE) >> 4);
            value = cosVal + sinVal;
            value = (value + sp[(i & 0x1F)]) & 0xFF;
            *lineShiftX++ = value;
        }
    }
}

/************************************ ZONE FINAL ************************************/

#define NUM_ZONE7_BG_TRANSITION_POSITIONS 8

const u16 sZone7BgTransitionRegions[2][NUM_ZONE7_BG_TRANSITION_POSITIONS] = {
    { 697, 1849, 8857, 11832, 18553, 22009, 25369, 27673 }, // ACT 1
    { 1344, 2616, 9432, 15192, 18552, 19892, 23158, 25848 }, // ACT 2
};

const u16 gUnknown_080D5CC2[16] = INCBIN_U16("graphics/080D5CC2.gbapal");

void CreateStageBg_ZoneFinal_0(void)
{
    Background *bgDst;
    const Background *bgSrc;
    u8 i;

    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    gUnknown_03004D80[2] = 0;

    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    bgDst = &gStageBackgroundsRam.unk80;
    gBgCntRegs[2] = BGCNT_SCREENBASE(26) | BGCNT_256COLOR | BGCNT_CHARBASE(2) | BGCNT_PRIORITY(1);
    bgSrc = gStageCameraBgTemplates;
    memcpy(bgDst, &bgSrc[2], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_COCKPIT;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(2);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(416);
    bgDst->targetTilesX = 10;
    bgDst->targetTilesY = 9;
    bgDst->flags |= BACKGROUND_FLAG_4;
    DrawBackground(bgDst);

    bgDst = &gStageBackgroundsRam.unk0;
    gBgCntRegs[0] = BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(1) | BGCNT_PRIORITY(3);

    memcpy(bgDst, &bgSrc[3], sizeof(Background));

    bgDst->tilemapId = TM_EXTRA_BOSS_BACKGROUND;
    bgDst->graphics.dest = (void *)BG_CHAR_ADDR(1);

    // TODO: Should this be a different macro?
    bgDst->layoutVram = (void *)BG_TILE_ADDR(480);
    bgDst->targetTilesX = 32;
    bgDst->targetTilesY = 20;
    bgDst->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(bgDst);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    for (i = 0; i < ARRAY_COUNT(gUnknown_080D5CC2); i++) {
        gBgPalette[i] = gUnknown_080D5CC2[i];
    }

    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
}
#endif // COLLECT_RINGS_ROM

/************************************ MISC TASKS ************************************/

void DestroyCameraMovementTask(void)
{
    TaskDestroy(gCamera.movementTask);
    gCamera.movementTask = NULL;
}

void TaskDestructor_Camera(struct Task *unused)
{
    s32 i;
    gCamera.movementTask = NULL;

    for (i = 0; i < NUM_BACKGROUNDS; i++) {
        gBgScrollRegs[i][0] = 0;
        gBgScrollRegs[i][1] = 0;
    }

#ifndef COLLECT_RINGS_ROM
    if (IS_EXTRA_STAGE(gCurrentLevel) && (gFlags & FLAGS_EXECUTE_HBLANK_COPY0)) {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY0;
    }
#endif

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
}

void Task_CallUpdateCamera(void)
{
    gDispCnt |= (DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON);

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        gDispCnt &= ~DISPCNT_BG3_ON;
    }
#endif
#endif

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gDispCnt &= ~DISPCNT_WIN0_ON;
    }

    gCurTask->main = Task_CallUpdateCameraInternal;
}

void Task_CallUpdateCameraInternal(void)
{
    UpdateCamera();
    gUnknown_030054B8 = 4;
}

#ifndef COLLECT_RINGS_ROM
void CreateStageBg_Default(void)
{
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

void CreateStageBg_Dummy(void) { }
#endif

void StageBgUpdate_Dummy(s32 x, s32 y) { }
#ifndef COLLECT_RINGS_ROM
/************************************ BOSS 1 ************************************/

void StageBgUpdate_Zone1ActBoss(UNUSED s32 x, UNUSED s32 y)
{
    struct Camera *cam = &gCamera;
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    gBgScrollRegs[0][0] = ((gStageTime + 4) >> 3) & 0xFF;
    gBgScrollRegs[0][1] = cam->y >> 9;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E434;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}

/************************************ BOSS 2 ************************************/

void StageBgUpdate_Zone2ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    StageBgUpdate_Zone2Acts12(gStageTime, 4000);
}

/************************************ BOSS 3 ************************************/

void StageBgUpdate_Zone3ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][1] = 0;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[3][0] = 0;
}

/************************************ BOSS 5 ************************************/

void StageBgUpdate_Zone5ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    gDispCnt &= ~DISPCNT_BG1_ON;
    gBgScrollRegs[0][0]++;
    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_BgUpdateZone5ActBoss;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}

/************************************ BOSS 6 ************************************/

void StageBgUpdate_Zone6ActBoss(UNUSED s32 a, UNUSED s32 b)
{
    gBgCntRegs[0] |= 0x3;
    gBgCntRegs[3] &= ~0x3;
    gBgCntRegs[3] |= 0x2;
    gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 2) & 0xFF;
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] + 1) & 0xFF;
}

/*********************************** BOSS/ZONE 7 ********************************/

// Not sure why this is defined here, it's possible the function name was confused
// and this was defined twice in the same function
void StageBgUpdate_Zone7Acts12(s32 x, s32 y)
{
    u32 act = !!(gCurrentLevel ^ (LEVEL_INDEX(ZONE_7, ACT_1)));
    u32 bgId = 0;
    u8 regionId = 0;

    if (x >= sZone7BgTransitionRegions[act][regionId]) {
        while (TRUE) {
            if (++regionId >= NUM_ZONE7_BG_TRANSITION_POSITIONS) {
                break;
            }
            if (x < sZone7BgTransitionRegions[act][regionId]) {
                bgId = regionId % 2;
                break;
            }
        };
    };

    if (bgId == 0) {
        Zone7BgUpdate_Inside(x, y);
    } else {
        Zone7BgUpdate_Outside(x, y);
    }

    gPlayer.unk99[15] = bgId;
}

void StageBgUpdate_Zone7ActBoss(UNUSED s32 x, UNUSED s32 y)
{
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    Zone7BgUpdate_Inside(gStageTime, 945);
}

/************************************ BOSS FINAL ************************************/

void StageBgUpdate_ZoneFinalActXX(UNUSED s32 x, UNUSED s32 y)
{
    if (!PLAYER_IS_ALIVE) {
        gStageTime--;
    }

    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_BgUpdateZoneFinalActXX;
    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
}

/************************************ BOSS EXTRA ************************************/

#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"

void StageBgUpdate_ZoneFinalActTA53(UNUSED s32 a, UNUSED s32 b)
{
    u32 aBool = FALSE;
    int_vcount y;

    if (gActiveBossTask != NULL) {
        TA53Boss *boss = TASK_DATA(gActiveBossTask);
        aBool = boss->unk10 & 0x1;
    }

    if (aBool) {
        u16 *offset;
        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)&REG_BG1HOFS;
        gHBlankCopySize = 2;

        offset = (u16 *)gBgOffsetsHBlank;
        for (y = 0; y < DISPLAY_HEIGHT - 1; y++) {
            s16 val = SIN(((y + gStageTime) * 40) & ONE_CYCLE) >> 12;
            *offset++ = val;
        }
    }
}

/************************************ CALLBACKS ************************************/

#endif

// Unused
void sub_801E3F0(void)
{
    struct Camera *cam = &gCamera;
    if (gStageTime & 0x1) {
        u16 rand = (PseudoRandom32() & 0x70000) >> 16;
        cam->shiftY = rand - 8;
    }
}

#ifndef COLLECT_RINGS_ROM

void HBlankCB_801E434(int_vcount vcount)
{
    if (vcount == 73) {
        REG_BG3HOFS = gStageTime >> 4;
    }
}

void HBlankCB_801E454(int_vcount vcount)
{
    if (vcount != 0) {
        u16 *p = &((u16 *)gUnknown_030022AC)[vcount * 2], *q;
        q = p - 1;

        if (p[1] != *q) {
            REG_BG3HOFS = p[1];
        }

        q = p - 2;
        if (p[0] != q[0]) {
            REG_BG0HOFS = p[0];
        }
    }
}

void nullsub_801E494(void) { }

void HBlankCB_BgUpdateZone5ActBoss(int_vcount vcount)
{
    if (vcount > 105) {
        REG_BG3HOFS = gCourseTime >> (gUnknown_080D5B50[vcount] - 1);
    }
}

void HBlankCB_BgUpdateZoneFinalActXX(int_vcount vcount)
{
    if (vcount == 88) {
        REG_BG3HOFS = (u8)gStageTime;
    }
}

#endif
