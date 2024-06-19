.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x10]
	ldr r0, _0804FC88 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FC8C @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r6, #0
_0804FC34:
	mov r1, sp
	movs r4, #0
	movs r3, #0
	movs r2, #0
	mov r5, ip
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _0804FC4A
	strb r4, [r1]
	adds r1, #1
	movs r3, #1
_0804FC4A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FC6E
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FC4A
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FC4A
_0804FC6E:
	cmp r3, #8
	bne _0804FC74
	movs r4, #1
_0804FC74:
	cmp r4, #0
	beq _0804FD40
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FC90
	ldr r0, [sp, #0x10]
	adds r0, #0x28
	b _0804FC94
	.align 2, 0
_0804FC88: .4byte gCurTask
_0804FC8C: .4byte IWRAM_START + 0x654
_0804FC90:
	ldr r0, [sp, #0x10]
	subs r0, #0x28
_0804FC94:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0804FD50 @ =0x000003FF
	ands r2, r0
	movs r5, #0
	mov r0, ip
	adds r0, #0xe
	str r0, [sp, #0x1c]
	mov r1, ip
	adds r1, #0x1e
	str r1, [sp, #0x20]
	mov r3, ip
	adds r3, #0x2e
	str r3, [sp, #0x14]
	movs r0, #0x30
	add r0, ip
	mov sl, r0
	movs r1, #0x70
	add r1, ip
	mov sb, r1
	movs r3, #0x74
	add r3, ip
	mov r8, r3
	adds r6, #1
	str r6, [sp, #0x18]
	ldr r1, _0804FD54 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r7, [r0, r3]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r6, [r0, r1]
_0804FCDE:
	mov r3, sp
	adds r0, r3, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x1c]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, [sp, #0x20]
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r5, #6
	lsls r3, r2, #2
	ldr r1, [sp, #0x14]
	adds r4, r1, r3
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r0
	adds r0, r7, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4]
	add r3, sl
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	lsls r2, r2, #3
	mov r3, sb
	adds r0, r3, r2
	ldr r1, [sp, #8]
	str r1, [r0]
	add r2, r8
	ldr r3, [sp, #0xc]
	str r3, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804FCDE
	ldr r5, [sp, #0x18]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bhi _0804FD3A
	b _0804FC34
_0804FD3A:
	movs r0, #0x9c
	bl m4aSongNumStart
_0804FD40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD50: .4byte 0x000003FF
_0804FD54: .4byte gSineTable

.syntax divided
