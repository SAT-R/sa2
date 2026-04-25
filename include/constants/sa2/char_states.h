#ifndef GUARD_SA1_CHAR_STATES_H
#define GUARD_SA1_CHAR_STATES_H

// TODO: merge these lists together

/* The values in here are used for Player.charState!
   They are used to determine the next behavior (and Player.anim/Player.variant in most instances).
   Some are shared between characters (CHARSTATE_xyz)
*/

#if (GAME == GAME_SA1)
#define CHARSTATE_INVALID         -1
#define CHARSTATE_IDLE            0
#define CHARSTATE_DEAD            1
#define CHARSTATE_CROUCH          2
#define CHARSTATE_3               3 // Look-down state?
#define CHARSTATE_WALK_A          4
#define CHARSTATE_SPINATTACK      5
#define CHARSTATE_SPINDASH        6
#define CHARSTATE_7               7
#define CHARSTATE_8               8
#define CHARSTATE_BRAKE           9
#define CHARSTATE_LOOK_UP         10
#define CHARSTATE_11              11
#define CHARSTATE_12              12
#define CHARSTATE_13              13
#define CHARSTATE_14              14
#define CHARSTATE_15              15
#define CHARSTATE_16              16
#define CHARSTATE_17              17
#define CHARSTATE_18              18
#define CHARSTATE_19              19
#define CHARSTATE_RAIL_EXTRA_JUMP 20
#define CHARSTATE_SPRING_B        21
#define CHARSTATE_22              22
#define CHARSTATE_BOUNCE          23
#define CHARSTATE_WALLRUN_INIT    24 // Halfpipe run?
#define CHARSTATE_WALLRUN_TO_WALL 25 // Halfpipe run?
#define CHARSTATE_WALLRUN_ON_WALL 26 // Halfpipe run?
#define CHARSTATE_27              27
#define CHARSTATE_28              28

#if (GAME == GAME_SA1)
#define CHARSTATE_HIT_AIR     15
#define CHARSTATE_ACT_CLEAR_B 29 // unchecked
#else
#define CHARSTATE_HIT_AIR     20
#define CHARSTATE_ACT_CLEAR_B 29
#endif

#define CHARSTATE_30           30
#define CHARSTATE_31           31
#define CHARSTATE_32           32
#define CHARSTATE_33           33
#define CHARSTATE_34           34
#define CHARSTATE_35           35
#define CHARSTATE_36           36
#define CHARSTATE_37           37
#define CHARSTATE_38           38
#define CHARSTATE_39           39 // react to Mecha Knuckles?
#define CHARSTATE_40           40
#define CHARSTATE_41           41
#define CHARSTATE_AMY_SA1_JUMP 42
#define CHARSTATE_43           43
#define CHARSTATE_AIR_DASH     44
#define CHARSTATE_45           45
#define CHARSTATE_46           46
#define CHARSTATE_47           47
#define CHARSTATE_48           48
#define CHARSTATE_49           49
#define CHARSTATE_50           50

#define CHARSTATE_FLYING        53
#define CHARSTATE_54            54
#define CHARSTATE_FLY_EXHAUSTED 55
#define CHARSTATE_56            56
#define CHARSTATE_SWIMMING      57
#define CHARSTATE_58            58
#define CHARSTATE_59            59
#define CHARSTATE_GROUND_ATTACK 60

// NOTE: Inferred from CHARSTATE_KNUCKLES_GLIDE in SA2_LABEL(sub_8022318)
#define CHARSTATE_KNUCKLES_GLIDE 62
#define CHARSTATE_63             63
#define CHARSTATE_64             64
#define CHARSTATE_65             65
#define CHARSTATE_66             66
#define CHARSTATE_67             67
#define CHARSTATE_68             68
#define CHARSTATE_69             69
#define CHARSTATE_70             70
#define CHARSTATE_71             71
#define CHARSTATE_72             72
#define CHARSTATE_73             73
#define CHARSTATE_74             74
#define CHARSTATE_75             75
#define CHARSTATE_76             76
#define CHARSTATE_77             77
#define CHARSTATE_78             78
#define CHARSTATE_79             79
#define CHARSTATE_80             80
#define CHARSTATE_KNUCKLES_SWIM  81
#define CHARSTATE_KNUCKLES_FLOAT 82
#define CHARSTATE_83             83
#define CHARSTATE_84             84
#define CHARSTATE_85             85
#define CHARSTATE_86             86
#define CHARSTATE_87             87
#define CHARSTATE_88             88
#define CHARSTATE_89             89
#define CHARSTATE_90             90
#define CHARSTATE_91             91
#define CHARSTATE_92             92
#define CHARSTATE_93             93

#if (GAME == GAME_SA1)
#define CHARSTATE_SHARED_COUNT 43
#elif (GAME == GAME_SA2)
#define CHARSTATE_SHARED_COUNT 80
#endif

#elif (GAME == GAME_SA2)

#define CHARSTATE_INVALID                       -1
#define CHARSTATE_IDLE                          0
#define CHARSTATE_TAUNT                         1
#define CHARSTATE_CROUCH                        2
#define CHARSTATE_SPIN_DASH                     3
#define CHARSTATE_SPIN_ATTACK                   4
#define CHARSTATE_TURN_SLOW                     5
#define CHARSTATE_TURN_AFTER_BRAKE              6
#define CHARSTATE_BRAKE                         7
#define CHARSTATE_BRAKE_GOAL                    8
#define CHARSTATE_WALK_A                        9
#define CHARSTATE_JUMP_1                        10
#define CHARSTATE_JUMP_2                        11
#define CHARSTATE_HIT_GROUND                    12
#define CHARSTATE_FALLING_VULNERABLE_A          13
#define CHARSTATE_FALLING_VULNERABLE_B          14
#define CHARSTATE_BOOSTLESS_ATTACK              15
#define CHARSTATE_AIR_ATTACK                    16
#define CHARSTATE_BOOST_ATTACK                  17
#define CHARSTATE_SOME_ATTACK                   18
#define CHARSTATE_SOME_OTHER_ATTACK             19
#define CHARSTATE_HIT_AIR                       20
#define CHARSTATE_HIT_STUNNED                   21
#define CHARSTATE_DEAD                          22
#define CHARSTATE_UNUSED_A                      23
#define CHARSTATE_UNUSED_B                      24
#define CHARSTATE_GOAL_BRAKE_A                  25
#define CHARSTATE_GOAL_BRAKE_B                  26
#define CHARSTATE_GOAL_BRAKE_C                  27
#define CHARSTATE_ACT_CLEAR_A                   28
#define CHARSTATE_ACT_CLEAR_B                   29
#define CHARSTATE_ACT_CLEAR_C                   30
#define CHARSTATE_UNUSED_C                      31
#define CHARSTATE_ACT_CLEAR_TIME_ATTACK_OR_BOSS 32
#define CHARSTATE_TRICK_UP                      33
#define CHARSTATE_TRICK_FORWARD                 34
#define CHARSTATE_TRICK_BACKWARD                35
#define CHARSTATE_TRICK_DOWN                    36
#define CHARSTATE_SPRING_MUSIC_PLANT            37
#define CHARSTATE_SPRING_B                      38
#define CHARSTATE_SPRING_C                      39
#define CHARSTATE_RAMP_AND_DASHRING             40
#define CHARSTATE_GRINDING                      41
#define CHARSTATE_GRINDING_SONIC_AMY_JUMP_OFF   42
#define CHARSTATE_GRAVITY_FLIP_UNUSED           43
#define CHARSTATE_IN_WHIRLWIND                  44
#define CHARSTATE_GRABBING_HANDLE_A             45
#define CHARSTATE_GRABBING_HANDLE_B             46
#define CHARSTATE_IN_CORKSCREW                  47
#define CHARSTATE_IN_CORKSCREW_3D_RUNNING_DOWN  48
#define CHARSTATE_IN_CORKSCREW_3D_RUNNING_UP    49
#define CHARSTATE_CURLED_IN_AIR                 50
#define CHARSTATE_WINDUP_STICK_UPWARDS          51
#define CHARSTATE_WINDUP_STICK_DOWNWARDS        52
#define CHARSTATE_WINDUP_STICK_SINGLE_TURN_UP   53
#define CHARSTATE_WINDUP_STICK_SINGLE_TURN_DOWN 54
#define CHARSTATE_HANGING                       55 // both for HookRail and Crane
#define CHARSTATE_TURNAROUND_BAR                56
#define CHARSTATE_NOTE_BLOCK                    57
#define CHARSTATE_FLUTE_EXHAUST                 58
#define CHARSTATE_WALLRUN_INIT                  59
#define CHARSTATE_WALLRUN_TO_WALL               60
#define CHARSTATE_WALLRUN_ON_WALL               61
#define CHARSTATE_ICE_SLIDE                     62
#define CHARSTATE_BOUNCE                        63
#define CHARSTATE_LAUNCHER_IN_CART              64
#define CHARSTATE_LAUNCHER_IN_AIR               65
#define CHARSTATE_POLE                          66
#define CHARSTATE_CUTSCENE_LOOK_UP_FRAME_0      67
#define CHARSTATE_CUTSCENE_LOOK_UP_FRAME_1      68
#define CHARSTATE_CUTSCENE_LOOK_UP_FRAME_2      69
#define CHARSTATE_CUTSCENE_LOOK_UP_FRAME_3      70
#define CHARSTATE_UNUSED_D                      71
#define CHARSTATE_UNUSED_E                      72
#define CHARSTATE_UNUSED_F                      73
#define CHARSTATE_UNUSED_G                      74
#define CHARSTATE_UNUSED_H                      75
#define CHARSTATE_UNUSED_I                      76
#define CHARSTATE_UNUSED_J                      77
#define CHARSTATE_UNUSED_K                      78
#define CHARSTATE_UNUSED_L                      79
#define CHARSTATE_SHARED_COUNT                  80

#define CHARSTATE_SONIC_FORWARD_THRUST        CHARSTATE_SHARED_COUNT
#define CHARSTATE_SONIC_CATCHING_CREAM        81
#define CHARSTATE_SONIC_CAUGHT_CREAM          82
#define CHARSTATE_CREAM_FLYING                83
#define CHARSTATE_CREAM_FLYING_TURNING        84
#define CHARSTATE_CREAM_FLYING_TIRED          85
#define CHARSTATE_CREAM_ANIM_20               86
#define CHARSTATE_CREAM_CHAO_ATTACK           87
#define CHARSTATE_TAILS_FLYING                88
#define CHARSTATE_TAILS_FLYING_TURNING        89
#define CHARSTATE_TAILS_FLYING_TIRED          90
#define CHARSTATE_TAILS_ANIM_19               91
#define CHARSTATE_KNUCKLES_GLIDE              92
#define CHARSTATE_KNUCKLES_GLIDE_FALL         93
#define CHARSTATE_KNUCKLES_GLIDE_FALL_HIT     94
#define CHARSTATE_KNUCKLES_GLIDE_IMPACT       95
#define CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_A 96
#define CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_B 97
#define CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_C 98
#define CHARSTATE_KNUCKLES_GLIDE_TURN_FRAME_D 99
#define CHARSTATE_KNUCKLES_GLIDE_GRAB_WALL    100
#define CHARSTATE_KNUCKLES_CLIMB_A            101
#define CHARSTATE_KNUCKLES_CLIMB_B            102
#define CHARSTATE_KNUCKLES_CLIMB_C            103
#define CHARSTATE_KNUCKLES_CLIMB_D            104
#define CHARSTATE_KNUCKLES_CLIMB_E            105
#define CHARSTATE_KNUCKLES_DRILL_CLAW_INIT    106
#define CHARSTATE_KNUCKLES_DRILL_CLAW_MAIN    107
#define CHARSTATE_KNUCKLES_DRILL_CLAW_GROUND  108
#define CHARSTATE_AMY_SA1_JUMP                109
#define CHARSTATE_UNUSED_M                    110
#define CHARSTATE_AMY_HAMMER_ATTACK           111
#define CHARSTATE_AMY_SA1_HAMMER_ATTACK       112
#define CHARSTATE_UNUSED_N                    113
#define CHARSTATE_AMY_MID_AIR_HAMMER_SWIRL    114 // might be SA1 version?
#define CHARSTATE_COUNT                       115

#endif

#endif // GUARD_SA1_CHAR_STATES_H
