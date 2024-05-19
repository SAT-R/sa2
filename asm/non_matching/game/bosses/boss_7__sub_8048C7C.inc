.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x60]
	mov sb, r0
	adds r4, r7, #0
	adds r4, #0x28
	adds r2, r7, #0
	adds r2, #0x1c
	ldr r0, _08048D6C @ =gUnknown_080D8710
	ldrb r1, [r7, #0x1b]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	movs r1, #0
	str r1, [sp]
	ldr r5, [r7, #0x5c]
	lsrs r3, r5, #0xc
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08048CB8
	movs r0, #1
	str r0, [sp]
_08048CB8:
	movs r1, #7
	mov r8, r1
	movs r0, #7
	ands r6, r0
	ldr r0, _08048D70 @ =0x00000FFF
	mov ip, r0
	mov r1, ip
	ands r1, r5
	mov ip, r1
	mov r0, r8
	ands r3, r0
	adds r1, r7, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	mov r5, r8
	ands r0, r5
	mov r8, r1
	cmp r3, r0
	beq _08048D18
	movs r5, #0
	adds r3, r4, #0
	lsls r1, r6, #1
_08048CE8:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r6, sb
	adds r6, #4
	mov sb, r6
	subs r6, #4
	ldm r6!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048CE8
	adds r4, r3, #0
_08048D18:
	movs r5, #0
	mov r0, ip
	lsls r6, r0, #0x10
_08048D1E:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r6, #0x10
	str r2, [sp, #4]
	bl sub_80859F4
	ldr r2, [sp, #4]
	strh r0, [r2]
	adds r2, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08048D1E
	mov r1, r8
	ldrh r0, [r1]
	mov r5, sl
	subs r0, r0, r5
	movs r1, #0xe6
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sl
	mov r6, r8
	strh r0, [r6]
	ldrh r1, [r6]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, _08048D74 @ =0x00007FFF
	ands r0, r1
	str r0, [r7, #0x5c]
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048D6C: .4byte gUnknown_080D8710
_08048D70: .4byte 0x00000FFF
_08048D74: .4byte 0x00007FFF

	
.syntax divided
