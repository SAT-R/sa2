.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8086B38
sub_8086B38: @ 0x08086B38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r0, #1
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0xe4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086B68
	adds r0, r5, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086B68
	ldr r0, _08086B64 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08086BDC
	.align 2, 0
_08086B64: .4byte gCurTask
_08086B68:
	movs r6, #0
	adds r7, r5, #0
	adds r7, #0xc0
	ldr r1, _08086BC0 @ =gCamera
	mov sb, r1
_08086B72:
	ldrb r0, [r7]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08086BCA
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r4, r5, r0
	lsls r2, r6, #2
	adds r0, r5, #0
	adds r0, #0xc4
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0xd4
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08086BC4
	movs r1, #1
	lsls r1, r6
	ldrb r0, [r7]
	bics r0, r1
	strb r0, [r7]
	b _08086BCA
	.align 2, 0
_08086BC0: .4byte gCamera
_08086BC4:
	adds r0, r4, #0
	bl sub_80051E8
_08086BCA:
	mov r1, r8
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _08086B72
_08086BDC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8086BE8
sub_8086BE8: @ 0x08086BE8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08086C70 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	lsls r2, r4, #2
	ldr r1, _08086C74 @ =IWRAM_START + 0xC4
	adds r0, r3, r1
	adds r5, r0, r2
	ldr r1, _08086C78 @ =gPlayer
	ldr r0, [r1, #8]
	str r0, [r5]
	ldr r6, _08086C7C @ =IWRAM_START + 0xD4
	adds r0, r3, r6
	adds r6, r0, r2
	ldr r0, [r1, #0xc]
	str r0, [r6]
	cmp r4, #1
	bne _08086C24
	ldr r0, _08086C80 @ =IWRAM_START + 0xD8
	adds r1, r3, r0
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r1]
_08086C24:
	cmp r4, #3
	bne _08086C34
	ldr r0, _08086C84 @ =IWRAM_START + 0xE0
	adds r1, r3, r0
	ldr r0, [r1]
	ldr r2, _08086C88 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r1]
_08086C34:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r3, r7, r0
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r2, _08086C8C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r3, #0x16]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r3, #0x18]
	ldr r0, _08086C90 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08086C94
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08086C9A
	.align 2, 0
_08086C70: .4byte gCurTask
_08086C74: .4byte IWRAM_START + 0xC4
_08086C78: .4byte gPlayer
_08086C7C: .4byte IWRAM_START + 0xD4
_08086C80: .4byte IWRAM_START + 0xD8
_08086C84: .4byte IWRAM_START + 0xE0
_08086C88: .4byte 0xFFFFF800
_08086C8C: .4byte gCamera
_08086C90: .4byte gUnknown_03005424
_08086C94:
	ldr r0, [r3, #0x10]
	ldr r1, _08086CB8 @ =0xFFFFF7FF
	ands r0, r1
_08086C9A:
	str r0, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0xc0
	movs r1, #1
	lsls r1, r4
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086CB8: .4byte 0xFFFFF7FF

	thumb_func_start sub_8086CBC
sub_8086CBC: @ 0x08086CBC
	push {r4, r5, lr}
	ldrh r0, [r0, #6]
	movs r4, #0
	ldr r1, _08086CE4 @ =IWRAM_START+4
	adds r5, r0, r1
_08086CC6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08086CC6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086CE4: .4byte IWRAM_START+4
