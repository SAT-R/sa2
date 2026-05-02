.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	ldr r0, _08033B48 @ =gCurTask
	ldr r3, [r0]
	ldrh r2, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	movs r1, #0
	str r1, [sp]
	ldr r1, _08033B4C @ =0x040000D4
	ldr r0, _08033B50 @ =gUnknown_03005870
	str r0, [r1]
	ldr r0, _08033B54 @ =gUnknown_03005890
	str r0, [r1, #4]
	ldr r0, _08033B58 @ =0x80000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _08033B5C @ =0x0300005E
	adds r1, r2, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r5, _08033B60 @ =0x03000058
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08033B7C
	movs r5, #0
	ldr r7, _08033B64 @ =0x03000030
	adds r6, r2, r7
	ldr r0, _08033B68 @ =0x03000054
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _08033B6C @ =gCamera
_08033AF4:
	lsls r0, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r1, [r4, #0x38]
	asrs r1, r1, #8
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	ldr r3, [r4, #0x3c]
	asrs r3, r3, #8
	ldrh r0, [r4, #0x32]
	adds r3, r3, r0
	ldr r2, _08033B50 @ =gUnknown_03005870
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r2, r2, r3
	ldrh r0, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r4, #0x16]
	ldrh r0, [r7, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	ldr r3, _08033B70 @ =gPlayer
	bl Coll_Player_PlatformCrumbling
	cmp r0, #0
	bne _08033B74
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033AF4
	b _08033B94
	.align 2, 0
_08033B48: .4byte gCurTask
_08033B4C: .4byte 0x040000D4
_08033B50: .4byte gUnknown_03005870
_08033B54: .4byte gUnknown_03005890
_08033B58: .4byte 0x80000009
_08033B5C: .4byte 0x0300005E
_08033B60: .4byte 0x03000058
_08033B64: .4byte 0x03000030
_08033B68: .4byte 0x03000054
_08033B6C: .4byte gCamera
_08033B70: .4byte gPlayer
_08033B74:
	movs r1, #0xff
	str r1, [sp]
	mov sb, r5
	b _08033B94
_08033B7C:
	ldr r0, _08033BB4 @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0xa
	ands r0, r1
	ldr r4, _08033BB8 @ =0x03000054
	adds r4, r4, r2
	mov r8, r4
	cmp r0, #0
	bne _08033B94
	adds r0, r3, #0
	bl TaskDestroy
_08033B94:
	ldr r5, [sp]
	cmp r5, #0
	bne _08033B9C
	b _08033E30
_08033B9C:
	mov r0, sl
	adds r0, #0x56
	mov r6, sb
	strb r6, [r0]
	mov r7, sb
	cmp r7, #0
	beq _08033BAE
	cmp r7, #8
	bne _08033BBC
_08033BAE:
	movs r6, #8
	b _08033BBE
	.align 2, 0
_08033BB4: .4byte gPlayer
_08033BB8: .4byte 0x03000054
_08033BBC:
	movs r6, #0x10
_08033BBE:
	ldr r1, _08033C38 @ =sPlayerSpeedState
	ldr r0, [r1, #0xc]
	movs r2, #2
	ands r0, r2
	cmp r0, #0
	beq _08033C58
	adds r0, r1, #0
	movs r3, #0xa
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _08033C58
	mov r4, r8
	strb r2, [r4]
	mov r0, sl
	adds r0, #0x55
	mov r5, sb
	strb r5, [r0]
	mov r1, sl
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	beq _08033BF8
	lsls r0, r0, #0x11
	lsrs r6, r0, #0x10
_08033BF8:
	mov r0, sl
	adds r0, #0x5a
	strh r6, [r0]
	movs r5, #0
	ldr r7, _08033C3C @ =gUnknown_03005890
	mov r8, r7
	mov r0, sb
	lsls r0, r0, #1
	str r0, [sp, #4]
	ldr r3, _08033C40 @ =gUnknown_03005870
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
_08033C10:
	cmp r5, sb
	bne _08033C44
	ldr r2, _08033C38 @ =sPlayerSpeedState
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	mov r0, sl
	adds r0, #0x5c
	strh r1, [r0]
	lsls r0, r5, #1
	adds r2, r0, r3
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	ble _08033C4C
	strh r6, [r2]
	b _08033C4C
	.align 2, 0
_08033C38: .4byte sPlayerSpeedState
_08033C3C: .4byte gUnknown_03005890
_08033C40: .4byte gUnknown_03005870
_08033C44:
	lsls r0, r5, #1
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0]
_08033C4C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033C10
	b _08033DFC
_08033C58:
	mov r3, r8
	ldrb r0, [r3]
	cmp r0, #2
	bne _08033D2C
	ldr r2, _08033D24 @ =gUnknown_03005870
	mov r4, sb
	lsls r3, r4, #1
	adds r6, r3, r2
	mov r5, sl
	adds r5, #0x5c
	ldrh r0, [r5]
	ldrh r7, [r6]
	adds r0, r0, r7
	strh r0, [r6]
	mov r4, sl
	adds r4, #0x5a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4]
	mov ip, r1
	movs r7, #0
	ldrsh r1, [r4, r7]
	str r3, [sp, #4]
	cmp r0, r1
	blt _08033C9E
	mov r0, ip
	strh r0, [r6]
	ldrh r0, [r5]
	movs r1, #1
	subs r1, r1, r0
	strh r1, [r5]
	mov r1, sl
	adds r1, #0x57
	movs r0, #0
	strb r0, [r1]
_08033C9E:
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	cmn r0, r1
	bgt _08033CBA
	rsbs r0, r1, #0
	strh r0, [r6]
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
_08033CBA:
	movs r5, #0
	ldr r4, _08033D28 @ =gUnknown_03005890
	mov r8, r4
	ldr r7, _08033D24 @ =gUnknown_03005870
	adds r4, r6, #0
_08033CC4:
	cmp r5, sb
	beq _08033CFA
	mov r6, sb
	subs r0, r6, r5
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08033CDC
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08033CDC:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #2
	bgt _08033CFA
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r1, #3
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	lsls r0, r5, #1
	adds r0, r0, r7
	strh r1, [r0]
_08033CFA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033CC4
	ldr r3, _08033D24 @ =gUnknown_03005870
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #8
	ble _08033D12
	movs r0, #8
	strh r0, [r3]
_08033D12:
	ldr r5, _08033D24 @ =gUnknown_03005870
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	cmp r0, #8
	ble _08033DFC
	movs r0, #8
	strh r0, [r5, #0x10]
	b _08033DFC
	.align 2, 0
_08033D24: .4byte gUnknown_03005870
_08033D28: .4byte gUnknown_03005890
_08033D2C:
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
	ldr r1, _08033D4C @ =gUnknown_03005870
	mov r0, sb
	lsls r2, r0, #1
	adds r4, r2, r1
	ldrh r3, [r4]
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r2, [sp, #4]
	cmp r0, #0
	bge _08033D50
	adds r0, r3, #2
	b _08033D52
	.align 2, 0
_08033D4C: .4byte gUnknown_03005870
_08033D50:
	adds r0, r3, #1
_08033D52:
	strh r0, [r4]
	ldr r7, [sp, #4]
	ldr r0, _08033E24 @ =gUnknown_03005870
	adds r2, r7, r0
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _08033D68
	strh r6, [r2]
_08033D68:
	movs r5, #0
	ldr r4, _08033E28 @ =gUnknown_03005890
	mov r8, r4
	ldr r6, _08033E24 @ =gUnknown_03005870
	adds r4, r2, #0
_08033D72:
	cmp r5, sb
	beq _08033DD6
	mov r7, sb
	subs r1, r7, r5
	lsls r1, r1, #0x18
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	lsrs r3, r1, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bge _08033D96
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #8
	subs r0, r0, r7
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08033D96:
	lsls r1, r2, #0x18
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	asrs r1, r1, #0x18
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	lsls r0, r5, #1
	adds r2, r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r2]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	ble _08033DC8
	adds r0, r3, #1
	strh r0, [r2]
_08033DC8:
	ldrh r3, [r2]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _08033DD6
	subs r0, r3, #1
	strh r0, [r2]
_08033DD6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033D72
	ldr r1, _08033E24 @ =gUnknown_03005870
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #8
	ble _08033DEE
	movs r0, #8
	strh r0, [r1]
_08033DEE:
	ldr r3, _08033E24 @ =gUnknown_03005870
	movs r4, #0x10
	ldrsh r0, [r3, r4]
	cmp r0, #8
	ble _08033DFC
	movs r0, #8
	strh r0, [r3, #0x10]
_08033DFC:
	ldr r5, _08033E2C @ =gPlayer
	ldr r2, [r5, #4]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r2, r6
	ldr r7, [sp, #4]
	ldr r1, _08033E24 @ =gUnknown_03005870
	adds r0, r7, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r7, #0
	add r1, r8
	movs r4, #0
	ldrsh r1, [r1, r4]
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r2, r2, r0
	str r2, [r5, #4]
	b _08033FFA
	.align 2, 0
_08033E24: .4byte gUnknown_03005870
_08033E28: .4byte gUnknown_03005890
_08033E2C: .4byte gPlayer
_08033E30:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #2
	bne _08033F1C
	ldr r2, _08033F18 @ =gUnknown_03005870
	mov r7, sl
	adds r7, #0x55
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r5, sl
	adds r5, #0x5c
	ldrh r0, [r5]
	ldrh r6, [r1]
	adds r0, r0, r6
	movs r3, #0
	mov sb, r3
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r4, r0, r2
	mov r3, sl
	adds r3, #0x5a
	movs r6, #0
	ldrsh r1, [r4, r6]
	ldrh r0, [r3]
	mov ip, r0
	movs r6, #0
	ldrsh r0, [r3, r6]
	adds r2, r7, #0
	cmp r1, r0
	blt _08033E84
	mov r0, ip
	strh r0, [r4]
	ldrh r1, [r5]
	movs r0, #1
	subs r0, r0, r1
	strh r0, [r5]
	mov r0, sl
	adds r0, #0x57
	mov r1, sb
	strb r1, [r0]
_08033E84:
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r2, _08033F18 @ =gUnknown_03005870
	adds r4, r0, r2
	movs r6, #0
	ldrsh r2, [r4, r6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmn r2, r0
	bgt _08033EAE
	rsbs r0, r0, #0
	strh r0, [r4]
	mov r2, sp
	ldrh r2, [r2]
	strh r2, [r5]
	mov r4, sb
	mov r3, r8
	strb r4, [r3]
_08033EAE:
	movs r5, #0
	adds r6, r7, #0
	ldr r7, _08033F18 @ =gUnknown_03005870
_08033EB4:
	ldrb r0, [r6]
	cmp r5, r0
	beq _08033EF0
	subs r0, r0, r5
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08033ECC
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08033ECC:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #2
	bgt _08033EF0
	ldrb r4, [r6]
	lsls r4, r4, #1
	adds r4, r4, r7
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r1, #3
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	lsls r0, r5, #1
	adds r0, r0, r7
	strh r1, [r0]
_08033EF0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033EB4
	ldr r3, _08033F18 @ =gUnknown_03005870
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #8
	ble _08033F08
	movs r0, #8
	strh r0, [r3]
_08033F08:
	ldr r5, _08033F18 @ =gUnknown_03005870
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	cmp r0, #8
	ble _08033FFA
	movs r0, #8
	strh r0, [r5, #0x10]
	b _08033FFA
	.align 2, 0
_08033F18: .4byte gUnknown_03005870
_08033F1C:
	mov r7, sp
	ldrb r0, [r7]
	mov r7, r8
	strb r0, [r7]
	ldr r1, _08034084 @ =gUnknown_03005870
	mov r2, sl
	adds r2, #0x56
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r3, r0, r1
	ldrh r4, [r3]
	movs r5, #0
	ldrsh r0, [r3, r5]
	adds r7, r2, #0
	cmp r0, #0
	ble _08033F40
	subs r0, r4, #1
	strh r0, [r3]
_08033F40:
	ldrb r0, [r7]
	lsls r0, r0, #1
	ldr r6, _08034084 @ =gUnknown_03005870
	adds r1, r0, r6
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08033F6A
	adds r0, r2, #2
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r0, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _08033F6A
	mov r5, sp
	ldrh r5, [r5]
	strh r5, [r1]
_08033F6A:
	movs r5, #0
_08033F6C:
	ldrb r0, [r7]
	cmp r5, r0
	beq _08033FF0
	subs r0, r0, r5
	lsls r0, r0, #0x18
	ldrb r1, [r7]
	adds r4, r1, #0
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08033F90
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08033F90:
	lsls r1, r1, #0x18
	ldr r6, _08034084 @ =gUnknown_03005870
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	asrs r1, r1, #0x18
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	lsls r0, r5, #1
	adds r2, r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	ble _08033FC8
	adds r0, r3, #1
	strh r0, [r2]
_08033FC8:
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bge _08033FD6
	subs r0, r3, #1
	strh r0, [r2]
_08033FD6:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #8
	ble _08033FE2
	movs r0, #8
	strh r0, [r6]
_08033FE2:
	ldr r2, _08034084 @ =gUnknown_03005870
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	cmp r0, #8
	ble _08033FF0
	movs r0, #8
	strh r0, [r2, #0x10]
_08033FF0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _08033F6C
_08033FFA:
	ldr r4, _08034088 @ =gPlayer
	ldr r0, [r4]
	ldr r5, _0803408C @ =sPlayerSpeedState
	str r0, [r5]
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #8]
	strh r0, [r5, #8]
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	ldr r0, [r4, #0x10]
	str r0, [r5, #0xc]
	ldr r6, _08034090 @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	bne _08034072
	mov r0, sl
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	bne _08034072
	movs r5, #0
	mov r6, sl
	adds r6, #0x30
_0803402C:
	lsls r0, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0xc0
	lsls r7, r7, #0x12
	adds r4, r0, r7
	ldr r1, [r4, #0x38]
	asrs r1, r1, #8
	ldrh r0, [r4, #0x30]
	adds r1, r1, r0
	ldr r3, [r4, #0x3c]
	asrs r3, r3, #8
	ldrh r2, [r4, #0x32]
	adds r3, r3, r2
	ldr r2, _08034084 @ =gUnknown_03005870
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	ldr r3, _08034094 @ =gPartner
	bl Coll_Player_PlatformCrumbling
	cmp r0, #0
	bne _08034072
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _0803402C
_08034072:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034084: .4byte gUnknown_03005870
_08034088: .4byte gPlayer
_0803408C: .4byte sPlayerSpeedState
_08034090: .4byte gNumSingleplayerCharacters
_08034094: .4byte gPartner

.syntax divided
