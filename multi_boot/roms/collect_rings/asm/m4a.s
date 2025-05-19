.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm


	thumb_func_start MidiKeyToFreq
MidiKeyToFreq: @ 0x02013714
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _02013728
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_02013728:
	ldr r3, _02013770 @ =gScaleTable
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _02013774 @ =gFreqTable
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
_02013770: .4byte gScaleTable
_02013774: .4byte gFreqTable
UnusedFunc:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start MPlayContinue
MPlayContinue: @ 0x0201377C
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _02013790 @ =0x68736D53
	cmp r3, r0
	bne _0201378E
	ldr r0, [r2, #4]
	ldr r1, _02013794 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_0201378E:
	bx lr
	.align 2, 0
_02013790: .4byte 0x68736D53
_02013794: .4byte 0x7FFFFFFF

	thumb_func_start MPlayFadeOut
MPlayFadeOut: @ 0x02013798
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _020137B4 @ =0x68736D53
	cmp r3, r0
	bne _020137B0
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_020137B0:
	bx lr
	.align 2, 0
_020137B4: .4byte 0x68736D53

	thumb_func_start m4aSoundInit
m4aSoundInit: @ 0x020137B8
	push {r4, r5, r6, lr}
	ldr r0, _0201380C @ =SoundMainRAM
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _02013810 @ =SoundMainRAM_Buffer
	ldr r2, _02013814 @ =0x04000100
	bl CpuSet
	ldr r0, _02013818 @ =gSoundInfo
	bl SoundInit
	ldr r0, _0201381C @ =gCgbChans
	bl MPlayExtender
	ldr r0, _02013820 @ =0x0092F400
	bl m4aSoundMode
	ldr r0, _02013824 @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _02013806
	ldr r5, _02013828 @ =gMPlayTable
	adds r6, r0, #0
_020137EA:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl MPlayOpen
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _0201382C @ =gMPlayMemAccArea
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _020137EA
_02013806:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0201380C: .4byte SoundMainRAM
_02013810: .4byte SoundMainRAM_Buffer
_02013814: .4byte 0x04000100
_02013818: .4byte gSoundInfo
_0201381C: .4byte gCgbChans
_02013820: .4byte 0x0092F400
_02013824: .4byte 0x00000004
_02013828: .4byte gMPlayTable
_0201382C: .4byte gMPlayMemAccArea

	thumb_func_start m4aSoundMain
m4aSoundMain: @ 0x02013830
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aSongNumStart
m4aSongNumStart: @ 0x0201383C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02013860 @ =gMPlayTable
	ldr r1, _02013864 @ =gUnknown_02016D8C
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
_02013860: .4byte gMPlayTable
_02013864: .4byte gUnknown_02016D8C

	thumb_func_start m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 0x02013868
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02013894 @ =gMPlayTable
	ldr r1, _02013898 @ =gUnknown_02016D8C
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
	beq _0201389C
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _020138B0
	.align 2, 0
_02013894: .4byte gMPlayTable
_02013898: .4byte gUnknown_02016D8C
_0201389C:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _020138A8
	cmp r2, #0
	bge _020138B0
_020138A8:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
_020138B0:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 0x020138B4
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _020138E0 @ =gMPlayTable
	ldr r1, _020138E4 @ =gUnknown_02016D8C
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
	beq _020138E8
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _02013904
	.align 2, 0
_020138E0: .4byte gMPlayTable
_020138E4: .4byte gUnknown_02016D8C
_020138E8:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _020138FA
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
	b _02013904
_020138FA:
	cmp r2, #0
	bge _02013904
	adds r0, r1, #0
	bl MPlayContinue
_02013904:
	pop {r0}
	bx r0

	thumb_func_start m4aSongNumStop
m4aSongNumStop: @ 0x02013908
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02013934 @ =gMPlayTable
	ldr r1, _02013938 @ =gUnknown_02016D8C
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
	bne _0201392E
	adds r0, r2, #0
	bl MPlayStop
_0201392E:
	pop {r0}
	bx r0
	.align 2, 0
_02013934: .4byte gMPlayTable
_02013938: .4byte gUnknown_02016D8C

	thumb_func_start m4aSongNumContinue
m4aSongNumContinue: @ 0x0201393C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _02013968 @ =gMPlayTable
	ldr r1, _0201396C @ =gUnknown_02016D8C
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
	bne _02013962
	adds r0, r2, #0
	bl MPlayContinue
_02013962:
	pop {r0}
	bx r0
	.align 2, 0
_02013968: .4byte gMPlayTable
_0201396C: .4byte gUnknown_02016D8C

	thumb_func_start m4aMPlayAllStop
m4aMPlayAllStop: @ 0x02013970
	push {r4, r5, lr}
	ldr r0, _02013994 @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0201398E
	ldr r5, _02013998 @ =gMPlayTable
	adds r4, r0, #0
_02013980:
	ldr r0, [r5]
	bl MPlayStop
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _02013980
_0201398E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02013994: .4byte 0x00000004
_02013998: .4byte gMPlayTable

	thumb_func_start m4aMPlayContinue
m4aMPlayContinue: @ 0x0201399C
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayAllContinue
m4aMPlayAllContinue: @ 0x020139A8
	push {r4, r5, lr}
	ldr r0, _020139CC @ =0x00000004
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _020139C6
	ldr r5, _020139D0 @ =gMPlayTable
	adds r4, r0, #0
_020139B8:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _020139B8
_020139C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020139CC: .4byte 0x00000004
_020139D0: .4byte gMPlayTable

	thumb_func_start m4aMPlayFadeOut
m4aMPlayFadeOut: @ 0x020139D4
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start m4aMPlayFadeOutTemporarily
m4aMPlayFadeOutTemporarily: @ 0x020139E4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _020139FC @ =0x68736D53
	cmp r3, r0
	bne _020139FA
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _02013A00 @ =0x00000101
	strh r0, [r2, #0x28]
_020139FA:
	bx lr
	.align 2, 0
_020139FC: .4byte 0x68736D53
_02013A00: .4byte 0x00000101

	thumb_func_start m4aMPlayFadeIn
m4aMPlayFadeIn: @ 0x02013A04
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _02013A24 @ =0x68736D53
	cmp r3, r0
	bne _02013A22
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _02013A28 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_02013A22:
	bx lr
	.align 2, 0
_02013A24: .4byte 0x68736D53
_02013A28: .4byte 0x7FFFFFFF

	thumb_func_start m4aMPlayImmInit
m4aMPlayImmInit: @ 0x02013A2C
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _02013A6E
	movs r7, #0x80
_02013A38:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _02013A66
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _02013A66
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
_02013A66:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _02013A38
_02013A6E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MPlayExtender
MPlayExtender: @ 0x02013A74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _02013B3C @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _02013B40 @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _02013B44 @ =0x04000063
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
	ldr r0, _02013B48 @ =gUnknown_03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _02013B4C @ =0x68736D53
	cmp r6, r0
	bne _02013B34
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _02013B50 @ =gMPlayJumpTable
	ldr r0, _02013B54 @ =MP2K_event_memacc
	str r0, [r1, #0x20]
	ldr r0, _02013B58 @ =MP2K_event_mod
	str r0, [r1, #0x44]
	ldr r0, _02013B5C @ =sub_02013700
	str r0, [r1, #0x4c]
	ldr r0, _02013B60 @ =MP2K_event_xcmd
	str r0, [r1, #0x70]
	ldr r0, _02013B64 @ =MP2K_event_endtie
	str r0, [r1, #0x74]
	ldr r0, _02013B68 @ =SampleFreqSet
	str r0, [r1, #0x78]
	ldr r0, _02013B6C @ =sub_02013410
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _02013B70 @ =FadeOutBody
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _02013B74 @ =TrkVolPitSet
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _02013B78 @ =CgbSound
	str r0, [r4, #0x28]
	ldr r0, _02013B7C @ =CgbOscOff
	str r0, [r4, #0x2c]
	ldr r0, _02013B80 @ =MidiKeyToCgbFreq
	str r0, [r4, #0x30]
	ldr r0, _02013B84 @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _02013B88 @ =0x05000040
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
_02013B34:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02013B3C: .4byte 0x04000084
_02013B40: .4byte 0x04000080
_02013B44: .4byte 0x04000063
_02013B48: .4byte gUnknown_03007FF0
_02013B4C: .4byte 0x68736D53
_02013B50: .4byte gMPlayJumpTable
_02013B54: .4byte MP2K_event_memacc
_02013B58: .4byte MP2K_event_mod
_02013B5C: .4byte sub_02013700
_02013B60: .4byte MP2K_event_xcmd
_02013B64: .4byte MP2K_event_endtie
_02013B68: .4byte SampleFreqSet
_02013B6C: .4byte sub_02013410
_02013B70: .4byte FadeOutBody
_02013B74: .4byte TrkVolPitSet
_02013B78: .4byte CgbSound
_02013B7C: .4byte CgbOscOff
_02013B80: .4byte MidiKeyToCgbFreq
_02013B84: .4byte 0x00000000
_02013B88: .4byte 0x05000040
MusicPlayerJumpTableCopy:
	.byte 0x2A, 0xDF, 0x70, 0x47

	thumb_func_start ClearChain
ClearChain: @ 0x02013B90
	push {lr}
	ldr r1, _02013BA0 @ =gMPlayJumpTable + (0x4 * 34)
	ldr r1, [r1]
	bl sub_02014CCC
	pop {r0}
	bx r0
	.align 2, 0
_02013BA0: .4byte gMPlayJumpTable + (0x4 * 34)

	thumb_func_start Clear64byte
Clear64byte: @ 0x02013BA4
	push {lr}
	ldr r1, _02013BB4 @ =gMPlayJumpTable + (0x4 * 35)
	ldr r1, [r1]
	bl sub_02014CCC
	pop {r0}
	bx r0
	.align 2, 0
_02013BB4: .4byte gMPlayJumpTable + (0x4 * 35)

	thumb_func_start SoundInit
SoundInit: @ 0x02013BB8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _02013C70 @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _02013BD4
	ldr r0, _02013C74 @ =0x84400004
	str r0, [r1]
_02013BD4:
	ldr r1, _02013C78 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _02013BE2
	ldr r0, _02013C74 @ =0x84400004
	str r0, [r1]
_02013BE2:
	ldr r0, _02013C7C @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _02013C80 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _02013C84 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _02013C88 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _02013C8C @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _02013C90 @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _02013C94 @ =0x040000A4
	str r0, [r1]
	ldr r0, _02013C98 @ =gUnknown_03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _02013C9C @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _02013CA0 @ =sub_02013484
	str r0, [r5, #0x38]
	ldr r0, _02013CA4 @ =0x02014CA9
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _02013CA8 @ =gMPlayJumpTable
	adds r0, r4, #0
	bl sub_02012F98
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl SampleFreqSet
	ldr r0, _02013CAC @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02013C70: .4byte 0x040000C4
_02013C74: .4byte 0x84400004
_02013C78: .4byte 0x040000D0
_02013C7C: .4byte 0x040000C6
_02013C80: .4byte 0x04000084
_02013C84: .4byte 0x0000A90E
_02013C88: .4byte 0x04000089
_02013C8C: .4byte 0x040000BC
_02013C90: .4byte 0x040000A0
_02013C94: .4byte 0x040000A4
_02013C98: .4byte gUnknown_03007FF0
_02013C9C: .4byte 0x050003EC
_02013CA0: .4byte sub_02013484
_02013CA4: .4byte 0x02014CA9
_02013CA8: .4byte gMPlayJumpTable
_02013CAC: .4byte 0x68736D53

	thumb_func_start SampleFreqSet
SampleFreqSet: @ 0x02013CB0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _02013D30 @ =gUnknown_03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _02013D34 @ =gUnknown_02015FE0
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl sub_02014D04
	strb r0, [r4, #0xb]
	ldr r0, _02013D38 @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _02013D3C @ =0x00001388
	adds r0, r0, r1
	ldr r1, _02013D40 @ =0x00002710
	bl sub_02014D04
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl sub_02014D04
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _02013D44 @ =0x04000102
	strh r6, [r0]
	ldr r4, _02013D48 @ =0x04000100
	ldr r0, _02013D4C @ =0x00044940
	adds r1, r5, #0
	bl sub_02014D04
	rsbs r0, r0, #0
	strh r0, [r4]
	bl m4aSoundVSyncOn
	ldr r1, _02013D50 @ =0x04000006
_02013D14:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _02013D14
	ldr r1, _02013D50 @ =0x04000006
_02013D1C:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _02013D1C
	ldr r1, _02013D44 @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02013D30: .4byte gUnknown_03007FF0
_02013D34: .4byte gUnknown_02015FE0
_02013D38: .4byte 0x00091D1B
_02013D3C: .4byte 0x00001388
_02013D40: .4byte 0x00002710
_02013D44: .4byte 0x04000102
_02013D48: .4byte 0x04000100
_02013D4C: .4byte 0x00044940
_02013D50: .4byte 0x04000006

	thumb_func_start m4aSoundMode
m4aSoundMode: @ 0x02013D54
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _02013DE0 @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _02013DE4 @ =0x68736D53
	cmp r1, r0
	bne _02013DDA
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _02013D76
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_02013D76:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _02013D96
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_02013D8C:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _02013D8C
_02013D96:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _02013DA4
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_02013DA4:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _02013DC2
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _02013DE8 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_02013DC2:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _02013DD6
	bl m4aSoundVSyncOff
	adds r0, r4, #0
	bl SampleFreqSet
_02013DD6:
	ldr r0, _02013DE4 @ =0x68736D53
	str r0, [r5]
_02013DDA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02013DE0: .4byte gUnknown_03007FF0
_02013DE4: .4byte 0x68736D53
_02013DE8: .4byte 0x04000089

	thumb_func_start SoundClear
SoundClear: @ 0x02013DEC
	push {r4, r5, r6, r7, lr}
	ldr r0, _02013E38 @ =gUnknown_03007FF0
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _02013E3C @ =0x68736D53
	cmp r1, r0
	bne _02013E32
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_02013E06:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _02013E06
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _02013E2E
	movs r5, #1
	movs r7, #0
_02013E1A:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl sub_02014CCC
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _02013E1A
_02013E2E:
	ldr r0, _02013E3C @ =0x68736D53
	str r0, [r6]
_02013E32:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02013E38: .4byte gUnknown_03007FF0
_02013E3C: .4byte 0x68736D53

	thumb_func_start m4aSoundVSyncOff
m4aSoundVSyncOff: @ 0x02013E40
	push {lr}
	sub sp, #4
	ldr r0, _02013EA0 @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _02013EA4 @ =0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _02013E98
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _02013EA8 @ =0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _02013E6A
	ldr r0, _02013EAC @ =0x84400004
	str r0, [r1]
_02013E6A:
	ldr r1, _02013EB0 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _02013E78
	ldr r0, _02013EAC @ =0x84400004
	str r0, [r1]
_02013E78:
	ldr r0, _02013EB4 @ =0x040000C6
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
	ldr r2, _02013EB8 @ =0x05000318
	mov r0, sp
	bl CpuSet
_02013E98:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02013EA0: .4byte gUnknown_03007FF0
_02013EA4: .4byte 0x978C92AD
_02013EA8: .4byte 0x040000C4
_02013EAC: .4byte 0x84400004
_02013EB0: .4byte 0x040000D0
_02013EB4: .4byte 0x040000C6
_02013EB8: .4byte 0x05000318

	thumb_func_start m4aSoundVSyncOn
m4aSoundVSyncOn: @ 0x02013EBC
	push {r4, lr}
	ldr r0, _02013EEC @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _02013EF0 @ =0x68736D53
	cmp r3, r0
	beq _02013EE4
	ldr r0, _02013EF4 @ =0x040000C6
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
_02013EE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02013EEC: .4byte gUnknown_03007FF0
_02013EF0: .4byte 0x68736D53
_02013EF4: .4byte 0x040000C6

	thumb_func_start MPlayOpen
MPlayOpen: @ 0x02013EF8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _02013F5C
	cmp r4, #0x10
	bls _02013F0C
	movs r4, #0x10
_02013F0C:
	ldr r0, _02013F64 @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _02013F68 @ =0x68736D53
	cmp r1, r0
	bne _02013F5C
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
	beq _02013F40
	movs r1, #0
_02013F32:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _02013F32
_02013F40:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02013F50
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_02013F50:
	str r7, [r5, #0x24]
	ldr r0, _02013F6C @ =sub_020131A8
	str r0, [r5, #0x20]
	ldr r0, _02013F68 @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_02013F5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02013F64: .4byte gUnknown_03007FF0
_02013F68: .4byte 0x68736D53
_02013F6C: .4byte sub_020131A8

	thumb_func_start MPlayStart
MPlayStart: @ 0x02013F70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _02014050 @ =0x68736D53
	cmp r1, r0
	bne _02014046
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _02013FB2
	ldr r0, [r5]
	cmp r0, #0
	beq _02013F9C
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _02013FA8
_02013F9C:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _02013FB2
	cmp r1, #0
	blt _02013FB2
_02013FA8:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _02014046
_02013FB2:
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
	bge _02014012
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _02014032
	mov r8, r6
_02013FE6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02013410
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
	bge _02014012
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _02013FE6
_02014012:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _02014032
	movs r1, #0
	mov r8, r1
_0201401C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02013410
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _0201401C
_02014032:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _02014042
	ldrb r0, [r7, #3]
	bl m4aSoundMode
_02014042:
	ldr r0, _02014050 @ =0x68736D53
	str r0, [r5, #0x34]
_02014046:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02014050: .4byte 0x68736D53

	thumb_func_start MPlayStop
MPlayStop: @ 0x02014054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _02014090 @ =0x68736D53
	cmp r1, r0
	bne _0201408A
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
	ble _02014086
_02014076:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_02013410
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _02014076
_02014086:
	ldr r0, _02014090 @ =0x68736D53
	str r0, [r6, #0x34]
_0201408A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02014090: .4byte 0x68736D53

	thumb_func_start FadeOutBody
FadeOutBody: @ 0x02014094
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _02014156
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _020140D4 @ =0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _02014156
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _020140D8
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _0201412A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _0201412A
	.align 2, 0
_020140D4: .4byte 0x0000FFFF
_020140D8:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0201412A
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _0201410A
_020140EE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_02013410
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _02014102
	strb r0, [r4]
_02014102:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _020140EE
_0201410A:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _0201411E
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _02014122
_0201411E:
	movs r0, #0x80
	lsls r0, r0, #0x18
_02014122:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _02014156
_0201412A:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _02014156
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_02014138:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0201414E
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_0201414E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _02014138
_02014156:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TrkVolPitSet
TrkVolPitSet: @ 0x0201415C
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _020141C0
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _02014184
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_02014184:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _0201419A
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_0201419A:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _020141A6
	adds r1, r0, #0
	b _020141AC
_020141A6:
	cmp r1, #0x7f
	ble _020141AC
	movs r1, #0x7f
_020141AC:
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
_020141C0:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _02014204
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
	bne _020141FE
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_020141FE:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_02014204:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MidiKeyToCgbFreq
MidiKeyToCgbFreq: @ 0x02014210
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _02014248
	cmp r5, #0x14
	bhi _0201422C
	movs r5, #0
	b _0201423A
_0201422C:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _0201423A
	movs r5, #0x3b
_0201423A:
	ldr r0, _02014244 @ =gUnknown_02016094
	adds r0, r5, r0
	ldrb r0, [r0]
	b _020142AA
	.align 2, 0
_02014244: .4byte gUnknown_02016094
_02014248:
	cmp r5, #0x23
	bhi _02014254
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _02014266
_02014254:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _02014266
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_02014266:
	ldr r3, _020142B0 @ =gUnknown_02015FF8
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _020142B4 @ =gUnknown_0201607C
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
_020142AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_020142B0: .4byte gUnknown_02015FF8
_020142B4: .4byte gUnknown_0201607C

	thumb_func_start CgbOscOff
CgbOscOff: @ 0x020142B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _020142E0
	cmp r0, #2
	bgt _020142CC
	cmp r0, #1
	beq _020142D2
	b _020142F4
_020142CC:
	cmp r1, #3
	beq _020142E8
	b _020142F4
_020142D2:
	ldr r1, _020142DC @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _020142FC
	.align 2, 0
_020142DC: .4byte 0x04000063
_020142E0:
	ldr r1, _020142E4 @ =0x04000069
	b _020142F6
	.align 2, 0
_020142E4: .4byte 0x04000069
_020142E8:
	ldr r1, _020142F0 @ =0x04000070
	movs r0, #0
	b _020142FE
	.align 2, 0
_020142F0: .4byte 0x04000070
_020142F4:
	ldr r1, _02014304 @ =0x04000079
_020142F6:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_020142FC:
	movs r0, #0x80
_020142FE:
	strb r0, [r1]
	bx lr
	.align 2, 0
_02014304: .4byte 0x04000079

	thumb_func_start CgbModVol
CgbModVol: @ 0x02014308
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _02014328
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _02014334
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _02014342
_02014328:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _02014334
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _02014342
_02014334:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _02014352
_02014342:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _02014354
	movs r0, #0xf
_02014352:
	strb r0, [r1, #0xa]
_02014354:
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
CgbSound: @ 0x02014370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _02014390 @ =gUnknown_03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _02014394
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _0201439A
	.align 2, 0
_02014390: .4byte gUnknown_03007FF0
_02014394:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_0201439A:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_020143A0:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _020143B6
	b _020147A0
_020143B6:
	cmp r6, #2
	beq _020143E8
	cmp r6, #2
	bgt _020143C4
	cmp r6, #1
	beq _020143CA
	b _02014420
_020143C4:
	cmp r6, #3
	beq _02014400
	b _02014420
_020143CA:
	ldr r0, _020143DC @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _020143E0 @ =0x04000062
	ldr r2, _020143E4 @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _02014430
	.align 2, 0
_020143DC: .4byte 0x04000060
_020143E0: .4byte 0x04000062
_020143E4: .4byte 0x04000063
_020143E8:
	ldr r0, _020143F4 @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _020143F8 @ =0x04000068
	ldr r2, _020143FC @ =0x04000069
	b _02014428
	.align 2, 0
_020143F4: .4byte 0x04000061
_020143F8: .4byte 0x04000068
_020143FC: .4byte 0x04000069
_02014400:
	ldr r0, _02014414 @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _02014418 @ =0x04000072
	ldr r2, _0201441C @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _02014430
	.align 2, 0
_02014414: .4byte 0x04000070
_02014418: .4byte 0x04000072
_0201441C: .4byte 0x04000073
_02014420:
	ldr r0, _02014480 @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _02014484 @ =0x04000078
	ldr r2, _02014488 @ =0x04000079
_02014428:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_02014430:
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
	beq _02014526
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
	bne _0201454A
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _02014498
	cmp r6, #2
	bgt _0201448C
	cmp r6, #1
	beq _02014492
	b _020144EC
	.align 2, 0
_02014480: .4byte 0x04000071
_02014484: .4byte 0x04000078
_02014488: .4byte 0x04000079
_0201448C:
	cmp r6, #3
	beq _020144A4
	b _020144EC
_02014492:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_02014498:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _020144F8
_020144A4:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _020144CC
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _020144E0 @ =0x04000090
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
_020144CC:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _020144E4
	movs r0, #0xc0
	b _02014506
	.align 2, 0
_020144E0: .4byte 0x04000090
_020144E4:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _02014508
_020144EC:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_020144F8:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _02014506
	movs r0, #0x40
_02014506:
	strb r0, [r4, #0x1a]
_02014508:
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
	bne _02014522
	b _0201465E
_02014522:
	strb r2, [r4, #9]
	b _0201468C
_02014526:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _02014558
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
	ble _0201454A
	b _0201469E
_0201454A:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _0201479C
_02014558:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _02014598
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _02014598
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _020145CA
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0201468C
	ldrb r2, [r4, #7]
	mov r8, r2
	b _0201468C
_02014598:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0201468C
	cmp r6, #3
	bne _020145AA
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_020145AA:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _020145FE
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _020145FA
_020145CA:
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
	beq _0201454A
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0201469E
	movs r2, #8
	mov r8, r2
	b _0201469E
_020145FA:
	ldrb r0, [r4, #7]
	b _0201468A
_020145FE:
	cmp r0, #1
	bne _0201460A
_02014602:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _0201468A
_0201460A:
	cmp r0, #2
	bne _0201464E
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _0201464A
_02014622:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _02014632
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _020145CA
_02014632:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _02014602
	movs r0, #8
	mov r8, r0
	b _02014602
_0201464A:
	ldrb r0, [r4, #5]
	b _0201468A
_0201464E:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _02014688
_0201465E:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _02014622
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _0201468C
	ldrb r2, [r4, #5]
	mov r8, r2
	b _0201468C
_02014688:
	ldrb r0, [r4, #4]
_0201468A:
	strb r0, [r4, #0xb]
_0201468C:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _0201469E
	subs r0, #1
	str r0, [sp]
	b _02014598
_0201469E:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _02014716
	cmp r6, #3
	bgt _020146DE
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _020146DE
	ldr r0, _020146C8 @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _020146D0
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _020146CC @ =0x000007FC
	b _020146DA
	.align 2, 0
_020146C8: .4byte 0x04000089
_020146CC: .4byte 0x000007FC
_020146D0:
	cmp r0, #0x7f
	bgt _020146DE
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _020146EC @ =0x000007FE
_020146DA:
	ands r0, r1
	str r0, [r4, #0x20]
_020146DE:
	cmp r6, #4
	beq _020146F0
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _020146FE
	.align 2, 0
_020146EC: .4byte 0x000007FE
_020146F0:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_020146FE:
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
_02014716:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _0201479C
	ldr r1, _02014760 @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _02014768
	ldr r0, _02014764 @ =gUnknown_020160D0
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
	beq _0201479C
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _0201479C
	.align 2, 0
_02014760: .4byte 0x04000081
_02014764: .4byte gUnknown_020160D0
_02014768:
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
	bne _0201479C
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0201479C
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_0201479C:
	movs r0, #0
	strb r0, [r4, #0x1d]
_020147A0:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _020147AA
	b _020143A0
_020147AA:
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
m4aMPlayTempoControl: @ 0x020147BC
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _020147E0 @ =0x68736D53
	cmp r3, r0
	bne _020147D8
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_020147D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020147E0: .4byte 0x68736D53

	thumb_func_start m4aMPlayVolumeControl
m4aMPlayVolumeControl: @ 0x020147E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _02014848 @ =0x68736D53
	cmp r3, r0
	bne _0201483C
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _02014838
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_02014814:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _0201482E
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _0201482E
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_0201482E:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _02014814
_02014838:
	ldr r0, _02014848 @ =0x68736D53
	str r0, [r4, #0x34]
_0201483C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02014848: .4byte 0x68736D53

	thumb_func_start m4aMPlayPitchControl
m4aMPlayPitchControl: @ 0x0201484C
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
	ldr r0, _020148BC @ =0x68736D53
	cmp r3, r0
	bne _020148AE
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r3, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _020148AA
	movs r0, #0x80
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xc
	mov r8, r0
_02014884:
	mov r0, ip
	ands r0, r5
	cmp r0, #0
	beq _020148A0
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _020148A0
	strb r7, [r3, #0xb]
	strb r6, [r3, #0xd]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_020148A0:
	subs r2, #1
	adds r3, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _02014884
_020148AA:
	ldr r0, _020148BC @ =0x68736D53
	str r0, [r4, #0x34]
_020148AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020148BC: .4byte 0x68736D53

	thumb_func_start m4aMPlayPanpotControl
m4aMPlayPanpotControl: @ 0x020148C0
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
	ldr r0, _02014924 @ =0x68736D53
	cmp r3, r0
	bne _02014918
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _02014914
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_020148F0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _0201490A
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _0201490A
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_0201490A:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _020148F0
_02014914:
	ldr r0, _02014924 @ =0x68736D53
	str r0, [r4, #0x34]
_02014918:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02014924: .4byte 0x68736D53

	thumb_func_start ClearModM
ClearModM: @ 0x02014928
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _0201493C
	movs r0, #0xc
	b _0201493E
_0201493C:
	movs r0, #3
_0201493E:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start m4aMPlayModDepthSet
m4aMPlayModDepthSet: @ 0x02014948
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
	ldr r0, _020149B8 @ =0x68736D53
	cmp r1, r0
	bne _020149A8
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _020149A4
	mov sb, r8
_02014978:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0201499A
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0201499A
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _0201499A
	adds r0, r4, #0
	bl ClearModM
_0201499A:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _02014978
_020149A4:
	ldr r0, _020149B8 @ =0x68736D53
	str r0, [r6, #0x34]
_020149A8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020149B8: .4byte 0x68736D53

	thumb_func_start m4aMPlayLFOSpeedSet
m4aMPlayLFOSpeedSet: @ 0x020149BC
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
	ldr r0, _02014A2C @ =0x68736D53
	cmp r1, r0
	bne _02014A1C
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _02014A18
	mov sb, r8
_020149EC:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _02014A0E
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _02014A0E
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _02014A0E
	adds r0, r4, #0
	bl ClearModM
_02014A0E:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _020149EC
_02014A18:
	ldr r0, _02014A2C @ =0x68736D53
	str r0, [r6, #0x34]
_02014A1C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02014A2C: .4byte 0x68736D53

	thumb_func_start MP2K_event_memacc
MP2K_event_memacc: @ 0x02014A30
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
	bls _02014A54
	b _02014B82
_02014A54:
	lsls r0, r5, #2
	ldr r1, _02014A60 @ =_02014A64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02014A60: .4byte _02014A64
_02014A64: @ jump table
	.4byte _02014AAC @ case 0
	.4byte _02014AB0 @ case 1
	.4byte _02014AB8 @ case 2
	.4byte _02014AC0 @ case 3
	.4byte _02014ACA @ case 4
	.4byte _02014AD8 @ case 5
	.4byte _02014AE6 @ case 6
	.4byte _02014AEE @ case 7
	.4byte _02014AF6 @ case 8
	.4byte _02014AFE @ case 9
	.4byte _02014B06 @ case 10
	.4byte _02014B0E @ case 11
	.4byte _02014B16 @ case 12
	.4byte _02014B24 @ case 13
	.4byte _02014B32 @ case 14
	.4byte _02014B40 @ case 15
	.4byte _02014B4E @ case 16
	.4byte _02014B5C @ case 17
_02014AAC:
	strb r2, [r3]
	b _02014B82
_02014AB0:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _02014B82
_02014AB8:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _02014B82
_02014AC0:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _02014B82
_02014ACA:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _02014B82
_02014AD8:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _02014B82
_02014AE6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _02014B68
	b _02014B7C
_02014AEE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _02014B68
	b _02014B7C
_02014AF6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _02014B68
	b _02014B7C
_02014AFE:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _02014B68
	b _02014B7C
_02014B06:
	ldrb r3, [r3]
	cmp r3, r2
	bls _02014B68
	b _02014B7C
_02014B0E:
	ldrb r3, [r3]
	cmp r3, r2
	blo _02014B68
	b _02014B7C
_02014B16:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _02014B68
	b _02014B7C
_02014B24:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _02014B68
	b _02014B7C
_02014B32:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _02014B68
	b _02014B7C
_02014B40:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _02014B68
	b _02014B7C
_02014B4E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _02014B68
	b _02014B7C
_02014B5C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _02014B7C
_02014B68:
	ldr r0, _02014B78 @ =gMPlayJumpTable + 0x4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_02014CD0
	b _02014B82
	.align 2, 0
_02014B78: .4byte gMPlayJumpTable + 0x4
_02014B7C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_02014B82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start MP2K_event_xcmd
MP2K_event_xcmd: @ 0x02014B88
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _02014BA4 @ =gUnknown_02016114
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl sub_02014CD0
	pop {r0}
	bx r0
	.align 2, 0
_02014BA4: .4byte gUnknown_02016114

	thumb_func_start MP2K_event_xxx
MP2K_event_xxx: @ 0x02014BA8
	push {lr}
	ldr r2, _02014BB8 @ =gMPlayJumpTable
	ldr r2, [r2]
	bl sub_02014CD0
	pop {r0}
	bx r0
	.align 2, 0
_02014BB8: .4byte gMPlayJumpTable

	thumb_func_start MP2K_event_xwave
MP2K_event_xwave: @ 0x02014BBC
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _02014BF4 @ =0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _02014BF8 @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _02014BFC @ =0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _02014C00 @ =0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02014BF4: .4byte 0xFFFFFF00
_02014BF8: .4byte 0xFFFF00FF
_02014BFC: .4byte 0xFF00FFFF
_02014C00: .4byte 0x00FFFFFF

	thumb_func_start MP2K_event_xtype
MP2K_event_xtype: @ 0x02014C04
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

	thumb_func_start MP2K_event_xatta
MP2K_event_xatta: @ 0x02014C18
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

	thumb_func_start MP2K_event_xdeca
MP2K_event_xdeca: @ 0x02014C2C
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

	thumb_func_start MP2K_event_xsust
MP2K_event_xsust: @ 0x02014C40
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

	thumb_func_start MP2K_event_xrele
MP2K_event_xrele: @ 0x02014C54
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

	thumb_func_start MP2K_event_xiecv
MP2K_event_xiecv: @ 0x02014C68
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start MP2K_event_xiecl
MP2K_event_xiecl: @ 0x02014C74
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start MP2K_event_xleng
MP2K_event_xleng: @ 0x02014C80
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

	thumb_func_start MP2K_event_xswee
MP2K_event_xswee: @ 0x02014C94
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
MP2K_event_null:
	.byte 0x70, 0x47, 0x00, 0x00
