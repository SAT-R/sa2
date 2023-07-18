.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8055378
Task_8055378: @ 0x08055378
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08055424 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r0, _08055428 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r1, r8
	ldr r1, [r1]
	mov sb, r1
	mov r2, r8
	ldr r1, [r2, #0x44]
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r2, #0x48]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r3, _0805542C @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	movs r4, #0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	ldr r5, _08055430 @ =gPlayer
	str r5, [sp]
	str r4, [sp, #4]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C204
	adds r2, r0, #0
	cmp r2, #1
	bne _080553EC
	movs r0, #0xf7
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6c
	strb r2, [r0]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0x99
	bl m4aSongNumStart
_080553EC:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055410
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08055410
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055434
_08055410:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sb
	strb r0, [r2]
	ldr r0, _08055424 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805549E
	.align 2, 0
_08055424: .4byte gCurTask
_08055428: .4byte IWRAM_START + 0xC
_0805542C: .4byte gCamera
_08055430: .4byte gPlayer
_08055434:
	mov r1, r8
	ldr r0, [r1, #0x44]
	ldr r1, [r1, #0x48]
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055498
	adds r0, r7, #0
	bl sub_80051E8
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08055468
	ldr r0, _08055464 @ =0xFFFFFBFF
	ands r1, r0
	b _0805546A
	.align 2, 0
_08055464: .4byte 0xFFFFFBFF
_08055468:
	orrs r1, r2
_0805546A:
	str r1, [r7, #0x10]
	movs r1, #0
	ldr r0, _0805548C @ =0x000001F1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08055490 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08055494 @ =Task_YadoMain
	str r0, [r1, #8]
	b _0805549E
	.align 2, 0
_0805548C: .4byte 0x000001F1
_08055490: .4byte gCurTask
_08055494: .4byte Task_YadoMain
_08055498:
	adds r0, r7, #0
	bl sub_80051E8
_0805549E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Yado
TaskDestructor_Yado: @ 0x080554AC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
