.include "asm/macros.inc"
.include "constants/constants.inc"

@ NOTE: The name of this module is not final!
@       Make sure to split and/or rename the module accordingly.

.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start sub_802D170
sub_802D170: @ 0x0802D170
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _0802D1A8 @ =gStageUITask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D1AC @ =IWRAM_START + 0x90
	adds r2, r2, r0
	mov sb, r2
	movs r0, #0xa
	mov r8, r0
	movs r7, #1
	cmp r4, #9
	bhi _0802D1B0
	movs r6, #1
	b _0802D1F2
	.align 2, 0
_0802D1A8: .4byte gStageUITask
_0802D1AC: .4byte IWRAM_START + 0x90
_0802D1B0:
	cmp r4, #0x63
	bhi _0802D1B8
	movs r6, #2
	b _0802D1F2
_0802D1B8:
	ldr r0, _0802D1C4 @ =999
	cmp r4, r0
	bhi _0802D1C8
	movs r6, #3
	b _0802D1F2
	.align 2, 0
_0802D1C4: .4byte 999
_0802D1C8:
	ldr r0, _0802D1D4 @ =9999
	cmp r4, r0
	bhi _0802D1D8
	movs r6, #4
	b _0802D1F2
	.align 2, 0
_0802D1D4: .4byte 9999
_0802D1D8:
	ldr r0, _0802D1E4 @ =99999
	cmp r4, r0
	bhi _0802D1E8
	movs r6, #5
	b _0802D1F2
	.align 2, 0
_0802D1E4: .4byte 99999
_0802D1E8:
	ldr r0, _0802D258 @ =999999
	movs r6, #7
	cmp r4, r0
	bhi _0802D1F2
	movs r6, #6
_0802D1F2:
	cmp r7, #0
	beq _0802D246
	cmp r6, #0
	beq _0802D246
	adds r5, r1, #0
_0802D1FC:
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, sb
	mov r2, r8
	muls r2, r7, r2
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r5, [r0, #0x16]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x25
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x10]
	bl sub_80051E8
	adds r4, r7, #0
	subs r5, #8
	subs r6, #1
	cmp r4, #0
	beq _0802D246
	cmp r6, #0
	bne _0802D1FC
_0802D246:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D258: .4byte 999999

	thumb_func_start TaskDestructor_CreateStageUi
TaskDestructor_CreateStageUi: @ 0x0802D25C
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r0, _0802D290 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802D280
	ldr r0, [r4, #0x64]
	bl VramFree
_0802D280:
	ldr r1, _0802D294 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D290: .4byte gGameMode
_0802D294: .4byte IWRAM_START + 0x94
