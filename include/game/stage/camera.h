#ifndef GUARD_GAME_STAGE_CAMERA_H
#define GUARD_GAME_STAGE_CAMERA_H

#include "global.h"
#include "core.h"

#include "game/sa1_leftovers/camera.h"

#define CAMBG_MAP_FRONT_LAYER 0
#define CAMBG_MAP_BACK_LAYER  1
#define CAMBG_BACK_A_LAYER    2
#define CAMBG_BACK_B_LAYER    3

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern const Background gStageCameraBgTemplates[4];

void UpdateCamera(void);

extern const Collision *gRefCollision;

extern const u16 gUnknown_080D5964[][2];

extern struct Backgrounds gStageBackgroundsRam;

#endif // GUARD_GAME_STAGE_CAMERA_H
