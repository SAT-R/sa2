.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0     @ r5 = p
	bl sa2__sub_8022838
	adds r7, r5, #0
	adds r7, #0x80
	ldrb r1, [r7]
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _080482D8
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _08048260
	ldr r0, [r5, #0x10]
	movs r1, #1
	orrs r0, r1
	b _08048268
_08048260:
	ldr r0, [r5, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08048268:
	str r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	adds r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080482C2
	adds r0, r5, #0
	adds r0, #0x81
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08048292
	ldr r0, [r5, #0x10]
	movs r1, #1
	orrs r0, r1
	b _0804829A
_08048292:
	ldr r0, [r5, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0804829A:
	str r0, [r5, #0x10]
	movs r0, #0
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	bl sa2__sub_8022318
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080482B8
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
	b _080484BE_return
_080482B8:
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	b _080484BE_return
_080482C2:
	adds r1, r5, #0
	adds r1, #0x3d
	movs r0, #3
	strb r0, [r1]
	adds r1, #3
	movs r0, #0x41
	strb r0, [r1]
	movs r0, #0x6f
	bl m4aSongNumStart
	b _080484BE_return
_080482D8:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080482E2
	b _0804846E
_080482E2:
	adds r0, r5, #0
	adds r0, #0x82
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080482F2
	b _0804844C
_080482F2:
	adds r1, r5, #0
	adds r1, #0x81
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	mov sb, r1
	cmp r0, #0
	bgt _080483B4
	ldr r0, [r5, #0x10]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sa2__sub_8029A28
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _0804831E
	b _0804844C
_0804831E:
	cmp r6, #0
	bne _08048324
	b _08048424
_08048324:
	ldr r0, _08048370 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08048378
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	subs r0, #1
	movs r1, #0xf
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0xe
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _08048374 @ =sa2__sub_801EE64
	str r4, [sp, #4]
	bl sa2__sub_801E4E4
	cmp r0, #0
	bge _080483A6
	adds r0, r5, #0
	adds r0, #0x3d
	mov r1, r8
	strb r1, [r0]
	b _08048454
	.align 2, 0
_08048370: .4byte gStageFlags
_08048374: .4byte sa2__sub_801EE64
_08048378:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0xf
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0xe
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _080483B0 @ =sa2__sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sa2__sub_801E4E4
	cmp r0, #0
	blt _0804844C
_080483A6:
	lsls r1, r6, #8
	ldr r0, [r5]
	subs r0, r0, r1
	b _08048422
	.align 2, 0
_080483B0: .4byte sa2__sub_801EE64
_080483B4:
	ldr r0, [r5, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sa2__sub_8029A74
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _080483DA
	adds r0, r5, #0
	adds r0, #0x3d
	mov r1, r8
	strb r1, [r0]
	b _08048454
_080483DA:
	cmp r6, #0
	beq _08048424
	ldr r0, _08048444 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0804841C
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0xf
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5]
	asrs r1, r1, #8
	adds r1, #1
	movs r2, #0xe
	ldrsb r2, [r5, r2]
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _08048448 @ =sa2__sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sa2__sub_801E4E4
	cmp r0, #0
	blt _0804844C
_0804841C:
	lsls r1, r6, #8
	ldr r0, [r5]
	adds r0, r0, r1
_08048422:
	str r0, [r5]
_08048424:
	movs r0, #0
	strh r0, [r5, #0xc]
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x3d
	movs r0, #4
	strb r0, [r1]
	movs r0, #3
	mov r1, sb
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0x46
	strb r0, [r1]
	b _080484BE_return
	.align 2, 0
_08048444: .4byte gStageFlags
_08048448: .4byte sa2__sub_801EE64
_0804844C:
	adds r0, r5, #0
	adds r0, #0x3d
	mov r2, r8
	strb r2, [r0]
_08048454:
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0x3f
	strb r0, [r1]
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	ldrb r1, [r7]
	movs r0, #2
	orrs r0, r1
	strb r0, [r7]
	b _080484BE_return
_0804846E:
	ldr r0, _08048498 @ =gPlayerControls
	ldrh r1, [r5, #0x38]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _080484B8
	adds r0, r5, #0
	adds r0, #0x3d
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	movs r1, #0x3f
	strb r1, [r0]
	movs r2, #8
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bgt _0804849C
	ldr r0, [r5, #0x10]
	movs r1, #1
	orrs r0, r1
	b _080484A4
	.align 2, 0
_08048498: .4byte gPlayerControls
_0804849C:
	ldr r0, [r5, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_080484A4:
	str r0, [r5, #0x10]
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r5, #8]
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	b _080484BE_return
_080484B8:
	adds r0, r5, #0
	bl Player_Knuckles_GlideUpdateAnim
_080484BE_return:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
