#ifndef GUARD_PLAYER_TRANSITIONS_H
#define GUARD_PLAYER_TRANSITIONS_H

//  0x07 = Set in Egg Utopia - Launcher
//  0x08 = Set in Collision_AdjustPlayerSpeed (0x0800CB18 - collision.c)
//  0x0A = Player cleared the stage (only for Acts, not Bosses?)
//  0x0B = Something Grinding
//  0x0C = Something Grinding
//  0x0D = Something Grinding
//  0x16 = Set in IA Ramp
//  0x17 = Used in Interactable_044
//  0x18 = Dash Ring Object
//  0x1C = Set by IA ClearPipe_End if data[1] is 0

#define PLTRANS_NONE                  0
#define PLTRANS_PT1                   1
#define PLTRANS_PT2                   2
#define PLTRANS_PT3                   3
#define PLTRANS_PT4                   4
#define PLTRANS_PT5                   5
#define PLTRANS_PT6                   6
#define PLTRANS_PT7                   7
#define PLTRANS_PT8                   8
#define PLTRANS_PT9                   9
#define PLTRANS_PT10                  10
#define PLTRANS_GRINDING              11
#define PLTRANS_GRIND_RAIL_END_GROUND 12
#define PLTRANS_GRIND_RAIL_END_AIR    13
#define PLTRANS_SPRING_UP             14
#define PLTRANS_SPRING_DOWN           15
#define PLTRANS_SPRING_LEFT           16
#define PLTRANS_SPRING_RIGHT          17
#define PLTRANS_SPRING_UP_LEFT        18
#define PLTRANS_SPRING_UP_RIGHT       19
#define PLTRANS_SPRING_DOWN_LEFT      20
#define PLTRANS_SPRING_DOWN_RIGHT     21
#define PLTRANS_RAMP_AND_DASHRING     22
#define PLTRANS_PT23                  23
#define PLTRANS_PT24                  24
#define PLTRANS_PT25                  25
#define PLTRANS_PT26                  26
#define PLTRANS_PT27                  27
#define PLTRANS_PT28                  28

#endif // GUARD_PLAYER_TRANSITIONS_H