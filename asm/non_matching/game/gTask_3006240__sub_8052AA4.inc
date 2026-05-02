.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08052B74 @ =gUnknown_030063C0
	mov ip, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _08052B50
	ldr r1, _08052B78 @ =gTask_03006240
	mov sl, r1
_08052ABC_loop:
	mov r2, ip
	ldr r2, [r2]    @ r2 = list
	mov ip, r2
	mov r1, sl
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0 @ r5 = strc0 = TASK_DATA(gTask_03006240);
	ldr r1, [r2, #0x1c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r5, r0 @ r5 = strc0
	ldr r1, [r2, #0x14]
	lsls r1, r1, #6
	mov r6, ip
	adds r6, #0x20
	ldrb r3, [r6]   @ r3 = list->unk20
	ldr r0, [r2, #0x10]
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0 @ r1 = 
	ldr r0, [r2, #0x18]
	lsls r0, r0, #1
	ldr r2, _08052B7C @ =gBgCntRegs
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0xf8
	lsls r0, r0, #5     @ r0 = 0x1F00
	ands r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13  @ r0 = VRAM
	adds r0, r0, r1
	mov sb, r0          @ sb = vram = BG_CHAR_ADDR_FROM_SCREENBASE(list->unk18) + vramOffset;
	movs r4, #0
	movs r1, #0
	cmp r1, r3
	bhs _08052B48
	mov r8, r6          @ r8 = r6 = &list->unk20
_08052B10:
	movs r2, #0
	adds r7, r1, #1
	adds r6, r4, #1
	ldrb r0, [r5, #0xb]
	cmp r2, r0
	bhs _08052B3C
	ldr r3, [r5, #4]
	muls r1, r3, r1
	mov r0, ip
	adds r0, #4
	adds r4, r0, r4
	add r1, sb      @ r1 = vram + (strc0->unk4 * i)
_08052B28:
	ldrb r0, [r4]
	subs r0, #0x20
	muls r0, r3, r0
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r2, #1
	ldrb r0, [r5, #0xb]
	cmp r2, r0
	blo _08052B28
_08052B3C:
	adds r1, r7, #0
	adds r4, r6, #0
	mov r2, r8
	ldrb r2, [r2]
	cmp r1, r2
	blo _08052B10
_08052B48:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, #0
	bne _08052ABC_loop
_08052B50:
	ldr r2, _08052B80 @ =gUnknown_030063F0
	ldr r0, [r2]
	mov r1, ip
	str r0, [r1]
	ldr r2, _08052B74 @ =gUnknown_030063C0
	ldr r0, [r2]
	ldr r1, _08052B80 @ =gUnknown_030063F0
	str r0, [r1]
	movs r0, #0
	str r0, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052B74: .4byte gUnknown_030063C0
_08052B78: .4byte gTask_03006240
_08052B7C: .4byte gBgCntRegs
_08052B80: .4byte gUnknown_030063F0

.syntax divided
