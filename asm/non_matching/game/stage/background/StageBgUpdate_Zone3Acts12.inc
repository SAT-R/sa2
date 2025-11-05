.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	mov r8, r0          @ r8 = a
	adds r0, r1, #0     @ r0 = b
	movs r1, #0
	mov sl, r1
	ldr r1, _0801CC54 @ =gBgOffsetsHBlankPrimary
	ldr r5, [r1]        @ r5 = bgBuffer
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0801CC58 @ =gBgScrollRegs
	strh r3, [r0, #2]
	strh r3, [r0, #0xe]
	ldr r0, _0801CC5C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801CC1A
	b sub_801CBE8_return
_0801CC1A:
	ldr r2, _0801CC60 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801CC6C
	ldr r0, _0801CC64 @ =gSpecialRingCount
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801CC6C
	ldr r1, _0801CC68 @ =(IWRAM_START + 0x408)
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _0801CC3E
	mov r7, r8
	strh r7, [r1]
_0801CC3E:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	movs r7, #0
	ldrsh r4, [r1, r7]
	mov r8, r4
	b _0801CC72
	.align 2, 0
_0801CC54: .4byte gBgOffsetsHBlankPrimary
_0801CC58: .4byte gBgScrollRegs
_0801CC5C: .4byte gGameMode
_0801CC60: .4byte gPlayer
_0801CC64: .4byte gSpecialRingCount
_0801CC68: .4byte (IWRAM_START + 0x408)
_0801CC6C:
	ldr r1, _0801CD5C @ =(IWRAM_START + 0x408)
	movs r0, #0
	strh r0, [r1]
_0801CC72:
	movs r4, #0     @ r4 = i
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r1, _0801CD60 @ =gUnknown_080D5B20
	adds r6, r0, #0
	mov sb, r1
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x44]
	lsls r3, r3, #0x18
	str r3, [sp, #0x40]
	ldrb r1, [r1]
	cmp r2, r1
	blt _0801CCA6
_0801CC8E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bhi _0801CCA8
	asrs r1, r6, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	add r0, sb
	ldrb r0, [r0]
	cmp r1, r0
	bge _0801CC8E
_0801CCA6:
	mov sl, r4
_0801CCA8:
	movs r4, #0
	mov r2, sl
	lsls r2, r2, #0x10
	mov sl, r2
	movs r6, #0xff
	ldr r3, _0801CD64 @ =gUnknown_080D5B20+2
	mov ip, r3
_0801CCB6:
	lsls r2, r4, #2
	mov r7, sp
	adds r3, r7, r2
	lsls r1, r4, #1
	adds r1, r1, r4
	ldr r7, _0801CD68 @ =gUnknown_080D5B20+1
	adds r0, r1, r7
	ldrb r0, [r0]
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #5
	ands r0, r6
	strh r0, [r3]
	ldr r0, [sp, #0x44]
	adds r2, r0, r2
	add r1, ip
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #5
	ands r0, r6
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0801CCB6
__0801CCF0:
	mov r2, sl
	asrs r0, r2, #0x10
	lsls r1, r0, #2
	mov r3, sp
	adds r2, r3, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	add r1, sb
	movs r4, #0
	ldr r7, [sp, #0x40]
	lsrs r3, r7, #0x18
_0801CD06:              @ r5 = bgBuffer
	ldrh r0, [r2, #2]
	strh r0, [r5]   
	adds r5, #2
	ldrh r0, [r2]
	strh r0, [r5]
	adds r5, #2
	ldrb r0, [r1]
	cmp r3, r0
	blo _0801CD1C
	adds r1, #3
	adds r2, #4
_0801CD1C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x9e
	bls _0801CD06
__0801CD2C:
	ldr r1, _0801CD6C @ =gNumHBlankCallbacks
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r2, _0801CD6C @ =gNumHBlankCallbacks
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r3, _0801CD70 @ =gHBlankCallbacks
	adds r0, r0, r3
	ldr r4, _0801CD74 @ =HBlankCB_801E454
	str r4, [r0]
	ldr r7, _0801CD78 @ =gFlags
	ldr r0, [r7]
	movs r1, #8
	orrs r0, r1
	str r0, [r7]
sub_801CBE8_return:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CD5C: .4byte (IWRAM_START + 0x408)
_0801CD60: .4byte gUnknown_080D5B20
_0801CD64: .4byte gUnknown_080D5B20+2
_0801CD68: .4byte gUnknown_080D5B20+1
_0801CD6C: .4byte gNumHBlankCallbacks
_0801CD70: .4byte gHBlankCallbacks
_0801CD74: .4byte HBlankCB_801E454
_0801CD78: .4byte gFlags

	
.syntax divided
