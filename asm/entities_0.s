.include "asm/macros.inc"
.include "constants/constants.inc"

    .section .rodata


@; NOTE(Jace): To better understand how the data that is
@;             pointed to from here is composed, look at the below thread.
@;             Even though it is about SA3, all 3 games do share quite a bit.
@;             https://twitter.com/JaceCear/status/1362912485951610881
.include "data/maps/entity_tables.inc"

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
    .4byte initSprite_Interactable087_0
    .4byte initSprite_Interactable087_1
    .4byte initSprite_Interactable087_2
    .4byte initSprite_Interactable087_3
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
    .4byte initSprite_ItemBox
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

    .global gUnknown_080D5128
gUnknown_080D5128:
    .asciz "STAGE"

    .align 2 , 0
    .global gUnknown_080D5130
gUnknown_080D5130:
    .ascii "FLASH"
    .byte 0xC5, 0xB2, 0xC4, 0x2C, 0xBE, 0xB0, 0xCC, 0xDE, 0xC3, 0xDE, 0xB7, 0xC5, 0xB2, 0xC3, 0xDE, 0xBD
    
.align 2 , 0
    .global sAnimInfoPauseMenu
sAnimInfoPauseMenu:
    .4byte 40
    .2byte 0x42A    @ SA2_ANIM_PAUSE_MENU_JP
    .byte  0x00
.align 2 , 0

    .4byte 40
    .2byte 0x42B    @ SA2_ANIM_PAUSE_MENU_EN
    .byte  0x00
.align 2 , 0

    .4byte 40
    .2byte 0x42C    @ SA2_ANIM_PAUSE_MENU_DE
    .byte  0x00
.align 2 , 0

    .4byte 40
    .2byte 0x42D    @ SA2_ANIM_PAUSE_MENU_FR
    .byte  0x00
.align 2 , 0

    .4byte 40
    .2byte 0x42E    @ SA2_ANIM_PAUSE_MENU_ES
    .byte  0x00
.align 2 , 0

    .4byte 40
    .2byte 0x42F    @ SA2_ANIM_PAUSE_MENU_IT
    .byte  0x00
.align 2 , 0

    .global gUnknown_080D5178
gUnknown_080D5178:
    .incbin "baserom.gba", 0x000D5178, 0x4E

    .global ItemBox_1UpIcons
ItemBox_1UpIcons:
    .2byte 0x2D5, 0, 4   @ SA2_ANIM_ITEMBOX_TYPE, CHARACTER_SONIC   , 4
    .2byte 0x2D5, 1, 4   @ SA2_ANIM_ITEMBOX_TYPE, CHARACTER_CREAM   , 4
    .2byte 0x2D5, 2, 4   @ SA2_ANIM_ITEMBOX_TYPE, CHARACTER_TAILS   , 4
    .2byte 0x2D5, 3, 4   @ SA2_ANIM_ITEMBOX_TYPE, CHARACTER_KNUCKLES, 4
    .2byte 0x2D5, 4, 4   @ SA2_ANIM_ITEMBOX_TYPE, CHARACTER_AMY     , 4

    .global gUnknown_080D51E4
gUnknown_080D51E4:
    .2byte 5, 13, 4, 13, 3, 13, 6, 13

    .global gUnknown_080D51F4
gUnknown_080D51F4:
    .2byte 8, 9, 10, 11

    .global gUnknown_080D51FC
gUnknown_080D51FC:
    .byte 1, 5, 10, 30, 50, 0, 0, 0

    .global gLevelSongs
gLevelSongs: @ 0x080D5204
    @.2byte MUS_LEAF_FOREST__ACT_1
    @.2byte MUS_LEAF_FOREST__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_HOT_CRATER__ACT_1
    @.2byte MUS_HOT_CRATER__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_MUSIC_PLANT__ACT_1
    @.2byte MUS_MUSIC_PLANT__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_ICE_PARADISE__ACT_1
    @.2byte MUS_ICE_PARADISE__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_SKY_CANYON__ACT_1
    @.2byte MUS_SKY_CANYON__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_TECHNO_BASE__ACT_1
    @.2byte MUS_TECHNO_BASE__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_EGG_UTOPIA__ACT_1
    @.2byte MUS_EGG_UTOPIA__ACT_2
    @.2byte MUS_7_BOSS
    @.2byte MUS_7_BOSS_PINCH
    @.2byte MUS_XX__FINAL_ZONE
    @.2byte MUS_TRUE_AREA_53
    @.2byte MUS_FINAL_BOSS
    @.2byte MUS_FINAL_BOSS_PINCH
    @.2byte MUS_BOSS_KNUCKLES
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_DUMMY
    .incbin "baserom.gba", 0x000D5204, 0x50

    .global gUnknown_080D5254
gUnknown_080D5254:
    .incbin "baserom.gba", 0x000D5254, 0x0E

    .global gUnknown_080D5262
gUnknown_080D5262:
    .incbin "baserom.gba", 0x000D5262, 0x0E

    .global gUnknown_080D5270
gUnknown_080D5270:
    .incbin "baserom.gba", 0x000D5270, 0x0E

    .global gUnknown_080D527E
gUnknown_080D527E:
    .incbin "baserom.gba", 0x000D527E, 0x0E

    .global gUnknown_080D528C
gUnknown_080D528C:
    .incbin "baserom.gba", 0x000D528C, 0x0E

    .global gUnknown_080D529A
gUnknown_080D529A:
    .incbin "baserom.gba", 0x000D529A, 0x0E

    .global gUnknown_080D52A8
gUnknown_080D52A8:
    .incbin "baserom.gba", 0x000D52A8, 0x0E

    .global gUnknown_080D52B6
gUnknown_080D52B6:
    .incbin "baserom.gba", 0x000D52B6, 0x0E

    .global gUnknown_080D52C4
gUnknown_080D52C4:
    .incbin "baserom.gba", 0x000D52C4, 0x0E

    .global gUnknown_080D52D2
gUnknown_080D52D2:
    .incbin "baserom.gba", 0x000D52D2, 0x0E

.text
.syntax unified
.arm

	thumb_func_start sub_8007E10
sub_8007E10: @ 0x08007E10
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08007E5C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08007E70
	ldr r0, _08007E60 @ =sub_8007F1C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08007E64 @ =sub_8008874
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	adds r7, r0, #0
	ldr r5, _08007E68 @ =gSpritePosData_rings
	ldr r4, _08007E6C @ =gCurrentLevel
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
	b _08007EA0
	.align 2, 0
_08007E5C: .4byte gGameMode
_08007E60: .4byte sub_8007F1C
_08007E64: .4byte sub_8008874
_08007E68: .4byte gSpritePosData_rings
_08007E6C: .4byte gCurrentLevel
_08007E70:
	ldr r0, _08007EF4 @ =sub_8007F1C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	adds r7, r0, #0
	ldr r0, _08007EF8 @ =EWRAM_START + 0x3300C
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldr r1, _08007EFC @ =EWRAM_START + 0x3F000
	adds r6, r0, r1
	ldr r0, _08007F00 @ =EWRAM_START + 0x33008
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
_08007EA0:
	ldrh r0, [r7, #6]
	ldr r5, _08007F04 @ =IWRAM_START + 0x30
	adds r0, r0, r5
	str r6, [r0]
	ldrh r3, [r7, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r4, #0
	movs r2, #0
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	ldr r0, _08007F08 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	ldr r0, _08007F0C @ =0x000002D6
	strh r0, [r1, #0xa]
	subs r5, #0x10
	adds r0, r3, r5
	strb r4, [r0]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x1c]
	ldr r0, _08007F10 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r5, #2
	adds r2, r3, r5
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08007F14 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r4, [r3]
	ldr r0, _08007F18 @ =0x00042200
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007EF4: .4byte sub_8007F1C
_08007EF8: .4byte EWRAM_START + 0x3300C
_08007EFC: .4byte EWRAM_START + 0x3F000
_08007F00: .4byte EWRAM_START + 0x33008
_08007F04: .4byte IWRAM_START + 0x30
_08007F08: .4byte 0x06011F00
_08007F0C: .4byte 0x000002D6
_08007F10: .4byte IWRAM_START + 0x21
_08007F14: .4byte IWRAM_START + 0x25
_08007F18: .4byte 0x00042200

	thumb_func_start sub_8007F1C
sub_8007F1C: @ 0x08007F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r2, _08008288 @ =gPlayer
	ldrb r4, [r2, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0800828C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08007F60
	bl _0800884A
_08007F60:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08008294 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08007F8E
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08007F8A
	ldr r0, _0800829C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007F8E
_08007F8A:
	cmp r1, #0x1d
	bne _08007FBE
_08007F8E:
	ldr r5, _080082A0 @ =gUnknown_03005430
	ldrb r0, [r5]
	cmp r0, #0
	beq _08007FBE
	ldr r4, _080082A4 @ =gUnknown_0300542C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08007FBE
	ldr r1, _080082A8 @ =gSpritePosData_rings
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	bl RLUnCompWram
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_08007FBE:
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08007FFA
	bl sub_802C6E4
	movs r1, #0x87
	lsls r1, r1, #2
	ands r1, r0
	movs r3, #1
	str r3, [sp, #8]
	cmp r1, #0
	beq _08007FE4
	movs r4, #0
	str r4, [sp, #8]
_08007FE4:
	ldr r0, _080082AC @ =gPlayer + 0x8
	adds r1, r0, #4
	bl sub_802C668
	mov r0, sp
	movs r1, #0xf6
	strb r1, [r0]
	strb r1, [r0, #1]
	movs r1, #0xa
	strb r1, [r0, #2]
	strb r1, [r0, #3]
_08007FFA:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r6, _08008294 @ =IWRAM_START + 0x30
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	adds r0, r1, #0
	bl sub_8004558
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x14]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldm r1!, {r0}
	str r1, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, _08008288 @ =gPlayer
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	mov r0, sp
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _0800805C
	b _0800822C
_0800805C:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _08008064
	b _0800822C
_08008064:
	ldr r4, _08008288 @ =gPlayer
	ldr r2, [r4, #8]
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	subs r0, #8
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	ldr r3, [r4, #0xc]
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	cmp sb, r0
	ble _08008098
	b _08008208
_08008098:
	ldr r0, [sp, #0xc]
	cmp sb, r0
	blo _080080A0
	b _08008208
_080080A0:
	ldr r1, [sp, #0xc]
	mov r0, sl
	muls r0, r1, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	adds r4, #1
	str r4, [sp, #0x3c]
	cmp r0, #0
	bne _080080BE
	b _080081E4
_080080BE:
	subs r0, #8
	adds r5, r6, r0
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _080080CC
	b _080081E4
_080080CC:
	mov r0, sp
	str r0, [sp, #0x24]
_080080D0:
	cmp r1, #0xfe
	bne _080080D6
	b _080081D2
_080080D6:
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _0800810A
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081D2
	ldr r6, _08008288 @ =gPlayer
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _080081D2
_0800810A:
	mov r2, r8
	subs r2, #8
	ldr r1, _08008288 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800812C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _0800813A
	cmp r2, r1
	blt _080081D2
_0800812C:
	ldr r6, [sp, #0x24]
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_0800813A:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, _08008288 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008158
	cmp r7, r1
	bge _08008166
	cmp r2, r1
	blt _080081D2
_08008158:
	ldr r6, [sp, #0x24]
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_08008166:
	ldr r1, _080082B0 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08008298 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081AC
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080081AC
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081AC
	ldr r1, _080082B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080081A4
	movs r0, #0xff
_080081A4:
	strb r0, [r1]
	ldr r1, _080082BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080081AC:
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080081C0
	ldr r1, _080082B0 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080081C0
	movs r0, #0xff
	strh r0, [r1]
_080081C0:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0xfe
	strb r0, [r5]
_080081D2:
	adds r5, #2
	ldrb r1, [r5]
	adds r0, r1, #0
	ldr r2, _08008288 @ =gPlayer
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #8]
	cmp r0, #0xff
	beq _080081E4
	b _080080D0
_080081E4:
	ldr r4, [sp, #0x3c]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _08008208
	ldr r6, [sp, #0xc]
	cmp sb, r6
	bhs _08008208
	b _080080A0
_08008208:
	ldr r1, [sp, #0x40]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	asrs r1, r3, #8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _0800822C
	ldr r2, [sp, #0x10]
	cmp sl, r2
	bhs _0800822C
	b _08008064
_0800822C:
	ldr r0, _080082B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08008236
	b _0800847E
_08008236:
	movs r2, #0
_08008238:
	ldr r0, _080082C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r3, r2, #1
	str r3, [sp, #0x30]
	cmp r2, r0
	bne _0800824A
	b _08008472
_0800824A:
	ldr r1, _080082C4 @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08008258
	b _08008472
_08008258:
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r4, r2, r6
	ldr r1, _080082C8 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, #0x2d
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r3, _080082CC @ =IWRAM_START + 0x2F
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	b _080082D0
	.align 2, 0
_08008288: .4byte gPlayer
_0800828C: .4byte gUnknown_03005424
_08008290: .4byte gCurTask
_08008294: .4byte IWRAM_START + 0x30
_08008298: .4byte gCurrentLevel
_0800829C: .4byte gUnknown_030054B0
_080082A0: .4byte gUnknown_03005430
_080082A4: .4byte gUnknown_0300542C
_080082A8: .4byte gSpritePosData_rings
_080082AC: .4byte gPlayer + 0x8
_080082B0: .4byte gRingCount
_080082B4: .4byte gGameMode
_080082B8: .4byte gNumLives
_080082BC: .4byte gUnknown_030054A8
_080082C0: .4byte 0x04000128
_080082C4: .4byte gMultiplayerPlayerTasks
_080082C8: .4byte IWRAM_START + 0x52
_080082CC: .4byte IWRAM_START + 0x2F
_080082D0:
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _080082DA
	b _08008472
_080082DA:
	ldr r6, [sp, #0x10]
	cmp sl, r6
	blo _080082E2
	b _08008472
_080082E2:
	ldr r0, _08008330 @ =IWRAM_START + 0x50
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r1, _08008334 @ =IWRAM_START + 0x2C
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	subs r3, #1
	adds r3, r2, r3
	str r3, [sp, #0x48]
_080082F4:
	ldr r6, [sp, #0x28]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	subs r1, #8
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r3, [sp, #0x48]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r1, r1, r0
	adds r1, #0x10
	asrs r1, r1, #8
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	adds r0, r4, #0
	adds r0, #0x52
	str r0, [sp, #0x38]
	adds r2, r4, #0
	adds r2, #0x2f
	str r2, [sp, #0x34]
	cmp sb, r1
	ble _0800832E
	b _0800844C
_0800832E:
	b _08008444
	.align 2, 0
_08008330: .4byte IWRAM_START + 0x50
_08008334: .4byte IWRAM_START + 0x2C
_08008338:
	ldr r6, [sp, #0xc]
	mov r0, sl
	muls r0, r6, r0
	mov r2, sb
	lsls r1, r2, #2
	lsls r0, r0, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, #1
	str r2, [sp, #0x3c]
	cmp r0, #0
	beq _08008426
	subs r0, #8
	adds r5, r3, r0
	b _0800841E
_0800835A:
	cmp r1, #0xfe
	beq _0800841C
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	mov r2, r8
	subs r2, #8
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r0, [r3, r6]
	ldr r1, [sp, #0x2c]
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008396
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _080083A4
	cmp r2, r1
	blt _0800841C
_08008396:
	ldr r6, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083A4:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, [sp, #0x38]
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080083C4
	cmp r7, r1
	bge _080083D2
	cmp r2, r1
	blt _0800841C
_080083C4:
	ldr r6, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083D2:
	ldrb r1, [r4, #0xa]
	ldr r3, _080084F8 @ =PlayerCharacterIdleAnims
	ldr r2, _080084FC @ =gMultiplayerCharacters
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0xe4
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0800840A
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800841C
_0800840A:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0xfe
	strb r0, [r5]
_0800841C:
	adds r5, #2
_0800841E:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800835A
_08008426:
	ldr r2, [sp, #0x3c]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r1, [r3, r6]
	ldr r2, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _0800844C
_08008444:
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800844C
	b _08008338
_0800844C:
	ldr r6, [sp, #0x40]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _08008472
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs _08008472
	b _080082F4
_08008472:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0800847E
	b _08008238
_0800847E:
	ldr r2, _08008500 @ =gCamera
	ldr r3, [r2, #4]
	lsls r0, r3, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _08008504 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08008498
	b _080086B4
_08008498:
	ldr r0, _08008508 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080084A2
	b _080086B4
_080084A2:
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r3, #0
	adds r0, #0xa0
	cmp r1, r0
	blt _080084B0
	b _0800884A
_080084B0:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _080084B8
	b _0800884A
_080084B8:
	ldr r4, _08008500 @ =gCamera
	ldr r0, [r4]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080084CC
	b _0800867A
_080084CC:
	ldr r6, [sp, #0xc]
	mov r2, sl
	muls r2, r6, r2
	mov r0, sb
	lsls r1, r0, #2
	lsls r0, r2, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	str r2, [sp, #0x44]
	cmp sb, r6
	blo _080084E8
	b _0800867A
_080084E8:
	cmp r0, #0
	bne _080084EE
	b _0800864C
_080084EE:
	subs r0, #8
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	b _08008642
	.align 2, 0
_080084F8: .4byte PlayerCharacterIdleAnims
_080084FC: .4byte gMultiplayerCharacters
_08008500: .4byte gCamera
_08008504: .4byte gPlayer
_08008508: .4byte gGameMode
_0800850C:
	cmp r1, #0xfe
	beq _08008582
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	ldr r3, _08008588 @ =gCamera
	ldr r0, [r3]
	mov r4, r8
	subs r0, r4, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008582
	ldr r0, [r3, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008582
	subs r0, #0x10
	cmp r0, #0xa0
	bgt _08008582
	mov r1, r8
	subs r1, #0x40
	ldr r3, _0800858C @ =gPlayer
	ldr r0, [r3, #8]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	mov r0, r8
	adds r0, #0x40
	cmp r0, r2
	blt _08008590
	adds r1, r7, #0
	subs r1, #0x48
	ldr r0, [r3, #0xc]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	adds r0, r7, #0
	adds r0, #0x38
	cmp r0, r2
	blt _08008590
	mov r6, r8
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800BAAC
	movs r0, #0xfe
	strb r0, [r5]
_08008582:
	adds r5, #2
	b _08008642
	.align 2, 0
_08008588: .4byte gCamera
_0800858C: .4byte gPlayer
_08008590:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080085A2
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080085C4
_080085A2:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _080085C0 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl sub_80051E8
	b _08008638
	.align 2, 0
_080085C0: .4byte gCamera
_080085C4:
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r0, _0800869C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _080086A0 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	bne _080085EA
	b _0800884A
_080085EA:
	ldr r1, _080086A4 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _080086A8 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _080086AC @ =gCamera
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _080086AC @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _080086B0 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_08008638:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008642:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800864C
	b _0800850C
_0800864C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gCamera
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800867A
	mov r3, sb
	lsls r1, r3, #2
	ldr r4, [sp, #0x44]
	lsls r0, r4, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bhs _0800867A
	b _080084E8
_0800867A:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gCamera
	ldr r0, [r2, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _08008692
	b _0800884A
_08008692:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	bhs _0800869A
	b _080084B8
_0800869A:
	b _0800884A
	.align 2, 0
_0800869C: .4byte gUnknown_030022D0
_080086A0: .4byte iwram_end
_080086A4: .4byte 0x040000D4
_080086A8: .4byte 0x80000003
_080086AC: .4byte gCamera
_080086B0: .4byte 0x000001FF
_080086B4:
	mov r4, sl
	lsls r1, r4, #8
	ldr r6, _08008708 @ =gCamera
	ldr r0, [r6, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _080086C4
	b _0800884A
_080086C4:
	ldr r0, [sp, #0x10]
	cmp sl, r0
	blo _080086CC
	b _0800884A
_080086CC:
	ldr r1, _08008708 @ =gCamera
	ldr r0, [r1]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080086E0
	b _0800882C
_080086E0:
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blo _080086E8
	b _0800882C
_080086E8:
	ldr r3, [sp, #0xc]
	mov r0, sl
	muls r0, r3, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08008702
	b _0800880E
_08008702:
	subs r0, #8
	adds r5, r6, r0
	b _08008804
	.align 2, 0
_08008708: .4byte gCamera
_0800870C:
	cmp r1, #0xfe
	beq _08008746
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, _0800874C @ =gCamera
	ldr r0, [r4]
	mov r6, r8
	subs r0, r6, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008746
	ldr r0, [r4, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008746
	subs r0, #0x10
	cmp r0, #0xa0
	ble _08008750
_08008746:
	adds r5, #2
	b _08008804
	.align 2, 0
_0800874C: .4byte gCamera
_08008750:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _08008764
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08008788
_08008764:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08008784 @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl sub_80051E8
	b _080087FA
	.align 2, 0
_08008784: .4byte gCamera
_08008788:
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r0, _0800885C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _08008860 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	beq _0800884A
	ldr r1, _08008864 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _08008868 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _0800886C @ =gCamera
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _0800886C @ =gCamera
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _08008870 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_080087FA:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008804:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800880E
	b _0800870C
_0800880E:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _0800886C @ =gCamera
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800882C
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800882C
	b _080086E8
_0800882C:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r4, _0800886C @ =gCamera
	ldr r0, [r4, #4]
	adds r0, #0xa0
	cmp r1, r0
	bge _0800884A
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs _0800884A
	b _080086CC
_0800884A:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800885C: .4byte gUnknown_030022D0
_08008860: .4byte iwram_end
_08008864: .4byte 0x040000D4
_08008868: .4byte 0x80000003
_0800886C: .4byte gCamera
_08008870: .4byte 0x000001FF

	thumb_func_start sub_8008874
sub_8008874: @ 0x08008874
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08008888 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	ldr r0, [r0]
	bl EwramFree
	pop {r0}
	bx r0
	.align 2, 0
_08008888: .4byte IWRAM_START + 0x30

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
	bl sub_800B03C
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
	bl sub_800B03C
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
	bl sub_800B03C
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

	thumb_func_start sub_8009628
sub_8009628: @ 0x08009628
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080096A0 @ =sub_80096B4
	str r3, [sp]
	movs r1, #0x30
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	movs r1, #0
	mov r8, r1
	movs r3, #0
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	str r3, [r2, #4]
	strh r3, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r5, [r2, #0xa]
	ldr r5, _080096A4 @ =IWRAM_START + 0x20
	adds r1, r4, r5
	strb r6, [r1]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r1, _080096A8 @ =IWRAM_START + 0x21
	adds r5, r4, r1
	movs r1, #0xff
	strb r1, [r5]
	ldr r1, _080096AC @ =IWRAM_START + 0x22
	adds r5, r4, r1
	movs r1, #0x10
	strb r1, [r5]
	ldr r5, _080096B0 @ =IWRAM_START + 0x25
	adds r4, r4, r5
	mov r1, r8
	strb r1, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r2, #0x28]
	str r3, [r2, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080096A0: .4byte sub_80096B4
_080096A4: .4byte IWRAM_START + 0x20
_080096A8: .4byte IWRAM_START + 0x21
_080096AC: .4byte IWRAM_START + 0x22
_080096B0: .4byte IWRAM_START + 0x25

	thumb_func_start sub_80096B4
sub_80096B4: @ 0x080096B4
	push {r4, lr}
	ldr r4, _080096D8 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_80036E0
	cmp r0, #0
	bne _080096D0
	ldr r0, [r4]
	bl TaskDestroy
_080096D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080096D8: .4byte gCurTask

	thumb_func_start sub_80096DC
sub_80096DC: @ 0x080096DC
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08009750 @ =sub_8009854
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldr r1, _08009754 @ =gMultiplayerMissingHeartbeats
	strb r4, [r1, #3]
	strb r4, [r1, #2]
	strb r4, [r1, #1]
	strb r4, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, _08009758 @ =gDispCnt
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r5]
	ldr r2, _0800975C @ =gBgCntRegs
	movs r3, #0
	ldr r0, _08009760 @ =0x00001F06
	strh r0, [r2]
	strh r4, [r1, #4]
	strb r3, [r1, #6]
	ldr r0, _08009764 @ =0x06004020
	str r0, [r1]
	ldr r0, _08009768 @ =gBldRegs
	strh r4, [r0, #4]
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _0800976C @ =gWinRegs
	ldr r2, _08009770 @ =0x0000F0F0
	strh r2, [r0]
	ldr r1, _08009774 @ =0x0000A0A0
	strh r1, [r0, #4]
	strh r2, [r0, #2]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldrh r1, [r5]
	ldr r0, _08009778 @ =0x00001FFF
	ands r0, r1
	strh r0, [r5]
	ldr r0, _0800977C @ =gBgScrollRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009750: .4byte sub_8009854
_08009754: .4byte gMultiplayerMissingHeartbeats
_08009758: .4byte gDispCnt
_0800975C: .4byte gBgCntRegs
_08009760: .4byte 0x00001F06
_08009764: .4byte 0x06004020
_08009768: .4byte gBldRegs
_0800976C: .4byte gWinRegs
_08009770: .4byte 0x0000F0F0
_08009774: .4byte 0x0000A0A0
_08009778: .4byte 0x00001FFF
_0800977C: .4byte gBgScrollRegs

	thumb_func_start sub_8009780
sub_8009780: @ 0x08009780
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _080097C0 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _080097C4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r4, #9
	ands r4, r1
	cmp r4, #0
	beq _080097D4
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _080097C8 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080097CC @ =gUnknown_03002280
	strb r0, [r1]
	strb r0, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r1, [r6]
	ldr r0, _080097D0 @ =sub_80098C0
	str r0, [r1, #8]
	b _08009848
	.align 2, 0
_080097C0: .4byte gCurTask
_080097C4: .4byte gPressedKeys
_080097C8: .4byte gUnknown_03004D80
_080097CC: .4byte gUnknown_03002280
_080097D0: .4byte sub_80098C0
_080097D4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009804
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, [r6]
	bl TaskDestroy
	ldr r0, _080097FC @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _08009800 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	b _08009848
	.align 2, 0
_080097FC: .4byte gUnknown_03004D80
_08009800: .4byte gUnknown_03002280
_08009804:
	ldr r0, _08009818 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800981C
	ldrb r0, [r5, #6]
	subs r0, #1
	b _08009828
	.align 2, 0
_08009818: .4byte gRepeatedKeys
_0800981C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800982A
	ldrb r0, [r5, #6]
	adds r0, #1
_08009828:
	strb r0, [r5, #6]
_0800982A:
	ldrb r1, [r5, #6]
	add r0, sp, #0xc
	bl sub_80044D8
	ldr r0, [r5]
	ldr r1, _08009850 @ =Palette_Stage_LeafForest_Act1
	movs r2, #0
	str r2, [sp]
	add r3, sp, #0xc
	str r3, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0xe
	bl sub_8004274
_08009848:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009850: .4byte Palette_Stage_LeafForest_Act1

	thumb_func_start sub_8009854
sub_8009854: @ 0x08009854
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080098A4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r1, _080098A8 @ =gBgPalette
	movs r3, #0
	ldr r0, _080098AC @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _080098B0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4]
	ldr r1, _080098B4 @ =Palette_Stage_LeafForest_Act1
	str r3, [sp]
	ldr r2, _080098B8 @ =gUnknown_080D5128
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r2, #6
	movs r3, #0xe
	bl sub_8004274
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [r5]
	ldr r0, _080098BC @ =sub_8009780
	str r0, [r1, #8]
	bl _call_via_r0
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080098A4: .4byte gCurTask
_080098A8: .4byte gBgPalette
_080098AC: .4byte 0x00007FFF
_080098B0: .4byte gFlags
_080098B4: .4byte Palette_Stage_LeafForest_Act1
_080098B8: .4byte gUnknown_080D5128
_080098BC: .4byte sub_8009780

	thumb_func_start sub_80098C0
sub_80098C0: @ 0x080098C0
	push {r4, r5, lr}
	ldr r0, _080098E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	ldrb r4, [r1, #6]
	adds r5, r4, #0
	bl TaskDestroy
	cmp r4, #0
	bne _080098EC
	ldr r0, _080098E8 @ =gCurrentLevel
	strb r4, [r0]
	bl GameStageStart
	b _08009900
	.align 2, 0
_080098E4: .4byte gCurTask
_080098E8: .4byte gCurrentLevel
_080098EC:
	cmp r5, #0x22
	bhi _08009900
	ldr r1, _08009908 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	ldr r1, _0800990C @ =gCurrentLevel
	subs r0, r5, #1
	strb r0, [r1]
	bl GameStageStart
_08009900:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009908: .4byte gUnknown_03005B4C
_0800990C: .4byte gCurrentLevel
_08009910:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start nullsub_8002A34_0
nullsub_8002A34_0: @ 0x08009914
	bx lr
	.align 2, 0

	thumb_func_start sub_8009918
sub_8009918: @ 0x08009918
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800995C @ =sub_8009964
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08009960 @ =sub_8009DEC
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r2, r1
	movs r4, #0
	movs r3, #0
	movs r1, #0x78
	strh r1, [r2, #6]
	movs r1, #0xc8
	strh r1, [r2, #8]
	strh r3, [r2]
	movs r1, #0x40
	strh r1, [r2, #2]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r2, #4]
	strb r4, [r2, #0xa]
	movs r1, #0x20
	strb r1, [r2, #0xb]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800995C: .4byte sub_8009964
_08009960: .4byte sub_8009DEC

	thumb_func_start sub_8009964
sub_8009964: @ 0x08009964
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08009998 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08009984
	b _08009DD6
_08009984:
	ldrh r0, [r4]
	ldr r1, _0800999C @ =0x000001FF
	adds r2, r0, #0
	cmp r2, r1
	bhi _080099A0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	b _080099A6
	.align 2, 0
_08009998: .4byte gCurTask
_0800999C: .4byte 0x000001FF
_080099A0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
_080099A6:
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, r2, r0
	movs r2, #0
	mov r8, r2
	ldr r3, _08009A44 @ =0x000003FF
	ands r0, r3
	strh r0, [r4]
	ldrb r1, [r4, #0xb]
	adds r5, r0, r1
	ands r5, r3
	ldr r6, _08009A48 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r1, r0, #0x10
	cmp r1, #0
	bne _080099D6
	b _08009DD6
_080099D6:
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	asrs r1, r1, #0x16
	str r3, [sp, #0x18]
	bl Div
	mov sl, r0
	add r2, sp, #0x10
	movs r1, #8
	ldrsh r0, [r4, r1]
	mov sb, r0
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #6]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r2
	ldr r3, [sp, #0x18]
	cmp r0, #0
	bgt _08009A86
	mov r0, r8
	strh r0, [r2]
	cmp r5, #0xff
	bls _08009A50
	ldr r2, _08009A4C @ =0xFFFFFD00
	adds r1, r5, r2
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r3, #6
	ldrsh r1, [r4, r3]
	b _08009ACC
	.align 2, 0
_08009A44: .4byte 0x000003FF
_08009A48: .4byte gSineTable
_08009A4C: .4byte 0xFFFFFD00
_08009A50:
	subs r1, r7, r5
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r3, sl
	strh r0, [r3, #2]
	b _08009AE4
_08009A86:
	cmp r0, #0xef
	ble _08009ADE
	movs r0, #0xf0
	mov r8, r0
	mov r2, r8
	mov r1, sl
	strh r2, [r1]
	cmp r5, #0xff
	bls _08009AA4
	ldr r0, _08009AA0 @ =0xFFFFFD00
	adds r1, r5, r0
	b _08009AA6
	.align 2, 0
_08009AA0: .4byte 0xFFFFFD00
_08009AA4:
	subs r1, r7, r5
_08009AA6:
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	mov r3, r8
	subs r1, r3, r1
_08009ACC:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r1, sl
	strh r0, [r1, #2]
	b _08009AE4
_08009ADE:
	mov r3, r8
	mov r2, sl
	strh r3, [r2, #2]
_08009AE4:
	add r1, sp, #8
	mov r2, sl
	ldrh r0, [r2]
	movs r3, #0
	mov sb, r3
	strb r0, [r1]
	ldrh r0, [r2, #2]
	strb r0, [r1, #1]
	ldr r6, _08009B90 @ =gSineTable
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r5, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r3, sp, #8
	ldrb r2, [r4, #6]
	movs r5, #8
	ldrsh r1, [r4, r5]
	subs r1, #0xa0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	strb r2, [r3, #2]
	adds r1, r3, #0
	movs r0, #0xa0
	strb r0, [r1, #3]
	ldrb r1, [r4, #0xb]
	ldrh r0, [r4]
	subs r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	subs r5, r1, r0
	ldr r3, _08009B94 @ =0x000003FF
	adds r0, r3, #0
	ands r5, r0
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r5, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r2, sp, #0x14
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r2
	cmp r0, #0
	bgt _08009BD8
	mov r3, sb
	strh r3, [r2]
	cmp r5, #0xff
	bls _08009B9C
	ldr r0, _08009B98 @ =0xFFFFFD00
	adds r1, r5, r0
	b _08009B9E
	.align 2, 0
_08009B90: .4byte gSineTable
_08009B94: .4byte 0x000003FF
_08009B98: .4byte 0xFFFFFD00
_08009B9C:
	subs r1, r7, r5
_08009B9E:
	ldr r0, _08009BD4 @ =0x000003FF
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r3, r8
	strh r0, [r3, #2]
	b _08009C3A
	.align 2, 0
_08009BD4: .4byte 0x000003FF
_08009BD8:
	cmp r0, #0xef
	ble _08009C34
	movs r0, #0xf0
	mov sb, r0
	mov r2, sb
	mov r1, r8
	strh r2, [r1]
	cmp r5, #0xff
	bls _08009BF4
	ldr r3, _08009BF0 @ =0xFFFFFD00
	adds r1, r5, r3
	b _08009BF6
	.align 2, 0
_08009BF0: .4byte 0xFFFFFD00
_08009BF4:
	subs r1, r7, r5
_08009BF6:
	ldr r0, _08009C30 @ =0x000003FF
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	mov r3, sb
	subs r1, r3, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	b _08009C3A
	.align 2, 0
_08009C30: .4byte 0x000003FF
_08009C34:
	mov r3, sb
	mov r2, r8
	strh r3, [r2, #2]
_08009C3A:
	add r1, sp, #8
	mov r6, r8
	ldrh r0, [r6]
	strb r0, [r1, #4]
	ldrh r0, [r6, #2]
	strb r0, [r1, #5]
	ldr r2, _08009CC0 @ =gSineTable
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r5, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r2, sp, #8
	movs r5, #8
	ldrsh r1, [r4, r5]
	subs r1, #0xa0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldrb r1, [r4, #6]
	adds r0, r0, r1
	strb r0, [r2, #6]
	adds r1, r2, #0
	movs r0, #0xa0
	strb r0, [r1, #7]
	ldrh r1, [r4]
	ldr r0, _08009CC4 @ =0x000001FF
	cmp r1, r0
	bhi _08009D38
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009C98
	b _08009DD6
_08009C98:
	mov r2, sl
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009CFC
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009CCC
	ldr r2, _08009CC8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009CDA
	.align 2, 0
_08009CC0: .4byte gSineTable
_08009CC4: .4byte 0x000001FF
_08009CC8: .4byte gWinRegs
_08009CCC:
	ldr r2, _08009CF8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009CDA:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	ldrb r1, [r1, #4]
	add r2, sp, #8
	ldrb r2, [r2, #5]
	add r3, sp, #8
	ldrb r3, [r3, #6]
	add r4, sp, #8
	ldrb r4, [r4, #7]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_8006228
	b _08009DD6
	.align 2, 0
_08009CF8: .4byte gWinRegs
_08009CFC:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009D1C
	ldr r2, _08009D18 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009D2A
	.align 2, 0
_08009D18: .4byte gWinRegs
_08009D1C:
	ldr r2, _08009D34 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009D2A:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sub_800724C
	b _08009DD6
	.align 2, 0
_08009D34: .4byte gWinRegs
_08009D38:
	mov r3, sl
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	bgt _08009DD6
	mov r5, r8
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009DA0
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009D70
	ldr r2, _08009D6C @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009D7E
	.align 2, 0
_08009D6C: .4byte gWinRegs
_08009D70:
	ldr r2, _08009D9C @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009D7E:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	ldrb r1, [r1]
	add r2, sp, #8
	ldrb r2, [r2, #1]
	add r3, sp, #8
	ldrb r3, [r3, #2]
	add r4, sp, #8
	ldrb r4, [r4, #3]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_80064A8
	b _08009DD6
	.align 2, 0
_08009D9C: .4byte gWinRegs
_08009DA0:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009DC0
	ldr r2, _08009DBC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009DCE
	.align 2, 0
_08009DBC: .4byte gWinRegs
_08009DC0:
	ldr r2, _08009DE8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009DCE:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sub_800724C
_08009DD6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009DE8: .4byte gWinRegs

	thumb_func_start sub_8009DEC
sub_8009DEC: @ 0x08009DEC
	ldr r0, _08009DFC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08009DFC: .4byte gFlags

	thumb_func_start sub_8009E00
sub_8009E00: @ 0x08009E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _08009E98 @ =sub_8009EB0
	movs r2, #0x80
	lsls r2, r2, #6
	mov sl, r2
	ldr r1, _08009E9C @ =sub_8009F80
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r7, #0
	movs r6, #0
	strh r6, [r4, #0x30]
	mov r0, r8
	strh r0, [r4, #0x16]
	mov r1, sb
	strh r1, [r4, #0x18]
	movs r0, #2
	bl VramMalloc
	str r0, [r4, #4]
	strh r6, [r4, #0x1a]
	strh r6, [r4, #8]
	movs r0, #0xb6
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _08009EA0 @ =gPlayer
	adds r0, #0x84
	ldrb r1, [r0]
	ldr r2, _08009EA4 @ =IWRAM_START + 0x20
	adds r0, r5, r2
	strb r1, [r0]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _08009EA8 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08009EAC @ =IWRAM_START + 0x25
	adds r5, r5, r0
	strb r7, [r5]
	mov r1, sl
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009E98: .4byte sub_8009EB0
_08009E9C: .4byte sub_8009F80
_08009EA0: .4byte gPlayer
_08009EA4: .4byte IWRAM_START + 0x20
_08009EA8: .4byte IWRAM_START + 0x21
_08009EAC: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8009EB0
sub_8009EB0: @ 0x08009EB0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08009F00 @ =gCurTask
	ldr r5, [r0]
	ldrh r1, [r5, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r6, [r4, #0x16]
	ldrh r7, [r4, #0x18]
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	ldr r3, _08009F04 @ =gCamera
	ldr r1, [r3]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #4]
	adds r1, r1, r2
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x3b
	ble _08009F0C
	ldr r0, _08009F08 @ =sub_8009F1C
	str r0, [r5, #8]
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	ldrh r1, [r4, #0x30]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	movs r0, #0
	strh r0, [r4, #0x30]
	b _08009F16
	.align 2, 0
_08009F00: .4byte gCurTask
_08009F04: .4byte gCamera
_08009F08: .4byte sub_8009F1C
_08009F0C:
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	strh r7, [r4, #0x18]
_08009F16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F1C
sub_8009F1C: @ 0x08009F1C
	push {r4, r5, r6, lr}
	ldr r0, _08009F54 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r5, [r4, #0x16]
	ldrh r6, [r4, #0x18]
	ldr r2, _08009F58 @ =gCamera
	ldr r0, [r2]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08009F5C
	adds r0, r3, #0
	bl TaskDestroy
	b _08009F7A
	.align 2, 0
_08009F54: .4byte gCurTask
_08009F58: .4byte gCamera
_08009F5C:
	ldr r1, [r2]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
_08009F7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F80
sub_8009F80: @ 0x08009F80
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8009F94
sub_8009F94: @ 0x08009F94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0800A0C8 @ =gBldRegs
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	str r0, [sp, #4]
	ldr r0, _0800A0CC @ =gLoadedSaveGame
	mov r8, r0
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	ldr r0, _0800A0D0 @ =sub_800A110
	ldr r1, _0800A0D4 @ =sub_800A350
	str r1, [sp]
	movs r1, #0x68
	movs r2, #1
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	ldr r1, _0800A0D8 @ =IWRAM_START + 0x60
	adds r0, r7, r1
	movs r2, #0
	mov sb, r2
	movs r5, #0
	strh r5, [r0]
	adds r1, #2
	adds r0, r7, r1
	strh r5, [r0]
	ldr r2, _0800A0DC @ =IWRAM_START + 0x64
	adds r0, r7, r2
	mov r1, sb
	strb r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r0, #5]
	ldr r2, _0800A0E0 @ =IWRAM_START + 0x65
	adds r0, r7, r2
	strb r1, [r0]
	ldr r2, _0800A0E4 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	orrs r6, r7
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x71
	strh r0, [r6, #0x18]
	ldr r0, _0800A0E8 @ =gPressStartTiles
	lsls r4, r4, #0x18
	asrs r4, r4, #0x15
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramMalloc
	str r0, [r6, #4]
	strh r5, [r6, #8]
	ldrh r0, [r4, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _0800A0EC @ =IWRAM_START + 0x20
	adds r0, r7, r2
	strb r1, [r0]
	strh r5, [r6, #0x14]
	ldr r0, _0800A0F0 @ =IWRAM_START + 0x21
	adds r1, r7, r0
	movs r2, #1
	rsbs r2, r2, #0
	adds r4, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r6, #0x1c]
	ldr r1, _0800A0F4 @ =IWRAM_START + 0x22
	adds r0, r7, r1
	movs r2, #0x10
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	ldr r2, _0800A0F8 @ =IWRAM_START + 0x25
	adds r0, r7, r2
	mov r1, sb
	strb r1, [r0]
	movs r2, #0x40
	mov r8, r2
	mov r0, r8
	strh r0, [r6, #0x1a]
	str r5, [r6, #0x10]
	ldr r1, [sp, #4]
	cmp r1, #0x40
	beq _0800A05A
	movs r0, #0x80
	str r0, [r6, #0x10]
_0800A05A:
	adds r0, r6, #0
	bl sub_8004558
	ldr r2, _0800A0FC @ =IWRAM_START + 0x30
	adds r6, r7, r2
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x50
	strh r0, [r6, #0x18]
	movs r0, #0x1c
	bl VramMalloc
	str r0, [r6, #4]
	strh r5, [r6, #8]
	ldr r0, _0800A100 @ =0x00000414
	strh r0, [r6, #0xa]
	ldr r1, _0800A104 @ =IWRAM_START + 0x50
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	strh r5, [r6, #0x14]
	ldr r0, _0800A108 @ =IWRAM_START + 0x51
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	strh r5, [r6, #0x1c]
	ldr r1, _0800A10C @ =IWRAM_START + 0x52
	adds r0, r7, r1
	mov r2, sl
	strb r2, [r0]
	adds r1, #3
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	mov r0, r8
	strh r0, [r6, #0x1a]
	str r5, [r6, #0x10]
	ldr r1, [sp, #4]
	cmp r1, #0x40
	beq _0800A0B0
	movs r0, #0x80
	str r0, [r6, #0x10]
_0800A0B0:
	adds r0, r6, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A0C8: .4byte gBldRegs
_0800A0CC: .4byte gLoadedSaveGame
_0800A0D0: .4byte sub_800A110
_0800A0D4: .4byte sub_800A350
_0800A0D8: .4byte IWRAM_START + 0x60
_0800A0DC: .4byte IWRAM_START + 0x64
_0800A0E0: .4byte IWRAM_START + 0x65
_0800A0E4: .4byte gUnknown_03005424
_0800A0E8: .4byte gPressStartTiles
_0800A0EC: .4byte IWRAM_START + 0x20
_0800A0F0: .4byte IWRAM_START + 0x21
_0800A0F4: .4byte IWRAM_START + 0x22
_0800A0F8: .4byte IWRAM_START + 0x25
_0800A0FC: .4byte IWRAM_START + 0x30
_0800A100: .4byte 0x00000414
_0800A104: .4byte IWRAM_START + 0x50
_0800A108: .4byte IWRAM_START + 0x51
_0800A10C: .4byte IWRAM_START + 0x52

	thumb_func_start sub_800A110
sub_800A110: @ 0x0800A110
	push {r4, r5, r6, lr}
	ldr r6, _0800A16C @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0800A170 @ =gPhysicalInput
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800A18C
	ldr r2, _0800A174 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x5c
	movs r3, #0
	strh r3, [r2]
	ldr r1, _0800A178 @ =gUnknown_030054E4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0800A17C @ =IWRAM_START + 0x64
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _0800A180 @ =sub_800A310
	str r0, [r1, #8]
	ldr r1, _0800A184 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	strh r3, [r1, #4]
	ldr r1, _0800A188 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x40
	bl sub_800A388
	b _0800A1B6
	.align 2, 0
_0800A16C: .4byte gCurTask
_0800A170: .4byte gPhysicalInput
_0800A174: .4byte gPlayer
_0800A178: .4byte gUnknown_030054E4
_0800A17C: .4byte IWRAM_START + 0x64
_0800A180: .4byte sub_800A310
_0800A184: .4byte gBldRegs
_0800A188: .4byte gUnknown_030054A8
_0800A18C:
	ldr r0, _0800A1E4 @ =gUnknown_030053E4
	ldr r1, [r0]
	ldr r0, _0800A1E8 @ =0x000005BE
	cmp r1, r0
	bls _0800A1B6
	ldr r1, _0800A1EC @ =IWRAM_START + 0x64
	adds r0, r5, r1
	strb r2, [r0]
	ldr r1, [r6]
	ldr r0, _0800A1F0 @ =sub_800A310
	str r0, [r1, #8]
	ldr r1, _0800A1F4 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	strh r2, [r1, #4]
	ldr r1, _0800A1F8 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x40
	bl sub_800A388
_0800A1B6:
	ldr r0, _0800A1FC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800A240
	adds r5, r4, #0
	ldr r0, _0800A200 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800A218
	ldr r0, _0800A1F4 @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800A204
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	orrs r0, r1
	b _0800A20A
	.align 2, 0
_0800A1E4: .4byte gUnknown_030053E4
_0800A1E8: .4byte 0x000005BE
_0800A1EC: .4byte IWRAM_START + 0x64
_0800A1F0: .4byte sub_800A310
_0800A1F4: .4byte gBldRegs
_0800A1F8: .4byte gUnknown_030054A8
_0800A1FC: .4byte gUnknown_03005424
_0800A200: .4byte gUnknown_03005590
_0800A204:
	ldr r0, [r4, #0x10]
	ldr r1, _0800A228 @ =0xFFFFFE7F
	ands r0, r1
_0800A20A:
	str r0, [r4, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0800A218:
	ldr r0, _0800A22C @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800A230
	ldr r0, [r4, #0x40]
	movs r1, #0x80
	orrs r0, r1
	b _0800A236
	.align 2, 0
_0800A228: .4byte 0xFFFFFE7F
_0800A22C: .4byte gBldRegs
_0800A230:
	ldr r0, [r4, #0x40]
	ldr r1, _0800A248 @ =0xFFFFFE7F
	ands r0, r1
_0800A236:
	str r0, [r4, #0x40]
	adds r0, r4, #0
	adds r0, #0x30
	bl sub_80051E8
_0800A240:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A248: .4byte 0xFFFFFE7F

	thumb_func_start sub_800A24C
sub_800A24C: @ 0x0800A24C
	push {r4, r5, r6, lr}
	ldr r0, _0800A2C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	ldr r0, _0800A2CC @ =IWRAM_START + 0x62
	adds r4, r6, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _0800A2D0 @ =gMPlayInfo_BGM
	ldr r5, _0800A2D4 @ =0x0000FFFF
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2D8 @ =gMPlayInfo_SE1
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2DC @ =gMPlayInfo_SE2
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2E0 @ =gMPlayInfo_SE3
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r4]
	cmp r0, #0x2f
	bls _0800A308
	ldr r0, _0800A2E4 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldr r2, _0800A2E8 @ =IWRAM_START + 0x65
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #5]
	movs r0, #0
	adds r1, r5, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800A2EC @ =gUnknown_03002AE4
	ldr r0, _0800A2F0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A2F4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0800A2F8 @ =gVramGraphicsCopyCursor
	ldr r0, _0800A2FC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A300 @ =IWRAM_START + 0x64
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A304
	bl CreateTitleScreen
	b _0800A308
	.align 2, 0
_0800A2C8: .4byte gCurTask
_0800A2CC: .4byte IWRAM_START + 0x62
_0800A2D0: .4byte gMPlayInfo_BGM
_0800A2D4: .4byte 0x0000FFFF
_0800A2D8: .4byte gMPlayInfo_SE1
_0800A2DC: .4byte gMPlayInfo_SE2
_0800A2E0: .4byte gMPlayInfo_SE3
_0800A2E4: .4byte gLoadedSaveGame
_0800A2E8: .4byte IWRAM_START + 0x65
_0800A2EC: .4byte gUnknown_03002AE4
_0800A2F0: .4byte gUnknown_0300287C
_0800A2F4: .4byte gUnknown_03005390
_0800A2F8: .4byte gVramGraphicsCopyCursor
_0800A2FC: .4byte gVramGraphicsCopyQueueIndex
_0800A300: .4byte IWRAM_START + 0x64
_0800A304:
	bl CreateTitleScreenAtPlayModeMenu
_0800A308:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A310
sub_800A310: @ 0x0800A310
	push {lr}
	ldr r0, _0800A33C @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	ldr r0, _0800A340 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0800A344 @ =gBldRegs
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0800A348 @ =0x00000FFF
	cmp r1, r0
	bls _0800A336
	ldr r0, _0800A34C @ =sub_800A24C
	str r0, [r3, #8]
_0800A336:
	pop {r0}
	bx r0
	.align 2, 0
_0800A33C: .4byte gCurTask
_0800A340: .4byte IWRAM_START + 0x60
_0800A344: .4byte gBldRegs
_0800A348: .4byte 0x00000FFF
_0800A34C: .4byte sub_800A24C

	thumb_func_start sub_800A350
sub_800A350: @ 0x0800A350
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r1, _0800A37C @ =gUnknown_030054E4
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0800A380 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0800A384 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A37C: .4byte gUnknown_030054E4
_0800A380: .4byte gUnknown_03005424
_0800A384: .4byte 0x0000FFBF

	thumb_func_start sub_800A388
sub_800A388: @ 0x0800A388
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800A3C8 @ =sub_800A3D4
	ldr r2, _0800A3CC @ =0x0000FFFE
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4]
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4, #2]
	ldr r1, _0800A3D0 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A3C8: .4byte sub_800A3D4
_0800A3CC: .4byte 0x0000FFFE
_0800A3D0: .4byte gUnknown_030054A8

	thumb_func_start sub_800A3D4
sub_800A3D4: @ 0x0800A3D4
	push {r4, r5, lr}
	ldr r0, _0800A424 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0800A428 @ =gMPlayInfo_BGM
	ldr r4, _0800A42C @ =0x0000FFFF
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A430 @ =gMPlayInfo_SE1
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A434 @ =gMPlayInfo_SE2
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A438 @ =gMPlayInfo_SE3
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800A41E
	movs r0, #0
	strh r0, [r5]
_0800A41E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A424: .4byte gCurTask
_0800A428: .4byte gMPlayInfo_BGM
_0800A42C: .4byte 0x0000FFFF
_0800A430: .4byte gMPlayInfo_SE1
_0800A434: .4byte gMPlayInfo_SE2
_0800A438: .4byte gMPlayInfo_SE3

	thumb_func_start sub_800A43C
sub_800A43C: @ 0x0800A43C
	push {r4, lr}
	sub sp, #8
	ldr r1, _0800A4A0 @ =gDispCnt
	movs r2, #0x88
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0800A4A4 @ =gBgCntRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _0800A4A8 @ =0x00001E01
	strh r0, [r1, #4]
	str r3, [sp, #4]
	ldr r1, _0800A4AC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0800A4B0 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800A4B4 @ =gUnknown_03004D80
	strb r4, [r0, #2]
	ldr r1, _0800A4B8 @ =gUnknown_03002280
	strb r4, [r1, #8]
	strb r4, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x40
	strb r0, [r1, #0xb]
	ldr r0, _0800A4BC @ =sub_800A4CC
	movs r2, #0x80
	lsls r2, r2, #5
	str r3, [sp]
	movs r1, #0
	bl TaskCreate
	ldr r1, _0800A4C0 @ =gBgPalette
	ldr r0, _0800A4C4 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800A4C8 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A4A0: .4byte gDispCnt
_0800A4A4: .4byte gBgCntRegs
_0800A4A8: .4byte 0x00001E01
_0800A4AC: .4byte 0x040000D4
_0800A4B0: .4byte 0x85000010
_0800A4B4: .4byte gUnknown_03004D80
_0800A4B8: .4byte gUnknown_03002280
_0800A4BC: .4byte sub_800A4CC
_0800A4C0: .4byte gBgPalette
_0800A4C4: .4byte 0x00007FFF
_0800A4C8: .4byte gFlags

	thumb_func_start sub_800A4CC
sub_800A4CC: @ 0x0800A4CC
	push {lr}
	sub sp, #0xc
	ldr r0, _0800A500 @ =0x06000020
	ldr r1, _0800A504 @ =Palette_Stage_LeafForest_Act1
	movs r2, #2
	str r2, [sp]
	ldr r2, _0800A508 @ =gUnknown_080D5130
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0xa
	bl sub_8004274
	ldr r0, _0800A50C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800A4F8
	bl sub_800A510
_0800A4F8:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0800A500: .4byte 0x06000020
_0800A504: .4byte Palette_Stage_LeafForest_Act1
_0800A508: .4byte gUnknown_080D5130
_0800A50C: .4byte gPressedKeys

	thumb_func_start sub_800A510
sub_800A510: @ 0x0800A510
	push {lr}
	ldr r1, _0800A538 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1, #2]
	ldr r1, _0800A53C @ =gUnknown_03002280
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	strb r0, [r1, #0xb]
	ldr r0, _0800A540 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl CreateTitleScreen
	pop {r0}
	bx r0
	.align 2, 0
_0800A538: .4byte gUnknown_03004D80
_0800A53C: .4byte gUnknown_03002280
_0800A540: .4byte gCurTask

	thumb_func_start sub_800A544
sub_800A544: @ 0x0800A544
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	mov sl, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0800A5E4 @ =sub_800A5F8
	str r1, [sp]
	movs r1, #0x44
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r5, r1
	movs r3, #0
	str r3, [r1, #0x30]
	str r3, [r1, #0x34]
	movs r2, #0
	mov sb, r2
	strh r3, [r1, #0x38]
	strh r3, [r1, #0x3a]
	strh r3, [r1, #0x3c]
	strh r3, [r1, #0x3e]
	ldr r4, _0800A5E8 @ =IWRAM_START + 0x40
	adds r2, r5, r4
	strh r3, [r2]
	strh r3, [r1, #0x16]
	strh r3, [r1, #0x18]
	mov r2, sl
	str r2, [r1, #4]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r6, [r1, #0xa]
	subs r4, #0x20
	adds r2, r5, r4
	mov r4, r8
	strb r4, [r2]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r2, _0800A5EC @ =IWRAM_START + 0x21
	adds r4, r5, r2
	movs r2, #0xff
	strb r2, [r4]
	ldr r2, _0800A5F0 @ =IWRAM_START + 0x22
	adds r4, r5, r2
	movs r2, #0x10
	strb r2, [r4]
	ldr r4, _0800A5F4 @ =IWRAM_START + 0x25
	adds r5, r5, r4
	mov r2, sb
	strb r2, [r5]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A5E4: .4byte sub_800A5F8
_0800A5E8: .4byte IWRAM_START + 0x40
_0800A5EC: .4byte IWRAM_START + 0x21
_0800A5F0: .4byte IWRAM_START + 0x22
_0800A5F4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800A5F8
sub_800A5F8: @ 0x0800A5F8
	push {r4, r5, r6, lr}
	ldr r6, _0800A67C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3e]
	ldrh r1, [r5, #0x3a]
	adds r0, r0, r1
	strh r0, [r5, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r5, r1]
	ldr r1, [r5, #0x34]
	adds r1, r1, r2
	str r1, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _0800A680 @ =gCamera
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r5, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r0, _0800A684 @ =IWRAM_START + 0x40
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800A64A
	subs r0, #1
	strh r0, [r4]
_0800A64A:
	ldrh r0, [r5, #0x16]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800A672
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	subs r0, #0x20
	cmp r0, #0xa0
	bgt _0800A672
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800A688
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800A688
_0800A672:
	ldr r0, [r6]
	bl TaskDestroy
	b _0800A68E
	.align 2, 0
_0800A67C: .4byte gCurTask
_0800A680: .4byte gCamera
_0800A684: .4byte IWRAM_START + 0x40
_0800A688:
	adds r0, r5, #0
	bl sub_80051E8
_0800A68E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800A694
sub_800A694: @ 0x0800A694
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800A6A8
sub_800A6A8: @ 0x0800A6A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _0800A73C @ =sub_800A744
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0800A740 @ =sub_800A9B8
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r4, r4, r5
	movs r0, #0
	mov sb, r0
	movs r6, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r4, #8]
	str r6, [r4, #0xc]
	bl sub_8009918
	str r0, [r4]
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	movs r0, #0x3c
	strh r0, [r1, #6]
	movs r0, #0xc8
	mov r8, r0
	mov r0, r8
	strh r0, [r1, #8]
	strh r6, [r1]
	movs r0, #0x20
	strh r0, [r1, #2]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #4]
	movs r0, #2
	strb r0, [r1, #0xa]
	mov r0, sb
	strb r0, [r1, #0xb]
	bl sub_8009918
	str r0, [r4, #4]
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	mov r0, r8
	strh r0, [r1, #6]
	movs r0, #0xf0
	strh r0, [r1, #8]
	strh r6, [r1]
	movs r0, #0x10
	strh r0, [r1, #2]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1, #4]
	movs r0, #3
	strb r0, [r1, #0xa]
	mov r0, sb
	strb r0, [r1, #0xb]
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A73C: .4byte sub_800A744
_0800A740: .4byte sub_800A9B8

	thumb_func_start sub_800A744
sub_800A744: @ 0x0800A744
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0800A7B8 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov ip, r1
	adds r5, r0, r1
	ldr r0, _0800A7BC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	beq _0800A76E
	b _0800A8CC
_0800A76E:
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r0, r2
	ldr r2, _0800A7C0 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #7
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	bne _0800A7C8
	ldrb r6, [r3, #0xb]
	adds r4, r6, #0
	cmp r4, #0
	beq _0800A7C8
	ldr r2, _0800A7C4 @ =gDispCnt
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0800A7D8
	cmp r4, #0x1f
	bhi _0800A7A4
	adds r0, r6, #1
	strb r0, [r3, #0xb]
_0800A7A4:
	ldr r0, [r5, #4]
	ldrh r0, [r0, #6]
	mov r1, ip
	adds r3, r0, r1
	ldrb r0, [r3, #0xb]
	cmp r0, #0xf
	bhi _0800A800
	adds r0, #1
	strb r0, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7B8: .4byte gCurTask
_0800A7BC: .4byte gUnknown_03005424
_0800A7C0: .4byte gUnknown_03005590
_0800A7C4: .4byte gDispCnt
_0800A7C8:
	ldr r2, _0800A7F0 @ =gDispCnt
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0800A800
_0800A7D8:
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	bne _0800A7F4
	movs r2, #4
	strb r2, [r3, #0xb]
	ldr r0, [r5, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	strb r2, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7F0: .4byte gDispCnt
_0800A7F4:
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
_0800A800:
	ldr r2, [r5, #0xc]
	ldr r0, _0800A880 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A884 @ =gSineTable
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _0800A888 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r5, #0xc]
	ldr r1, _0800A88C @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	ldrh r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r1, _0800A890 @ =gWinRegs
	ldr r0, _0800A894 @ =0x00003F3F
	strh r0, [r1, #8]
	movs r0, #0x1e
	strh r0, [r1, #0xa]
	ldrh r0, [r5, #8]
	subs r0, #0x40
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	ldr r1, _0800A898 @ =0x05FF0000
	cmp r0, r1
	bgt _0800A85A
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #8]
_0800A85A:
	ldr r1, _0800A89C @ =gBldRegs
	ldr r0, _0800A8A0 @ =0x00003F41
	strh r0, [r1]
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #4]
	ldr r0, _0800A8A4 @ =gPlayer
	ldr r0, [r0, #0x20]
	ldr r1, _0800A8A8 @ =0x8000080
	ands r0, r1
	cmp r0, #0
	beq _0800A8B0
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0800A8AC @ =sub_800A8E0
	str r0, [r1, #8]
	b _0800A8CC
	.align 2, 0
_0800A880: .4byte 0xFFFFFE00
_0800A884: .4byte gSineTable
_0800A888: .4byte 0x000001FF
_0800A88C: .4byte gBgScrollRegs
_0800A890: .4byte gWinRegs
_0800A894: .4byte 0x00003F3F
_0800A898: .4byte 0x05FF0000
_0800A89C: .4byte gBldRegs
_0800A8A0: .4byte 0x00003F41
_0800A8A4: .4byte gPlayer
_0800A8A8: .4byte 0x8000080
_0800A8AC: .4byte sub_800A8E0
_0800A8B0:
	ldr r0, _0800A8D8 @ =gUnknown_030054E4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A8CC
	ldr r0, [r5]
	bl TaskDestroy
	ldr r0, [r5, #4]
	bl TaskDestroy
	ldr r0, _0800A8DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0800A8CC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A8D8: .4byte gUnknown_030054E4
_0800A8DC: .4byte gCurTask

	thumb_func_start sub_800A8E0
sub_800A8E0: @ 0x0800A8E0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r3, r0, r1
	ldr r2, _0800A99C @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _0800A918
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A918
	subs r0, #2
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0800A918
	movs r5, #1
_0800A918:
	ldr r0, [r4, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800A940
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A940
	subs r0, #1
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0800A940
	movs r5, #1
_0800A940:
	ldr r2, [r4, #0xc]
	ldr r0, _0800A9A0 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A9A4 @ =gSineTable
	ldr r0, [r6]
	ldr r1, _0800A9A8 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r4, #0xc]
	ldr r1, _0800A9AC @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	cmp r5, #0
	beq _0800A990
	ldr r2, _0800A9B0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, [r4, #4]
	bl TaskDestroy
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0800A990:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A998: .4byte gCurTask
_0800A99C: .4byte gUnknown_03005590
_0800A9A0: .4byte 0xFFFFFE00
_0800A9A4: .4byte gSineTable
_0800A9A8: .4byte 0x000001FF
_0800A9AC: .4byte gBgScrollRegs
_0800A9B0: .4byte gDispCnt
_0800A9B4: .4byte 0x0000FEFF

	thumb_func_start sub_800A9B8
sub_800A9B8: @ 0x0800A9B8
	ldr r2, _0800A9E4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9E8 @ =0x00009FFF
	ands r0, r1
	ldr r1, _0800A9EC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0800A9F0 @ =gBldRegs
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #4]
	ldr r0, _0800A9F4 @ =gWinRegs
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0, #6]
	ldr r2, _0800A9F8 @ =gFlags
	ldr r0, [r2]
	subs r1, #5
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800A9E4: .4byte gDispCnt
_0800A9E8: .4byte 0x00009FFF
_0800A9EC: .4byte 0x0000FEFF
_0800A9F0: .4byte gBldRegs
_0800A9F4: .4byte gWinRegs
_0800A9F8: .4byte gFlags

	thumb_func_start sub_800A9FC
sub_800A9FC: @ 0x0800A9FC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0800AA78 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bge _0800AA12
	movs r4, #0
_0800AA12:
	ldr r0, _0800AA7C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0800AAF8
	ldr r1, _0800AA80 @ =sAnimInfoPauseMenu
	lsls r4, r4, #0x18
	asrs r0, r4, #0x15
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramMalloc
	adds r6, r0, #0
	ldr r0, _0800AA84 @ =ewram_end
	ldr r0, [r0]
	cmp r6, r0
	beq _0800AAF8
	ldr r0, _0800AA88 @ =sub_800ADAC
	ldr r2, _0800AA8C @ =0x0000FFFE
	ldr r1, _0800AA90 @ =sub_800AE44
	str r1, [sp]
	movs r1, #0x70
	movs r3, #4
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r1, _0800AA94 @ =IWRAM_START + 0x60
	adds r0, r2, r1
	movs r1, #0
	strh r5, [r0]
	ldr r3, _0800AA98 @ =IWRAM_START + 0x62
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0800AA9C @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AAA4
	ldr r0, _0800AAA0 @ =IWRAM_START + 0x63
	adds r1, r2, r0
	movs r0, #2
	b _0800AAAA
	.align 2, 0
_0800AA78: .4byte gLoadedSaveGame
_0800AA7C: .4byte gUnknown_03005424
_0800AA80: .4byte sAnimInfoPauseMenu
_0800AA84: .4byte ewram_end
_0800AA88: .4byte sub_800ADAC
_0800AA8C: .4byte 0x0000FFFE
_0800AA90: .4byte sub_800AE44
_0800AA94: .4byte IWRAM_START + 0x60
_0800AA98: .4byte IWRAM_START + 0x62
_0800AA9C: .4byte gInput
_0800AAA0: .4byte IWRAM_START + 0x63
_0800AAA4:
	ldr r3, _0800AB00 @ =IWRAM_START + 0x63
	adds r1, r2, r3
	movs r0, #1
_0800AAAA:
	strb r0, [r1]
	mov r0, ip
	str r6, [r0, #4]
	movs r3, #0
	movs r2, #0
	movs r0, #0x40
	mov r1, ip
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	ldr r1, _0800AB04 @ =sAnimInfoPauseMenu
	asrs r0, r4, #0x15
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	mov r4, ip
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #0x78
	strh r0, [r4, #0x16]
	movs r0, #0x50
	strh r0, [r4, #0x18]
	str r2, [r4, #0x10]
	mov r0, ip
	bl sub_8004558
_0800AAF8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB00: .4byte IWRAM_START + 0x63
_0800AB04: .4byte sAnimInfoPauseMenu

	thumb_func_start sub_800AB08
sub_800AB08: @ 0x0800AB08
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800AB3C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _0800AB40 @ =gReleasedKeys
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800AB4C
	ldr r0, _0800AB44 @ =IWRAM_START + 0x63
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800AB4C
	movs r0, #1
	strb r0, [r2]
	ldr r6, _0800AB48 @ =IWRAM_START + 0x62
	adds r5, r3, r6
	b _0800AC7C
	.align 2, 0
_0800AB3C: .4byte gCurTask
_0800AB40: .4byte gReleasedKeys
_0800AB44: .4byte IWRAM_START + 0x63
_0800AB48: .4byte IWRAM_START + 0x62
_0800AB4C:
	ldr r0, _0800ABA0 @ =gPressedKeys
	ldrh r6, [r0]
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	bne _0800AB84
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r3, [r0]
	adds r5, r0, #0
	cmp r3, #0
	bne _0800AB70
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800AB84
_0800AB70:
	ldr r0, _0800ABA4 @ =gGameMode
	ldrb r7, [r0]
	cmp r7, #0
	beq _0800AC18
	movs r0, #2
	ands r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0800ABB8
_0800AB84:
	ldr r2, _0800ABA8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABAC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800ABB0 @ =gMPlayTable
	ldr r0, [r0]
	bl m4aMPlayContinue
	ldr r0, _0800ABB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800AD8A
	.align 2, 0
_0800ABA0: .4byte gPressedKeys
_0800ABA4: .4byte gGameMode
_0800ABA8: .4byte gFlags
_0800ABAC: .4byte 0xFFFFFBFF
_0800ABB0: .4byte gMPlayTable
_0800ABB4: .4byte gCurTask
_0800ABB8:
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800ABF8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABFC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC00 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800AC04 @ =gUnknown_03002AE4
	ldr r0, _0800AC08 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC0C @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _0800AC10 @ =gVramGraphicsCopyCursor
	ldr r0, _0800AC14 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTimeAttackLobbyScreen
	b _0800AD8A
	.align 2, 0
_0800ABF8: .4byte gFlags
_0800ABFC: .4byte 0xFFFFFBFF
_0800AC00: .4byte 0x0000FFFF
_0800AC04: .4byte gUnknown_03002AE4
_0800AC08: .4byte gUnknown_0300287C
_0800AC0C: .4byte gUnknown_03005390
_0800AC10: .4byte gVramGraphicsCopyCursor
_0800AC14: .4byte gVramGraphicsCopyQueueIndex
_0800AC18:
	cmp r3, #0
	beq _0800AC7C
	mov r6, ip
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800AC5C @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800AC60 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC64 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800AC68 @ =gUnknown_03002AE4
	ldr r0, _0800AC6C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC70 @ =gUnknown_03005390
	strb r7, [r0]
	ldr r1, _0800AC74 @ =gVramGraphicsCopyCursor
	ldr r0, _0800AC78 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTitleScreenAndSkipIntro
	b _0800AD8A
	.align 2, 0
_0800AC5C: .4byte gFlags
_0800AC60: .4byte 0xFFFFFBFF
_0800AC64: .4byte 0x0000FFFF
_0800AC68: .4byte gUnknown_03002AE4
_0800AC6C: .4byte gUnknown_0300287C
_0800AC70: .4byte gUnknown_03005390
_0800AC74: .4byte gVramGraphicsCopyCursor
_0800AC78: .4byte gVramGraphicsCopyQueueIndex
_0800AC7C:
	ldr r0, _0800ACB0 @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0800AC92
	ldr r0, [r4, #0x40]
	ldr r1, _0800ACB4 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x10]
	ands r0, r1
	str r0, [r4, #0x10]
_0800AC92:
	ldr r2, _0800ACB8 @ =gRepeatedKeys
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800ACBC
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800ACBC
	movs r0, #0
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0800ACD6
	.align 2, 0
_0800ACB0: .4byte gBldRegs
_0800ACB4: .4byte 0xFFFFFE7F
_0800ACB8: .4byte gRepeatedKeys
_0800ACBC:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800ACD6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800ACDC
	movs r0, #1
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
_0800ACD6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800AD38
_0800ACDC:
	ldr r2, _0800AD1C @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD20 @ =0x050003F2
	str r0, [r2, #4]
	ldr r3, _0800AD24 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD28 @ =0x050003F8
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800AD2C @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800AD30 @ =IWRAM_START + 0x1F2
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800AD34 @ =IWRAM_START + 0x1F8
	b _0800AD74
	.align 2, 0
_0800AD1C: .4byte 0x040000D4
_0800AD20: .4byte 0x050003F2
_0800AD24: .4byte 0x80000003
_0800AD28: .4byte 0x050003F8
_0800AD2C: .4byte gUnknown_03005660
_0800AD30: .4byte IWRAM_START + 0x1F2
_0800AD34: .4byte IWRAM_START + 0x1F8
_0800AD38:
	ldr r2, _0800AD90 @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD94 @ =0x050003F8
	str r0, [r2, #4]
	ldr r3, _0800AD98 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD9C @ =0x050003F2
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800ADA0 @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800ADA4 @ =IWRAM_START + 0x1F8
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800ADA8 @ =IWRAM_START + 0x1F2
_0800AD74:
	adds r1, r1, r0
	str r1, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
_0800AD7C:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_80051E8
_0800AD8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD90: .4byte 0x040000D4
_0800AD94: .4byte 0x050003F8
_0800AD98: .4byte 0x80000003
_0800AD9C: .4byte 0x050003F2
_0800ADA0: .4byte gUnknown_03005660
_0800ADA4: .4byte IWRAM_START + 0x1F8
_0800ADA8: .4byte IWRAM_START + 0x1F2

	thumb_func_start sub_800ADAC
sub_800ADAC: @ 0x0800ADAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800AE24 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r4, #0
	ldr r0, _0800AE28 @ =gSongTable + (142 * 8) + 4
	ldrh r6, [r0]
	movs r5, #0
	ldr r7, _0800AE2C @ =gMPlayTable
_0800ADCA:
	cmp r4, r6
	beq _0800ADD6
	adds r0, r5, r7
	ldr r0, [r0]
	bl MPlayStop
_0800ADD6:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	bls _0800ADCA
	movs r0, #0x8e
	bl m4aSongNumStart
	ldr r2, _0800AE30 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0800AE34 @ =0x040000D4
	ldr r2, _0800AE38 @ =gObjPalette + 0x1F2
	str r2, [r0]
	mov r1, r8
	adds r1, #0x64
	str r1, [r0, #4]
	ldr r3, _0800AE3C @ =0x80000003
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #6
	str r2, [r0]
	mov r1, r8
	adds r1, #0x6a
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0800AE24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800AE40 @ =sub_800AB08
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AE24: .4byte gCurTask
_0800AE28: .4byte gSongTable + (142 * 8) + 4
_0800AE2C: .4byte gMPlayTable
_0800AE30: .4byte gFlags
_0800AE34: .4byte 0x040000D4
_0800AE38: .4byte gObjPalette + 0x1F2
_0800AE3C: .4byte 0x80000003
_0800AE40: .4byte sub_800AB08

	thumb_func_start sub_800AE44
sub_800AE44: @ 0x0800AE44
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800AE58
sub_800AE58: @ 0x0800AE58
	ldr r1, _0800AE80 @ =0x040000D4
	ldr r0, _0800AE84 @ =gUnknown_086EA408
	str r0, [r1]
	ldr r0, _0800AE88 @ =0x06017EC0
	str r0, [r1, #4]
	ldr r0, _0800AE8C @ =0x800000A0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800AE90 @ =gObjPalette
	ldr r0, _0800AE94 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800AE98 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0800AE9C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800AE80: .4byte 0x040000D4
_0800AE84: .4byte (Tileset_Stage_LeafForest_Act1+(32 * TILE_SIZE_4BPP))
_0800AE88: .4byte 0x06017EC0
_0800AE8C: .4byte 0x800000A0
_0800AE90: .4byte gObjPalette
_0800AE94: .4byte 0x00007FFF
_0800AE98: .4byte gFlags
_0800AE9C: .4byte 0xFFFFFBFF

	thumb_func_start sub_800AEA0
sub_800AEA0: @ 0x0800AEA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0800AF54 @ =gUnknown_0300540C
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0800AFB2
	ldr r0, _0800AF58 @ =sub_800AFD0
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r4, #0
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0800AF5C @ =IWRAM_START + 0x31
	adds r0, r3, r2
	strb r4, [r0]
	movs r5, #0
	strh r6, [r1, #0x16]
	strh r7, [r1, #0x18]
	ldr r0, _0800AF60 @ =0x06012100
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	subs r0, #0xe9
	strh r0, [r1, #0xa]
	subs r2, #0x11
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0800AF64 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0800AF68 @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0800AF6C @ =IWRAM_START + 0x25
	adds r0, r3, r2
	strb r5, [r0]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _0800AF70 @ =gRingCount
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r1, _0800AF74 @ =IWRAM_START + 0x30
	adds r3, r3, r1
	strb r0, [r3]
	cmp r0, #0
	beq _0800AF84
	ldr r4, _0800AF78 @ =gMPlayInfo_SE2
	ldr r1, _0800AF7C @ =se_ring_copy
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0800AF80 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	b _0800AFAA
	.align 2, 0
_0800AF54: .4byte gUnknown_0300540C
_0800AF58: .4byte sub_800AFD0
_0800AF5C: .4byte IWRAM_START + 0x31
_0800AF60: .4byte 0x06012100
_0800AF64: .4byte IWRAM_START + 0x21
_0800AF68: .4byte IWRAM_START + 0x22
_0800AF6C: .4byte IWRAM_START + 0x25
_0800AF70: .4byte gRingCount
_0800AF74: .4byte IWRAM_START + 0x30
_0800AF78: .4byte gMPlayInfo_SE2
_0800AF7C: .4byte se_ring_copy
_0800AF80: .4byte 0x0000FFFF
_0800AF84:
	ldr r4, _0800AFC0 @ =gMPlayInfo_SE1
	ldr r1, _0800AFC4 @ =se_ring_copy
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0800AFC8 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl m4aMPlayPanpotControl
_0800AFAA:
	ldr r1, _0800AFCC @ =gUnknown_0300540C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0800AFB2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AFC0: .4byte gMPlayInfo_SE1
_0800AFC4: .4byte se_ring_copy
_0800AFC8: .4byte 0x0000FFFF
_0800AFCC: .4byte gUnknown_0300540C

	thumb_func_start sub_800AFD0
sub_800AFD0: @ 0x0800AFD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800B030 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	ldrh r0, [r4, #0x16]
	adds r6, r0, #0
	ldrh r7, [r4, #0x18]
	ldr r1, _0800B034 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800B01C
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _0800B038 @ =gUnknown_0300540C
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	bl TaskDestroy
_0800B01C:
	adds r0, r5, #0
	bl sub_80051E8
	strh r6, [r5, #0x16]
	strh r7, [r5, #0x18]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B030: .4byte gCurTask
_0800B034: .4byte gCamera
_0800B038: .4byte gUnknown_0300540C

	thumb_func_start sub_800B03C
sub_800B03C: @ 0x0800B03C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _0800B17C @ =gGameMode
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0800B076
	ldrb r0, [r6, #2]
	cmp r0, #0
	beq _0800B164
	cmp r0, #5
	bne _0800B076
	movs r0, #7
	strb r0, [r6, #2]
_0800B076:
	ldr r0, _0800B180 @ =sub_800B704
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0800B184 @ =sub_800B80C
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldrb r1, [r6, #2]
	ldr r2, _0800B188 @ =IWRAM_START + 0x76
	adds r0, r4, r2
	movs r2, #0
	mov sl, r2
	strb r1, [r0]
	ldr r1, _0800B18C @ =IWRAM_START + 0x74
	adds r0, r4, r1
	mov r2, sl
	strh r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	str r0, [r5, #0x6c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r1, r7, #8
	adds r0, r0, r1
	str r0, [r5, #0x70]
	strh r2, [r5, #4]
	strh r7, [r5, #6]
	str r6, [r5]
	ldrb r0, [r6]
	strb r0, [r5, #8]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r5, #9]
	ldr r1, _0800B190 @ =IWRAM_START + 0xC
	adds r7, r4, r1
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r2, sl
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _0800B194 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800B198 @ =IWRAM_START + 0x2E
	adds r0, r4, r1
	movs r2, #0x10
	strb r2, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	mov sb, r1
	str r1, [r7, #0x10]
	movs r0, #0xb5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r2, _0800B19C @ =IWRAM_START + 0x2C
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r7, #0
	bl sub_8004558
	ldr r2, _0800B1A0 @ =IWRAM_START + 0x3C
	adds r7, r4, r2
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #0x21
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0800B1A4 @ =IWRAM_START + 0x5E
	adds r0, r4, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r0, _0800B1A8 @ =IWRAM_START + 0x61
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	mov r2, r8
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_800B580
_0800B164:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B17C: .4byte gGameMode
_0800B180: .4byte sub_800B704
_0800B184: .4byte sub_800B80C
_0800B188: .4byte IWRAM_START + 0x76
_0800B18C: .4byte IWRAM_START + 0x74
_0800B190: .4byte IWRAM_START + 0xC
_0800B194: .4byte IWRAM_START + 0x2D
_0800B198: .4byte IWRAM_START + 0x2E
_0800B19C: .4byte IWRAM_START + 0x2C
_0800B1A0: .4byte IWRAM_START + 0x3C
_0800B1A4: .4byte IWRAM_START + 0x5E
_0800B1A8: .4byte IWRAM_START + 0x61

	thumb_func_start sub_800B1AC
sub_800B1AC: @ 0x0800B1AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x78
	ldrb r0, [r0]
	ldr r2, _0800B228 @ =gPlayer
	cmp r0, #1
	bne _0800B1C4
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B1DE
_0800B1C4:
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0800B22C @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #7
	movs r0, #5
	strb r0, [r1]
_0800B1DE:
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x70]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r1, r4, #0
	adds r1, #0x77
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800B230 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B218
	bl sub_8019224
	movs r1, #2
	strb r1, [r0]
	ldrh r1, [r4, #4]
	strb r1, [r0, #1]
	ldrh r1, [r4, #6]
	strb r1, [r0, #2]
	ldrb r1, [r4, #9]
	strb r1, [r0, #3]
_0800B218:
	ldr r0, _0800B234 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B238 @ =sub_800B780
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B228: .4byte gPlayer
_0800B22C: .4byte 0x0000FFFF
_0800B230: .4byte gGameMode
_0800B234: .4byte gCurTask
_0800B238: .4byte sub_800B780

	thumb_func_start sub_800B23C
sub_800B23C: @ 0x0800B23C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x76
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _0800B252
	b _0800B558
_0800B252:
	lsls r0, r0, #2
	ldr r1, _0800B25C @ =_0800B260
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B25C: .4byte _0800B260
_0800B260: @ jump table
	.4byte _0800B294 @ case 0
	.4byte _0800B2B4 @ case 1
	.4byte _0800B2F0 @ case 2
	.4byte _0800B32C @ case 3
	.4byte _0800B37C @ case 4
	.4byte _0800B3BC @ case 5
	.4byte _0800B3F4 @ case 6
	.4byte _0800B400 @ case 7
	.4byte _0800B478 @ case 8
	.4byte _0800B510 @ case 9
	.4byte _0800B51E @ case 10
	.4byte _0800B532 @ case 11
	.4byte _0800B546 @ case 12
_0800B294:
	ldr r1, _0800B2AC @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800B2A0
	movs r0, #0xff
_0800B2A0:
	strb r0, [r1]
	ldr r1, _0800B2B0 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0800B558
	.align 2, 0
_0800B2AC: .4byte gNumLives
_0800B2B0: .4byte gUnknown_030054A8
_0800B2B4:
	ldr r3, _0800B2EC @ =gPlayer
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800B2C6
	b _0800B558
_0800B2C6:
	movs r0, #0xf7
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B2DA
	b _0800B558
_0800B2DA:
	adds r0, r3, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A7A8
	b _0800B558
	.align 2, 0
_0800B2EC: .4byte gPlayer
_0800B2F0:
	ldr r3, _0800B328 @ =gPlayer
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800B302
	b _0800B558
_0800B302:
	movs r0, #0xfe
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B316
	b _0800B558
_0800B316:
	adds r0, r3, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A8F8
	b _0800B558
	.align 2, 0
_0800B328: .4byte gPlayer
_0800B32C:
	ldr r2, _0800B370 @ =gPlayer
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r2, #0x2e]
	ldr r0, _0800B374 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B34C
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B34C
	b _0800B558
_0800B34C:
	adds r3, r2, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r0, #2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A854
	ldr r1, _0800B378 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #2]
	b _0800B558
	.align 2, 0
_0800B370: .4byte gPlayer
_0800B374: .4byte gGameMode
_0800B378: .4byte gUnknown_030054A8
_0800B37C:
	ldr r2, _0800B3B0 @ =gPlayer
	adds r4, r2, #0
	adds r4, #0x37
	ldrb r1, [r4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r2, #0x30]
	ldr r0, _0800B3B4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #2
	bl m4aMPlayTempoControl
	ldr r0, _0800B3B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0800B3A4
	b _0800B558
_0800B3A4:
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4]
	b _0800B558
	.align 2, 0
_0800B3B0: .4byte gPlayer
_0800B3B4: .4byte gMPlayInfo_BGM
_0800B3B8: .4byte gGameMode
_0800B3BC:
	ldr r4, _0800B3E0 @ =gUnknown_080D51FC
	ldr r2, _0800B3E4 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0800B3E8 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0800B3EC @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #5
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0800B3F0 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, r0
	b _0800B408
	.align 2, 0
_0800B3E0: .4byte gUnknown_080D51FC
_0800B3E4: .4byte gPseudoRandom
_0800B3E8: .4byte 0x00196225
_0800B3EC: .4byte 0x3C6EF35F
_0800B3F0: .4byte gRingCount
_0800B3F4:
	ldr r1, _0800B3FC @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, #5
	b _0800B408
	.align 2, 0
_0800B3FC: .4byte gRingCount
_0800B400:
	ldr r1, _0800B464 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, #0
	adds r0, #0xa
_0800B408:
	strh r0, [r1]
	ldr r0, _0800B468 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0800B448
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800B448
	ldr r0, _0800B46C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800B448
	ldr r1, _0800B470 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800B440
	movs r0, #0xff
_0800B440:
	strb r0, [r1]
	ldr r1, _0800B474 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800B448:
	ldr r0, _0800B46C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800B45C
	ldr r1, _0800B464 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800B45C
	movs r0, #0xff
	strh r0, [r1]
_0800B45C:
	movs r0, #0x75
	bl m4aSongNumStart
	b _0800B558
	.align 2, 0
_0800B464: .4byte gRingCount
_0800B468: .4byte gCurrentLevel
_0800B46C: .4byte gGameMode
_0800B470: .4byte gNumLives
_0800B474: .4byte gUnknown_030054A8
_0800B478:
	movs r6, #1
	rsbs r6, r6, #0
	movs r3, #0
	mov sl, r3
	movs r4, #0
	ldr r1, _0800B500 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	mov r8, r1
	cmp r0, #0
	beq _0800B4E8
	mov ip, r1
	ldr r5, _0800B504 @ =gPlayer
_0800B490:
	ldr r0, _0800B508 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0800B4D4
	lsls r0, r4, #2
	add r0, ip
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _0800B50C @ =IWRAM_START + 0x50
	adds r1, r2, r7
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	adds r3, r0, #0
	muls r3, r0, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r7, #2
	adds r2, r2, r7
	movs r7, #0
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r3, r3, r0
	cmp r6, r3
	bge _0800B4D4
	adds r6, r3, #0
	mov sl, r4
_0800B4D4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0800B4E8
	lsls r0, r4, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _0800B490
_0800B4E8:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	mov r3, sl
	strb r3, [r0, #2]
	movs r0, #0xda
	bl m4aSongNumStart
	b _0800B558
	.align 2, 0
_0800B500: .4byte gMultiplayerPlayerTasks
_0800B504: .4byte gPlayer
_0800B508: .4byte 0x04000128
_0800B50C: .4byte IWRAM_START + 0x50
_0800B510:
	bl sub_8019224
	movs r2, #0
	movs r1, #6
	strb r1, [r0]
	strb r2, [r0, #1]
	b _0800B52A
_0800B51E:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #2
	strb r1, [r0, #1]
_0800B52A:
	movs r0, #0xd9
	bl m4aSongNumStart
	b _0800B558
_0800B532:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #3
	strb r1, [r0, #1]
	movs r0, #0xdb
	bl m4aSongNumStart
	b _0800B558
_0800B546:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	movs r0, #0xd8
	bl m4aSongNumStart
_0800B558:
	mov r1, sb
	adds r1, #0x77
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800B578 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B57C @ =sub_800B7D0
	str r0, [r1, #8]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B578: .4byte gCurTask
_0800B57C: .4byte sub_800B7D0

	thumb_func_start sub_800B580
sub_800B580: @ 0x0800B580
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _0800B59C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bls _0800B590
	b _0800B6FA
_0800B590:
	lsls r0, r0, #2
	ldr r1, _0800B5A0 @ =_0800B5A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B59C: .4byte gGameMode
_0800B5A0: .4byte _0800B5A4
_0800B5A4: @ jump table
	.4byte _0800B5BC @ case 0
	.4byte _0800B5BC @ case 1
	.4byte _0800B5BC @ case 2
	.4byte _0800B62C @ case 3
	.4byte _0800B62C @ case 4
	.4byte _0800B6C4 @ case 5
_0800B5BC:
	cmp r2, #0
	bne _0800B5C2
	b _0800B6FA
_0800B5C2:
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r0, [r3]
	cmp r0, #0
	bne _0800B5F4
	ldr r2, _0800B5EC @ =ItemBox_1UpIcons
	ldr r3, _0800B5F0 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	movs r1, #0
	ldrsb r1, [r3, r1]
	b _0800B60A
	.align 2, 0
_0800B5EC: .4byte ItemBox_1UpIcons
_0800B5F0: .4byte gSelectedCharacter
_0800B5F4:
	ldr r2, _0800B628 @ =gUnknown_080D5178
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
_0800B60A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B628: .4byte gUnknown_080D5178
_0800B62C:
	ldr r3, _0800B6AC @ =gUnknown_03005590
	cmp r2, #0
	bne _0800B63C
	ldr r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0800B6FA
_0800B63C:
	ldr r0, _0800B6B0 @ =gUnknown_080D51E4
	ldr r1, [r3]
	lsrs r1, r1, #5
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0xd
	bne _0800B680
	ldr r5, _0800B6B4 @ =gUnknown_080D51F4
	ldr r0, _0800B6B8 @ =gMultiplayerPseudoRandom
	ldr r2, [r0]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _0800B6BC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #6
	bne _0800B680
	cmp r1, #8
	bne _0800B680
	lsrs r0, r2, #2
	movs r1, #3
	bl __umodsi3
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
_0800B680:
	adds r0, r4, #0
	adds r0, #0x76
	strb r1, [r0]
	ldr r2, _0800B6C0 @ =gUnknown_080D5178
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r3, r4, #0
	adds r3, #0x46
	strh r1, [r3]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B6AC: .4byte gUnknown_03005590
_0800B6B0: .4byte gUnknown_080D51E4
_0800B6B4: .4byte gUnknown_080D51F4
_0800B6B8: .4byte gMultiplayerPseudoRandom
_0800B6BC: .4byte gCurrentLevel
_0800B6C0: .4byte gUnknown_080D5178
_0800B6C4:
	cmp r2, #0
	beq _0800B6FA
	ldr r2, _0800B700 @ =gUnknown_080D5178
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
_0800B6FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B700: .4byte gUnknown_080D5178

	thumb_func_start sub_800B704
sub_800B704: @ 0x0800B704
	push {r4, lr}
	ldr r0, _0800B730 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0800B734 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B738
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B738
	adds r0, r4, #0
	bl sub_800B828
	b _0800B778
	.align 2, 0
_0800B730: .4byte gCurTask
_0800B734: .4byte gGameMode
_0800B738:
	adds r0, r4, #0
	bl sub_800B8F4
	cmp r0, #0
	beq _0800B74A
	adds r0, r4, #0
	bl sub_800B1AC
	b _0800B752
_0800B74A:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B580
_0800B752:
	adds r0, r4, #0
	bl sub_800B8AC
	cmp r0, #0
	beq _0800B770
	ldr r1, [r4]
	ldrb r0, [r4, #8]
	strb r0, [r1]
	ldr r0, _0800B76C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800B778
	.align 2, 0
_0800B76C: .4byte gCurTask
_0800B770:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B860
_0800B778:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B780
sub_800B780: @ 0x0800B780
	push {r4, lr}
	ldr r0, _0800B7A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B7AC
	adds r0, r4, #0
	bl sub_800B23C
	b _0800B7BA
	.align 2, 0
_0800B7A8: .4byte gCurTask
_0800B7AC:
	ldr r2, _0800B7C8 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B7CC @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B7BA:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7C8: .4byte IWRAM_START + 0x74
_0800B7CC: .4byte 0xFFFFFF00

	thumb_func_start sub_800B7D0
sub_800B7D0: @ 0x0800B7D0
	push {r4, lr}
	ldr r4, _0800B7F8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x77
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0800B7FC
	ldr r0, [r4]
	bl TaskDestroy
	b _0800B804
	.align 2, 0
_0800B7F8: .4byte gCurTask
_0800B7FC:
	adds r0, r3, #0
	movs r1, #1
	bl sub_800B860
_0800B804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B80C
sub_800B80C: @ 0x0800B80C
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_800B828
sub_800B828: @ 0x0800B828
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x70]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r4, #0x77
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800B858 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B85C @ =sub_800B950
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B858: .4byte gCurTask
_0800B85C: .4byte sub_800B950

	thumb_func_start sub_800B860
sub_800B860: @ 0x0800B860
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x6c]
	ldr r2, _0800B8A8 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x70]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x22
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _0800B89A
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_0800B89A:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8A8: .4byte gCamera

	thumb_func_start sub_800B8AC
sub_800B8AC: @ 0x0800B8AC
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0800B8E8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0800B8E4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0800B8E4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800B8EC
_0800B8E4:
	movs r0, #1
	b _0800B8EE
	.align 2, 0
_0800B8E8: .4byte gCamera
_0800B8EC:
	movs r0, #0
_0800B8EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B8F4
sub_800B8F4: @ 0x0800B8F4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _0800B924 @ =gPlayer
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800B93C
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	adds r0, r6, #0
	bl sub_800C944
	adds r5, r0, #0
	cmp r5, #0
	beq _0800B928
	adds r1, r4, #0
	adds r1, #0x78
	movs r0, #1
	strb r0, [r1]
	b _0800B948
	.align 2, 0
_0800B924: .4byte gPlayer
_0800B928:
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	bne _0800B940
_0800B93C:
	movs r0, #0
	b _0800B948
_0800B940:
	adds r0, r4, #0
	adds r0, #0x78
	strb r5, [r0]
	movs r0, #1
_0800B948:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800B950
sub_800B950: @ 0x0800B950
	push {r4, lr}
	ldr r0, _0800B978 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B97C
	adds r0, r4, #0
	bl sub_800B9A0
	b _0800B98A
	.align 2, 0
_0800B978: .4byte gCurTask
_0800B97C:
	ldr r2, _0800B998 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B99C @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B98A:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B998: .4byte IWRAM_START + 0x74
_0800B99C: .4byte 0xFFFFFF00

	thumb_func_start sub_800B9A0
sub_800B9A0: @ 0x0800B9A0
	adds r0, #0x77
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800B9B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B9B4 @ =sub_800B7D0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0800B9B0: .4byte gCurTask
_0800B9B4: .4byte sub_800B7D0

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BA3C @ =sub_800BA58
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BA40 @ =0x06011000
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	ldr r0, _0800BA44 @ =0x000001DD
	strh r0, [r1, #0xa]
	ldr r3, _0800BA48 @ =IWRAM_START + 0x20
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BA4C @ =IWRAM_START + 0x21
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0800BA50 @ =IWRAM_START + 0x22
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0800BA54 @ =IWRAM_START + 0x25
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sub_800BA58
_0800BA40: .4byte 0x06011000
_0800BA44: .4byte 0x000001DD
_0800BA48: .4byte IWRAM_START + 0x20
_0800BA4C: .4byte IWRAM_START + 0x21
_0800BA50: .4byte IWRAM_START + 0x22
_0800BA54: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BA58
sub_800BA58: @ 0x0800BA58
	push {r4, r5, r6, r7, lr}
	ldr r7, _0800BAA4 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0800BAA8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800BA92
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r7]
	bl TaskDestroy
_0800BA92:
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAA4: .4byte gCurTask
_0800BAA8: .4byte gCamera

	thumb_func_start sub_800BAAC
sub_800BAAC: @ 0x0800BAAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BB2C @ =sub_800BB44
	movs r2, #0x80
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r0, #0
	mov r8, r0
	strh r6, [r1, #0x30]
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BB30 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	subs r0, #0xea
	strh r0, [r1, #0xa]
	ldr r2, _0800BB34 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BB38 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0800BB3C @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0800BB40 @ =IWRAM_START + 0x25
	adds r3, r3, r2
	mov r0, r8
	strb r0, [r3]
	movs r0, #0xc2
	lsls r0, r0, #0xc
	str r0, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB2C: .4byte sub_800BB44
_0800BB30: .4byte 0x06011F00
_0800BB34: .4byte IWRAM_START + 0x20
_0800BB38: .4byte IWRAM_START + 0x21
_0800BB3C: .4byte IWRAM_START + 0x22
_0800BB40: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BB44
sub_800BB44: @ 0x0800BB44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _0800BCB8 @ =gPlayer
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrh r0, [r5, #0x16]
	subs r1, r1, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldrh r2, [r5, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldrh r1, [r5, #0x30]
	adds r1, #0x40
	strh r1, [r5, #0x30]
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	ldr r3, _0800BCBC @ =gSineTable
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r0, r6
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	muls r1, r2, r1
	asrs r1, r1, #0x16
	ldrh r2, [r5, #0x16]
	adds r1, r1, r2
	strh r1, [r5, #0x16]
	movs r6, #0x30
	ldrsh r1, [r5, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #0x16
	ldrh r3, [r5, #0x18]
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldrh r6, [r5, #0x18]
	mov r8, r6
	ldrh r0, [r5, #0x16]
	mov sl, r0
	movs r1, #0x16
	ldrsh r3, [r5, r1]
	adds r2, r3, #0
	subs r2, #8
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	adds r0, r6, #0
	adds r0, #0x38
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r2, r1
	bgt _0800BBE6
	adds r0, r3, #0
	adds r0, #8
	cmp r0, r1
	bge _0800BBF8
	cmp r2, r1
	blt _0800BCD8
_0800BBE6:
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800BCD8
_0800BBF8:
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r7, r2, #0x10
	adds r4, r7, #0
	subs r4, #0x10
	ldr r1, _0800BCB8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	mov ip, r6
	mov r3, ip
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	mov sb, r2
	cmp r4, r3
	bgt _0800BC24
	cmp r7, r3
	bge _0800BC36
	cmp r4, r3
	blt _0800BCD8
_0800BC24:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r4
	blt _0800BCD8
_0800BC36:
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800BCA8
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, #1
	strh r0, [r1]
	ldr r0, _0800BCC8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0800BC86
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800BC86
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800BC86
	ldr r1, _0800BCD0 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800BC7E
	movs r0, #0xff
_0800BC7E:
	strb r0, [r1]
	ldr r1, _0800BCD4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800BC86:
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800BC9A
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800BC9A
	movs r0, #0xff
	strh r0, [r1]
_0800BC9A:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	bl sub_800AEA0
_0800BCA8:
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800BCFE
	.align 2, 0
_0800BCB4: .4byte gCurTask
_0800BCB8: .4byte gPlayer
_0800BCBC: .4byte gSineTable
_0800BCC0: .4byte gUnknown_03005AF0
_0800BCC4: .4byte gRingCount
_0800BCC8: .4byte gCurrentLevel
_0800BCCC: .4byte gGameMode
_0800BCD0: .4byte gNumLives
_0800BCD4: .4byte gUnknown_030054A8
_0800BCD8:
	ldr r2, _0800BD0C @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r5, #0x18]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	mov r3, sl
	strh r3, [r5, #0x16]
	mov r6, r8
	strh r6, [r5, #0x18]
_0800BCFE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD0C: .4byte gCamera

	thumb_func_start sub_800BD10
sub_800BD10: @ 0x0800BD10
	push {r4, r5, r6, lr}
	ldr r0, _0800BD54 @ =gMPlayTable
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r0, _0800BD58 @ =gUnknown_030054A8
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _0800BD24
	b _0800BEEA
_0800BD24:
	ldr r1, _0800BD5C @ =gPlayer
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	adds r6, r1, #0
	cmp r4, #0
	beq _0800BD34
	b _0800BEEA
_0800BD34:
	ldrb r1, [r5, #1]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	bne _0800BD64
	ldr r0, _0800BD60 @ =gMPlayInfo_BGM
	bl MPlayStop
	movs r0, #0xff
	strb r0, [r5]
	ldrb r1, [r5, #1]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5, #1]
	b _0800BEEA
	.align 2, 0
_0800BD54: .4byte gMPlayTable
_0800BD58: .4byte gUnknown_030054A8
_0800BD5C: .4byte gPlayer
_0800BD60: .4byte gMPlayInfo_BGM
_0800BD64:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _0800BD7A
	bl sub_800BF74
	movs r0, #0xff
	strb r0, [r5]
	strh r4, [r5, #6]
	movs r0, #1
	strb r0, [r5, #5]
	b _0800BEEA
_0800BD7A:
	ldr r0, _0800BDA8 @ =gSongTable
	adds r1, r0, #0
	adds r1, #0xf8
	ldr r1, [r1]
	adds r4, r0, #0
	cmp r3, r1
	bne _0800BDB0
	ldr r0, _0800BDAC @ =gMPlayInfo_BGM
	ldr r2, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDB0
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r2
	cmp r1, #0
	bne _0800BDB0
	movs r0, #1
	strb r0, [r5, #5]
	strb r1, [r5, #2]
	strb r1, [r5, #3]
	b _0800BEEA
	.align 2, 0
_0800BDA8: .4byte gSongTable
_0800BDAC: .4byte gMPlayInfo_BGM
_0800BDB0:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0800BDC6
	movs r0, #0
	strb r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1f
	bl m4aSongNumStart
	b _0800BEEA
_0800BDC6:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	bne _0800BDFC
	ldr r0, _0800BDF8 @ =gMPlayInfo_BGM
	ldr r1, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDFC
	cmp r1, #0
	blt _0800BDFC
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BDFC
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStop
	b _0800BEEA
	.align 2, 0
_0800BDF8: .4byte gMPlayInfo_BGM
_0800BDFC:
	ldr r1, _0800BE30 @ =0x00000CB8
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BE34
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0800BE3C
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	b _0800BEB0
	.align 2, 0
_0800BE30: .4byte 0x00000CB8
_0800BE34:
	adds r2, r5, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800BE4C
_0800BE3C:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStart
	b _0800BEEA
_0800BE4C:
	ldrb r6, [r2, #3]
	cmp r6, #0
	beq _0800BE64
	strb r0, [r2, #3]
	movs r0, #1
	strb r0, [r2, #5]
	ldr r0, _0800BE60 @ =0x00000197
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE60: .4byte 0x00000197
_0800BE64:
	ldrb r3, [r2, #1]
	movs r1, #0xf0
	ands r1, r3
	cmp r1, #0x10
	bne _0800BE94
	movs r1, #0xf
	ands r1, r3
	strb r1, [r2, #1]
	ldr r2, _0800BE8C @ =gLevelSongs
	ldr r0, _0800BE90 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE8C: .4byte gLevelSongs
_0800BE90: .4byte gCurrentLevel
_0800BE94:
	ldr r0, _0800BEBC @ =gMPlayInfo_BGM
	ldr r4, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BEA2
	cmp r4, #0
	bge _0800BEEA
_0800BEA2:
	cmp r1, #0x20
	bne _0800BEC4
	ldr r0, _0800BEC0 @ =gUnknown_080D5254
	ldrb r1, [r2, #1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0800BEB0:
	bl m4aSongNumStart
	bl sub_800BF30
	b _0800BEEA
	.align 2, 0
_0800BEBC: .4byte gMPlayInfo_BGM
_0800BEC0: .4byte gUnknown_080D5254
_0800BEC4:
	ldr r2, _0800BEF0 @ =gLevelSongs
	ldr r0, _0800BEF4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xf
	ands r1, r3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0800BEEA
	strb r6, [r5, #5]
	bl sub_800BF30
_0800BEEA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BEF0: .4byte gLevelSongs
_0800BEF4: .4byte gCurrentLevel

	thumb_func_start sub_800BEF8
sub_800BEF8: @ 0x0800BEF8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800BF28 @ =sub_800BD10
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r0, _0800BF2C @ =gUnknown_030054A8
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strh r4, [r0, #6]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF28: .4byte sub_800BD10
_0800BF2C: .4byte gUnknown_030054A8

	thumb_func_start sub_800BF30
sub_800BF30: @ 0x0800BF30
	push {r4, lr}
	ldr r4, _0800BF6C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #4
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	movs r1, #4
	bl m4aMPlayFadeIn
	ldr r0, _0800BF70 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF64
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF6C: .4byte gMPlayInfo_BGM
_0800BF70: .4byte gPlayer

	thumb_func_start sub_800BF74
sub_800BF74: @ 0x0800BF74
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r4, _0800BFA4 @ =gMPlayInfo_BGM
	lsrs r1, r1, #0x14
	adds r0, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0800BFA8 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF9C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFA4: .4byte gMPlayInfo_BGM
_0800BFA8: .4byte gPlayer

	thumb_func_start sub_800BFAC
sub_800BFAC: @ 0x0800BFAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	movs r7, #0
	ldr r1, [r0, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BFD2
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BFD6
_0800BFD2:
	movs r0, #0
	b _0800C054
_0800BFD6:
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r4, #0
	ldrsb r4, [r6, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C004
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C010
	cmp r2, r1
	blt _0800C052
_0800C004:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C052
_0800C010:
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r4, #1
	ldrsb r4, [r6, r4]
	adds r3, r0, r4
	cmp r2, r3
	bgt _0800C040
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C04C
	cmp r2, r3
	blt _0800C052
_0800C040:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C052
_0800C04C:
	movs r0, #0x80
	lsls r0, r0, #0xc
	orrs r7, r0
_0800C052:
	adds r0, r7, #0
_0800C054:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

    @ Returns flags/a bitarray
    @ Maybe collision-hit test?
	thumb_func_start sub_800C060
sub_800C060: @ 0x0800C060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0
	mov sl, r0
	mov ip, r0
	ldr r1, [r6, #0x28]
	subs r0, #1
	cmp r1, r0
	beq _0800C0AE
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C0B2
_0800C0AE:
	movs r0, #0
	b _0800C1F2
_0800C0B2:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800C0CC
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800C0CC
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r1, #1
	mov ip, r1
_0800C0CC:
	adds r0, r6, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, r3, r7
	lsls r2, r0, #8
	mov r0, sp
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r1, r0, r1
	cmp r2, r1
	bgt _0800C100
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	lsls r0, r0, #8
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C112
	cmp r2, r1
	blt _0800C1D4
_0800C100:
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C1D4
_0800C112:
	adds r2, r6, #0
	adds r2, #0x2d
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r1, r8
	adds r0, r4, r1
	lsls r3, r0, #8
	mov r0, sp
	movs r7, #1
	ldrsb r7, [r0, r7]
	lsls r1, r7, #8
	ldr r0, [r5, #0xc]
	adds r1, r0, r1
	mov sb, r2
	cmp r3, r1
	bgt _0800C14A
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C15C
	cmp r3, r1
	blt _0800C1D4
_0800C14A:
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C1D4
_0800C15C:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0800C1D4
	mov r2, sp
	ldrb r1, [r5, #0x17]
	rsbs r0, r1, #0
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #3]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	mov r1, ip
	cmp r1, #0
	bne _0800C18A
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
_0800C18A:
	str r6, [r5, #0x3c]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, _0800C1B4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C1B8
	adds r0, r6, #0
	adds r0, #0x2f
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	b _0800C1CA
	.align 2, 0
_0800C1B4: .4byte gUnknown_03005424
_0800C1B8:
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
_0800C1CA:
	lsls r1, r1, #8
	ldrb r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800C1F0
_0800C1D4:
	mov r1, ip
	cmp r1, #0
	beq _0800C1F0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C1F0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800C1F0:
	mov r0, sl
_0800C1F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C204
sub_800C204: @ 0x0800C204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	str r2, [sp]
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x2c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, ip
	adds r0, #0x90
	ldr r6, [r0]
	adds r1, r6, #0
	adds r1, #0xc
	str r1, [sp, #4]
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C30C
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r0
	cmp r1, r2
	beq _0800C30C
	lsls r0, r5, #0x10
	asrs r5, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r5
	ldr r1, [r1]
	mov r8, r0
	cmp r1, r2
	beq _0800C30C
	adds r3, r7, r4
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r6, sl
	adds r2, r6, r4
	mov r0, ip
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [sp, #4]
	adds r5, r6, r5
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C2B2
	cmp r2, r1
	blt _0800C30C
_0800C2A0:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C2B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r5, [sp]
	adds r2, r5, r4
	mov r6, ip
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r5, r8
	asrs r0, r5, #0xd
	ldr r6, [sp, #4]
	adds r5, r6, r0
	adds r0, r5, #0
	adds r0, #0x2d
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2F6
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C308
	cmp r2, r1
	blt _0800C30C
_0800C2F6:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C308:
	movs r0, #1
	b _0800C30E
_0800C30C:
	movs r0, #0
_0800C30E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C320
sub_800C320: @ 0x0800C320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C406
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800C406
	ldr r0, [r7, #0x30]
	cmp r0, r3
	beq _0800C406
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3B2
	cmp r2, r1
	blt _0800C406
_0800C3A0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x35
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3EA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3FC
	cmp r2, r1
	blt _0800C406
_0800C3EA:
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3FC:
	mov r0, r8
	bl sub_800CB18
	movs r0, #1
	b _0800C408
_0800C406:
	movs r0, #0
_0800C408:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C418
sub_800C418: @ 0x0800C418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C4F0
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r5, #1
	rsbs r5, r5, #0
	mov ip, r0
	cmp r1, r5
	beq _0800C4F0
	ldr r0, _0800C4EC @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0800C4F0
	adds r3, r0, #0
	ldr r0, [r3, #0x4c]
	cmp r0, r5
	beq _0800C4F0
	adds r4, r7, r4
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r6, r5
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C48E
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4A0
	cmp r2, r1
	blt _0800C4F0
_0800C48E:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4A0:
	mov r1, ip
	asrs r0, r1, #0xd
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, r8
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C4D6
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4E8
	cmp r2, r1
	blt _0800C4F0
_0800C4D6:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4E8:
	movs r0, #1
	b _0800C4F2
	.align 2, 0
_0800C4EC: .4byte gUnknown_030056A4
_0800C4F0:
	movs r0, #0
_0800C4F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C4FC
sub_800C4FC: @ 0x0800C4FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _0800C58C @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	lsls r1, r3, #3
	mov r0, sb
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C532
	b _0800C838
_0800C532:
	ldr r0, _0800C590 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r0, _0800C58C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r0, #0x80
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0800C550
	b _0800C838
_0800C550:
	ldr r0, _0800C594 @ =gGameMode
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bls _0800C598
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C598
	mov r2, sl
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C58C: .4byte gPlayer
_0800C590: .4byte gCurTask
_0800C594: .4byte gGameMode
_0800C598:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	beq _0800C5A4
	b _0800C73A
_0800C5A4:
	ldr r1, [r6, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C674
	ldr r1, [sp, #4]
	lsls r2, r1, #3
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r1, sl
	adds r3, r1, r5
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C5EC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C5FE
	cmp r3, r1
	blt _0800C674
_0800C5EC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C5FE:
	add r2, sb
	adds r0, r2, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp]
	adds r3, r0, r4
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r3, r1
	bgt _0800C636
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C648
	cmp r3, r1
	blt _0800C674
_0800C636:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C648:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #2
	bls _0800C666
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C666:
	ldr r0, _0800C670 @ =gPlayer
	bl sub_800CB18
	b _0800C802
	.align 2, 0
_0800C670: .4byte gPlayer
_0800C674:
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C73A
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, sl
	adds r3, r0, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C6BC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C6CE
	cmp r3, r1
	blt _0800C73A
_0800C6BC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C73A
_0800C6CE:
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, [sp]
	adds r2, r1, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C70A
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C71C
	cmp r2, r3
	blt _0800C73A
_0800C70A:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C73A
_0800C71C:
	ldr r0, _0800C730 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C734
	mov r2, ip
	ldrb r0, [r2]
	b _0800C7E8
	.align 2, 0
_0800C730: .4byte gPlayer
_0800C734:
	ldr r0, _0800C82C @ =gPlayer
	bl sub_800CBA4
_0800C73A:
	ldr r0, _0800C830 @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	bne _0800C744
	b _0800C838
_0800C744:
	adds r3, r0, #0
	ldr r1, [r3, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C838
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r5, r1, r2
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	mov r0, sl
	adds r4, r0, r6
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r4, r1
	bgt _0800C78C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r1
	bge _0800C79E
	cmp r4, r1
	blt _0800C838
_0800C78C:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r4
	blt _0800C838
_0800C79E:
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp]
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C7D2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C7E4
	cmp r2, r1
	blt _0800C838
_0800C7D2:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C838
_0800C7E4:
	ldr r0, _0800C834 @ =gGameMode
	ldrb r0, [r0]
_0800C7E8:
	cmp r0, #2
	bls _0800C802
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C802:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	ldr r1, [sp]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8009530
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C82C: .4byte gPlayer
_0800C830: .4byte gUnknown_030056A4
_0800C834: .4byte gGameMode
_0800C838:
	movs r0, #0
_0800C83A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C84C
sub_800C84C: @ 0x0800C84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	ldr r4, _0800C898 @ =gPlayer
	ldr r3, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	bne _0800C894
	ldr r0, [r5, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800C934
	adds r7, r4, #0
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	movs r0, #0x80
	ands r3, r0
	cmp r3, #0
	bne _0800C894
	ldr r0, [r6, #0x28]
	cmp r0, r1
	bne _0800C89C
_0800C894:
	movs r0, #0
	b _0800C936
	.align 2, 0
_0800C898: .4byte gPlayer
_0800C89C:
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r2, r0, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C8D2
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C8E4
	cmp r2, r3
	blt _0800C934
_0800C8D2:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C934
_0800C8E4:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, sb
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C918
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C92A
	cmp r2, r1
	blt _0800C934
_0800C918:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C934
_0800C92A:
	adds r0, r7, #0
	bl sub_800CBA4
	movs r0, #1
	mov sl, r0
_0800C934:
	mov r0, sl
_0800C936:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C944
sub_800C944: @ 0x0800C944
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	ldr r7, _0800CA1C @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CA0C
	ldr r0, [r6, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _0800CA0C
	ldr r0, [r5, #0x28]
	cmp r0, r1
	beq _0800CA0C
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r3, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C9B0
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C9C2
	cmp r2, r3
	blt _0800CA0C
_0800C9B0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800CA0C
_0800C9C2:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C9F6
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CA08
	cmp r2, r1
	blt _0800CA0C
_0800C9F6:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CA0C
_0800CA08:
	movs r0, #1
	mov sb, r0
_0800CA0C:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CA1C: .4byte gPlayer

	thumb_func_start sub_800CA20
sub_800CA20: @ 0x0800CA20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CB06
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800CB06
	ldr r0, [r7, #0x28]
	cmp r0, r3
	beq _0800CB06
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAA0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAB2
	cmp r2, r1
	blt _0800CB06
_0800CAA0:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAB2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x2d
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAEA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAFC
	cmp r2, r1
	blt _0800CB06
_0800CAEA:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAFC:
	mov r0, r8
	bl sub_800CBA4
	movs r0, #1
	b _0800CB08
_0800CB06:
	movs r0, #0
_0800CB08:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CB18
sub_800CB18: @ 0x0800CB18
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0800CB38
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	b _0800CB8E
_0800CB38:
	ldr r0, _0800CB74 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CB58
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CB54
	ldr r0, _0800CB78 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CB58
_0800CB54:
	cmp r1, #0x1d
	bne _0800CB80
_0800CB58:
	ldrh r1, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	rsbs r1, r1, #0
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	ldr r0, _0800CB7C @ =gCamera
	ldr r0, [r0, #0x38]
	lsls r0, r0, #8
	subs r1, r1, r0
	strh r1, [r2, #0x10]
	b _0800CB8E
	.align 2, 0
_0800CB74: .4byte gCurrentLevel
_0800CB78: .4byte gUnknown_030054B0
_0800CB7C: .4byte gCamera
_0800CB80:
	ldrh r1, [r2, #0x12]
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0800CB8E
	rsbs r0, r1, #0
	strh r0, [r2, #0x12]
_0800CB8E:
	ldr r0, _0800CBA0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0800CBA0: .4byte gPlayer

	thumb_func_start sub_800CBA4
sub_800CBA4: @ 0x0800CBA4
	push {r4, r5, lr}
	mov ip, r0
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0800CBBA
	mov r2, ip
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0800CBBE
_0800CBBA:
	movs r0, #0
	b _0800CCB0
_0800CBBE:
	movs r0, #0x78
	mov r2, ip
	strh r0, [r2, #0x2c]
	ldr r0, [r2, #0x20]
	movs r5, #0x80
	lsls r5, r5, #0x11
	ands r0, r5
	mov r4, ip
	adds r4, #0x37
	cmp r0, #0
	beq _0800CC10
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	ldr r1, _0800CC70 @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0800CC74 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ands r0, r5
	cmp r0, #0
	bne _0800CC18
_0800CC10:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_0800CC18:
	ldrb r0, [r4]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0800CCA0
	ldr r2, _0800CC78 @ =gRingCount
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800CC80
	adds r4, r0, #0
	ldr r0, _0800CC7C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800CC44
	adds r0, r4, #0
	cmp r4, #0xa
	bls _0800CC42
	movs r0, #0xa
_0800CC42:
	adds r4, r0, #0
_0800CC44:
	mov r2, ip
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldr r0, _0800CC7C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800CC66
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800CC66:
	ldr r1, _0800CC78 @ =gRingCount
	ldrh r0, [r1]
	subs r0, r0, r4
	strh r0, [r1]
	b _0800CCAE
	.align 2, 0
_0800CC70: .4byte 0xFEFFFFFF
_0800CC74: .4byte 0xFFFFCFFF
_0800CC78: .4byte gRingCount
_0800CC7C: .4byte gGameMode
_0800CC80:
	ldr r0, _0800CC9C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800CCAE
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x20]
	b _0800CCAE
	.align 2, 0
_0800CC9C: .4byte gUnknown_03005424
_0800CCA0:
	movs r0, #0x77 @ SE_LIFE_LOST
	bl m4aSongNumStart
	ldrb r1, [r4]
	movs r0, #0xf6
	ands r0, r1
	strb r0, [r4]
_0800CCAE:
	movs r0, #1
_0800CCB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

@ Returns some flags
@ u32 sub_800CCB8 (Sprite*, s32 x, s32 y, Player*);
	thumb_func_start sub_800CCB8
sub_800CCB8: @ 0x0800CCB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CD00
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CD04
_0800CD00:
	movs r0, #0
	b _0800CDA2
_0800CD04:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CD20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CD20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800CD20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	cmp r2, #0
	beq _0800CD58
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CDA0
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	cmp r4, #0
	bne _0800CDA0
	cmp r6, #0
	bne _0800CDA0
	ldrh r0, [r5, #0x10]
	b _0800CD9E
_0800CD58:
	cmp r4, #0
	beq _0800CDA0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800CDA0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
	str r2, [r5, #0x3c]
	ldr r0, _0800CDB0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CD94
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CD90
	ldr r0, _0800CDB4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CD94
_0800CD90:
	cmp r1, #0x1d
	bne _0800CDA0
_0800CD94:
	ldr r0, _0800CDB8 @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
_0800CD9E:
	strh r0, [r5, #0x14]
_0800CDA0:
	adds r0, r2, #0
_0800CDA2:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDB0: .4byte gCurrentLevel
_0800CDB4: .4byte gUnknown_030054B0
_0800CDB8: .4byte gCamera

	thumb_func_start sub_800CDBC
sub_800CDBC: @ 0x0800CDBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CE04
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CE08
_0800CE04:
	movs r0, #0
	b _0800CE7A
_0800CE08:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CE20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CE20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
_0800CE20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CE46
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	b _0800CE78
_0800CE46:
	cmp r4, #0
	beq _0800CE78
	str r0, [r5, #0x3c]
	ldr r0, _0800CE88 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CE6C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CE68
	ldr r0, _0800CE8C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CE6C
_0800CE68:
	cmp r1, #0x1d
	bne _0800CE78
_0800CE6C:
	ldr r0, _0800CE90 @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
	strh r0, [r5, #0x14]
_0800CE78:
	adds r0, r2, #0
_0800CE7A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE88: .4byte gCurrentLevel
_0800CE8C: .4byte gUnknown_030054B0
_0800CE90: .4byte gCamera

	thumb_func_start sub_800CE94
sub_800CE94: @ 0x0800CE94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	mov sl, r1
	str r2, [sp]
	adds r4, r3, #0
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	mov sb, r0
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [sp, #4]
	movs r5, #0
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r7, sl
	adds r2, r7, r3
	movs r6, #0
	ldrsb r6, [r4, r6]
	mov r0, sb
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800CEEC
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CEFA
	cmp r2, r1
	bge _0800CEEC
	b _0800D086
_0800CEEC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _0800CEFA
	b _0800D086
_0800CEFA:
	mov r1, ip
	adds r1, #0x2d
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r2, [sp]
	adds r3, r2, r6
	movs r0, #1
	ldrsb r0, [r4, r0]
	ldr r7, [sp, #4]
	adds r2, r7, r0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r3, r2
	bgt _0800CF2E
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r2
	bge _0800CF3E
	cmp r3, r2
	bge _0800CF2E
	b _0800D086
_0800CF2E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800CF3E
	b _0800D086
_0800CF3E:
	mov r0, ip
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r0, #2
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r7, r6
	asrs r2, r2, #1
	add r2, sl
	ldr r3, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov r3, ip
	adds r3, #0x2f
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [sp]
	adds r1, r1, r0
	mov ip, r1
	cmp r2, sb
	bgt _0800CF80
	mov r2, sl
	adds r0, r2, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xb
	b _0800CF90
_0800CF80:
	mov r1, sl
	adds r0, r1, r7
	movs r1, #2
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xc
_0800CF90:
	orrs r5, r0
	ldr r2, [sp, #4]
	cmp ip, r2
	ble _0800CFB8
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r7, [sp]
	adds r1, r7, r1
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r0, r2, r0
	subs r3, r1, r0
	adds r1, r3, #5
	cmp r1, #0
	ble _0800CFB2
	movs r1, #0
_0800CFB2:
	movs r0, #0x80
	lsls r0, r0, #9
	b _0800CFD4
_0800CFB8:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r1, r2, r3
	subs r3, r0, r1
	adds r1, r3, #2
	cmp r1, #0
	bge _0800CFD0
	movs r1, #0
_0800CFD0:
	movs r0, #0x80
	lsls r0, r0, #0xa
_0800CFD4:
	orrs r5, r0
	adds r2, r6, #0
	cmp r6, #0
	bge _0800CFDE
	rsbs r2, r6, #0
_0800CFDE:
	adds r0, r1, #0
	cmp r0, #0
	bge _0800CFE6
	rsbs r0, r0, #0
_0800CFE6:
	cmp r2, r0
	bge _0800CFF2
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r5, r0
	b _0800D04A
_0800CFF2:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r5
	cmp r0, #0
	beq _0800D04A
	ldr r0, _0800D01C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800D020
	mov r7, r8
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _0800D02A
_0800D018:
	movs r0, #0
	b _0800D088
	.align 2, 0
_0800D01C: .4byte gUnknown_03005424
_0800D020:
	mov r2, r8
	movs r7, #0x12
	ldrsh r0, [r2, r7]
	cmp r0, #0
	blt _0800D018
_0800D02A:
	mov r0, r8
	ldr r2, [r0, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0800D04A
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800D04A
	mov r1, r8
	strh r2, [r1, #0x14]
_0800D04A:
	lsls r0, r6, #8
	movs r2, #0xff
	lsls r2, r2, #8
	ands r0, r2
	movs r1, #0xff
	ands r3, r1
	orrs r0, r3
	orrs r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _0800D074
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _0800D078
	ldr r0, _0800D070 @ =0xFFF300FF
	b _0800D076
	.align 2, 0
_0800D070: .4byte 0xFFF300FF
_0800D074:
	ldr r0, _0800D098 @ =0xFFFF00FF
_0800D076:
	ands r5, r0
_0800D078:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r5
	cmp r0, #0
	bne _0800D086
	ldr r0, _0800D09C @ =0xFFFFFF00
	ands r5, r0
_0800D086:
	adds r0, r5, #0
_0800D088:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D098: .4byte 0xFFFF00FF
_0800D09C: .4byte 0xFFFFFF00

	thumb_func_start sub_800D0A0
sub_800D0A0: @ 0x0800D0A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x2c]
	ldr r7, _0800D1D8 @ =gPlayer
	ldrb r3, [r7, #0x16]
	adds r3, #5
	rsbs r0, r3, #0
	add r1, sp, #8
	mov sb, r1
	strb r0, [r1]
	ldrb r1, [r7, #0x17]
	movs r6, #1
	subs r2, r6, r1
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r1, #1
	adds r0, #1
	strb r1, [r0]
	add r0, sp, #4
	mov r1, sb
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r2, sp, #0xc
	mov r8, r2
	strb r0, [r2]
	ldrb r2, [r7, #0x17]
	rsbs r1, r2, #0
	mov r0, sp
	adds r0, #0xd
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	movs r2, #4
	bl memcpy
	movs r3, #0
	str r3, [sp, #0x30]
	movs r4, #0
	str r4, [sp, #0x34]
	ldr r0, _0800D1DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, _0800D1E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _0800D1E4 @ =IWRAM_START + 0x58
	adds r4, r4, r0
	ldrb r0, [r4]
	subs r6, r6, r0
	mov r0, sp
	adds r0, #0x11
	strb r6, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	mov r1, sp
	adds r1, #0x13
	strb r0, [r1]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r1, sp, #0x14
	strb r0, [r1]
	ldrb r0, [r4]
	rsbs r0, r0, #0
	mov r2, sp
	adds r2, #0x15
	strb r0, [r2]
	mov r0, sp
	adds r0, #0x16
	strb r3, [r0]
	ldrb r2, [r4]
	adds r0, #1
	strb r2, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl memcpy
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800D1D2
	ldr r0, [r7, #0x20]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0800D1D2
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x40]
	cmp r2, r1
	bne _0800D1E8
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _0800D1E8
_0800D1D2:
	movs r0, #0
	bl _0800DA38
	.align 2, 0
_0800D1D8: .4byte gPlayer
_0800D1DC: .4byte gUnknown_03005424
_0800D1E0: .4byte gCurTask
_0800D1E4: .4byte IWRAM_START + 0x58
_0800D1E8:
	ldr r0, _0800D2CC @ =gPlayer
	ldr r1, [r0, #8]
	mov sb, r1
	ldr r2, [r0, #0xc]
	str r2, [sp, #0x38]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	cmp r3, r1
	beq _0800D204
	bl _0800DA36
_0800D204:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D222
	ldr r0, [r6, #0x3c]
	ldr r4, [sp, #0x18]
	cmp r0, r4
	bne _0800D222
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r0, #1
	str r0, [sp, #0x34]
_0800D222:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	ldr r2, [sp, #0x38]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _0800D236
	b _0800D580
_0800D236:
	ldr r3, [sp, #0x40]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r4, sb
	asrs r0, r4, #8
	mov r1, sp
	movs r4, #8
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov ip, r0
	cmp r2, r1
	bgt _0800D264
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D274
	cmp r2, r1
	bge _0800D264
	b _0800D580
_0800D264:
	mov r3, sp
	movs r0, #0xa
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D274
	b _0800D580
_0800D274:
	asrs r0, r7, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, sp
	movs r4, #9
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800D29C
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D2AC
	cmp r2, r1
	bge _0800D29C
	b _0800D580
_0800D29C:
	mov r3, sp
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D2AC
	b _0800D580
_0800D2AC:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D2D0
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D2BA
	b _0800D440
_0800D2BA:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D440
	.align 2, 0
_0800D2CC: .4byte gPlayer
_0800D2D0:
	asrs r0, r7, #0x10
	cmp r8, r0
	bgt _0800D2D8
	b _0800D43A
_0800D2D8:
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D43A
_0800D2EA:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0800D38E
	asrs r0, r7, #0x10
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D35C @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D360 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D364
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	strh r5, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D35C: .4byte 0xFFFFFF00
_0800D360: .4byte sub_801EC3C
_0800D364:
	movs r0, #8
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	ldr r1, [r6, #0x20]
	orrs r1, r0
	subs r0, #0xb
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r2, [sp, #0x18]
	str r2, [r6, #0x3c]
	mov r3, sp
	ldrh r3, [r3, #0x3c]
	strh r3, [r6, #0x12]
	ldr r4, [sp, #0x38]
	str r4, [r6, #0xc]
	ldr r5, [sp, #0x34]
	cmp r5, #0
	beq _0800D38C
	b _0800DA1E
_0800D38C:
	b _0800D426
_0800D38E:
	asrs r0, r7, #0x10
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D3F8 @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, _0800D3FC @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D400
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D3F8: .4byte 0xFFFFFF00
_0800D3FC: .4byte sub_801EC3C
_0800D400:
	movs r1, #8
	ldr r4, [sp, #0x30]
	orrs r4, r1
	str r4, [sp, #0x30]
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r5, [sp, #0x18]
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [sp, #0x38]
	str r0, [r6, #0xc]
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800D426
	b _0800DA1E
_0800D426:
	adds r0, r6, #0
	bl sub_8021BE0
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _0800DA18
_0800D43A:
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	bne _0800D460
_0800D440:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D458
	movs r3, #0x12
	ldrsh r0, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
_0800D458:
	ldr r5, [sp, #0x3c]
	cmp r5, #0
	bne _0800D460
	b _0800D580
_0800D460:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D468
	b _0800D580
_0800D468:
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
	b _0800D580
_0800D47C:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D500
	ldr r5, _0800D4CC @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	add r0, r8
	ldr r1, _0800D4D0 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D4D4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x3c]
	strh r0, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D4DC
	.align 2, 0
_0800D4CC: .4byte gPlayer
_0800D4D0: .4byte sub_801EC3C
_0800D4D4:
	mov r1, sb
	str r1, [r5, #8]
	ldr r2, [sp, #0x38]
	str r2, [r5, #0xc]
_0800D4DC:
	ldr r0, _0800D4FC @ =gPlayer
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0x44]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D4FC: .4byte gPlayer
_0800D500:
	ldr r5, _0800D54C @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	mov r1, r8
	subs r0, r1, r0
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D550 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D554
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r1, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D55C
	.align 2, 0
_0800D54C: .4byte gPlayer
_0800D550: .4byte sub_801EC3C
_0800D554:
	mov r2, sb
	str r2, [r5, #8]
	ldr r3, [sp, #0x38]
	str r3, [r5, #0xc]
_0800D55C:
	ldr r0, _0800D57C @ =gPlayer
	movs r4, #0x12
	ldrsh r1, [r0, r4]
	ldr r5, [sp, #0x44]
	asrs r2, r5, #0x10
	adds r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D57C: .4byte gPlayer
_0800D580:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D598
	b _0800DA18
_0800D598:
	ldr r2, [sp, #0x40]
	asrs r0, r2, #0x10
	mov r3, sp
	movs r4, #0xc
	ldrsb r4, [r3, r4]
	adds r3, r0, r4
	mov r5, sb
	asrs r1, r5, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov ip, r1
	cmp r3, r2
	bgt _0800D5CA
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0800D5DC
	cmp r3, r2
	bge _0800D5CA
	b _0800DA18
_0800D5CA:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800D5DC
	b _0800DA18
_0800D5DC:
	asrs r0, r7, #0x10
	mov r3, sp
	movs r2, #0xd
	ldrsb r2, [r3, r2]
	adds r1, r0, r2
	add r0, sp, #4
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r5, r8
	adds r3, r5, r4
	cmp r1, r3
	bgt _0800D608
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0800D61A
	cmp r1, r3
	bge _0800D608
	b _0800DA18
_0800D608:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800D61A
	b _0800DA18
_0800D61A:
	ldr r0, [sp, #0x40]
	asrs r1, r0, #0x10
	cmp ip, r1
	ble _0800D624
	b _0800D818
_0800D624:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _0800D630
	b _0800D794
_0800D630:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r4, [sp, #0x30]
	orrs r4, r0
	str r4, [sp, #0x30]
	adds r7, r6, #0
	adds r7, #0x62
	movs r5, #0
	ldrsb r5, [r7, r5]
	cmp r5, #0
	beq _0800D64A
	strh r2, [r6, #0x10]
	b _0800DA18
_0800D64A:
	mov r2, sp
	movs r0, #0xc
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _0800D66A
	rsbs r1, r1, #0
_0800D66A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D6E0
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	mov r1, sl
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _0800D6CA
	ldr r2, [sp, #0x2c]
	cmp r2, #0
	beq _0800D6B8
	movs r4, #0
	strh r1, [r6, #0x14]
	mov r3, sl
	strh r3, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D6B4 @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	b _0800DA00
	.align 2, 0
_0800D6B4: .4byte PlayerCB_8025318
_0800D6B8:
	mov r4, sl
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _0800DA18
_0800D6CA:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _0800D6DC @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _0800DA18
	.align 2, 0
_0800D6DC: .4byte 0x0000FE80
_0800D6E0:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800D6EA
	b _0800DA18
_0800D6EA:
	mov r2, sb
	asrs r0, r2, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r3, r8
	subs r1, r3, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _0800D734 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D738
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r5, [r6, #0x10]
	lsls r1, r4, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _0800DA18
	.align 2, 0
_0800D734: .4byte sub_801EB44
_0800D738:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D770
	movs r0, #0x20
	orrs r1, r0
	ldr r4, [sp, #0x30]
	orrs r4, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r4, r0
	str r4, [sp, #0x30]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D790 @ =PlayerCB_8025318
	str r0, [r6]
_0800D770:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [sp, #0x30]
	ands r0, r1
	str r0, [sp, #0x30]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
	mov r1, sb
	str r1, [r6, #8]
	ldr r2, [sp, #0x38]
	str r2, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D790: .4byte PlayerCB_8025318
_0800D794:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r3, [sp, #0x30]
	orrs r3, r0
	str r3, [sp, #0x30]
	adds r5, r6, #0
	adds r5, #0x62
	movs r3, #0
	ldrsb r3, [r5, r3]
	cmp r3, #0
	beq _0800D7B0
	movs r0, #0
	strh r0, [r6, #0x10]
	b _0800DA18
_0800D7B0:
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D7BE
	rsbs r2, r1, #0
_0800D7BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _0800D7C8
	b _0800DA18
_0800D7C8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	blt _0800D7D8
	b _0800DA14
_0800D7D8:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D810
	movs r4, #0
	mov r0, sl
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D80C @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r5]
	b _0800DA18
	.align 2, 0
_0800D80C: .4byte PlayerCB_8025318
_0800D810:
	adds r0, r6, #0
	bl sub_800DE44
	b _0800DA18
_0800D818:
	adds r5, r6, #0
	ldr r3, [r5, #0x20]
	movs r7, #1
	adds r2, r3, #0
	ands r2, r7
	cmp r2, #0
	bne _0800D828
	b _0800D998
_0800D828:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	ldr r4, _0800D844 @ =gPlayer + 0x62
	movs r6, #0
	ldrsb r6, [r4, r6]
	cmp r6, #0
	beq _0800D848
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0800DA18
	.align 2, 0
_0800D844: .4byte gPlayer + 0x62
_0800D848:
	mov r2, sp
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r5, r4]
	cmp r1, #0
	bge _0800D868
	rsbs r1, r1, #0
_0800D868:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D8E8
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800D8D4
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D8C0
	movs r4, #0
	strh r2, [r5, #0x14]
	mov r0, sl
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D8B8 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	ldr r1, _0800D8BC @ =gPlayer + 0x62
	strb r4, [r1]
	b _0800DA18
	.align 2, 0
_0800D8B8: .4byte PlayerCB_8025318
_0800D8BC: .4byte gPlayer + 0x62
_0800D8C0:
	mov r2, sl
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r3, _0800D8D0 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D8D0: .4byte 0xFFFFFF00
_0800D8D4:
	movs r0, #2
	orrs r3, r0
	str r3, [r5, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0800DA18
_0800D8E8:
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bne _0800D8F2
	b _0800DA18
_0800D8F2:
	mov r1, sb
	asrs r0, r1, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	add r1, r8
	ldr r2, _0800D938 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D93C
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x10]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D938: .4byte sub_801EB44
_0800D93C:
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D974
	movs r0, #0x20
	orrs r1, r0
	ldr r2, [sp, #0x30]
	orrs r2, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r5, #0x20]
	ands r2, r0
	str r2, [sp, #0x30]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D994 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
_0800D974:
	ldr r0, [r5, #0x20]
	orrs r0, r7
	str r0, [r5, #0x20]
	ldr r3, [sp, #0x30]
	orrs r3, r7
	str r3, [sp, #0x30]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	str r0, [r5, #8]
	ldr r4, [sp, #0x38]
	str r4, [r5, #0xc]
	b _0800DA18
	.align 2, 0
_0800D994: .4byte PlayerCB_8025318
_0800D998:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r5, #0x20]
	adds r7, r5, #0
	adds r7, #0x62
	movs r3, #0
	ldrsb r3, [r7, r3]
	cmp r3, #0
	beq _0800D9B0
	strh r2, [r5, #0x10]
	b _0800DA18
_0800D9B0:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D9BE
	rsbs r2, r1, #0
_0800D9BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	ble _0800DA18
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	ble _0800DA14
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800DA0C
	movs r4, #0
	mov r0, sl
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800DA08 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
_0800DA00:
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r7]
	b _0800DA18
	.align 2, 0
_0800DA08: .4byte PlayerCB_8025318
_0800DA0C:
	adds r0, r5, #0
	bl sub_800DE44
	b _0800DA18
_0800DA14:
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x10]
_0800DA18:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800DA36
_0800DA1E:
	ldr r2, _0800DA48 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DA36
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_0800DA36:
	ldr r0, [sp, #0x30]
_0800DA38:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA48: .4byte gPlayer

	thumb_func_start sub_800DA4C
sub_800DA4C: @ 0x0800DA4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r2, _0800DAB0 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800DAAA
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _0800DAAA
	ldr r1, _0800DAB4 @ =gMultiplayerPlayerTasks
	ldr r0, _0800DAB8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _0800DABC
_0800DAAA:
	movs r0, #0
	b _0800DD44
	.align 2, 0
_0800DAB0: .4byte gPlayer
_0800DAB4: .4byte gMultiplayerPlayerTasks
_0800DAB8: .4byte 0x04000128
_0800DABC:
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _0800DB70
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800DB70
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	ldr r7, _0800DC50 @ =IWRAM_START + 0x50
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _0800DC54 @ =IWRAM_START + 0x2C
	adds r0, r3, r7
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	cmp r2, r1
	bgt _0800DB08
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB1A
	cmp r2, r1
	blt _0800DB70
_0800DB08:
	ldr r4, _0800DC58 @ =IWRAM_START + 0x2E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB1A:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800DB56
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB68
	cmp r2, r1
	blt _0800DB70
_0800DB56:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB68:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DB70:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0800DB7C
	b _0800DC8C
_0800DB7C:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _0800DB84
	b _0800DC8C
_0800DB84:
	ldr r4, [sp]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _0800DBC8
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _0800DBDC
	cmp r4, r1
	blt _0800DC8C
_0800DBC8:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _0800DC8C
_0800DBDC:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _0800DC20
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _0800DC34
	cmp r4, r3
	blt _0800DC8C
_0800DC20:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0800DC8C
_0800DC34:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC5C
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC66
	.align 2, 0
_0800DC50: .4byte IWRAM_START + 0x50
_0800DC54: .4byte IWRAM_START + 0x2C
_0800DC58: .4byte IWRAM_START + 0x2E
_0800DC5C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC66:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC7E
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC88
_0800DC7E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC88:
	movs r0, #1
	b _0800DD3C
_0800DC8C:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800DD42
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq _0800DD42
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _0800DCD8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _0800DCEA
	cmp r3, r1
	blt _0800DD42
_0800DCD8:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt _0800DD42
_0800DCEA:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800DD28
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DD3A
	cmp r2, r1
	blt _0800DD42
_0800DD28:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DD42
_0800DD3A:
	movs r0, #2
_0800DD3C:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DD42:
	mov r0, r8
_0800DD44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

@ In:
@  r0: Player*
	thumb_func_start sub_800DD54
sub_800DD54: @ 0x0800DD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DD68
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DD6C
_0800DD68:
	movs r0, #0
	b _0800DE2A
_0800DD6C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD80
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0800DD82
_0800DD80:
	ldr r0, _0800DE30 @ =0x0000FE80
_0800DD82:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DDA2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DDA2:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DE34 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DE38 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DE3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DE22
	ldr r6, _0800DE40 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #0xa
	bls _0800DE04
	movs r4, #0xa
_0800DE04:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DE22:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DE2A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE30: .4byte 0x0000FE80
_0800DE34: .4byte 0xFFFFFBFF
_0800DE38: .4byte 0xFFFFFEFF
_0800DE3C: .4byte gGameMode
_0800DE40: .4byte gRingCount

@ In:
@  r0: Player*
	thumb_func_start sub_800DE44
sub_800DE44: @ 0x0800DE44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DE58
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DE5C
_0800DE58:
	movs r0, #0
	b _0800DF20
_0800DE5C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DE74
	ldr r0, _0800DE70 @ =0x0000FE80
	b _0800DE78
	.align 2, 0
_0800DE70: .4byte 0x0000FE80
_0800DE74:
	movs r0, #0xc0
	lsls r0, r0, #1
_0800DE78:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DE98
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DE98:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DF28 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DF2C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DF30 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DF18
	ldr r6, _0800DF34 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #5
	bls _0800DEFA
	movs r4, #5
_0800DEFA:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DF18:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DF20:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DF28: .4byte 0xFFFFFBFF
_0800DF2C: .4byte 0xFFFFFEFF
_0800DF30: .4byte gGameMode
_0800DF34: .4byte gRingCount

	thumb_func_start sub_800DF38
sub_800DF38: @ 0x0800DF38
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldrb r5, [r4, #0x16]
	rsbs r0, r5, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r4, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r4, #0
	bl sub_800BFAC
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@ In:
@  r0: Player*
	thumb_func_start sub_800DF8C
sub_800DF8C: @ 0x0800DF8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0800DFB0 @ =0x00200080
	ands r0, r1
	cmp r0, #0
	beq _0800DFB4
	movs r0, #0
	movs r1, #0
	bl sub_800E0C0
	b _0800E0AE
	.align 2, 0
_0800DFB0: .4byte 0x00200080
_0800DFB4:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_800E0C0
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E0AE
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800E050 @ =gUnknown_08C871D4
	adds r1, r4, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp]
	ldr r5, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r1, [r5]
	mov r8, r1
	adds r5, #1
	adds r2, r4, #0
	adds r2, #0x71
	ldrb r0, [r2]
	cmp r0, r8
	beq _0800E0AE
	str r2, [sp, #8]
_0800E002:
	ldr r0, _0800E054 @ =gUnknown_030055D4
	ldrb r4, [r0]
	cmp r6, #0
	beq _0800E07A
	movs r2, #0xff
	mov sl, r2
	movs r0, #0x1f
	mov sb, r0
_0800E012:
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r0, r5
	ldrb r1, [r0]
	mov ip, r1
	ldrb r7, [r0, #1]
	ldrb r1, [r0, #2]
	mov r2, sl
	ands r1, r2
_0800E02A:
	lsls r0, r4, #2
	ldr r2, _0800E058 @ =gUnknown_030055E0
	adds r0, r0, r2
	ldrb r3, [r0]
	ands r3, r7
	ldrb r2, [r0, #1]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sl
	ands r2, r1
	cmp r0, r2
	blt _0800E06C
	cmp ip, r3
	bne _0800E05C
	subs r4, #1
	mov r2, sb
	ands r4, r2
	b _0800E072
	.align 2, 0
_0800E050: .4byte gUnknown_08C871D4
_0800E054: .4byte gUnknown_030055D4
_0800E058: .4byte gUnknown_030055E0
_0800E05C:
	subs r4, #1
	mov r1, sb
	ands r4, r1
	subs r0, #1
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0800E02A
_0800E06C:
	movs r2, #0
	cmp r2, #0
	beq _0800E076
_0800E072:
	cmp r6, #0
	bne _0800E012
_0800E076:
	cmp r6, #0
	bne _0800E082
_0800E07A:
	mov r1, r8
	ldr r0, [sp, #8]
	strb r1, [r0]
	b _0800E0AE
_0800E082:
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r0, r2
	ldr r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r0, [r5]
	mov r8, r0
	adds r5, #1
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, r8
	bne _0800E002
_0800E0AE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E0C0
sub_800E0C0: @ 0x0800E0C0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r4, #3
	adds r3, r1, #0
	ands r3, r4
	movs r2, #0x80
	lsls r2, r2, #1
	ands r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x16
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	orrs r3, r2
	movs r1, #0xf0
	adds r5, r0, #0
	ands r5, r1
	orrs r5, r3
	ldr r2, _0800E138 @ =gUnknown_030055D8
	ldrb r1, [r2]
	adds r1, #1
	ands r1, r4
	strb r1, [r2]
	ldr r3, _0800E13C @ =gUnknown_030055D0
	ldrb r1, [r2]
	adds r1, r1, r3
	strb r5, [r1]
	ldrb r2, [r2]
	subs r1, r2, #1
	ands r1, r4
	adds r1, r1, r3
	ldrb r1, [r1]
	orrs r5, r1
	subs r2, #2
	ands r2, r4
	adds r2, r2, r3
	ldrb r1, [r2]
	orrs r5, r1
	ands r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0800E140 @ =gUnknown_030055E0
	ldr r2, _0800E144 @ =gUnknown_030055D4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, r5
	bne _0800E148
	ldrb r1, [r3, #1]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800E148
	adds r0, r1, #1
	strb r0, [r3, #1]
	b _0800E164
	.align 2, 0
_0800E138: .4byte gUnknown_030055D8
_0800E13C: .4byte gUnknown_030055D0
_0800E140: .4byte gUnknown_030055E0
_0800E144: .4byte gUnknown_030055D4
_0800E148:
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	strb r5, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r1, [r0, #1]
_0800E164:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E16C
sub_800E16C: @ 0x0800E16C
	sub sp, #4
	ldr r1, _0800E18C @ =gUnknown_030055D4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r1, _0800E190 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800E194 @ =gUnknown_030055E0
	str r0, [r1, #4]
	ldr r0, _0800E198 @ =0x8500001F
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0800E18C: .4byte gUnknown_030055D4
_0800E190: .4byte 0x040000D4
_0800E194: .4byte gUnknown_030055E0
_0800E198: .4byte 0x8500001F
