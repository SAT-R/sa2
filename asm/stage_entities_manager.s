.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.global gSpritePosData_interactables
gSpritePosData_interactables:
	.4byte zone1_act1_interactables
	.4byte zone1_act2_interactables
	.4byte zone1_boss_interactables
	.4byte zone1_act2_interactables
	.4byte zone2_act1_interactables
	.4byte zone2_act2_interactables
	.4byte zone2_boss_interactables
	.4byte zone2_act2_interactables
	.4byte zone3_act1_interactables
	.4byte zone3_act2_interactables
	.4byte zone3_boss_interactables
	.4byte zone3_act2_interactables
	.4byte zone4_act1_interactables
	.4byte zone4_act2_interactables
	.4byte zone4_boss_interactables
	.4byte zone4_act2_interactables
	.4byte zone5_act1_interactables
	.4byte zone5_act2_interactables
	.4byte zone5_boss_interactables
	.4byte zone5_act2_interactables
	.4byte zone6_act1_interactables
	.4byte zone6_act2_interactables
	.4byte zone6_boss_interactables
	.4byte zone6_act2_interactables
	.4byte zone7_act1_interactables
	.4byte zone7_act2_interactables
	.4byte zone7_boss_interactables
	.4byte zone7_act2_interactables
	.4byte zone8_act1_interactables
	.4byte zone8_act2_interactables
	.4byte zone8_boss_interactables
	.4byte 0
	.4byte 0
	.4byte 0

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
    .4byte initSprite_Interactable_Toggle_PlayerLayer
    .4byte initSprite_Interactable_Toggle_PlayerLayer
    .4byte initSprite_Interactable002
    .4byte initSprite_Interactable_Spring_Normal_Up
    .4byte initSprite_Interactable_Spring_Normal_Down
    .4byte initSprite_Interactable_Spring_Normal_Right
    .4byte initSprite_Interactable_Spring_Normal_Left
    .4byte initSprite_Interactable_Spring_Big_UpLeft
    .4byte initSprite_Interactable_Spring_Big_UpRight
    .4byte initSprite_Interactable_Spring_Big_DownRight
    .4byte initSprite_Interactable_Spring_Big_DownLeft
    .4byte initSprite_Interactable_Spring_Small_UpRight
    .4byte initSprite_Interactable_Spring_Small_UpLeft
    .4byte initSprite_Interactable_CommonThinPlatform
    .4byte initSprite_Interactable_Decoration
    .4byte initSprite_Interactable_Ramp
    .4byte initSprite_Interactable_Booster
    .4byte initSprite_Interactable_InclineRamp @ The one at the end of Leaf Forest Act 1 (also in LF Act 2 and Sky Canyon Act 2)
    .4byte initSprite_Interactable_BouncySpring
    .4byte initSprite_Interactable_019
    .4byte initSprite_Interactable_RotatingHandle
    .4byte initSprite_Interactable_gappedLoop_Start
    .4byte initSprite_Interactable_gappedLoop_End

    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Down
    .4byte initSprite_Interactable_Spikes_LeftRight @ Left
    .4byte initSprite_Interactable_Spikes_LeftRight @ Right
    .4byte initSprite_Interactable_Spikes_HidingUp
    .4byte initSprite_Interactable_Spikes_HidingDown

    .4byte initSprite_Interactable_CorkScrew_Start
    .4byte initSprite_Interactable_CorkScrew_End
    .4byte initSprite_Interactable_BouncyBar
    .4byte initSprite_Interactable_GrindRail_Start
    .4byte initSprite_Interactable_GrindRail_StartAir @ Enables not only from air, but when running on water aswell.
    .4byte initSprite_Interactable_GrindRail_EndGround
    .4byte initSprite_Interactable_GrindRail_End_ForcedJump
    .4byte initSprite_Interactable_GrindRail_EndAlternate
    .4byte initSprite_Interactable_GrindRail_EndAir
    .4byte initSprite_Interactable_GrindRail_EndGround_Left
    .4byte initSprite_Interactable_GrindRail_EndAir_Left
    .4byte initSprite_Interactable_Corkscrew3D_Start
    .4byte initSprite_Interactable_Corkscrew3D_End
    .4byte initSprite_Interactable_StageGoal
    .4byte initSprite_Interactable_Checkpoint
    .4byte initSprite_Interactable_044    @ Used at layer transitions on three-quarter-type loops
    .4byte initSprite_Interactable_Toggle_Checkpoint
    .4byte initSprite_Interactable_Toggle_StageGoal
    .4byte initSprite_Interactable_WindUpStick @ Character rotates a bit around it, then shoots up/down
    .4byte initSprite_Interactable048
    .4byte initSprite_Interactable_HookRail_Start
    .4byte initSprite_Interactable_HookRail_End
    .4byte initSprite_InteractableWindmill
    .4byte initSprite_InteractableTurnAroundBar
    .4byte initSprite_Interactable_HotCrater_Crane
    .4byte initSprite_Interactable_DashRing
    .4byte initSprite_Interactable_FloatingSpring_Up
    .4byte initSprite_Interactable_MusicPlant_Note_Sphere
    .4byte initSprite_Interactable_MusicPlant_Note_Block
    .4byte initSprite_Interactable_MusicPlant_GuitarString
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Vertical
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushLeft
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushRight
    .4byte initSprite_Interactable_MusicPlant_GermanFlute
    .4byte initSprite_Interactable_MusicPlant_FrenchHorn_Entry
    .4byte initSprite_Interactable_MusicPlant_PipeInstrument_Entry
    .4byte initSprite_Interactable_IceParadise_SlowingSnow
    .4byte initSprite_Interactable_IceParadise_FunnelSphere
    .4byte initSprite_Interactable_IceParadise_HalfPipe_End     @ Like in SA1 Neo Green Hill
    .4byte initSprite_Interactable_IceParadise_HalfPipe_Start   @ Like in SA1 Neo Green Hill
    .4byte initSprite_Interactable069
    .4byte initSprite_InteractableTecBaseNoteBlock
    .4byte initSprite_Interactable_044
    .4byte initSprite_Interactable_ClearPipe_Start
    .4byte initSprite_Interactable_ClearPipe_End
    .4byte initSprite_InteractableTecBaseLightBridge               @ Techno Base - Loud Digital Path
    .4byte initSprite_Interactable075_0
    .4byte initSprite_Interactable075_1
    .4byte initSprite_Interactable075_2             @ Techno Base - Box Platform (Launch player up)
    .4byte initSprite_Interactable078
    .4byte initSprite_Interactable079
    .4byte initSprite_Interactable080
    .4byte initSprite_Interactable081
    .4byte initSprite_Interactable_SkyCanyon_GiantPropeller
    .4byte initSprite_Interactable_IceParadise_SlidyIce
    .4byte initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill
    .4byte initSprite_Interactable085
    .4byte initSprite_Interactable_SkyCanyon_Whirlwind_0
    .4byte initSprite_Interactable_SkyCanyon_SmallPropeller_Left
    .4byte initSprite_Interactable_SkyCanyon_SmallPropeller_Right
    .4byte initSprite_Interactable_SkyCanyon_SmallPropeller_Left_Periodic
    .4byte initSprite_Interactable_SkyCanyon_SmallPropeller_Right_Periodic
    .4byte initSprite_Interactable091_0
    .4byte initSprite_Interactable091_1
    .4byte initSprite_Interactable093
    .4byte initSprite_Interactable094
    .4byte initSprite_Interactable095
    .4byte initSprite_Interactable_SkyCanyon_FlyingHandle
    .4byte initSprite_InteractableSpeedingPlatform
    .4byte initSprite_Interactable_Toggle_Gravity__Down
    .4byte initSprite_Interactable_Toggle_Gravity__Up
    .4byte initSprite_Interactable_Toggle_Gravity__Toggle
    .4byte initSprite_Interactable091_2
    .4byte initSprite_Interactable091_3     @ Egg Utopia "Launcher" (like in Manias Flying Battery)
    .4byte initSprite_Interactable_SpecialRing
    .4byte initSprite_Interactable_SkyCanyon_Whirlwind_1
    .4byte initSprite_Interactable105

    @ Enemy code
    @ TODO: Some names might be wrong?
    @       Should be in line with Encyclospeedia (mostly)
    .global gSpriteInits_Enemies
gSpriteInits_Enemies:
    .4byte initSprite_Enemy_Mon
    .4byte initSprite_Enemy_Kiki
    .4byte initSprite_Enemy_Buzzer
    .4byte initSprite_Enemy_Gohla
    .4byte initSprite_Enemy_KuraKura
    .4byte initSprite_Enemy_Kubinaga
    .4byte initSprite_Enemy_PikoPiko
    .4byte initSprite_Enemy_Bell
    .4byte initSprite_Enemy_Yado
    .4byte initSprite_Enemy_Circus
    .4byte initSprite_Enemy_Koura
    .4byte initSprite_Enemy_Madillo
    .4byte initSprite_Enemy_Straw
    .4byte initSprite_Enemy_Hammerhead
    .4byte initSprite_Enemy_Spinner
    .4byte initSprite_Enemy_Mouse
    .4byte initSprite_Enemy_Pen
    .4byte initSprite_Enemy_GejiGeji
    .4byte initSprite_Enemy_Balloon
    .4byte initSprite_Enemy_Flickey
    .4byte initSprite_Enemy_Kyura
    .4byte initSprite_Enemy_Star
    .4byte initSprite_Enemy_BulletBuzzer


    .global gUnknown_080D5020
gUnknown_080D5020:
    .2byte 100, 200, 400, 800, 1000, 0

    .global gUnknown_080D502C
gUnknown_080D502C:
    .4byte initSprite_Interactable_Toggle_PlayerLayer
    .4byte initSprite_Interactable_Toggle_PlayerLayer
    .4byte initSprite_Interactable_Spring_Normal_Up
    .4byte initSprite_Interactable_Spring_Normal_Down
    .4byte initSprite_Interactable_Spring_Normal_Right
    .4byte initSprite_Interactable_Spring_Normal_Left
    .4byte initSprite_Interactable_Spring_Big_UpLeft
    .4byte initSprite_Interactable_Spring_Big_UpRight
    .4byte initSprite_Interactable_Spring_Big_DownLeft
    .4byte initSprite_Interactable_Spring_Big_DownRight
    .4byte initSprite_Interactable_Spring_Small_UpLeft
    .4byte initSprite_Interactable_Spring_Small_UpRight
    .4byte initSprite_Interactable_Ramp
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_Spikes_Up
    .4byte initSprite_Interactable_GrindRail_Start
    .4byte initSprite_Interactable_GrindRail_StartAir
    .4byte initSprite_Interactable_GrindRail_EndGround
    .4byte initSprite_Interactable_GrindRail_End_ForcedJump
    .4byte initSprite_Interactable_GrindRail_EndAlternate
    .4byte initSprite_Interactable_GrindRail_EndAir
    .4byte initSprite_Interactable_GrindRail_EndGround_Left
    .4byte initSprite_Interactable_GrindRail_EndAir_Left
    .4byte initSprite_Interactable_MysteryItemBox
    .4byte initSprite_8080368

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

	thumb_func_start sub_800888C
sub_800888C: @ 0x0800888C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080088A8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _080088B4
	ldr r0, _080088AC @ =sub_8008DCC
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _080088B0 @ =sub_80095FC
	b _080088BC
	.align 2, 0
_080088A8: .4byte gGameMode
_080088AC: .4byte sub_8008DCC
_080088B0: .4byte sub_80095FC
_080088B4:
	ldr r0, _08008970 @ =sub_8008DCC
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
_080088BC:
	str r1, [sp]
	movs r1, #0x1c
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	mov r0, r8
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _08008974 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0800898C
	ldr r5, _08008978 @ =gSpritePosData_interactables
	ldr r4, _0800897C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7]
	ldr r5, _08008980 @ =gSpritePosData_itemboxes
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7, #4]
	ldr r5, _08008984 @ =gSpritePosData_enemies
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r1, _08008988 @ =gSpriteTileInits_PreStageEntry
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0800899A
	bl _call_via_r0
	str r0, [r7, #0x18]
	b _0800899A
	.align 2, 0
_08008970: .4byte sub_8008DCC
_08008974: .4byte gGameMode
_08008978: .4byte gSpritePosData_interactables
_0800897C: .4byte gCurrentLevel
_08008980: .4byte gSpritePosData_itemboxes
_08008984: .4byte gSpritePosData_enemies
_08008988: .4byte gSpriteTileInits_PreStageEntry
_0800898C:
	ldr r6, _080089BC @ =EWRAM_START + 0x3F000
	ldr r0, _080089C0 @ =EWRAM_START + 0x3300C
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7]
_0800899A:
	ldr r1, _080089C4 @ =gCamera
	ldr r0, [r1]
	str r0, [r7, #0xc]
	ldr r0, [r1, #4]
	str r0, [r7, #0x10]
	movs r0, #1
	strb r0, [r7, #0x14]
	ldr r0, _080089C8 @ =gUnknown_030054DC
	mov r1, r8
	str r1, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080089BC: .4byte EWRAM_START + 0x3F000
_080089C0: .4byte EWRAM_START + 0x3300C
_080089C4: .4byte gCamera
_080089C8: .4byte gUnknown_030054DC

	thumb_func_start sub_80089CC
sub_80089CC: @ 0x080089CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r0, _08008CBC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080089EA
	b _08008DAC
_080089EA:
	ldr r0, _08008CC0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	ldr r0, [r1]
	str r0, [sp, #0x1c]
	ldr r0, _08008CC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008A10
	ldr r0, [r1, #8]
	adds r0, #0xc
	str r0, [sp, #0x24]
	ldr r0, [r1, #4]
	adds r0, #0xc
	str r0, [sp, #0x20]
_08008A10:
	ldr r1, [sp, #0x1c]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, _08008CC8 @ =gCamera
	ldr r0, [r1]
	adds r2, r0, #0
	subs r2, #0x80
	str r2, [sp]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #8]
	ldr r1, [r1, #4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r1, r5
	str r0, [sp, #0xc]
	cmp r2, #0
	bge _08008A4E
	str r3, [sp]
_08008A4E:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008A56
	str r3, [sp, #4]
_08008A56:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008A5E
	str r3, [sp, #8]
_08008A5E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008A66
	str r3, [sp, #0xc]
_08008A66:
	ldr r0, [sp, #0x10]
	lsls r2, r0, #8
	ldr r0, [sp]
	cmp r0, r2
	blo _08008A74
	subs r0, r2, #1
	str r0, [sp]
_08008A74:
	ldr r3, [sp, #0x14]
	lsls r1, r3, #8
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _08008A82
	subs r0, r1, #1
	str r0, [sp, #4]
_08008A82:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008A8C
	subs r0, r2, #1
	str r0, [sp, #8]
_08008A8C:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008A96
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008A96:
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	mov r8, r0
	lsls r0, r0, #8
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blo _08008AA6
	b _08008D94
_08008AA6:
	ldr r4, [sp, #0x14]
	cmp r8, r4
	blo _08008AAE
	b _08008D94
_08008AAE:
	ldr r0, [sp]
	asrs r7, r0, #8
	lsls r0, r7, #8
	ldr r2, [sp, #8]
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x34]
	cmp r0, r2
	blo _08008AC2
	b _08008D82
_08008AC2:
	ldr r0, [sp, #0x10]
	cmp r7, r0
	blo _08008ACA
	b _08008D82
_08008ACA:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	str r0, [sp, #0x28]
_08008AD8:
	ldr r0, _08008CC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008AE2
	b _08008CD4
_08008AE2:
	lsls r1, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x10]
	mov r0, r8
	muls r0, r4, r0
	str r0, [sp, #0x2c]
	str r1, [sp, #0x38]
	adds r5, r7, #1
	str r5, [sp, #0x30]
	cmp r6, #0
	beq _08008B88
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008B88
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008B1E:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008B72
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008B72
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008B72
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008B72
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008B72
	ldr r1, _08008CCC @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008B72:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008B1E
_08008B88:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #2
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	ldr r4, [sp, #0x38]
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r6, #0
	beq _08008C1A
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _08008C1A
	movs r0, #2
	rsbs r0, r0, #0
	mov sl, r0
	lsls r2, r7, #0x10
	mov sb, r2
	mov r3, r8
	lsls r3, r3, #0x10
	str r3, [sp, #0x3c]
_08008BC0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sl
	blt _08008C04
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r5, r8
	lsls r0, r5, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008C04
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008C04
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008C04
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008C04
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	mov r2, sb
	lsrs r1, r2, #0x10
	ldr r5, [sp, #0x3c]
	lsrs r2, r5, #0x10
	bl CreateItemBox
_08008C04:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _08008BC0
_08008C1A:
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #2
	ldr r4, [sp, #0x24]
	adds r0, r0, r4
	ldr r5, [sp, #0x38]
	adds r0, r5, r0
	ldr r6, [r0]
	cmp r6, #0
	bne _08008C2E
	b _08008D70
_08008C2E:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C46
	b _08008D70
_08008C46:
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008C50:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008CA4
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008CA4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008CA4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008CA4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008CA4
	ldr r1, _08008CD0 @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008CA4:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C50
	b _08008D70
	.align 2, 0
_08008CBC: .4byte gUnknown_03005424
_08008CC0: .4byte gCurTask
_08008CC4: .4byte gGameMode
_08008CC8: .4byte gCamera
_08008CCC: .4byte gSpriteInits_Interactables
_08008CD0: .4byte gSpriteInits_Enemies
_08008CD4:
	lsls r0, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x30]
	cmp r6, #0
	beq _08008D70
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008D70
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008D06:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008D5A
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008D5A
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008D5A
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008D5A
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008D5A
	ldr r1, _08008DBC @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008D5A:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008D06
_08008D70:
	ldr r7, [sp, #0x30]
	adds r5, r7, #0
	lsls r0, r5, #8
	cmp r0, r2
	bhs _08008D82
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bhs _08008D82
	b _08008AD8
_08008D82:
	ldr r1, [sp, #0x34]
	mov r8, r1
	lsls r0, r1, #8
	cmp r0, r3
	bhs _08008D94
	ldr r2, [sp, #0x14]
	cmp r1, r2
	bhs _08008D94
	b _08008AAE
_08008D94:
	ldr r1, _08008DC0 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp, #0x18]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	str r0, [r3, #0x10]
	movs r0, #0
	strb r0, [r3, #0x14]
	ldr r0, _08008DC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08008DC8 @ =sub_8008DCC
	str r0, [r1, #8]
_08008DAC:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008DBC: .4byte gUnknown_080D502C
_08008DC0: .4byte gCamera
_08008DC4: .4byte gCurTask
_08008DC8: .4byte sub_8008DCC

	thumb_func_start sub_8008DCC
sub_8008DCC: @ 0x08008DCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _08008E14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08008DE6
	b _08009518
_08008DE6:
	ldr r0, _08008E18 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _08008E9E
	ldr r1, _08008E1C @ =gCamera
	ldr r3, [r1]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	subs r2, r3, r0
	adds r4, r1, #0
	adds r1, r0, #0
	cmp r2, #0
	blt _08008E20
	cmp r2, #0xf8
	bgt _08008E9E
	b _08008E26
	.align 2, 0
_08008E14: .4byte gUnknown_03005424
_08008E18: .4byte gCurTask
_08008E1C: .4byte gCamera
_08008E20:
	subs r0, r1, r3
	cmp r0, #0xf8
	bgt _08008E9E
_08008E26:
	ldr r3, [r4, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r2, r3, r0
	cmp r2, #0
	blt _08008E38
	cmp r2, #0xd0
	bgt _08008E9E
	b _08008E3E
_08008E38:
	subs r0, r0, r3
	cmp r0, #0xd0
	bgt _08008E9E
_08008E3E:
	ldr r0, [sp, #0x28]
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	ldr r0, _08008E84 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008E5A
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #8]
	adds r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r2, #4]
	adds r0, #0xc
	str r0, [sp, #0x30]
_08008E5A:
	ldr r3, [sp, #0x2c]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldm r3!, {r0}
	str r3, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	ldr r2, [r4]
	cmp r2, r1
	ble _08008E88
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [sp]
	adds r0, r2, r0
	b _08008E94
	.align 2, 0
_08008E84: .4byte gGameMode
_08008E88:
	adds r0, r2, #0
	subs r0, #0x80
	str r0, [sp]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0xc]
	subs r0, #0x80
_08008E94:
	str r0, [sp, #8]
	ldr r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _08008EA4
_08008E9E:
	bl sub_80089CC
	b _08009518
_08008EA4:
	ldr r0, [r4, #4]
	adds r3, r0, #0
	subs r3, #0x80
	str r3, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r2, r0, r5
	str r2, [sp, #0xc]
	ldr r5, [sp, #0x28]
	ldr r1, [r5, #0x10]
	cmp r0, r1
	ble _08008ECA
	add r0, sp, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r0, #4]
	str r2, [r0, #0xc]
	b _08008ED6
_08008ECA:
	add r1, sp, #0x10
	str r3, [r1, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r0, #0x80
	str r0, [r1, #0xc]
_08008ED6:
	add r3, sp, #0x10
	ldr r1, [r4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #0x10]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	str r0, [sp, #0x18]
	ldr r0, [sp]
	cmp r0, #0
	bge _08008EF2
	movs r0, #0
	str r0, [sp]
_08008EF2:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008EFC
	movs r0, #0
	str r0, [sp, #4]
_08008EFC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008F06
	movs r0, #0
	str r0, [sp, #8]
_08008F06:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008F10
	movs r0, #0
	str r0, [sp, #0xc]
_08008F10:
	ldr r0, [sp]
	ldr r5, [sp, #0x20]
	lsls r2, r5, #8
	cmp r0, r2
	blo _08008F1E
	subs r0, r2, #1
	str r0, [sp]
_08008F1E:
	ldr r0, [sp, #4]
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	cmp r0, r1
	blo _08008F2C
	subs r0, r1, #1
	str r0, [sp, #4]
_08008F2C:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008F36
	subs r0, r2, #1
	str r0, [sp, #8]
_08008F36:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008F40
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008F40:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _08008F4A
	movs r0, #0
	str r0, [sp, #0x10]
_08008F4A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _08008F54
	movs r0, #0
	str r0, [sp, #0x14]
_08008F54:
	ldr r0, [r3, #8]
	cmp r0, #0
	bge _08008F5E
	movs r0, #0
	str r0, [r3, #8]
_08008F5E:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bge _08008F68
	movs r0, #0
	str r0, [r3, #0xc]
_08008F68:
	ldr r0, [sp, #0x10]
	cmp r0, r2
	blo _08008F72
	subs r0, r2, #1
	str r0, [sp, #0x10]
_08008F72:
	ldr r0, [r3, #4]
	cmp r0, r1
	blo _08008F7C
	subs r0, r1, #1
	str r0, [r3, #4]
_08008F7C:
	ldr r0, [r3, #8]
	cmp r0, r2
	blo _08008F86
	subs r0, r2, #1
	str r0, [r3, #8]
_08008F86:
	ldr r0, [r3, #0xc]
	cmp r0, r1
	blo _08008F90
	subs r0, r1, #1
	str r0, [r3, #0xc]
_08008F90:
	ldr r1, [r4]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	bne _08008F9C
	b _08009248
_08008F9C:
	ldr r0, [sp]
	ldr r2, [sp, #8]
	cmp r0, r2
	bne _08008FA6
	b _08009248
_08008FA6:
	ldr r0, [sp, #4]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	bne _08008FB0
	b _08009248
_08008FB0:
	lsls r0, r0, #8
	b _08009236
_08008FB4:
	ldr r0, [sp]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x44]
	cmp r0, r2
	blt _08008FC8
	b _08009232
_08008FC8:
	ldr r0, [sp, #0x20]
	cmp r7, r0
	blo _08008FD0
	b _08009232
_08008FD0:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x38]
_08008FDE:
	ldr r0, _08009014 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008FE8
	b _08009190
_08008FE8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x20]
	mov r0, r8
	muls r0, r4, r0
	mov sb, r0
	mov sl, r1
	adds r5, r7, #1
	str r5, [sp, #0x40]
	cmp r6, #0
	beq _0800907C
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _08009074
	.align 2, 0
_08009014: .4byte gGameMode
_08009018:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08009066
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009066
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009066
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009066
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009066
	ldr r1, _0800909C @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009066:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_08009074:
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08009018
_0800907C:
	mov r5, sb
	lsls r0, r5, #2
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080090FA
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	b _080090F2
	.align 2, 0
_0800909C: .4byte gSpriteInits_Interactables
_080090A0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _080090E4
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _080090E4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _080090E4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080090E4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _080090E4
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl CreateItemBox
_080090E4:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_080090F2:
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _080090A0
_080090FA:
	mov r1, sb
	lsls r0, r1, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _0800910C
	b _0800921E
_0800910C:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08009124
	b _0800921E
_08009124:
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_0800912A:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009174
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009174
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009174
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009174
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009174
	ldr r1, _0800918C @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009174:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _0800912A
	b _0800921E
	.align 2, 0
_0800918C: .4byte gSpriteInits_Enemies
_08009190:
	lsls r0, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x40]
	cmp r6, #0
	beq _0800921E
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0800921E
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_080091BE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009208
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009208
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009208
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009208
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009208
	ldr r1, _0800927C @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009208:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _080091BE
_0800921E:
	ldr r5, [sp, #0x40]
	lsls r0, r5, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	cmp r0, r2
	bge _08009232
	ldr r0, [sp, #0x20]
	cmp r7, r0
	bhs _08009232
	b _08008FDE
_08009232:
	ldr r1, [sp, #0x44]
	lsls r0, r1, #0x10
_08009236:
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	bge _08009248
	ldr r4, [sp, #0x24]
	cmp r8, r4
	bhs _08009248
	b _08008FB4
_08009248:
	ldr r0, _08009280 @ =gCamera
	ldr r1, [r0, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bne _08009256
	b _0800950C
_08009256:
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bne _08009260
	b _0800950C
_08009260:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bne _0800926A
	b _0800950C
_0800926A:
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	blt _08009278
	b _0800950C
_08009278:
	b _08009504
	.align 2, 0
_0800927C: .4byte gUnknown_080D502C
_08009280: .4byte gCamera
_08009284:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x44]
	cmp r1, r0
	blt _0800929A
	b _080094F4
_0800929A:
	ldr r3, [sp, #0x20]
	cmp r7, r3
	blo _080092A2
	b _080094F4
_080092A2:
	mov r0, r8
	muls r0, r3, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x3c]
_080092AE:
	ldr r0, _080092E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080092B8
	b _08009454
_080092B8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x3c]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r2, [sp, #0x20]
	mov r0, r8
	muls r0, r2, r0
	mov sb, r0
	mov sl, r1
	adds r3, r7, #1
	str r3, [sp, #0x40]
	cmp r6, #0
	beq _08009344
	adds r0, r6, #0
	subs r0, #8
	ldr r4, [sp, #0x2c]
	adds r5, r4, r0
	movs r6, #0
	b _08009336
	.align 2, 0
_080092E0: .4byte gGameMode
_080092E4:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08009332
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009332
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009332
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009332
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009332
	ldr r1, _0800944C @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009332:
	adds r5, #7
	adds r6, #1
_08009336:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080092E4
_08009344:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x30]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080093BE
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _080093BE
	subs r5, #1
_0800936C:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	blt _080093AC
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080093AC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080093AC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080093AC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080093AC
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl CreateItemBox
_080093AC:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _0800936C
_080093BE:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _080093D0
	b _080094DE
_080093D0:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093E8
	b _080094DE
_080093E8:
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_080093EE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009438
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009438
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009438
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009438
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009438
	ldr r1, _08009450 @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009438:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093EE
	b _080094DE
	.align 2, 0
_0800944C: .4byte gSpriteInits_Interactables
_08009450: .4byte gSpriteInits_Enemies
_08009454:
	lsls r0, r7, #2
	ldr r3, [sp, #0x3c]
	adds r0, r0, r3
	ldr r6, [r0]
	adds r4, r7, #1
	str r4, [sp, #0x40]
	cmp r6, #0
	beq _080094DE
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _080094DE
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_08009482:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _080094CC
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080094CC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080094CC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080094CC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080094CC
	ldr r1, _08009528 @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_080094CC:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08009482
_080094DE:
	ldr r3, [sp, #0x40]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bge _080094F4
	ldr r4, [sp, #0x20]
	cmp r7, r4
	bhs _080094F4
	b _080092AE
_080094F4:
	ldr r5, [sp, #0x44]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r0, #8
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bge _0800950C
_08009504:
	ldr r0, [sp, #0x24]
	cmp r8, r0
	bhs _0800950C
	b _08009284
_0800950C:
	ldr r0, _0800952C @ =gCamera
	ldr r1, [r0]
	ldr r2, [sp, #0x28]
	str r1, [r2, #0xc]
	ldr r0, [r0, #4]
	str r0, [r2, #0x10]
_08009518:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009528: .4byte gUnknown_080D502C
_0800952C: .4byte gCamera


	thumb_func_start sub_8009530
sub_8009530: @ 0x08009530
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r0, #0x8a
	bl m4aSongNumStart
	ldr r2, _080095CC @ =gUnknown_03005450
	ldr r5, [r2]
	ldr r1, _080095D0 @ =gUnknown_080D5020
	ldr r0, _080095D4 @ =gPlayer
	adds r0, #0x84
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	str r0, [r2]
	ldr r4, _080095D8 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0800959E
	ldr r0, _080095DC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800959E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _080095E0 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08009596
	movs r0, #0xff
_08009596:
	strb r0, [r1]
	ldr r1, _080095E4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800959E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_8009E00
	ldr r0, _080095D4 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x84
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bgt _080095C0
	adds r0, r2, #1
	strb r0, [r1]
_080095C0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080095CC: .4byte gUnknown_03005450
_080095D0: .4byte gUnknown_080D5020
_080095D4: .4byte gPlayer
_080095D8: .4byte 0x0000C350
_080095DC: .4byte gGameMode
_080095E0: .4byte gNumLives
_080095E4: .4byte gUnknown_030054A8

	thumb_func_start TaskDestructor_80095E8
TaskDestructor_80095E8: @ 0x080095E8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80095FC
sub_80095FC: @ 0x080095FC
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4]
	bl EwramFree
	ldr r0, [r4, #4]
	bl EwramFree
	ldr r0, [r4, #8]
	bl EwramFree
	ldr r1, _08009624 @ =gUnknown_030054DC
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009624: .4byte gUnknown_030054DC

