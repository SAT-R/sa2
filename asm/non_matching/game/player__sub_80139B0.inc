
.syntax unified
.text
	push {r4, lr}
	mov ip, r0          @ ip = player
	movs r1, #0x14
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _080139BE
	rsbs r3, r3, #0     @ r3 = speedGrnd (abs)
_080139BE:
	mov r0, ip
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r1, _080139D0 @ =0x000002FF
	adds r4, r0, #0
	cmp r3, r1
	bgt _080139D4
	adds r3, #6
	b _080139E4
	.align 2, 0
_080139D0: .4byte 0x000002FF
_080139D4:
	ldr r0, _08013A14 @ =0x00000EFF
	cmp r3, r0
	bgt _080139E4
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0
	bne _080139E4
	adds r3, #3
_080139E4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013A00
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r3, r0
	ble _08013A00
	subs r3, #9
	cmp r3, r0
	bge _08013A00
	adds r3, r0, #0
_08013A00:
	ldrb r0, [r4]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08013A18
	rsbs r0, r3, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	b _08013A1C
	.align 2, 0
_08013A14: .4byte 0x00000EFF
_08013A18:
	mov r0, ip
	strh r3, [r0, #0x14]
_08013A1C:
	mov r0, ip
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013A48
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x80
	beq _08013A7E
	asrs r0, r1, #0x18
	cmp r0, #0
	bge _08013A3E
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A3E:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	b _08013A7C
_08013A48:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013A6C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08013A7E
	cmp r0, #0
	ble _08013A62
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A62:
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r0, r2
	b _08013A7C
_08013A6C:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013A7E
	adds r0, r1, #2
	lsls r0, r0, #0x18
_08013A7C:
	lsrs r2, r0, #0x18
_08013A7E:
	strb r2, [r4]
	ldr r1, _08013AAC @ =gSineTable
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x15
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	mov r3, ip
	strh r0, [r3, #0x10]
	ldrh r1, [r3, #0x12]
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	cmp r0, #0x7f
	bgt _08013AB0
	adds r0, r1, #0
	adds r0, #0x18
	b _08013AB6
	.align 2, 0
_08013AAC: .4byte gSineTable
_08013AB0:
	adds r0, r1, #0
	subs r0, #0x18
	mov r3, ip
_08013AB6:
	strh r0, [r3, #0x12]
	ldr r1, _08013AC4 @ =gCamera
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	ble _08013AC8
	subs r0, #2
	b _08013ACE
	.align 2, 0
_08013AC4: .4byte gCamera
_08013AC8:
	cmp r0, #0
	bge _08013AD0
	adds r0, #4
_08013ACE:
	str r0, [r1, #0x4c]
_08013AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.syntax divided
