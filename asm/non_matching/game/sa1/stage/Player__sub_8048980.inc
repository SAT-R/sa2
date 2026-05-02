.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, lr}
	mov ip, r0          @ ip = r0 = p
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bge _0804898E
	rsbs r2, r2, #0     @ r2 = qSpeedGround = ABS(p->qSpeedGround);
_0804898E:
	mov r1, ip
	adds r1, #0x81
	ldrb r3, [r1]       @ r3 = p->w.kf.shift
	mov r0, ip
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r1, #0     @ r5 = r1 = &p->w.kf.shift
	cmp r0, #1
	beq _080489A6
	b _08048AB8
_080489A6:
	ldr r0, _080489B4 @ =0x000002FF
	cmp r2, r0
	bgt _080489B8
	adds r2, #6
	mov r4, ip
	ldr r1, [r4, #0x10]
	b _080489D8
	.align 2, 0
_080489B4: .4byte 0x000002FF
_080489B8:
	ldr r0, _08048A10 @ =0x000011FF
	mov r4, ip
	ldr r1, [r4, #0x10]
	cmp r2, r0
	bgt _080489D8
	movs r0, #0x7f
	ands r0, r3
	cmp r0, #0
	bne _080489D8
	adds r2, #3
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080489D8
	adds r2, #6
_080489D8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080489FC
	movs r4, #0xc0
	lsls r4, r4, #2
	cmp r2, r4
	ble _080489FC
	subs r2, #9
	movs r0, #0x80
	lsls r0, r0, #6
	ands r1, r0
	cmp r1, #0
	beq _080489F6
	subs r2, #3
_080489F6:
	cmp r2, r4
	bge _080489FC
	adds r2, r4, #0
_080489FC:
	ldrb r0, [r5]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08048A14
	rsbs r0, r2, #0
	mov r1, ip
	strh r0, [r1, #0xc]
	b _08048A18
	.align 2, 0
_08048A10: .4byte 0x000011FF
_08048A14:
	mov r4, ip
	strh r2, [r4, #0xc]
_08048A18:
	mov r0, ip              @ r0 = ip = p
	ldrh r4, [r0, #0x38]
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _08048A42
	lsls r1, r3, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x80
	beq _08048A78
	asrs r0, r1, #0x18
	cmp r0, #0
	bge _08048A38
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08048A38:
	lsls r0, r3, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	b _08048A76
_08048A42:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08048A66
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048A78
	cmp r0, #0
	ble _08048A5C
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08048A5C:
	lsls r0, r3, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x12
	adds r0, r0, r3
	b _08048A76
_08048A66:
	lsls r0, r3, #0x18
	asrs r1, r0, #0x18
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08048A78
	adds r0, r1, #2
	lsls r0, r0, #0x18
_08048A76:
	lsrs r3, r0, #0x18
_08048A78:
	strb r3, [r5]
	ldr r1, _08048AAC @ =gSineTable
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x15
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, ip              @ r1 = ip = p
	strh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	mov r2, ip              @ r2 = ip = p
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0x7f
	bgt _08048AB0
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r2, #0xa]
	b _08048AB8
	.align 2, 0
_08048AAC: .4byte gSineTable
_08048AB0:
	adds r0, r1, #0
	subs r0, #0x18
	mov r4, ip              @ r4 = ip = p
	strh r0, [r4, #0xa]
_08048AB8:
	ldr r2, _08048AC8 @ =gCamera
	ldrh r0, [r2, #0x22]
	movs r3, #0x22
	ldrsh r1, [r2, r3]
	cmp r1, #0
	ble _08048ACC
	subs r0, #2
	b _08048AD2
	.align 2, 0
_08048AC8: .4byte gCamera
_08048ACC:
	cmp r1, #0
	bge _08048AD4
	adds r0, #4
_08048AD2:
	strh r0, [r2, #0x22]
_08048AD4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
