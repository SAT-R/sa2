.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_800B780
Task_800B780: @ 0x0800B780
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
	bl ApplyItemboxEffect
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

	thumb_func_start Task_800B7D0
Task_800B7D0: @ 0x0800B7D0
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

	thumb_func_start TaskDestructor_800B80C
TaskDestructor_800B80C: @ 0x0800B80C
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
	ldr r0, _0800B85C @ =Task_800B950
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B858: .4byte gCurTask
_0800B85C: .4byte Task_800B950

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

	thumb_func_start Task_800B950
Task_800B950: @ 0x0800B950
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
	ldr r0, _0800B9B4 @ =Task_800B7D0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0800B9B0: .4byte gCurTask
_0800B9B4: .4byte Task_800B7D0
