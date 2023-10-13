.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start sub_802E49C
sub_802E49C: @ 0x0802E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x12c
	adds r6, r0, #0         @ r6 = p0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1              @ sb = p1
	cmp r1, #8
	bls _0802E4B6
	b _0802E774
_0802E4B6:
	cmp r1, #2
	bhi _0802E4BC
	b _0802E774
_0802E4BC:
	movs r4, #0
	movs r0, #2
	add r0, sp
	mov r8, r0
	subs r1, #1
	str r1, [sp, #0x118]
	mov r2, sp
	adds r2, #0x60
	str r2, [sp, #0x10c]
	mov r3, sp
	adds r3, #0x64
	str r3, [sp, #0x110]
	mov r5, sb
	subs r5, #2
	str r5, [sp, #0x114]
	mov r7, sp
	adds r7, #0x20
	str r7, [sp, #0x120]
	mov r0, sp
	adds r0, #0x40
	str r0, [sp, #0x124]
	cmp r4, sb
	bhs _0802E508
	mov r5, r8
_0802E4EC:
	lsls r1, r4, #2
	mov r2, sp
	adds r3, r2, r1
	adds r2, r6, r1
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r5, r1
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E4EC
_0802E508:
	movs r4, #0
	ldr r3, [sp, #0x118]
	cmp r4, r3
	bge _0802E588
_0802E510:
	adds r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	str r1, [sp, #0x11c]
	cmp r5, sb
	bhs _0802E57C
	lsls r4, r4, #2
	mov ip, r4
	mov r4, r8
	str r4, [sp, #0x108]
	mov r7, r8
	add r7, ip
	str r7, [sp, #0x128]
	mov r0, sp
	add r0, ip
	mov sl, r0
_0802E530:
	lsls r0, r5, #2
	ldr r1, [sp, #0x108]
	adds r6, r1, r0
	ldr r2, [sp, #0x128]
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r7, #0
	ldrsh r1, [r6, r7]
	cmp r3, r1
	blt _0802E572
	mov r4, sp
	add r4, ip
	mov r7, sp
	adds r2, r7, r0
	cmp r3, r1
	bne _0802E55E
	mov r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	blt _0802E572
_0802E55E:
	ldrh r1, [r4]
	ldrh r0, [r2]
	strh r0, [r4]
	strh r1, [r2]
	ldr r0, [sp, #0x128]
	ldrh r1, [r0]
	ldrh r0, [r6]
	ldr r2, [sp, #0x128]
	strh r0, [r2]
	strh r1, [r6]
_0802E572:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blo _0802E530
_0802E57C:
	ldr r3, [sp, #0x11c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x118]
	cmp r4, r5
	blt _0802E510
_0802E588:
	ldr r7, [sp, #0x10c]
	mov r0, sp
	ldrh r0, [r0]
	adds r1, r7, #0
	strh r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #2]
	ldr r2, [sp, #0x10c]
	strh r1, [r2, #2]
	movs r4, #1
	cmp r4, sb
	bhs _0802E5EE
	mov r6, r8
	adds r0, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0802E5EE
_0802E5B0:
	adds r2, r7, #0
	lsls r3, r4, #2
	mov r5, sp
	adds r0, r5, r3
	movs r5, #0
	ldrsh r1, [r2, r5]
	ldrh r5, [r0]
	mov sl, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _0802E5D2
	mov r0, sl
	strh r0, [r2]
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E5D2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	bhs _0802E5EE
	lsls r0, r4, #2
	mov r6, r8
	add r0, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	beq _0802E5B0
_0802E5EE:
	ldr r6, [sp, #0x110]
	ldr r7, [sp, #0x118]
	lsls r1, r7, #2
	mov r2, sp
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r6]
	mov sl, r8
	add r1, r8
	ldrh r1, [r1]
	ldr r3, [sp, #0x110]
	strh r1, [r3, #2]
	ldr r4, [sp, #0x114]
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov r7, r8
	adds r0, r7, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	b _0802E650
_0802E61C:
	adds r2, r6, #0
	mov r3, sp
	adds r0, r3, r5
	movs r7, #0
	ldrsh r1, [r2, r7]
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _0802E63A
	strh r3, [r2]
	mov r1, sl
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E63A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov sl, r8
	mov r3, r8
	adds r0, r3, r5
	movs r7, #2
	ldrsh r1, [r2, r7]
_0802E650:
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0802E61C
_0802E658:
	ldr r3, [sp, #0x10c]
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r5, r2, #8
	ldr r7, [sp, #0x110]
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	cmp r1, #0
	beq _0802E682
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, #0x80
	bl Div
	adds r2, r0, #0
	b _0802E68C
_0802E682:
	ldr r4, [sp, #0x110]
	movs r7, #0
	ldrsh r0, [r4, r7]
	subs r0, r0, r2
	lsls r2, r0, #8
_0802E68C:
	ldr r1, [sp, #0x10c]
	ldrh r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x110]
	movs r7, #2
	ldrsh r0, [r3, r7]
	cmp r4, r0
	bgt _0802E6C8
	add r6, sp, #0x68
_0802E6A0:
	lsls r0, r5, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E6AC
	movs r1, #0xf0
_0802E6AC:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E6B4
	movs r1, #0
_0802E6B4:
	adds r0, r6, r4
	strb r1, [r0]
	adds r5, r5, r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r4, r0
	ble _0802E6A0
_0802E6C8:
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E716
	add r2, sp, #0x68
	mov ip, r2
	ldr r3, [sp, #0x120]
	mov sl, r3
	mov r7, r8
_0802E6DA:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bgt _0802E70C
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x22
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E70C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E6DA
_0802E716:
	ldr r0, [sp, #0x120]
	adds r1, r5, #0
	bl sub_802E278
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E76C
	add r1, sp, #0x68
	mov ip, r1
	ldr r2, [sp, #0x124]
	mov sl, r2
	mov r7, r8
_0802E730:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r3, #0
	ldrsh r0, [r6, r3]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	blt _0802E762
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x42
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E762:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E730
_0802E76C:
	ldr r0, [sp, #0x124]
	adds r1, r5, #0
	bl sub_802E384
_0802E774:
	add sp, #0x12c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E784
sub_802E784: @ 0x0802E784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x24]
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x28]
	movs r0, #0
	mov sl, r0
	ldr r1, _0802E80C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802E810 @ =gUnknown_03002878
	ldr r0, _0802E814 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802E818 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	lsrs r1, r3, #0x10
	mov ip, r1
	asrs r2, r3, #0x10
	ldr r5, _0802E81C @ =0xFFFF0000
	adds r3, r3, r5
	lsrs r3, r3, #0x10
	cmp r3, #0xee
	bls _0802E7DC
	b _0802EABC
_0802E7DC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x9f
	ble _0802E7E8
	b _0802EABC
_0802E7E8:
	cmp r2, #0
	bgt _0802E7EE
	b _0802EABC
_0802E7EE:
	ldr r0, _0802E820 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r2, _0802E824 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802E830
	add r1, sp, #0x1c
	mov r6, sl
	strh r6, [r1]
	ldr r0, _0802E828 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802E82C @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802E848
	.align 2, 0
_0802E80C: .4byte gUnknown_03002A80
_0802E810: .4byte gUnknown_03002878
_0802E814: .4byte 0x04000040
_0802E818: .4byte gFlags
_0802E81C: .4byte 0xFFFF0000
_0802E820: .4byte gBgOffsetsHBlank
_0802E824: .4byte gUnknown_03001B60
_0802E828: .4byte 0x040000D4
_0802E82C: .4byte 0x81000140
_0802E830:
	add r0, sp, #0x1c
	mov r1, sl
	strh r1, [r0]
	ldr r1, _0802E938 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802E93C @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802E848:
	ldr r4, [sp, #0x20]
	ldr r6, _0802E940 @ =0xFFFFFF00
	adds r1, r4, r6
	ldr r2, _0802E944 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldr r4, _0802E948 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	str r3, [sp, #0x34]
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r6, r0, #0xf
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r8, r0
	mov r0, r8
	muls r0, r7, r0
	asrs r7, r0, #0xf
	mov r1, sp
	mov r0, ip
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, r6
	strh r0, [r1, #4]
	asrs r5, r5, #0x10
	adds r0, r5, r7
	strh r0, [r1, #6]
	subs r0, r3, r6
	strh r0, [r1]
	subs r0, r5, r7
	strh r0, [r1, #2]
	ldr r1, [sp, #0x20]
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r6, [r2, r0]
	mov ip, r6
	ldr r1, [sp, #0x28]
	mov r0, ip
	muls r0, r1, r0
	asrs r6, r0, #0xe
	ldr r0, [sp, #0x20]
	lsls r2, r0, #1
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r4, [sp, #0x28]
	muls r0, r4, r0
	asrs r7, r0, #0xe
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #4]
	adds r0, r0, r6
	strh r0, [r1, #4]
	mov r0, sp
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	strh r0, [r1, #6]
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r0, r0, r7
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, sp
	ldrh r0, [r0, #6]
	str r0, [sp, #0x30]
	mov r0, sp
	ldrh r4, [r0]
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r6, [sp, #0x34]
	ldr r1, [sp, #0x24]
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r6, r0, #0xf
	mov r0, r8
	muls r0, r1, r0
	asrs r7, r0, #0xf
	mov r1, sp
	adds r0, r3, r6
	strh r0, [r1, #8]
	adds r0, r5, r7
	strh r0, [r1, #0xa]
	mov r0, sp
	subs r3, r3, r6
	strh r3, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	mov r3, ip
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r6, r0, #2
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x16
	cmp r6, #0
	beq _0802E950
	cmp r7, #0
	beq _0802E94C
	adds r0, r6, #0
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	b _0802E950
	.align 2, 0
_0802E938: .4byte 0x040000D4
_0802E93C: .4byte 0x81000140
_0802E940: .4byte 0xFFFFFF00
_0802E944: .4byte 0x000003FF
_0802E948: .4byte gSineTable
_0802E94C:
	movs r6, #0xf0
	lsls r6, r6, #8
_0802E950:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #0x10
	asrs r1, r0, #8
	ldr r0, _0802E968 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802E996
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r5, sb
	lsls r3, r5, #0x10
	b _0802E972
	.align 2, 0
_0802E968: .4byte 0x000001FF
_0802E96C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E972:
	cmp r2, #0x9e
	bhi _0802E9C0
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E98A
	cmp r0, #0
	bge _0802E96C
	b _0802E9BC
_0802E98A:
	movs r1, #0xf0
	mov sl, r1
	b _0802E9C0
_0802E990:
	movs r5, #0xf0
	mov sl, r5
	b _0802E9C0
_0802E996:
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r0, sb
	lsls r3, r0, #0x10
	b _0802E9A6
_0802E9A0:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E9A6:
	cmp r2, #0
	beq _0802E9C0
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E990
	cmp r0, #0
	bge _0802E9A0
_0802E9BC:
	movs r0, #0
	mov sl, r0
_0802E9C0:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	asrs r1, r4, #8
	ldr r0, _0802EA08 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802EA18
	lsrs r2, r3, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	blt _0802EA30
_0802E9EA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	bge _0802E9EA
	b _0802EA52
	.align 2, 0
_0802EA08: .4byte 0x000001FF
_0802EA0C:
	movs r0, #0xf0
	mov sl, r0
	b _0802EA56
_0802EA12:
	movs r1, #0xf0
	mov sl, r1
	b _0802EA56
_0802EA18:
	lsrs r2, r3, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA30:
	movs r4, #0
	mov sl, r4
	b _0802EA56
_0802EA36:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA52:
	movs r6, #0
	mov sl, r6
_0802EA56:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	mov r1, sp
	ldrh r6, [r0, #0x14]
	movs r3, #0x14
	ldrsh r4, [r0, r3]
	ldrh r5, [r1, #0x10]
	movs r0, #0x10
	ldrsh r3, [r1, r0]
	cmp r4, r3
	beq _0802EAB2
	mov r0, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0802EAB2
	cmp r3, #0
	bne _0802EA8C
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA8C:
	cmp r4, #0
	beq _0802EA9E
	cmp r3, #0xf0
	bne _0802EA9E
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA9E:
	mov r0, sp
	strh r6, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x12]
_0802EAA6:
	strh r0, [r1, #0x1a]
	mov r0, sp
	movs r1, #7
	bl sub_802E49C
	b sub_802E784_return
_0802EAB2:
	mov r0, sp
	movs r1, #6
	bl sub_802E49C
	b sub_802E784_return
_0802EABC:
	lsrs r0, r7, #1
	adds r2, r0, #0
	mov r8, r2
	cmp r2, #0
	bne _0802EB14
	ldr r0, _0802EAE4 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r3, _0802EAE8 @ =gUnknown_03001B60
	cmp r0, r3
	bne _0802EAF4
	add r1, sp, #0x1c
	strh r2, [r1]
	ldr r0, _0802EAEC @ =0x040000D4
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _0802EAF0 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b sub_802E784_return
	.align 2, 0
_0802EAE4: .4byte gBgOffsetsHBlank
_0802EAE8: .4byte gUnknown_03001B60
_0802EAEC: .4byte 0x040000D4
_0802EAF0: .4byte 0x81000140
_0802EAF4:
	add r0, sp, #0x1c
	strh r2, [r0]
	ldr r1, _0802EB0C @ =0x040000D4
	str r0, [r1]
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r0, r3, r4
	str r0, [r1, #4]
	ldr r0, _0802EB10 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b sub_802E784_return
	.align 2, 0
_0802EB0C: .4byte 0x040000D4
_0802EB10: .4byte 0x81000140
_0802EB14:
	ldr r5, [sp, #0x20]
	ldr r6, _0802EB6C @ =0xFFFFFEFF
	adds r0, r5, r6
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	lsls r5, r4, #0x10
	cmp r0, r1
	bhi _0802EBE8
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0xef
	ble _0802EBE8
	ldr r1, _0802EB70 @ =gSineTable
	ldr r3, [sp, #0x20]
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r2, #0
	subs r0, #0xf0
	muls r0, r1, r0
	asrs r7, r0, #0xe
	asrs r0, r5, #0x10
	adds r7, r7, r0
	subs r0, r7, #1
	cmp r0, #0x9e
	bhi _0802EBE8
	movs r3, #0xf1
	ldr r0, _0802EB74 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r2, _0802EB78 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EB84
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EB7C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EB80 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EB9A
	.align 2, 0
_0802EB6C: .4byte 0xFFFFFEFF
_0802EB70: .4byte gSineTable
_0802EB74: .4byte gBgOffsetsHBlank
_0802EB78: .4byte gUnknown_03001B60
_0802EB7C: .4byte 0x040000D4
_0802EB80: .4byte 0x81000140
_0802EB84:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EBAC @ =0x040000D4
	str r0, [r1]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r2, r5
	str r0, [r1, #4]
	ldr r0, _0802EBB0 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EB9A:
	mov r6, r8
	subs r0, r7, r6
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBB4
	movs r3, #0
	b _0802EBBA
	.align 2, 0
_0802EBAC: .4byte 0x040000D4
_0802EBB0: .4byte 0x81000140
_0802EBB4:
	cmp r0, #0xa0
	ble _0802EBBA
	movs r3, #0xa0
_0802EBBA:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DF18
	mov r1, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBD6
	movs r3, #0
	b _0802EBDC
_0802EBD6:
	cmp r0, #0xa0
	ble _0802EBDC
	movs r3, #0xa0
_0802EBDC:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DDC4
	b sub_802E784_return
_0802EBE8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bls _0802ECC2
	asrs r2, r5, #0x10
	cmp r2, #0x9f
	ble _0802ECB8
	ldr r1, _0802EC40 @ =gSineTable
	ldr r3, [sp, #0x20]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r3, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, r2, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ECB8
	movs r3, #0xf1
	ldr r0, _0802EC44 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r2, _0802EC48 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EC54
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EC4C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EC50 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EC6A
	.align 2, 0
_0802EC40: .4byte gSineTable
_0802EC44: .4byte gBgOffsetsHBlank
_0802EC48: .4byte gUnknown_03001B60
_0802EC4C: .4byte 0x040000D4
_0802EC50: .4byte 0x81000140
_0802EC54:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EC7C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802EC80 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EC6A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EC84
	movs r4, #0
	b _0802EC8A
	.align 2, 0
_0802EC7C: .4byte 0x040000D4
_0802EC80: .4byte 0x81000140
_0802EC84:
	cmp r0, #0xf0
	ble _0802EC8A
	movs r4, #0xf0
_0802EC8A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E0D4
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ECA6
	movs r4, #0
	b _0802ECAC
_0802ECA6:
	cmp r0, #0xf0
	ble _0802ECAC
	movs r4, #0xf0
_0802ECAC:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E044
	b sub_802E784_return
_0802ECB8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r6, [sp, #0x20]
	cmp r6, r0
	bhi sub_802E784_return
_0802ECC2:
	asrs r5, r5, #0x10
	cmp r5, #0
	bge sub_802E784_return
	ldr r1, _0802ED10 @ =gSineTable
	ldr r2, [sp, #0x20]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r5, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r5, ip
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi sub_802E784_return
	movs r3, #0xf1
	ldr r0, _0802ED14 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	ldr r2, _0802ED18 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802ED24
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802ED1C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802ED20 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED3A
	.align 2, 0
_0802ED10: .4byte gSineTable
_0802ED14: .4byte gBgOffsetsHBlank
_0802ED18: .4byte gUnknown_03001B60
_0802ED1C: .4byte 0x040000D4
_0802ED20: .4byte 0x81000140
_0802ED24:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802ED4C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802ED50 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802ED3A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED54
	movs r4, #0
	b _0802ED5A
	.align 2, 0
_0802ED4C: .4byte 0x040000D4
_0802ED50: .4byte 0x81000140
_0802ED54:
	cmp r0, #0xf0
	ble _0802ED5A
	movs r4, #0xf0
_0802ED5A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E1EC
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED76
	movs r4, #0
	b _0802ED7C
_0802ED76:
	cmp r0, #0xf0
	ble _0802ED7C
	movs r4, #0xf0
_0802ED7C:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E164
sub_802E784_return:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
