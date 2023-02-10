.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_8075C6C
sub_8075C6C: @ 0x08075C6C
	push {r4, r5, lr}
	ldr r0, _08075C9C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8075D98
	cmp r0, #0
	beq _08075C8A
	adds r0, r4, #0
	bl sub_8075B50
_08075C8A:
	adds r0, r4, #0
	bl sub_8075D58
	cmp r0, #0
	beq _08075CA0
	adds r0, r4, #0
	bl sub_8075DE8
	b _08075CB6
	.align 2, 0
_08075C9C: .4byte gCurTask
_08075CA0:
	adds r0, r4, #0
	bl sub_8075CF0
	ldr r1, _08075CBC @ =IWRAM_START + 0x4B
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CB6
	adds r0, r4, #0
	bl sub_8075D28
_08075CB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075CBC: .4byte IWRAM_START + 0x4B

	thumb_func_start sub_8075CC0
sub_8075CC0: @ 0x08075CC0
	bx lr
	.align 2, 0

	thumb_func_start sub_8075CC4
sub_8075CC4: @ 0x08075CC4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075CE4
	ldr r0, _08075CDC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08075CE0 @ =sub_8075C6C
	str r0, [r1, #8]
	b _08075CEA
	.align 2, 0
_08075CDC: .4byte gCurTask
_08075CE0: .4byte sub_8075C6C
_08075CE4:
	adds r0, r1, #0
	bl sub_8075DE8
_08075CEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8075CF0
sub_8075CF0: @ 0x08075CF0
	mov ip, r0
	mov r3, ip
	adds r3, #0xc
	ldr r1, [r0, #0x3c]
	ldr r2, _08075D24 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	mov r0, ip
	ldr r1, [r0, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r3, #0x18]
	bx lr
	.align 2, 0
_08075D24: .4byte gCamera

	thumb_func_start sub_8075D28
sub_8075D28: @ 0x08075D28
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _08075D54 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075D54: .4byte 0xFFFFFBFF

	thumb_func_start sub_8075D58
sub_8075D58: @ 0x08075D58
	push {r4, lr}
	ldr r2, [r0, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r1, #0
	adds r2, r2, r4
	ldr r3, _08075D8C @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, r0, r4
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xbc
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _08075D88
	movs r0, #0xa8
	lsls r0, r0, #2
	cmp r1, r0
	bls _08075D90
_08075D88:
	movs r0, #1
	b _08075D92
	.align 2, 0
_08075D8C: .4byte gCamera
_08075D90:
	movs r0, #0
_08075D92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8075D98
sub_8075D98: @ 0x08075D98
	push {lr}
	adds r2, r0, #0
	ldr r3, _08075DDC @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08075DE0
	adds r0, r2, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075DE0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r2, #0x3c]
	subs r1, r1, r0
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	adds r0, #0x18
	ldr r2, [r2, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _08075DE0
	cmp r0, #0x18
	bhi _08075DE0
	movs r0, #1
	b _08075DE2
	.align 2, 0
_08075DDC: .4byte gPlayer
_08075DE0:
	movs r0, #0
_08075DE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8075DE8
sub_8075DE8: @ 0x08075DE8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _08075DFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08075DFC: .4byte gCurTask
