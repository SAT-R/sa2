#include "global.h"

#include "sprite.h"

#include "constants/animations.h"

asm(".section .rodata");

// As denoted in tilemaps.h:
// - starts with MapHeaders (0-92)
// - then one NULL value (93)
// - then various background tilemaps (94-380)
asm("    .global gTilemaps\n"
    "gTilemaps:\n"
    "  .4byte MapHeader_LeafForest_Act1_FrontLayer, "
    "MapHeader_LeafForest_Act1_BackLayer, 0x08935224\n"
    "    .incbin \"baserom.gba\", 0x000D5CF0, 0x5E8\n");

asm("    .global gCollisionTable\n"
    "gCollisionTable:\n"
    "    .4byte gUnknown_08714578, gUnknown_0873A414, gUnknown_0873C0FC\n"
    "    .incbin \"baserom.gba\", 0x000D62E4, 0x70\n");

// Like AnimInfo
const unsigned short sAnimData_StageGoalScoreBonus[5][3] = {
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 1 },
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 2 },
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 3 },
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 4 },
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 5 },
};

ALIGNED(4)
const s16 gSpawnPositions[34][2] = {
    { 96, 655 },  { 96, 750 },  { 576, 175 }, { 32, 150 }, // Zone 1
    { 96, 321 },  { 96, 321 },  { 96, 177 },  { 0, 0 }, // Zone 2
    { 96, 465 },  { 96, 369 },  { 356, 177 }, { 0, 0 }, // Zone 3
    { 96, 273 },  { 96, 1041 }, { 356, 177 }, { 0, 0 }, // Zone 4
    { 96, 3921 }, { 96, 3441 }, { 96, 180 },  { 0, 0 }, // Zone 5
    { 96, 1425 }, { 96, 2097 }, { 480, 177 }, { 0, 0 }, // Zone 6
    { 96, 561 },  { 96, 273 },  { 96, 177 },  { 0, 0 }, // Zone 7
    { 576, 177 }, { 96, 96 },   { 0, 0 },     { 0, 0 }, // Extra Zone
    { 0, 0 },     { 0, 0 },
};

const u32 gUnknown_080D63FC[34][2] = {
    { 8882, 1809 },  { 8206, 1233 },  { 0, 0 },        { 0, 0 },        { 14618, 2577 },
    { 11065, 2769 }, { 0, 0 },        { 0, 0 },        { 13645, 3105 }, { 13450, 1953 },
    { 0, 0 },        { 0, 0 },        { 11952, 2289 }, { 10320, 1474 }, { 0, 0 },
    { 0, 0 },        { 5784, 2673 },  { 10296, 1713 }, { 0, 0 },        { 0, 0 },
    { 14064, 1809 }, { 11280, 1041 }, { 0, 0 },        { 0, 0 },        { 20667, 3489 },
    { 18456, 3441 }, { 0, 0 },        { 0, 0 },        { 96, 849 },     { 96, 96 },
    { 0, 0 },        { 0, 0 },        { 0, 0 },        { 0, 0 },
};

asm(".section .text");
