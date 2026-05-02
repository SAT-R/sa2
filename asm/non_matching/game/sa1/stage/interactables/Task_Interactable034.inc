.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804D7A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r0, #0
	mov r8, r0
_0804D746:
	ldr r5, _0804D7A8 @ =gPlayer
	mov r1, r8
	cmp r1, #0
	beq _0804D750
	ldr r5, _0804D7AC @ =gPartner
_0804D750:
	ldr r0, [r5]
	asrs r4, r0, #8
	ldr r0, [r5, #4]
	asrs r7, r0, #8
	ldr r3, _0804D7B0 @ =gCamera
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r6, #4]
	cmp r1, r0
	bgt _0804D78A
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0804D78A
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r6, #8]
	cmp r1, r0
	bgt _0804D78A
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	bge _0804D7B8
_0804D78A:
	ldr r0, [r5, #0x10]
	ldr r1, _0804D7B4 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r1, [r6]
	ldrb r0, [r6, #0x1d]
	strb r0, [r1]
	ldr r0, _0804D7A4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0804D848
	.align 2, 0
_0804D7A4: .4byte gCurTask
_0804D7A8: .4byte gPlayer
_0804D7AC: .4byte gPartner
_0804D7B0: .4byte gCamera
_0804D7B4: .4byte 0xFFFF7FFF
_0804D7B8:
	ldr r0, [r6, #0xc]
	cmp r0, r4
	bgt _0804D836
	ldr r0, [r6, #0x10]
	cmp r4, r0
	bge _0804D836
	ldr r0, [r6, #0x14]
	cmp r0, r7
	bgt _0804D836
	ldr r0, [r6, #0x18]
	cmp r7, r0
	bge _0804D836
	ldr r4, [r5, #0x10]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	bne _0804D848
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r1, [r5, #0x10]
	movs r0, #0x81
	lsls r0, r0, #2
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	str r1, [r5, #0x10]
	strh r4, [r5, #0x38]
	strh r4, [r5, #0x3a]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #9
	strb r0, [r5, #0xf]
	adds r2, r5, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0804D854 @ =gPlayer
	ldr r0, [r2, #0x10]
	ldr r1, _0804D858 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x10]
	adds r0, r5, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _0804D836
	movs r0, #0x6d
	bl m4aSongNumStartOrChange
_0804D836:
	movs r0, #1
	add r8, r0
	ldr r0, _0804D85C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r8, r0
	bge _0804D848
	b _0804D746
_0804D848:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D854: .4byte gPlayer
_0804D858: .4byte 0xFFBFFFFF
_0804D85C: .4byte gNumSingleplayerCharacters

.syntax divided
