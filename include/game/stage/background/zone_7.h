#ifndef GUARD_GAME_STAGE_BG_ZONE7_H
#define GUARD_GAME_STAGE_BG_ZONE7_H

#include "gba/types.h"

extern const s16 gUnknown_080D5C62[8][2];
extern const u16 gUnknown_080D5C82[16];

extern void CreateStageBg_Zone7(void);
extern void StageBgUpdate_Zone7Acts12(s32, s32);
extern void StageBgUpdate_Zone7ActBoss(s32, s32);
extern void Zone7BgUpdate_Inside(s32, s32);
extern void Zone7BgUpdate_Outside(s32, s32);

#endif // GUARD_GAME_STAGE_BG_ZONE7_H