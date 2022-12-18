.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
