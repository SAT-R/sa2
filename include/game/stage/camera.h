#ifndef GUARD_GAME_STAGE_CAMERA_H
#define GUARD_GAME_STAGE_CAMERA_H

#include "global.h"
#include "core.h"

#include "game/sa1_sa2_shared/camera.h"

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

extern const Background gStageCameraBgTemplates[4];

void InitCamera(u32);
void UpdateCamera(void);
void DestroyCameraMovementTask(void);

extern const Collision *gRefCollision;

extern const u16 gBossCameraYClamps[][2];

extern struct Backgrounds gStageBackgroundsRam;

#endif // GUARD_GAME_STAGE_CAMERA_H
