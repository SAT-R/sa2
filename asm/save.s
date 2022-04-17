.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm


	thumb_func_start sub_80717EC_GenerateNewSaveGame
sub_80717EC_GenerateNewSaveGame: @ 0x080717EC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0xde
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	movs r0, #0
	str r0, [r4]
	movs r3, #1
	strb r3, [r4, #0x13]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	movs r2, #2
	strb r2, [r4, #6]
	ldr r0, _08071890 @ =0x0000FFFF
	strh r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x2c
	strh r3, [r4, #0x2c]
	strh r2, [r1, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #4]
	adds r1, #8
	movs r3, #0
	ldr r0, _08071894 @ =0xFFFF8CA0
	adds r5, r0, #0
	movs r2, #0x9d
	lsls r2, r2, #1
_08071828:
	strh r5, [r1]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #2
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _08071828
	movs r0, #0
	strb r0, [r4, #0x1c]
	strb r0, [r4, #0x1d]
	strb r0, [r4, #0x1e]
	movs r0, #0xab
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r3, #0
	movs r2, #0
	ldr r0, _08071890 @ =0x0000FFFF
	adds r5, r0, #0
_08071852:
	strb r2, [r1, #0x10]
	strb r2, [r1, #0x11]
	strb r2, [r1, #0x12]
	strb r2, [r1, #0x13]
	ldrh r0, [r1, #4]
	orrs r0, r5
	strh r0, [r1, #4]
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	adds r1, #0x14
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08071852
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0
	str r0, [r1]
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x1a]
	strb r0, [r4, #0x1b]
	strb r0, [r4, #0x15]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	strb r0, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071890: .4byte 0x0000FFFF
_08071894: .4byte 0xFFFF8CA0
