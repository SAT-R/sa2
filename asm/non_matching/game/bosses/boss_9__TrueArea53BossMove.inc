.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0     @ r7 = dX
	adds r6, r1, #0     @ r6 = dY
	ldr r0, _0804D694 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _0804D684
	ldrh r2, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r2, r3     @ r3 = boss
	ldr r0, _0804D698 @ =IWRAM_START + 0x1C
	adds r1, r2, r0     @ r1 = &boss->unk1C
	adds r0, #0x7c
	adds r0, r0, r2
	mov sb, r0          @ sb = r0 = &boss->unk98
	ldr r0, [r1, #0x24]
	adds r0, r0, r7
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x28]
	adds r0, r0, r6
	str r0, [r1, #0x28]
	ldr r0, [r3, #0x14]
	adds r0, r0, r7
	str r0, [r3, #0x14]
	ldr r0, [r3, #0x18]
	adds r0, r0, r6
	str r0, [r3, #0x18] @ boss->pos14.y += dY;
	movs r4, #0
	ldr r0, _0804D69C @ =IWRAM_START + 0x5D4
	adds r0, r2, r0
	str r0, [sp, #4]    @ sp04 = &boss->unk594.unk40[0].x
	ldr r0, _0804D6A0 @ =IWRAM_START + 0x5D8
	adds r0, r0, r2
	mov sl, r0          @ sl = &boss->unk594.unk40[0].y
	ldr r0, _0804D6A4 @ =IWRAM_START + 0x6C4
	adds r0, r2, r0
	str r0, [sp, #8]    @ sp08 = &boss->unk654.unk70[0].x
	ldr r0, _0804D6A8 @ =IWRAM_START + 0x6C8
	adds r0, r2, r0
	str r0, [sp]        @ sp00 = &boss->unk654.unk70[0].y
	asrs r0, r7, #8
	mov r8, r0          @ r8 = I(dX)
	asrs r0, r6, #8
	mov ip, r0          @ ip = I(dY)
_0804D5F8:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r4
	lsls r1, r1, #4     @ r1 = i*0x190
	adds r1, #0x10
	add r1, sb          @ r1 = &boss->unk98.unk10[i]
	ldr r0, [r1, #0x14]
	adds r0, r0, r7
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x18]
	adds r0, r0, r6
	str r0, [r1, #0x18]
	movs r5, #0
	lsls r2, r4, #3     @ r2 = i * 8
	adds r0, r1, #0
	adds r0, #0x78
	adds r3, r0, r2
	adds r1, #0x7c
	adds r1, r1, r2
_0804D620:
	ldr r0, [r3]
	add r0, r8
	str r0, [r3]
	ldr r0, [r1]
	add r0, ip
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _0804D620
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804D5F8
	movs r4, #0
	ldr r5, [sp, #4]    @ r5 = sp04 = &boss->unk594.unk40[0].x
	mov r3, sl
_0804D646:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0804D646
	movs r4, #0
	ldr r5, [sp, #8]    @ r5 = &boss->unk654.unk70[0].x
	ldr r3, [sp]
_0804D668:
	lsls r1, r4, #3
	adds r2, r5, r1
	ldr r0, [r2]
	adds r0, r0, r7
	str r0, [r2]
	adds r1, r3, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0804D668
_0804D684:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D694: .4byte gActiveBossTask
_0804D698: .4byte IWRAM_START + 0x1C
_0804D69C: .4byte IWRAM_START + 0x5D4
_0804D6A0: .4byte IWRAM_START + 0x5D8
_0804D6A4: .4byte IWRAM_START + 0x6C4
_0804D6A8: .4byte IWRAM_START + 0x6C8

.syntax divided
