.include "asm/macros.inc"

.syntax unified
.arm

	.align 2, 0

	thumb_func_start sub_809679C
sub_809679C: @ 0x0809679C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080967B8 @ =0x0E005555
	movs r1, #0xaa
	strb r1, [r3]
	ldr r2, _080967BC @ =0x0E002AAA
	movs r1, #0x55
	strb r1, [r2]
	movs r1, #0xb0
	strb r1, [r3]
	movs r1, #0xe0
	lsls r1, r1, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_080967B8: .4byte 0x0E005555
_080967BC: .4byte 0x0E002AAA

	thumb_func_start sub_80967C0
sub_80967C0: @ 0x080967C0
	push {r4, r5, lr}
	sub sp, #0x44
	mov r0, sp
	bl sub_80969B0
	mov r5, sp
	adds r5, #1
	ldr r2, _080967E8 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _080967EC @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0x90
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _080967F0 @ =0x00004E20
	adds r0, r2, #0
	b _080967F8
	.align 2, 0
_080967E8: .4byte 0x0E005555
_080967EC: .4byte 0x0E002AAA
_080967F0: .4byte 0x00004E20
_080967F4:
	ldrh r0, [r1]
	subs r0, #1
_080967F8:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _080967F4
	ldr r0, _08096834 @ =0x0E000001
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0x14
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r1, _08096838 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r1]
	ldr r2, _0809683C @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r2]
	movs r0, #0xf0
	strb r0, [r1]
	strb r0, [r1]
	add r1, sp, #0x40
	ldr r2, _08096840 @ =0x00004E20
	adds r0, r2, #0
	b _08096848
	.align 2, 0
_08096834: .4byte 0x0E000001
_08096838: .4byte 0x0E005555
_0809683C: .4byte 0x0E002AAA
_08096840: .4byte 0x00004E20
_08096844:
	ldrh r0, [r1]
	subs r0, #1
_08096848:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _08096844
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809685C
sub_809685C: @ 0x0809685C
	push {lr}
	ldr r1, _0809687C @ =gUnknown_0300042E
	ldrh r0, [r1]
	cmp r0, #0
	beq _08096878
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08096878
	ldr r1, _08096880 @ =gUnknown_03005B90
	movs r0, #1
	strb r0, [r1]
_08096878:
	pop {r0}
	bx r0
	.align 2, 0
_0809687C: .4byte gUnknown_0300042E
_08096880: .4byte gUnknown_03005B90

	thumb_func_start sub_8096884
sub_8096884: @ 0x08096884
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _080968B8
	ldr r0, _080968A8 @ =gUnknown_0300042C
	strb r1, [r0]
	ldr r1, _080968AC @ =gUnknown_03000430
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _080968B0 @ =0x04000100
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _080968B4 @ =sub_809685C
	str r0, [r2]
	movs r0, #0
	b _080968BA
	.align 2, 0
_080968A8: .4byte gUnknown_0300042C
_080968AC: .4byte gUnknown_03000430
_080968B0: .4byte 0x04000100
_080968B4: .4byte sub_809685C
_080968B8:
	movs r0, #1
_080968BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80968C0
sub_80968C0: @ 0x080968C0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08096944 @ =gUnknown_03005BB0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r1, _08096948 @ =gUnknown_03000434
	ldr r0, _0809694C @ =0x04000208
	mov sb, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	mov r1, sb
	strh r3, [r1]
	ldr r0, _08096950 @ =gUnknown_03000430
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, #2]
	ldr r6, _08096954 @ =0x04000200
	ldr r1, _08096958 @ =gUnknown_0300042C
	mov sl, r1
	ldrb r1, [r1]
	movs r5, #8
	adds r0, r5, #0
	lsls r0, r1
	adds r1, r0, #0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0809695C @ =gUnknown_03005B90
	strb r3, [r0]
	ldr r1, _08096960 @ =gUnknown_0300042E
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, #2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	str r4, [r1]
	ldr r1, _08096964 @ =0x04000202
	mov r2, sl
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096944: .4byte gUnknown_03005BB0
_08096948: .4byte gUnknown_03000434
_0809694C: .4byte 0x04000208
_08096950: .4byte gUnknown_03000430
_08096954: .4byte 0x04000200
_08096958: .4byte gUnknown_0300042C
_0809695C: .4byte gUnknown_03005B90
_08096960: .4byte gUnknown_0300042E
_08096964: .4byte 0x04000202

	thumb_func_start sub_8096968
sub_8096968: @ 0x08096968
	ldr r3, _08096998 @ =0x04000208
	movs r1, #0
	strh r1, [r3]
	ldr r2, _0809699C @ =gUnknown_03000430
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _080969A0 @ =0x04000200
	ldr r0, _080969A4 @ =gUnknown_0300042C
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _080969A8 @ =gUnknown_03000434
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.align 2, 0
_08096998: .4byte 0x04000208
_0809699C: .4byte gUnknown_03000430
_080969A0: .4byte 0x04000200
_080969A4: .4byte gUnknown_0300042C
_080969A8: .4byte gUnknown_03000434

	thumb_func_start sub_80969AC
sub_80969AC: @ 0x080969AC
	ldrb r0, [r0]
	bx lr

	thumb_func_start sub_80969B0
sub_80969B0: @ 0x080969B0
	push {lr}
	adds r2, r0, #0
	ldr r1, _080969CC @ =gUnknown_03005B94
	adds r0, r2, #1
	str r0, [r1]
	ldr r3, _080969D0 @ =sub_80969AC+1
	movs r0, #1
	eors r3, r0
	ldr r0, _080969D4 @ =sub_80969B0
	ldr r1, _080969D0 @ =sub_80969AC+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080969E4
	.align 2, 0
_080969CC: .4byte gUnknown_03005B94
_080969D0: .4byte sub_80969AC+1
_080969D4: .4byte sub_80969B0
_080969D8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080969E4:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080969D8
	pop {r0}
	bx r0
	.align 2, 0


	thumb_func_start sub_80969F0
sub_80969F0: @ 0x080969F0
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _08096A0C
	movs r2, #1
	rsbs r2, r2, #0
_080969FE:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _080969FE
_08096A0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8096A14
sub_8096A14: @ 0x08096A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _08096A60 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096A64 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08096A68 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096A4C
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096A4C:
	ldr r3, _08096A6C @ =sub_80969F0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096A70 @ =sub_8096A14
	ldr r1, _08096A6C @ =sub_80969F0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096A80
	.align 2, 0
_08096A60: .4byte 0x04000204
_08096A64: .4byte 0x0000FFFC
_08096A68: .4byte gUnknown_03005BA0
_08096A6C: .4byte sub_80969F0+1
_08096A70: .4byte sub_8096A14
_08096A74:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096A80:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096A74
	mov r3, sp
	adds r3, #1
	ldr r0, _08096AAC @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r4, r0
	adds r0, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r5, r2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096AAC: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096AB0
sub_8096AB0: @ 0x08096AB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _08096AD6
	movs r2, #1
	rsbs r2, r2, #0
_08096AC0:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _08096AD0
	subs r0, r3, #1
	b _08096AD8
_08096AD0:
	subs r4, #1
	cmp r4, r2
	bne _08096AC0
_08096AD6:
	movs r0, #0
_08096AD8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8096AE0
sub_8096AE0: @ 0x08096AE0
	push {r4, r5, lr}
	sub sp, #0x100
	adds r5, r1, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _08096B28 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096B2C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08096B30 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096B14
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096B14:
	ldr r3, _08096B34 @ =sub_8096AB0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096B38 @ =sub_8096AE0
	ldr r1, _08096B34 @ =sub_8096AB0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096B48
	.align 2, 0
_08096B28: .4byte 0x04000204
_08096B2C: .4byte 0x0000FFFC
_08096B30: .4byte gUnknown_03005BA0
_08096B34: .4byte sub_8096AB0+1
_08096B38: .4byte sub_8096AE0
_08096B3C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096B48:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096B3C
	mov r3, sp
	adds r3, #1
	ldr r0, _08096B74 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096B74: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096B78
sub_8096B78: @ 0x08096B78
	push {r4, r5, r6, lr}
	sub sp, #0x100
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r2, r0, #0x10
	lsrs r4, r2, #0x10
	ldr r0, _08096BC0 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096BA0
	lsrs r0, r2, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096BA0:
	ldr r2, _08096BC4 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096BC8 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08096BCC @ =sub_8096AB0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096BD0 @ =sub_8096AE0
	ldr r1, _08096BCC @ =sub_8096AB0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096BE0
	.align 2, 0
_08096BC0: .4byte gUnknown_03005BA0
_08096BC4: .4byte 0x04000204
_08096BC8: .4byte 0x0000FFFC
_08096BCC: .4byte sub_8096AB0+1
_08096BD0: .4byte sub_8096AE0
_08096BD4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096BE0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096BD4
	mov r3, sp
	adds r3, #1
	ldr r0, _08096C0C @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096C0C: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096C10
sub_8096C10: @ 0x08096C10
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _08096C22
_08096C1C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08096C22:
	cmp r6, #2
	bhi _08096C48
	ldr r0, _08096C50 @ =gUnknown_03005B9C
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08096C1C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096AE0
	adds r2, r0, #0
	cmp r2, #0
	bne _08096C1C
_08096C48:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096C50: .4byte gUnknown_03005B9C

	thumb_func_start sub_8096C54
sub_8096C54: @ 0x08096C54
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _08096C68
_08096C62:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08096C68:
	cmp r6, #2
	bhi _08096C90
	ldr r0, _08096C98 @ =gUnknown_03005B9C
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _08096C62
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_8096B78
	adds r3, r0, #0
	cmp r3, #0
	bne _08096C62
_08096C90:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096C98: .4byte gUnknown_03005B9C

	thumb_func_start sub_8096C9C
sub_8096C9C: @ 0x08096C9C
	push {r4, lr}
	ldr r2, _08096CBC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096CC0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl sub_80967C0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _08096CC4 @ =gUnknown_08C86E38
	movs r4, #1
	b _08096CCA
	.align 2, 0
_08096CBC: .4byte 0x04000204
_08096CC0: .4byte 0x0000FFFC
_08096CC4: .4byte gUnknown_08C86E38
_08096CC8:
	adds r2, #4
_08096CCA:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096CDE
	ldrh r0, [r1, #0x28]
	cmp r3, r0
	bne _08096CC8
	movs r4, #0
_08096CDE:
	ldr r1, _08096D18 @ =gUnknown_03005B9C
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08096D1C @ =gUnknown_03005BA8
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _08096D20 @ =gUnknown_03005BAC
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _08096D24 @ =gUnknown_03005B98
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _08096D28 @ =gUnknown_03005BB0
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _08096D2C @ =gUnknown_03005BA0
	ldr r0, [r2]
	adds r0, #0x14
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08096D18: .4byte gUnknown_03005B9C
_08096D1C: .4byte gUnknown_03005BA8
_08096D20: .4byte gUnknown_03005BAC
_08096D24: .4byte gUnknown_03005B98
_08096D28: .4byte gUnknown_03005BB0
_08096D2C: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096D30
sub_8096D30: @ 0x08096D30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0
	mov r8, r0
	adds r0, r4, #0
	bl sub_80968C0
	ldr r7, _08096D58 @ =gUnknown_03005B94
	movs r0, #0xc0
	lsls r0, r0, #8
	orrs r4, r0
	lsls r4, r4, #0x10
	b _08096D7C
	.align 2, 0
_08096D58: .4byte gUnknown_03005B94
_08096D5C:
	ldr r0, _08096D74 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0xc2
	bne _08096D6C
	ldr r1, _08096D78 @ =0x0E005555
	movs r0, #0xf0
	strb r0, [r1]
_08096D6C:
	lsrs r4, r4, #0x10
	mov r8, r4
	b _08096DA4
	.align 2, 0
_08096D74: .4byte gUnknown_03005BA0
_08096D78: .4byte 0x0E005555
_08096D7C:
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _08096DA4
	ldr r0, _08096DB4 @ =gUnknown_03005B90
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096D7C
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _08096D5C
_08096DA4:
	bl sub_8096968
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096DB4: .4byte gUnknown_03005B90

	thumb_func_start sub_8096DB8
sub_8096DB8: @ 0x08096DB8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _08096E14 @ =0x04000204
	ldrh r1, [r5]
	ldr r6, _08096E18 @ =0x0000FFFC
	ands r1, r6
	ldr r0, _08096E1C @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _08096E20 @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _08096E24 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl sub_80969B0
	ldr r0, _08096E28 @ =gUnknown_03005B98
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r3, [r0]
	movs r0, #3
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	ands r1, r6
	movs r2, #3
	orrs r1, r2
	strh r1, [r5]
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096E14: .4byte 0x04000204
_08096E18: .4byte 0x0000FFFC
_08096E1C: .4byte gUnknown_03005BA0
_08096E20: .4byte 0x0E005555
_08096E24: .4byte 0x0E002AAA
_08096E28: .4byte gUnknown_03005B98

	thumb_func_start sub_8096E2C
sub_8096E2C: @ 0x08096E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _08096EB4
	ldr r6, _08096E9C @ =0x04000204
	ldrh r1, [r6]
	ldr r0, _08096EA0 @ =0x0000FFFC
	mov r8, r0
	ands r1, r0
	ldr r0, _08096EA4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r6]
	ldrb r4, [r2, #8]
	lsls r3, r4
	adds r4, r3, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r4, r4, r2
	ldr r1, _08096EA8 @ =0x0E005555
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _08096EAC @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl sub_80969B0
	ldr r0, _08096EB0 @ =gUnknown_03005B98
	ldr r3, [r0]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	mov r2, r8
	ands r1, r2
	movs r2, #3
	orrs r1, r2
	strh r1, [r6]
	b _08096EB6
	.align 2, 0
_08096E9C: .4byte 0x04000204
_08096EA0: .4byte 0x0000FFFC
_08096EA4: .4byte gUnknown_03005BA0
_08096EA8: .4byte 0x0E005555
_08096EAC: .4byte 0x0E002AAA
_08096EB0: .4byte gUnknown_03005B98
_08096EB4:
	ldr r0, _08096EC4 @ =0x000080FF
_08096EB6:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096EC4: .4byte 0x000080FF

	thumb_func_start sub_8096EC8
sub_8096EC8: @ 0x08096EC8
	push {r4, lr}
	ldr r4, _08096EF4 @ =0x0E005555
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _08096EF8 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _08096EFC @ =gUnknown_03005B98
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, #1
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08096EF4: .4byte 0x0E005555
_08096EF8: .4byte 0x0E002AAA
_08096EFC: .4byte gUnknown_03005B98

	thumb_func_start sub_8096F00
sub_8096F00: @ 0x08096F00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0xf
	bls _08096F20
	ldr r0, _08096F1C @ =0x000080FF
	b _0809700E
	.align 2, 0
_08096F1C: .4byte 0x000080FF
_08096F20:
	ldr r0, _08096F40 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r7, r8
	lsls r7, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r7, r7, r0
	ldr r1, _08096F44 @ =sub_8097024+1
	movs r0, #1
	adds r3, r1, #0
	eors r3, r0
	mov r2, sp
	ldr r0, _08096F48 @ =sub_8097048
	subs r0, r0, r1
	b _08096F56
	.align 2, 0
_08096F40: .4byte gUnknown_03005BA0
_08096F44: .4byte sub_8097024+1
_08096F48: .4byte sub_8097048
_08096F4C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #2
_08096F56:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096F4C
	movs r4, #0
	b _08096F6C
_08096F62:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x51
	beq _0809700C
_08096F6C:
	mov r0, r8
	bl sub_8096E2C
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	adds r0, r7, #0
	mov r1, sp
	adds r1, #1
	bl sub_8097048
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	movs r6, #1
	cmp r4, #0
	beq _08096F94
	movs r6, #6
_08096F94:
	movs r4, #1
	cmp r4, r6
	bhi _08096FAA
_08096F9A:
	mov r0, r8
	bl sub_8096E2C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _08096F9A
_08096FAA:
	mov r0, sp
	bl sub_80969B0
	ldr r3, _08096FCC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _08096FD0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _08096FD4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _08096FD8 @ =gUnknown_03005BA4
	ldr r0, [r2, #4]
	strh r0, [r1]
	adds r4, r1, #0
	b _08096FE8
	.align 2, 0
_08096FCC: .4byte 0x04000204
_08096FD0: .4byte 0x0000FFFC
_08096FD4: .4byte gUnknown_03005BA0
_08096FD8: .4byte gUnknown_03005BA4
_08096FDC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	movs r0, #1
	add sb, r0
	adds r7, #1
_08096FE8:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08096FFE
	mov r0, sb
	adds r1, r7, #0
	bl sub_8096EC8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08096FDC
_08096FFE:
	ldr r2, _0809701C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08097020 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0809700C:
	adds r0, r5, #0
_0809700E:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809701C: .4byte 0x04000204
_08097020: .4byte 0x0000FFFC

	thumb_func_start sub_8097024
sub_8097024: @ 0x08097024
	push {lr}
	adds r2, r0, #0
	ldr r0, _08097030 @ =0x03005BA0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	b _08097036
	.align 2, 0
_08097030: .4byte 0x03005BA0
_08097034:
	subs r1, #1
_08097036:
	cmp r1, #0
	beq _08097042
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #0xff
	beq _08097034
_08097042:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8097048
sub_8097048: @ 0x08097048
	push {lr}
	bl _call_via_r1
	cmp r0, #0
	bne _08097056
	movs r0, #0
	b _08097058
_08097056:
	ldr r0, _0809705C @ =0x00008004
_08097058:
	pop {r1}
	bx r1
	.align 2, 0
_0809705C: .4byte 0x00008004

	thumb_func_start sub_8097060
sub_8097060: @ 0x08097060
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08097078 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r4, r0
	blo _08097080
	ldr r0, _0809707C @ =0x000080FF
	b _080970FC
	.align 2, 0
_08097078: .4byte gUnknown_03005BA0
_0809707C: .4byte 0x000080FF
_08097080:
	adds r0, r4, #0
	bl sub_8096E2C
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080970FA
	mov r0, sp
	bl sub_80969B0
	ldr r3, _080970BC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _080970C0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _080970C4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _080970C8 @ =gUnknown_03005BA4
	ldr r0, [r2, #4]
	strh r0, [r1]
	ldrb r0, [r2, #8]
	lsls r4, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	adds r6, r1, #0
	b _080970D6
	.align 2, 0
_080970BC: .4byte 0x04000204
_080970C0: .4byte 0x0000FFFC
_080970C4: .4byte gUnknown_03005BA0
_080970C8: .4byte gUnknown_03005BA4
_080970CC:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	adds r7, #1
	adds r4, #1
_080970D6:
	ldrh r0, [r6]
	cmp r0, #0
	beq _080970EC
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8096EC8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080970CC
_080970EC:
	ldr r2, _08097104 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08097108 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_080970FA:
	adds r0, r5, #0
_080970FC:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097104: .4byte 0x04000204
_08097108: .4byte 0x0000FFFC
