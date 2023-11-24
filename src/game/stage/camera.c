#include "global.h"
#include "core.h"
#include "sprite.h"
#include "animation_commands_bg.h"

#include "sakit/globals.h"

#include "game/stage/camera.h"
#include "game/stage/player.h"
#include "game/stage/background/dummy.h"
#include "game/stage/background/zone_1.h"
#include "game/stage/background/zone_2.h"
#include "game/stage/background/zone_3.h"
#include "game/stage/background/zone_4.h"
#include "game/stage/background/zone_5.h"
#include "game/stage/background/zone_6.h"
#include "game/stage/background/zone_7.h"
#include "game/stage/background/zone_final.h"

#include "constants/tilemaps.h"
#include "constants/zones.h"
#include "constants/game_modes.h"
#include "constants/characters.h"

// TODO: move to right place
struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern struct Backgrounds gStageBackgroundsRam;

extern const CameraMain sStageBgUpdateFuncs[];
extern const u32 *gCollisionTable[NUM_LEVEL_IDS];

static void sub_801C708(s32, s32);
void Task_801E0A8(void);
void TaskDestructor_801E040(struct Task *);

extern void sub_802C668(s32 *x, s32 *y);

#define BOSS_CAM_FRAME_DELTA_PIXELS 5

const Background gStageCameraBgTemplates[4] = {
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(30),
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
        .flags = BACKGROUND_FLAG_IS_LEVEL_MAP | BACKGROUND_FLAG_20 | BACKGROUND_UPDATE_PALETTE | BACKGROUND_UPDATE_GRAPHICS | BACKGROUND_FLAGS_BG_ID(1),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(31),
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
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_SCREEN_ADDR(16),  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(29),
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
        .flags = BACKGROUND_UPDATE_PALETTE | BACKGROUND_FLAGS_BG_ID(3),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_CHAR_ADDR(3),  
            .size = 0,  
            .anim = 0,
        },
        .layoutVram = (void*)BG_SCREEN_ADDR(28),
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
        .flags = BACKGROUND_UPDATE_PALETTE | BACKGROUND_FLAGS_BG_ID(0),
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .metatileMap = NULL,
        .mapWidth = 0,
        .mapHeight = 0,
    },
};

const u16 gUnknown_080D5964[][2]
    = { { 32, 216 }, { 32, 204 }, { 32, 216 }, { 32, 208 }, { 32, 208 },
        { 32, 232 }, { 32, 264 }, { 32, 264 }, { 32, 264 } };

static const VoidFn sStageBgInitProcedures[] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = CreateStageBg_Zone1,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = NULL, // Anti-Formatting
    [LEVEL_INDEX(ZONE_2, ACT_1)] = CreateStageBg_Zone2,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = CreateStageBg_Zone2,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = CreateStageBg_Zone2,
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
};

static const CameraMain sStageBgUpdateFuncs[NUM_LEVEL_IDS] = {
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
};

static const s8 gUnknown_080D5A98[NUM_LEVEL_IDS][4] = {
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 64, 2, 28 }, //
    { 32, 64, 2, 28 }, //
    { 32, 64, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 64, 2, 28 }, //
    { 32, 64, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 64, 2, 28 }, //
    { 64, 32, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 32, 32, 2, 29 }, //
    { 32, 64, 2, 28 }, //
    { 32, 32, 2, 29 }, //
    { 64, 32, 2, 28 }, //
};

void InitCamera(u32 level)
{
    s32 x;
    u32 temp;

    struct Backgrounds *bgs;
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    const s8 *unkA98 = gUnknown_080D5A98[level];

    gDispCnt = 0x3E40;
    if (level == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gDispCnt = 0x3741;
    }

    gBgCntRegs[1]
        = (BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(1));
    gBgCntRegs[2]
        = (BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(2));
    temp = ((unkA98[0] + 0x1F) >> 6 | ((unkA98[1] + 0x1F) >> 6) << 1) << 0xE;
    gBgCntRegs[3] = temp | 3 | (unkA98[3] << 8) | (unkA98[2] << 2);

    if (level == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gDispCnt = 0x3641;
    }

    bgs = &gStageBackgroundsRam;
    memcpy(&gStageBackgroundsRam.unk40, &gStageCameraBgTemplates[0], sizeof(Background));
    bgs->unk40.tilemapId = TM_LEVEL_METATILES_0(level);

    memcpy(&gStageBackgroundsRam.unk80, &gStageCameraBgTemplates[1], sizeof(Background));
    bgs->unk80.tilemapId = TM_LEVEL_METATILES_1(level);

    memcpy(&gStageBackgroundsRam.unkC0, &gStageCameraBgTemplates[2], sizeof(Background));
    bgs->unkC0.tilemapId = TM_LEVEL_BG(level);

    bgs->unkC0.graphics.dest = (void *)BG_CHAR_ADDR(unkA98[2]);
    bgs->unkC0.layoutVram = (void *)BG_SCREEN_ADDR(unkA98[3]);
    bgs->unkC0.targetTilesX = unkA98[0];
    bgs->unkC0.targetTilesY = unkA98[1];

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

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        bgs->unk40.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_UPDATE_GRAPHICS;
        bgs->unk80.flags |= BACKGROUND_UPDATE_ANIMATIONS | BACKGROUND_UPDATE_GRAPHICS;
    }

    if (level != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        InitBackground(&bgs->unk40);
        InitBackground(&bgs->unk80);
        InitBackground(&bgs->unkC0);
    }

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gUnknown_030059C8 = gCollisionTable[level];
    } else {
        gUnknown_030059C8 = *(u32 **)(EWRAM_START + 0x33004);
    }

    camera->unk28 = 0;
    camera->unk2C = gUnknown_030059C8[8];
    camera->unk30 = 0;
    camera->unk34 = gUnknown_030059C8[7];

    if (((gCurrentLevel & ACTS_PER_ZONE) == ACT_BOSS)
        || ((gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
            && (gUnknown_030054B0 == 0))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_802C668(&player->x, &player->y);
            gUnknown_03005440 = gUnknown_080D5964[LEVEL_TO_ZONE(0x20)][0];
            gUnknown_030054BC = gUnknown_080D5964[LEVEL_TO_ZONE(0x20)][1];
            camera->x = 600;
            camera->unk10 = 0x78;
            camera->unk14 = 0;
            camera->y = 0;
            camera->unk64 = 0xFFFC;
        } else {
            camera->x = Q_24_8_TO_INT(player->x);
            camera->unk10 = Q_24_8_TO_INT(player->x) - 0x1E0;
            camera->y = Q_24_8_TO_INT(player->y) - 0x54;
            camera->unk14 = camera->y;
            camera->unk64 = player->unk17 - 4;
        }
    } else {
        camera->x = Q_24_8_TO_INT(player->x) - 0x78;
        camera->y = Q_24_8_TO_INT(player->y) - 0x54;

        if (camera->x < 0) {
            camera->x = 0;
        }

        if (camera->y < 0) {
            camera->y = 0;
        }

        camera->unk10 = camera->x;
        camera->unk14 = camera->y;
        camera->unk64 = player->unk17 - 4;
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
    camera->unk60 = 0;
    camera->unk62 = 0;

    camera->movementTask = TaskCreate(Task_801E0A8, 0, 0xF00, 0, TaskDestructor_801E040);

    camera->unk58 = sStageBgUpdateFuncs[level];

    if (sStageBgInitProcedures[level] != NULL) {
        sStageBgInitProcedures[level]();
    }
}

void UpdateCamera(void)
{
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    s32 newX, newY;
    newX = camera->x;
    newY = camera->y;
    camera->unk38 = newX;
    camera->unk3C = newY;

    newX = CLAMP(newX, camera->unk30, camera->unk34 - (DISPLAY_WIDTH + 1));
    newY = CLAMP(newY, camera->unk28, camera->unk2C - (DISPLAY_HEIGHT + 1));

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 delta, playerY;
        if (player->moveState & MOVESTATE_DEAD) {
            if (camera->unk58 != NULL) {
                camera->unk58(gCamera.x, gCamera.y);
            }
            return;
        }

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_802C668(&player->x, &player->y);
        }

        camera->unk10 += BOSS_CAM_FRAME_DELTA_PIXELS;
        newX += BOSS_CAM_FRAME_DELTA_PIXELS;

        if (newX + ((DISPLAY_WIDTH / 2) + 1) < Q_24_8_TO_INT(player->x)) {
            if ((camera->unk10 + (DISPLAY_HEIGHT / 2)) > newX) {
                s32 temp = Q_24_8_TO_INT(player->x);
                temp -= DISPLAY_WIDTH / 2;
                camera->shiftX = temp - newX;
            } else {
                newX = (camera->unk10 + (DISPLAY_HEIGHT / 2));
                camera->shiftX = 0;
            }
        } else {
            camera->shiftX = 0;
            if ((newX + 96) > Q_24_8_TO_INT(player->x)) {
                newX = Q_24_8_TO_INT(player->x);
                newX -= 96;
                if (newX < camera->unk10) {
                    newX = camera->unk10;
                }
            }
        }

        playerY = Q_24_8_TO_INT(player->y);
        delta = playerY - newY;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            if (delta < 49) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else if (delta >= (gUnknown_030054BC - 208)) {
                s32 temp = newY - 112;
                newY = delta + temp;
                camera->shiftY = 0;
            }
        } else {
            if (delta < 49) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else {
                newY += 2;
            }
        }
        newY = CLAMP(newY, gUnknown_03005440, gUnknown_030054BC - DISPLAY_HEIGHT);

        newX = newX + camera->shiftX;
        newY = newY + camera->shiftY;
        newX += camera->unk60;
        newY += camera->unk62;

    } else {
        if (camera->unk40 != 0) {
            camera->unk40--;
        } else {
            if (!(camera->unk50 & 1)) {
                s16 airSpeedX = player->speedAirX;
                camera->unk10
                    = Q_24_8_TO_INT(player->x) + camera->shiftX - (DISPLAY_WIDTH / 2);
                camera->unk56 = (airSpeedX + (camera->unk56 * 15)) >> 4;
                camera->unk10 += (camera->unk56 >> 5);
            }
            if (!(camera->unk50 & 2)) {
                s32 unk64 = camera->unk64;
                s32 temp8 = player->unk17 - 4;
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

                camera->unk14 = Q_24_8_TO_INT(player->y) + camera->shiftY
                    - (DISPLAY_HEIGHT / 2) + camera->unk4C + unk64;
            }
        }

        if ((camera->unk10 - newX) > camera->unk44) {
            s32 temp = camera->unk10 - newX - camera->unk44;
            s32 temp2 = Q_24_8_TO_INT(camera->unk8);
            if (temp2 > temp) {
                temp2 = temp;
            }
            newX += temp2;
        } else if ((camera->unk10 - newX) < -camera->unk44) {
            s32 temp = (camera->unk10 - newX) + camera->unk44;
            s32 temp2 = -Q_24_8_TO_INT(camera->unk8);
            if (temp2 < temp) {
                temp2 = temp;
            }

            newX += temp2;
        }

        newX = CLAMP(newX, camera->unk30, camera->unk34 - DISPLAY_WIDTH);

        if (camera->unk8 < Q_24_8(16)) {
            camera->unk8 += Q_24_8(0.125);
        }

        if ((player->moveState & 2)
            && (player->character != CHARACTER_KNUCKLES || player->unk61 != 9)) {
            camera->unk48 += 4;
            camera->unk48 = camera->unk48 > 24 ? 24 : camera->unk48;
        } else {
            camera->unk48 -= 4;
            camera->unk48 = camera->unk48 < 0 ? 0 : camera->unk48;
        }

        if ((camera->unk14 - newY) > camera->unk48) {
            newY += (camera->unkC > ((camera->unk14 - newY) - camera->unk48))
                ? ((camera->unk14 - newY) - camera->unk48)
                : camera->unkC;
        } else if ((camera->unk14 - newY) < -(camera->unk48)) {
            newY += (-camera->unkC < (camera->unk14 - newY) + camera->unk48)
                ? (camera->unk14 - newY) + camera->unk48
                : -camera->unkC;
        }

        newY = CLAMP(newY, camera->unk28, camera->unk2C - DISPLAY_HEIGHT);

        // maybe a macro, these values are already clamped
        newX = CLAMP(newX, camera->unk30, camera->unk34 - DISPLAY_WIDTH);
        newY = CLAMP(newY, camera->unk28, camera->unk2C - DISPLAY_HEIGHT);
        newX = newX + camera->unk60;
        newY = newY + camera->unk62;
    }

    camera->x = newX;
    camera->y = newY;

    camera->unk38 -= newX;
    camera->unk3C -= newY;

    sub_801C708(newX, newY);

    if (camera->unk58 != NULL) {
        camera->unk58(newX, newY);
    }
}

static void sub_801C708(s32 x, s32 y)
{

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        Background *layer = &gStageBackgroundsRam.unk40;
        gBgScrollRegs[1][0] = x & 7;
        gBgScrollRegs[1][1] = y & 7;
        layer->scrollX = x;
        layer->scrollY = y;
        InitBackground(layer);
        UpdateBgAnimationTiles(layer);

        layer = &gStageBackgroundsRam.unk80;
        gBgScrollRegs[2][0] = x & 7;
        gBgScrollRegs[2][1] = y & 7;
        layer->scrollX = x;
        layer->scrollY = y;
        InitBackground(layer);
    }
}
