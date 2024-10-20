#ifndef GUARD_STAGE_RESULTS_H
#define GUARD_STAGE_RESULTS_H

#include "global.h"
#include "sprite.h"
#include "screen_fade.h"

typedef struct {
    /*  0x00 */ ScreenFade fade;
    /*  0x0C */ Sprite title[3];
    /*  0x9C */ Sprite sprScores[3];
    /* 0x12C */ Sprite separator;
    /* 0x15C */ u32 timeBonusScore;
    /* 0x160 */ u32 ringBonusScore;
    /* 0x164 */ u32 spRingBonusScore;
    /* 0x168 */ s32 counter; // frames since task started
    /* 0x16C */ s32 unk16C;
} StageResultsBase; /* size: 0x174 */

u16 CreateStageResults(u32, u16, u8);
void StageResults_AnimateSeparator(void);
void StageResults_AnimateTitle(void);

extern const u16 gAnimsGotThroughZoneAndActNames[][3];
extern const u16 gStageResultsHeadlineTexts[][3];
extern const u16 gAnimsGotThroughCharacterNames[][3];

#endif // GUARD_STAGE_RESULTS_H
