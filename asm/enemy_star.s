.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8059EC0
sub_8059EC0: @ 0x08059EC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08059F5C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08059F60 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _08059F26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _08059F26
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _08059F26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _08059F64
_08059F26:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059F4A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08059F4A
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059F64
_08059F4A:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08059F5C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059FAA
	.align 2, 0
_08059F5C: .4byte gCurTask
_08059F60: .4byte gCamera
_08059F64:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059F96
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08059FB8 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08059FBC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059FC0 @ =sub_8059FC4
	str r0, [r1, #8]
_08059F96:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08059FAA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059FB8: .4byte 0x000001FF
_08059FBC: .4byte gCurTask
_08059FC0: .4byte sub_8059FC4

	thumb_func_start sub_8059FC4
sub_8059FC4: @ 0x08059FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0805A060 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _0805A064 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _0805A02A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _0805A02A
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _0805A02A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _0805A068
_0805A02A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805A04E
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805A04E
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805A068
_0805A04E:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0805A060 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805A0AE
	.align 2, 0
_0805A060: .4byte gCurTask
_0805A064: .4byte gCamera
_0805A068:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A09A
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _0805A0BC @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0805A0C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A0C4 @ =sub_805A0C8
	str r0, [r1, #8]
_0805A09A:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805A0AE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0BC: .4byte 0x000001FF
_0805A0C0: .4byte gCurTask
_0805A0C4: .4byte sub_805A0C8

	thumb_func_start sub_805A0C8
sub_805A0C8: @ 0x0805A0C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0805A164 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r1, [r7]
	mov r8, r1
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _0805A168 @ =gCamera
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_800C84C
	ldr r3, [sp]
	ldr r1, [r3]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _0805A12E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _0805A12E
	ldr r1, [r3, #4]
	subs r2, #0x50
	adds r0, r1, r2
	cmp r5, r0
	bgt _0805A12E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _0805A16C
_0805A12E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805A152
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805A152
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805A16C
_0805A152:
	ldrb r0, [r7, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0805A164 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805A1B4
	.align 2, 0
_0805A164: .4byte gCurTask
_0805A168: .4byte gCamera
_0805A16C:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A1A0
	movs r0, #0x78
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805A1C0 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0805A1C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A1C8 @ =sub_8059D9C
	str r0, [r1, #8]
_0805A1A0:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805A1B4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1C0: .4byte 0x000001FF
_0805A1C4: .4byte gCurTask
_0805A1C8: .4byte sub_8059D9C
