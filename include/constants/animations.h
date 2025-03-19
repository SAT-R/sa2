#ifndef GUARDS_ANIMATIONS_H
#define GUARDS_ANIMATIONS_H

#include "constants/text.h" // for language-specific stuff

/* Collection of animation indices for Sonic Advance 2.
 * - By JaceCear
 */

// "x_PROJ" means "projectile belonging to x"

// Cheese is sometimes treated like a player character, so have an ID for them.
#define SA2_ANIM_CHAR_ID_CHEESE 5

#define SA2_NUM_PLAYER_CHAR_ANIMATIONS (91) // TODO: Don't use constant here
#define SA2_ANIM_CHAR(anim, character) ((anim) + character * SA2_NUM_PLAYER_CHAR_ANIMATIONS)

// TODO: If possible, make player animations macros, so there's no redundancy
#define SA2_CHAR_ANIM_IDLE                                   0
#define SA2_CHAR_ANIM_TAUNT                                  1
#define SA2_CHAR_ANIM_CROUCH                                 2
#define SA2_CHAR_ANIM_SPIN_DASH                              3
#define SA2_CHAR_ANIM_SPIN_ATTACK                            4
#define SA2_CHAR_ANIM_5                                      5
#define SA2_CHAR_ANIM_6                                      6
#define SA2_CHAR_ANIM_BRAKE                                  7
#define SA2_CHAR_ANIM_BRAKE_GOAL                             8
#define SA2_CHAR_ANIM_WALK                                   9
#define SA2_CHAR_ANIM_JUMP_1                                 10
#define SA2_CHAR_ANIM_JUMP_2                                 11
#define SA2_CHAR_ANIM_HIT_GROUND                             12
#define SA2_CHAR_ANIM_FALLING_VULNERABLE                     13
#define SA2_CHAR_ANIM_BOOSTLESS_ATTACK                       14
#define SA2_CHAR_ANIM_AIR_ATTACK                             15
#define SA2_CHAR_ANIM_BOOST_ATTACK                           16
#define SA2_CHAR_ANIM_INSTA_SHIELD_1                         17
#define SA2_CHAR_ANIM_INSTA_SHIELD_2                         18
#define SA2_CHAR_ANIM_19                                     19
#define SA2_CHAR_ANIM_20                                     20
#define SA2_CHAR_ANIM_21                                     21
#define SA2_CHAR_ANIM_22                                     22
#define SA2_CHAR_ANIM_23                                     23
#define SA2_CHAR_ANIM_24                                     24
#define SA2_CHAR_ANIM_HIT                                    28
#define SA2_CHAR_ANIM_DEAD                                   29
#define SA2_CHAR_ANIM_BEFORE_COUNTDOWN                       30
#define SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_GETTING_READY 0
#define SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF       1
#define SA2_CHAR_ANIM_GOAL_BRAKE                             31
#define SA2_CHAR_ANIM_ACT_CLEAR                              32
#define SA2_CHAR_ANIM_33                                     33
#define SA2_CHAR_ANIM_34                                     34
#define SA2_CHAR_ANIM_35                                     35
#define SA2_CHAR_ANIM_CUTSCENE_LOOK_UP                       36
#define SA2_CHAR_ANIM_37                                     37
#define SA2_CHAR_ANIM_38                                     38
#define SA2_CHAR_ANIM_39                                     39
#define SA2_CHAR_ANIM_40                                     40
#define SA2_CHAR_ANIM_41                                     41
#define SA2_CHAR_ANIM_42                                     42
#define SA2_CHAR_ANIM_43                                     43
#define SA2_CHAR_ANIM_44                                     44
#define SA2_CHAR_ANIM_45                                     45
#define SA2_CHAR_ANIM_46                                     46
#define SA2_CHAR_ANIM_47                                     47
#define SA2_CHAR_ANIM_TRICK_UP                               48
#define SA2_CHAR_ANIM_VARIANT_TRICK_UP_PARTICLE_FX           3 // Knuckles-only(?)
#define SA2_CHAR_ANIM_TRICK_SIDE                             49
#define SA2_CHAR_ANIM_VARIANT_TRICK_SIDE_START               0
#define SA2_CHAR_ANIM_VARIANT_TRICK_SIDE_EXECUTE             1
#define SA2_CHAR_ANIM_VARIANT_TRICK_SIDE_PARTICLE_FX         2 // Sonic-only
#define SA2_CHAR_ANIM_50                                     50
#define SA2_CHAR_ANIM_51                                     51 // Sonic: Bound-Attack
#define SA2_CHAR_ANIM_52                                     52
#define SA2_CHAR_ANIM_53                                     53
#define SA2_CHAR_ANIM_54                                     54
#define SA2_CHAR_ANIM_GRINDING                               55
#define SA2_CHAR_ANIM_56                                     56
#define SA2_CHAR_ANIM_57                                     57
#define SA2_CHAR_ANIM_IN_WHIRLWIND                           58
#define SA2_CHAR_ANIM_GRABBING_HANDLE_A                      59
#define SA2_CHAR_ANIM_GRABBING_HANDLE_B                      60
#define SA2_CHAR_ANIM_HANGING                                61
#define SA2_CHAR_ANIM_WINDUP_STICK_UPDOWN                    62
#define SA2_CHAR_ANIM_WINDUP_STICK_SINGLE_TURN_UPDOWN        63
#define SA2_CHAR_ANIM_TURNAROUND_BAR                         64
#define SA2_CHAR_ANIM_SPRING_MUSIC_PLANT                     65
#define SA2_CHAR_ANIM_NOTE_BLOCK                             66
#define SA2_CHAR_ANIM_FLUTE_EXHAUST                          67
#define SA2_CHAR_ANIM_68                                     68
#define SA2_CHAR_ANIM_69                                     69
#define SA2_CHAR_ANIM_70                                     70
#define SA2_CHAR_ANIM_71                                     71
#define SA2_CHAR_ANIM_72                                     72
#define SA2_CHAR_ANIM_73                                     73
#define SA2_CHAR_ANIM_BOOST_PALETTE                          74
#define SA2_CHAR_ANIM_75                                     75
#define SA2_CHAR_ANIM_80                                     80
#define SA2_CHAR_ANIM_87                                     87

#define SA2_ANIM_SONIC_IDLE     0
#define SA2_ANIM_CREAM_IDLE     91
#define SA2_ANIM_CREAM_CAPTURED 129

#define SA2_ANIM_TAILS_IDLE    182
#define SA2_ANIM_KNUCKLES_IDLE 273
#define SA2_ANIM_AMY_IDLE      364

// Example usage of the macro
// #define SA2_ANIM_SONIC_IDLE    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SONIC)
// #define SA2_ANIM_CREAM_IDLE    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_CREAM)
// #define SA2_ANIM_TAILS_IDLE    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_TAILS)
// #define SA2_ANIM_KNUCKLES_IDLE SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_KNUCKLES)
// #define SA2_ANIM_AMY_IDLE      SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_AMY)

#define SA2_ANIM_CREAM_HOLDING_ONTO_SONIC 130

// Super Tail Swipe" is the regular "Tail Swipe" in Boost-Mode
#define SA2_ANIM_TAILS_SUPER_TAIL_SWIPE 198

#define SA2_ANIM_TAILS_CAPTURED                        222
#define SA2_ANIM_TAILS_FLYING                          223
#define SA2_ANIM_VARIANT_TAILS_FLYING_NORMAL           0
#define SA2_ANIM_VARIANT_TAILS_FLYING_WAVING_AT_PLAYER 1
#define SA2_ANIM_CHEESE_HOVERING                       455
#define SA2_ANIM_CHEESE_SIDEWAYS                       456
#define SA2_ANIM_CHEESE_BACKFLIP                       457
#define SA2_ANIM_CHEESE_NERVOUS                        458
#define SA2_ANIM_CHEESE_PIROUETTE                      459
#define SA2_ANIM_CHEESE_SHOCKED                        460
#define SA2_ANIM_CHEESE_LIFTING                        461
#define SA2_ANIM_CHEESE_CELEBRATING                    462
#define SA2_ANIM_CHEESE_STOMPING                       463 // alternatively: SA2_ANIM_CHEESE_CANNON_BALL ?
#define SA2_ANIM_CHEESE_SKY_UPPERCUT                   464
#define SA2_ANIM_CHEESE_DYING                          465
#define SA2_ANIM_CHEESE_STRUGGLING                     466
#define SA2_ANIM_CHEESE_SIDEWAYS_2                     467
#define SA2_ANIM_CHEESE_DOWNWARDS                      468
#define SA2_ANIM_CHEESE_469                            469
#define SA2_ANIM_CHEESE_WAVING_PLAYER                  470
#define SA2_ANIM_SONIC_GOING_SUPER_0                   471
#define SA2_ANIM_SONIC_GOING_SUPER_1                   472
#define SA2_ANIM_SUPER_SONIC_SIDEWAYS                  473
#define SA2_ANIM_SUPER_SONIC_ATTACK_CLOUD              474
#define SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET           475
#define SA2_ANIM_SUPER_SONIC_FROZEN                    476
// Defeating enemies / opening item boxes
#define SA2_ANIM_DUST_CLOUD 477

// Enemies
#define SA2_ANIM_MON                    478
#define SA2_ANIM_KIKI                   479
#define SA2_ANIM_KIKI_PROJ              480
#define SA2_ANIM_KIKI_PROJ_EXPLOSION    481
#define SA2_ANIM_BUZZER                 482
#define SA2_ANIM_GOHLA                  483
#define SA2_ANIM_GOHLA_PROJ             484
#define SA2_ANIM_KURAKURA               485
#define SA2_ANIM_KURAKURA_PROJ          486
#define SA2_ANIM_KURAKURA_PROJ_FIREBALL 487
#define SA2_ANIM_KUBINAGA               488
#define SA2_ANIM_KUBINAGA_NECK          489
#define SA2_ANIM_KUBINAGA_BASE          490
#define SA2_ANIM_KUBINAGA_PROJ          491
#define SA2_ANIM_KOURA                  492
#define SA2_ANIM_BELL                   493
#define SA2_ANIM_PIKOPIKO               494
#define SA2_ANIM_CIRCUS                 495
#define SA2_ANIM_CIRCUS_PROJ            496
#define SA2_ANIM_YADO                   497
#define SA2_ANIM_YADO_PROJ              498
#define SA2_ANIM_HAMMERHEAD             499

#define SA2_ANIM_PEN               500
#define SA2_ANIM_PEN_VARIANT_MOVE  0
#define SA2_ANIM_PEN_VARIANT_BOOST 1
#define SA2_ANIM_PEN_VARIANT_TURN  2

#define SA2_ANIM_BALLOON      501
#define SA2_ANIM_BALLOON_PROJ 502
#define SA2_ANIM_MADILLO      503
#define SA2_ANIM_STRAW        504
#define SA2_ANIM_BULLETBUZZER 505
#define SA2_ANIM_BUZZER_PROJ  506
#define SA2_ANIM_FLICKEY      507
#define SA2_ANIM_FLICKEY_PROJ 508
#define SA2_ANIM_KYURA        509
#define SA2_ANIM_KYURA_PROJ   510
#define SA2_ANIM_STAR         511
#define SA2_ANIM_GEJIGEJI     512
#define SA2_ANIM_MOUSE        513
#define SA2_ANIM_SPINNER      514

// Animals
#define SA2_ANIM_ANIMAL_SEAL      515
#define SA2_ANIM_ANIMAL_GORILLA   516
#define SA2_ANIM_ANIMAL_PEACOCK   517
#define SA2_ANIM_ANIMAL_LION      518
#define SA2_ANIM_ANIMAL_MOLE      519
#define SA2_ANIM_ANIMAL_PARROT    520
#define SA2_ANIM_ANIMAL_PENGUIN   521
#define SA2_ANIM_ANIMAL_RABBIT    522
#define SA2_ANIM_ANIMAL_SEA_OTTER 523
#define SA2_ANIM_ANIMAL_DEER      524
#define SA2_ANIM_ANIMAL_SKUNK     525
#define SA2_ANIM_ANIMAL_ROBIN     526
#define SA2_ANIM_ANIMAL_KANGAROO  527
#define SA2_ANIM_ANIMAL_KOALA     528
#define SA2_ANIM_ANIMAL_ELEPHANT  529

// MapEntity
#define SA2_ANIM_LEVEL_START_MACHINE     530
#define SA2_ANIM_CHECKPOINT              531
#define SA2_ANIM_VARIANT_CHECKPOINT_IDLE 0
#define SA2_ANIM_VARIANT_CHECKPOINT_HIT  1
#define SA2_ANIM_GOAL_LEVER              532
#define SA2_ANIM_WATER_SPLASH            533
#define SA2_ANIM_WATER_SURFACE           534
#define SA2_ANIM_LEAF_FOREST_GROUND_TILE 535
#define SA2_ANIM_SPRING                  536
#define SA2_ANIM_BOUNCY_SPRING           537
#define SA2_ANIM_BOUNCY_BAR              538
#define SA2_ANIM_PLATFORM_LF_WIDE        539
#define SA2_ANIM_BOOSTER                 540
#define SA2_ANIM_PLATFORM_LEA_FOR        541
#define SA2_ANIM_SPIKES                  542
// TODO: Rename
#define SA2_ANIM_VARIANT_SPIKES_UP       0
#define SA2_ANIM_VARIANT_SPIKES_UP_LOW   1
#define SA2_ANIM_VARIANT_SPIKES_UP_MID   2
#define SA2_ANIM_VARIANT_SPIKES_SIDEWAYS 3
#define SA2_ANIM_RAMP                    543
#define SA2_ANIM_WATER_RUNNING_PARTICLES 544

#define SA2_ANIM_ROTATING_HANDLE               546
#define SA2_ANIM_DECORATION__FLOWER_YELLOW     547
#define SA2_ANIM_DECORATION__FLOWER_RED_SMALL  548
#define SA2_ANIM_DECORATION__FLOWER_BLUE       549
#define SA2_ANIM_DECORATION__FLOWER_BLUE_SMALL 550
#define SA2_ANIM_DECORATION__ROCK              551
#define SA2_ANIM_DECORATION__552               552
// TODO: Unused for decoration module?
#define SA2_ANIM_WATER_FALL_HIT_SURFACE          553
#define SA2_ANIM_PALETTE_554                     554
#define SA2_ANIM_UNDERWATER_1UP_SONIC            555
#define SA2_ANIM_UNDERWATER_1UP_TAILS            556
#define SA2_ANIM_UNDERWATER_1UP_KNUCKLES         557
#define SA2_ANIM_UNDERWATER_1UP_CREAM            558
#define SA2_ANIM_UNDERWATER_1UP_AMY              559
#define SA2_ANIM_DECORATION__WATER_GROUND_SPLASH 560
#define SA2_ANIM_WIND_MILL_PART                  561
#define SA2_ANIM_562                             562
#define SA2_ANIM_563                             563
#define SA2_ANIM_CRANE_PARTS                     564
#define SA2_ANIM_VARIANT_CRANE_PARTS_HOOK        0
#define SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_GREY   1
#define SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_YELLOW 2
#define SA2_ANIM_CRANE                           565
#define SA2_ANIM_PLATFORM_HOT_CRA                566
#define SA2_ANIM_TURNAROUND_BAR                  567
#define SA2_ANIM_SPRING_PLATFORM                 568
#define SA2_ANIM_569                             569
#define SA2_ANIM_DRUM                            570
#define SA2_ANIM_FLOATING_SPRING_3               571
#define SA2_ANIM_SPRING_MUS_PLA                  572
#define SA2_ANIM_SPRING_MUS_PLA_2                573
#define SA2_ANIM_PLATFORM_SQUARE_MUS_PLA         574
#define SA2_ANIM_NOTE_BLOCK                      575
#define SA2_ANIM_VARIANT_NOTE_BLOCK_CHAIN_LINK   15
#define SA2_ANIM_NOTE_PARTICLES                  576
#define SA2_ANIM_VARIANT_NOTE_H                  0
#define SA2_ANIM_VARIANT_NOTE_V                  1
#define SA2_ANIM_YELLOW_STAR                     577
#define SA2_ANIM_SMOKE                           578
#define SA2_ANIM_579                             579
#define SA2_ANIM_SPIKES_MUS_PLA                  580
#define SA2_ANIM_PLATFORM_ICE_PAR                581
#define SA2_ANIM_BIG_SNOWBALL                    582
#define SA2_ANIM_583                             583
#define SA2_ANIM_DASH_RING                       584
#define SA2_ANIM_SMALL_WINDMILL                  585
#define SA2_ANIM_PLATFORM_SKY_CAN                586
#define SA2_ANIM_PLATFORM_587                    587
#define SA2_ANIM_WHIRLWIND                       588
#define SA2_ANIM_PROPELLER                       589
#define SA2_ANIM_SPRING_FLYING                   590
#define SA2_ANIM_FAN                             591
#define SA2_ANIM_FLYING_HANDLE                   592
#define SA2_ANIM_PLATFORM_SKY_CAN_2              593
#define SA2_ANIM_PLATFORM_SQUARE_SKY_CAN         594
#define SA2_ANIM_ARROW_SCREEN                    595
#define SA2_ANIM_SPIKE_PLATFORM                  596
#define SA2_ANIM_PLATFORM_TEC_BAS                597
#define SA2_ANIM_NOTE_BLOCK_TEC_BASE             598
#define SA2_ANIM_ARROW_SCREEN_BORDER             599
#define SA2_ANIM_LIGHT_GLOBE                     600
#define SA2_ANIM_LIGHT_BRIDGE                    601
#define SA2_ANIM_602                             602
#define SA2_ANIM_603                             603
#define SA2_ANIM_SPRING_TEC_BAS                  604
#define SA2_ANIM_DASH_RING_TEC_BAS               605
#define SA2_ANIM_DIR_ARROW_TEC_BAS               606
#define SA2_ANIM_SPIKES_TEC_BAS                  607
#define SA2_ANIM_RAMP_TECHNO_BASE                608
#define SA2_ANIM_609                             609
#define SA2_ANIM_610                             610

#define SA2_ANIM_SPEEDING_PLATFORM      612
#define SA2_ANIM_PLATFORM_SQUARE_COMMON 613

#define SA2_ANIM_LAUNCHER 614

#define SA2_ANIM_CANNON           616
#define SA2_ANIM_PLATFORM_EGG_UTO 617
#define SA2_ANIM_IRON_BALL        618
#define SA2_ANIM_EXPLOSION        619

#define SA2_ANIM_HAMMERTANK_BODY_DESTROYED 628
#define SA2_ANIM_HAMMERTANK_PILOT          629
#define SA2_ANIM_HAMMERTANK_HAMMER         630
#define SA2_ANIM_HAMMERTANK_HAND           631
#define SA2_ANIM_HAMMERTANK_BODY           632
#define SA2_ANIM_HAMMERTANK_ARM_SEGMENT    633
#define SA2_ANIM_HAMMERTANK_WHEEL          634
#define SA2_ANIM_HAMMERTANK_SPINNING_WHEEL 635

#define SA2_ANIM_EGGMOBILE   636
#define SA2_ANIM_EGGMAN_HEAD 637
#define SA2_ANIM_EXPLOSION_1 638
#define SA2_ANIM_EXPLOSION_2 639

#define SA2_ANIM_EGG_BOMBER_TANK_BODY       641
#define SA2_ANIM_EGG_BOMBER_TANK_BODY_PARTS 642

#define SA2_ANIM_EGG_BOMBER_TANK_WHEEL_FOREGROUND 644
#define SA2_ANIM_EGG_BOMBER_TANK_WHEEL_BACKGROUND 645
#define SA2_ANIM_EGG_BOMBER_TANK_CANNON           646
#define SA2_ANIM_EGG_BOMBER_TANK_BOMB             647
#define SA2_ANIM_EGG_BOMBER_TANK_PILOT            648

#define SA2_ANIM_EGG_TOTEM_COCKPIT         649
#define SA2_ANIM_EGG_TOTEM_CART            650
#define SA2_ANIM_EGG_TOTEM_BODY            651
#define SA2_ANIM_EGG_TOTEM_WHEEL_FRONT     652
#define SA2_ANIM_EGG_TOTEM_WHEEL_BACK      653
#define SA2_ANIM_EGG_TOTEM_WHEEL_SMALL     654
#define SA2_ANIM_EGG_TOTEM_PLATFORM        655
#define SA2_ANIM_EGG_TOTEM_HOOK            656
#define SA2_ANIM_EGG_TOTEM_BULLET_LAUNCHER 657
#define SA2_ANIM_EGG_TOTEM_BULLET          658
#define SA2_ANIM_TAILS_CAPTURED_COPY       659
#define SA2_ANIM_EGG_TOTEM_ENERGY          660

#define SA2_ANIM_AERO_EGG_BODY         661
#define SA2_ANIM_AERO_EGG_PLATFORM     662
#define SA2_ANIM_AERO_EGG_FIRE         663
#define SA2_ANIM_AERO_EGG_BOMB         664
#define SA2_ANIM_AERO_EGG_ELEMENT      665
#define SA2_ANIM_AERO_EGG_DEBRIS_BIG   666
#define SA2_ANIM_AERO_EGG_DEBRIS_SMALL 667
#define SA2_ANIM_AERO_EGG_PILOT        668

#define SA2_ANIM_EGG_SAUCER_PILOT_KNUCKLES 315
#define SA2_ANIM_EGG_SAUCER_CABIN          669
#define SA2_ANIM_EGG_SAUCER_ARM_BASE       670
#define SA2_ANIM_EGG_SAUCER_GUN_BASE       671
#define SA2_ANIM_EGG_SAUCER_HAND           672

#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_RIGHT 676
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN       678
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_DOWN_LEFT  675
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_LEFT       679
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_LEFT    673
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP         677
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_UP_RIGHT   674
#define SA2_ANIM_EGG_SAUCER_SMACK_PARTICLE_RIGHT      680

#define SA2_ANIM_EGG_SAUCER_ARM_SEGMENT  681
#define SA2_ANIM_EGG_SAUCER_GUN          682
#define SA2_ANIM_EGG_SAUCER_GUN_CHARGE   683
#define SA2_ANIM_EGG_SAUCER_PILOT_EGGMAN 684
#define SA2_ANIM_EGG_SAUCER_DISK         685

#define SA2_ANIM_EGG_GO_ROUND_CABIN           687
#define SA2_ANIM_EGG_GO_ROUND_GUN             688
#define SA2_ANIM_EGG_GO_ROUND_PROJECTILE      689
#define SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM 690
#define SA2_ANIM_EGG_GO_ROUND_PLATFORM        691
#define SA2_ANIM_EGG_GO_ROUND_LINK            692
#define SA2_ANIM_EGG_GO_ROUND_PILOT           693

#define SA2_ANIM_EGG_FROG_CABIN          694
#define SA2_ANIM_EGG_FROG_ARM_PIECE      695
#define SA2_ANIM_EGG_FROG_ARM_PIECE_LONG 696
#define SA2_ANIM_EGG_FROG_WHEELS         697
#define SA2_ANIM_EGG_FROG_BOMB           698
#define SA2_ANIM_EGG_FROG_BOMB_FLAME     699
#define SA2_ANIM_EGG_FROG_ARM_SEGMENT    700

#define SA2_ANIM_SUPER_EGG_ROBO_Z_PLATFORM      701
#define SA2_ANIM_SUPER_EGG_ROBO_Z_PLATFORM_PROP 702
#define SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT      703
#define SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT     704
#define SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD          705
#define SA2_ANIM_SUPER_EGG_ROBO_Z_PROJ          706
#define SA2_ANIM_SUPER_EGG_ROBO_Z_CLOUD         707

#define SA2_ANIM_TRUE_AREA_53_BOSS_COCKPIT           708
#define SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_0         709
#define SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_1         710
#define SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_2         711
#define SA2_ANIM_TRUE_AREA_53_BOSS_CANNON            712
#define SA2_ANIM_TRUE_AREA_53_BOSS_EXPLOSION         713
#define SA2_ANIM_TRUE_AREA_53_BOSS_CLOUD             714
#define SA2_ANIM_TRUE_AREA_53_BOSS_MOUTH             715
#define SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET            716
#define SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_YELLOW       717
#define SA2_ANIM_TRUE_AREA_53_BOSS_SUCK_FX           718
#define SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED          719
#define SA2_ANIM_TRUE_AREA_53_BOSS_PARTICLE_0        720
#define SA2_ANIM_TRUE_AREA_53_BOSS_PARTICLE_1        721
#define SA2_ANIM_TRUE_AREA_53_BOSS_PARTICLE_2        722
#define SA2_ANIM_TRUE_AREA_53_BOSS_COCKPIT_SEPERATED 723

#define SA2_ANIM_ITEMBOX      724
#define SA2_ANIM_ITEMBOX_TYPE 725

// Used both for rings placed in the stage and
// ones the player loses when hit.
#define SA2_ANIM_RING                 726
#define SA2_ANIM_RING_COLLECT_EFFECT  727
#define TILE_COUNT__ANIM_ITEMBOX      16 // TODO: Automate
#define TILE_COUNT__ANIM_ITEMBOX_TYPE 4 // TODO: Automate

#define SA2_ANIM_SCORE              728 // variant: 0 = 100 | 1 = 200 | 2 = 400 | 3 = 800 | 4 = 1000
#define SA2_ANIM_VARIANT_SCORE_100  0
#define SA2_ANIM_VARIANT_SCORE_200  1
#define SA2_ANIM_VARIANT_SCORE_400  2
#define SA2_ANIM_VARIANT_SCORE_800  3
#define SA2_ANIM_VARIANT_SCORE_1000 4
#define TILE_COUNT__ANIM_SCORE      2 // TODO: Automate

#define SA2_ANIM_MULTIPLAYER_UI_RING 729

#define SA2_ANIM_SPECIAL_RING             730
#define SA2_ANIM_VARIANT_SP_RING__IDLE    0
#define SA2_ANIM_VARIANT_SP_RING__COLLECT 1

#define SA2_ANIM_GAME_OVER               731
#define SA2_ANIM_VARIANT_GAME_OVER_GAME  0
#define SA2_ANIM_VARIANT_GAME_OVER_OVER  1
#define SA2_ANIM_VARIANT_GAME_OVER_CONTI 2
#define SA2_ANIM_VARIANT_GAME_OVER_NUE   3
#define SA2_ANIM_VARIANT_GAME_OVER_TIME  4

#define SA2_ANIM_NOTIFICATION_RING_BONUS                   735
#define SA2_ANIM_CHAR_SELECT_CHARACTER                     736
#define SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC      0
#define SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_SELECTED    1
#define SA2_CHAR_SELECT_NUM_CHARACTER_ANIMATIONS           2
#define SA2_ANIM_VARIANT_SELECT_CHARACTER(character, type) ((character)*SA2_CHAR_SELECT_NUM_CHARACTER_ANIMATIONS + type)

#define SA2_ANIM_CHAR_SELECT_CIRCLE                  737
#define SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_INACTIVE 0
#define SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE   (SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_INACTIVE + NUM_CHARACTERS)

#define SA2_ANIM_CHAR_SELECT_ARROW                   738
#define SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC    0
#define SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING 1

#define SA2_ANIM_CHAR_SELECT_RED_CROSS_BOX 742

#define SA2_ANIM_758        758
#define SA2_ANIM_ZONEX_NAME 762

#define SA2_ANIM_EXTRA_CUTSCENE_CAPSULE 791

// NOTE: Reused from SA1's character selection screen
#define SA2_ANIM_AMY_UNLOCKED 810

#define SA2_ANIM_COMPANY_LOGO                     828
#define SA2_ANIM_VARIANT_COMPANY_LOGO_SONIC_TEAM  0
#define SA2_ANIM_VARIANT_COMPANY_LOGO_DIMPS       1
#define SA2_ANIM_VARIANT_COMPANY_LOGO_WAVE_MASTER 2
#define SA2_ANIM_VARIANT_COMPANY_LOGO_SEGA        3

// Both use the same variants (2002/2003)
#define SA2_ANIM_CREDITS_COPYRIGHT      829
#define SA2_ANIM_TITLE_COPYRIGHT        830
#define SA2_ANIM_VARIANT_COPYRIGHT_2002 0
#define SA2_ANIM_VARIANT_COPYRIGHT_2003 1

#define SA2_ANIM_TITLE_SEAGULL    831
#define SA2_ANIM_TITLE_LENS_FLARE 832

#define SA2_ANIM_TAILS_TAIL_SWIPE         845
#define SA2_ANIM_SPINDASH_DUST_EFFECT     846
#define SA2_ANIM_SPINDASH_DUST_EFFECT_BIG 847
#define SA2_ANIM_SMALL_DUST_PARTICLE      848
#define SA2_ANIM_GRIND_EFFECT             849 // Grinding particles
#define SA2_ANIM_SHIELD_NORMAL            850
#define SA2_ANIM_SHIELD_MAGNETIC          851
#define SA2_ANIM_INVINCIBILITY            852
#define SA2_ANIM_BUBBLES_SMALL            853
#define SA2_ANIM_BUBBLES_GROUP            854

#define SA2_ANIM_HEART 858

#define SA2_ANIM_INDICATOR_SONIC    863
#define SA2_ANIM_INDICATOR_CREAM    864
#define SA2_ANIM_INDICATOR_TAILS    865
#define SA2_ANIM_INDICATOR_KNUCKLES 866
#define SA2_ANIM_INDICATOR_AMY      867

#define SA2_ANIM_SOME_JAPANESE_TXT           868
#define SA2_ANIM_VARIANT_SOME_JAPANESE_TXT_7 7

#define SA2_ANIM_DROWN_COUNTDOWN           870
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_5 0
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_4 1
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_3 2
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_2 3
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_1 4
#define SA2_ANIM_VARIANT_DROWN_COUNTDOWN_0 5
#define SA2_ANIM_STAGE_GOAL_SCORE_BONUS    871
#define SA2_ANIM_BRAKING_DUST_EFFECT       872
#define SA2_ANIM_SONIC_BOOM_PARTICLES      873
#define SA2_ANIM_MAIN_MENU                 874
#define SA2_ANIM_VARIANT_MAIN_MENU_OPTIONS 3

#define SA2_ANIM_RACE_START_ICON  879
#define SA2_ANIM_RACE_FINISH_ICON 880

#define SA2_ANIM_CONFUSION 881

#define SA2_ANIM_RING_SP_STAGE           882
#define SA2_ANIM_E100_ALPHA              883
#define SA2_ANIM_SP_STAGE_HOLE           884
#define SA2_ANIM_VARIANT_SP_STAGE_HOLE_0 0
#define SA2_ANIM_VARIANT_SP_STAGE_HOLE_1 1
#define SA2_ANIM_VARIANT_SP_STAGE_HOLE_2 2
#define SA2_ANIM_VARIANT_SP_STAGE_HOLE_3 3

#define SA2_ANIM_SP_STAGE_MULTIPLIER            885
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x2 0
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x3 1
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x4 2
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x5 3
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x6 4
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x7 5
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x8 6
#define SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x9 7

#define SA2_ANIM_SP_STAGE_ARROW                890
#define SA2_ANIM_VARIANT_SP_STAGE_ARROW_GREEN  0
#define SA2_ANIM_VARIANT_SP_STAGE_ARROW_YELLOW 1
#define SA2_ANIM_VARIANT_SP_STAGE_ARROW_RED    2

#define SA2_ANIM_SP_STAGE_NOTIFS                             893
#define SA2_ANIM_VARIANT_SP_STAGE_NOTIFS_SPECIAL_STAGE       0
#define SA2_ANIM_VARIANT_SP_STAGE_NOTIFS_GOT_A_CHAOS_EMERALD 1
#define SA2_ANIM_SP_STAGE_SCORE_BONUSES                      894
#define SA2_ANIM_VARIANT_SP_STAGE_SCORE_BONUSES_RING         0
#define SA2_ANIM_VARIANT_SP_STAGE_SCORE_BONUSES_CLEAR        1
#define SA2_ANIM_VARIANT_SP_STAGE_SCORE_BONUSES_TOTAL        2

#define SA2_ANIM_CHAOS_EMERALDS_UNLOCKED                895
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_RED    0
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_BLUE   1
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_YELLOW 2
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_GREEN  3
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_WHITE  4
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_CYAN   5
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_PURPLE 6
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_EMPTY  7
#define SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_SHINE  8

#define SA2_ANIM_898 898
#define SA2_ANIM_899 899
#define SA2_ANIM_900 900
#define SA2_ANIM_901 901
#define SA2_ANIM_902 902
#define SA2_ANIM_903 903
#define SA2_ANIM_904 904
#define SA2_ANIM_905 905

#define SA2_ANIM_947 947

#define SA2_ANIM_SOUNDTEST_CREAM_CLAP_UP                 968
#define SA2_ANIM_VARIANT_SOUNDTEST_CREAM_CLAP_UP_ACTIVE  0
#define SA2_ANIM_VARIANT_SOUNDTEST_CREAM_CLAP_UP_HOLDING 1
#define SA2_ANIM_SOUNDTEST_CREAM_BOW                     970
#define SA2_ANIM_SOUNDTEST_CREAM_WAITING                 971
#define SA2_ANIM_SOUNDTEST_PLATFORM                      972
#define SA2_ANIM_SOUNDTEST_CLAP_FORWARD                  973

#define ANIM_DEMO_PLAY                            1044
#define SA2_ANIM_1045                             1045
#define SA2_ANIM_COPYRIGHT_INFO_TITLE_SCREEN      1046
#define SA2_ANIM_TIME_ATTACK_DIGITS               1047
#define SA2_ANIM_VARIANT_TA_DIGITS_0              0
#define SA2_ANIM_VARIANT_TA_DIGITS_1              1
#define SA2_ANIM_VARIANT_TA_DIGITS_2              2
#define SA2_ANIM_VARIANT_TA_DIGITS_3              3
#define SA2_ANIM_VARIANT_TA_DIGITS_4              4
#define SA2_ANIM_VARIANT_TA_DIGITS_5              5
#define SA2_ANIM_VARIANT_TA_DIGITS_6              6
#define SA2_ANIM_VARIANT_TA_DIGITS_7              7
#define SA2_ANIM_VARIANT_TA_DIGITS_8              8
#define SA2_ANIM_VARIANT_TA_DIGITS_9              9
#define SA2_ANIM_VARIANT_TA_DIGITS_COLON          10
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_0_GOLD   11
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_0_SILVER 12
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_0_BRONZE 13
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_1_GOLD   14
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_1_SILVER 15
#define SA2_ANIM_VARIANT_TA_DIGITS_PLATE_1_BRONZE 16

#define SA2_ANIM_MSG_JP_TRY_AGAIN 1051
#define SA2_ANIM_MSG_EN_TRY_AGAIN 1052

#define SA2_ANIM_TIME_ATTACK_JP 1057
#define SA2_ANIM_TIME_ATTACK_EN 1058
#define SA2_ANIM_TIME_ATTACK_DE 1059
#define SA2_ANIM_TIME_ATTACK_FR 1060
#define SA2_ANIM_TIME_ATTACK_ES 1061
#define SA2_ANIM_TIME_ATTACK_IT 1062

#define SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP    0
#define SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP   1
#define SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET 2
#define SA2_ANIM_VARIANT_TA_ZONE               3 // "ZONE" - only in SA2_ANIM_TIME_ATTACK_EN
#define SA2_ANIM_VARIANT_TA_BOSS               4 // "BOSS" - only in SA2_ANIM_TIME_ATTACK_EN

#define SA2_ANIM_VARIANT_TA_TITLE        0 // variant of only SA2_ANIM_TIME_ATTACK
#define SA2_ANIM_VARIANT_TA_JP_ZONE      1
#define SA2_ANIM_VARIANT_TA_JP_BOSS      2
#define SA2_ANIM_VARIANT_TA_JP_CLEAR     (3 + SA2_ANIM_VARIANT_TA_CLEAR_ZONE_ASAP)
#define SA2_ANIM_VARIANT_TA_JP_DEFEAT    (3 + SA2_ANIM_VARIANT_TA_DEFEAT_BOSS_ASAP)
#define SA2_ANIM_VARIANT_TA_JP_CANT_PLAY (3 + SA2_ANIM_VARIANT_TA_CANT_PLAY_THIS_YET)

// Variants: LEVEL_TO_ZONE(levelId)
#define SA2_ANIM_TIME_ATTACK_ZONE_NAME     1063
#define SA2_ANIM_TIME_ATTACK_BOSS_NAMES_JP 1064
#define SA2_ANIM_TIME_ATTACK_BOSS_NAMES_EN 1065

#define SA2_ANIM_PAUSE_MENU_JP 1066
#define SA2_ANIM_PAUSE_MENU_EN 1067
#define SA2_ANIM_PAUSE_MENU_DE 1068
#define SA2_ANIM_PAUSE_MENU_FR 1069
#define SA2_ANIM_PAUSE_MENU_ES 1070
#define SA2_ANIM_PAUSE_MENU_IT 1071

#define SA2_ANIM_TA_RECORD             1072
#define SA2_ANIM_VARIANT_TA_NEW_RECORD 0
#define SA2_ANIM_VARIANT_TA_TIME       1

#define SA2_ANIM_VS 1073

// TODO: Translate Japanese texts
#define SA2_ANIM_MP_MSG 1074
// 0 = SA2_ANIM_VARIANT_MP_COMM_MSG_PLEASE_WAIT
// 1 = SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR
// 2 = SA2_ANIM_VARIANT_MP_COMM_MSG_PLAY_AGAIN
// 3 = SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P
// 4 = SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_3P
// 5 = SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_4P
#define SA2_ANIM_VARIANT_MP_MSG_OK         6
#define SA2_ANIM_VARIANT_MP_MSG_ERROR      7
#define SA2_ANIM_VARIANT_MP_MSG_2          8
#define SA2_ANIM_VARIANT_MP_MSG_3          9
#define SA2_ANIM_VARIANT_MP_MSG_4          10
#define SA2_ANIM_VARIANT_MP_MSG_JAPANESE_6 11
#define SA2_ANIM_VARIANT_MP_MSG_JAPANESE_7 12
#define SA2_ANIM_VARIANT_MP_MSG_1P         13
#define SA2_ANIM_VARIANT_MP_MSG_2P         14
#define SA2_ANIM_VARIANT_MP_MSG_3P         15
#define SA2_ANIM_VARIANT_MP_MSG_4P         16
#define SA2_ANIM_VARIANT_MP_MSG_JAPANESE_8 17
#define SA2_ANIM_VARIANT_MP_MSG_JAPANESE_9 18

#define SA2_ANIM_MULTIPLAYER_CHEESE_SITTING               1075
#define SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_HAPPY 0
#define SA2_ANIM_VARIANT_MULTIPLAYER_CHEESE_SITTING_SAD   1
#define SA2_ANIM_MULTIPLAYER_UNKNOWN                      1076
#define SA2_ANIM_VARIANT_MULTIPLAYER_UNKNOWN_ARROWS       9

#define SA2_ANIM_MP_COMM_MSG_EN 1079
#define SA2_ANIM_MP_COMM_MSG_DE 1080
#define SA2_ANIM_MP_COMM_MSG_FR 1081
#define SA2_ANIM_MP_COMM_MSG_ES 1082
#define SA2_ANIM_MP_COMM_MSG_IT 1083
// | "PLEASE WAIT..."        | "BITTE WARTEN..."         | "VEUILLEZ PATIENTER..."
// | "ESPERE POR FAVOR..."   | "ASPETTARE..."            |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_PLEASE_WAIT 0
// | "COMMUNICATION ERROR"   | "KOMMUNIKATIONSFEHLER"    | "ERREUR DE COMMUNICATION"
// | "ERROR DE COMUNICACIÓN" | "ERRORE DI COMUNICAZIONE" |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_COMMUNICATION_ERROR 1
// | "PLAY AGAIN?"           | "NOCHMAL SPIELEN?"        | "REJOUER?"
// | "¿JUEGA DE NUEVO?"      | "GIOCARE DI NUOVO?"       |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_PLAY_AGAIN 2
// "LET'S PLAY WITH 2 PLAYERS!" |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_2P 3
// "LET'S PLAY WITH 3 PLAYERS!" |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_3P 4
// "LET'S PLAY WITH 4 PLAYERS!" |
#define SA2_ANIM_VARIANT_MP_COMM_MSG_LETS_PLAY_WITH_4P 5
#define SA2_ANIM_VARIANT_MP_COMM_MSG_YES               6 // "YES"
#define SA2_ANIM_VARIANT_MP_COMM_MSG_NO                7 // "NO"

#define SA2_ANIM_MP_TEAM_PLAY_MSG_EN 1084
#define SA2_ANIM_MP_TEAM_PLAY_MSG_DE 1085
#define SA2_ANIM_MP_TEAM_PLAY_MSG_FR 1086
#define SA2_ANIM_MP_TEAM_PLAY_MSG_ES 1086
#define SA2_ANIM_MP_TEAM_PLAY_MSG_IT 1087

#define SA2_ANIM_MP_SINGLE_PAK_RESULTS_CUMULATIVE              1099
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_CUMULATIVE_0    0
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_CUMULATIVE_1    1
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_CUMULATIVE_2    2
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_CUMULATIVE_WINS 3 // "win(s)"

#define SA2_ANIM_MP_SINGLE_PAK_RESULTS_ROUND              1100
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_ROUND_WIN  0
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_ROUND_LOSE 1
#define SA2_ANIM_VARIANT_MP_SINGLE_PAK_RESULTS_ROUND_DRAW 2

#define SA2_ANIM_MP_RESULT_JP   1101
#define SA2_ANIM_MP_RESULT      1102
#define SA2_ANIM_MP_RESULT_WIN  0
#define SA2_ANIM_MP_RESULT_LOSE 1
#define SA2_ANIM_MP_RESULT_DRAW 2
#define SA2_ANIM_MP_RESULT_1ST  3
#define SA2_ANIM_MP_RESULT_2ND  4
#define SA2_ANIM_MP_RESULT_3RD  5
#define SA2_ANIM_MP_RESULT_4TH  6

// We can infer this Chao is Cheese, since they have a red bow
#define SA2_ANIM_MP_CHEESE_WAVING                1103
#define SA2_ANIM_MP_CHEESE_SITTING               1104
#define SA2_ANIM_DIGITS                          1105
#define SA2_ANIM_PRESS_START_MSG_JP              1106
#define SA2_ANIM_PRESS_START_MSG_EN              1107
#define SA2_ANIM_PRESS_START_MSG_DE              1108
#define SA2_ANIM_PRESS_START_MSG_FR              1109
#define SA2_ANIM_PRESS_START_MSG_ES              1110
#define SA2_ANIM_PRESS_START_MSG_IT              1111
#define SA2_ANIM_STAGE_INTRO_ACT_LETTERS         1112
#define SA2_ANIM_STAGE_INTRO_TRIANGLES           1113
#define SA2_ANIM_STAGE_INTRO_CHARACTER_LOGO      1114
#define SA2_ANIM_STAGE_INTRO_LOADING_WHEEL       1115
#define SA2_ANIM_STAGE_INTRO_LOADING_WHEEL_ICONS 1116
#define SA2_ANIM_STAGE_INTRO_ZONE_NAMES          1117
#define SA2_ANIM_STAGE_INTRO_UNLOCKED_ICONS      1118

#define SA2_ANIM_ASCII            1119
#define SA2_ANIM_ASCII_FIRST_CHAR '!'
#define SA2_ANIM_ASCII_YEN        '\\'
#define SA2_ANIM_ASCII_CHAR(c)    ((c)-SA2_ANIM_ASCII_FIRST_CHAR + 1)
#define SA2_ANIM_NUM_ASCII_CHARS  94

// Used in Time Attack and stage results screen (/ stage outro)
#define SA2_ANIM_TA_WHITE_BAR                      1120
#define SA2_ANIM_CHAR_GOT_THROUGH                  1121
#define SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_SONIC    0
#define SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_CREAM    4
#define SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_TAILS    1
#define SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_KNUCKLES 2
#define SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_AMY      3

#define SA2_ANIM_RESULTS_HEADLINE                        1122
#define SA2_ANIM_VARIANT_RESULTS_HEADLINE_GOT_THROUGH    0
#define SA2_ANIM_VARIANT_RESULTS_HEADLINE_BOSS_DESTROYED 1

#define SA2_ANIM_STAGE                    1123
#define SA2_ANIM_VARIANT_STAGE_ACT_1      0
#define SA2_ANIM_VARIANT_STAGE_ACT_2      1
#define SA2_ANIM_VARIANT_STAGE_FINAL      2
#define SA2_ANIM_VARIANT_STAGE_EXTRA      3
#define SA2_ANIM_VARIANT_STAGE_ZONE(zone) (4 + (zone))

#define SA2_ANIM_SCORE_BONUSES                 1124
#define SA2_ANIM_VARIANT_SCORE_BONUSES_TIME    0
#define SA2_ANIM_VARIANT_SCORE_BONUSES_RING    1
#define SA2_ANIM_VARIANT_SCORE_BONUSES_SP_RING 2

#define SA2_ANIM_LIFE_COUNTER                  1125
#define SA2_ANIM_VARIANT_LIFE_COUNTER_SONIC    0
#define SA2_ANIM_VARIANT_LIFE_COUNTER_TAILS    1
#define SA2_ANIM_VARIANT_LIFE_COUNTER_KNUCKLES 2
#define SA2_ANIM_VARIANT_LIFE_COUNTER_CREAM    3
#define SA2_ANIM_VARIANT_LIFE_COUNTER_AMY      4
#define ONE_UP_ICON_TILE_COUNT                 4

#define SA2_ANIM_UI_RING_CONTAINER    1126
#define SA2_ANIM_UI_RING              1127
#define SA2_ANIM_UI_SPECIAL_RING_ICON 1128
#define SA2_ANIM_COUNTDOWN            1129
#define SA2_ANIM_VARIANT_COUNTDOWN_3  0
#define SA2_ANIM_VARIANT_COUNTDOWN_2  1
#define SA2_ANIM_VARIANT_COUNTDOWN_1  2

// The "START!" graphic has 2 64x64 images (hence Left / Right variants).
#define SA2_ANIM_COUNTDOWN_START           1130
#define SA2_ANIM_VARIANT_COUNTDOWN_START_L 0
#define SA2_ANIM_VARIANT_COUNTDOWN_START_R 1

#endif // GUARDS_ANIMATIONS_H