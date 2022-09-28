.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start MidiKeyToFreq
MidiKeyToFreq: @ 0x020103B8
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _020103CC
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_020103CC:
	ldr r3, _02010414 @ =gScaleTable
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _02010418 @ =gFreqTable
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl umul3232H32
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl umul3232H32
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02010414: .4byte gScaleTable
_02010418: .4byte gFreqTable

	thumb_func_start sub_0201041C
sub_0201041C: @ 0x0201041C
	bx lr
	.align 2, 0

	thumb_func_start MPlayContinue
MPlayContinue: @ 0x02010420
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _02010434 @ =0x68736D53
	cmp r3, r0
	bne _02010432
	ldr r0, [r2, #4]
	ldr r1, _02010438 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_02010432:
	bx lr
	.align 2, 0
_02010434: .4byte 0x68736D53
_02010438: .4byte 0x7FFFFFFF

	thumb_func_start MPlayFadeOut
MPlayFadeOut: @ 0x0201043C
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _02010458 @ =0x68736D53
	cmp r3, r0
	bne _02010454
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_02010454:
	bx lr
	.align 2, 0
_02010458: .4byte 0x68736D53

	thumb_func_start m4aSoundInit
m4aSoundInit: @ 0x0201045C
	push {r4, r5, r6, lr}
	ldr r0, _020104B0 @ =0x0200F830 + 1 @; sub_0200F830
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _020104B4 @ =gUnknown_03002F2C
	ldr r2, _020104B8 @ =0x04000100
	bl CpuSet
	ldr r0, _020104BC @ =gSoundInfo
	bl SoundInit
	ldr r0, _020104C0 @ =gCgbChans
	bl MPlayExtender
	ldr r0, _020104C4 @ =0x0093F400
	bl m4aSoundMode
	ldr r0, _020104C8 @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _020104AA
	ldr r5, _020104CC @ =gMPlayTable
	adds r6, r0, #0
_0201048E:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl MPlayOpen
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _020104D0 @ =gMPlayMemAccArea
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _0201048E
_020104AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020104B0: .4byte 0x0200F830 + 1
_020104B4: .4byte gUnknown_03002F2C
_020104B8: .4byte 0x04000100
_020104BC: .4byte gSoundInfo
_020104C0: .4byte gCgbChans
_020104C4: .4byte 0x0093F400
_020104C8: .4byte 0x00000004
_020104CC: .4byte gMPlayTable
_020104D0: .4byte gMPlayMemAccArea

	arm_func_start m4aSoundMain
m4aSoundMain: @ 0x020104D4
_020104D4:
	.byte 0x00, 0xB5, 0xFF, 0xF7, 0x69, 0xF9, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start m4aSongNumStart
m4aSongNumStart: @ 0x020104E0
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02010504 @ =gMPlayTable
	ldr r1, _02010508 @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl MPlayStart
	pop {r0}
	bx r0
	.align 2, 0
_02010504: .4byte gMPlayTable
_02010508: .4byte gSongTable

	thumb_func_start m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 0x0201050C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02010538 @ =gMPlayTable
	ldr r1, _0201053C @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _02010540
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _02010554
	.align 2, 0
_02010538: .4byte gMPlayTable
_0201053C: .4byte gSongTable
_02010540:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0201054C
	cmp r2, #0
	bge _02010554
_0201054C:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
_02010554:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 0x02010558
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02010584 @ =gMPlayTable
	ldr r1, _02010588 @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _0201058C
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _020105A8
	.align 2, 0
_02010584: .4byte gMPlayTable
_02010588: .4byte gSongTable
_0201058C:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _0201059E
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
	b _020105A8
_0201059E:
	cmp r2, #0
	bge _020105A8
	adds r0, r1, #0
	bl MPlayContinue
_020105A8:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStop
m4aSongNumStop: @ 0x020105AC
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _020105D8 @ =gMPlayTable
	ldr r1, _020105DC @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _020105D2
	adds r0, r2, #0
	bl MPlayStop
_020105D2:
	pop {r0}
	bx r0
	.align 2, 0
_020105D8: .4byte gMPlayTable
_020105DC: .4byte gSongTable

	thumb_func_start m4aSongNumContinue
m4aSongNumContinue: @ 0x020105E0
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0201060C @ =gMPlayTable
	ldr r1, _02010610 @ =gSongTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _02010606
	adds r0, r2, #0
	bl MPlayContinue
_02010606:
	pop {r0}
	bx r0
	.align 2, 0
_0201060C: .4byte gMPlayTable
_02010610: .4byte gSongTable

	thumb_func_start m4aMPlayAllStop
m4aMPlayAllStop: @ 0x02010614
	push {r4, r5, lr}
	ldr r0, _02010638 @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _02010632
	ldr r5, _0201063C @ =gMPlayTable
	adds r4, r0, #0
_02010624:
	ldr r0, [r5]
	bl MPlayStop
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _02010624
_02010632:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010638: .4byte 0x00000004
_0201063C: .4byte gMPlayTable

	thumb_func_start m4aMPlayContinue
m4aMPlayContinue: @ 0x02010640
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayAllContinue
m4aMPlayAllContinue: @ 0x0201064C
	push {r4, r5, lr}
	ldr r0, _02010670 @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0201066A
	ldr r5, _02010674 @ =gMPlayTable
	adds r4, r0, #0
_0201065C:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _0201065C
_0201066A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010670: .4byte 0x00000004
_02010674: .4byte gMPlayTable

	thumb_func_start m4aMPlayFadeOut
m4aMPlayFadeOut: @ 0x02010678
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayFadeOutTemporarily
m4aMPlayFadeOutTemporarily: @ 0x02010688
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _020106A0 @ =0x68736D53
	cmp r3, r0
	bne _0201069E
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _020106A4 @ =0x00000101
	strh r0, [r2, #0x28]
_0201069E:
	bx lr
	.align 2, 0
_020106A0: .4byte 0x68736D53
_020106A4: .4byte 0x00000101

	thumb_func_start m4aMPlayFadeIn
m4aMPlayFadeIn: @ 0x020106A8
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _020106C8 @ =0x68736D53
	cmp r3, r0
	bne _020106C6
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _020106CC @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_020106C6:
	bx lr
	.align 2, 0
_020106C8: .4byte 0x68736D53
_020106CC: .4byte 0x7FFFFFFF

	thumb_func_start m4aMPlayImmInit
m4aMPlayImmInit: @ 0x020106D0
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _02010712
	movs r7, #0x80
_020106DC:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0201070A
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0201070A
	adds r0, r4, #0
	bl Clear64byte
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0201070A:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _020106DC
_02010712:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MPlayExtender
MPlayExtender: @ 0x02010718
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _020107E0 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _020107E4 @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _020107E8 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _020107EC @ =SOUND_INFO_PTR
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _020107F0 @ =0x68736D53
	cmp r6, r0
	bne _020107D8
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _020107F4 @ =gMPlayJumpTable
	ldr r0, _020107F8 @ =ply_memacc
	str r0, [r1, #0x20]
	ldr r0, _020107FC @ =ply_lfos
	str r0, [r1, #0x44]
	ldr r0, _02010800 @ =ply_mod
	str r0, [r1, #0x4c]
	ldr r0, _02010804 @ =ply_xcmd
	str r0, [r1, #0x70]
	ldr r0, _02010808 @ =ply_endtie
	str r0, [r1, #0x74]
	ldr r0, _0201080C @ =SampleFreqSet
	str r0, [r1, #0x78]
	ldr r0, _02010810 @ =TrackStop
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _02010814 @ =FadeOutBody
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _02010818 @ =TrkVolPitSet
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _0201081C @ =CgbSound
	str r0, [r4, #0x28]
	ldr r0, _02010820 @ =CgbOscOff
	str r0, [r4, #0x2c]
	ldr r0, _02010824 @ =MidiKeyToCgbFreq
	str r0, [r4, #0x30]
	ldr r0, _02010828 @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _0201082C @ =0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_020107D8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020107E0: .4byte 0x04000084
_020107E4: .4byte 0x04000080
_020107E8: .4byte 0x04000063
_020107EC: .4byte SOUND_INFO_PTR
_020107F0: .4byte 0x68736D53
_020107F4: .4byte gMPlayJumpTable
_020107F8: .4byte ply_memacc
_020107FC: .4byte ply_lfos
_02010800: .4byte ply_mod
_02010804: .4byte ply_xcmd
_02010808: .4byte ply_endtie
_0201080C: .4byte SampleFreqSet
_02010810: .4byte TrackStop
_02010814: .4byte FadeOutBody
_02010818: .4byte TrkVolPitSet
_0201081C: .4byte CgbSound
_02010820: .4byte CgbOscOff
_02010824: .4byte MidiKeyToCgbFreq
_02010828: .4byte 0x00000000
_0201082C: .4byte 0x05000040

	thumb_func_start MusicPlayerJumpTableCopy
MusicPlayerJumpTableCopy: @ 0x02010830
	svc #0x2a
	bx lr

	thumb_func_start ClearChain
ClearChain: @ 0x02010834
	push {lr}
	ldr r1, _02010844 @ =gUnknown_030062B8
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02010844: .4byte gUnknown_030062B8

	thumb_func_start Clear64byte
Clear64byte: @ 0x02010848
	push {lr}
	ldr r1, _02010858 @ =gUnknown_030062BC
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02010858: .4byte gUnknown_030062BC

	thumb_func_start SoundInit
SoundInit: @ 0x0201085C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _02010914 @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _02010878
	ldr r0, _02010918 @ =0x84400004
	str r0, [r1]
_02010878:
	ldr r1, _0201091C @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _02010886
	ldr r0, _02010918 @ =0x84400004
	str r0, [r1]
_02010886:
	ldr r0, _02010920 @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _02010924 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _02010928 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0201092C @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _02010930 @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _02010934 @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _02010938 @ =0x040000A4
	str r0, [r1]
	ldr r0, _0201093C @ =SOUND_INFO_PTR
	str r5, [r0]
	str r3, [sp]
	ldr r2, _02010940 @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _02010944 @ =ply_note
	str r0, [r5, #0x38]
	ldr r0, _02010948 @ =sub_0201194C
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _0201094C @ =gMPlayJumpTable
	adds r0, r4, #0
	bl MPlayJumpTableCopy
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl SampleFreqSet
	ldr r0, _02010950 @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010914: .4byte 0x040000C4
_02010918: .4byte 0x84400004
_0201091C: .4byte 0x040000D0
_02010920: .4byte 0x040000C6
_02010924: .4byte 0x04000084
_02010928: .4byte 0x0000A90E
_0201092C: .4byte 0x04000089
_02010930: .4byte 0x040000BC
_02010934: .4byte 0x040000A0
_02010938: .4byte 0x040000A4
_0201093C: .4byte SOUND_INFO_PTR
_02010940: .4byte 0x050003EC
_02010944: .4byte ply_note
_02010948: .4byte sub_0201194C
_0201094C: .4byte gMPlayJumpTable
_02010950: .4byte 0x68736D53

	thumb_func_start SampleFreqSet
SampleFreqSet: @ 0x02010954
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _020109D4 @ =SOUND_INFO_PTR
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _020109D8 @ =gPcmSamplesPerVBlankTable
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl sub_02012348
	strb r0, [r4, #0xb]
	ldr r0, _020109DC @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _020109E0 @ =0x00001388
	adds r0, r0, r1
	ldr r1, _020109E4 @ =0x00002710
	bl sub_02012348
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl sub_02012348
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _020109E8 @ =0x04000102
	strh r6, [r0]
	ldr r4, _020109EC @ =0x04000100
	ldr r0, _020109F0 @ =0x00044940
	adds r1, r5, #0
	bl sub_02012348
	rsbs r0, r0, #0
	strh r0, [r4]
	bl m4aSoundVSyncOn
	ldr r1, _020109F4 @ =0x04000006
_020109B8:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _020109B8
	ldr r1, _020109F4 @ =0x04000006
_020109C0:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _020109C0
	ldr r1, _020109E8 @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020109D4: .4byte SOUND_INFO_PTR
_020109D8: .4byte gPcmSamplesPerVBlankTable
_020109DC: .4byte 0x00091D1B
_020109E0: .4byte 0x00001388
_020109E4: .4byte 0x00002710
_020109E8: .4byte 0x04000102
_020109EC: .4byte 0x04000100
_020109F0: .4byte 0x00044940
_020109F4: .4byte 0x04000006

	thumb_func_start m4aSoundMode
m4aSoundMode: @ 0x020109F8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _02010A84 @ =SOUND_INFO_PTR
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _02010A88 @ =0x68736D53
	cmp r1, r0
	bne _02010A7E
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _02010A1A
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_02010A1A:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _02010A3A
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_02010A30:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _02010A30
_02010A3A:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _02010A48
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_02010A48:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _02010A66
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _02010A8C @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_02010A66:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _02010A7A
	bl m4aSoundVSyncOff
	adds r0, r4, #0
	bl SampleFreqSet
_02010A7A:
	ldr r0, _02010A88 @ =0x68736D53
	str r0, [r5]
_02010A7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010A84: .4byte SOUND_INFO_PTR
_02010A88: .4byte 0x68736D53
_02010A8C: .4byte 0x04000089

	thumb_func_start SoundClear
SoundClear: @ 0x02010A90
	push {r4, r5, r6, r7, lr}
	ldr r0, _02010ADC @ =SOUND_INFO_PTR
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _02010AE0 @ =0x68736D53
	cmp r1, r0
	bne _02010AD6
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_02010AAA:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _02010AAA
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _02010AD2
	movs r5, #1
	movs r7, #0
_02010ABE:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _02010ABE
_02010AD2:
	ldr r0, _02010AE0 @ =0x68736D53
	str r0, [r6]
_02010AD6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010ADC: .4byte SOUND_INFO_PTR
_02010AE0: .4byte 0x68736D53

	thumb_func_start m4aSoundVSyncOff
m4aSoundVSyncOff: @ 0x02010AE4
	push {lr}
	sub sp, #4
	ldr r0, _02010B44 @ =SOUND_INFO_PTR
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _02010B48 @ =0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _02010B3C
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _02010B4C @ =0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _02010B0E
	ldr r0, _02010B50 @ =0x84400004
	str r0, [r1]
_02010B0E:
	ldr r1, _02010B54 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _02010B1C
	ldr r0, _02010B50 @ =0x84400004
	str r0, [r1]
_02010B1C:
	ldr r0, _02010B58 @ =0x040000C6
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _02010B5C @ =0x05000318
	mov r0, sp
	bl CpuSet
_02010B3C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02010B44: .4byte SOUND_INFO_PTR
_02010B48: .4byte 0x978C92AD
_02010B4C: .4byte 0x040000C4
_02010B50: .4byte 0x84400004
_02010B54: .4byte 0x040000D0
_02010B58: .4byte 0x040000C6
_02010B5C: .4byte 0x05000318

	thumb_func_start m4aSoundVSyncOn
m4aSoundVSyncOn: @ 0x02010B60
	push {r4, lr}
	ldr r0, _02010B90 @ =SOUND_INFO_PTR
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _02010B94 @ =0x68736D53
	cmp r3, r0
	beq _02010B88
	ldr r0, _02010B98 @ =0x040000C6
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_02010B88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02010B90: .4byte SOUND_INFO_PTR
_02010B94: .4byte 0x68736D53
_02010B98: .4byte 0x040000C6

	thumb_func_start MPlayOpen
MPlayOpen: @ 0x02010B9C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _02010C00
	cmp r4, #0x10
	bls _02010BB0
	movs r4, #0x10
_02010BB0:
	ldr r0, _02010C08 @ =SOUND_INFO_PTR
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _02010C0C @ =0x68736D53
	cmp r1, r0
	bne _02010C00
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl Clear64byte
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _02010BE4
	movs r1, #0
_02010BD6:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _02010BD6
_02010BE4:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02010BF4
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_02010BF4:
	str r7, [r5, #0x24]
	ldr r0, _02010C10 @ =sub_0200FE4C
	str r0, [r5, #0x20]
	ldr r0, _02010C0C @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_02010C00:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010C08: .4byte SOUND_INFO_PTR
_02010C0C: .4byte 0x68736D53
_02010C10: .4byte sub_0200FE4C

	thumb_func_start MPlayStart
MPlayStart: @ 0x02010C14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _02010CF4 @ =0x68736D53
	cmp r1, r0
	bne _02010CEA
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _02010C56
	ldr r0, [r5]
	cmp r0, #0
	beq _02010C40
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _02010C4C
_02010C40:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _02010C56
	cmp r1, #0
	blt _02010C56
_02010C4C:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _02010CEA
_02010C56:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _02010CB6
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _02010CD6
	mov r8, r6
_02010C8A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _02010CB6
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _02010C8A
_02010CB6:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _02010CD6
	movs r1, #0
	mov r8, r1
_02010CC0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _02010CC0
_02010CD6:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _02010CE6
	ldrb r0, [r7, #3]
	bl m4aSoundMode
_02010CE6:
	ldr r0, _02010CF4 @ =0x68736D53
	str r0, [r5, #0x34]
_02010CEA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010CF4: .4byte 0x68736D53

	thumb_func_start MPlayStop
MPlayStop: @ 0x02010CF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _02010D34 @ =0x68736D53
	cmp r1, r0
	bne _02010D2E
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _02010D2A
_02010D1A:
	adds r0, r6, #0
	adds r1, r5, #0
	bl TrackStop
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _02010D1A
_02010D2A:
	ldr r0, _02010D34 @ =0x68736D53
	str r0, [r6, #0x34]
_02010D2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010D34: .4byte 0x68736D53

	thumb_func_start FadeOutBody
FadeOutBody: @ 0x02010D38
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _02010DFA
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _02010D78 @ =0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _02010DFA
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02010D7C
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _02010DCE
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _02010DCE
	.align 2, 0
_02010D78: .4byte 0x0000FFFF
_02010D7C:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _02010DCE
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _02010DAE
_02010D92:
	adds r0, r6, #0
	adds r1, r4, #0
	bl TrackStop
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _02010DA6
	strb r0, [r4]
_02010DA6:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _02010D92
_02010DAE:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _02010DC2
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _02010DC6
_02010DC2:
	movs r0, #0x80
	lsls r0, r0, #0x18
_02010DC6:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _02010DFA
_02010DCE:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _02010DFA
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_02010DDC:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _02010DF2
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_02010DF2:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _02010DDC
_02010DFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TrkVolPitSet
TrkVolPitSet: @ 0x02010E00
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _02010E64
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _02010E28
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_02010E28:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _02010E3E
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_02010E3E:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02010E4A
	adds r1, r0, #0
	b _02010E50
_02010E4A:
	cmp r1, #0x7f
	ble _02010E50
	movs r1, #0x7f
_02010E50:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_02010E64:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _02010EA8
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _02010EA2
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_02010EA2:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_02010EA8:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MidiKeyToCgbFreq
MidiKeyToCgbFreq: @ 0x02010EB4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _02010EEC
	cmp r5, #0x14
	bhi _02010ED0
	movs r5, #0
	b _02010EDE
_02010ED0:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _02010EDE
	movs r5, #0x3b
_02010EDE:
	ldr r0, _02010EE8 @ =gNoiseTable
	adds r0, r5, r0
	ldrb r0, [r0]
	b _02010F4E
	.align 2, 0
_02010EE8: .4byte gNoiseTable
_02010EEC:
	cmp r5, #0x23
	bhi _02010EF8
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _02010F0A
_02010EF8:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _02010F0A
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_02010F0A:
	ldr r3, _02010F54 @ =gCgbScaleTable
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _02010F58 @ =gCgbFreqTable
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_02010F4E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02010F54: .4byte gCgbScaleTable
_02010F58: .4byte gCgbFreqTable

	thumb_func_start CgbOscOff
CgbOscOff: @ 0x02010F5C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _02010F84
	cmp r0, #2
	bgt _02010F70
	cmp r0, #1
	beq _02010F76
	b _02010F98
_02010F70:
	cmp r1, #3
	beq _02010F8C
	b _02010F98
_02010F76:
	ldr r1, _02010F80 @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _02010FA0
	.align 2, 0
_02010F80: .4byte 0x04000063
_02010F84:
	ldr r1, _02010F88 @ =0x04000069
	b _02010F9A
	.align 2, 0
_02010F88: .4byte 0x04000069
_02010F8C:
	ldr r1, _02010F94 @ =0x04000070
	movs r0, #0
	b _02010FA2
	.align 2, 0
_02010F94: .4byte 0x04000070
_02010F98:
	ldr r1, _02010FA8 @ =0x04000079
_02010F9A:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_02010FA0:
	movs r0, #0x80
_02010FA2:
	strb r0, [r1]
	bx lr
	.align 2, 0
_02010FA8: .4byte 0x04000079

	thumb_func_start CgbModVol
CgbModVol: @ 0x02010FAC
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _02010FCC
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _02010FD8
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _02010FE6
_02010FCC:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _02010FD8
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _02010FE6
_02010FD8:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _02010FF6
_02010FE6:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _02010FF8
	movs r0, #0xf
_02010FF6:
	strb r0, [r1, #0xa]
_02010FF8:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CgbSound
CgbSound: @ 0x02011014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _02011034 @ =SOUND_INFO_PTR
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _02011038
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _0201103E
	.align 2, 0
_02011034: .4byte SOUND_INFO_PTR
_02011038:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_0201103E:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_02011044:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _0201105A
	b _02011444
_0201105A:
	cmp r6, #2
	beq _0201108C
	cmp r6, #2
	bgt _02011068
	cmp r6, #1
	beq _0201106E
	b _020110C4
_02011068:
	cmp r6, #3
	beq _020110A4
	b _020110C4
_0201106E:
	ldr r0, _02011080 @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _02011084 @ =0x04000062
	ldr r2, _02011088 @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _020110D4
	.align 2, 0
_02011080: .4byte 0x04000060
_02011084: .4byte 0x04000062
_02011088: .4byte 0x04000063
_0201108C:
	ldr r0, _02011098 @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _0201109C @ =0x04000068
	ldr r2, _020110A0 @ =0x04000069
	b _020110CC
	.align 2, 0
_02011098: .4byte 0x04000061
_0201109C: .4byte 0x04000068
_020110A0: .4byte 0x04000069
_020110A4:
	ldr r0, _020110B8 @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _020110BC @ =0x04000072
	ldr r2, _020110C0 @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _020110D4
	.align 2, 0
_020110B8: .4byte 0x04000070
_020110BC: .4byte 0x04000072
_020110C0: .4byte 0x04000073
_020110C4:
	ldr r0, _02011124 @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _02011128 @ =0x04000078
	ldr r2, _0201112C @ =0x04000079
_020110CC:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_020110D4:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _020111CA
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _020111EE
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _0201113C
	cmp r6, #2
	bgt _02011130
	cmp r6, #1
	beq _02011136
	b _02011190
	.align 2, 0
_02011124: .4byte 0x04000071
_02011128: .4byte 0x04000078
_0201112C: .4byte 0x04000079
_02011130:
	cmp r6, #3
	beq _02011148
	b _02011190
_02011136:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_0201113C:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _0201119C
_02011148:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _02011170
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _02011184 @ =0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_02011170:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _02011188
	movs r0, #0xc0
	b _020111AA
	.align 2, 0
_02011184: .4byte 0x04000090
_02011188:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _020111AC
_02011190:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_0201119C:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _020111AA
	movs r0, #0x40
_020111AA:
	strb r0, [r4, #0x1a]
_020111AC:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _020111C6
	b _02011302
_020111C6:
	strb r2, [r4, #9]
	b _02011330
_020111CA:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _020111FC
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _020111EE
	b _02011342
_020111EE:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _02011440
_020111FC:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _0201123C
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0201123C
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0201126E
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _02011330
	ldrb r2, [r4, #7]
	mov r8, r2
	b _02011330
_0201123C:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _02011330
	cmp r6, #3
	bne _0201124E
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0201124E:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _020112A2
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0201129E
_0201126E:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _020111EE
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _02011342
	movs r2, #8
	mov r8, r2
	b _02011342
_0201129E:
	ldrb r0, [r4, #7]
	b _0201132E
_020112A2:
	cmp r0, #1
	bne _020112AE
_020112A6:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _0201132E
_020112AE:
	cmp r0, #2
	bne _020112F2
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _020112EE
_020112C6:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _020112D6
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _0201126E
_020112D6:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _020112A6
	movs r0, #8
	mov r8, r0
	b _020112A6
_020112EE:
	ldrb r0, [r4, #5]
	b _0201132E
_020112F2:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _0201132C
_02011302:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _020112C6
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _02011330
	ldrb r2, [r4, #5]
	mov r8, r2
	b _02011330
_0201132C:
	ldrb r0, [r4, #4]
_0201132E:
	strb r0, [r4, #0xb]
_02011330:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _02011342
	subs r0, #1
	str r0, [sp]
	b _0201123C
_02011342:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _020113BA
	cmp r6, #3
	bgt _02011382
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _02011382
	ldr r0, _0201136C @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _02011374
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _02011370 @ =0x000007FC
	b _0201137E
	.align 2, 0
_0201136C: .4byte 0x04000089
_02011370: .4byte 0x000007FC
_02011374:
	cmp r0, #0x7f
	bgt _02011382
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _02011390 @ =0x000007FE
_0201137E:
	ands r0, r1
	str r0, [r4, #0x20]
_02011382:
	cmp r6, #4
	beq _02011394
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _020113A2
	.align 2, 0
_02011390: .4byte 0x000007FE
_02011394:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_020113A2:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_020113BA:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _02011440
	ldr r1, _02011404 @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _0201140C
	ldr r0, _02011408 @ =gCgb3Vol
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _02011440
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _02011440
	.align 2, 0
_02011404: .4byte 0x04000081
_02011408: .4byte gCgb3Vol
_0201140C:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _02011440
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _02011440
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_02011440:
	movs r0, #0
	strb r0, [r4, #0x1d]
_02011444:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _0201144E
	b _02011044
_0201144E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayTempoControl
m4aMPlayTempoControl: @ 0x02011460
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _02011484 @ =0x68736D53
	cmp r3, r0
	bne _0201147C
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_0201147C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02011484: .4byte 0x68736D53

	thumb_func_start m4aMPlayVolumeControl
m4aMPlayVolumeControl: @ 0x02011488
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _020114EC @ =0x68736D53
	cmp r3, r0
	bne _020114E0
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _020114DC
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_020114B8:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _020114D2
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _020114D2
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_020114D2:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _020114B8
_020114DC:
	ldr r0, _020114EC @ =0x68736D53
	str r0, [r4, #0x34]
_020114E0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020114EC: .4byte 0x68736D53

	thumb_func_start m4aMPlayPitchControl
m4aMPlayPitchControl: @ 0x020114F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _02011560 @ =0x68736D53
	cmp r3, r0
	bne _02011552
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r3, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _0201154E
	movs r0, #0x80
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xc
	mov r8, r0
_02011528:
	mov r0, ip
	ands r0, r5
	cmp r0, #0
	beq _02011544
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _02011544
	strb r7, [r3, #0xb]
	strb r6, [r3, #0xd]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_02011544:
	subs r2, #1
	adds r3, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _02011528
_0201154E:
	ldr r0, _02011560 @ =0x68736D53
	str r0, [r4, #0x34]
_02011552:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011560: .4byte 0x68736D53

	thumb_func_start m4aMPlayPanpotControl
m4aMPlayPanpotControl: @ 0x02011564
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _020115C8 @ =0x68736D53
	cmp r3, r0
	bne _020115BC
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _020115B8
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_02011594:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _020115AE
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _020115AE
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_020115AE:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _02011594
_020115B8:
	ldr r0, _020115C8 @ =0x68736D53
	str r0, [r4, #0x34]
_020115BC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020115C8: .4byte 0x68736D53

	thumb_func_start ClearModM
ClearModM: @ 0x020115CC
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _020115E0
	movs r0, #0xc
	b _020115E2
_020115E0:
	movs r0, #3
_020115E2:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start m4aMPlayModDepthSet
m4aMPlayModDepthSet: @ 0x020115EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _0201165C @ =0x68736D53
	cmp r1, r0
	bne _0201164C
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _02011648
	mov sb, r8
_0201161C:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0201163E
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0201163E
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _0201163E
	adds r0, r4, #0
	bl ClearModM
_0201163E:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _0201161C
_02011648:
	ldr r0, _0201165C @ =0x68736D53
	str r0, [r6, #0x34]
_0201164C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0201165C: .4byte 0x68736D53

	thumb_func_start m4aMPlayLFOSpeedSet
m4aMPlayLFOSpeedSet: @ 0x02011660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _020116D0 @ =0x68736D53
	cmp r1, r0
	bne _020116C0
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _020116BC
	mov sb, r8
_02011690:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _020116B2
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _020116B2
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _020116B2
	adds r0, r4, #0
	bl ClearModM
_020116B2:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _02011690
_020116BC:
	ldr r0, _020116D0 @ =0x68736D53
	str r0, [r6, #0x34]
_020116C0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020116D0: .4byte 0x68736D53

	thumb_func_start ply_memacc
ply_memacc: @ 0x020116D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _020116F8
	b _02011826
_020116F8:
	lsls r0, r5, #2
	ldr r1, _02011704 @ =_02011708
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02011704: .4byte _02011708
_02011708: @ jump table
	.4byte _02011750 @ case 0
	.4byte _02011754 @ case 1
	.4byte _0201175C @ case 2
	.4byte _02011764 @ case 3
	.4byte _0201176E @ case 4
	.4byte _0201177C @ case 5
	.4byte _0201178A @ case 6
	.4byte _02011792 @ case 7
	.4byte _0201179A @ case 8
	.4byte _020117A2 @ case 9
	.4byte _020117AA @ case 10
	.4byte _020117B2 @ case 11
	.4byte _020117BA @ case 12
	.4byte _020117C8 @ case 13
	.4byte _020117D6 @ case 14
	.4byte _020117E4 @ case 15
	.4byte _020117F2 @ case 16
	.4byte _02011800 @ case 17
_02011750:
	strb r2, [r3]
	b _02011826
_02011754:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _02011826
_0201175C:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _02011826
_02011764:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _02011826
_0201176E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _02011826
_0201177C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _02011826
_0201178A:
	ldrb r3, [r3]
	cmp r3, r2
	beq _0201180C
	b _02011820
_02011792:
	ldrb r3, [r3]
	cmp r3, r2
	bne _0201180C
	b _02011820
_0201179A:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _0201180C
	b _02011820
_020117A2:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _0201180C
	b _02011820
_020117AA:
	ldrb r3, [r3]
	cmp r3, r2
	bls _0201180C
	b _02011820
_020117B2:
	ldrb r3, [r3]
	cmp r3, r2
	blo _0201180C
	b _02011820
_020117BA:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _0201180C
	b _02011820
_020117C8:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _0201180C
	b _02011820
_020117D6:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _0201180C
	b _02011820
_020117E4:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0201180C
	b _02011820
_020117F2:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _0201180C
	b _02011820
_02011800:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _02011820
_0201180C:
	ldr r0, _0201181C @ =gUnknown_03006234
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _02011826
	.align 2, 0
_0201181C: .4byte gUnknown_03006234
_02011820:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_02011826:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ply_xcmd
ply_xcmd: @ 0x0201182C
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _02011848 @ =gUnknown_02019D00
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_02011848: .4byte gUnknown_02019D00

	thumb_func_start ply_xxx
ply_xxx: @ 0x0201184C
	push {lr}
	ldr r2, _0201185C @ =gMPlayJumpTable
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0201185C: .4byte gMPlayJumpTable

	thumb_func_start ply_xwave
ply_xwave: @ 0x02011860
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _02011898 @ =0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _0201189C @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _020118A0 @ =0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _020118A4 @ =0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02011898: .4byte 0xFFFFFF00
_0201189C: .4byte 0xFFFF00FF
_020118A0: .4byte 0xFF00FFFF
_020118A4: .4byte 0x00FFFFFF

	thumb_func_start ply_xtype
ply_xtype: @ 0x020118A8
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xatta
ply_xatta: @ 0x020118BC
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xdeca
ply_xdeca: @ 0x020118D0
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xsust
ply_xsust: @ 0x020118E4
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xrele
ply_xrele: @ 0x020118F8
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xiecv
ply_xiecv: @ 0x0201190C
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start ply_xiecl
ply_xiecl: @ 0x02011918
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start ply_xleng
ply_xleng: @ 0x02011924
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start ply_xswee
ply_xswee: @ 0x02011938
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_0201194C
sub_0201194C: @ 0x0201194C
	bx lr
	.align 2, 0
