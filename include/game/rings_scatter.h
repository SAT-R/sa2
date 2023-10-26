#ifndef GUARD_SA2_RINGS_SCATTER_H
#define GUARD_SA2_RINGS_SCATTER_H

extern struct Task *gRingsScatterTask;

void InitPlayerHitRingsScatter(void);
void DestroyRingsScatterTask(void);

void InitScatteringRings(s32 x, s32 y, s32 numRings);

#endif // GUARD_SA2_RINGS_SCATTER_H
