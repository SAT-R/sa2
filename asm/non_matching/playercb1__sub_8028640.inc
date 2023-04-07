
.syntax unified
.text
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	lsls r2, r2, #0x10
	mov r8, r2
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _080286D8 @ =gPlayer
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _080286DC @ =sub_801F214
	str r2, [sp]
	ldr r2, _080286E0 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov sb, r0
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1     @ r1 = taskStrc
	adds r0, r4, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r1, #0x16]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r1, #0x18]
	ldr r0, _080286E4 @ =IWRAM_START + 0x1C
	adds r6, r2, r0         @ r6 = s
	ldr r5, _080286E8 @ =gUnknown_080D69A6
	mov r1, r8
	lsls r4, r1, #1
	add r4, r8
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	str r2, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r2, [sp, #8]
	ldr r1, _080286EC @ =IWRAM_START + 0x3C
	adds r2, r2, r1
	strb r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080286D8: .4byte gPlayer
_080286DC: .4byte sub_801F214
_080286E0: .4byte sub_801F550
_080286E4: .4byte IWRAM_START + 0x1C
_080286E8: .4byte gUnknown_080D69A6
_080286EC: .4byte IWRAM_START + 0x3C
.syntax divided
