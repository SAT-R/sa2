.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_02000bd0
sub_02000bd0: @ 0x02000bd0
	push {r4, r5, r6, lr}
	ldr r1, _02000C40 @ =gUnknown_030043F0
	ldrh r5, [r1]
	ldrh r6, [r1, #2]
	ldr r0, _02000C44 @ =0x04000130
	ldrh r2, [r0]
	movs r3, #0xfc
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1, #2]
	mvns r2, r0
	strh r2, [r1]
	ldr r0, _02000C48 @ =gUnknown_03003330
	ldrb r1, [r0, #0xf]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _02000C20
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0xf
	bne _02000C20
	bl m4aMPlayAllStop
	bl m4aSoundMain
	bl VBlankIntrWait
	bl m4aSoundVSyncOff
	ldr r0, _02000C4C @ =0x04000208
	strh r4, [r0]
	subs r0, #8
	strh r4, [r0]
	movs r0, #0x20
	bl SoftResetRom
_02000C20:
	ldr r1, _02000C40 @ =gUnknown_030043F0
	ldrh r2, [r1]
	ands r6, r2
	movs r3, #0
	strh r6, [r1, #4]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _02000C5C
	cmp r0, r5
	bls _02000C50
	eors r5, r2
	strh r5, [r1, #6]
	ldrb r0, [r1, #9]
	b _02000C64
	.align 2, 0
_02000C40: .4byte gUnknown_030043F0
_02000C44: .4byte 0x04000130
_02000C48: .4byte gUnknown_03003330
_02000C4C: .4byte 0x04000208
_02000C50:
	ldrb r0, [r1, #8]
	subs r0, #1
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02000C60
_02000C5C:
	strh r3, [r1, #6]
	b _02000C66
_02000C60:
	strh r2, [r1, #6]
	ldrb r0, [r1, #0xa]
_02000C64:
	strb r0, [r1, #8]
_02000C66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_02000c6c
sub_02000c6c: @ 0x02000c6c
	ldr r1, _02000C88 @ =gUnknown_030043F0
	movs r0, #0
	strh r0, [r1, #6]
	strh r0, [r1, #4]
	strh r0, [r1]
	ldr r0, _02000C8C @ =0x0000FFFF
	strh r0, [r1, #2]
	movs r0, #0xf
	strb r0, [r1, #9]
	strb r0, [r1, #8]
	movs r0, #7
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_02000C88: .4byte gUnknown_030043F0
_02000C8C: .4byte 0x0000FFFF
