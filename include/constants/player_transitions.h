#ifndef GUARD_PLAYER_TRANSITIONS_H
#define GUARD_PLAYER_TRANSITIONS_H

//  0x07 = Set in Egg Utopia - Launcher
//  0x08 = Set in Coll_Player_Enemy_AdjustSpeed (0x0800CB18 - collision.c)
//  0x0A = Player cleared the stage (only for Acts, not Bosses?)
//  0x0B = Something Grinding
//  0x0C = Something Grinding
//  0x0D = Something Grinding
//  0x16 = Set in IA Ramp
//  0x17 = Used in interactable CeilingSlope
//  0x18 = Dash Ring Object
//  0x1C = Set by IA ClearPipe_End if data[1] is 0

#define PLTRANS_NONE                  0
#define PLTRANS_TOUCH_GROUND          1
#define PLTRANS_CORKSCREW_END         2
#define PLTRANS_INIT_JUMP             3
#define PLTRANS_PT4                   4
#define PLTRANS_UNCURL                5
#define PLTRANS_PT6                   6
#define PLTRANS_PT7                   7
#define PLTRANS_HOMING_ATTACK_RECOIL  8
#define PLTRANS_HURT                  9
#define PLTRANS_REACHED_GOAL          10
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
#define PLTRANS_DASHRING              24
#define PLTRANS_PIPE_ENTRY            25
#define PLTRANS_PROPELLER_SPRING      26
#define PLTRANS_CORKSCREW             27
#define PLTRANS_PIPE_EXIT             28

#endif // GUARD_PLAYER_TRANSITIONS_H