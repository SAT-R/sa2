.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

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
