.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r2, r1, #0
	movs r0, #0
	mov sb, r0
	ldr r3, _0801C9C0 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801C992
	ldr r0, _0801C9C4 @ =gSpecialRingCount
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801C992
	ldr r1, _0801C9C8 @ =gBgScrollRegs
	movs r4, #0xc
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _0801C982
	strh r6, [r1, #0xc]
_0801C982:
	ldrh r0, [r3, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r7, [r1, #0xc]
	adds r0, r0, r7
	strh r0, [r1, #0xc]
	movs r0, #0xc
	ldrsh r6, [r1, r0]
_0801C992:
	ldr r0, _0801C9CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801C9D0
	ldr r4, _0801C9C8 @ =gBgScrollRegs
	asrs r0, r6, #4
	strh r0, [r4, #0xc]
	adds r0, r2, #0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _0801C9BA
	mov r8, r1
_0801C9BA:
	mov r2, r8
	strh r2, [r4, #0xe]
	b _0801CB58
	.align 2, 0
_0801C9C0: .4byte gPlayer
_0801C9C4: .4byte gSpecialRingCount
_0801C9C8: .4byte gBgScrollRegs
_0801C9CC: .4byte gGameMode
_0801C9D0:
	adds r0, r2, #0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r8, r3
	asrs r0, r0, #0x10
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	ble _0801C9EA
	mov r8, r4
_0801C9EA:
	adds r0, r6, #0
	movs r1, #0x69
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	ble _0801C9FE
	adds r3, r4, #0
_0801C9FE:
	ldr r1, _0801CA5C @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801CA60 @ =gHBlankCopyTarget
	ldr r0, _0801CA64 @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801CA68 @ =gHBlankCopySize
	strb r2, [r0]
	ldr r0, _0801CA6C @ =gBgOffsetsHBlank
	ldr r4, [r0]
	ldr r0, _0801CA70 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp]
	movs r5, #0
	mov r7, r8
	lsls r0, r7, #0x10
	lsls r3, r3, #0x10
	str r3, [sp, #0xc]
	asrs r2, r6, #3
	str r2, [sp, #8]
	asrs r2, r0, #0x10
	movs r3, #0xff
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #1
	asrs r0, r0, #5
	ands r0, r3
	lsls r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x13
	asrs r1, r1, #0x10
	mov sl, r1
_0801CA48:
	adds r1, r2, r5
	adds r0, r1, #0
	subs r0, #0x6f
	cmp r0, #9
	bhi _0801CA74
	adds r0, #1
	muls r0, r6, r0
	asrs r0, r0, #5
	ands r0, r3
	b _0801CA82
	.align 2, 0
_0801CA5C: .4byte gFlags
_0801CA60: .4byte gHBlankCopyTarget
_0801CA64: .4byte 0x0400001C
_0801CA68: .4byte gHBlankCopySize
_0801CA6C: .4byte gBgOffsetsHBlank
_0801CA70: .4byte gStageTime
_0801CA74:
	cmp r1, #0x78
	ble _0801CA7E
	mov r7, ip
	lsrs r0, r7, #0x10
	b _0801CA82
_0801CA7E:
	ldr r1, [sp, #0xc]
	lsrs r0, r1, #0x10
_0801CA82:
	strh r0, [r4]
	adds r4, #2
	mov r7, r8
	strh r7, [r4]
	adds r4, #2
	adds r0, r2, r5
	lsls r1, r5, #3
	add r1, sl
	ldr r7, _0801CB68 @ =0x000003FF
	ands r1, r7
	lsls r1, r1, #1
	ldr r7, _0801CB6C @ =gSineTable
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	adds r0, r0, r1
	cmp r0, #0xb1
	bgt _0801CAB2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x9e
	bls _0801CA48
_0801CAB2:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	mov ip, r2
	cmp r5, #0x9e
	bhi _0801CB58
	ldr r6, _0801CB6C @ =gSineTable
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	mov sl, r3
_0801CACE:
	movs r7, #8
	add sb, r7
	ldr r1, _0801CB68 @ =0x000003FF
	adds r0, r1, #0
	mov r2, sb
	ands r2, r0
	mov sb, r2
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x1d
	ldr r7, [sp, #4]
	adds r1, r7, r1
	ldr r7, _0801CB70 @ =gStageTime
	ldr r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r2, _0801CB68 @ =0x000003FF
	ands r0, r2
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1b
	adds r1, r1, r0
	lsls r0, r5, #6
	ldr r7, [sp]
	adds r0, r7, r0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1d
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	mov r0, ip
	lsrs r2, r0, #1
	add r2, r8
	asrs r3, r3, #0x1c
	adds r2, r2, r3
	lsls r0, r5, #3
	ldr r3, _0801CB70 @ =gStageTime
	ldr r1, [r3]
	adds r0, r0, r1
	ldr r7, _0801CB68 @ =0x000003FF
	ands r0, r7
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r2, r2, r0
	strh r2, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r5, #0x9e
	bls _0801CACE
_0801CB58:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CB68: .4byte 0x000003FF
_0801CB6C: .4byte gSineTable
_0801CB70: .4byte gStageTime

	
.syntax divided
