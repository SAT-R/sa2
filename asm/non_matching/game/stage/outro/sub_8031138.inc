.include "constants/gba_constants.inc"
.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0          @ r8 = p0
	ldr r0, _0803118C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0          @ sb = outro
	ldr r2, _08031190 @ =IWRAM_START + 0x168
	adds r0, r1, r2
	ldr r7, [r0]        @ r7 = counter
	cmp r7, #0x17
	bhi _08031198
	ldr r0, _08031194 @ =IWRAM_START + 0x12C
	adds r5, r1, r0
	movs r0, #0
	cmp r7, #0x10
	bhi _08031174
	movs r1, #0x10
	subs r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_08031174:
	movs r6, #0
	mov r1, r8
	subs r4, r0, r1
_0803117A:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _0803117A
	b _080311B2
	.align 2, 0
_0803118C: .4byte gCurTask
_08031190: .4byte IWRAM_START + 0x168
_08031194: .4byte IWRAM_START + 0x12C
_08031198:
	ldr r2, _08031214 @ =IWRAM_START + 0x12C
	adds r5, r1, r2
	movs r6, #0
	mov r0, r8
	rsbs r4, r0, #0
_080311A2:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _080311A2
_080311B2:
	cmp r7, #0x1c
	bls _080311F4
	ldr r0, _08031218 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r1, #3
	cmp r0, #2
	bne _080311C6
	movs r1, #2
_080311C6:
	movs r6, #0
	cmp r6, r1
	bhs _080311F4
	mov r4, sb          @ r4 = sb = outro
	adds r4, #0x22
	mov r0, sb          @ r0 = sb = outro
	adds r0, #0xc
_080311D4:
	adds r5, r0, #0
	ldrh r0, [r4]
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r4]
	adds r0, r5, #0
	str r1, [sp]
	bl DisplaySprite
	adds r4, #0x30
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	ldr r1, [sp]
	cmp r6, r1
	blo _080311D4
_080311F4:
	cmp r7, #0x26
	bls _0803124C
	mov r5, sb          @ r5 = sb = outro
	adds r5, #0x9c
	cmp r7, #0x37
	bhi _0803121C
	adds r0, r7, #0
	subs r0, #0x27
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803121E
	.align 2, 0
_08031214: .4byte IWRAM_START + 0x12C
_08031218: .4byte gCurrentLevel
_0803121C:
	movs r4, #0x30
_0803121E:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x5a
	movs r3, #0
	bl StageUI_PrintIntegerAt
_0803124C:
	cmp r7, #0x30
	bls _0803129C
	mov r5, sb
	adds r5, #0xcc
	cmp r7, #0x41
	bhi _0803126C
	adds r0, r7, #0
	subs r0, #0x31
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803126E
_0803126C:
	movs r4, #0x30
_0803126E:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x6e
	movs r3, #0
	bl StageUI_PrintIntegerAt
_0803129C:
	ldr r0, _080312D0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08031304
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	bgt _08031304
	cmp r7, #0x3a
	bls _08031304
	mov r5, sb
	adds r5, #0xfc
	cmp r7, #0x4b
	bhi _080312D4
	adds r0, r7, #0
	subs r0, #0x3b
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080312D6
	.align 2, 0
_080312D0: .4byte gCurrentLevel
_080312D4:
	movs r4, #0x30
_080312D6:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	movs r0, #0xb2
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x82
	movs r3, #0
	bl StageUI_PrintIntegerAt
_08031304:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
