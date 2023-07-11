#include "global.h"
#include "core.h"

#include "sprite.h"

#include "constants/animations.h"

extern const u8 CollHeightMap_zone_1_act_1_fg[];
extern const u8 CollTileRot_zone_1_act_1_fg[];
extern const u8 CollFlags_zone_1_act_1_fg[];

asm(".section .rodata");

extern const Collision CollHeader_zone_1_act_1_fg;
extern const Collision CollHeader_zone_1_act_2_fg;
extern const Collision CollHeader_zone_1_act_boss_fg;
extern const Collision CollHeader_zone_1_act_dummy_fg;
extern const Collision CollHeader_zone_2_act_1_fg;
extern const Collision CollHeader_zone_2_act_2_fg;
extern const Collision CollHeader_zone_2_act_boss_fg;
extern const Collision CollHeader_zone_3_act_1_fg;
extern const Collision CollHeader_zone_3_act_2_fg;
extern const Collision CollHeader_zone_3_act_boss_fg;
extern const Collision CollHeader_zone_4_act_1_fg;
extern const Collision CollHeader_zone_4_act_2_fg;
extern const Collision CollHeader_zone_4_act_boss_fg;
extern const Collision CollHeader_zone_5_act_1_fg;
extern const Collision CollHeader_zone_5_act_2_fg;
extern const Collision CollHeader_zone_5_act_boss_fg;
extern const Collision CollHeader_zone_6_act_1_fg;
extern const Collision CollHeader_zone_6_act_2_fg;
extern const Collision CollHeader_zone_6_act_boss_fg;
extern const Collision CollHeader_zone_7_act_1_fg;
extern const Collision CollHeader_zone_7_act_2_fg;
extern const Collision CollHeader_zone_7_act_boss_fg;
extern const Collision CollHeader_zone_final_act_xx_fg;
extern const Collision CollHeader_zone_final_act_ta53_fg;
extern const Collision CollHeader_zone_final_act_unused_fg;

const Collision *const gCollisionTable[] = {
    &CollHeader_zone_1_act_1_fg,          &CollHeader_zone_1_act_2_fg,
    &CollHeader_zone_1_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_2_act_1_fg,          &CollHeader_zone_2_act_2_fg,
    &CollHeader_zone_2_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_3_act_1_fg,          &CollHeader_zone_3_act_2_fg,
    &CollHeader_zone_3_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_4_act_1_fg,          &CollHeader_zone_4_act_2_fg,
    &CollHeader_zone_4_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_5_act_1_fg,          &CollHeader_zone_5_act_2_fg,
    &CollHeader_zone_5_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_6_act_1_fg,          &CollHeader_zone_6_act_2_fg,
    &CollHeader_zone_6_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_7_act_1_fg,          &CollHeader_zone_7_act_2_fg,
    &CollHeader_zone_7_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_final_act_xx_fg,     &CollHeader_zone_final_act_ta53_fg,
    &CollHeader_zone_final_act_unused_fg,
};

// Like TileInfo
const u16 sAnimData_StageGoalScoreBonus[5][3] = {
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
