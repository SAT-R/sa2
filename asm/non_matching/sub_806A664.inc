.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r1, _0806A6B4 @ =gUnknown_080D95D2
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r5, sp, #4
	ldr r1, _0806A6B8 @ =gUnknown_080D95D6
	adds r0, r5, #0
	movs r2, #0x10
	bl memcpy
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldr r1, _0806A6BC @ =gUnknown_080D95C4
	add r0, sp, #0x14
	movs r2, #4
	bl memcpy
	ldr r1, _0806A6C0 @ =gUnknown_080D95C8
	add r0, sp, #0x18
	movs r2, #0xa
	bl memcpy
	add r1, sp, #0x14
	cmp r4, #1
	bne _0806A6C4
	add r1, sp, #0x18
	cmp r4, #1
	bne _0806A6C4
	cmp r6, #2
	bne _0806A6C4
_0806A6AE:
	movs r0, #1
	b _0806A6E2
	.align 2, 0
_0806A6B4: .4byte gUnknown_080D95D2
_0806A6B8: .4byte gUnknown_080D95D6
_0806A6BC: .4byte gUnknown_080D95C4
_0806A6C0: .4byte gUnknown_080D95C8
_0806A6C4:
	ldrh r0, [r1]
	ldr r2, _0806A6F4 @ =0x0000FFFF
	cmp r0, r2
	beq _0806A6E0
_0806A6CC:
	cmp r6, r0
	blo _0806A6D8
	ldrh r0, [r1]
	adds r0, #4
	cmp r6, r0
	ble _0806A6AE
_0806A6D8:
	adds r1, #2
	ldrh r0, [r1]
	cmp r0, r2
	bne _0806A6CC
_0806A6E0:
	movs r0, #0
_0806A6E2:
	cmp r0, #0
	beq _0806A74C
	cmp r7, #1
	bne _0806A722
	cmp r6, #2
	bne _0806A6FC
	ldr r0, _0806A6F8 @ =0x0000010B
	b _0806A74E
	.align 2, 0
_0806A6F4: .4byte 0x0000FFFF
_0806A6F8: .4byte 0x0000010B
_0806A6FC:
	movs r1, #0
_0806A6FE:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r3, r2, #2
	adds r0, r5, r3
	ldrh r1, [r0]
	cmp r6, r1
	blo _0806A714
	ldrh r1, [r0]
	adds r0, r1, #4
	cmp r6, r0
	ble _0806A73A
_0806A714:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806A6FE
	b _0806A74C
_0806A722:
	mov r0, sp
	ldrh r0, [r0]
	cmp r6, r0
	blo _0806A74C
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r1, #4
	cmp r6, r0
	bgt _0806A74C
	mov r0, sp
	ldrh r0, [r0, #2]
	b _0806A742
_0806A73A:
	mov r0, sp
	adds r0, #6
	adds r0, r0, r3
	ldrh r0, [r0]
_0806A742:
	adds r0, r6, r0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806A74E
_0806A74C:
	adds r0, r6, #0
_0806A74E:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

.syntax divided
