.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8070EFC
sub_8070EFC: @ 0x08070EFC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r5, _08070F90 @ =gUnknown_080DF914
	adds r0, r5, #0
	bl sub_806CF44
	ldr r2, _08070F94 @ =gUnknown_03005B5C
	ldr r1, [r2]
	str r1, [r6, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	adds r0, r1, r0
	str r0, [r2]
	adds r0, r6, #4
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #0x78
	movs r3, #0x3c
	bl sub_8071380
	str r5, [r6, #0x38]
	movs r3, #0
	movs r0, #1
	strh r0, [r6, #0x3c]
	ldr r0, _08070F98 @ =gUnknown_080DF9A0
	lsls r4, r4, #3
	adds r1, r4, r0
	ldr r1, [r1]
	str r1, [r6, #0x40]
	adds r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r6, #0x44]
	ldr r2, _08070F9C @ =gUnknown_080DF968
	adds r0, r4, r2
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, r2, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r2, #4
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x50
	strh r1, [r0]
	adds r2, #6
	adds r4, r4, r2
	ldrh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x3c
	strh r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070F90: .4byte gUnknown_080DF914
_08070F94: .4byte gUnknown_03005B5C
_08070F98: .4byte gUnknown_080DF9A0
_08070F9C: .4byte gUnknown_080DF968

	thumb_func_start sub_8070FA0
sub_8070FA0: @ 0x08070FA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	ldr r0, _08071090 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r6, r1, r0
	ldr r7, [r6]
	ldr r5, _08071094 @ =gOamBuffer + 0x3E6
	ldr r2, _08071098 @ =0x000005BA
	adds r2, r2, r7
	mov sb, r2
	ldrb r0, [r2]
	cmp r0, #0
	bne _08070FCE
	bl sub_8071478
_08070FCE:
	ldr r0, [r6, #0x40]
	str r0, [sp, #4]
	ldr r0, [r6, #0x44]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	add r0, sp, #4
	movs r1, #0x20
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r2, [r0, #0x10]
	adds r1, r0, #0
	movs r0, #0x1d
	strh r0, [r1, #0x12]
	add r4, sp, #0x18
	ldr r2, [r6]
	adds r0, r4, #0
	bl sub_806CB84
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08071082
	ldrh r0, [r4, #0xc]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0xe]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0x10]
	strh r0, [r5]
	ldrh r0, [r4, #0x12]
	strh r0, [r5, #8]
	ldr r0, _0807109C @ =IWRAM_START + 0x48
	add r0, r8
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r1, r7, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	adds r0, #0x40
	ldr r2, _080710A0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	lsls r3, r0, #0x10
	movs r0, #4
	ldrsh r5, [r4, r0]
	ldr r1, _080710A4 @ =0x000005CC
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #0x3c
	movs r7, #5
	cmp r5, r0
	bge _0807103E
	movs r7, #0xc
_0807103E:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _08071060
	ldr r0, _080710A8 @ =IWRAM_START+4
	add r0, r8
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsrs r3, r3, #0x17
	lsls r3, r3, #3
	ldr r2, [r6, #0x38]
	adds r2, r2, r3
	str r2, [sp]
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_8071530
_08071060:
	movs r0, #0x3c
	ldrsh r1, [r6, r0]
	cmp r1, #2
	bne _0807107C
	ldr r0, _080710AC @ =IWRAM_START + 0x4C
	add r0, r8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0807107C
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _08071082
_0807107C:
	adds r0, r6, #4
	bl sub_80051E8
_08071082:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071090: .4byte gCurTask
_08071094: .4byte gOamBuffer + 0x3E6
_08071098: .4byte 0x000005BA
_0807109C: .4byte IWRAM_START + 0x48
_080710A0: .4byte 0x000003FF
_080710A4: .4byte 0x000005CC
_080710A8: .4byte IWRAM_START+4
_080710AC: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_80710B0
sub_80710B0: @ 0x080710B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0807114C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	ldrh r1, [r0, #6]
	ldr r0, _08071150 @ =IWRAM_START + 0x48
	adds r0, r0, r5
	mov r8, r0
	ldrh r2, [r0]
	mov ip, r2
	mov r3, ip
	rsbs r2, r3, #0
	ldr r0, _08071154 @ =0x000003FF
	mov sl, r0
	mov r3, sl
	ands r2, r3
	ldr r0, _08071158 @ =gSineTable
	mov sb, r0
	lsls r0, r2, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	ldr r2, _0807115C @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, [r6, #0x40]
	subs r2, r2, r0
	ldr r0, _08071160 @ =IWRAM_START + 0xAC
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r6, #0x44]
	subs r1, r1, r0
	asrs r0, r7, #8
	asrs r1, r1, #8
	adds r4, r0, #0
	muls r4, r1, r4
	asrs r3, r3, #6
	asrs r2, r2, #8
	adds r0, r3, #0
	muls r0, r2, r0
	adds r4, r4, r0
	rsbs r0, r7, #0
	asrs r0, r0, #8
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r1, r0
	adds r0, r2, r0
	mov r1, sb
	cmp r4, #0
	ble _08071168
	ldr r2, _08071164 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	mov r3, ip
	subs r0, r3, r0
	mov r2, sl
	ands r0, r2
	mov r3, r8
	strh r0, [r3]
	b _08071192
	.align 2, 0
_0807114C: .4byte gCurTask
_08071150: .4byte IWRAM_START + 0x48
_08071154: .4byte 0x000003FF
_08071158: .4byte gSineTable
_0807115C: .4byte IWRAM_START + 0xA8
_08071160: .4byte IWRAM_START + 0xAC
_08071164: .4byte IWRAM_START + 0x50
_08071168:
	cmp r4, #0
	bge _0807117C
	ldr r2, _08071178 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	add r0, ip
	b _0807118A
	.align 2, 0
_08071178: .4byte IWRAM_START + 0x50
_0807117C:
	cmp r0, #0
	bge _08071192
	ldr r3, _08071208 @ =IWRAM_START + 0x50
	adds r0, r5, r3
	ldrh r0, [r0]
	mov r2, ip
	subs r0, r2, r0
_0807118A:
	mov r3, sl
	ands r0, r3
	mov r2, r8
	strh r0, [r2]
_08071192:
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #2
	adds r4, r6, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r7, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x40]
	subs r0, r0, r1
	str r0, [r6, #0x40]
	ldrh r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x44]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	adds r0, r6, #0
	bl sub_80714F4
	adds r0, r6, #0
	bl sub_807120C
	adds r2, r6, #0
	adds r2, #0x52
	ldrh r0, [r2]
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r4]
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080711F8
	ldrh r0, [r2]
	strh r0, [r4]
_080711F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071208: .4byte IWRAM_START + 0x50

	thumb_func_start sub_807120C
sub_807120C: @ 0x0807120C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r7, [r5]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r5, #0x40]
	lsrs r3, r0, #0x10
	ldr r0, [r5, #0x44]
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r2, _08071270 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldrh r2, [r0, #2]
	ldr r6, _08071274 @ =IWRAM_START + 0xAC
	adds r0, r1, r6
	ldrh r0, [r0, #2]
	mov sl, r0
	adds r6, #4
	adds r0, r1, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08071278 @ =IWRAM_START + 0xB4
	adds r1, r1, r0
	ldrh r6, [r1]
	mov sb, r6
	movs r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #6
	bne _0807125E
	b _08071372
_0807125E:
	cmp r1, #6
	bgt _0807127C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807126C
	b _08071372
_0807126C:
	b _08071284
	.align 2, 0
_08071270: .4byte IWRAM_START + 0xA8
_08071274: .4byte IWRAM_START + 0xAC
_08071278: .4byte IWRAM_START + 0xB4
_0807127C:
	cmp r1, #0xa
	beq _08071372
	cmp r1, #0xe
	beq _08071372
_08071284:
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	movs r1, #0
	mov r6, ip
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08071372
	cmp r0, #3
	bgt _08071372
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r2, _080712F8 @ =0xFFFC0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080712D4
	cmp r1, #9
	bne _08071300
_080712D4:
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r1, [r0]
	subs r0, #8
	strh r1, [r0]
	movs r0, #2
	strh r0, [r5, #0x3c]
	adds r0, r7, #0
	bl sub_806F944
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xa
	strh r0, [r1]
	ldr r0, _080712FC @ =0x00000113
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_080712F8: .4byte 0xFFFC0000
_080712FC: .4byte 0x00000113
_08071300:
	ldr r6, _08071338 @ =0x000005A4
	adds r0, r7, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807133C
	adds r0, r4, #0
	adds r0, #0xb6
	movs r6, #0
	ldrsh r2, [r0, r6]
	cmp r2, #0
	bne _08071372
	adds r0, #0x46
	ldrh r1, [r0]
	subs r0, #0x44
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xe
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r2, [r0]
	movs r0, #0x92
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_08071338: .4byte 0x000005A4
_0807133C:
	adds r6, r4, #0
	adds r6, #0xb6
	movs r0, #0
	ldrsh r5, [r6, r0]
	cmp r5, #0
	bne _08071372
	adds r0, r7, #0
	movs r1, #0xa
	bl sub_806D924
	adds r0, r4, #0
	adds r0, #0xf8
	ldrh r1, [r0]
	subs r0, #0x40
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #6
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r5, [r0]
	movs r0, #0x96
	strh r0, [r6]
	movs r0, #0x76
	bl m4aSongNumStart
_08071372:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8071380
sub_8071380: @ 0x08071380
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r4, r1, #0
	ldr r0, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r5, _0807142C @ =gOamBuffer + 0x3E6
	ldr r1, _08071430 @ =0x0000107F
	ldrb r2, [r6, #7]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080713B4
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
_080713B4:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080713C2
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r1, r0
_080713C2:
	mov r0, ip
	str r4, [r0, #4]
	movs r2, #0
	movs r4, #0
	strh r4, [r0, #8]
	ldrh r0, [r6]
	mov r7, ip
	strh r0, [r7, #0xa]
	str r1, [r7, #0x10]
	mov r0, r8
	strh r0, [r7, #0x16]
	mov r1, sb
	strh r1, [r7, #0x18]
	lsls r0, r3, #6
	strh r0, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	ldr r0, _08071434 @ =0x0000FFFF
	strh r0, [r7, #0x1e]
	ldrh r1, [r6, #2]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r6, #6]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r0, ip
	bl sub_8004558
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	strh r0, [r5]
	adds r5, #8
	strh r4, [r5]
	adds r5, #8
	strh r4, [r5]
	strh r0, [r5, #8]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807142C: .4byte gOamBuffer + 0x3E6
_08071430: .4byte 0x0000107F
_08071434: .4byte 0x0000FFFF

	thumb_func_start sub_8071438
sub_8071438: @ 0x08071438
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0807146C @ =sub_8070FA0
	movs r2, #0xa0
	lsls r2, r2, #8
	ldr r1, _08071470 @ =sub_8071474
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r5, [r0]
	bl sub_8070EFC
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807146C: .4byte sub_8070FA0
_08071470: .4byte sub_8071474

	thumb_func_start sub_8071474
sub_8071474: @ 0x08071474
	bx lr
	.align 2, 0

	thumb_func_start sub_8071478
sub_8071478: @ 0x08071478
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _080714B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r2, [r3]
	mov r1, sp
	ldr r0, _080714BC @ =gUnknown_080DF95C
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, _080714C0 @ =0x000005B4
	adds r2, r2, r0
	ldrh r0, [r2]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080714B0
	movs r1, #0x3c
	ldrsh r0, [r3, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
_080714B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080714B8: .4byte gCurTask
_080714BC: .4byte gUnknown_080DF95C
_080714C0: .4byte 0x000005B4

	thumb_func_start sub_80714C4
sub_80714C4: @ 0x080714C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80714C8
sub_80714C8: @ 0x080714C8
	push {lr}
	ldr r0, _080714F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r0, #0x4c
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080714EA
	movs r0, #1
	strh r0, [r2, #0x3c]
_080714EA:
	pop {r0}
	bx r0
	.align 2, 0
_080714F0: .4byte gCurTask

	thumb_func_start sub_80714F4
sub_80714F4: @ 0x080714F4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x40]
	ldr r3, _08071528 @ =0x0029FFFF
	cmp r0, r3
	bgt _08071506
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x40]
_08071506:
	ldr r0, [r1, #0x40]
	ldr r2, _0807152C @ =0x3D60000
	cmp r0, r2
	ble _08071510
	str r2, [r1, #0x40]
_08071510:
	ldr r0, [r1, #0x44]
	cmp r0, r3
	bgt _0807151C
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x44]
_0807151C:
	ldr r0, [r1, #0x44]
	cmp r0, r2
	ble _08071524
	str r2, [r1, #0x44]
_08071524:
	pop {r0}
	bx r0
	.align 2, 0
_08071528: .4byte 0x0029FFFF
_0807152C: .4byte 0x3D60000

	thumb_func_start sub_8071530
sub_8071530: @ 0x08071530
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _0807158C @ =0x0000107F
	ldrb r1, [r5, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08071554
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08071554:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071562
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
_08071562:
	ldrh r0, [r5]
	strh r0, [r4, #0xa]
	str r2, [r4, #0x10]
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	lsls r0, r3, #6
	strh r0, [r4, #0x1a]
	ldrh r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r0, [r5, #6]
	adds r1, r4, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807158C: .4byte 0x0000107F
