#ifndef GUARD_GAME_STAGE_BG_ZONE3_H
#define GUARD_GAME_STAGE_BG_ZONE3_H

#include "gba/types.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ u8 filler08[0x10];
    /* 0x18 */ Sprite s;
} CasinoParadiseFirework;

extern const TileInfoFirework gTileInfoZone3Fireworks[2];

extern void CreateStageBg_Zone5(void);
extern void StageBgUpdate_Zone5Acts12(s32 x, s32 y);
extern Task *SpawnCasinoFireworkMP(s16 x, s16 y, s32 fireworkType);
extern void Task_UpdateFireworkAnimation(void);

#endif // GUARD_GAME_STAGE_BG_ZONE3_H