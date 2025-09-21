.syntax unified
.text
	push {r4, r5, lr}
	ldr r0, _08091C64 @ =0x030026F0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	ldr r0, _08091C68 @ =0x0300036E
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091C6C
	subs r0, #1
	strh r0, [r1]
	b _08091D32
	.align 2, 0
_08091C64: .4byte 0x030026F0
_08091C68: .4byte 0x0300036E
_08091C6C:
	ldr r3, _08091D38 @ =0x0300035C
	adds r5, r5, r3
	ldrb r1, [r5]
	cmp r1, #9
	bhi _08091CCE
	ldr r2, _08091D3C @ =0x03002840
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091D40 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r2, _08091D44 @ =0x030018E8
	ldr r0, _08091D48 @ =0x00003FBF
	strh r0, [r2]
	ldr r3, _08091D4C @ =0x080E1030
	ldrb r0, [r5]
	adds r3, r3, r0
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08091CC0
	ldrb r1, [r3]
	ldrh r0, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	cmp r0, #0xf
	bhi _08091D1C
	b _08091D32
_08091CC0:
	ldrb r1, [r3]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	cmp r0, r1
	bls _08091D1C
	b _08091D32
_08091CCE:
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, #0xa
	bne _08091D2A
	adds r0, r4, #0
	bl sub_80928C8
	ldr r2, _08091D3C @ =0x03002840
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091D40 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _08091D44 @ =0x030018E8
	ldr r0, _08091D48 @ =0x00003FBF
	strh r0, [r1]
	ldrh r0, [r1, #4]
	subs r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08091D32
_08091D1C:
	ldrb r0, [r5]
	adds r0, #1
	cmp r0, #2
	bne _08091D26
	adds r0, #4
_08091D26:
	strb r0, [r5]
	b _08091D32
_08091D2A:
	ldr r0, _08091D50 @ =0x030026F0
	ldr r1, [r0]
	ldr r0, _08091D54 @ =sub_8091E60
	str r0, [r1, #8]
_08091D32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091D38: .4byte 0x0300035C
_08091D3C: .4byte 0x03002840
_08091D40: .4byte gWinRegs
_08091D44: .4byte 0x030018E8
_08091D48: .4byte 0x00003FBF
_08091D4C: .4byte 0x080E1030
_08091D50: .4byte 0x030026F0
_08091D54: .4byte sub_8091E60
_08091D58:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.syntax divided
