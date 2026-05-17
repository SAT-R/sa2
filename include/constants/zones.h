#ifndef GUARD_ZONES_H
#define GUARD_ZONES_H

#define ZONE_1 0
#define ZONE_2 1
#define ZONE_3 2
#define ZONE_4 3
#define ZONE_5 4
#define ZONE_6 5
#define ZONE_7 6
#if (GAME == GAME_SA1)
#define ZONE_FINAL ZONE_7
#else
#define ZONE_FINAL  7
#define ZONE_UNUSED 8
#endif

#define ACT_1 0
#define ACT_2 1
#if (GAME == GAME_SA1)
#define ACT_BOSS ACT_2
#elif (GAME == GAME_SA2)
#define ACT_BOSS   2
#define ACT_UNUSED 3
#elif (GAME == GAME_SA3)
#define ACT_BOSS 7
#endif

#if (GAME == GAME_SA1)
#define ACT_X_ZONE      ACT_1
#define ACT_THE_MOON    ACT_2
#define ACT_CHAO_HUNT_A (NUM_LEVEL_IDS_SP + 0)
#define ACT_CHAO_HUNT_B (NUM_LEVEL_IDS_SP + 1)
#define ACT_CHAO_HUNT_C (NUM_LEVEL_IDS_SP + 2)
#define ACT_CHAO_HUNT_D (NUM_LEVEL_IDS_SP + 3)
#elif (GAME == GAME_SA2)
#define ACT_XX_FINAL_ZONE ACT_1
#define ACT_TRUE_AREA_53  ACT_2
#endif

#if (GAME == GAME_SA1)
#define NUM_COURSE_ZONES      7
#define NUM_ANIMAL_ZONES      6 // # of zones where animals are trapped inside enemies
#define NUM_TIME_ATTACK_ZONES 6
#define ACTS_PER_ZONE         2
#define ACT_SLOTS_PER_ZONE    (ACTS_PER_ZONE)
#elif (GAME == GAME_SA2)
#define NUM_COURSE_ZONES      7
#define NUM_ANIMAL_ZONES      7 // # of zones where animals are trapped inside enemies
#define NUM_TIME_ATTACK_ZONES NUM_COURSE_ZONES
#define ACTS_PER_ZONE         3
#define ACT_SLOTS_PER_ZONE    (ACTS_PER_ZONE + 1)
#endif

#define LEVEL_INDEX(zone, act) ((zone)*ACT_SLOTS_PER_ZONE) + (act)
#define ACT_INDEX(lvl)         ((lvl) & (ACT_SLOTS_PER_ZONE - 1))

#if (GAME == GAME_SA1)
#define NUM_LEVEL_IDS_SP 14
#define NUM_LEVEL_IDS_MP 4
#define NUM_LEVEL_IDS    18
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
#define NUM_LEVEL_IDS 34
#else
#define NUM_LEVEL_IDS 1
#endif
#endif

#if (GAME == GAME_SA1)
#define LEVEL_TO_ZONE(level) ((level) >> 1)
#elif (GAME == GAME_SA2)
#define LEVEL_TO_ZONE(level) ((level) >> 2)
#elif (GAME == GAME_SA3)
#define LEVEL_TO_ZONE(level) ((level) / 10u)
#endif
// ((((level) / (ACTS_PER_ZONE + 1)) * 2) | ((level) & 1))
#define LEVEL_TO_COURSE_INDEX(level)        ((((level) / ACT_SLOTS_PER_ZONE) << 0x19 >> 0x18) | ((level)&1))
#define COURSE_LEVEL_TO_COURSE_INDEX(level) (((level) >> 1) + ((level)&1))

#define COURSE_INDEX(zone, act) (LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(zone, act)))

#define CHAOS_EMERALD(zone) (1 << (zone))
#define ALL_ZONE_CHAOS_EMERALDS                                                                                                            \
    (CHAOS_EMERALD(ZONE_1) | CHAOS_EMERALD(ZONE_2) | CHAOS_EMERALD(ZONE_3) | CHAOS_EMERALD(ZONE_4) | CHAOS_EMERALD(ZONE_5)                 \
     | CHAOS_EMERALD(ZONE_6) | CHAOS_EMERALD(ZONE_7))

#define CHAOS_EMERALDS_COMPLETED CHAOS_EMERALD(7)

#if (GAME == GAME_SA1)
#define IS_BOSS_STAGE(lvl)  ((ACT_INDEX(lvl) == ACT_BOSS) || (IS_FINAL_STAGE(lvl) && (gFinalBossActive == 0)) || (IS_EXTRA_STAGE(lvl)))
#define IS_FINAL_STAGE(lvl) ((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_X_ZONE))
#define IS_EXTRA_STAGE(lvl) ((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_THE_MOON))
#elif (GAME == GAME_SA2)
#define IS_BOSS_STAGE(lvl)                                                                                                                 \
    ((ACT_INDEX(lvl) == ACT_BOSS) || (((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) && !gFinalBossActive)                          \
     || (((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))))

#define IS_FINAL_STAGE(lvl) ((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
#define IS_EXTRA_STAGE(lvl) ((lvl) == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))
#endif

#define IS_FINAL_OR_EXTRA_STAGE(lvl) ((IS_FINAL_STAGE(lvl)) || (IS_EXTRA_STAGE(lvl)))

#define TIME(minutes, seconds) (int)(((minutes * 60.) + seconds) * GBA_FRAMES_PER_SECOND)
#define TIMER_WARNING_BEGIN    (TIME(0, 20))
#define MAX_COURSE_TIME        (TIME(10, 0))

#define SPECIAL_STAGE_REQUIRED_SP_RING_COUNT 7

#endif // GUARD_ZONES_H
