.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0      @ sb = data
	movs r0, #0
	mov ip, r0
	ldr r1, _0800FDD4 @ =gLoadedSaveGame + 0x380
	mov sl, r1      @ sl = LOADED_SAVE->multiplayerScores
	mov r5, sb
	adds r5, #4
	str r5, [sp, #0x10] @ sp10 = 
	mov r7, sl
	mov r8, r0      @ r8 = r0 = i
_0800FDBC_loop:
	ldr r4, _0800FDD4 @ =gLoadedSaveGame + 0x380
	add r4, r8      @ r4 = score
	movs r6, #1
	movs r3, #0
	mov r2, sb      @ r2 = sb = data
	ldrb r1, [r2, #4]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800FDD8
	movs r6, #0
	b _0800FE38_continue
	.align 2, 0
_0800FDD4: .4byte gLoadedSaveGame + 0x380
_0800FDD8:
	adds r3, #1
	cmp r3, #0xb
	bhi _0800FDEC
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	beq _0800FDD8
	movs r6, #0
_0800FDEC:
	cmp r6, #0
	beq _0800FE38_continue
	mov r0, sp
	adds r1, r7, #0
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r0]
	mov r2, ip
	cmp r2, #0
	beq _0800FE22
	ldr r4, _0800FE30 @ =gLoadedSaveGame
	movs r3, #0xe0
	lsls r3, r3, #2   @ 0x380
_0800FE08:
	lsls r1, r2, #4
	adds r1, r1, r4
	subs r2, #1
	lsls r0, r2, #4
	adds r0, r0, r4
	adds r1, r1, r3
	adds r0, r0, r3
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]    @ LOADED_SAVE->multiplayerScores = 
	cmp r2, #0
	bne _0800FE08
_0800FE22:
	ldr r0, _0800FE34 @ =gLoadedSaveGame + 0x380
	mov r1, sp
	ldm r1!, {r2, r6, r7}
	stm r0!, {r2, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	b _0800FE94
	.align 2, 0
_0800FE30: .4byte gLoadedSaveGame
_0800FE34: .4byte gLoadedSaveGame + 0x380
_0800FE38_continue:
	adds r7, #0x10
	movs r3, #0x10
	add r8, r3
	movs r4, #1
	add ip, r4
	mov r6, ip
	cmp r6, #9
	bls _0800FDBC_loop
	movs r2, #9
	ldr r4, _0800FEA4 @ =gLoadedSaveGame
	movs r3, #0xe0
	lsls r3, r3, #2
_0800FE50:
	lsls r1, r2, #4
	adds r1, r1, r4
	subs r2, #1
	lsls r0, r2, #4
	adds r0, r0, r4
	adds r1, r1, r3
	adds r0, r0, r3
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]
	cmp r2, #0
	bne _0800FE50
	ldr r5, [sp, #0x10]
	mov r4, sl      @ r4 = sl = LOADED_SAVE->multiplayerScores
_0800FE6E:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	adds r2, #1
	cmp r2, #0xb
	bls _0800FE6E
	ldr r7, _0800FEA4 @ =gLoadedSaveGame
	movs r1, #0xe3
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0800FEA8 @ =0x0000038D
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _0800FEAC @ =0x0000038E
	adds r0, r7, r3
	strb r1, [r0]
_0800FE94:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FEA4: .4byte gLoadedSaveGame
_0800FEA8: .4byte 0x0000038D
_0800FEAC: .4byte 0x0000038E

.syntax divided
