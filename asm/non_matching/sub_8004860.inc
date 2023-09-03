.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	adds r6, r1, #0     @ r6 = transform
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800487C
	b _08004AAA
_0800487C:
	mov r8, r1      @ r8 = dimensions
	add r2, sp, #0x20   @ r2 = sp20 = affineIndex
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]   @ r2 = affineIndex
    lsls r4, r4, #5
	ldr r0, _08004A14 @ =gOamBuffer + 0x6
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28] @; sp28 = sp08 = &sp00[4]
	ldr r2, _08004A18 @ =gSineTable
	ldrh r0, [r6]
	ldr r1, _08004A1C @ =0x000003FF
	ands r1, r0     @ r1 = (transform->rotation & ONE_CYCLE)
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, [sp, #0x28]
	strh r0, [r7]   @ sp00.offsetX = *sp28 = COS_24_8(transform->rotation & ONE_CYCLE)
	movs r0, #0xa
	add r0, sp
	mov sl, r0      @ sl = &sp00[5]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r1, sl
	strh r0, [r1]       @ sp00.offsetY = SIN_24_8(transform->rotation & ONE_CYCLE);
	add r7, sp, #0xc
	ldrh r0, [r6, #2]
	strh r0, [r7]
	movs r2, #0xe
	add r2, sp
	mov sb, r2          @ sb = sp00[7]
	ldrh r0, [r6, #4]
	strh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0     @ r5 = 0x10000
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
	adds r0, r5, #0     @ r5 = 0x10000
	bl Div
	mov r2, sl      @ r2 = sl = &sp00.offsetY
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0     @ r5 = 0x10000
	bl Div
	mov r2, sl      @ r2 = sl = &sp00[5]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0     @ r5 = 0x10000
	bl Div
	ldr r2, [sp, #0x28]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	ldrh r0, [r6, #2]
	movs r3, #2
	ldrsh r5, [r6, r3]
	cmp r5, #0
	bge _08004966
	rsbs r0, r0, #0
	strh r0, [r7]
_08004966:
	movs r1, #4
	ldrsh r0, [r6, r1]
	ldrh r2, [r6, #4]
	mov ip, r2      @ ip = transform.height
	cmp r0, #0
	bge _0800497A
	mov r3, ip
	rsbs r0, r3, #0
	mov r1, sb
	strh r0, [r1]
_0800497A:
	mov r2, sp
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]

__08004990:
	mov r4, sp
	adds r4, #2     @ r4 = sp00[1]
	mov r0, sl      @ r0 = sl = &sp00[5]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]   @ sp00[1]

__080049AA:
	add r3, sp, #4  
	mov r2, sl      @ r2 = sl = &sp00[5]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r7, sb      @ r7 = sb = sp00[7]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]

__080049C2:
	mov r2, sp
	adds r2, #6
	ldr r0, [sp, #0x28]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]

	add r0, sp, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]

	adds r0, #2
	movs r1, #0
	strh r1, [r0]

	add r0, sp, #0x1c
	strh r1, [r0]

	adds r0, #2
	movs r7, #0x80
	lsls r7, r7, #1
	strh r7, [r0]

	movs r1, #6
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x10] @ sp10 = transform->x

	movs r7, #8
	ldrsh r0, [r6, r7]
	str r0, [sp, #0x14] @ sp14 = transform->y

	adds r6, r4, #0 @ r6 = sp00[1]
	adds r7, r3, #0     @ r7 = r3 = &sp00[2]
	mov sb, r2      @ sb = &sp00[7]
	cmp r5, #0
	ble _08004A20
	mov r0, r8      @ r0 = r8 = dimensions
	ldrh r4, [r0, #8]
	ldrh r2, [r0, #4]
	b _08004A2E
	.align 2, 0
_08004A14: .4byte gOamBuffer + 0x6
_08004A18: .4byte gSineTable
_08004A1C: .4byte 0x000003FF
_08004A20:
	mov r2, r8      @ r2 = r8 = dimensions
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_08004A2E:
	mov r3, ip
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08004A3E
	mov r0, r8      @ r0 = r8 = dimensions
	ldrh r3, [r0, #0xa]
	ldrh r5, [r0, #6]
	b _08004A4C
_08004A3E:
	mov r3, r8      @ r3 = r8 = dimensions
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_08004A4C:
	mov r0, sp      @ r0 = sp00
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6] @ r0 = *r6 = &sp00[1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]

__080004A7E:
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	mov r7, sb
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x24]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r1, #0x18]
_08004AAA:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
