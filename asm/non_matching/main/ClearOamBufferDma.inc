	.syntax unified
    .text

	push {r4, lr}
	sub sp, #4
	ldr r1, _08001CC8 @ =gUnknown_0300188C
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08001CCC @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08001CEA
	ldr r3, _08001CD0 @ =gUnknown_03001884
	ldr r0, _08001CD4 @ =gUnknown_03004D54
	ldr r1, [r3]
	ldr r2, [r0]
	cmp r1, r2
	bne _08001CE0
	ldr r0, _08001CD8 @ =gUnknown_030022C0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08001CDC @ =gUnknown_030022AC
	str r2, [r0]
	b _08001CEA
	.align 2, 0
_08001CC8: .4byte gUnknown_0300188C
_08001CCC: .4byte gUnknown_03001840
_08001CD0: .4byte gUnknown_03001884
_08001CD4: .4byte gUnknown_03004D54
_08001CD8: .4byte gUnknown_030022C0
_08001CDC: .4byte gUnknown_030022AC
_08001CE0:
	str r2, [r3]
	ldr r0, _08001D60 @ =gUnknown_030022AC
	ldr r1, _08001D64 @ =gUnknown_030022C0
	ldr r1, [r1]
	str r1, [r0]
_08001CEA:
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	strh r3, [r0]
	ldr r0, _08001D68 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001D6C @ =gOamBuffer
	mov ip, r1
	str r1, [r0, #4]
	ldr r2, _08001D70 @ =0x81000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08001D74 @ =gUnknown_03004D50
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001D60: .4byte gUnknown_030022AC
_08001D64: .4byte gUnknown_030022C0
_08001D68: .4byte 0x040000D4
_08001D6C: .4byte gOamBuffer
_08001D70: .4byte 0x81000080
_08001D74: .4byte gUnknown_03004D50

	.syntax divided
