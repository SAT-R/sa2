.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807A33C
sub_807A33C: @ 0x0807A33C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sl, r0
	adds r5, r3, #0
	ldr r4, [sp, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x20]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0807A3FC @ =sub_807AA68
	ldr r2, _0807A400 @ =0x00002010
	ldr r1, _0807A404 @ =sub_807AB04
	str r1, [sp]
	movs r1, #0xb0
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0x94
	adds r3, r1, r0
	movs r2, #0
	strh r4, [r3]
	ldr r4, _0807A408 @ =IWRAM_START + 0x8C
	adds r0, r1, r4
	str r2, [r0]
	ldr r5, _0807A40C @ =IWRAM_START + 0x90
	adds r0, r1, r5
	str r2, [r0]
	mov r2, sl
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	subs r4, #8
	adds r2, r1, r4
	strh r0, [r2]
	mov r5, sl
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	ldr r5, _0807A410 @ =IWRAM_START + 0x86
	adds r4, r1, r5
	strh r0, [r4]
	mov r5, sl
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	ldrh r5, [r2]
	adds r0, r0, r5
	subs r0, #0x18
	ldr r5, _0807A414 @ =IWRAM_START + 0x88
	adds r7, r1, r5
	strh r0, [r7]
	mov r5, sl
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r4]
	adds r0, r0, r5
	subs r0, #0x18
	ldr r5, _0807A418 @ =IWRAM_START + 0x8A
	adds r1, r1, r5
	strh r0, [r1]
	mov r0, sl
	str r0, [r6]
	mov r5, sb
	strh r5, [r6, #4]
	mov r0, r8
	strh r0, [r6, #6]
	mov r5, sl
	ldrb r0, [r5]
	strb r0, [r6, #8]
	add r0, sp, #0x20
	ldrb r0, [r0]
	strb r0, [r6, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807A430
	cmp r0, #1
	bgt _0807A41C
	cmp r0, #0
	beq _0807A422
	b _0807A44E
	.align 2, 0
_0807A3FC: .4byte sub_807AA68
_0807A400: .4byte 0x00002010
_0807A404: .4byte sub_807AB04
_0807A408: .4byte IWRAM_START + 0x8C
_0807A40C: .4byte IWRAM_START + 0x90
_0807A410: .4byte IWRAM_START + 0x86
_0807A414: .4byte IWRAM_START + 0x88
_0807A418: .4byte IWRAM_START + 0x8A
_0807A41C:
	cmp r0, #2
	beq _0807A43E
	b _0807A44E
_0807A422:
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r2, #0
	ldrsh r0, [r4, r2]
	b _0807A44A
_0807A430:
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r5, #0
	ldrsh r0, [r4, r5]
	b _0807A44A
_0807A43E:
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r6, #0x74]
	movs r4, #0
	ldrsh r0, [r1, r4]
_0807A44A:
	lsls r0, r0, #8
	str r0, [r6, #0x78]
_0807A44E:
	mov r5, sb
	lsls r2, r5, #8
	mov r0, r8
	lsls r0, r0, #8
	mov r8, r0
	adds r7, r6, #0
	adds r7, #0xc
	movs r1, #0x2d
	adds r1, r1, r6
	mov sb, r1
	movs r3, #0x2e
	adds r3, r3, r6
	mov ip, r3
	adds r4, r6, #0
	adds r4, #0x31
	str r4, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x2c
	str r5, [sp, #0x14]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r0, r6, #0
	adds r0, #0x5d
	str r0, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x5e
	str r3, [sp, #0xc]
	adds r4, #0x30
	str r4, [sp, #0x10]
	adds r5, #0x30
	str r5, [sp, #4]
	adds r4, #0x3b
	adds r3, #0x3a
	movs r5, #2
_0807A492:
	ldr r0, [r6, #0x74]
	str r0, [r3]
	ldr r0, [r6, #0x78]
	str r0, [r4]
	adds r4, #8
	adds r3, #8
	subs r5, #1
	cmp r5, #0
	bge _0807A492
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r2
	str r0, [r6, #0x6c]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	add r0, r8
	str r0, [r6, #0x70]
	movs r5, #0
	movs r4, #0
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	mov r2, sb
	strb r0, [r2]
	movs r3, #0x10
	mov sb, r3
	mov r2, sb
	mov r0, ip
	strb r2, [r0]
	ldr r3, [sp, #0x18]
	strb r5, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	movs r0, #8
	str r1, [sp, #0x1c]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0807A554 @ =0x00000253
	strh r0, [r7, #0xa]
	movs r0, #2
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0x90
	lsls r0, r0, #3
	ldr r1, [sp, #0x1c]
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #8]
	strb r0, [r3]
	mov r0, sb
	ldr r4, [sp, #0xc]
	strb r0, [r4]
	ldr r2, [sp, #0x10]
	strb r5, [r2]
	mov r3, r8
	str r3, [r1, #0x28]
	str r6, [r1, #0x10]
	ldr r0, _0807A558 @ =0x06012C80
	str r0, [r1, #4]
	ldr r0, _0807A55C @ =0x00000257
	strh r0, [r1, #0xa]
	ldr r4, [sp, #4]
	strb r5, [r4]
	adds r0, r1, #0
	bl sub_8004558
	movs r5, #2
	rsbs r5, r5, #0
	adds r0, r5, #0
	mov r1, sl
	strb r0, [r1]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A554: .4byte 0x00000253
_0807A558: .4byte 0x06012C80
_0807A55C: .4byte 0x00000257

	thumb_func_start sub_807A560
sub_807A560: @ 0x0807A560
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _0807A5A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807A5A4 @ =gPlayer
	adds r2, r0, #0
	adds r2, #0x6d
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x64
	strh r6, [r0]
	ldr r0, _0807A5A8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807A58C
	adds r0, r4, #0
	bl sub_807AB6C
_0807A58C:
	ldr r1, _0807A5AC @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A5DC
	cmp r0, #1
	bgt _0807A5B0
	cmp r0, #0
	beq _0807A5B6
	b _0807A61C
	.align 2, 0
_0807A5A0: .4byte gCurTask
_0807A5A4: .4byte gPlayer
_0807A5A8: .4byte gGameMode
_0807A5AC: .4byte IWRAM_START + 0x94
_0807A5B0:
	cmp r0, #2
	beq _0807A600
	b _0807A61C
_0807A5B6:
	ldr r0, [r4, #0x74]
	ldr r2, _0807A5D4 @ =0xFFFFF880
	adds r0, r0, r2
	str r0, [r4, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807A5D8 @ =IWRAM_START + 0x84
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bgt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x74]
	b _0807A61A
	.align 2, 0
_0807A5D4: .4byte 0xFFFFF880
_0807A5D8: .4byte IWRAM_START + 0x84
_0807A5DC:
	ldr r0, [r4, #0x74]
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r4, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807A5FC @ =IWRAM_START + 0x88
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	blt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x74]
	b _0807A61A
	.align 2, 0
_0807A5FC: .4byte IWRAM_START + 0x88
_0807A600:
	ldr r0, [r4, #0x78]
	ldr r1, _0807A678 @ =0xFFFFF880
	adds r0, r0, r1
	str r0, [r4, #0x78]
	asrs r0, r0, #8
	ldr r2, _0807A67C @ =IWRAM_START + 0x86
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bgt _0807A61C
	lsls r0, r1, #8
	str r0, [r4, #0x78]
_0807A61A:
	movs r6, #1
_0807A61C:
	ldr r0, _0807A680 @ =gPlayer
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x78
	bne _0807A63E
	adds r2, r4, #0
	adds r2, #0x90
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A63E
	ldr r0, [r3, #0x20]
	ldr r1, _0807A684 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	movs r0, #0
	str r0, [r2]
_0807A63E:
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A658
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A658
	adds r0, r4, #0
	bl sub_807AB18
_0807A658:
	cmp r6, #0
	beq _0807A662
	adds r0, r4, #0
	bl sub_807A73C
_0807A662:
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	adds r0, r4, #0
	bl sub_807A7F4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A678: .4byte 0xFFFFF880
_0807A67C: .4byte IWRAM_START + 0x86
_0807A680: .4byte gPlayer
_0807A684: .4byte 0xFFBFFFFF

	thumb_func_start sub_807A688
sub_807A688: @ 0x0807A688
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807A6EC @ =gPlayer
	ldr r1, [r0, #0x6c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x74]
	adds r1, r1, r0
	ldr r0, [r3, #8]
	subs r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x7c]
	mov r2, ip
	adds r2, #0x80
	ldr r1, [r1, #0x70]
	lsls r1, r1, #8
	mov r4, ip
	ldr r0, [r4, #0x78]
	adds r1, r1, r0
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r2]
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0
	movs r4, #1
	strb r4, [r1]
	subs r1, #9
	movs r2, #0
	strh r0, [r1]
	strh r0, [r3, #0x10]
	strh r0, [r3, #0x12]
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	mov r0, ip
	adds r0, #0x90
	str r4, [r0]
	mov r1, ip
	adds r1, #0xc
	adds r0, #4
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A6F6
	cmp r0, #1
	bgt _0807A6F0
	cmp r0, #0
	beq _0807A6F6
	b _0807A712
	.align 2, 0
_0807A6EC: .4byte gPlayer
_0807A6F0:
	cmp r0, #2
	beq _0807A708
	b _0807A712
_0807A6F6:
	ldr r0, _0807A704 @ =0x00000253
	strh r0, [r1, #0xa]
	mov r0, ip
	adds r0, #0x2c
	strb r2, [r0]
	b _0807A712
	.align 2, 0
_0807A704: .4byte 0x00000253
_0807A708:
	ldr r0, _0807A730 @ =0x00000253
	strh r0, [r1, #0xa]
	mov r0, ip
	adds r0, #0x2c
	strb r4, [r0]
_0807A712:
	mov r1, ip
	adds r1, #0x8c
	movs r0, #1
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807A734 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A738 @ =sub_807A560
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A730: .4byte 0x00000253
_0807A734: .4byte gCurTask
_0807A738: .4byte sub_807A560

	thumb_func_start sub_807A73C
sub_807A73C: @ 0x0807A73C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0xc
	movs r7, #0
	ldr r1, _0807A788 @ =0x00000253
	strh r1, [r0, #0xa]
	adds r2, r6, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	bl sub_8004558
	ldr r3, _0807A78C @ =gPlayer
	ldr r5, [r3, #0x20]
	movs r1, #0x80
	ands r1, r5
	cmp r1, #0
	bne _0807A7CC
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A7CC
	ldr r2, _0807A790 @ =0xFFBFFFFF
	ands r2, r5
	str r2, [r3, #0x20]
	str r1, [r4]
	adds r0, r6, #0
	adds r0, #0x94
	ldrh r1, [r0]
	cmp r1, #1
	beq _0807A7A8
	cmp r1, #1
	bgt _0807A794
	cmp r1, #0
	beq _0807A79A
	b _0807A7CC
	.align 2, 0
_0807A788: .4byte 0x00000253
_0807A78C: .4byte gPlayer
_0807A790: .4byte 0xFFBFFFFF
_0807A794:
	cmp r1, #2
	beq _0807A7BE
	b _0807A7CC
_0807A79A:
	ldr r0, _0807A7A4 @ =0x0000F880
	strh r0, [r3, #0x14]
	movs r1, #1
	orrs r2, r1
	b _0807A7B4
	.align 2, 0
_0807A7A4: .4byte 0x0000F880
_0807A7A8:
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r3, #0x14]
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
_0807A7B4:
	str r2, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x6d
	strb r1, [r0]
	b _0807A7CC
_0807A7BE:
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0xe
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6e
	strb r7, [r0]
_0807A7CC:
	adds r1, r6, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807A7EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A7F0 @ =sub_807AABC
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7EC: .4byte gCurTask
_0807A7F0: .4byte sub_807AABC

	thumb_func_start sub_807A7F4
sub_807A7F4: @ 0x0807A7F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xc
	ldr r0, _0807A824 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807A82C
	ldr r1, [r6, #0x6c]
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807A828 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #0x70]
	adds r0, r6, #0
	adds r0, #0xa4
	ldr r0, [r0]
	b _0807A840
	.align 2, 0
_0807A824: .4byte gGameMode
_0807A828: .4byte gCamera
_0807A82C:
	ldr r1, [r6, #0x6c]
	ldr r0, [r6, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807A868 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #0x70]
	ldr r0, [r6, #0x78]
_0807A840:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0807A8DC
	adds r0, r6, #0
	adds r0, #0x94
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807A890
	cmp r0, #1
	bgt _0807A86C
	cmp r0, #0
	beq _0807A872
	b _0807A8FE
	.align 2, 0
_0807A868: .4byte gCamera
_0807A86C:
	cmp r0, #2
	beq _0807A8B4
	b _0807A8FE
_0807A872:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A88C @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _0807A8CC
	.align 2, 0
_0807A88C: .4byte 0xFFFFF3FF
_0807A890:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A8B0 @ =0xFFFFF7FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	b _0807A8CC
	.align 2, 0
_0807A8B0: .4byte 0xFFFFF7FF
_0807A8B4:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A8D8 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
_0807A8CC:
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	b _0807A8FE
	.align 2, 0
_0807A8D8: .4byte 0xFFFFF3FF
_0807A8DC:
	ldr r0, [r5, #0x10]
	ldr r1, _0807A91C @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0807A8FE:
	ldrh r0, [r5, #0x16]
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	ldrh r1, [r5, #0x18]
	adds r0, r6, #0
	adds r0, #0x54
	strh r1, [r0]
	subs r0, #0x18
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A91C: .4byte 0xFFFFF3FF

	thumb_func_start sub_807A920
sub_807A920: @ 0x0807A920
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x6c]
	ldr r1, _0807A990 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x70]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x88
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	adds r0, #0x18
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x84
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	subs r0, #0x18
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807A98A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x8a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	adds r0, #0x18
	cmp r0, r5
	blt _0807A98A
	adds r0, r3, #0
	adds r0, #0x86
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	subs r0, #0x18
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807A994
_0807A98A:
	movs r0, #1
	b _0807A996
	.align 2, 0
_0807A990: .4byte gCamera
_0807A994:
	movs r0, #0
_0807A996:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807A99C
sub_807A99C: @ 0x0807A99C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807A9E8 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807AA5E
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r2, [r4, #0x74]
	asrs r2, r2, #8
	ldr r1, [r4, #0x6c]
	adds r1, r1, r2
	ldr r3, [r4, #0x78]
	asrs r3, r3, #8
	ldr r2, [r4, #0x70]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AA5E
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807A9EC
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807AA60
	.align 2, 0
_0807A9E8: .4byte gPlayer
_0807A9EC:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AA18
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807AA60
_0807AA18:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AA44
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #3
	b _0807AA60
_0807AA44:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AA5E
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AA60
_0807AA5E:
	movs r0, #0
_0807AA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AA68
sub_807AA68: @ 0x0807AA68
	push {r4, lr}
	ldr r0, _0807AAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAAC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AA84
	adds r0, r4, #0
	bl sub_807AB6C
_0807AA84:
	adds r0, r4, #0
	bl sub_807A99C
	cmp r0, #2
	bne _0807AA94
	adds r0, r4, #0
	bl sub_807A688
_0807AA94:
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAB0
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAB6
	.align 2, 0
_0807AAA8: .4byte gCurTask
_0807AAAC: .4byte gGameMode
_0807AAB0:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AABC
sub_807AABC: @ 0x0807AABC
	push {r4, lr}
	ldr r0, _0807AAF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807AAF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807AAD8
	adds r0, r4, #0
	bl sub_807AB6C
_0807AAD8:
	adds r0, r4, #0
	bl sub_807A99C
	adds r0, r4, #0
	bl sub_807A920
	cmp r0, #0
	beq _0807AAF8
	adds r0, r4, #0
	bl sub_807AB54
	b _0807AAFE
	.align 2, 0
_0807AAF0: .4byte gCurTask
_0807AAF4: .4byte gGameMode
_0807AAF8:
	adds r0, r4, #0
	bl sub_807A7F4
_0807AAFE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807AB04
sub_807AB04: @ 0x0807AB04
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807AB18
sub_807AB18: @ 0x0807AB18
	push {lr}
	ldr r3, _0807AB50 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	ldr r2, [r0, #0x6c]
	lsls r2, r2, #8
	ldr r1, [r0, #0x7c]
	adds r1, r1, r2
	ldr r2, [r0, #0x74]
	adds r1, r1, r2
	str r1, [r3, #8]
	adds r1, r0, #0
	adds r1, #0x80
	ldr r2, [r0, #0x70]
	lsls r2, r2, #8
	ldr r1, [r1]
	adds r1, r1, r2
	ldr r2, [r0, #0x78]
	adds r1, r1, r2
	str r1, [r3, #0xc]
	bl sub_807A99C
	pop {r0}
	bx r0
	.align 2, 0
_0807AB50: .4byte gPlayer

	thumb_func_start sub_807AB54
sub_807AB54: @ 0x0807AB54
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807AB68 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807AB68: .4byte gCurTask

	thumb_func_start sub_807AB6C
sub_807AB6C: @ 0x0807AB6C
	push {r4, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0xa8
	mov r4, ip
	adds r4, #0xa0
	ldr r0, [r4]
	str r0, [r1]
	adds r1, #4
	mov r3, ip
	adds r3, #0xa4
	ldr r0, [r3]
	str r0, [r1]
	mov r2, ip
	adds r2, #0x98
	ldr r0, [r2]
	str r0, [r4]
	subs r1, #0x10
	ldr r0, [r1]
	str r0, [r3]
	mov r3, ip
	ldr r0, [r3, #0x74]
	str r0, [r2]
	ldr r0, [r3, #0x78]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_0
initSprite_Interactable075_0: @ 0x0807ABA4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_1
initSprite_Interactable075_1: @ 0x0807ABC4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable075_2
initSprite_Interactable075_2: @ 0x0807ABE4
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807A33C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
