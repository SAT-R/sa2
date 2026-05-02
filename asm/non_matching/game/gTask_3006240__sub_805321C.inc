.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r6, r1, #0
	ldr r0, _08053288 @ =gTask_03006240
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldrh r1, [r6, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r7, r7, r0
	ldrb r0, [r7, #0xa]
	lsls r0, r0, #3
	mov sb, r0
	ldrb r0, [r7, #0xb]
	lsls r0, r0, #3
	str r0, [sp, #8]
	mov r2, sp
	ldrb r0, [r7, #9]
	lsls r0, r0, #0xe
	ldrb r1, [r6, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	mov r3, sp
	ldrb r1, [r7, #8]
	lsls r1, r1, #0xe
	ldrh r2, [r6, #0xa]
	ldr r5, _0805328C @ =0x000001FF
	adds r0, r5, #0
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r3, #2]
	ldrh r1, [r6, #0x12]
	lsls r1, r1, #0xc
	ldr r0, [r7]
	ldr r2, _08053290 @ =0x000003FF
	ands r0, r2
	orrs r1, r0
	strh r1, [r3, #4]
	ldrb r0, [r6, #0x16]
	cmp r0, #0
	beq _080532DC
	movs r5, #0
	mov r4, sp
	b _080532B6
	.align 2, 0
_08053288: .4byte gTask_03006240
_0805328C: .4byte 0x000001FF
_08053290: .4byte 0x000003FF
_08053294:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #2]
	add r0, sb
	strh r0, [r4, #2]
	mov r1, sl
	adds r0, r1, r5
	ldrb r0, [r0]
	subs r0, #0x20
	ldr r1, [r7, #4]
	muls r0, r1, r0
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	adds r5, #1
_080532B6:
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bge _0805335A
	ldrh r0, [r6, #8]
	adds r0, r0, r5
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl OamMalloc
	adds r2, r0, #0
	ldr r0, _080532D8 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r2
	bne _08053294
	b _0805335A
	.align 2, 0
_080532D8: .4byte iwram_end
_080532DC:
	movs r3, #0
	ldrh r0, [r6, #0x14]
	cmp r3, r0
	bge _0805335A
	mov r4, sp
	mov r8, r5
_080532E8:
	ldrb r1, [r7, #8]
	lsls r1, r1, #0xe
	ldrh r2, [r6, #0xa]
	mov r0, r8
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r4, #2]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	rsbs r0, r0, #0
	mov r1, r8
	ands r0, r1
	asrs r5, r0, #7
	adds r3, #1
	b _08053328
_08053306:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #2]
	add r0, sb
	strh r0, [r4, #2]
	mov r1, sl
	adds r0, r1, r5
	ldrb r0, [r0]
	subs r0, #0x20
	ldr r1, [r7, #4]
	muls r0, r1, r0
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	adds r5, #1
_08053328:
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bge _0805334C
	ldrh r0, [r6, #8]
	adds r0, r0, r5
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #0xc]
	bl OamMalloc
	adds r2, r0, #0
	ldr r0, _0805336C @ =iwram_end
	ldr r0, [r0]
	ldr r3, [sp, #0xc]
	cmp r0, r2
	bne _08053306
_0805334C:
	ldrh r0, [r4]
	ldr r1, [sp, #8]
	adds r0, r1, r0
	strh r0, [r4]
	ldrh r0, [r6, #0x14]
	cmp r3, r0
	blt _080532E8
_0805335A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805336C: .4byte iwram_end

.syntax divided
