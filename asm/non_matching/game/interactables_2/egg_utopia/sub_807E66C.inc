.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r3, #0
	adds r6, #0x30
	ldr r0, _0807E758 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E764
	adds r0, r3, #0
	adds r0, #0x68
	ldrh r0, [r0]
	ldr r0, [r3, #0x60]
	ldr r2, _0807E75C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r3, #0x64]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r1, r2, #0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r3, r0, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, _0807E760 @ =gPlayerBodyPSI
	adds r0, r1, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r2, r5
	mov ip, r1
	cmp r3, r2
	bgt _0807E6F4
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0807E706
	cmp r3, r2
	blt _0807E764
_0807E6F4:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	blt _0807E764
_0807E706:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r3, ip
	adds r3, #0x39
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r0, r3
	cmp r1, r2
	bgt _0807E740
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0807E752
	cmp r1, r2
	blt _0807E764
_0807E740:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _0807E764
_0807E752:
	movs r0, #1
	b _0807E766
	.align 2, 0
_0807E758: .4byte gPlayer
_0807E75C: .4byte gCamera
_0807E760: .4byte gPlayerBodyPSI
_0807E764:
	movs r0, #0
_0807E766:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	
.syntax divided
