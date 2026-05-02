.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _080565AC @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, [r6, #0x78]
	ldr r2, _080565B0 @ =0x0300003C
	adds r7, r1, r2
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	str r4, [sp, #0xc]
	ldr r1, _080565B4 @ =0xFF780000
	adds r0, r0, r1
	lsrs r0, r0, #8
	lsls r2, r0, #0xc
	ldr r3, _080565B8 @ =gOamMatrixIndex
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	movs r4, #0x20
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	mov sl, r1
	orrs r0, r1
	str r0, [r6, #0x10]
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	adds r1, #0x80
	adds r0, r1, #0
	asrs r2, r2, #0x10
	subs r0, r0, r2
	mov r2, sp
	ldr r1, _080565BC @ =gSineTable
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x80
	lsls r4, r4, #1
	mov sb, r4
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x16
	strh r5, [r2, #2]
	mov r0, sp
	adds r4, r5, #1
	strh r4, [r0, #2]
	mov r8, r4
	cmp r4, #9
	bgt _0805650C
	mov r1, sp
	movs r0, #0xa
	strh r0, [r1, #2]
_0805650C:
	mov r0, sp
	mov r1, sb
	strh r1, [r0, #4]
	mov r1, sp
	movs r0, #0x7f
	strh r0, [r1, #6]
	mov r0, sp
	movs r2, #0x3c
	strh r2, [r0, #8]
	adds r0, r6, #0
	str r3, [sp, #0x10]
	bl TransformSprite
	ldr r3, [sp, #0x10]
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	orrs r0, r2
	str r0, [r7, #0x10]
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	strh r5, [r0, #2]
	strh r4, [r0, #2]
	mov r2, r8
	cmp r2, #9
	bgt _08056552
	mov r1, sp
	movs r0, #0xa
	strh r0, [r1, #2]
_08056552:
	mov r0, sp
	mov r4, sb
	strh r4, [r0, #4]
	mov r1, sl
	strh r1, [r0, #6]
	movs r2, #0x3c
	strh r2, [r0, #8]
	adds r0, r7, #0
	mov r1, sp
	bl TransformSprite
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x78]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x97
	ble _0805659C
	ldr r4, _080565AC @ =gCurTask
	ldr r1, [r4]
	ldr r0, _080565C0 @ =Task_80565C4
	str r0, [r1, #8]
_0805659C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080565AC: .4byte gCurTask
_080565B0: .4byte 0x0300003C
_080565B4: .4byte 0xFF780000
_080565B8: .4byte gOamMatrixIndex
_080565BC: .4byte gSineTable
_080565C0: .4byte Task_80565C4

.syntax divided
