#include "global.h"
#include "constants/zones.h"

ALIGNED(4)
const s16 gSpawnPositions[][2] = {
    // Zone 1
    [LEVEL_INDEX(ZONE_1, ACT_1)] = { 96, 655 },
    [LEVEL_INDEX(ZONE_1, ACT_2)] = { 96, 750 },
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = { 576, 175 },
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = { 32, 150 },

    // Zone 2
    [LEVEL_INDEX(ZONE_2, ACT_1)] = { 96, 321 },
    [LEVEL_INDEX(ZONE_2, ACT_2)] = { 96, 321 },
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = { 96, 177 },
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = { 0, 0 },

    // Zone 3
    [LEVEL_INDEX(ZONE_3, ACT_1)] = { 96, 465 },
    [LEVEL_INDEX(ZONE_3, ACT_2)] = { 96, 369 },
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = { 356, 177 },
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = { 0, 0 },

    // Zone 4
    [LEVEL_INDEX(ZONE_4, ACT_1)] = { 96, 273 },
    [LEVEL_INDEX(ZONE_4, ACT_2)] = { 96, 1041 },
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = { 356, 177 },
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = { 0, 0 },

    // Zone 5
    [LEVEL_INDEX(ZONE_5, ACT_1)] = { 96, 3921 },
    [LEVEL_INDEX(ZONE_5, ACT_2)] = { 96, 3441 },
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = { 96, 180 },
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = { 0, 0 },

    // Zone 6
    [LEVEL_INDEX(ZONE_6, ACT_1)] = { 96, 1425 },
    [LEVEL_INDEX(ZONE_6, ACT_2)] = { 96, 2097 },
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = { 480, 177 },
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = { 0, 0 },

    // Zone 7
    [LEVEL_INDEX(ZONE_7, ACT_1)] = { 96, 561 },
    [LEVEL_INDEX(ZONE_7, ACT_2)] = { 96, 273 },
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = { 96, 177 },
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = { 0, 0 },

    // Extra Zone
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = { 576, 177 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = { 96, 96 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = { 0, 0 },

    // Unused
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = { 0, 0 },
};

const Vec2_32 gCheckpointPositions[] = {
    // Zone 1
    [LEVEL_INDEX(ZONE_1, ACT_1)] = { 8882, 1809 },
    [LEVEL_INDEX(ZONE_1, ACT_2)] = { 8206, 1233 },
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = { 0, 0 },

    // Zone 2
    [LEVEL_INDEX(ZONE_2, ACT_1)] = { 14618, 2577 },
    [LEVEL_INDEX(ZONE_2, ACT_2)] = { 11065, 2769 },
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = { 0, 0 },

    // Zone 3
    [LEVEL_INDEX(ZONE_3, ACT_1)] = { 13645, 3105 },
    [LEVEL_INDEX(ZONE_3, ACT_2)] = { 13450, 1953 },
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = { 0, 0 },

    // Zone 4
    [LEVEL_INDEX(ZONE_4, ACT_1)] = { 11952, 2289 },
    [LEVEL_INDEX(ZONE_4, ACT_2)] = { 10320, 1474 },
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = { 0, 0 },

    // Zone 5
    [LEVEL_INDEX(ZONE_5, ACT_1)] = { 5784, 2673 },
    [LEVEL_INDEX(ZONE_5, ACT_2)] = { 10296, 1713 },
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = { 0, 0 },

    // Zone 6
    [LEVEL_INDEX(ZONE_6, ACT_1)] = { 14064, 1809 },
    [LEVEL_INDEX(ZONE_6, ACT_2)] = { 11280, 1041 },
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = { 0, 0 },

    // Zone 7
    [LEVEL_INDEX(ZONE_7, ACT_1)] = { 20667, 3489 },
    [LEVEL_INDEX(ZONE_7, ACT_2)] = { 18456, 3441 },
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = { 0, 0 },

    // Extra Zone
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = { 96, 849 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = { 96, 96 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = { 0, 0 },

    // Unused
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = { 0, 0 },
};

const Vec2_32 gUnknown_080D650C[] = {
    // Zone 1
    [LEVEL_INDEX(ZONE_1, ACT_1)] = { 19488, -1 },
    [LEVEL_INDEX(ZONE_1, ACT_2)] = { 18816, -1 },
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = { 5376, -1 },
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = { -1, -1 },

    // Zone 2
    [LEVEL_INDEX(ZONE_2, ACT_1)] = { 27073, -1 },
    [LEVEL_INDEX(ZONE_2, ACT_2)] = { 24193, -1 },
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = { 6816, -1 },
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = { -1, -1 },

    // Zone 3
    [LEVEL_INDEX(ZONE_3, ACT_1)] = { 24961, -1 },
    [LEVEL_INDEX(ZONE_3, ACT_2)] = { 26401, -1 },
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = { 3552, -1 },
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = { -1, -1 },

    // Zone 4
    [LEVEL_INDEX(ZONE_4, ACT_1)] = { 27552, -1 },
    [LEVEL_INDEX(ZONE_4, ACT_2)] = { 21312, -1 },
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = { 4416, -1 },
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = { -1, -1 },

    // Zone 5
    [LEVEL_INDEX(ZONE_5, ACT_1)] = { 16224, -1 },
    [LEVEL_INDEX(ZONE_5, ACT_2)] = { 20064, -1 },
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = { 5376, -1 },
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = { -1, -1 },

    // Zone 6
    [LEVEL_INDEX(ZONE_6, ACT_1)] = { 29760, -1 },
    [LEVEL_INDEX(ZONE_6, ACT_2)] = { 21120, -1 },
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = { 8258, -1 },
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = { -1, -1 },

    // Zone 7
    [LEVEL_INDEX(ZONE_7, ACT_1)] = { 33505, -1 },
    [LEVEL_INDEX(ZONE_7, ACT_2)] = { 32449, -1 },
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = { 4512, -1 },
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = { -1, -1 },

    // Extra Zone
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = { -1, -1 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = { 8000, -1 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = { 0, 0 },

    // Unused
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = { 0, 0 },
};

const Vec2_32 gUnknown_080D661C[] = {
    // Zone 1
    [LEVEL_INDEX(ZONE_1, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_1, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = { -4512, 0 },
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = { 0, 0 },

    // Zone 2
    [LEVEL_INDEX(ZONE_2, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_2, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = { -5952, 0 },
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = { 0, 0 },

    // Zone 3
    [LEVEL_INDEX(ZONE_3, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_3, ACT_2)] = { -959, 0 },
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = { -2688, 0 },
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = { 0, 0 },

    // Zone 4
    [LEVEL_INDEX(ZONE_4, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_4, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = { -3552, 0 },
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = { 0, 0 },

    // Zone 5
    [LEVEL_INDEX(ZONE_5, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_5, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = { -4512, 0 },
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = { 0, 0 },

    // Zone 6
    [LEVEL_INDEX(ZONE_6, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_6, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = { -7394, 0 },
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = { 0, 0 },

    // Zone 7
    [LEVEL_INDEX(ZONE_7, ACT_1)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_7, ACT_2)] = { -960, 0 },
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = { -3648, 0 },
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = { 0, 0 },

    // Extra Zone
    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = { -6000, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_BOSS)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_FINAL, ACT_UNUSED)] = { 0, 0 },

    // Unused
    [LEVEL_INDEX(ZONE_UNUSED, ACT_1)] = { 0, 0 },
    [LEVEL_INDEX(ZONE_UNUSED, ACT_2)] = { 0, 0 },
};
