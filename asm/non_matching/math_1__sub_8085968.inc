.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080859EC @ =0x00000FFF
	subs r7, r0, r1
	adds r0, r7, #0
	muls r0, r7, r0
	asrs r0, r0, #0xc
	muls r0, r7, r0
	asrs r7, r0, #0xc
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r7, r0
	movs r5, #0xab
	mov r8, r5
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #0xa
	adds r4, #2
	adds r3, r1, #0
	muls r3, r1, r3
	asrs r3, r3, #0xc
	adds r2, r3, #0
	muls r2, r1, r2
	asrs r7, r2, #0xc
	movs r6, #0
	ldrsh r5, [r4, r6]
	mov ip, r5
	asrs r2, r2, #0xd
	ldr r6, _080859F0 @ =gUnknown_080E0290
	subs r2, r2, r3
	ldrh r5, [r6]
	adds r2, r2, r5
	mov r5, ip
	muls r5, r2, r5
	adds r2, r5, #0
	adds r0, r0, r2
	adds r4, #2
	movs r5, #0
	ldrsh r2, [r4, r5]
	adds r1, r1, r3
	subs r1, r1, r7
	asrs r1, r1, #1
	ldrh r6, [r6, #2]
	adds r1, r1, r6
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r7, r1
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	asrs r1, r1, #0xa
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080859EC: .4byte 0x00000FFF
_080859F0: .4byte gUnknown_080E0290

	
.syntax divided
