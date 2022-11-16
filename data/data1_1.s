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
    .4byte initSprite_Interactable_YellowFlower
    .4byte initSprite_Interactable_Ramp
    .4byte initSprite_Interactable_Booster
    .4byte initSprite_Interactable_RoundUpSlope @ Like the one at the end of Leaf Forest Act 1
    .4byte initSprite_Interactable_BouncySpring
    .4byte initSprite_Interactable019
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
    .incbin "baserom.gba", 0x000D5128, 0x8

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

    .global gUnknown_080D52E0
gUnknown_080D52E0:
    .incbin "baserom.gba", 0x000D52E0, 0xF0

    .global gUnknown_080D53D0
gUnknown_080D53D0:
    .incbin "baserom.gba", 0x000D53D0, 0xA

    .global gUnknown_080D53DA
gUnknown_080D53DA:
    .incbin "baserom.gba", 0x000D53DA, 0xA

    .global gUnknown_080D53E4
gUnknown_080D53E4:
    .incbin "baserom.gba", 0x000D53E4, 0x4C

    .global gUnknown_080D5430
gUnknown_080D5430:
    .incbin "baserom.gba", 0x000D5430, 0x38

    .global gUnknown_080D5468
gUnknown_080D5468:
    .incbin "baserom.gba", 0x000D5468, 0x36

    .global gUnknown_080D549E
gUnknown_080D549E:
    .incbin "baserom.gba", 0x000D549E, 0x6E

    .global gUnknown_080D550C
gUnknown_080D550C:
    .incbin "baserom.gba", 0x000D550C, 0xC

    .global gUnknown_080D5518
gUnknown_080D5518:
    .incbin "baserom.gba", 0x000D5518, 0x14

    .global gUnknown_080D552C
gUnknown_080D552C:
    .incbin "baserom.gba", 0x000D552C, 0xC

    .global gUnknown_080D5538
gUnknown_080D5538:
    .incbin "baserom.gba", 0x000D5538, 0x4

    .global gUnknown_080D553C
gUnknown_080D553C:
    .incbin "baserom.gba", 0x000D553C, 0xC

    .global gUnknown_080D5548
gUnknown_080D5548:
    .incbin "baserom.gba", 0x000D5548, 0x48

    .global gUnknown_080D5590
gUnknown_080D5590:
    .incbin "baserom.gba", 0x000D5590, 0x98

    .global gUnknown_080D5628
gUnknown_080D5628:
    .incbin "baserom.gba", 0x000D5628, 0x4C

    .global gUnknown_080D5674
gUnknown_080D5674:
    .incbin "baserom.gba", 0x000D5674, 0x4

    .global gUnknown_080D5678
gUnknown_080D5678:
    .incbin "baserom.gba", 0x000D5678, 0xC

    .global gUnknown_080D5684
gUnknown_080D5684:
    .incbin "baserom.gba", 0x000D5684, 0xC0

    .global gUnknown_080D5744
gUnknown_080D5744:
    .incbin "baserom.gba", 0x000D5744, 0x24

    .global gUnknown_080D5768
gUnknown_080D5768:
    .incbin "baserom.gba", 0x000D5768, 0x70

    .global gUnknown_080D57D8
gUnknown_080D57D8:
    .incbin "baserom.gba", 0x000D57D8, 0x4

    .global gUnknown_080D57DC
gUnknown_080D57DC:
    .incbin "baserom.gba", 0x000D57DC, 0x88

    .global gUnknown_080D5864
gUnknown_080D5864:
    .incbin "baserom.gba", 0x000D5864, 0x100

    .global gUnknown_080D5964
gUnknown_080D5964:
    .incbin "baserom.gba", 0x000D5964, 0x24

    .global gUnknown_080D5988
gUnknown_080D5988:
    .incbin "baserom.gba", 0x000D5988, 0x88

    .global gUnknown_080D5A10
gUnknown_080D5A10:
    .incbin "baserom.gba", 0x000D5A10, 0x88

    .global gUnknown_080D5A98
gUnknown_080D5A98:
    .incbin "baserom.gba", 0x000D5A98, 0x88

    .global gUnknown_080D5B20
gUnknown_080D5B20:
    .incbin "baserom.gba", 0x000D5B20, 0x1

    .global gUnknown_080D5B21
gUnknown_080D5B21:
    .incbin "baserom.gba", 0x000D5B21, 0x1

    .global gUnknown_080D5B22
gUnknown_080D5B22:
    .incbin "baserom.gba", 0x000D5B22, 0x2E

    .global gUnknown_080D5B50
gUnknown_080D5B50:
    .incbin "baserom.gba", 0x000D5B50, 0xA0

    .global gUnknown_080D5BF0
gUnknown_080D5BF0:
    .incbin "baserom.gba", 0x000D5BF0, 0x12

    .global gUnknown_080D5C02
gUnknown_080D5C02:
    .incbin "baserom.gba", 0x000D5C02, 0x2

    .global gUnknown_080D5C04
gUnknown_080D5C04:
    .incbin "baserom.gba", 0x000D5C04, 0x5E

    .global gUnknown_080D5C62
gUnknown_080D5C62:
    .incbin "baserom.gba", 0x000D5C62, 0x20

    .global gUnknown_080D5C82
gUnknown_080D5C82:
    .incbin "baserom.gba", 0x000D5C82, 0x20

    .global gUnknown_080D5CA2
gUnknown_080D5CA2:
    .incbin "baserom.gba", 0x000D5CA2, 0x20

    .global gUnknown_080D5CC2
gUnknown_080D5CC2:
    .incbin "baserom.gba", 0x000D5CC2, 0x22

@; Not sure whether the size is correct, here.
@; It should be (2 MapHeader pointers + 1 Background-Map pointer) * number_of_maps (which is 31)
    .global gMapHeaders
gMapHeaders:
    .incbin "baserom.gba", 0x000D5CE4, 0x5F4

    .global gUnknown_080D62D8
gUnknown_080D62D8:
    .incbin "baserom.gba", 0x000D62D8, 0x7C

    .global gUnknown_080D6354
gUnknown_080D6354:
    .incbin "baserom.gba", 0x000D6354, 0x20

@; Spawn positions are (count from the top-left of the map):
@;   .2byte xPixels
@;   .2byte yPixels
    .global gSpawnPositions
gSpawnPositions:
    .incbin "baserom.gba", 0x000D6374, 0x88

    .global gUnknown_080D63FC
gUnknown_080D63FC:
    .incbin "baserom.gba", 0x000D63FC, 0x110

    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

    .global gUnknown_080D672C
gUnknown_080D672C:
    .incbin "baserom.gba", 0x000D672C, 0xA

    .global gUnknown_080D6736
gUnknown_080D6736:
    .incbin "baserom.gba", 0x000D6736, 0x1CC

    .global gUnknown_080D6902
gUnknown_080D6902:
    .incbin "baserom.gba", 0x000D6902, 0x14

    .global gUnknown_080D6916
gUnknown_080D6916:
    .incbin "baserom.gba", 0x000D6916, 0xA

    .global gUnknown_080D6920
gUnknown_080D6920:
    .incbin "baserom.gba", 0x000D6920, 0x12

    .global gUnknown_080D6932
gUnknown_080D6932:
    .incbin "baserom.gba", 0x000D6932, 0x8

    .global gUnknown_080D693A
gUnknown_080D693A:
    .incbin "baserom.gba", 0x000D693A, 0x50

    .global gUnknown_080D698A
gUnknown_080D698A:
    .incbin "baserom.gba", 0x000D698A, 0x8

    .global gUnknown_080D6992
gUnknown_080D6992:
    .incbin "baserom.gba", 0x000D6992, 0x14

    .global gUnknown_080D69A6
gUnknown_080D69A6:
    .incbin "baserom.gba", 0x000D69A6, 0xC

    .global gUnknown_080D69B2
gUnknown_080D69B2:
    .incbin "baserom.gba", 0x000D69B2, 0x8

    .global gUnknown_080D69BA
gUnknown_080D69BA:
    .incbin "baserom.gba", 0x000D69BA, 0x8

    .global gUnknown_080D69C2
gUnknown_080D69C2:
    .incbin "baserom.gba", 0x000D69C2, 0x6

    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18
