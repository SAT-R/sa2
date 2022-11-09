#ifndef GUARD_SPECIAL_STAGE_H
#define GUARD_SPECIAL_STAGE_H

#include "global.h"
#include "sprite.h"
#include "transition.h"

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
    struct Task* unk0; // UNK_806F910
    struct Task* unk4; // UNK_806E6E8
    struct Task* unk8; // UNK_806BD94

    struct Task* playerTask;

    // uiTask?
    struct Task* unk10; // UNK_8070B90 or UNK_8070BF0

    struct Task* guardRoboTask;
    struct UNK_0808B3FC_UNK240 unk18;
    struct Unk_03002400 unk48;
    struct UNK_802D4CC_UNK270 unk88;
    s32 unk94[DISPLAY_HEIGHT][2];
    s32 cameraX;
    s32 cameraY;
    s32 unk59C;

    u16 cameraBearing;
    s16 animFrame;

    s16 rings;
    s16 ringsTarget;

    s32 unk5A8;
    s32 unk5AC;
    s32 unk5B0;

    u16 unk5B4;

    u8 character;
    
    bool8 unk5B7;

    u8 zone;

    u8 level;
    bool8 paused;

    s8 unk5BB;
    s8 unk5BC;
    s8 unk5BD;
    s8 unk5BE;

    s8 ringsHundreds;
    s8 ringsTens;
    s8 ringsUnits;

    s8 ringsTargetHundreds;
    s8 ringsTargetTens;
    s8 ringsTargetUnits;

    s8 unk5C5;
    u8 unk5C6;

    s8 unk5C7;
    s8 unk5C8;

    s16 unk5CA;
    s16 unk5CC;
    u16 unk5CE;
    u8 unk5D0;
    u8 unk5D1;
    u8 unk5D2;
    u8 unk5D3;
    void* unk5D4;
}; /* size 0x5D8 */

struct UNK_806BD94_UNK874_2 {
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

void CreateSpecialStage(s16, s16);

#endif
