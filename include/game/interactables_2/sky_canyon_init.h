#ifndef GUARD_SKY_CANYON_INIT_H
#define GUARD_SKY_CANYON_INIT_H

#include "global.h"
#include "task.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ Sprite spring;
    /* 0x30 */ Sprite propellor;
    /* 0x60 */ u16 unk60;
    /* 0x62 */ u16 unk62;
} Sprite_OnInit_SkyCanyon;

struct Task *sub_80807CC(void);

#endif
