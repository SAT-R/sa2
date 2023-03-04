.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Enemy_Kyura
initSprite_Enemy_Kyura: @ 0x080593B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080594B8 @ =sub_80594E0
	ldr r2, _080594BC @ =0x00004040
	ldr r1, _080594C0 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r7, _080594C4 @ =IWRAM_START + 0xC
	adds r3, r6, r7
	movs r0, #0
	mov sl, r0
	movs r2, #0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r2, [r1, #0x4c]
	str r2, [r1, #0x50]
	str r2, [r1, #0x54]
	ldrb r0, [r7, #5]
	lsls r0, r0, #2
	ldr r4, _080594C8 @ =IWRAM_START + 0x58
	adds r1, r6, r4
	strb r0, [r1]
	ldrb r0, [r7, #6]
	lsls r0, r0, #2
	ldr r7, _080594CC @ =IWRAM_START + 0x59
	adds r1, r6, r7
	strb r0, [r1]
	ldr r0, _080594D0 @ =IWRAM_START + 0x5A
	adds r1, r6, r0
	movs r0, #8
	strb r0, [r1]
	adds r4, #3
	adds r1, r6, r4
	movs r0, #0xc
	strb r0, [r1]
	strh r2, [r3, #0x16]
	strh r2, [r3, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	ldr r3, [sp, #8]
	str r0, [r3, #4]
	ldr r0, _080594D4 @ =0x000001FD
	strh r0, [r3, #0xa]
	subs r4, #0x2f
	adds r0, r6, r4
	mov r7, sl
	strb r7, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r3, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x1c]
	ldr r0, _080594D8 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r4, #2
	adds r1, r6, r4
	movs r0, #0x10
	strb r0, [r1]
	ldr r7, _080594DC @ =IWRAM_START + 0x31
	adds r6, r6, r7
	mov r0, sl
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r3, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080594B8: .4byte sub_80594E0
_080594BC: .4byte 0x00004040
_080594C0: .4byte TaskDestructor_80095E8
_080594C4: .4byte IWRAM_START + 0xC
_080594C8: .4byte IWRAM_START + 0x58
_080594CC: .4byte IWRAM_START + 0x59
_080594D0: .4byte IWRAM_START + 0x5A
_080594D4: .4byte 0x000001FD
_080594D8: .4byte IWRAM_START + 0x2D
_080594DC: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80594E0
sub_80594E0: @ 0x080594E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08059584 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _08059588 @ =IWRAM_START + 0xC
	adds r1, r1, r4
	mov r8, r1
	ldr r2, [r7]
	mov sl, r2
	ldr r3, [r7, #0x54]
	lsls r0, r3, #2
	adds r0, r0, r3
	ldr r1, _0805958C @ =0x000003FF
	adds r5, r1, #0
	ands r0, r5
	ldr r6, _08059590 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08059594 @ =IWRAM_START + 0x58
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r2, r2, #6
	str r2, [r7, #0x4c]
	lsls r0, r3, #1
	adds r0, r0, r3
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08059598 @ =IWRAM_START + 0x59
	adds r4, r4, r0
	ldrb r0, [r4]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r7, #0x50]
	ldr r1, [r7, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r2, [r7, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [sp, #0x18]
	ldr r4, _0805959C @ =gCamera
	ldr r0, [r4]
	adds r3, r1, #0
	subs r0, r3, r0
	mov r3, r8
	strh r0, [r3, #0x16]
	ldr r0, [r4, #4]
	ldr r3, [sp, #0x18]
	subs r0, r3, r0
	mov r3, r8
	strh r0, [r3, #0x18]
	mov r0, r8
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080595A0
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _080596A0
	.align 2, 0
_08059584: .4byte gCurTask
_08059588: .4byte IWRAM_START + 0xC
_0805958C: .4byte 0x000003FF
_08059590: .4byte gSineTable
_08059594: .4byte IWRAM_START + 0x58
_08059598: .4byte IWRAM_START + 0x59
_0805959C: .4byte gCamera
_080595A0:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080595CE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080595CE
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080595CE
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805960C
_080595CE:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080595F6
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080595F6
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805960C
_080595F6:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08059608 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080596A0
	.align 2, 0
_08059608: .4byte gCurTask
_0805960C:
	adds r1, r7, #0
	adds r1, #0x5a
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059688
	movs r0, #4
	strb r0, [r1]
	adds r4, r7, #0
	adds r4, #0x5b
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	ands r0, r2
	cmp r0, #0
	bne _08059680
	movs r0, #0xc
	strb r0, [r4]
	ldr r2, _080596B0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080596B4 @ =0x00196225
	muls r0, r1, r0
	ldr r3, _080596B8 @ =0x3C6EF35F
	adds r0, r0, r3
	str r0, [r2]
	movs r2, #1
	ands r2, r0
	mov r1, sp
	movs r0, #3
	strh r0, [r1]
	movs r0, #0xff
	lsls r0, r0, #1
	strh r0, [r1, #2]
	mov r0, sp
	strb r2, [r0, #4]
	ldr r0, [sp, #0x14]
	adds r0, #1
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #0x14
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #6]
	lsls r2, r2, #8
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	subs r0, r0, r2
	strh r0, [r1, #8]
	mov r0, sp
	bl sub_8050E04
_08059680:
	ldr r0, _080596BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080596C0 @ =sub_80596C4
	str r0, [r1, #8]
_08059688:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #8
	ldr r2, [sp, #0x18]
	lsls r1, r2, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_080596A0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080596B0: .4byte gPseudoRandom
_080596B4: .4byte 0x00196225
_080596B8: .4byte 0x3C6EF35F
_080596BC: .4byte gCurTask
_080596C0: .4byte sub_80596C4

	thumb_func_start sub_80596C4
sub_80596C4: @ 0x080596C4
	push {r4, r5, lr}
	ldr r3, _0805970C @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #0xc
	adds r4, r0, r1
	ldr r5, _08059710 @ =IWRAM_START + 0x5A
	adds r1, r0, r5
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080596FA
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r2, #0x54]
	adds r0, #8
	ldr r1, _08059714 @ =0x000003FF
	ands r0, r1
	str r0, [r2, #0x54]
	ldr r1, [r3]
	ldr r0, _08059718 @ =sub_80594E0
	str r0, [r1, #8]
_080596FA:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805970C: .4byte gCurTask
_08059710: .4byte IWRAM_START + 0x5A
_08059714: .4byte 0x000003FF
_08059718: .4byte sub_80594E0
