.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl sub_8050030
	ldr r0, [r4, #0x30]
	ldr r6, _0804E504 @ =0x00000FFF
	adds r1, r0, #0
	ands r1, r6
	adds r3, r1, #0
	adds r5, r3, #0         @ r5 = r3 = unk48->unk30 & 0xFFF
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #4
	bne _0804E50C
	str r1, [r4, #0x30]
	ldr r1, _0804E508 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	b sub_804E4CC__return
	.align 2, 0
_0804E504: .4byte 0x00000FFF
_0804E508: .4byte gUnknown_080D8D6C
_0804E50C:
	cmp r0, #3
	bne _0804E5B0
	ldr r2, _0804E598 @ =_0804E50C
	ldrh r1, [r2]
	ldr r0, _0804E59C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	adds r6, r3, #0         @ r6 = r3 = r5
	movs r5, #0
	adds r4, #0x4c
	mov r8, r4
	ldr r0, _0804E5A0 @ =sRGB_080D8E20
	mov ip, r0
	movs r7, #0x1f          @ r7 = 0x1F
	movs r1, #0x92
	add r1, ip
	mov sl, r1              @ sl = r1 = sRGB_080D8E20[i][]
	ldr r2, _0804E5A4 @ =gObjPalette
	mov sb, r2
_0804E532:
	lsls r4, r5, #1
	adds r1, r4, r5         @ r1 = i * 3
	mov r0, ip
	adds r0, #0x90
	adds r0, r1, r0
	ldrb r3, [r0]           @ r3 = sRGB_080D8E20[i]
	muls r3, r6, r3
	asrs r3, r3, #0xc
	ands r3, r7
	mov r0, ip
	adds r0, #0x91
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #0xc
	ands r2, r7
	add r1, sl
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	ands r0, r7
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	ldr r3, _0804E5A8 @ =gBgPalette
	adds r4, r4, r3
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E532
	ldr r1, _0804E5AC @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	ldr r2, _0804E5AC @ =gFlags
	str r0, [r2]
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
	b sub_804E4CC__return
	.align 2, 0
_0804E598: .4byte gDispCnt
_0804E59C: .4byte 0x0000FDFF
_0804E5A0: .4byte sRGB_080D8E20
_0804E5A4: .4byte gObjPalette
_0804E5A8: .4byte gBgPalette
_0804E5AC: .4byte gFlags
_0804E5B0:
	cmp r2, #2
	bne sub_804E4CC__return
	movs r0, #0xe0
	lsls r0, r0, #4
	cmp r5, r0
	bls sub_804E4CC__return
__0804E5BC:
	ldr r2, _0804E658 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	subs r0, r6, r5         @ r0 = 0xFFF - r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0             @ r2 = i = 0
	ldr r0, _0804E65C @ =sRGB_080D8E20
	mov r8, r0
	movs r4, #0x1f
	ldr r1, _0804E660 @ =gBgPalette
	mov sl, r1
_0804E5DC:
	movs r5, #0             @ r5 = c = 0
	lsls r0, r2, #1
	lsls r1, r2, #4
	adds r3, r2, #1
	mov sb, r3
	adds r0, r0, r2
	lsls r0, r0, #4
	mov ip, r0              @ ip = r0 = i * 0x30
	adds r7, r1, #0
	adds r7, #0x70
_0804E5F0:
	lsls r1, r5, #1
	adds r1, r1, r5
	add r1, ip              @ r1 = ((i * 0x30) + (c * 3))
	mov r2, r8
	adds r0, r1, r2
	ldrb r3, [r0]            @ r3 = sRGB_080D8E20[i][c][0]
	muls r3, r6, r3
	asrs r3, r3, #9
	ands r3, r4             @ r3 = r
	mov r0, r8
	adds r0, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	muls r2, r6, r2
	asrs r2, r2, #9
	ands r2, r4             @ r2 = g
	ldr r0, _0804E664 @ =sRGB_080D8E20+0x2
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #9
	ands r0, r4             @ r0 = b
	adds r1, r5, r7
	lsls r1, r1, #1
	add r1, sl
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804E5F0
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _0804E5DC
	ldr r2, _0804E668 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
sub_804E4CC__return:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E658: .4byte gDispCnt
_0804E65C: .4byte sRGB_080D8E20
_0804E660: .4byte gBgPalette
_0804E664: .4byte sRGB_080D8E20+0x2
_0804E668: .4byte gFlags

.syntax divided
