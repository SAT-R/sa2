#ifndef GUARD_ZONES_H
#define GUARD_ZONES_H

#define ZONE_1 0
#define ZONE_2 1
#define ZONE_3 2
#define ZONE_4 3
#define ZONE_5 4
#define ZONE_6 5

#define ACT_1 0
#define ACT_2 1
#define BOSS_ACT 2

#define NUM_ZONES 7
#define ACTS_PER_ZONE 3

#define TO_LEVEL_INDEX(zone, act) ((zone) * (ACTS_PER_ZONE + 1)) + (act)

#endif // GUARD_ZONES_H
