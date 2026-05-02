.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0801D228 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r2, _0801D22C @ =gMultiplayerConnections
	ldrb r0, [r2]
	movs r1, #1
	b _0801D244
	.align 2, 0
_0801D228: .4byte gCurTask
_0801D22C: .4byte gMultiplayerConnections
_0801D230:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp r0, #3
	bhi _0801D24A
	ldrb r0, [r2]
	ldr r3, [sp, #0x18]
	asrs r0, r3
_0801D244:
	ands r0, r1
	cmp r0, #0
	bne _0801D230
_0801D24A:
	movs r0, #0x14
	ldr r4, [sp, #0x18]
	cmp r4, #3
	beq _0801D25A
	movs r0, #0
	cmp r4, #2
	bne _0801D25A
	movs r0, #0x28
_0801D25A:
	movs r6, #0
	ldr r7, [sp, #0x18]
	cmp r6, r7
	bhs _0801D336
	ldr r1, [sp]
	adds r1, #0x60
	str r1, [sp, #0x10]
	ldr r3, [sp]
	adds r3, #0x62
	str r3, [sp, #0x14]
	ldr r4, _0801D2DC @ =gLoadedSaveGame
	str r4, [sp, #8]
	str r0, [sp, #4]
_0801D274:
	movs r5, #0
	lsls r7, r6, #1
	mov sl, r7
	lsls r0, r6, #2
	lsls r1, r6, #0x10
	mov sb, r1
	adds r3, r6, #1
	str r3, [sp, #0xc]
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r4, [sp, #4]
	adds r4, r4, r0
	mov r8, r4
_0801D28E:
	mov r7, sl
	adds r0, r7, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r2, r1, r0
	lsls r0, r5, #3
	ldr r3, [sp, #0x10]
	ldrh r3, [r3]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	ldr r4, [sp, #0x14]
	ldrh r0, [r4]
	mov r7, r8
	adds r3, r0, r7
	strh r3, [r2, #0xc]
	ldr r0, _0801D2E0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r4, sb
	lsrs r1, r4, #0x10
	cmp r0, r1
	bne _0801D2E8
	ldr r7, _0801D2E4 @ =gLoadedSaveGame + 0x10
	adds r1, r5, r7
	ldrb r0, [r1]
	subs r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _0801D2D2
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r2, #0xc]
_0801D2D2:
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_8052F78
	b _0801D320
	.align 2, 0
_0801D2DC: .4byte gLoadedSaveGame
_0801D2E0: .4byte 0x04000128
_0801D2E4: .4byte gLoadedSaveGame + 0x10
_0801D2E8:
	ldr r0, _0801D348 @ =gUnknown_03005008
	adds r1, r6, r0
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r5
	mov ip, r0
	ldr r0, [sp, #8]
	movs r7, #0xe1
	lsls r7, r7, #2
	adds r4, r0, r7
	mov r7, ip
	adds r0, r7, r4
	ldrb r0, [r0]
	subs r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _0801D312
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r2, #0xc]
_0801D312:
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r0, r0, r5
	adds r1, r2, #0
	bl sub_8052F78
_0801D320:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0801D28E
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x18]
	cmp r6, r3
	blo _0801D274
_0801D336:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D348: .4byte gUnknown_03005008

.syntax divided
