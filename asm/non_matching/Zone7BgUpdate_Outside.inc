.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r2, _0801DED8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DEDC @ =0x0000F7FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801DEE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801DEE4 @ =gUnknown_03002878
	ldr r0, _0801DEE8 @ =0x04000010
	str r0, [r1]
	ldr r1, _0801DEEC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801DEF0 @ =gComputedBgBuffer
	ldr r4, [r0]
	ldr r0, _0801DEF4 @ =gStageTime
	ldr r5, [r0]
	lsrs r1, r5, #3
	movs r2, #0x1f
	ands r1, r2
	mov sb, r0      @ sb = &gStageTime
	cmp r1, #0xf
	bls _0801DDCA
	subs r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0801DDCA:
	movs r3, #0
	ldr r6, _0801DEF8 @ =gUnknown_080D5C62
	adds r7, r6, #2
	mov r8, r7
	movs r0, #7
	mov ip, r0          @ ip = 7
	movs r1, #0xff
	mov sl, r1          @ sl = 0xFF
_0801DDDA:
	lsls r0, r3, #1
	mov r7, sp
	adds r2, r7, r0     @ r2 = &sp[i]
	adds r1, r3, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #2
	adds r0, r1, r6     @ r0 = &gUnknown_080D5C62[(i & 0x7)][0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	add r1, r8
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, sl
	ands r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0801DDDA
	ldr r6, _0801DEFC @ =0x0000507F
	movs r3, #0
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE10:
	mov r7, sb          @ r7 = sb = &gStageTime
	ldr r0, [r7]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10  @ r1 = sinVal = SIN_24_8(((gStageTime << 2) + i*2) & ONE_CYCLE) >> 3;
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a  @ r0 = cosVal
	adds r0, r1, r0     @ r0 = sinVal + cosVal
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x4f
	bls _0801DE10
	cmp r3, #0x9e
	bhi _0801DEC6
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE6E:
	mov r1, sb          @ r1 = sb = &gStageTime
	ldr r0, [r1]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xa0
	subs r0, r0, r3
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x9e
	bls _0801DE6E
_0801DEC6:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DED8: .4byte gDispCnt
_0801DEDC: .4byte 0x0000F7FF
_0801DEE0: .4byte gFlags
_0801DEE4: .4byte gUnknown_03002878
_0801DEE8: .4byte 0x04000010
_0801DEEC: .4byte gUnknown_03002A80
_0801DEF0: .4byte gComputedBgBuffer
_0801DEF4: .4byte gStageTime
_0801DEF8: .4byte gUnknown_080D5C62
_0801DEFC: .4byte 0x0000507F
_0801DF00: .4byte gSineTable
_0801DF04: .4byte 0x000003FF
.syntax divided
