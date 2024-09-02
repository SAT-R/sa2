#ifndef GUARD_BRAKE_DUST_CLOUD_H
#define GUARD_BRAKE_DUST_CLOUD_H

#include "core.h"

struct Task *CreateBrakingDustEffect(s32, s32);
void CreateBrakingDustEffectRelatedTask(void);
void DestroyBrakingDustEffectRelatedTask(void);

typedef struct {
    s8 unk0;
    u8 filler1[3];
    struct Task *t;
} UNK_30059D0;

extern UNK_30059D0 gUnknown_030059D0;

#endif // GUARD_BRAKE_DUST_CLOUD_H