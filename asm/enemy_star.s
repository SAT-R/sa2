.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Create_Star
Create_Star: @ 0x08059C9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08059D7C @ =sub_8059D9C
	ldr r2, _08059D80 @ =0x00004050
	ldr r1, _08059D84 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r7, _08059D88 @ =IWRAM_START + 0xC
	adds r6, r2, r7
	movs r0, #0
	mov sl, r0
	movs r3, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x40]
	ldr r4, _08059D8C @ =IWRAM_START + 0x44
	adds r1, r2, r4
	movs r0, #0x78
	strb r0, [r1]
	strh r3, [r6, #0x16]
	strh r3, [r6, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x19
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08059D90 @ =0x000001FF
	strh r0, [r6, #0xa]
	ldr r2, [sp, #4]
	subs r4, #0x18
	adds r0, r2, r4
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	ldr r0, _08059D94 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r4, #2
	adds r1, r2, r4
	movs r0, #0x10
	strb r0, [r1]
	ldr r7, _08059D98 @ =IWRAM_START + 0x31
	adds r2, r2, r7
	mov r0, sl
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059D7C: .4byte sub_8059D9C
_08059D80: .4byte 0x00004050
_08059D84: .4byte TaskDestructor_80095E8
_08059D88: .4byte IWRAM_START + 0xC
_08059D8C: .4byte IWRAM_START + 0x44
_08059D90: .4byte 0x000001FF
_08059D94: .4byte IWRAM_START + 0x2D
_08059D98: .4byte IWRAM_START + 0x31

	thumb_func_start sub_8059D9C
sub_8059D9C: @ 0x08059D9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08059DF0 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r2, _08059DF4 @ =IWRAM_START + 0xC
	adds r6, r1, r2
	ldr r3, [r7]
	mov sl, r3
	ldr r1, [r7, #0x3c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x40]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08059DF8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08059DFC
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08059EA6
	.align 2, 0
_08059DF0: .4byte gCurTask
_08059DF4: .4byte IWRAM_START + 0xC
_08059DF8: .4byte gCamera
_08059DFC:
	mov r2, r8
	ldr r1, [r2]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r4, r0
	bgt _08059E26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _08059E26
	ldr r1, [r2, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r5, r0
	bgt _08059E26
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	bge _08059E60
_08059E26:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08059E4A
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _08059E4A
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08059E60
_08059E4A:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059E5C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08059EA6
	.align 2, 0
_08059E5C: .4byte gCurTask
_08059E60:
	adds r1, r7, #0
	adds r1, #0x44
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059E92
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _08059EB4 @ =0x000001FF
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08059EB8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08059EBC @ =sub_8059EC0
	str r0, [r1, #8]
_08059E92:
	ldr r0, [r7, #0x3c]
	ldr r1, [r7, #0x40]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08059EA6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059EB4: .4byte 0x000001FF
_08059EB8: .4byte gCurTask
_08059EBC: .4byte sub_8059EC0

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
