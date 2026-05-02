.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0          @ r8 = me
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10  @ r4 = regionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10  @ r5 = regionY
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18  @ r6 = id
	ldr r0, _080883F4 @ =Task_SecurityGateMain
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _080883F8 @ =TaskDestructor_SecurityGateMain
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0     @ r2 = gate
	adds r0, #0xc
	adds r7, r1, r0     @ r7 = s
	movs r3, #0
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r4, r8
	str r4, [r2]
	ldrb r0, [r4]
	strb r0, [r2, #8]
	strb r6, [r2, #9]
	ldr r4, _080883FC @ =0x0300003C
	adds r0, r1, r4
	strb r3, [r0]
	ldr r0, _08088400 @ =0x0300003D
	adds r1, r1, r0
	strb r3, [r1]
	mov r1, r8
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08088404
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	subs r0, #0xa
	b _08088406
	.align 2, 0
_080883F4: .4byte Task_SecurityGateMain
_080883F8: .4byte TaskDestructor_SecurityGateMain
_080883FC: .4byte 0x0300003C
_08088400: .4byte 0x0300003D
_08088404:
	ldr r0, _08088460 @ =0x0000FFF6
_08088406:
	strh r0, [r2, #0x3e]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	movs r2, #0
	movs r1, #0
	ldr r0, _08088464 @ =0x00000216
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088460: .4byte 0x0000FFF6
_08088464: .4byte 0x00000216

.syntax divided
