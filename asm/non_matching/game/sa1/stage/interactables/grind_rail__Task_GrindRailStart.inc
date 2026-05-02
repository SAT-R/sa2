.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08023C04 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r0, [r0]
	mov ip, r0
	mov r0, ip
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08023B2A
	b _08023C70_return
_08023B2A:
	ldr r0, _08023C08 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r7, [r0]
	ldr r1, _08023C0C @ =0x03000008
	adds r0, r2, r1
	ldrb r0, [r0]
	mov sl, r0
	ldr r4, _08023C10 @ =0x03000004
	adds r0, r2, r4
	ldrh r1, [r0]
	ldr r0, _08023C14 @ =0x03000006
	adds r2, r2, r0
	ldrh r2, [r2]
	mov r4, sl
	lsls r0, r4, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r6, [r3, #0x10]
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _08023B70
	b _08023C70_return
_08023B70:
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldr r0, [r3]
	asrs r4, r0, #8
	mov sb, r1
	lsls r2, r2, #0x10
	mov r8, r2
	cmp r5, r4
	bgt _08023C2A
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r4
	blt _08023C2A
	asrs r2, r2, #0x10
	ldr r0, [r3, #4]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08023C2A
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08023C2A
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	bne _08023C2A
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	cmp r0, #0
	blt _08023C2A
	ldrh r1, [r3, #8]
	movs r4, #8
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _08023C2A
	cmp r0, #0x80
	bge _08023BC4
	movs r1, #0x80
_08023BC4:
	strh r1, [r3, #8]
	orrs r6, r2
	str r6, [r3, #0x10]
	adds r2, r3, #0
	adds r2, #0x27
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
	ldr r2, _08023C18 @ =gPlayerBodyPSI
	ldr r0, [r2, #0x1c]
	ldr r1, _08023C1C @ =0xFFFFCFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r3, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08023C20
	movs r0, #0x86
	bl m4aSongNumStart
	b _08023C26
	.align 2, 0
_08023C04: .4byte gPlayer
_08023C08: .4byte gCurTask
_08023C0C: .4byte 0x03000008
_08023C10: .4byte 0x03000004
_08023C14: .4byte 0x03000006
_08023C18: .4byte gPlayerBodyPSI
_08023C1C: .4byte 0xFFFFCFFF
_08023C20:
	movs r0, #0x72
	bl m4aSongNumStart
_08023C26:
	bl CreateGrindEffect
_08023C2A:
	ldr r2, _08023C80 @ =gCamera
	ldrh r0, [r2]
	mov r3, sb
	asrs r1, r3, #0x10
	subs r1, r1, r0
	ldrh r2, [r2, #2]
	mov r4, r8
	asrs r0, r4, #0x10
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
	bhi _08023C64
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08023C64
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08023C70_return
_08023C64:
	mov r1, sl
	strb r1, [r7]
	ldr r0, _08023C84 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08023C70_return:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023C80: .4byte gCamera
_08023C84: .4byte gCurTask

.syntax divided
