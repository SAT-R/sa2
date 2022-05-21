.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	movs r0, #0x60
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0x90
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #0x18]
	movs r2, #0xb1
	lsls r2, r2, #1
	adds r0, r7, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r3, r1, #3
	mov r8, r3
	ldr r5, _08064C34 @ =gUnknown_080D9C30
	add r5, r8
	ldr r0, _08064C38 @ =gUnknown_080D9C60
	add r8, r0
	lsls r1, r1, #5
	ldr r0, _08064C3C @ =gUnknown_080D9C90
	adds r1, r1, r0
	mov sl, r1
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r0, [r0]
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #0x1c]
	subs r2, #2
	adds r0, r7, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldrh r2, [r5, #4]
	ldrh r3, [r5]
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	ldr r0, [sp, #0x1c]
	lsls r4, r0, #0x10
	asrs r6, r4, #0x10
	movs r1, #0xa8
	lsls r1, r1, #0x11
	adds r4, r4, r1
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x10]
	movs r5, #0
	str r5, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #1
	bl sub_806A568
	adds r0, r7, #0
	adds r0, #0x30
	mov r1, r8
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #0x84
	str r1, [sp, #8]
	movs r4, #8
	str r4, [sp, #0xc]
	mov r4, r8
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	bl sub_806A568
	movs r4, #0x2e
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x24]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r6, r6, r2
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r8, r6
_08064B8C:
	mov r3, sl
	ldrh r2, [r3, #4]
	ldrh r3, [r3]
	movs r7, #0x80
	lsls r7, r7, #5
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	mov r1, sl
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r6, #0
	str r6, [sp, #0x14]
	mov r0, sb
	movs r1, #1
	bl sub_806A568
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp, #0x24]
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r0, sb
	adds r0, #0x25
	strb r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x10
	movs r3, #0x30
	add sb, r3
	movs r0, #8
	add sl, r0
	adds r4, #0x13
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r5, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #0x10
	ldr r3, [sp, #0x20]
	lsls r1, r3, #0x10
	cmp r2, #3
	ble _08064B8C
	ldr r3, _08064C40 @ =0x000003BD
	str r7, [sp]
	movs r4, #0xfe
	lsls r4, r4, #0x10
	adds r0, r0, r4
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	adds r0, #0x2e
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #7
	str r0, [sp, #0xc]
	movs r0, #5
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r2, #0x3f
	bl sub_806A568
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064C34: .4byte gUnknown_080D9C30
_08064C38: .4byte gUnknown_080D9C60
_08064C3C: .4byte gUnknown_080D9C90
_08064C40: .4byte 0x000003BD

.syntax divided
