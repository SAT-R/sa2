.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r0, _080533DC @ =gTask_03006240
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldrh r1, [r7, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r6, r0
	ldrb r0, [r6, #0xa]
	lsls r0, r0, #3
	mov r8, r0
	mov r2, sp
	ldrb r0, [r6, #9]
	lsls r0, r0, #0xe
	ldrb r1, [r7, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	mov r3, sp
	ldrb r1, [r6, #8]
	lsls r1, r1, #0xe
	ldrh r2, [r7, #0xa]
	ldr r0, _080533E0 @ =0x000001FF
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r3, #2]
	ldrh r1, [r7, #0x12]
	lsls r1, r1, #0xc
	ldr r0, [r6]
	ldr r2, _080533E4 @ =0x000003FF
	ands r0, r2
	orrs r1, r0
	strh r1, [r3, #4]
	movs r3, #0
	movs r1, #0xe
	ldrsh r0, [r7, r1]
	cmp r3, r0
	bge _0805344A
	mov r4, sp
_080533CE:
	ldrb r0, [r5]
	cmp r0, #0x20
	bne _080533E8
	ldrh r0, [r4, #2]
	add r0, r8
	strh r0, [r4, #2]
	b _0805343E
	.align 2, 0
_080533DC: .4byte gTask_03006240
_080533E0: .4byte 0x000001FF
_080533E4: .4byte 0x000003FF
_080533E8:
	ldrh r0, [r7, #8]
	adds r0, r0, r3
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #8]
	bl OamMalloc
	adds r2, r0, #0
	ldr r0, _08053424 @ =iwram_end
	ldr r0, [r0]
	ldr r3, [sp, #8]
	cmp r0, r2
	beq _0805344A
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #2]
	add r0, r8
	strh r0, [r4, #2]
	ldrb r0, [r5]
	cmp r0, #0x60
	bls _08053428
	ldrh r0, [r2]
	adds r0, #8
	strh r0, [r2]
	ldrb r0, [r5]
	subs r0, #0x11
	b _0805342C
	.align 2, 0
_08053424: .4byte iwram_end
_08053428:
	ldrb r0, [r5]
	subs r0, #0x20
_0805342C:
	ldr r1, [r6, #4]
	muls r0, r1, r0
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	ldr r1, _08053458 @ =0x0000F3FF
	mov ip, r1
	mov r1, ip
	ands r0, r1
	strh r0, [r2, #4]
_0805343E:
	adds r5, #1
	adds r3, #1
	movs r1, #0xe
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _080533CE
_0805344A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053458: .4byte 0x0000F3FF

.syntax divided
