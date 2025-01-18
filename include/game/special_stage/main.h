#ifndef GUARD_SPECIAL_STAGE_H
#define GUARD_SPECIAL_STAGE_H

#include "global.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"

#define SPECIAL_STAGE_ZONE_SIZE 8

#define MIN_SPECIAL_STAGE_PLAYER_X 48
#define MAX_SPECIAL_STAGE_PLAYER_X 976

#define MIN_SPECIAL_STAGE_PLAYER_Y 48
#define MAX_SPECIAL_STAGE_PLAYER_Y 976

#define MIN_SPECIAL_STAGE_GUARD_ROBO_X 42
#define MAX_SPECIAL_STAGE_GUARD_ROBO_X 982

#define MIN_SPECIAL_STAGE_GUARD_ROBO_Y 42
#define MAX_SPECIAL_STAGE_GUARD_ROBO_Y 982

struct SpecialStage {
    struct Task *physicsTask;
    struct Task *worldTask;
    struct Task *collectablesTask;
    struct Task *playerTask;
    struct Task *uiTask;
    struct Task *guardRoboTask;

    Sprite introText;
    Background unk48;
    ScreenFade fade;
    s32 unk94[DISPLAY_HEIGHT][2];
    s32 q16CameraX;
    s32 q16CameraY;
    s32 unk59C;

    u16 cameraRotX;
    s16 animFrame;

    s16 rings;
    s16 ringsTarget;

    s32 points;
    s32 bonusPoints;
    s32 finalScore;

    u16 state;

    u8 character;

    bool8 unk5B7;

    u8 zone;

    u8 level;
    bool8 paused;

    s8 timeHundreds;
    s8 timeTens;
    s8 timeUnits;
    s8 timeTicks;

    s8 ringsHundreds;
    s8 ringsTens;
    s8 ringsUnits;

    s8 ringsTargetHundreds;
    s8 ringsTargetTens;
    s8 ringsTargetUnits;

    s8 targetReached;
    u8 pauseMenuCursor;

    s8 unk5C7;
    s8 unk5C8;

    s16 cameraOriginX;
    s16 cameraHeight;
    u16 worldScale;
    u8 cameraPitch;
    u8 horizonHeight;
    u8 viewDistance;
    u8 unk5D3;
    void *screenVram;
}; /* size 0x5D8 */

struct SpecialStageCollectables_UNK874_2 {
    u32 unk0;
    u32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
}; /* size 0x14 */

struct UNK_806CB84 {
    u8 unk0[2];
    s16 screenX;
    s16 screenY;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
};

void CreateSpecialStage(s16 selectedCharacter, s16 level);

#endif
