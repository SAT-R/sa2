.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, _0804D0AC @ =gUnknown_03006170 = data0
	ldr r4, _0804D0B0 @ =gUnknown_030060F0 = data1
	ldrh r0, [r1]
	movs r2, #0x30
	ands r2, r0
	adds r1, #2
	cmp r2, #0x20
	bne _0804D0BE
	movs r3, #0
	cmp r3, r6
	bge _0804D0F6
	movs r0, #0xd0
	mov ip, r0      @ ip = 0xD0
	movs r7, #0x20
	adds r5, r1, #0 @ r5 = r1 = data0
_0804D082_loop:
	ldrh r0, [r4]
	mov r1, ip
	ands r1, r0
	cmp r1, #0
	bne _0804D0F6
	ldrh r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r3, #3
	ble _0804D09E
	cmp r2, #0
	bne _0804D0B4_return_neg1
_0804D09E:
	adds r5, #2
	adds r4, #2
	adds r3, #1
	cmp r3, r6
	blt _0804D082_loop
	b _0804D0F6
	.align 2, 0
_0804D0AC: .4byte gUnknown_03006170
_0804D0B0: .4byte gUnknown_030060F0
_0804D0B4_return_neg1:
	movs r0, #1
	rsbs r0, r0, #0
	b _0804D0F8
_0804D0BA_return_1:
	movs r0, #1
	b _0804D0F8
_0804D0BE:
	cmp r2, #0x10
	bne _0804D0F6
	movs r3, #0
	cmp r3, r6
	bge _0804D0F6
	movs r0, #0xe0
	mov ip, r0
	movs r7, #0x10
	adds r5, r1, #0
_0804D0D0_loop:
	ldrh r0, [r4]
	mov r1, ip
	ands r1, r0
	cmp r1, #0
	bne _0804D0F6
	ldrh r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r3, #3
	ble _0804D0EC
	cmp r2, #0
	bne _0804D0BA_return_1
_0804D0EC:
	adds r5, #2
	adds r4, #2
	adds r3, #1
	cmp r3, r6
	blt _0804D0D0_loop
_0804D0F6:
	movs r0, #0
_0804D0F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
