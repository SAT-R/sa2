#ifndef GUARD_UNDERWATER_EFFECTS_H
#define GUARD_UNDERWATER_EFFECTS_H

#include "core.h"
#include "game/sa1_sa2_shared/player.h"

struct Task *SpawnDrowningCountdownNum(Player *p, s32 countdown);
struct Task *SpawnAirBubbles(s32 p0, s32 p1, s32 p2, s32 p3);
struct Task *SpawnBubblesAfterDrowning(Player *p);
bool32 RandomlySpawnAirBubbles(Player *p);

extern u8 gSmallAirBubbleCount;

#endif // GUARD_UNDERWATER_EFFECTS_H
