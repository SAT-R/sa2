.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_BouncyBar
initSprite_Interactable_BouncyBar: @ 0x080614EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sl, r6
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080615E4 @ =sub_806160C
	ldr r2, _080615E8 @ =0x00002010
	ldr r1, _080615EC @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _080615F0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	movs r3, #0
	movs r2, #0
	strh r5, [r1, #4]
	mov r6, sl
	strh r6, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	mov r6, r8
	strb r6, [r1, #9]
	ldr r6, _080615F4 @ =IWRAM_START + 0x3C
	adds r0, r4, r6
	strb r3, [r0]
	adds r6, #1
	adds r0, r4, r6
	strb r3, [r0]
	strh r2, [r1, #0x3e]
	ldr r1, _080615F8 @ =IWRAM_START + 0x40
	adds r0, r4, r1
	strh r2, [r0]
	mov r6, sb
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r1, sl
	lsls r6, r1, #8
	adds r0, r0, r6
	strh r0, [r7, #0x18]
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _080615FC @ =0x0000021A
	strh r0, [r7, #0xa]
	ldr r6, _08061600 @ =IWRAM_START + 0x2C
	adds r0, r4, r6
	ldr r3, [sp, #8]
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _08061604 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08061608 @ =IWRAM_START + 0x2E
	adds r1, r4, r2
	movs r0, #0x10
	strb r0, [r1]
	adds r6, #5
	adds r4, r4, r6
	strb r3, [r4]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080615D2
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_080615D2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080615E4: .4byte sub_806160C
_080615E8: .4byte 0x00002010
_080615EC: .4byte TaskDestructor_80095E8
_080615F0: .4byte IWRAM_START + 0xC
_080615F4: .4byte IWRAM_START + 0x3C
_080615F8: .4byte IWRAM_START + 0x40
_080615FC: .4byte 0x0000021A
_08061600: .4byte IWRAM_START + 0x2C
_08061604: .4byte IWRAM_START + 0x2D
_08061608: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_806160C
sub_806160C: @ 0x0806160C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080616D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r6, r1, r0
	ldr r4, _080616D8 @ =IWRAM_START + 0xC
	add r4, r8
	ldr r2, [r6]
	mov sl, r2
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r5, r1, r0
	ldr r1, _080616DC @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r4, #0x18]
	ldr r7, _080616E0 @ =gPlayer
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08061750
	str r7, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #1
	bne _08061750
	ldrh r0, [r7, #0x12]
	lsls r2, r0, #0x10
	cmp r2, #0
	ble _08061750
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r0, #4
	cmp r0, r5
	bge _08061750
	adds r1, r7, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	asrs r0, r2, #0x1a
	ldr r2, _080616E4 @ =IWRAM_START + 0x3C
	add r2, r8
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080616AA
	movs r0, #2
	strb r0, [r2]
_080616AA:
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #0xa
	ldr r1, _080616E8 @ =IWRAM_START + 0x3D
	add r1, r8
	strb r0, [r1]
	ldr r1, _080616EC @ =gUnknown_080D94E8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x3e]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, sb
	subs r2, r1, r0
	cmp r2, #0
	blt _080616F0
	adds r1, r2, #0
	b _080616F4
	.align 2, 0
_080616D4: .4byte gCurTask
_080616D8: .4byte IWRAM_START + 0xC
_080616DC: .4byte gCamera
_080616E0: .4byte gPlayer
_080616E4: .4byte IWRAM_START + 0x3C
_080616E8: .4byte IWRAM_START + 0x3D
_080616EC: .4byte gUnknown_080D94E8
_080616F0:
	mov r2, sb
	subs r1, r0, r2
_080616F4:
	adds r0, r6, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, _0806173C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08061740 @ =sub_80617A4
	str r0, [r1, #8]
	ldr r2, _08061744 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, r6, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #2
	subs r0, r3, r0
	strb r0, [r2]
	ldr r0, _08061748 @ =0x0000021A
	strh r0, [r4, #0xa]
	ldrb r0, [r2]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r2]
	subs r3, r3, r0
	strb r3, [r2]
	ldr r0, _0806174C @ =0x00000117
	bl m4aSongNumStart
	b _08061788
	.align 2, 0
_0806173C: .4byte gCurTask
_08061740: .4byte sub_80617A4
_08061744: .4byte gPlayer
_08061748: .4byte 0x0000021A
_0806174C: .4byte 0x00000117
_08061750:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08061774
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08061774
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08061788
_08061774:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08061784 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08061794
	.align 2, 0
_08061784: .4byte gCurTask
_08061788:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08061794:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80617A4
sub_80617A4: @ 0x080617A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, _080618A4 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r7]
	mov ip, r1
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _080618A8 @ =gCamera
	ldr r0, [r3]
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r3, _080618AC @ =IWRAM_START + 0x3D
	adds r2, r4, r3
	ldrb r0, [r2]
	mov r8, r6
	cmp r0, #0
	beq _0806186E
	subs r0, #1
	strb r0, [r2]
	ldr r6, _080618B0 @ =gPlayer
	ldr r0, _080618B4 @ =IWRAM_START + 0x40
	adds r3, r4, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov sb, r1
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	mov r1, sb
	muls r1, r0, r1
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806186E
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x11
	asrs r1, r1, #0x12
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x18
	ble _0806182E
	movs r3, #0x18
_0806182E:
	ldr r1, _080618B8 @ =gUnknown_080D94F2
	ldr r2, _080618BC @ =IWRAM_START + 0x3C
	adds r2, r4, r2
	str r2, [sp]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r6, #0x12]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r1, _080618C0 @ =gUnknown_080D94EE
	ldr r4, [sp]
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r3, r0
	asrs r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #0x12]
	ldr r0, [r6, #0x20]
	ldr r1, _080618C4 @ =0xFFBFFFFF
	ands r0, r1
	ldr r1, _080618C8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
_0806186E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08061892
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08061892
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080618CC
_08061892:
	ldrb r0, [r7, #8]
	mov r3, ip
	strb r0, [r3]
	mov r4, r8
	ldr r0, [r4]
	bl TaskDestroy
	b _080618F8
	.align 2, 0
_080618A4: .4byte gCurTask
_080618A8: .4byte gCamera
_080618AC: .4byte IWRAM_START + 0x3D
_080618B0: .4byte gPlayer
_080618B4: .4byte IWRAM_START + 0x40
_080618B8: .4byte gUnknown_080D94F2
_080618BC: .4byte IWRAM_START + 0x3C
_080618C0: .4byte gUnknown_080D94EE
_080618C4: .4byte 0xFFBFFFFF
_080618C8: .4byte 0xFFFFFEFF
_080618CC:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _080618F2
	movs r1, #0
	ldr r0, _08061908 @ =0x0000021A
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0806190C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08061910 @ =sub_806160C
	str r0, [r1, #8]
_080618F2:
	adds r0, r5, #0
	bl sub_80051E8
_080618F8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061908: .4byte 0x0000021A
_0806190C: .4byte gCurTask
_08061910: .4byte sub_806160C
