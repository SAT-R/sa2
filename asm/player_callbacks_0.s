.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 00
.endif

	thumb_func_start sub_80136E8
sub_80136E8: @ 0x080136E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013704
	b _08013934
_08013704:
	ldr r6, [r4, #0x20]
	movs r0, #8
	ands r6, r0
	cmp r6, #0
	beq _08013710
	b _080138CA
_08013710:
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #0x64
	beq _08013728
	movs r0, #0x65
	strh r0, [r7]
_08013728:
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r0, #0x40
	mov sl, r0
	ands r0, r2
	str r1, [sp, #4]
	cmp r0, #0
	beq _080137FC
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r1, _08013774 @ =gUnknown_03005424
	mov r8, r1
	ldrh r1, [r1]
	movs r2, #0x80
	mov sb, r2
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08013754
	rsbs r5, r5, #0
_08013754:
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r3, r0, r5
	str r3, [r4, #0xc]
	cmp r2, #2
	ble _08013778
	adds r0, r4, #0
	bl sub_8013C50
	b _0801393A
	.align 2, 0
_08013774: .4byte gUnknown_03005424
_08013778:
	cmp r2, #0
	ble _080137A4
	adds r1, r4, #0
	adds r1, #0x24
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _0801379C @ =gPlayer
	ldr r0, _080137A0 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_0801379C: .4byte gPlayer
_080137A0: .4byte PlayerCB_8013BD4
_080137A4:
	cmp r2, #0
	bge _080137AA
	b _0801392C
_080137AA:
	movs r5, #0x90
	lsls r5, r5, #4
	mov r0, r8
	ldrh r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080137BC
	rsbs r5, r5, #0
_080137BC:
	subs r0, r3, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bge _080137E4
	movs r0, #0x66
	strh r0, [r7]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	b _080138D2
_080137E4:
	movs r0, #0x66
	strh r0, [r7]
	movs r1, #0xc0
	ldr r0, [r4, #0x20]
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080137F6
	movs r1, #0x80
_080137F6:
	rsbs r0, r1, #0
	strh r0, [r4, #0x12]
	b _080138D2
_080137FC:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080138BE
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r0, _0801384C @ =gUnknown_03005424
	mov r8, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801381C
	rsbs r5, r5, #0
_0801381C:
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bgt _080138CA
	mov r2, r8
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08013850
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	b _0801385A
	.align 2, 0
_0801384C: .4byte gUnknown_03005424
_08013850:
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
_0801385A:
	adds r2, r0, #0
	cmp r2, #0
	bge _080138A8
	ldr r0, _08013874 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013878
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0801387E
	.align 2, 0
_08013874: .4byte gUnknown_03005424
_08013878:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0801387E:
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r2, [r1]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _080138A0 @ =gPlayer
	ldr r0, _080138A4 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_080138A0: .4byte gPlayer
_080138A4: .4byte PlayerCB_8013BD4
_080138A8:
	movs r0, #0x67
	strh r0, [r7]
	movs r2, #0xc0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080138BA
	movs r2, #0x80
_080138BA:
	strh r2, [r4, #0x12]
	b _080138D2
_080138BE:
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	cmp r2, #0
	ble _080138D2
_080138CA:
	adds r0, r4, #0
	bl sub_8013CA0
	b _0801393A
_080138D2:
	movs r2, #1
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r5, #0xc0
	ands r5, r0
	cmp r5, #0
	bne _08013914
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
	adds r2, r0, #0
	cmp r2, #0
	bge _08013914
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
_0801390E:
	movs r0, #0x5d
	strh r0, [r7]
	b _0801393A
_08013914:
	cmp r2, #0
	beq _0801392C
	adds r1, r4, #0
	adds r1, #0xad
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801392C
	movs r0, #3
	strb r0, [r1]
_0801392C:
	adds r0, r4, #0
	bl sub_801394C
	b _0801393A
_08013934:
	adds r0, r4, #0
	bl sub_8013CA0
_0801393A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801394C
sub_801394C: @ 0x0801394C
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _080139A8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080139A2
	ldr r0, _080139AC @ =0x0000FD60
	strh r0, [r3, #0x12]
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x10]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ands r0, r1
	cmp r0, #0
	beq _0801397C
	rsbs r0, r2, #0
	strh r0, [r3, #0x10]
_0801397C:
	ldr r0, [r3, #0x20]
	movs r2, #4
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	adds r1, #0xfe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #9
	strb r0, [r3, #0x17]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6d
	strb r2, [r0]
_080139A2:
	pop {r0}
	bx r0
	.align 2, 0
_080139A8: .4byte gPlayerControls
_080139AC: .4byte 0x0000FD60

	thumb_func_start sub_80139B0
sub_80139B0: @ 0x080139B0
	push {r4, lr}
	mov ip, r0
	movs r1, #0x14
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _080139BE
	rsbs r3, r3, #0
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

	thumb_func_start sub_8013AD8
sub_8013AD8: @ 0x08013AD8
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	strb r0, [r3, #0x17]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #0x12]
	adds r0, r0, r1
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08013B02
	movs r0, #0
	strh r0, [r3, #0x12]
_08013B02:
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x14]
	ldr r1, [r3, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013B16
	asrs r0, r2, #1
	strh r0, [r3, #0x14]
_08013B16:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08013B2E
	ldrh r0, [r3, #0x14]
	rsbs r0, r0, #0
	strh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0x80
	b _08013B38
_08013B2E:
	ldrh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0
_08013B38:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0xac
	strb r0, [r2]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08013B64 @ =gPlayer
	ldr r1, _08013B68 @ =PlayerCB_8013BB4
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08013B64: .4byte gPlayer
_08013B68: .4byte PlayerCB_8013BB4

	thumb_func_start PlayerCB_8013B6C
PlayerCB_8013B6C: @ 0x08013B6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013BA8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08013BA0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013BA6
_08013BA0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08013BA6:
	strb r0, [r1]
_08013BA8:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BB4
PlayerCB_8013BB4: @ 0x08013BB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80139B0
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_80131B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BD4
PlayerCB_8013BD4: @ 0x08013BD4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_8013498
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013BF0
PlayerCB_8013BF0: @ 0x08013BF0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013C0C
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013C0C:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C18
PlayerCB_8013C18: @ 0x08013C18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80135BC
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C34
PlayerCB_8013C34: @ 0x08013C34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80136E8
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C50
sub_8013C50: @ 0x08013C50
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x68
	strh r0, [r1]
	ldr r0, _08013C74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013C78
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	b _08013C82
	.align 2, 0
_08013C74: .4byte gUnknown_03005424
_08013C78:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
_08013C82:
	str r0, [r2, #0xc]
	ldr r1, _08013C98 @ =gPlayer
	ldr r0, _08013C9C @ =PlayerCB_8013E64
	str r0, [r1]
	adds r1, r2, #0
	adds r1, #0xad
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C98: .4byte gPlayer
_08013C9C: .4byte PlayerCB_8013E64

	thumb_func_start sub_8013CA0
sub_8013CA0: @ 0x08013CA0
	ldr r2, _08013CB8 @ =gPlayer
	ldr r1, _08013CBC @ =PlayerCB_8013BD4
	str r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0x64
	movs r1, #0x5d
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013CB8: .4byte gPlayer
_08013CBC: .4byte PlayerCB_8013BD4

	thumb_func_start sub_8013CC0
sub_8013CC0: @ 0x08013CC0
	push {lr}
	adds r2, r0, #0
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08013CCE
	rsbs r1, r1, #0
_08013CCE:
	ldr r0, _08013CE4 @ =0x000002FF
	cmp r1, r0
	bgt _08013CEE
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013CE8
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08013CEC
	.align 2, 0
_08013CE4: .4byte 0x000002FF
_08013CE8:
	movs r0, #0xc0
	lsls r0, r0, #2
_08013CEC:
	strh r0, [r2, #0x14]
_08013CEE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013CF4
sub_8013CF4: @ 0x08013CF4
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013D06
	subs r1, #0x60
	cmp r1, #0
	bge _08013D12
	b _08013D10
_08013D06:
	cmp r1, #0
	bge _08013D14
	adds r1, #0x60
	cmp r1, #0
	ble _08013D12
_08013D10:
	movs r1, #0
_08013D12:
	strh r1, [r0, #0x14]
_08013D14:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013D18
PlayerCB_8013D18: @ 0x08013D18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r3, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _08013D6C @ =0x20000100
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013D70 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6a
	strh r0, [r1]
	strh r3, [r4, #0x10]
	strh r3, [r4, #0x12]
	movs r0, #0xe2
	bl m4aSongNumStart
	ldr r0, _08013D74 @ =gPlayer
	ldr r1, _08013D78 @ =PlayerCB_8013DA8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D6C: .4byte 0x20000100
_08013D70: .4byte 0xFFFFBFFF
_08013D74: .4byte gPlayer
_08013D78: .4byte PlayerCB_8013DA8

	thumb_func_start sub_8013D7C
sub_8013D7C: @ 0x08013D7C
	ldr r2, _08013DA0 @ =gPlayer
	ldr r1, _08013DA4 @ =PlayerCB_8013BD4
	str r1, [r2]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x5d
	strh r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0xac
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08013DA0: .4byte gPlayer
_08013DA4: .4byte PlayerCB_8013BD4

	thumb_func_start PlayerCB_8013DA8
PlayerCB_8013DA8: @ 0x08013DA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80283C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013DEC
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x6b
	strh r0, [r1]
	strh r2, [r4, #0x10]
	adds r0, #0x95
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8012DF8
	ldr r0, _08013DF4 @ =gPlayer
	ldr r1, _08013DF8 @ =PlayerCB_8013DFC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_08013DEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DF4: .4byte gPlayer
_08013DF8: .4byte PlayerCB_8013DFC

	thumb_func_start PlayerCB_8013DFC
PlayerCB_8013DFC: @ 0x08013DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80283C4
	ldr r2, [r4, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08013E26
	ldr r1, _08013E2C @ =gPlayer
	ldr r0, _08013E30 @ =PlayerCB_8013E34
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6c
	strh r0, [r1]
	strh r2, [r4, #0x12]
_08013E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013E2C: .4byte gPlayer
_08013E30: .4byte PlayerCB_8013E34

	thumb_func_start PlayerCB_8013E34
PlayerCB_8013E34: @ 0x08013E34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013E5E
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013E5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013E64
PlayerCB_8013E64: @ 0x08013E64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013ECE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08013E98 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013E9C
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	b _08013EA6
	.align 2, 0
_08013E98: .4byte gUnknown_03005424
_08013E9C:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
_08013EA6:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013EBC
	ldr r0, [r4, #8]
	ldr r1, _08013EB8 @ =0xFFFFF000
	b _08013EC2
	.align 2, 0
_08013EB8: .4byte 0xFFFFF000
_08013EBC:
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #5
_08013EC2:
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl PlayerCB_8025318
	b _08013EDA
_08013ECE:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
_08013EDA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013EE0
sub_8013EE0: @ 0x08013EE0
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013EF2
	subs r1, #0x60
	cmp r1, #0
	bge _08013EFE
	b _08013EFC
_08013EF2:
	cmp r1, #0
	bge _08013F00
	adds r1, #0x60
	cmp r1, #0
	ble _08013EFE
_08013EFC:
	movs r1, #0
_08013EFE:
	strh r1, [r0, #0x14]
_08013F00:
	pop {r0}
	bx r0

	thumb_func_start sub_8013F04
sub_8013F04: @ 0x08013F04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013F54 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	bl sub_8015BD4
	ldr r0, _08013F58 @ =gPlayer
	ldr r1, _08013F5C @ =PlayerCB_8013F60
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F54: .4byte 0xFFFFBFFF
_08013F58: .4byte gPlayer
_08013F5C: .4byte PlayerCB_8013F60

	thumb_func_start PlayerCB_8013F60
PlayerCB_8013F60: @ 0x08013F60
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013F74
	subs r0, #0x60
	cmp r0, #0
	bge _08013F80
	b _08013F7E
_08013F74:
	cmp r0, #0
	bge _08013F82
	adds r0, #0x60
	cmp r0, #0
	ble _08013F80
_08013F7E:
	movs r0, #0
_08013F80:
	strh r0, [r2, #0x14]
_08013F82:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013F9A
	ldr r1, _08013FA4 @ =gPlayer
	ldr r0, _08013FA8 @ =PlayerCB_8025318
	str r0, [r1]
_08013F9A:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013FA4: .4byte gPlayer
_08013FA8: .4byte PlayerCB_8025318
