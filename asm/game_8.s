.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start sub_802EF68
sub_802EF68: @ 0x0802EF68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802EFD4 @ =Task_802EE78
	movs r2, #0xc1
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0, #0x10]
	strh r4, [r0, #0xc]
	strh r5, [r0, #0xe]
	strb r6, [r0, #0x11]
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #4]
	movs r1, #1
	strh r1, [r0, #2]
	movs r1, #0xc0
	strh r1, [r0, #6]
	movs r1, #0xbf
	strh r1, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	ldr r0, _0802EFD8 @ =0x0000014D
	bl m4aSongNumStart
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EFD4: .4byte Task_802EE78
_0802EFD8: .4byte 0x0000014D

	thumb_func_start sub_802EFDC
sub_802EFDC: @ 0x0802EFDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802F004 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r2, _0802F008 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802F014
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0802F00C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802F010 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802F02A
	.align 2, 0
_0802F004: .4byte gBgOffsetsHBlank
_0802F008: .4byte gUnknown_03001B60
_0802F00C: .4byte 0x040000D4
_0802F010: .4byte 0x81000140
_0802F014:
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0802F030 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802F034 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802F02A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802F030: .4byte 0x040000D4
_0802F034: .4byte 0x81000140

	thumb_func_start sub_802F038
sub_802F038: @ 0x0802F038
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802F068 @ =gBgOffsetsHBlank
	ldr r3, [r0]
	lsls r0, r1, #1
	adds r3, r3, r0
	cmp r1, r2
	bhs _0802F060
_0802F052:
	strh r4, [r3]
	adds r3, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0802F052
_0802F060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F068: .4byte gBgOffsetsHBlank

	thumb_func_start Task_802F06C
Task_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl NextTransitionFrame
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _0802F098
	movs r0, #0x3c
	strh r0, [r4, #6]
	ldr r1, [r5]
	ldr r0, _0802F0A4 @ =Task_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte Task_802ED98
