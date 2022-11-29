	.section .rodata


@; NOTE(Jace): To better understand how the data that is
@;             pointed to from here is composed, look at the below thread.
@;             Even though it is about SA3, all 3 games do share quite a bit.
@;             https://twitter.com/JaceCear/status/1362912485951610881
    .global gSpritePosData_Rings
gSpritePosData_Rings:
    .incbin "baserom.gba", 0x000D4BFC, 0x88

    .global gSpritePosData_Interactables
gSpritePosData_Interactables:
    .incbin "baserom.gba", 0x000D4C84, 0x88

    .global gSpritePosData_Itemboxes
gSpritePosData_Itemboxes:
    .incbin "baserom.gba", 0x000D4D0C, 0x88

    .global gSpritePosData_Enemies
gSpritePosData_Enemies:
    .incbin "baserom.gba", 0x000D4D94, 0x88

@; gSpriteFunctions ?
    .global gSpriteInits_Interactables @ 080D4E1C
gSpriteInits_Interactables:
    .4byte initSprite_Interactable_ChangePlayerLayer
    .4byte initSprite_Interactable_ChangePlayerLayer
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
    .4byte initSprite_Interactable_LoopGap_Start
    .4byte initSprite_Interactable_LoopGap_End

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
    .4byte initSprite_Interactable044    @ Used at layer transitions on 3/4 - type loops
    .4byte initSprite_Interactable_Toggle_Checkpoint
    .4byte initSprite_Interactable_Toggle_StageGoal
    .4byte initSprite_Interactable_WindupStick @ Character rotates a bit around it, then shoots up/down
    .4byte initSprite_Interactable048
    .4byte initSprite_Interactable_HookRail_Start
    .4byte initSprite_Interactable_HookRail_End
    .4byte initSprite_Interactable051
    .4byte initSprite_Interactable052
    .4byte initSprite_Interactable_HotCrater_Crane
    .4byte initSprite_Interactable_LaunchRing
    .4byte initSprite_Interactable_CommonFloatingSpring_Up
    .4byte initSprite_Interactable_MusicPlant_Note_Sphere
    .4byte initSprite_Interactable_MusicPlant_Note_Block
    .4byte initSprite_Interactable_MusicPlant_GuitarString
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Vertical
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushLeft
    .4byte initSprite_Interactable_MusicPlant_Keyboard_Horizontal_PushRight
    .4byte initSprite_Interactable_MusicPlant_GermanFlute
    .4byte initSprite_Interactable_MusicPlant_Trumpet_Entry
    .4byte initSprite_Interactable_MusicPlant_PipeInstrument_Entry
    .4byte initSprite_Interactable_IceParadise_SlowingSnow
    .4byte initSprite_Interactable_IceParadise_FunnelSphere
    .4byte initSprite_Interactable_IceParadise_HalfPipe_End     @ Like in SA1 Neo Green Hill
    .4byte initSprite_Interactable_IceParadise_HalfPipe_Start   @ Like in SA1 Neo Green Hill
    .4byte initSprite_Interactable069
    .4byte initSprite_Interactable070
    .4byte initSprite_Interactable044
    .4byte initSprite_Interactable_Common_ClearPipe_Start
    .4byte initSprite_Interactable_Common_ClearPipe_End
    .4byte initSprite_Interactable074
    .4byte initSprite_Interactable075
    .4byte initSprite_Interactable076
    .4byte initSprite_Interactable077
    .4byte initSprite_Interactable078
    .4byte initSprite_Interactable079
    .4byte initSprite_Interactable080
    .4byte initSprite_Interactable081
    .4byte initSprite_Interactable_SkyCanyon_GiantPropeller
    .4byte initSprite_Interactable_IceParadise_SlidyIce
    .4byte initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill
    .4byte initSprite_Interactable085
    .4byte initSprite_Interactable086
    .4byte initSprite_Interactable087
    .4byte initSprite_Interactable088
    .4byte initSprite_Interactable089
    .4byte initSprite_Interactable090
    .4byte initSprite_Interactable091
    .4byte initSprite_Interactable092
    .4byte initSprite_Interactable093
    .4byte initSprite_Interactable094
    .4byte initSprite_Interactable095
    .4byte initSprite_Interactable_SkyCanyon_FlyingHandle
    .4byte initSprite_Interactable097
    .4byte initSprite_Interactable098
    .4byte initSprite_Interactable099
    .4byte initSprite_Interactable100
    .4byte initSprite_Interactable101
    .4byte initSprite_Interactable102
    .4byte initSprite_Interactable_SpecialRing
    .4byte initSprite_Interactable104
    .4byte initSprite_Interactable105

    .global gUnknown_080D4FC4
gUnknown_080D4FC4:
    .incbin "baserom.gba", 0x000D4FC4, 0x5C

    .global gUnknown_080D5020
gUnknown_080D5020:
    .incbin "baserom.gba", 0x000D5020, 0xC

    .global gUnknown_080D502C
gUnknown_080D502C:
    .incbin "baserom.gba", 0x000D502C, 0x74

    .global gUnknown_080D50A0
gUnknown_080D50A0:
    .incbin "baserom.gba", 0x000D50A0, 0x88

    .global gUnknown_080D5128
gUnknown_080D5128:
    .asciz "STAGE"

    .align 2 , 0
    .global gUnknown_080D5130
gUnknown_080D5130:
    .incbin "baserom.gba", 0x000D5130, 0x18

    .global gUnknown_080D5148
gUnknown_080D5148:
    .incbin "baserom.gba", 0x000D5148, 0x30

    .global gUnknown_080D5178
gUnknown_080D5178:
    .incbin "baserom.gba", 0x000D5178, 0x4E

    .global gUnknown_080D51C6
gUnknown_080D51C6:
    .incbin "baserom.gba", 0x000D51C6, 0x1E

    .global gUnknown_080D51E4
gUnknown_080D51E4:
    .incbin "baserom.gba", 0x000D51E4, 0x10

    .global gUnknown_080D51F4
gUnknown_080D51F4:
    .incbin "baserom.gba", 0x000D51F4, 0x8

    .global gUnknown_080D51FC
gUnknown_080D51FC:
    .incbin "baserom.gba", 0x000D51FC, 0x8

    .global gUnknown_080D5204
gUnknown_080D5204:
    .incbin "baserom.gba", 0x000D5204, 0x50

    .global gUnknown_080D5254
gUnknown_080D5254:
    .incbin "baserom.gba", 0x000D5254, 0x8C
