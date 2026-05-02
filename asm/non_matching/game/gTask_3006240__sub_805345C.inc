.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0      @ sb = param0
	adds r7, r1, #0 @ r7 = param1
	ldr r0, _080534C0 @ =gTask_03006240
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0         @ r6 = strc
	ldrh r1, [r7, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r6, r0         @ r6 = strc0
	ldrb r0, [r6, #0xa]
	lsls r0, r0, #3
	mov r8, r0              @ r8 = r8 = strc0->unkA * 8;
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
	ldr r0, _080534C4 @ =0x000001FF
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r3, #2]
	ldrh r0, [r7, #0x12]
	lsls r0, r0, #0xc
	ldr r1, [r6]
	ldr r2, _080534C8 @ =0x000003FF
	ands r1, r2
	orrs r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #4]
	movs r5, #0
	mov r4, sp
	b _080534EE
	.align 2, 0
_080534C0: .4byte gTask_03006240
_080534C4: .4byte 0x000001FF
_080534C8: .4byte 0x000003FF
_080534CC:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #2]
	add r0, r8
	strh r0, [r4, #2]
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	subs r0, #0x20
	ldr r1, [r6, #4]
	muls r0, r1, r0
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	adds r5, #1
_080534EE:
	movs r2, #0xe
	ldrsh r0, [r7, r2]
	cmp r5, r0
	bge _0805350E
	ldrh r0, [r7, #8]
	adds r0, r0, r5
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl OamMalloc
	adds r2, r0, #0
	ldr r0, _0805351C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r2
	bne _080534CC
_0805350E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805351C: .4byte iwram_end

.syntax divided
