.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_SpotLightMain
Task_SpotLightMain: @ 0x0800A744
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0800A7B8 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov ip, r1
	adds r5, r0, r1
	ldr r0, _0800A7BC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	beq _0800A76E
	b Task_SpotLightMain_Return
_0800A76E:
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r0, r2
	ldr r2, _0800A7C0 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #7
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	bne _0800A7C8
	ldrb r6, [r3, #0xb]
	adds r4, r6, #0
	cmp r4, #0
	beq _0800A7C8
	ldr r2, _0800A7C4 @ =gDispCnt
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0800A7D8
	cmp r4, #0x1f
	bhi _0800A7A4
	adds r0, r6, #1
	strb r0, [r3, #0xb]
_0800A7A4:
	ldr r0, [r5, #4]
	ldrh r0, [r0, #6]
	mov r1, ip
	adds r3, r0, r1
	ldrb r0, [r3, #0xb]
	cmp r0, #0xf
	bhi _0800A800
	adds r0, #1
	strb r0, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7B8: .4byte gCurTask
_0800A7BC: .4byte gUnknown_03005424
_0800A7C0: .4byte gUnknown_03005590
_0800A7C4: .4byte gDispCnt
_0800A7C8:
	ldr r2, _0800A7F0 @ =gDispCnt
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0800A800
_0800A7D8:
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	bne _0800A7F4
	movs r2, #4
	strb r2, [r3, #0xb]
	ldr r0, [r5, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	strb r2, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7F0: .4byte gDispCnt
_0800A7F4:
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
_0800A800:
	ldr r2, [r5, #0xc]
	ldr r0, _0800A880 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A884 @ =gSineTable
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _0800A888 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r5, #0xc]
	ldr r1, _0800A88C @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	ldrh r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r1, _0800A890 @ =gWinRegs
	ldr r0, _0800A894 @ =0x00003F3F
	strh r0, [r1, #8]
	movs r0, #0x1e
	strh r0, [r1, #0xa]
	ldrh r0, [r5, #8]
	subs r0, #0x40
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	ldr r1, _0800A898 @ =0x05FF0000
	cmp r0, r1
	bgt _0800A85A
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #8]
_0800A85A:
	ldr r1, _0800A89C @ =gBldRegs
	ldr r0, _0800A8A0 @ =0x00003F41
	strh r0, [r1]
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #4]
	ldr r0, _0800A8A4 @ =gPlayer
	ldr r0, [r0, #0x20]
	ldr r1, _0800A8A8 @ =0x8000080
	ands r0, r1
	cmp r0, #0
	beq _0800A8B0
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0800A8AC @ =Task_800A8E0
	str r0, [r1, #8]
	b Task_SpotLightMain_Return
	.align 2, 0
_0800A880: .4byte 0xFFFFFE00
_0800A884: .4byte gSineTable
_0800A888: .4byte 0x000001FF
_0800A88C: .4byte gBgScrollRegs
_0800A890: .4byte gWinRegs
_0800A894: .4byte 0x00003F3F
_0800A898: .4byte 0x05FF0000
_0800A89C: .4byte gBldRegs
_0800A8A0: .4byte 0x00003F41
_0800A8A4: .4byte gPlayer
_0800A8A8: .4byte 0x8000080
_0800A8AC: .4byte Task_800A8E0
_0800A8B0:
	ldr r0, _0800A8D8 @ =gUnknown_030054E4
	ldrb r0, [r0]
	cmp r0, #0
	beq Task_SpotLightMain_Return
	ldr r0, [r5]
	bl TaskDestroy
	ldr r0, [r5, #4]
	bl TaskDestroy
	ldr r0, _0800A8DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
Task_SpotLightMain_Return:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A8D8: .4byte gUnknown_030054E4
_0800A8DC: .4byte gCurTask

	thumb_func_start Task_800A8E0
Task_800A8E0: @ 0x0800A8E0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r3, r0, r1
	ldr r2, _0800A99C @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _0800A918
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A918
	subs r0, #2
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0800A918
	movs r5, #1
_0800A918:
	ldr r0, [r4, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800A940
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A940
	subs r0, #1
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0800A940
	movs r5, #1
_0800A940:
	ldr r2, [r4, #0xc]
	ldr r0, _0800A9A0 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A9A4 @ =gSineTable
	ldr r0, [r6]
	ldr r1, _0800A9A8 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r4, #0xc]
	ldr r1, _0800A9AC @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	cmp r5, #0
	beq _0800A990
	ldr r2, _0800A9B0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, [r4, #4]
	bl TaskDestroy
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0800A990:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A998: .4byte gCurTask
_0800A99C: .4byte gUnknown_03005590
_0800A9A0: .4byte 0xFFFFFE00
_0800A9A4: .4byte gSineTable
_0800A9A8: .4byte 0x000001FF
_0800A9AC: .4byte gBgScrollRegs
_0800A9B0: .4byte gDispCnt
_0800A9B4: .4byte 0x0000FEFF

	thumb_func_start TaskDestructor_SpotLightMain
TaskDestructor_SpotLightMain: @ 0x0800A9B8
	ldr r2, _0800A9E4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9E8 @ =0x00009FFF
	ands r0, r1
	ldr r1, _0800A9EC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0800A9F0 @ =gBldRegs
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #4]
	ldr r0, _0800A9F4 @ =gWinRegs
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0, #6]
	ldr r2, _0800A9F8 @ =gFlags
	ldr r0, [r2]
	subs r1, #5
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800A9E4: .4byte gDispCnt
_0800A9E8: .4byte 0x00009FFF
_0800A9EC: .4byte 0x0000FEFF
_0800A9F0: .4byte gBldRegs
_0800A9F4: .4byte gWinRegs
_0800A9F8: .4byte gFlags
