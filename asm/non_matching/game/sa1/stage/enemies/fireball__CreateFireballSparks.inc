.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1          @ sb = screenY
	movs r6, #0         @ r6 = i
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10  @ r7 = screenX
	lsls r5, r7, #2
	movs r0, #8
	adds r0, r0, r7
	mov r8, r0
_080712A8:
	str r4, [sp]
	ldr r0, _080712DC @ =Task_FireballSpark
	movs r1, #0x38
	movs r2, #0xc0
	lsls r2, r2, #6
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r0, r2     @ r1 = spark
	strh r5, [r1, #0x30]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1, #0x34]
	movs r0, #6
	strh r0, [r1, #0x32]
	cmp r6, #0
	beq _080712E0
	rsbs r0, r0, #0
	strh r0, [r1, #0x32]
	adds r0, r7, #0
	subs r0, #8
	b _080712E4
	.align 2, 0
_080712DC: .4byte Task_FireballSpark
_080712E0:
	strh r5, [r1, #0x30]
	mov r0, r8
_080712E4:
	strh r0, [r1, #0x16]
	mov r2, sb
	strh r2, [r1, #0x18]
	ldr r0, _08071340 @ =0x06012580
	str r0, [r1, #4]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	subs r0, #0xa2
	strh r0, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	strb r4, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	adds r0, r1, #0
	bl UpdateSpriteAnimation
	adds r6, #1
	cmp r6, #1
	ble _080712A8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071340: .4byte 0x06012580

.syntax divided
