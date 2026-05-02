.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0804F27C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	adds r1, #0x14
	adds r1, r0, r1
	str r1, [sp]
	ldr r2, _0804F280 @ =0x03000044
	adds r2, r0, r2
	str r2, [sp, #4]
	ldr r3, [r7]
	str r3, [sp, #8]
	ldr r4, [r7, #4]
	str r4, [sp, #0xc]
	movs r3, #0xff
	ldrb r6, [r7, #0x12]
	mov r8, r6
	movs r1, #0x10
	ldrsh r0, [r7, r1]
	cmp r0, #0x18
	ble _0804F2B6
	ldr r4, _0804F284 @ =gPlayer
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	subs r6, r0, r1
	movs r0, #8
	ldrsh r4, [r7, r0]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	ldr r5, _0804F288 @ =gSineTable
	mov r0, r8
	ands r0, r3
	lsls r3, r0, #2
	mov sb, r3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r3, [sp, #8]
	subs r0, r2, r3
	cmp r0, #0
	bge _0804F242
	rsbs r0, r0, #0
_0804F242:
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	adds r1, r4, r0
	cmp r1, #0
	bge _0804F260
	rsbs r1, r1, #0
_0804F260:
	adds r0, r2, #0
	bl __divsi3
	adds r1, r0, #0
	ldr r2, _0804F28C @ =0xFFFFF800
	adds r0, r6, r2
	cmp r1, r0
	bge _0804F298
	cmp r4, #0
	ble _0804F290
	movs r3, #3
	add r8, r3
	b _0804F2AC
	.align 2, 0
_0804F27C: .4byte gCurTask
_0804F280: .4byte 0x03000044
_0804F284: .4byte gPlayer
_0804F288: .4byte gSineTable
_0804F28C: .4byte 0xFFFFF800
_0804F290:
	movs r4, #3
	rsbs r4, r4, #0
	add r8, r4
	b _0804F2AC
_0804F298:
	cmp r1, r6
	ble _0804F2AC
	cmp r4, #0
	ble _0804F2A8
	movs r6, #3
	rsbs r6, r6, #0
	add r8, r6
	b _0804F2AC
_0804F2A8:
	movs r0, #3
	add r8, r0
_0804F2AC:
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	strh r1, [r7, #0x12]
_0804F2B6:
	movs r2, #8
	ldrsh r0, [r7, r2]
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	movs r4, #0xa
	ldrsh r0, [r7, r4]
	ldr r6, [sp, #0xc]
	adds r6, r6, r0
	str r6, [sp, #0xc]
	movs r1, #0x10
	ldrsh r0, [r7, r1]
	cmp r0, #0x10
	ble _0804F310
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	ldr r3, _0804F350 @ =gSineTable
	movs r1, #0xff
	mov r4, r8
	ands r1, r4
	lsls r0, r1, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	ldrh r2, [r7, #8]
	adds r0, r0, r2
	strh r0, [r7, #8]
	movs r4, #0xc
	ldrsh r2, [r7, r4]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	ldrh r6, [r7, #0xa]
	adds r0, r0, r6
	strh r0, [r7, #0xa]
_0804F310:
	ldr r0, [sp, #8]
	str r0, [r7]
	ldr r1, [sp, #0xc]
	str r1, [r7, #4]
	asrs r5, r0, #8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	asrs r4, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r0, [sp]
	mov r1, sl
	mov r2, sb
	ldr r3, _0804F354 @ =gPlayer
	bl sub_800BF10
	adds r6, r0, #0
	ldr r0, _0804F358 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0804F360
	ldr r3, _0804F35C @ =gPartner
	ldr r0, [sp]
	mov r1, sl
	mov r2, sb
	bl sub_800BF10
	b _0804F362
	.align 2, 0
_0804F350: .4byte gSineTable
_0804F354: .4byte gPlayer
_0804F358: .4byte gNumSingleplayerCharacters
_0804F35C: .4byte gPartner
_0804F360:
	movs r0, #0
_0804F362:
	orrs r6, r0
	cmp r6, #0
	beq _0804F3A8
	movs r3, #0xa8
	lsls r3, r3, #5
	ldr r2, _0804F3A4 @ =gSineTable
	movs r1, #0xff
	mov r4, r8
	ands r1, r4
	lsls r0, r1, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldr r4, [sp, #8]
	adds r0, r4, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r1, r3, r1
	asrs r1, r1, #8
	ldr r6, [sp, #0xc]
	adds r1, r6, r1
	bl sub_8017540
	b _0804F41E
	.align 2, 0
_0804F3A4: .4byte gSineTable
_0804F3A8:
	ldr r1, _0804F428 @ =gCamera
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r5, r5, r0
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r4, r4, r0
	ldr r3, _0804F42C @ =gPseudoRandom
	ldr r1, [r3]
	ldr r0, _0804F430 @ =0x00196225
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r6, _0804F434 @ =0x3C6EF35F
	adds r2, r2, r6
	str r2, [r3]
	ldr r0, _0804F438 @ =0x000003FF
	mov sb, r0
	ands r2, r0
	ldr r1, _0804F43C @ =0xFFFFE600
	adds r2, r2, r1
	ldr r3, _0804F440 @ =gSineTable
	movs r1, #0xff
	mov r6, r8
	ands r1, r6
	lsls r0, r1, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	ldr r6, [sp, #8]
	adds r0, r6, r0
	asrs r0, r0, #8
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r1, r2, r1
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	asrs r1, r1, #8
	bl CreateBrakingDustEffect
	adds r1, r5, #0
	adds r1, #0x20
	ldr r0, _0804F444 @ =0x0000012F
	cmp r1, r0
	bhi _0804F41E
	adds r1, r4, #0
	adds r1, #0x40
	subs r0, #0x10
	cmp r1, r0
	bls _0804F44C
_0804F41E:
	ldr r0, _0804F448 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0804F4A6
	.align 2, 0
_0804F428: .4byte gCamera
_0804F42C: .4byte gPseudoRandom
_0804F430: .4byte 0x00196225
_0804F434: .4byte 0x3C6EF35F
_0804F438: .4byte 0x000003FF
_0804F43C: .4byte 0xFFFFE600
_0804F440: .4byte gSineTable
_0804F444: .4byte 0x0000012F
_0804F448: .4byte gCurTask
_0804F44C:
	ldrh r0, [r7, #0x10]
	adds r0, #1
	strh r0, [r7, #0x10]
	ldr r3, [sp, #4]
	strh r5, [r3, #6]
	strh r4, [r3, #8]
	mov r1, r8
	movs r4, #2
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bge _0804F464
	adds r1, #0x80
_0804F464:
	adds r0, r1, #0
	adds r0, #0x80
	lsls r0, r0, #2
	mov r6, sb
	ands r0, r6
	ldr r1, [sp, #4]
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r2, [sp]
	str r0, [r2, #0x10]
	ldr r2, _0804F4B8 @ =gOamMatrixIndex
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [sp]
	ldr r0, [r3, #0x10]
	orrs r0, r1
	str r0, [r3, #0x10]
	ldr r0, [sp]
	bl UpdateSpriteAnimation
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl TransformSprite
	ldr r0, [sp]
	bl DisplaySprite
_0804F4A6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F4B8: .4byte gOamMatrixIndex

.syntax divided
