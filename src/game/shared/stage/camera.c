#include "global.h"
#include "core.h"
#include "sprite.h"
#include "animation_commands_bg.h"
#include "trig.h"

#include "game/globals.h"

#include "game/shared/stage/camera.h"
#include "game/shared/stage/stage.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/spot_lights_manager.h"

#if (GAME == GAME_SA1)
#include "game/shared/stage/mp_player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/characters.h"
#include "constants/sa1/tilemaps.h"
#include "constants/sa1/zones.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/player_super_sonic.h"

#include "constants/sa2/tilemaps.h"
#include "constants/sa2/zones.h"
#include "constants/sa2/characters.h"
#endif

#define BOSS_CAM_FRAME_DELTA_PIXELS 5

// NOTE:
// unk8 is a regular integer in SA1, but Q_24_8 in SA2
#if (GAME == GAME_SA1)
#define CAM_UNK8_INT(_val) (_val)
#else
#define CAM_UNK8_INT(_val) (I(_val))
#endif

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

// Probably a array (as it's aligned 16)
StageBackgrounds ALIGNED(16) gStageBackgroundsRam = {};

#ifndef COLLECT_RINGS_ROM
UNUSED u32 unused_3005950[3] = {};
#endif

Camera ALIGNED(8) gCamera = {};

static void RenderMetatileLayers(s32, s32);
void Task_CallUpdateCamera(void);
void TaskDestructor_Camera(struct Task *);
void Task_UpdateCamera(void);

// Dummy callbacks
void CreateStageBg_Default(void);
void CreateStageBg_Dummy(void);
void StageBgUpdate_Dummy(s32 x, s32 y);

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

#if (GAME == GAME_SA1)
extern void CreateStageBg_Zone4(void);
extern void CreateStageBg_Zone5(void);
extern void CreateStageBg_Zone7_Act2(void);

static const VoidFn sStageBgInitProcedures[NUM_LEVEL_IDS] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = NULL,
    [LEVEL_INDEX(ZONE_2, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = NULL,
    [LEVEL_INDEX(ZONE_3, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = NULL,
    [LEVEL_INDEX(ZONE_4, ACT_1)] = CreateStageBg_Zone4,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = CreateStageBg_Zone4,
    [LEVEL_INDEX(ZONE_5, ACT_1)] = CreateStageBg_Zone5,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = CreateStageBg_Zone5,
    [LEVEL_INDEX(ZONE_6, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = NULL,
    [LEVEL_INDEX(ZONE_7, ACT_1)] = NULL,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = CreateStageBg_Zone7_Act2,
    [ACT_CHAO_HUNT_A] = NULL,
    [ACT_CHAO_HUNT_B] = NULL,
    [ACT_CHAO_HUNT_C] = NULL,
    [ACT_CHAO_HUNT_D] = NULL,

};

void StageBgUpdate_Zone1Acts12(s32, s32);
void StageBgUpdate_Zone2Act1(s32, s32);
void StageBgUpdate_Zone2Act2(s32, s32);
void StageBgUpdate_Zone3Acts12(s32, s32);
void StageBgUpdate_Zone4Acts12(s32, s32);
void StageBgUpdate_Zone5Acts12(s32, s32);
void StageBgUpdate_Zone6Act1(s32, s32);
void StageBgUpdate_Zone6Act2(s32, s32);
void StageBgUpdate_Zone7Act1(s32, s32);
void StageBgUpdate_Zone7Act2(s32, s32);
static const BgUpdate sStageBgUpdateFuncs[NUM_LEVEL_IDS] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = StageBgUpdate_Zone1Acts12,
    [LEVEL_INDEX(ZONE_2, ACT_1)] = StageBgUpdate_Zone2Act1,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = StageBgUpdate_Zone2Act2,
    [LEVEL_INDEX(ZONE_3, ACT_1)] = StageBgUpdate_Zone3Acts12,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = StageBgUpdate_Zone3Acts12,
    [LEVEL_INDEX(ZONE_4, ACT_1)] = StageBgUpdate_Zone4Acts12,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = StageBgUpdate_Zone4Acts12,
    [LEVEL_INDEX(ZONE_5, ACT_1)] = StageBgUpdate_Zone5Acts12,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = StageBgUpdate_Zone5Acts12,
    [LEVEL_INDEX(ZONE_6, ACT_1)] = StageBgUpdate_Zone6Act1,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = StageBgUpdate_Zone6Act2,
    [LEVEL_INDEX(ZONE_7, ACT_1)] = StageBgUpdate_Zone7Act1,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = StageBgUpdate_Zone7Act2,
    [ACT_CHAO_HUNT_A] = StageBgUpdate_Zone1Acts12,
    [ACT_CHAO_HUNT_B] = StageBgUpdate_Zone2Act2,
    [ACT_CHAO_HUNT_C] = StageBgUpdate_Zone3Acts12,
    [ACT_CHAO_HUNT_D] = StageBgUpdate_Zone6Act2,
};

static const s8 sStageBgDimensions[NUM_LEVEL_IDS][4] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_1, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_2, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_2, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_3, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_3, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_4, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_4, ACT_2)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_5, ACT_1)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_5, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [LEVEL_INDEX(ZONE_6, ACT_1)] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_C),
    [LEVEL_INDEX(ZONE_6, ACT_2)] = STGBG_SCRN_DIM(512, 256, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_7, ACT_1)] = STGBG_SCRN_DIM(296, 184, 2, CAM_SCREENBASE_BACK_A),
    [LEVEL_INDEX(ZONE_7, ACT_2)] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [ACT_CHAO_HUNT_A] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [ACT_CHAO_HUNT_B] = STGBG_SCRN_DIM(256, 512, 2, CAM_SCREENBASE_BACK_A),
    [ACT_CHAO_HUNT_C] = STGBG_SCRN_DIM(256, 256, 2, CAM_SCREENBASE_BACK_B),
    [ACT_CHAO_HUNT_D] = STGBG_SCRN_DIM(512, 256, 2, CAM_SCREENBASE_BACK_A),
};

const TileInfoFirework gTileInfoZone3Fireworks[2] = {
    [0] = { SA1_ANIM_FIREWORKS, 0, MAX_TILES(SA1_ANIM_FIREWORKS) },
    [1] = { SA1_ANIM_FIREWORKS_SMALL, 0, MAX_TILES(SA1_ANIM_FIREWORKS_SMALL) },
};
#elif (GAME == GAME_SA2)
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

#ifndef COLLECT_RINGS_ROM
const u16 gBossCameraYClamps[][2] = {
    [ZONE_1] = { 32, DISPLAY_HEIGHT + 56 },  [ZONE_2] = { 32, DISPLAY_HEIGHT + 44 },      [ZONE_3] = { 32, DISPLAY_HEIGHT + 56 },
    [ZONE_4] = { 32, DISPLAY_HEIGHT + 48 },  [ZONE_5] = { 32, DISPLAY_HEIGHT + 48 },      [ZONE_6] = { 32, DISPLAY_HEIGHT + 72 },
    [ZONE_7] = { 32, DISPLAY_HEIGHT + 104 }, [ZONE_FINAL] = { 32, DISPLAY_HEIGHT + 104 }, [ZONE_FINAL + 1] = { 32, DISPLAY_HEIGHT + 104 },
};
#endif
static const VoidFn sStageBgInitProcedures[] = {
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
#if PLATFORM_GBA
    [LEVEL_INDEX(ZONE_6, ACT_1)] = StageBgUpdate_Zone6Acts12,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = StageBgUpdate_Zone6Acts12,
#else
    [LEVEL_INDEX(ZONE_6, ACT_1)] = StageBgUpdate_Zone6ActBoss,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = StageBgUpdate_Zone6ActBoss,
#endif
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
#endif

void InitCamera(u32 level)
{
    u32 txtSize;

    StageBackgrounds *bgs;
    const Background *bgTemplates;
    Player *player = &gPlayer;
    Camera *camera = &gCamera;
    const s8 *bgDim = sStageBgDimensions[level];

    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_1D_MAP);
#ifndef COLLECT_RINGS_ROM
    if (IS_EXTRA_STAGE(level)) {
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
#if (GAME == GAME_SA1)
        gBgCntRegs[0]
            = BGCNT_TXT256x256 | (BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(CAM_SCREENBASE_MAP_BACK) | BGCNT_16COLOR | BGCNT_CHARBASE(0));
        txtSize = ((STGBG_WIDTH(bgDim) + 0x1F) >> 6 | ((STGBG_HEIGHT(bgDim) + 0x1F) >> 6) << 1) << 0xE;
        gBgCntRegs[1] = txtSize | BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(STGBG_SCREENBASE(bgDim)) | BGCNT_CHARBASE(STGBG_CHARBASE(bgDim));
#elif (GAME == GAME_SA2)
        gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
#endif
    }
#endif

    bgs = &gStageBackgroundsRam;
    bgTemplates = gStageCameraBgTemplates;

    memcpy(&gStageBackgroundsRam.unk40, &bgTemplates[0], sizeof(Background));
    bgs->unk40.tilemapId = TM_LEVEL_METATILES_0(level);

    memcpy(&gStageBackgroundsRam.unk80, &bgTemplates[1], sizeof(Background));
    bgs->unk80.tilemapId = TM_LEVEL_METATILES_1(level);

#if (GAME == GAME_SA1)
    if (IS_EXTRA_STAGE(level)) {
        gStageBackgroundsRam.unk80.flags &= ~BACKGROUND_FLAGS_MASK_BG_ID;
    }
#endif

    memcpy(&gStageBackgroundsRam.unkC0, &bgTemplates[2], sizeof(Background));
    bgs->unkC0.tilemapId = TM_LEVEL_BG(level);

    bgs->unkC0.graphics.dest = (void *)BG_CHAR_ADDR(STGBG_CHARBASE(bgDim));
    bgs->unkC0.layoutVram = (void *)BG_SCREEN_ADDR(STGBG_SCREENBASE(bgDim));
    bgs->unkC0.targetTilesX = STGBG_WIDTH(bgDim);
    bgs->unkC0.targetTilesY = STGBG_HEIGHT(bgDim);

#if (GAME == GAME_SA1)
    if (IS_EXTRA_STAGE(level)) {
        gStageBackgroundsRam.unkC0.flags &= ~BACKGROUND_FLAGS_MASK_BG_ID;
        gStageBackgroundsRam.unkC0.flags |= BACKGROUND_FLAGS_BG_ID(1);
    }
#endif

    INIT_BG_SPRITES_LAYER_32(1);
    INIT_BG_SPRITES_LAYER_32(2);

#if (GAME == GAME_SA1)
    if (level == LEVEL_INDEX(ZONE_6, ACT_1)) {
        DrawBackground(&bgs->unkC0);
        DmaCopy16(3, gStageBackgroundsRam.unkC0.layout, gStageBackgroundsRam.unkC0.layoutVram, 4096);

        gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
        gBgCntRegs[3] |= BGCNT_SCREENBASE(STGBG_SCREENBASE(bgDim) + 2);
        gStageBackgroundsRam.unkC0.layoutVram = (void *)((uintptr_t)BG_SCREEN_ADDR(STGBG_SCREENBASE(bgDim) + 2));
        gStageBackgroundsRam.unkC0.unk20 = 0x40;
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
#endif
    {
        bgs->unk40.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_DISABLE_TILESET_UPDATE;
        bgs->unk80.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_DISABLE_TILESET_UPDATE;
    }

#ifndef COLLECT_RINGS_ROM
    if (IS_EXTRA_STAGE(level)) {
#if (GAME == GAME_SA1)
        DrawBackground(&bgs->unk80);
        DrawBackground(&bgs->unkC0);
#endif
    } else {
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

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            SuperSonicGetPos(&player->qWorldX, &player->qWorldY);
            gBossCameraClampYLower = gBossCameraYClamps[ZONE_FINAL + 1][0];
            gBossCameraClampYUpper = gBossCameraYClamps[ZONE_FINAL + 1][1];
            camera->x = 600;
            camera->unk10 = DISPLAY_CENTER_X;
            camera->unk14 = 0;
            camera->y = 0;
            camera->unk64 = -4;
        } else {
            camera->x = I(player->qWorldX);
            // TODO: Handle boss camera restrictions for large screen sizes
            // for now we use the original GBA values as otherwise the boss
            // goes off the screen (not sure why yet)
            camera->unk10 = I(player->qWorldX) - (2 * 240);
            camera->y = I(player->qWorldY) - (DISPLAY_CENTER_Y + 4);
            camera->unk14 = camera->y;
            camera->unk64 = player->spriteOffsetY - 4;
        }
    } else
#endif
#endif
    {
#if (GAME == GAME_SA1)
        camera->SA2_LABEL(unk10) = I(gPlayer.qWorldX) - DISPLAY_CENTER_X;
        camera->x = I(gPlayer.qWorldX) - DISPLAY_CENTER_X;
        camera->SA2_LABEL(unk14) = (I(gPlayer.qWorldY) + camera->SA2_LABEL(unk4C)) - (DISPLAY_CENTER_Y + 4);
        camera->y = (I(gPlayer.qWorldY) + camera->SA2_LABEL(unk4C)) - (DISPLAY_CENTER_Y + 4);
#elif (GAME == GAME_SA2)
        camera->x = I(player->qWorldX) - DISPLAY_CENTER_X;
        camera->y = I(player->qWorldY) - (DISPLAY_CENTER_Y + 4);

        if (camera->x < 0) {
            camera->x = 0;
        }

        if (camera->y < 0) {
            camera->y = 0;
        }

        camera->SA2_LABEL(unk10) = camera->x;
        camera->SA2_LABEL(unk14) = camera->y;
        camera->SA2_LABEL(unk64) = player->spriteOffsetY - 4;
#endif
    }

#if (GAME == GAME_SA1)
    camera->SA2_LABEL(unk8) = 16;
#elif (GAME == GAME_SA2)
    camera->SA2_LABEL(unk8) = 0x1000;
#endif
    camera->SA2_LABEL(unkC) = 12;
#if (GAME == GAME_SA2)
    camera->SA2_LABEL(unk56) = 0;
#endif
    camera->shiftX = 0;
    camera->shiftY = 0;
    camera->SA2_LABEL(unk20) = 0;
    camera->SA2_LABEL(unk24) = 0;
    camera->SA2_LABEL(unk40) = 0;
    camera->SA2_LABEL(unk44) = 8;
    camera->SA2_LABEL(unk48) = 0;
    camera->SA2_LABEL(unk4C) = 0;
    camera->SA2_LABEL(unk50) = 0;
    camera->SA2_LABEL(unk52) = 0;
    camera->SA2_LABEL(unk54) = 0;
    camera->shakeOffsetX = 0;
    camera->shakeOffsetY = 0;
#if (GAME == GAME_SA1)
    camera->SA2_LABEL(unk64) = gPlayer.spriteOffsetY - 4;
#endif
    camera->movementTask = TaskCreate(Task_CallUpdateCamera, 0, 0xF00, 0, TaskDestructor_Camera);

    camera->fnBgUpdate = sStageBgUpdateFuncs[level];

    if (sStageBgInitProcedures[level] != NULL) {
        sStageBgInitProcedures[level]();
    }
}

// ALIGNED UP TO HERE
// Only need to use the original value for these zones
#define DISPLAY_WIDTH_FOR_BOSS_TAS                                                                                                         \
    ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_2 || LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) ? (240 / 2) : DISPLAY_CENTER_X)

void UpdateCamera(void)
{
    Player *player = &gPlayer;
    Camera *camera = &gCamera;
    s32 newX, newY;

#if DEBUG
    if (gInput & L_BUTTON) {
        s32 speed = Q(10);
        if (gInput & DPAD_DOWN)
            gPlayer.qWorldY += speed;
        if (gInput & DPAD_UP)
            gPlayer.qWorldY -= speed;
        if (gInput & DPAD_RIGHT)
            gPlayer.qWorldX += speed;
        if (gInput & DPAD_LEFT)
            gPlayer.qWorldX -= speed;
    }
#endif

    newX = camera->x;
    newY = camera->y;
#if (GAME == GAME_SA2)
    camera->dx = camera->x;
    camera->dy = camera->y;
#endif

    newX = CLAMP(newX, camera->minX, camera->maxX - (DISPLAY_WIDTH + 1));
    newY = CLAMP(newY, camera->minY, camera->maxY - (DISPLAY_HEIGHT + 1));

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 delta, playerY;
        if (!IS_ALIVE(player)) {
            if (camera->fnBgUpdate != NULL) {
                camera->fnBgUpdate(gCamera.x, gCamera.y);
            }
            return;
        }

        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            SuperSonicGetPos(&player->qWorldX, &player->qWorldY);
        }

        camera->SA2_LABEL(unk10) += BOSS_CAM_FRAME_DELTA_PIXELS;
        newX += BOSS_CAM_FRAME_DELTA_PIXELS;

// Most TASes were written with the expection that
// the player gets pushed forwards when touching the boss
// and the camera is moving (due to a physics bug).
// So we need to emulate that behaviour on some specific
// levels
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
        if (newX + (DISPLAY_WIDTH_FOR_BOSS_TAS + 1) < I(player->qWorldX))
#else
        if (newX + (DISPLAY_CENTER_X + 1) < I(player->qWorldX))
#endif
        {
            if ((camera->SA2_LABEL(unk10) + DISPLAY_CENTER_Y) > newX) {
                s32 playerScreenX = I(player->qWorldX);
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
                playerScreenX -= DISPLAY_WIDTH_FOR_BOSS_TAS;
#else
                playerScreenX -= DISPLAY_CENTER_X;
#endif
                camera->shiftX = playerScreenX - newX;
            } else {
                newX = (camera->SA2_LABEL(unk10) + DISPLAY_CENTER_Y);
                camera->shiftX = 0;
            }
        } else {
            camera->shiftX = 0;
            if ((newX + 96) > I(player->qWorldX)) {
                newX = I(player->qWorldX);
                newX -= 96;
                if (newX < camera->SA2_LABEL(unk10)) {
                    newX = camera->SA2_LABEL(unk10);
                }
            }
        }

        playerY = I(player->qWorldY);
        delta = playerY - newY;
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
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

    } else // if !IS_BOSS_STAGE(gCurrentLevel) ->
#endif
#endif
    {
        if (camera->SA2_LABEL(unk40) != 0) {
            camera->SA2_LABEL(unk40)--;
        } else {
            s32 unk64, temp8;
#if (GAME == GAME_SA1)
            if (IS_MULTI_PLAYER) {
                MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[camera->spectatorTarget]);

                if (!(camera->SA2_LABEL(unk50) & 0x1)) {
                    camera->SA2_LABEL(unk10) = (mpp->pos.x + camera->shiftX) - DISPLAY_CENTER_X;
                }

                if (!(camera->SA2_LABEL(unk50) & 2)) {
                    unk64 = camera->SA2_LABEL(unk64);
                    temp8 = mpp->unk58[0] - 4;
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
                        camera->SA2_LABEL(unk64) = unk64;
                    }

                    camera->SA2_LABEL(unk14) = ((mpp->pos.y) + camera->shiftY) - DISPLAY_CENTER_Y + camera->SA2_LABEL(unk4C) + unk64;
                }
            } else
#endif
            {
                if (!(camera->SA2_LABEL(unk50) & 1)) {
                    s16 airSpeedX = player->qSpeedAirX;
                    camera->SA2_LABEL(unk10) = I(player->qWorldX) + camera->shiftX - DISPLAY_CENTER_X;
#if (GAME == GAME_SA2)
                    camera->SA2_LABEL(unk56) = (airSpeedX + (camera->SA2_LABEL(unk56) * 15)) >> 4;
                    camera->SA2_LABEL(unk10) += (camera->SA2_LABEL(unk56) >> 5);
#endif
                }

                if (!(camera->SA2_LABEL(unk50) & 2)) {
                    unk64 = camera->SA2_LABEL(unk64);
                    temp8 = player->spriteOffsetY - 4;
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
                        camera->SA2_LABEL(unk64) = unk64;
                    }

                    camera->SA2_LABEL(unk14) = I(player->qWorldY) + camera->shiftY - DISPLAY_CENTER_Y + camera->SA2_LABEL(unk4C) + unk64;
                }
            }
        }

        if ((camera->SA2_LABEL(unk10) - newX) > camera->SA2_LABEL(unk44)) {
            s32 temp = camera->SA2_LABEL(unk10) - newX - camera->SA2_LABEL(unk44);
            s32 temp2 = CAM_UNK8_INT(camera->SA2_LABEL(unk8));
            if (temp2 > temp) {
                temp2 = temp;
            }
            newX += temp2;
        } else if ((camera->SA2_LABEL(unk10) - newX) < -camera->SA2_LABEL(unk44)) {
            s32 temp = (camera->SA2_LABEL(unk10) - newX) + camera->SA2_LABEL(unk44);
            s32 temp2 = -CAM_UNK8_INT(camera->SA2_LABEL(unk8));
            if (temp2 < temp) {
                temp2 = temp;
            }

            newX += temp2;
        }
        newX = CLAMP(newX, camera->minX, camera->maxX - DISPLAY_WIDTH);

#if (GAME == GAME_SA2)
        if (camera->SA2_LABEL(unk8) < Q(16)) {
            camera->SA2_LABEL(unk8) += Q(0.125);
        }
#endif

        if ((player->moveState & MOVESTATE_IN_AIR) && (player->character != CHARACTER_KNUCKLES || player->SA2_LABEL(unk61) != 9)) {
            camera->SA2_LABEL(unk48) += 4;
            camera->SA2_LABEL(unk48) = MIN(camera->SA2_LABEL(unk48), 24);
        } else {
            camera->SA2_LABEL(unk48) -= 4;
            camera->SA2_LABEL(unk48) = MAX(camera->SA2_LABEL(unk48), 0);
        }

        if ((camera->SA2_LABEL(unk14) - newY) > camera->SA2_LABEL(unk48)) {
            newY += (camera->SA2_LABEL(unkC) > ((camera->SA2_LABEL(unk14) - newY) - camera->SA2_LABEL(unk48)))
                ? ((camera->SA2_LABEL(unk14) - newY) - camera->SA2_LABEL(unk48))
                : camera->SA2_LABEL(unkC);
        } else if ((camera->SA2_LABEL(unk14) - newY) < -(camera->SA2_LABEL(unk48))) {
            newY += (-camera->SA2_LABEL(unkC) < (camera->SA2_LABEL(unk14) - newY) + camera->SA2_LABEL(unk48))
                ? (camera->SA2_LABEL(unk14) - newY) + camera->SA2_LABEL(unk48)
                : -camera->SA2_LABEL(unkC);
        }

        newY = CLAMP(newY, camera->minY, camera->maxY - DISPLAY_HEIGHT);

        // maybe a macro, these values are already clamped
        newX = CLAMP(newX, camera->minX, camera->maxX - DISPLAY_WIDTH);
        newY = CLAMP(newY, camera->minY, camera->maxY - DISPLAY_HEIGHT);
        newX = newX + camera->shakeOffsetX;
        newY = newY + camera->shakeOffsetY;
    }

    // TODO: CAMERA_SET_POS macro
    camera->x = newX;
    camera->y = newY;
#if (GAME == GAME_SA2)
    camera->dx -= newX;
    camera->dy -= newY;
#endif

    RenderMetatileLayers(newX, newY);

    if (camera->fnBgUpdate != NULL) {
        camera->fnBgUpdate(newX, newY);
    }
}

void RenderMetatileLayers(s32 x, s32 y)
{
    Background *layer;
#if (GAME == GAME_SA1)
    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        s32 scrollX = (x + gStageTime * 8);
        // 2688(0xA80) =
        //          3072         -          600
        // Moon Zone Pixel Width - (4 * Metatile_Width)
        const s32 scrollMaxX = (28 * 96);

        if (scrollX - 72 >= scrollMaxX) {
            scrollX -= 72;
            scrollX = Mod(scrollX, scrollMaxX) + 72;
        }

        x = scrollX;
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            layer = &gStageBackgroundsRam.unk80;
            gBgScrollRegs[0][0] = x % 8u;
            gBgScrollRegs[0][1] = y % 8u;
            layer->scrollX = x;
            layer->scrollY = y;
            DrawBackground(layer);
            return;
        }
    }
#endif

#ifndef COLLECT_RINGS_ROM
    if (!IS_EXTRA_STAGE(gCurrentLevel))
#endif
    {
        layer = &gStageBackgroundsRam.unk40;
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

#if (GAME == GAME_SA1)
#include "../src/game/sa1/stage/backgrounds/zone_1.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_2_interior.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_3.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_4.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_6.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_7_act_2.inc.c"
#elif (GAME == GAME_SA2)
#include "../src/game/sa2/stage/backgrounds/zone_1.inc.c"
#ifndef COLLECT_RINGS_ROM
#include "../src/game/sa2/stage/backgrounds/zone_2.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_3.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_4.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_5.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_6.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_7_init.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_8.inc.c"
#endif
#endif

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
    if (IS_EXTRA_STAGE(gCurrentLevel) && (gFlags & FLAGS_40)) {
        gIntrTable[INTR_INDEX_VCOUNT] = gIntrTableTemplate[INTR_INDEX_VCOUNT];
        gFlags &= ~FLAGS_40;
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

    gCurTask->main = Task_UpdateCamera;
}

void Task_UpdateCamera(void)
{
    UpdateCamera();
    // At the start of each frame in the stage we reset the oam matrix index
    // so that when sprites are drawn they can be given a "unique" oam matrix index
    // for effects
    //
    // Throuthout the codebase you'll see it's usage with frameFlags = gOamMatrixIndex++
    gOamMatrixIndex = 4;
}

#if (GAME == GAME_SA2)
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
#endif

#if (GAME == GAME_SA1)
#include "../src/game/sa1/stage/backgrounds/zone_4_init.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_5_init.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_7.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_2.inc.c"
#include "../src/game/sa1/stage/backgrounds/zone_5.inc.c"
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
#include "../src/game/sa2/stage/backgrounds/zone_1_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_2_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_3_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_5_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_6_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_7.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_final_boss.inc.c"
#include "../src/game/sa2/stage/backgrounds/zone_extra_boss.inc.c"
#endif
#endif

// TODO: extract these as camera_utils?
#if (GAME == GAME_SA1)
void VBlankCallback_803F920(void) { *(vu32 *)&REG_BG1HOFS = 0; }

void HBlankCallback_803F92C(int_vcount line)
{
    s32 newLine = line - 90;

    if ((newLine >= 0) && (line != DISPLAY_HEIGHT - 1)) {
        u32 *ptr = gBgOffsetsHBlankSecondary;
        ptr += 90;

        *(vu32 *)&REG_BG1HOFS = ptr[newLine];
    } else {
        *(vu32 *)&REG_BG1HOFS = 0;
    }
}
#endif

UNUSED void SA2_LABEL(sub_801E3F0)(void)
{
    Camera *cam = &gCamera;

    if (gStageTime & 0x1) {
        cam->shiftY = ((u32)(PseudoRandom32() & 0x70000) >> 16) - 8;
    }
}

#if (GAME == GAME_SA1)
// Not sure why this is defined here
struct Task *SpawnCasinoFireworkMP(s16 x, s16 y, s32 fireworkType)
{
    const TileInfoFirework *tileInfo = &gTileInfoZone3Fireworks[fireworkType % ARRAY_COUNT(gTileInfoZone3Fireworks)];
    CasinoParadiseFirework *firework;
    struct Task *t;
    Sprite *s;

    t = CreateMultiplayerSpriteTask(x, y, 0, 0, Task_UpdateFireworkAnimation, TaskDestructor_MultiplayerSpriteTask);
    firework = TASK_DATA(t);
    s = &firework->s;

    s->graphics.dest = VramMalloc(tileInfo->numTiles);
    s->graphics.anim = tileInfo->anim;
    s->variant = tileInfo->variant;
    s->oamFlags = SPRITE_OAM_ORDER(31);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 3);

    return t;
}

void HBlankCallback_803FA1C(int_vcount line)
{
    if (line == 100) {
        REG_BG0CNT &= ~BGCNT_TXT512x512;
        REG_BG0CNT |= BGCNT_TXT256x512;
        *(u32 *)&REG_BG0HOFS = (0 | (DISPLAY_HEIGHT << 16));
    } else if (line > 101 && line < 134) {
        REG_BLDY = 16 - ((line - 101) >> 1);
    }
}
#elif (GAME == GAME_SA2)
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
        u16 *p = &((u16 *)gBgOffsetsHBlankSecondary)[vcount * 2], *q;
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
#endif
