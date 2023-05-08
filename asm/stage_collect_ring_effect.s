.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start CreateCollectRingEffect
CreateCollectRingEffect: @ 0x0800AEA0
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
