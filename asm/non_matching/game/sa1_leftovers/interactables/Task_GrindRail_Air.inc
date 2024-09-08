.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08010248 @ =gPlayer
	mov ip, r0
	ldr r4, _0801024C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _08010250 @ =IWRAM_START + 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldr r3, _08010254 @ =IWRAM_START+4
	adds r0, r1, r3
	ldrh r2, [r0]
	ldr r7, _08010258 @ =IWRAM_START + 0x6
	adds r0, r1, r7
	ldrh r3, [r0]
	ldr r0, _0801025C @ =IWRAM_START + 0x9
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r7, ip
	ldr r3, [r7, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080101AA
	b _080102C8
_080101AA:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r6, r0, r1
	ldr r0, [r7, #8]
	asrs r4, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #4]
	cmp r6, r4
	ble _080101C8
	b _080102C8
_080101C8:
	mov r2, r8
	ldrb r0, [r2, #5]
	lsls r7, r0, #3
	str r7, [sp, #0x10]
	adds r1, r6, r7
	str r0, [sp, #0xc]
	cmp r1, r4
	blt _080102C8
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	ldrsb r1, [r2, r1]
	lsls r1, r1, #3
	adds r2, r0, r1
	mov r7, ip
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080102C8
	mov r7, r8
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080102C8
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	beq _080102C8
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0801026C
	ands r3, r1
	cmp r3, #0
	beq _08010264
	ldr r1, [sp, #0x10]
	asrs r0, r1, #1
	adds r0, r6, r0
	cmp r4, r0
	blt _08010238
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010260 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08010264
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08010264
_08010238:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_08010248: .4byte gPlayer
_0801024C: .4byte gCurTask
_08010250: .4byte IWRAM_START + 0x8
_08010254: .4byte IWRAM_START+4
_08010258: .4byte IWRAM_START + 0x6
_0801025C: .4byte IWRAM_START + 0x9
_08010260: .4byte gPlayerControls
_08010264:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080102C8
_0801026C:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080102C8
	ldr r3, [sp, #4]
	asrs r2, r3, #8
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	lsls r1, r7, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _080102AA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _080102BC @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080102C8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080102C8
_080102AA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_080102BC: .4byte gPlayerControls
_080102C0:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_080102C6:
	strb r0, [r1]
_080102C8:
	ldr r2, _0801032C @ =gCamera
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0801030A
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801030A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0801031A
_0801030A:
	mov r2, sp
	ldrb r3, [r2]
	mov r2, r8
	strb r3, [r2]
	ldr r7, _08010330 @ =gCurTask
	ldr r0, [r7]
	bl TaskDestroy
_0801031A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801032C: .4byte gCamera
_08010330: .4byte gCurTask
.syntax divided
