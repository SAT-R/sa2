.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0805365C @ =gTask_03006240
	ldr r0, [r0]
	cmp r0, #0
	bne _08053652
	ldr r2, _08053660 @ =gUnknown_03006250
	ldr r4, _08053664 @ =gUnknown_030063F0
	ldr r5, _08053668 @ =gUnknown_030063C0
	ldr r0, _0805366C @ =Task_80536D4
	mov ip, r0
	ldr r6, _08053670 @ =TaskDestructor_80536D8
	adds r3, r2, #0     @ r3 = gUnknown_03006250
	movs r7, #0xa2
	lsls r7, r7, #1     @ r7 = 0x144
	adds r1, r2, r7
	subs r7, #0x24
	adds r0, r2, r7     @ r0 = 0x120
_08053620:
	str r1, [r0]
	subs r1, #0x24
	subs r0, #0x24
	cmp r0, r3
	bge _08053620
	movs r1, #0
	movs r3, #0xa2
	lsls r3, r3, #1     @ r3 = 0x144
	adds r0, r2, r3
	str r1, [r0]
	str r2, [r4]
	str r1, [r5]
	movs r1, #0xd3
	lsls r1, r1, #2     @ r1 = 0x34C
	movs r2, #0xc0
	lsls r2, r2, #5
	str r6, [sp]
	mov r0, ip
	movs r3, #0
	bl TaskCreate
	ldr r1, _0805365C @ =gTask_03006240
	str r0, [r1]
	bl UiGfxStackInit
_08053652:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805365C: .4byte gTask_03006240
_08053660: .4byte gUnknown_03006250
_08053664: .4byte gUnknown_030063F0
_08053668: .4byte gUnknown_030063C0
_0805366C: .4byte Task_80536D4
_08053670: .4byte TaskDestructor_80536D8

.syntax divided
