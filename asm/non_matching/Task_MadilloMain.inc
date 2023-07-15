.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _080560CC @ =IWRAM_START + 0xC
	adds r5, r3, r2
	ldr r0, [r4]
	mov sb, r0
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080560D0 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	ldr r3, _080560D4 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08056080
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08056080:
	cmp r0, #0
	ble _0805608C
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_0805608C:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r0, _080560D8 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080560DC
	ldr r1, _080560C8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_080560C8: .4byte gCurTask
_080560CC: .4byte IWRAM_START + 0xC
_080560D0: .4byte IWRAM_START + 0x50
_080560D4: .4byte sub_801EC3C
_080560D8: .4byte gCamera
_080560DC:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805610E
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805610E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056148
_0805610E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056132
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056132
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056148
_08056132:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08056144 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056214
	.align 2, 0
_08056144: .4byte gCurTask
_08056148:
	adds r1, r7, #0     @ r7 = madillo->spawnY
	subs r1, #0x32
	lsls r1, r1, #8
	ldr r0, _080561A8 @ =gPlayer
	ldr r2, [r0, #0xc]
	adds r3, r0, #0
	lsls r0, r6, #8
	mov r8, r0
	cmp r1, r2
	bge _08056200
	adds r0, r7, #0
	adds r0, #0x32
	lsls r0, r0, #8
	cmp r0, r2
	ble _08056200
	ldr r1, [r3, #8]
	cmp r8, r1
	ble _080561BC
	adds r0, r6, #0
	subs r0, #0x78
	lsls r0, r0, #8
	cmp r0, r1
	bge _080561BC
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	cmp r1, r0
	ble _08056200
	ldr r0, _080561AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080561B0 @ =Task_8056230
	str r0, [r1, #8]
	ldr r0, _080561B4 @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _080561B8 @ =0xFFFFFBFF
	ands r0, r1
	b _080561FE
	.align 2, 0
_080561A8: .4byte gPlayer
_080561AC: .4byte gCurTask
_080561B0: .4byte Task_8056230
_080561B4: .4byte 0x000001F7
_080561B8: .4byte 0xFFFFFBFF
_080561BC:
	adds r0, r6, #0
	adds r0, #0x78
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r0, r1
	ble _08056200
	ldr r1, [r4, #0x44]
	asrs r1, r1, #8
	mov r3, sb
	movs r0, #3
	ldrsb r0, [r3, r0]
	ldrb r2, [r3, #5]
	adds r0, r0, r2
	lsls r0, r0, #3
	cmp r1, r0
	bge _08056200
	ldr r0, _08056224 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056228 @ =Task_8056230
	str r0, [r1, #8]
	ldr r0, _0805622C @ =0x000001F7
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080561FE:
	str r0, [r5, #0x10]
_08056200:
	lsls r1, r7, #8
	mov r0, r8
	bl sub_80122DC
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08056214:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056224: .4byte gCurTask
_08056228: .4byte Task_8056230
_0805622C: .4byte 0x000001F7

.syntax divided
