#ifndef GUARD_ZONES_H
#define GUARD_ZONES_H

#define ZONE_1     0
#define ZONE_2     1
#define ZONE_3     2
#define ZONE_4     3
#define ZONE_5     4
#define ZONE_6     5
#define ZONE_7     6
#define ZONE_FINAL 7

#define ACT_1    0
#define ACT_2    1
#define ACT_BOSS 2

#define ACT_XX_FINAL_ZONE ACT_1
#define ACT_TRUE_AREA_53  ACT_2

#define NUM_COURSE_ZONES 7
#define ACTS_PER_ZONE    3

#define LEVEL_INDEX(zone, act) ((zone) * (ACTS_PER_ZONE + 1)) + (act)

// ((((level) / (ACTS_PER_ZONE + 1)) * 2) | ((level) & 1))
#define LEVEL_TO_COURSE_INDEX(level)                                                    \
    ((((level) / (ACTS_PER_ZONE + 1)) << 0x19 >> 0x18) | ((level)&1))
#define COURSE_LEVEL_TO_COURSE_INDEX(level) (((level) >> 1) + ((level)&1))

#define COURSE_INDEX(zone, act) (LEVEL_TO_COURSE_INDEX(LEVEL_INDEX(zone, act)))

#define CHAOS_EMERALD(zone) (1 << (zone))
#define ALL_ZONE_CHAOS_EMERALDS                                                         \
    (CHAOS_EMERALD(ZONE_1) | CHAOS_EMERALD(ZONE_2) | CHAOS_EMERALD(ZONE_3)              \
     | CHAOS_EMERALD(ZONE_4) | CHAOS_EMERALD(ZONE_5) | CHAOS_EMERALD(ZONE_6)            \
     | CHAOS_EMERALD(ZONE_7))

// lol?
#define ALL_CHAOS_EMERALDS (ALL_ZONE_CHAOS_EMERALDS | CHAOS_EMERALD(ZONE_FINAL))

#endif // GUARD_ZONES_H