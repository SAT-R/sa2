#ifndef GUARD_BRAKE_DUST_CLOUD_H
#define GUARD_BRAKE_DUST_CLOUD_H

#include "core.h"

struct Task *CreateBrakingDustEffect(s32, s32);
void CreateBrakingDustEffectRelatedTask(void);
void DestroyBrakingDustEffectRelatedTask(void);

typedef struct {
    /* 0x00 */ u16 x;
    /* 0x02 */ u16 y;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ Sprite s;
} BrakeDustEffect;

typedef struct {
    s8 unk0;
    u8 filler1[3];
    struct Task *t; // -> BrakeDustEffect
} DustEffectBraking;

extern DustEffectBraking gDustEffectBrakingTask;

#endif // GUARD_BRAKE_DUST_CLOUD_H
