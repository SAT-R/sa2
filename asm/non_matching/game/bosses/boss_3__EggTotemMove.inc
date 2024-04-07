.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0     @ r5 = dx
	adds r6, r1, #0     @ r6 = dy
	ldr r0, _0803FB7C @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0     @ r3 = totem
	ldr r0, [r3]
	adds r0, r0, r5
	str r0, [r3]
	ldr r0, [r3, #4]
	adds r0, r0, r6
	str r0, [r3, #4]
	movs r4, #0
	ldr r0, _0803FB80 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _0803FB84 @ =IWRAM_START + 0x10
	adds r7, r1, r0
_0803FAB8:
	lsls r1, r4, #3
	mov r0, ip
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FAB8
	movs r4, #0
	movs r1, #0x9c
	adds r1, r1, r3
	mov ip, r1          @ ip = totem->qUnk9C
	movs r0, #0xa0
	adds r0, r0, r3
	mov r8, r0          @ r8 = totem->qUnkA0
	movs r1, #0x90
	adds r1, r1, r3
	mov sb, r1          @ sb = totem->qUnk90
	movs r0, #0x94
	adds r0, r0, r3
	mov sl, r0          @ sl = totem->qUnk94
	adds r1, r3, #0
	adds r1, #0xa8
	str r1, [sp, #4]    @ sp04 = totem->qUnkA8
	adds r0, r3, #0
	adds r0, #0xac
	str r0, [sp, #8]    @ sp08 = totem->qUnkAC
	adds r1, #0x10
	str r1, [sp, #0xc]    @ sp0C = totem->qUnkB8
	adds r0, #0x10
	str r0, [sp]        @ sp00 = totem->qUnkBC
	adds r7, r3, #0
	adds r7, #0x3c
	adds r3, #0x40
_0803FB0A:
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0803FB0A
	mov r1, ip
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp, #8]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r1, [sp, #0xc]
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, [sp]
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FB7C: .4byte gActiveBossTask
_0803FB80: .4byte IWRAM_START + 0xC
_0803FB84: .4byte IWRAM_START + 0x10
	
.syntax divided
