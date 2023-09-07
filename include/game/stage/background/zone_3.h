#ifndef GUARD_GAME_STAGE_BG_ZONE3_H
#define GUARD_GAME_STAGE_BG_ZONE3_H

#include "gba/types.h"

extern const u8 gUnknown_080D5B50[DISPLAY_HEIGHT];

extern void CreateStageBg_Zone3(void);
extern void StageBgUpdate_Zone3Acts12(s32 a, s32 b);
extern void StageBgUpdate_Zone3ActBoss(s32 a, s32 b);

#endif // GUARD_GAME_STAGE_BG_ZONE3_H