.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.global gSpritePosData_itemboxes
gSpritePosData_itemboxes:
	.4byte zone1_act1_itemboxes
	.4byte zone1_act2_itemboxes
	.4byte zone1_boss_itemboxes
	.4byte zone1_act2_itemboxes
	.4byte zone2_act1_itemboxes
	.4byte zone2_act2_itemboxes
	.4byte zone2_boss_itemboxes
	.4byte zone2_act2_itemboxes
	.4byte zone3_act1_itemboxes
	.4byte zone3_act2_itemboxes
	.4byte zone3_boss_itemboxes
	.4byte zone3_act2_itemboxes
	.4byte zone4_act1_itemboxes
	.4byte zone4_act2_itemboxes
	.4byte zone4_boss_itemboxes
	.4byte zone4_act2_itemboxes
	.4byte zone5_act1_itemboxes
	.4byte zone5_act2_itemboxes
	.4byte zone5_boss_itemboxes
	.4byte zone5_act2_itemboxes
	.4byte zone6_act1_itemboxes
	.4byte zone6_act2_itemboxes
	.4byte zone6_boss_itemboxes
	.4byte zone6_act2_itemboxes
	.4byte zone7_act1_itemboxes
	.4byte zone7_act2_itemboxes
	.4byte zone7_boss_itemboxes
	.4byte zone7_act2_itemboxes
	.4byte zone8_act1_itemboxes
	.4byte zone8_act2_itemboxes
	.4byte zone8_boss_itemboxes
	.4byte 0
	.4byte 0
	.4byte 0

.global gSpritePosData_enemies
gSpritePosData_enemies:
	.4byte zone1_act1_enemies
	.4byte zone1_act2_enemies
	.4byte zone1_boss_enemies
	.4byte zone1_act2_enemies
	.4byte zone2_act1_enemies
	.4byte zone2_act2_enemies
	.4byte zone2_boss_enemies
	.4byte zone2_act2_enemies
	.4byte zone3_act1_enemies
	.4byte zone3_act2_enemies
	.4byte zone3_boss_enemies
	.4byte zone3_act2_enemies
	.4byte zone4_act1_enemies
	.4byte zone4_act2_enemies
	.4byte zone4_boss_enemies
	.4byte zone4_act2_enemies
	.4byte zone5_act1_enemies
	.4byte zone5_act2_enemies
	.4byte zone5_boss_enemies
	.4byte zone5_act2_enemies
	.4byte zone6_act1_enemies
	.4byte zone6_act2_enemies
	.4byte zone6_boss_enemies
	.4byte zone6_act2_enemies
	.4byte zone7_act1_enemies
	.4byte zone7_act2_enemies
	.4byte zone7_boss_enemies
	.4byte zone7_act2_enemies
	.4byte zone8_act1_enemies
	.4byte zone8_act2_enemies
	.4byte zone8_boss_enemies
	.4byte 0
	.4byte 0
	.4byte 0


    .global gSpriteInits_Interactables @ 080D4E1C
gSpriteInits_Interactables:
    .4byte CreateEntity_Toggle_PlayerLayer
    .4byte CreateEntity_Toggle_PlayerLayer
    .4byte CreateEntity_Platform
    .4byte CreateEntity_Spring_Normal_Up
    .4byte CreateEntity_Spring_Normal_Down
    .4byte CreateEntity_Spring_Normal_Right
    .4byte CreateEntity_Spring_Normal_Left
    .4byte CreateEntity_Spring_Big_UpLeft
    .4byte CreateEntity_Spring_Big_UpRight
    .4byte CreateEntity_Spring_Big_DownRight
    .4byte CreateEntity_Spring_Big_DownLeft
    .4byte CreateEntity_Spring_Small_UpRight
    .4byte CreateEntity_Spring_Small_UpLeft
    .4byte CreateEntity_CommonThinPlatform
    .4byte CreateEntity_Decoration
    .4byte CreateEntity_Ramp
    .4byte CreateEntity_Booster
    .4byte CreateEntity_InclineRamp @ The one at the end of Leaf Forest Act 1 (also in LF Act 2 and Sky Canyon Act 2)
    .4byte CreateEntity_BouncySpring
    .4byte CreateEntity_019
    .4byte CreateEntity_RotatingHandle
    .4byte CreateEntity_GappedLoop_Start
    .4byte CreateEntity_GappedLoop_End

    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Down
    .4byte CreateEntity_Spikes_LeftRight @ Left
    .4byte CreateEntity_Spikes_LeftRight @ Right
    .4byte CreateEntity_Spikes_HidingUp
    .4byte CreateEntity_Spikes_HidingDown

    .4byte CreateEntity_Corkscrew_Start
    .4byte CreateEntity_Corkscrew_End
    .4byte CreateEntity_BouncyBar
    .4byte CreateEntity_GrindRail_Start
    .4byte CreateEntity_GrindRail_StartAir @ Enables not only from air, but when running on water aswell.
    .4byte CreateEntity_GrindRail_EndGround
    .4byte CreateEntity_GrindRail_End_ForcedJump
    .4byte CreateEntity_GrindRail_EndAlternate
    .4byte CreateEntity_GrindRail_EndAir
    .4byte CreateEntity_GrindRail_EndGround_Left
    .4byte CreateEntity_GrindRail_EndAir_Left
    .4byte CreateEntity_Corkscrew3D_Start
    .4byte CreateEntity_Corkscrew3D_End
    .4byte CreateEntity_StageGoal
    .4byte CreateEntity_Checkpoint
    .4byte CreateEntity_044    @ Used at layer transitions on three-quarter-type loops
    .4byte CreateEntity_Toggle_Checkpoint
    .4byte CreateEntity_Toggle_StageGoal
    .4byte CreateEntity_WindUpStick @ Character rotates a bit around it, then shoots up/down
    .4byte CreateEntity_048
    .4byte CreateEntity_HookRail_Start
    .4byte CreateEntity_HookRail_End
    .4byte CreateEntity_Windmill
    .4byte CreateEntity_TurnAroundBar
    .4byte CreateEntity_Crane
    .4byte CreateEntity_DashRing
    .4byte CreateEntity_FloatingSpring_Up
    .4byte CreateEntity_Note_Sphere
    .4byte CreateEntity_Note_Block
    .4byte CreateEntity_GuitarString
    .4byte CreateEntity_Keyboard_Vertical
    .4byte CreateEntity_Keyboard_Horizontal_PushLeft
    .4byte CreateEntity_Keyboard_Horizontal_PushRight
    .4byte CreateEntity_GermanFlute
    .4byte CreateEntity_FrenchHorn_Entry
    .4byte CreateEntity_PipeInstrument_Entry
    .4byte CreateEntity_SlowingSnow
    .4byte CreateEntity_FunnelSphere
    .4byte CreateEntity_HalfPipe_End     @ Like in SA1 Neo Green Hill
    .4byte CreateEntity_HalfPipe_Start   @ Like in SA1 Neo Green Hill
    .4byte CreateEntity_069
    .4byte CreateEntity_NoteBlock
    .4byte CreateEntity_044
    .4byte CreateEntity_ClearPipe_Start
    .4byte CreateEntity_ClearPipe_End
    .4byte CreateEntity_LightBridge               @ Techno Base - Loud Digital Path
    .4byte CreateEntity_075_0
    .4byte CreateEntity_075_1
    .4byte CreateEntity_075_2             @ Techno Base - Box Platform (Launch player up)
    .4byte CreateEntity_078
    .4byte CreateEntity_079
    .4byte CreateEntity_080
    .4byte CreateEntity_Platform_Square
    .4byte CreateEntity_GiantPropeller
    .4byte CreateEntity_SlidyIce
    .4byte CreateEntity_SmallSpinnyWindmill
    .4byte CreateEntity_085
    .4byte CreateEntity_Whirlwind_0
    .4byte CreateEntity_SmallPropeller_Left
    .4byte CreateEntity_SmallPropeller_Right
    .4byte CreateEntity_SmallPropeller_Left_Periodic
    .4byte CreateEntity_SmallPropeller_Right_Periodic
    .4byte CreateEntity_Launcher_Left_GDown
    .4byte CreateEntity_Launcher_Right_GDown
    .4byte CreateEntity_Cannon
    .4byte CreateEntity_094
    .4byte CreateEntity_095
    .4byte CreateEntity_FlyingHandle
    .4byte CreateEntity_SpeedingPlatform
    .4byte CreateEntity_Toggle_Gravity__Down
    .4byte CreateEntity_Toggle_Gravity__Up
    .4byte CreateEntity_Toggle_Gravity__Toggle
    .4byte CreateEntity_Launcher_Left_GUp
    .4byte CreateEntity_Launcher_Right_GUp     @ Egg Utopia "Launcher" (like in Manias Flying Battery)
    .4byte CreateEntity_SpecialRing
    .4byte CreateEntity_Whirlwind_1
    .4byte CreateEntity_Interactable105

    @ Enemy code
    @ TODO: Some names might be wrong?
    @       Should be in line with Encyclospeedia (mostly)
    .global gSpriteInits_Enemies
gSpriteInits_Enemies:
    .4byte CreateEntity_Mon
    .4byte CreateEntity_Kiki
    .4byte CreateEntity_Buzzer
    .4byte CreateEntity_Gohla
    .4byte CreateEntity_KuraKura
    .4byte CreateEntity_Kubinaga
    .4byte CreateEntity_PikoPiko
    .4byte CreateEntity_Bell
    .4byte CreateEntity_Yado
    .4byte CreateEntity_Circus
    .4byte CreateEntity_Koura
    .4byte CreateEntity_Madillo
    .4byte CreateEntity_Straw
    .4byte CreateEntity_Hammerhead
    .4byte CreateEntity_Spinner
    .4byte CreateEntity_Mouse
    .4byte CreateEntity_Pen
    .4byte CreateEntity_GejiGeji
    .4byte CreateEntity_Balloon
    .4byte CreateEntity_Flickey
    .4byte CreateEntity_Kyura
    .4byte CreateEntity_Star
    .4byte CreateEntity_BulletBuzzer


    .global gUnknown_080D5020
gUnknown_080D5020:
    .2byte 100, 200, 400, 800, 1000, 0

@; collect the rings interactables
    .global gUnknown_080D502C
gUnknown_080D502C:
    .4byte CreateEntity_Toggle_PlayerLayer
    .4byte CreateEntity_Toggle_PlayerLayer
    .4byte CreateEntity_Spring_Normal_Up
    .4byte CreateEntity_Spring_Normal_Down
    .4byte CreateEntity_Spring_Normal_Right
    .4byte CreateEntity_Spring_Normal_Left
    .4byte CreateEntity_Spring_Big_UpLeft
    .4byte CreateEntity_Spring_Big_UpRight
    .4byte CreateEntity_Spring_Big_DownLeft
    .4byte CreateEntity_Spring_Big_DownRight
    .4byte CreateEntity_Spring_Small_UpLeft
    .4byte CreateEntity_Spring_Small_UpRight
    .4byte CreateEntity_Ramp
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_Spikes_Up
    .4byte CreateEntity_GrindRail_Start
    .4byte CreateEntity_GrindRail_StartAir
    .4byte CreateEntity_GrindRail_EndGround
    .4byte CreateEntity_GrindRail_End_ForcedJump
    .4byte CreateEntity_GrindRail_EndAlternate
    .4byte CreateEntity_GrindRail_EndAir
    .4byte CreateEntity_GrindRail_EndGround_Left
    .4byte CreateEntity_GrindRail_EndAir_Left
    .4byte CreateEntity_MysteryItemBox
    .4byte CreateEntity_8080368

    .global gSpriteTileInits_PreStageEntry
gSpriteTileInits_PreStageEntry:
    .4byte 0, 0, 0, 0                     @ Leaf Forest
    .4byte 0, 0, 0, 0                     @ Hot Crater
    .4byte 0, 0, 0, 0                     @ Music Plant
    .4byte 0, 0, 0, 0                     @ Ice Paradise
    .4byte sub_80807CC, sub_80807CC, 0, 0 @ Sky Canyon
    .4byte 0, 0, 0, 0                     @ Techno Base
    .4byte 0, 0, 0, 0                     @ Egg Utopia
    .4byte 0, 0, 0, 0                     @ Final Zone
    .4byte 0, 0                           @ (Multiplayer?)


.text
.syntax unified
.arm
