.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_02012348
sub_02012348: @ 0x02012348
	cmp r1, #0
	beq _020123D0
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _0201235E
	rsbs r1, r1, #0
_0201235E:
	cmp r0, #0
	bpl _02012364
	rsbs r0, r0, #0
_02012364:
	cmp r0, r1
	blo _020123C2
	movs r4, #1
	lsls r4, r4, #0x1c
_0201236C:
	cmp r1, r4
	bhs _0201237A
	cmp r1, r0
	bhs _0201237A
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0201236C
_0201237A:
	lsls r4, r4, #3
_0201237C:
	cmp r1, r4
	bhs _0201238A
	cmp r1, r0
	bhs _0201238A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0201237C
_0201238A:
	cmp r0, r1
	blo _02012392
	subs r0, r0, r1
	orrs r2, r3
_02012392:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _0201239E
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_0201239E:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _020123AA
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_020123AA:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _020123B6
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_020123B6:
	cmp r0, #0
	beq _020123C2
	lsrs r3, r3, #4
	beq _020123C2
	lsrs r1, r1, #4
	b _0201238A
_020123C2:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _020123CC
	rsbs r0, r0, #0
_020123CC:
	pop {r4}
	mov pc, lr
_020123D0:
	push {lr}
	bl sub_020123dc
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start sub_020123dc
sub_020123dc: @ 0x020123DC
	mov pc, lr
	.align 2, 0

	thumb_func_start sub_020123e0
sub_020123e0: @ 0x020123E0
	movs r3, #1
	cmp r1, #0
	beq _020124A4
	bpl _020123EA
	rsbs r1, r1, #0
_020123EA:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _020123F4
	rsbs r0, r0, #0
_020123F4:
	cmp r0, r1
	blo _02012498
	movs r4, #1
	lsls r4, r4, #0x1c
_020123FC:
	cmp r1, r4
	bhs _0201240A
	cmp r1, r0
	bhs _0201240A
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _020123FC
_0201240A:
	lsls r4, r4, #3
_0201240C:
	cmp r1, r4
	bhs _0201241A
	cmp r1, r0
	bhs _0201241A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0201240C
_0201241A:
	movs r2, #0
	cmp r0, r1
	blo _02012422
	subs r0, r0, r1
_02012422:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _02012434
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02012434:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _02012446
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02012446:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _02012458
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_02012458:
	mov ip, r3
	cmp r0, #0
	beq _02012466
	lsrs r3, r3, #4
	beq _02012466
	lsrs r1, r1, #4
	b _0201241A
_02012466:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _02012498
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _0201247C
	lsrs r4, r1, #3
	adds r0, r0, r4
_0201247C:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _0201248A
	lsrs r4, r1, #2
	adds r0, r0, r4
_0201248A:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _02012498
	lsrs r4, r1, #1
	adds r0, r0, r4
_02012498:
	pop {r4}
	cmp r4, #0
	bpl _020124A0
	rsbs r0, r0, #0
_020124A0:
	pop {r4}
	mov pc, lr
_020124A4:
	push {lr}
	bl sub_020123dc
	movs r0, #0
	pop {pc}
	.align 2, 0
