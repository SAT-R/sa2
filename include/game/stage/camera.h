#ifndef GUARD_GAME_STAGE_CAMERA_H
#define GUARD_GAME_STAGE_CAMERA_H

#include "global.h"
#include "core.h"

#include "sakit/camera.h"

extern const Background gStageCameraBgTemplates[4];

void UpdateCamera(void);

// TODO: Collision
extern const u32 *gUnknown_030059C8;

extern const u16 gUnknown_080D5964[][2];

#endif // GUARD_GAME_STAGE_CAMERA_H
