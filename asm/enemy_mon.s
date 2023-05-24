.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_Enemy_Mon
Task_Enemy_Mon: @ 0x0805133C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _08051388 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0xc
	adds r4, r6, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r0, [r5, #0x3c]
	asrs r0, r0, #8
	ldr r2, _0805138C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r5, #0x40]
	asrs r2, r2, #8
	adds r0, r4, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051390
	ldr r0, [r7]
	bl TaskDestroy
	b _08051462
	.align 2, 0
_08051388: .4byte gCurTask
_0805138C: .4byte gCamera
_08051390:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080513B4
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _080513B4
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080513C8
_080513B4:
	ldrb r0, [r5, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080513C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051462
	.align 2, 0
_080513C4: .4byte gCurTask
_080513C8:
	ldr r0, _08051428 @ =gPlayer
	ldr r3, [r5, #0x3c]
	ldr r2, _0805142C @ =0xFFFF8800
	adds r1, r3, r2
	ldr r2, [r0, #8]
	mov ip, r0
	cmp r2, r1
	ble _08051416
	movs r1, #0xf0
	lsls r1, r1, #7
	adds r0, r3, r1
	cmp r2, r0
	bge _08051416
	ldr r2, [r5, #0x40]
	ldr r3, _08051430 @ =0xFFFFCE00
	adds r0, r2, r3
	mov r3, ip
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _08051416
	movs r3, #0xc8
	lsls r3, r3, #6
	adds r0, r2, r3
	cmp r1, r0
	bge _08051416
	ldr r1, [r7]
	ldr r0, _08051434 @ =sub_805146C
	str r0, [r1, #8]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	ldr r0, _08051438 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _0805143C @ =IWRAM_START + 0x2D
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
_08051416:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [r5, #0x3c]
	cmp r1, r0
	bge _08051444
	ldr r0, [r4, #0x10]
	ldr r1, _08051440 @ =0xFFFFFBFF
	ands r0, r1
	b _0805144C
	.align 2, 0
_08051428: .4byte gPlayer
_0805142C: .4byte 0xFFFF8800
_08051430: .4byte 0xFFFFCE00
_08051434: .4byte sub_805146C
_08051438: .4byte IWRAM_START + 0x2C
_0805143C: .4byte IWRAM_START + 0x2D
_08051440: .4byte 0xFFFFFBFF
_08051444:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_0805144C:
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08051462:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805146C
sub_805146C: @ 0x0805146C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _080514B8 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0xc
	adds r5, r6, r0
	ldr r1, [r4]
	mov r8, r1
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	ldr r2, _080514BC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r4, #0x40]
	asrs r2, r2, #8
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080514C0
	ldr r0, [r7]
	bl TaskDestroy
	b _08051534
	.align 2, 0
_080514B8: .4byte gCurTask
_080514BC: .4byte gCamera
_080514C0:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080514E4
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080514E4
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080514F8
_080514E4:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080514F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051534
	.align 2, 0
_080514F4: .4byte gCurTask
_080514F8:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x40]
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _0805152E
	ldr r0, _08051540 @ =0xFFFFFA80
	str r0, [r4, #0x48]
	str r1, [r4, #0x44]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	ldr r0, _08051544 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08051548 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0805154C @ =sub_8051550
	str r0, [r1, #8]
_0805152E:
	adds r0, r5, #0
	bl sub_80051E8
_08051534:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051540: .4byte 0xFFFFFA80
_08051544: .4byte IWRAM_START + 0x2C
_08051548: .4byte IWRAM_START + 0x2D
_0805154C: .4byte sub_8051550

	thumb_func_start sub_8051550
sub_8051550: @ 0x08051550
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _080515B0 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, #0xc
	adds r5, r6, r0
	ldr r1, [r4]
	mov r8, r1
	ldr r1, [r4, #0x48]
	adds r1, #0x34
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	ldr r2, _080515B4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x44]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080515B8
	ldr r0, [r7]
	bl TaskDestroy
	b _0805162A
	.align 2, 0
_080515B0: .4byte gCurTask
_080515B4: .4byte gCamera
_080515B8:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080515DC
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080515DC
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080515F0
_080515DC:
	ldrb r0, [r4, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080515EC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805162A
	.align 2, 0
_080515EC: .4byte gCurTask
_080515F0:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	blt _08051612
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r5, #0xa]
	ldr r0, _08051634 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08051638 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0805163C @ =sub_8051640
	str r0, [r1, #8]
_08051612:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805162A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051634: .4byte IWRAM_START + 0x2C
_08051638: .4byte IWRAM_START + 0x2D
_0805163C: .4byte sub_8051640

	thumb_func_start sub_8051640
sub_8051640: @ 0x08051640
	push {r4, r5, r6, r7, lr}
	ldr r6, _08051688 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r7, [r5]
	ldr r0, [r5, #0x3c]
	asrs r0, r0, #8
	ldr r2, _0805168C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	ldr r2, [r5, #0x40]
	asrs r2, r2, #8
	adds r0, r4, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051690
	ldr r0, [r6]
	bl TaskDestroy
	b _08051778
	.align 2, 0
_08051688: .4byte gCurTask
_0805168C: .4byte gCamera
_08051690:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080516B4
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080516B4
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080516C8
_080516B4:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _080516C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051778
	.align 2, 0
_080516C4: .4byte gCurTask
_080516C8:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08051772
	ldr r2, _08051714 @ =gPlayer
	ldr r1, [r5, #0x3c]
	ldr r6, _08051718 @ =0xFFFF8800
	adds r0, r1, r6
	ldr r3, [r2, #8]
	cmp r3, r0
	ble _08051754
	movs r6, #0xf0
	lsls r6, r6, #7
	adds r0, r1, r6
	cmp r3, r0
	bge _08051754
	ldr r5, [r5, #0x40]
	ldr r6, _0805171C @ =0xFFFFCE00
	adds r0, r5, r6
	ldr r2, [r2, #0xc]
	cmp r2, r0
	ble _08051754
	movs r6, #0xc8
	lsls r6, r6, #6
	adds r0, r5, r6
	cmp r2, r0
	bge _08051754
	cmp r3, r1
	bge _08051724
	ldr r0, [r4, #0x10]
	ldr r1, _08051720 @ =0xFFFFFBFF
	ands r0, r1
	b _0805172C
	.align 2, 0
_08051714: .4byte gPlayer
_08051718: .4byte 0xFFFF8800
_0805171C: .4byte 0xFFFFCE00
_08051720: .4byte 0xFFFFFBFF
_08051724:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_0805172C:
	str r0, [r4, #0x10]
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805174C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051750 @ =sub_805146C
	b _08051770
	.align 2, 0
_0805174C: .4byte gCurTask
_08051750: .4byte sub_805146C
_08051754:
	movs r1, #0
	movs r0, #0xef
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08051780 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051784 @ =Task_Enemy_Mon
_08051770:
	str r0, [r1, #8]
_08051772:
	adds r0, r4, #0
	bl sub_80051E8
_08051778:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051780: .4byte gCurTask
_08051784: .4byte Task_Enemy_Mon
