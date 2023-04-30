.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

@ Appears to be unused/debug proc
@ The initted Task does not have any code in it.
	thumb_func_start sub_802D298
sub_802D298: @ 0x0802D298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0802D2E4 @ =Task_802D4B4
	movs r1, #0x8d
	lsls r1, r1, #5
	movs r2, #0xe1
	lsls r2, r2, #8
	ldr r3, _0802D2E8 @ =TaskDestructor_802D4B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _0802D2EC @ =IWRAM_START + 0x22
	adds r7, r1, r0
	ldr r2, _0802D2F0 @ =IWRAM_START+4
	adds r4, r1, r2
	ldr r0, _0802D2F4 @ =0x0000045F
	mov sl, r0
_0802D2D4:
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	cmp r6, #0
	bne _0802D2F8
	movs r0, #0xbc
	bl VramMalloc
	b _0802D300
	.align 2, 0
_0802D2E4: .4byte Task_802D4B4
_0802D2E8: .4byte TaskDestructor_802D4B8
_0802D2EC: .4byte IWRAM_START + 0x22
_0802D2F0: .4byte IWRAM_START+4
_0802D2F4: .4byte 0x0000045F
_0802D2F8:
	lsls r1, r6, #6
	mov r2, sb
	ldr r0, [r2, #4]
	adds r0, r0, r1
_0802D300:
	str r0, [r4]
	strh r5, [r4, #0x16]
	strh r5, [r4, #4]
	mov r0, sl
	strh r0, [r4, #6]
	adds r1, r6, #1
	strb r1, [r4, #0x1c]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	strb r5, [r7, #3]
	subs r0, #0x11
	str r0, [r4, #0x24]
	str r5, [r4, #0xc]
	adds r7, #0x30
	adds r4, #0x30
	adds r6, r1, #0
	cmp r6, #0x5d
	bls _0802D2D4
	ldr r0, _0802D344 @ =gDebugUITask
	mov r1, r8
	str r1, [r0]
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D344: .4byte gDebugUITask

	thumb_func_start sub_802D348
sub_802D348: @ 0x0802D348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r0, _0802D37C @ =gDebugUITask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D380 @ =IWRAM_START + 0x2D0
	adds r2, r2, r0
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
	movs r2, #1
	mov r8, r2
	cmp r5, #9
	bhi _0802D384
	movs r7, #1
	b _0802D3C6
	.align 2, 0
_0802D37C: .4byte gDebugUITask
_0802D380: .4byte IWRAM_START + 0x2D0
_0802D384:
	cmp r5, #0x63
	bhi _0802D38C
	movs r7, #2
	b _0802D3C6
_0802D38C:
	ldr r0, _0802D398 @ =0x000003E7
	cmp r5, r0
	bhi _0802D39C
	movs r7, #3
	b _0802D3C6
	.align 2, 0
_0802D398: .4byte 0x000003E7
_0802D39C:
	ldr r0, _0802D3A8 @ =0x0000270F
	cmp r5, r0
	bhi _0802D3AC
	movs r7, #4
	b _0802D3C6
	.align 2, 0
_0802D3A8: .4byte 0x0000270F
_0802D3AC:
	ldr r0, _0802D3B8 @ =0x0001869F
	cmp r5, r0
	bhi _0802D3BC
	movs r7, #5
	b _0802D3C6
	.align 2, 0
_0802D3B8: .4byte 0x0001869F
_0802D3BC:
	ldr r0, _0802D430 @ =0x000F423F
	movs r7, #7
	cmp r5, r0
	bhi _0802D3C6
	movs r7, #6
_0802D3C6:
	mov r0, r8
	cmp r0, #0
	beq _0802D41E
	cmp r7, #0
	beq _0802D41E
	adds r6, r1, #0
_0802D3D2:
	adds r0, r5, #0
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	add r4, sl
	mov r2, sb
	mov r1, r8
	muls r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	subs r4, r4, r0
	strh r6, [r4, #0x16]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	mov r5, r8
	subs r6, #8
	subs r7, #1
	cmp r5, #0
	beq _0802D41E
	cmp r7, #0
	bne _0802D3D2
_0802D41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D430: .4byte 0x000F423F

	thumb_func_start sub_802D434
sub_802D434: @ 0x0802D434
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _0802D4AC @ =gDebugUITask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0802D4B0 @ =0x2FFF9D0
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	ldrb r0, [r7]
	cmp r0, #0
	beq _0802D4A0
_0802D45C:
	adds r1, r7, r5
	ldrb r0, [r1]
	cmp r0, #0x20
	bls _0802D488
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #4
	add r4, r8
	strh r6, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0802D488:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802D45C
_0802D4A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4AC: .4byte gDebugUITask
_0802D4B0: .4byte 0x2FFF9D0

@ Uhh... why is this Task empty?
	thumb_func_start Task_802D4B4
Task_802D4B4: @ 0x0802D4B4
	bx lr
	.align 2, 0

	thumb_func_start TaskDestructor_802D4B8
TaskDestructor_802D4B8: @ 0x0802D4B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
