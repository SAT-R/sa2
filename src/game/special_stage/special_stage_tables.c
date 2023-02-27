#include "global.h"
#include "game/special_stage/special_stage_tables.h"
#include "zones.h"

// bearing, acceleration, rotateSpeed, maxSpeed
const u16 gUnknown_080DF968[][4] = {
    { 128, 16, 12, 256 }, { 0, 32, 12, 304 },   { 768, 32, 12, 352 },
    { 512, 48, 12, 400 }, { 256, 48, 12, 448 }, { 900, 48, 12, 496 },
    { 256, 64, 12, 544 },
};

const s32 gSpecialStageGuardRoboStartPositions[][2] = {
    {
        Q_16_16(928),
        Q_16_16(928),
    },
    {
        Q_16_16(144),
        Q_16_16(736),
    },
    {
        Q_16_16(80),
        Q_16_16(600),
    },
    {
        Q_16_16(656),
        Q_16_16(656),
    },
    {
        Q_16_16(900),
        Q_16_16(144),
    },
    {
        Q_16_16(864),
        Q_16_16(864),
    },
    {
        Q_16_16(288),
        Q_16_16(144),
    },
};

const s16 gUnknown_080DF9D8[][3] = {
    { 96, 96, 640 },   { 300, 300, 512 }, { 230, 230, 640 }, { 220, 220, 900 },
    { 540, 540, 256 }, { 100, 400, 768 }, { 960, 800, 0 },
};

const s16 gSpecialStageScoreTargets[] = {
    300, 300, 300, 300, 300, 300, 300,
};
