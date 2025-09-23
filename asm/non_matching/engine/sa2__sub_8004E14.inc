.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp, #0x24]     @ sp24 = s
	adds r6, r1, #0         @ r6 = transform
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08004E30
	b _080051D8
_08004E30:
	mov sb, r1              @ sb = sprDims
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]           @ us->affineIndex = s->unk10 & SPRITE_FLAG_MASK_ROT_SCALE;
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _08005128 @ =gOamBuffer + 0x6
	adds r4, r4, r0         @ r4 = u16 *affine = &gOamBuffer[us->affineIndex * 4 + 3];
	subs r2, #0x18
	str r2, [sp, #0x28]     @ sp28 = &us->qDirX
	ldrh r0, [r6]
	ldr r3, _0800512C @ =gUnknown_03001944
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r2, _08005130 @ =0x000003FF
	ands r0, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _08005134 @ =gSineTable
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [sp, #0x28]
	strh r0, [r1]           @ us.qDirX = COS_24_8((transform->rotation + gUnknown_03001944) & ONE_CYCLE);
	movs r3, #0xa
	add r3, sp
	mov r8, r3              @ r8 = r3 = &us.qDirY
	ldrh r0, [r6]           @ r0 = transform->rotation
	ldr r5, _0800512C @ =gUnknown_03001944
	ldrh r1, [r5]
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r3]           @ us.qDirY = SIN_24_8((transform->rotation + gUnknown_03001944) & ONE_CYCLE);
	add r7, sp, #0xc        @ r7 = us->unkC[0]
	movs r0, #2
	ldrsh r1, [r6, r0]      @ r1 = transform->width
	ldr r2, _08005138 @ =gUnknown_030017F0
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]           @ us->unkC[0] = ((transform->width * gUnknown_030017F0) >> 8)
	movs r3, #0xe
	add r3, sp
	mov sl, r3
	movs r5, #4
	ldrsh r1, [r6, r5]      @ r1 = transform->height
	ldr r2, _0800513C @ =gUnknown_03005394
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]           @ us->unkC[1] = ((transform->height * gUnknown_03005394) >> 8);
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]           @ r1 = us->unkC[0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8              @ r2 = r8 = &us.qDirY
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sl              @ r3 = &us->unkC[1]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8              @ r2 = r8 = &us.qDirY
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sl              @ r3 = &us->unkC[1]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #2
	ldrsh r0, [r6, r1]      @ r0 = transform->width
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _08004F48
	movs r2, #2
	ldrsh r0, [r6, r2]
	rsbs r0, r0, #0
	ldr r3, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]           @ us->unkC[0] = I(-transform->width * gUnknown_030017F0);
_08004F48:
	movs r4, #4
	ldrsh r0, [r6, r4]
	ldr r5, _0800513C @ =gUnknown_03005394
	ldrh r4, [r5]
	ldrh r2, [r6, #4]
	mov r1, sp
	strh r2, [r1, #0x3c]    @ sp3C = (u16)transform->height
	cmp r0, #0
	bge _08004F6A
	movs r3, #4
	ldrsh r0, [r6, r3]
	rsbs r0, r0, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	mov r4, sl              @ r4 = sl = &us->unkC[1]
	strh r0, [r4]
	ldrh r4, [r5]           @ r4 = gUnknown_03005394
_08004F6A:
	mov r2, sp              @ r2 = &us
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]           @ r1 = us->qDirX
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]           @ us.unk0[0] = I(us->unkC[0] * us->qDirX)
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x30]     @ sp30 = &us.unk0[1]
	mov r2, r8              @ r2 = r8 = &us.qDirY
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0         @ r1 = -us.qDirY
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r3, [sp, #0x30]
	strh r0, [r3]           @ us.unk0[1] = I(-us.qDirY * us->unkC[0])
	mov r5, sp
	adds r5, #4
	str r5, [sp, #0x34]     @ sp34 = &us.unk0[2]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, sl              @ r2 = sl = &us->unkC[1]
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]           @ us.unk0[2] = I(+us.qDirY * us->unkC[1])
	mov r3, sp
	adds r3, #6
	str r3, [sp, #0x38]     @ sp38 = &us.unk0[3]
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]           @ us.unk0[3] = I(+us.qDirX * us.unkC[1]);
	add r0, sp, #0x18
	mov r8, r0              @ r8 = &us.unk18[0][0]
	ldr r1, _0800512C @ =gUnknown_03001944
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r3, _08005134 @ =gSineTable
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r5, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10      @ r2 = (COS_24_8(gUnknown_03001944) * gUnknown_030017F0)
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08005140 @ =gUnknown_03005398
	movs r5, #0
	ldrsh r1, [r3, r5]
	muls r0, r1, r0
	lsls r0, r0, #8         @ r0 = Q(us.unkC[0] * gUnknown_03005398)
	asrs r0, r0, #0x10      @ r0 = (Q(us.unkC[0] * gUnknown_03005398) >> 16)
	muls r0, r2, r0
	asrs r0, r0, #8         @ r0 = I((COS_24_8(gUnknown_03001944) * gUnknown_030017F0) * (Q(us.unkC[0] * gUnknown_03005398) >> 16))
	mov r1, r8
	strh r0, [r1]           @ us.unk18[0][0] = I(r2 * r0)
	movs r2, #0x1a
	add r2, sp
	mov ip, r2              @ ip = us.unk18[0][1]
	ldr r5, _0800512C @ =gUnknown_03001944
	ldrh r0, [r5]
	lsls r0, r0, #1
	ldr r1, _08005134 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #6         @ r0 = (SIN(-gUnknown_03001944) >> 6)
	ldr r5, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]           @ us.unk18[0][1] =
	add r5, sp, #0x1c
	ldr r2, _0800512C @ =gUnknown_03001944
	ldrh r0, [r2]
	lsls r0, r0, #1
	ldr r7, _08005134 @ =gSineTable
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r0, #0         @ r2 = SIN_24_8(gUnknown_03001944)
	muls r2, r4, r2         @ r2 *= gUnknown_03005394
	lsls r2, r2, #8         @ r2 = Q(+SIN_24_8(gUnknown_03001944) * gUnknown_03005394)
	asrs r2, r2, #0x10
	mov r1, sl              @ r1 = sl = &us->unkC[1]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r3, r4]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r5]           @ us.unk18[1][0] =
	mov r4, sp
	adds r4, #0x1e
	ldr r7, _0800512C @ =gUnknown_03001944
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08005134 @ =gSineTable
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, _0800513C @ =gUnknown_03005394
	ldrh r1, [r7]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r1, sl              @ r1 = sl = &us->unkC[1]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r4]           @ us.unk18[1][1] =
	mov r1, r8              @ r1 = r8 = &us.unk18[0][0]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #6
	ldrsh r1, [r6, r2]      @ r1 = transform.x
	muls r1, r0, r1         @ r1 = transform.x * us.unk18[0][0]
	mov r3, ip
	ldrh r0, [r3]           @ r0 = us.unk18[0][1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #8
	ldrsh r2, [r6, r7]      @ r2 = transform.y
	muls r0, r2, r0         @ r0 = transform.y * us.unk18[0][1]
	adds r1, r1, r0         @ r1 = r1 + r0
	ldr r0, _08005144 @ =gUnknown_0300194C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	adds r1, r1, r0         @ r1 += Q(gUnknown_0300194C)
	asrs r1, r1, #8         @ r1 = I(r1)
	str r1, [sp, #0x10]     @ us.posX = I(transform.x * us.unk18[0][0] + transform.y * us.unk18[0][1] + Q(gUnknown_0300194C))
	ldrh r0, [r5]           @ r0 = us.unk18[1][0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #6
	ldrsh r1, [r6, r3]
	muls r1, r0, r1         @ r1 = transform.x * us.unk18[1][0]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10      @ r0 = us.unk18[1][1]
	movs r4, #8
	ldrsh r2, [r6, r4]      @ r2 = transform.y
	muls r0, r2, r0         @ r0 = transform.y * us.unk18[1][1]
	adds r1, r1, r0         @ r1 = r1 + r0
	ldr r0, _08005148 @ =gUnknown_03002820
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x14]     @ us.posY = I(transform.x * us.unk18[1][0] + transform.y * us.unk18[1][1] + Q(gUnknown_0300194C));
	ldr r6, [sp, #0x30]     @ r6 = &us.unk0[1]
	ldr r7, [sp, #0x34]     @ r7 = &us.unk0[2]
	ldr r0, [sp, #0x38]     @ r0 = &us.unk0[3]
	mov r8, r0              @ r8 = r0
	ldr r1, [sp, #0x2c]      @ r1 = transform->width
	cmp r1, #0
	ble _0800514C
	mov r2, sb              @ r2 = sb = sprDims
	ldrh r4, [r2, #8]       @ r4 = offsetX
	ldrh r2, [r2, #4]       @ r2 = width
	b _0800515A
	.align 2, 0
_08005128: .4byte gOamBuffer + 0x6
_0800512C: .4byte gUnknown_03001944
_08005130: .4byte 0x000003FF
_08005134: .4byte gSineTable
_08005138: .4byte gUnknown_030017F0
_0800513C: .4byte gUnknown_03005394
_08005140: .4byte gUnknown_03005398
_08005144: .4byte gUnknown_0300194C
_08005148: .4byte gUnknown_03002820
_0800514C:
	mov r3, sb              @ r3 = sb = sprDims
	ldrh r1, [r3, #4]
	ldrh r0, [r3, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10      @ r4 = offsetX
	adds r2, r1, #0         @ r2 = width
_0800515A:
	mov r5, sp
	ldrh r5, [r5, #0x3c]    @ r5 = (u16)transform->height
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _0800516C
	mov r0, sb              @ r0 = sb = sprDims
	ldrh r3, [r0, #0xa]     @ r3 = offsetY = sprDims->offsetY
	ldrh r5, [r0, #6]         @ r5 = height = sprDims->height
	b _0800517A
_0800516C:
	mov r3, sb              @ r3 = sb = sprDims
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10      @ r3 = offsetY = sprDims->height - sprDims->offsetY
	adds r5, r1, #0         @ r5 = height = sprDims->height
_0800517A:
	mov r0, sp              @ r0 = sp = us
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10      @ r0 = us.unk0[0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10      @ r4 = offsetX
	lsrs r2, r2, #1         @ r2 = halfWidth = (width/2)
	subs r4, r4, r2         @ r4 = offsetX -= halfWidth
	adds r1, r0, #0
	muls r1, r4, r1         @ r1 = (offsetX - halfWidth) * us.unk0[0]
	ldrh r0, [r6]           @ r0 = us.unk0[1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1         @ r5 = halfHeight
	subs r3, r3, r5         @ r3 = (offsetY - halfHeight)
	muls r0, r3, r0         @ r0 = (offsetY - halfHeight) * us.unk0[1]
	adds r1, r1, r0         @ r1 += r0
	lsls r2, r2, #8
	adds r1, r1, r2         @ r1 += Q(halfWidth)
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]     @ us.posX -= I(r1)
	ldrh r0, [r7]           @ r0 = us.unk0[2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1         @ r1 = offsetX * us.unk0[2]
	mov r4, r8
	ldrh r0, [r4]           @ r0 = us.unk0[3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0         @ r0 = r3 * us.unk0[3]
	adds r1, r1, r0         @ r1 += r0
	lsls r5, r5, #8
	adds r1, r1, r5         @ r1 += Q(halfHeight)
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]     @ us.posY -= I(r1);
	ldr r0, [sp, #0x10]
	ldr r5, [sp, #0x24]     @ r5 = sprite
	strh r0, [r5, #0x16]    @ sprite.x = us.posX
	ldr r0, [sp, #0x14]
	strh r0, [r5, #0x18]    @ sprite.y = us.posY
_080051D8:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
