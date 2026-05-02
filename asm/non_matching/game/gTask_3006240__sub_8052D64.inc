.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	ldr r0, _08052DC8 @ =gTask_03006240
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldrh r1, [r4, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r5, r0
	ldrh r0, [r4, #4]   @ r0: angle
	movs r2, #0
	ldrsh r1, [r4, r2]  @ r1: p1
	movs r3, #2
	ldrsh r2, [r4, r3]  @ r2: p2
	ldrh r3, [r4, #6]   @ r3: affineIndex
	bl sa2__sub_80047A0
	ldrh r7, [r4, #6]
	mov r8, r7
	mov r2, sp
	movs r1, #0xc0
	lsls r1, r1, #2
	ldrb r0, [r5, #9]
	lsls r0, r0, #0xe
	orrs r0, r1
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r2]
	mov r3, sp
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #0xc
	ldr r0, [r5]
	ldr r2, _08052DCC @ =0x000003FF
	ands r0, r2
	orrs r1, r0
	strh r1, [r3, #4]
	movs r6, #0
	mov sl, sp
	b _08052E0A
	.align 2, 0
_08052DC8: .4byte gTask_03006240
_08052DCC: .4byte 0x000003FF
_08052DD0:
	mov r1, sl
	ldrh r0, [r1]
	strh r0, [r3]
	ldrb r2, [r5, #8]
	lsls r2, r2, #0xe
	mov r7, r8
	lsls r0, r7, #9
	orrs r2, r0
	ldrb r0, [r5, #0xa]
	muls r0, r6, r0
	lsls r0, r0, #3
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	ldr r7, _08052E38 @ =0x000001FF
	adds r1, r7, #0
	ands r0, r1
	orrs r2, r0
	strh r2, [r3, #2]
	mov r1, sb
	adds r0, r1, r6
	ldrb r0, [r0]
	subs r0, #0x20
	ldr r1, [r5, #4]
	muls r0, r1, r0
	mov r2, sl
	ldrh r2, [r2, #4]
	adds r0, r0, r2
	strh r0, [r3, #4]
	adds r6, #1
_08052E0A:
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r6, r0
	bge _08052E28
	ldrh r0, [r4, #8]
	lsrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08052E3C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	bne _08052DD0
_08052E28:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052E38: .4byte 0x000001FF
_08052E3C: .4byte iwram_end

.syntax divided
