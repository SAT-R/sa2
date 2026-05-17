#ifndef GUARD_ANIMATIONS_SA1_H
#define GUARD_ANIMATIONS_SA1_H

/* Collection of animation indices for Sonic Advance 1.
 * - By JaceCear
 */
#include "constants/sa1/anim_sizes.h"

/**************************** SA1 ****************************/

// "x_PROJ" means "projectile belonging to x"

#define SA1_ANIM_SONIC_IDLE    0
#define SA1_ANIM_TAILS_IDLE    99
#define SA1_ANIM_KNUCKLES_IDLE 199
#define SA1_ANIM_AMY_IDLE      298

#define SA1_ANIM_TAILS_SPIN_ATTACK 107

#define SA1_CHAR_ANIM_1                1
#define SA1_CHAR_ANIM_WALK             4
#define SA1_CHAR_ANIM_RUN              5
#define SA1_CHAR_ANIM_SPIN_ATTACK      8
#define SA1_CHAR_ANIM_HIT              19
#define SA1_CHAR_ANIM_20               20
#define SA1_CHAR_ANIM_DEAD             21
#define SA1_CHAR_ANIM_22               22
#define SA1_CHAR_ANIM_23               23
#define SA1_CHAR_ANIM_24               24
#define SA1_CHAR_ANIM_25               25
#define SA1_CHAR_ANIM_26               26
#define SA1_CHAR_ANIM_27               27
#define SA1_CHAR_ANIM_28               28
#define SA1_CHAR_ANIM_29               29
#define SA1_CHAR_ANIM_MARBLE_TRACK     39
#define SA1_CHAR_ANIM_GRINDING         44
#define SA1_CHAR_ANIM_50               50
#define SA1_CHAR_ANIM_BOOSTLESS_ATTACK 51
#define SA1_CHAR_ANIM_ATTACK           52
#define SA1_CHAR_ANIM_SA2_19           56
#define SA1_CHAR_ANIM_56               56
#define SA1_CHAR_ANIM_57               57
#define SA1_CHAR_ANIM_58               58
#define SA1_CHAR_ANIM_59               59
#define SA1_CHAR_ANIM_60               60
#define SA1_CHAR_ANIM_61               61
#define SA1_CHAR_ANIM_62               62
#define SA1_CHAR_ANIM_63               63
#define SA1_CHAR_ANIM_64               64
#define SA1_CHAR_ANIM_65               65

#define SA1_NUM_PLAYER_CHAR_ANIMATIONS (99) // TODO: Don't use constant here
#define SA1_ANIM_CHAR(character, anim) ((SA1_CHAR_ANIM_##anim) + CHARACTER_##character * SA1_NUM_PLAYER_CHAR_ANIMATIONS)

#define SA1_ANIM_KNUCKLES_UPPERCUT 250

#define SA1_CHAR_ANIM_AMY_LEAP 374 // Spin Dash equiv.

#define SA1_ANIM_SUPER_SONIC_TRANSFORM 398
#define SA1_ANIM_SUPER_SONIC_MOVE      399
#define SA1_ANIM_SUPER_SONIC_DASH      400

// Enemies
#define SA1_ANIM_KIKI                401
#define SA1_ANIM_KIKI_PROJ_EXPLOSION 402
#define SA1_ANIM_BUZZER              403
#define SA1_ANIM_GAMIGAMI            404
#define SA1_ANIM_RHINOTANK           405
#define SA1_ANIM_KEROKERO            406
// Defeating enemies / opening item boxes
#define SA1_ANIM_DUST_CLOUD 407
#define SA1_ANIM_KIKI_PROJ  408

#define SA1_ANIM_BUZZER_PROJ       409
#define SA1_ANIM_GAMIGAMI_PROJ     410 // TODO: shared?
#define SA1_ANIM_SENBON            411
#define SA1_ANIM_TENTOU            412
#define SA1_ANIM_FIREBALL          413
#define SA1_ANIM_FIREBALL_PROJ     414
#define SA1_ANIM_HANABII           415
#define SA1_ANIM_HANABII_FIREWORK  416
#define SA1_ANIM_SLOT              417
#define SA1_ANIM_PIERROT           418
#define SA1_ANIM_HANABII_PROJ      419
#define SA1_ANIM_SLOT_PROJ         420
#define SA1_ANIM_YUKIMARU_PROJ     421
#define SA1_ANIM_YUKIMARU          422
#define SA1_ANIM_YUKIMARU_SIDEWAYS 423
#define SA1_ANIM_DRISAME           424
#define SA1_ANIM_KURAA             425
#define SA1_ANIM_PEN               426
#define SA1_ANIM_PEN_PROJ_1        427
#define SA1_ANIM_PEN_PROJ_2        428
#define SA1_ANIM_PEN_PROJ_3        429
#define SA1_ANIM_LEON              430
#define SA1_ANIM_WAMU              431
#define SA1_ANIM_MIRROR            432
#define SA1_ANIM_OCT               433
#define SA1_ANIM_MOLE              434
#define SA1_ANIM_MIRROR_PROJ       435
#define SA1_ANIM_OCT_PROJ          436

// Animals
#define SA1_ANIM_ANIMAL_SEAL      437
#define SA1_ANIM_ANIMAL_GORILLA   438
#define SA1_ANIM_ANIMAL_PEACOCK   439
#define SA1_ANIM_ANIMAL_LION      440
#define SA1_ANIM_ANIMAL_MOLE      441
#define SA1_ANIM_ANIMAL_PARROT    442
#define SA1_ANIM_ANIMAL_PENGUIN   443
#define SA1_ANIM_ANIMAL_RABBIT    444
#define SA1_ANIM_ANIMAL_SEA_OTTER 445
#define SA1_ANIM_ANIMAL_DEER      446
#define SA1_ANIM_ANIMAL_SKUNK     447
#define SA1_ANIM_ANIMAL_ROBIN     448
#define SA1_ANIM_ANIMAL_KANGAROO  449
#define SA1_ANIM_ANIMAL_KOALA     450
#define SA1_ANIM_ANIMAL_ELEPHANT  451

// Interactables
#define SA1_ANIM_CHECKPOINT 452
#define SA1_ANIM_GOAL       453
#define SA1_ANIM_SPIKES     454
#define SA1_ANIM_SPRING     455

#define SA1_ANIM_FALLING_BOULDER 457
#define SA1_ANIM_ROCK            458
#define SA1_ANIM_ROCK_DEBRIS_S   459
#define SA1_ANIM_ROCK_DEBRIS_L   460
#define SA1_ANIM_TRAMPOLINE1     461
#define SA1_ANIM_BOUNCE_BLOCK_1  462
#define SA1_ANIM_PLATFORM_HORZ_1 463
#define SA1_ANIM_WATER_SPLASH    464

#define SA1_ANIM_SHRUBBERY            467
#define SA1_ANIM_BOUNCY_BAR           468
#define SA1_ANIM_RED_FLAG_V           469
#define SA1_ANIM_RED_FLAG_H           470
#define SA1_ANIM_BOOSTER              471
#define SA1_ANIM_BOOSTER_VERT         472
#define SA1_ANIM_WATER_BRIDGE_SPLASH  473
#define SA1_ANIM_WATER_SLIDE_SPLASH   474
#define SA1_ANIM_BUMPER_RIGHTANG      475
#define SA1_ANIM_BUMPER_TRI_H         476
#define SA1_ANIM_BUMPER_TRI_V         477
#define SA1_ANIM_FLIPPER              478
#define SA1_ANIM_BALLOON_BLUE         479
#define SA1_ANIM_BALLOON_RED          480
#define SA1_ANIM_BALLOON_YELLOW       481
#define SA1_ANIM_FIREWORKS            482 // Casino Paradise BG
#define SA1_ANIM_FIREWORKS_SMALL      483
#define SA1_ANIM_BUMPER_BIG           484
#define SA1_ANIM_BUMPER_ROUND         485
#define SA1_ANIM_BOWL_3               486
#define SA1_ANIM_CAROUSEL             487
#define SA1_ANIM_MARBLE_TRACK_EXIT    488
#define SA1_ANIM_SHIP_SWING_SEGMENT   489
#define SA1_ANIM_SHIP_SWING_HOOK      490
#define SA1_ANIM_SHIP_SWING           491
#define SA1_ANIM_SEGA_SONIC_LETTERS   492
#define SA1_ANIM_BARREL_OF_DOOM_MINI  493
#define SA1_ANIM_PLATFORM_SQU_3       494
#define SA1_ANIM_PLATFORM_HORZ_3      495
#define SA1_ANIM_PANEL_GATE_SIDEWAYS  496
#define SA1_ANIM_PANEL_GATE_UPDOWN    497
#define SA1_ANIM_CRANE_CLAW_2         498
#define SA1_ANIM_BOUNCE_BLOCK_2       499
#define SA1_ANIM_CRANE_CLAW_2_2       500
#define SA1_ANIM_STEAM_EXHAUST_LID    501
#define SA1_ANIM_CRUMBLE_PLATFORM_2_3 502
#define SA1_ANIM_ANCHOR_HANDLES       503
#define SA1_ANIM_HOOK_RAIL_2          504 // Variants: 0 = Rail, 1 = Anchor
#define SA1_ANIM_TRAMPOLINE2          505
#define SA1_ANIM_PLATFORM_HORZ_2      506
#define SA1_ANIM_BOUNCE_BLOCK_2_1     507
#define SA1_ANIM_CONVEYOR_BELT_2_WIDE 508
#define SA1_ANIM_CONVEYOR_BELT_2_SLIM 509
#define SA1_ANIM_IRON_BALL            510
#define SA1_ANIM_TORCH6_1             511
#define SA1_ANIM_TORCH6_2             512
#define SA1_ANIM_CRUMBLE_PLATFORM_6_1 513

#define SA1_ANIM_PROPELLER         515
#define SA1_ANIM_SPIKED_BARREL     516
#define SA1_ANIM_PLATFORM_HORZ_6_1 517
#define SA1_ANIM_PLATFORM_SQU_6_1  518
#define SA1_ANIM_PLATFORM_LONG_6_1 519

#define SA1_ANIM_PLATFORM_SPIKED_3      521
#define SA1_ANIM_BLUE_FLIPPER           522
#define SA1_ANIM_PLATFORM_HORZ_4        523
#define SA1_ANIM_PLATFORM_SQU_4         524
#define SA1_ANIM_PLATFORM_HORZ_4_PURPLE 525
#define SA1_ANIM_SPRING_PLATFORM_4      526
#define SA1_ANIM_CRUMBLE_PLATFORM_4     527
#define SA1_ANIM_PLATFORM_SQU_4_PURPLE  528
#define SA1_ANIM_SKATING_STONE_4        529
#define SA1_ANIM_FERRIS_WHEEL_HOOK      530
#define SA1_ANIM_FERRIS_WHEEL_SEGMENT   531
#define SA1_ANIM_AIR_BUBBLES            532
#define SA1_ANIM_MINIBUBBLES            533
#define SA1_ANIM_SECURITY_GATE          534
#define SA1_ANIM_PLATFORM_HORZ_5        535
#define SA1_ANIM_PLATFORM_LONG_V_5      536
#define SA1_ANIM_PLATFORM_LONG_H_5      537
#define SA1_ANIM_PLATFORM_SPIKED_5_UP   538
#define SA1_ANIM_PLATFORM_SPIKED_5_DOWN 539
#define SA1_ANIM_SPRING_PLATFORM_5      540
#define SA1_ANIM_IRON_BALL_5            541
#define SA1_ANIM_RUN_WHEEL              542
#define SA1_ANIM_BOUNCE_BLOCK_5         543
#define SA1_ANIM_PLATFORM_SQU_ARROW     544
#define SA1_ANIM_LIFT                   545
#define SA1_ANIM_BOWL_5                 546
#define SA1_ANIM_SKATING_STONE          547
#define SA1_ANIM_SKATING_STONE_DEBRIS_L 548
#define SA1_ANIM_SKATING_STONE_DEBRIS_S 549

#define SA1_ANIM_CRUMBLE_PLATFORM_5              551
#define SA1_ANIM_WATER_SPLASH_5                  552
#define SA1_ANIM_SKATING_STONE_DEBRIS_4_L        553
#define SA1_ANIM_SKATING_STONE_DEBRIS_4_S        554
#define SA1_ANIM_ICE_BLOCK                       555
#define SA1_ANIM_ICE_BLOCK_SHARDS_L              556
#define SA1_ANIM_ICE_BLOCK_SHARDS_S              557
#define SA1_ANIM_TORCH5                          558
#define SA1_ANIM_BREAKABLE_WALL_1                559
#define SA1_ANIM_PLATFORM_LAVA_SPURT             560
#define SA1_ANIM_PLATFORM_LAVA                   561
#define SA1_ANIM_ICE_SLIDE_SPLASH                562
#define SA1_ANIM_WATER_SURFACE                   563
#define SA1_ANIM_DEBRIS_A                        564
#define SA1_ANIM_DEBRIS_B                        565
#define SA1_ANIM_DEBRIS_C                        566
#define SA1_ANIM_STEAM_EXHAUST                   567 // Version without lid (with lid: SA1_ANIM_STEAM_EXHAUST_LID)
#define SA1_ANIM_MUD_SLIDE_SPLASH                568
#define SA1_ANIM_HOOK_RAIL_3                     569
#define SA1_ANIM_BOOSTER_STEEP_CLOCKWISE         570
#define SA1_ANIM_BOOSTER_STEEP_COUNTER_CLOCKWISE 571
#define SA1_ANIM_SPECIAL_SPRING                  572
#define SA1_ANIM_DRISAME_ICEBLOCK                573
#define SA1_ANIM_FALLING_BRICK_XZONE             574
#define SA1_ANIM_BOSS_CAPSULE_LARGE              575
#define SA1_ANIM_BOSS_CAPSULE_SWITCH             576
#define SA1_ANIM_BOSS_CAPSULE_SHELL              577
#define SA1_ANIM_BOSS_CAPSULE_SMALL              578
#define SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_LARGE   579
#define SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_SMALL   580
#define SA1_ANIM_WATER_FALL_HIT_SURFACE          581
#define SA1_ANIM_SPRING_PLATFORM_6               582
#define SA1_ANIM_CAROUSEL_POLE                   583

// 584
#define SA1_ANIM_PIPE_ENTER_6_1_V 584
#define SA1_ANIM_PIPE_EXIT_6_1_V  585
#define SA1_ANIM_PIPE_ENTER_6_1_H 586
#define SA1_ANIM_PIPE_EXIT_6_1_H  587
#define SA1_ANIM_PIPE_ENTER_H     588
#define SA1_ANIM_PIPE_GATE_2_H    588
#define SA1_ANIM_PIPE_ENTER_V     589
#define SA1_ANIM_PIPE_GATE_2_V    589
#define SA1_ANIM_PIPE_ENTER_6_2_H 590
#define SA1_ANIM_PIPE_ENTER_6_2_V 591
#define SA1_ANIM_AIR_MAZE_CORNER  592
#define SA1_ANIM_MAZE_AIR_CORNER  592
#define SA1_ANIM_EGG_BALL_PIPES   593

#define SA1_ANIM_PLATFORM_HORZ_6_2           598
#define SA1_ANIM_PLATFORM_SQU_6_2            599
#define SA1_ANIM_PLATFORM_LONG_6_2           600
#define SA1_ANIM_BOUNCE_BLOCK_6_2            601
#define SA1_ANIM_CRUMBLE_PLATFORM_6_2        602
#define SA1_ANIM_CONVEYOR_BELT_6_SLIM        603
#define SA1_ANIM_CONVEYOR_BELT_6_WIDE        604
#define SA1_ANIM_PLATFORM_HORZ_7_1           605
#define SA1_ANIM_CHAO_HUNT_COUNTER_BACKDROP  606
#define SA1_ANIM_BOSS_1_BODY                 607
#define SA1_ANIM_BOSS_1_HAMMER_SEGMENT       608
#define SA1_ANIM_BOSS_1_HAMMER               609
#define SA1_ANIM_BOSS_1_EGGMAN               610
#define SA1_ANIM_BOSS_1_EXPLOSION            611
#define SA1_ANIM_BOSS_1_BODY_NO_BELT         612
#define SA1_ANIM_BOSS_1_BELT_FRONT_L         613
#define SA1_ANIM_BOSS_1_BELT_FRONT_R         614
#define SA1_ANIM_BOSS_1_BELT_BACK_L          615
#define SA1_ANIM_BOSS_1_BELT_BACK_R          616
#define SA1_ANIM_BOSS_2_BASE                 617
#define SA1_ANIM_BOSS_2_EGGMAN               618
#define SA1_ANIM_BOSS_2_SPRING               619
#define SA1_ANIM_BOSS_2                      620
#define SA1_ANIM_BOSS_2_NO_SPRING            621
#define SA1_ANIM_BOSS_3_EGGMAN               622
#define SA1_ANIM_BOSS_3_STAR_DISC            623
#define SA1_ANIM_BOSS_3_MOBILE               624
#define SA1_ANIM_BOSS_3_SPIKE_BALL           625
#define SA1_ANIM_BOSS_4_BODY                 626
#define SA1_ANIM_BOSS_4_DRILL4               627
#define SA1_ANIM_BOSS_4                      628
#define SA1_ANIM_BOSS_4_EGGMAN               629
#define SA1_ANIM_BOSS_4_ICICLE               630
#define SA1_ANIM_BOSS_5_PHASE1_ACTIVATE      631
#define SA1_ANIM_BOSS_5_PHASE1_IDLE          632
#define SA1_ANIM_BOSS_5_PHASE1_TURN          633
#define SA1_ANIM_BOSS_5_PHASE1_HIT           634
#define SA1_ANIM_BOSS_5_PHASE1_GROUND        635
#define SA1_ANIM_BOSS_5_PHASE1_SPIN          636
#define SA1_ANIM_BOSS_5_PHASE1_SPINDASH      637
#define SA1_ANIM_BOSS_5_PHASE1_GLIDE         638
#define SA1_ANIM_BOSS_5_PHASE1_GLIDE_TURN    639
#define SA1_ANIM_BOSS_5_PHASE1_LAND          640
#define SA1_ANIM_BOSS_5_PHASE1_FACEPLANT     641
#define SA1_ANIM_BOSS_5_PHASE1_COVER         642
#define SA1_ANIM_BOSS_5_PHASE1_PUNCH         643
#define SA1_ANIM_BOSS_5_PHASE2_IDLE          644
#define SA1_ANIM_BOSS_5_PHASE2_TURN          645
#define SA1_ANIM_BOSS_5_PHASE2_HIT           646
#define SA1_ANIM_BOSS_5_PHASE2_GROUND        647
#define SA1_ANIM_BOSS_5_PHASE2_SPIN          648
#define SA1_ANIM_BOSS_5_PHASE2_SPINDASH      649
#define SA1_ANIM_BOSS_5_PHASE2_GLIDE         650
#define SA1_ANIM_BOSS_5_PHASE2_GLIDE_TURN    651
#define SA1_ANIM_BOSS_5_PHASE2_LAND          652
#define SA1_ANIM_BOSS_5_PHASE2_FACEPLANT     653
#define SA1_ANIM_BOSS_5_PHASE2_COVER         654
#define SA1_ANIM_BOSS_5_PHASE2_LAUNCH_ROCKET 655
#define SA1_ANIM_BOSS_5_PHASE2_ROCKET        656
#define SA1_ANIM_BOSS_5_PHASE2_DEFEATED      657
#define SA1_ANIM_BOSS_5_PHASE2_PARTS         658
#define SA1_ANIM_BOSS_6_SEGMENT              659
#define SA1_ANIM_BOSS_6_EGGMAN               660
#define SA1_ANIM_BOSS_6_SPIKE                661
#define SA1_ANIM_BOSS_6_BODY                 662
#define SA1_ANIM_BOSS_6_LASER                663
#define SA1_ANIM_BOSS_6_PROJ                 664
#define SA1_ANIM_BOSS_XTRA_HEAD              665
#define SA1_ANIM_BOSS_XTRA_PALETTE           666
#define SA1_ANIM_BOSS_XTRA_HIP               667
#define SA1_ANIM_BOSS_XTRA_PROPULSION        668
#define SA1_ANIM_BOSS_XTRA_BEARING           669
#define SA1_ANIM_BOSS_XTRA_CAPSULE           670
#define SA1_ANIM_BOSS_XTRA_CAPSULE_PART      671
#define SA1_ANIM_BOSS_XTRA_LASER             672
#define SA1_ANIM_BOSS_XTRA_ARM               673
#define SA1_ANIM_BOSS_XTRA_ARM_BEARING       674
#define SA1_ANIM_BOSS_XTRA_LIGHT_CHARGE      675
#define SA1_ANIM_BOSS_XTRA_ROCK0             676
#define SA1_ANIM_BOSS_XTRA_ROCK1             677
#define SA1_ANIM_BOSS_XTRA_ROCK2             678
#define SA1_ANIM_BOSS_X2_DRILL               679
#define SA1_ANIM_BOSS_X2_EGGMAN              680
#define SA1_ANIM_BOSS_X2_WHEEL               681
#define SA1_ANIM_BOSS_X2_EGGDRILLSTER        682
#define SA1_ANIM_BOSS_X1_EGGMOBILE_DECO      683
#define SA1_ANIM_BOSS_X1_EGGMOBILE           684
#define SA1_ANIM_BOSS_X1_BALL                685
#define SA1_ANIM_BOSS_X1_EGGMAN              686
#define SA1_ANIM_EGGX_BODY                   687
#define SA1_ANIM_EGGX_ROTARY                 688
#define SA1_ANIM_EGGX_HAND                   689
#define SA1_ANIM_EGGX_BALL                   690
#define SA1_ANIM_EGGX_EGGMAN                 691
#define SA1_ANIM_EGGMOBILE                   693
#define SA1_ANIM_EGGMAN                      694

#define SA1_ANIM_CHAO_SHOCKED         698
#define SA1_ANIM_CHAO_HOVER_SIDE      699
#define SA1_ANIM_CHAO_FACE_FORWARD    700
#define SA1_ANIM_CHAO_FACE_DIAGONAL_L 701
#define SA1_ANIM_CHAO_FACE_DIAGONAL_R 702
#define SA1_ANIM_CHAO_TURN            703
#define SA1_ANIM_CHAO_SITTING         704
#define SA1_ANIM_ITEMBOX              705
#define SA1_ANIM_ITEMBOX_TYPE         706
#define SA1_ANIM_RING                 707
#define SA1_ANIM_RING_COLLECT_EFFECT  708
#define SA1_ANIM_SCORE                709

#define SA1_ANIM_COLLECT_RINGS_COUNTER_BACKDROP 714
#define SA1_ANIM_GAME_OVER                      715
#define SA1_ANIM_NEO_GREEN_HILL_ZONE_OLD        716
#define SA1_ANIM_TO_BE_CONTINUED                717
#define SA1_ANIM_PAUSE                          718
#define SA1_ANIM_WARNING                        719
#define SA1_ANIM_PAUSE_BACKGROUND               720
#define SA1_ANIM_DEMO_PLAY                      721
#define SA1_ANIM_INTRO_CHARACTERS               722
#define SA1_ANIM_CHAR_SELECT_BG                 723
#define SA1_ANIM_ZONE_SELECT_ACTS               724
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_1        725
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_2        726
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_3        727
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_FINAL    728
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_EXTRA    729
#define SA1_ANIM_CHAR_SELECT_NOT_SELECTABLE     730
#define SA1_ANIM_FINAL_CUTSCENE_SPARKLE_A       731
#define SA1_ANIM_FINAL_CUTSCENE_SPARKLE_B       732
#define SA1_ANIM_FINAL_CUTSCENE_ART_A           733
#define SA1_ANIM_FINAL_CUTSCENE_ART_B           734
#define SA1_ANIM_FINAL_CUTSCENE_TORNADO_FRONT   735
#define SA1_ANIM_FINAL_CUTSCENE_TORNADO_SIDE    736

#define SA1_ANIM_GET_THE_CHAOS_EMERALDS_EGGMAN 739
#define SA1_ANIM_CREDITS_COMPANY_LOGOS         740
#define SA1_ANIM_CREDITS_COPYRIGHT             741
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_4       742
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_5       743
#define SA1_ANIM_ZONE_SELECT_THUMBNAIL_6       744
#define SA1_ANIM_ARROW_UP                      745
#define SA1_ANIM_SPINDASH_DUST_EFFECT          746
#define SA1_ANIM_SPINDASH_DUST_EFFECT_BIG      747
#define SA1_ANIM_SMALL_DUST_PARTICLE           748
#define SA1_ANIM_GRIND_EFFECT                  749
#define SA1_ANIM_SHIELD_NORMAL                 750
#define SA1_ANIM_SHIELD_MAGNETIC               751
#define SA1_ANIM_INVINCIBILITY                 752
#define SA1_ANIM_BUBBLES_SMALL                 753
#define SA1_ANIM_BUBBLES_GROUP                 754

#define SA1_ANIM_HEART           759
#define SA1_ANIM_INDICATOR_SONIC 767

#define SA1_ANIM_INTRO_SILHOUETTES     769
#define SA1_ANIM_INTRO_TEXTS_SONIC     770
#define SA1_ANIM_INTRO_TEXTS_TAILS     771
#define SA1_ANIM_INTRO_TEXTS_KNUCKLES  772
#define SA1_ANIM_INTRO_TEXTS_AMY       773
#define SA1_ANIM_INTRO_EMERALD         774
#define SA1_ANIM_SUPER_SONIC_SPARKLE   775
#define SA1_ANIM_TAILS_TAIL_SWIPE      777
#define SA1_ANIM_PRESS_START_MSG_JP    778
#define SA1_ANIM_PRESS_START_MSG_EN    779
#define SA1_ANIM_TITLE_COPYRIGHT       780
#define SA1_ANIM_DROWN_COUNTDOWN       781
#define SA1_ANIM_KNUCKLES_FLOAT_SPLASH 782
#define SA1_ANIM_A_FEW_DAYS_LATER_EN   783

#define SA1_ANIM_A_FEW_DAYS_LATER_JP 786

#define SA1_ANIM_SOME_CLOUD_XS 790
#define SA1_ANIM_SOME_CLOUD_S  791
#define SA1_ANIM_SOME_CLOUD_M  792
#define SA1_ANIM_SOME_CLOUD_L  793
#define SA1_ANIM_CONFUSION     794
#define SA1_ANIM_RING_2        795

#define SA1_END_CUTSCENE_PILOT_FACE 805

#define SA1_ANIM_PAUSE_BACKGROUND_TA        809
#define SA1_ANIM_PAUSE_TA                   810
#define SA1_ANIM_SP_STAGE_WELCOME           811
#define SA1_ANIM_SP_STAGE_FEEDBACK_MESSAGES 812
#define SA1_ANIM_SP_STAGE_PLAYER_SPEECH     813

#define SA1_ANIM_LOAD_PALETTE_423    852
#define SA1_ANIM_SOUNDTEST_AMY_BYE   853
#define SA1_ANIM_SOUNDTEST_AMY_IDLE  854
#define SA1_ANIM_SOUNDTEST_AMY_SHAKE 855
#define SA1_ANIM_SOUNDTEST_AMY_KISS  856
#define SA1_ANIM_MENU_CURSOR         857

#define SA1_ANIM_OPTS_BLACK_RECT 860

#define SA1_ANIM_OPTS_PLDAT_LANG_EN 864
#define SA1_ANIM_OPTS_PLDAT_LANG_JP 865

#define SA1_ANIM_VS_RECORD_TEXTS_EN 868
#define SA1_ANIM_VS_RECORD_TEXTS_JP 869

#define SA1_ANIM_ONLY_CHAO_MSGBOX 879

#define SA1_ANIM_MP_CHAR_NAME           881
#define SA1_ANIM_MP_ACT_MSG_EN          884
#define SA1_ANIM_MP_PLAYER_MSG_EN       885
#define SA1_ANIM_MP_CHAO_ERROR          886
#define SA1_ANIM_MP_CHAO_AVATAR         887
#define SA1_ANIM_MP_CHAO_SEARCHING      888
#define SA1_ANIM_MP_CHAO_CONNECTED      889
#define SA1_ANIM_MP_PRESS_START_EN      890
#define SA1_ANIM_MP_OUTCOME_MESSAGES_EN 891
#define SA1_ANIM_MP_OUTCOME_MESSAGES_JP 892
#define SA1_ANIM_MP_PRESS_START_JP      893

#define SA1_ANIM_MP_SINGLE_PAK_RESULTS_ROUND 896
#define SA1_ANIM_MP_GAME_PAK_MODE_EN         897

#define SA1_ANIM_MP_PLAYER_MSG_JP 899

#define SA1_ANIM_MP_SINGLE_PAK_RESULTS_CUMULATIVE 900
#define SA1_ANIM_MP_GAME_PAK_MODE_JP              901

#define SA1_ANIM_VS_RESULT          904
#define SA1_ANIM_VS_MENU_WAIT       905
#define SA1_ANIM_CRUMBLE_PLATFORM_1 906
#define SA1_ANIM_MP_TIMER_DIGITS    907

#endif // GUARD_ANIMATIONS_SA1_H
