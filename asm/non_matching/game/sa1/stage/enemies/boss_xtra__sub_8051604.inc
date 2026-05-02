.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080517AC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7, #8]
	mov sl, r0
	ldr r0, _080517B0 @ =gExtraBossTaskData
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _080517B4 @ =0x03000018
	adds r1, r1, r4
	mov sb, r1
	ldr r2, _080517B8 @ =0x0300000C
	adds r2, r2, r4
	mov r8, r2
	ldr r5, _080517BC @ =gSineTable
	mov ip, r5
	mov r5, sl
	adds r5, #0x70
	ldrh r1, [r5]
	lsrs r1, r1, #6
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r2, [r7, #0x68]
	adds r3, r2, #0
	muls r3, r0, r3
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [r7, #0x6c]
	muls r0, r1, r0
	subs r3, r3, r0
	asrs r3, r3, #8
	str r3, [r7, #0x60]
	ldrh r1, [r5]
	ldr r0, _080517C0 @ =0x000003FF
	mov r6, sp
	strh r0, [r6, #4]
	lsrs r1, r1, #6
	lsls r0, r1, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r2, r0, r2
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [r7, #0x6c]
	muls r0, r1, r0
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [r7, #0x64]
	mov r6, sl
	ldr r0, [r6, #0x50]
	adds r3, r3, r0
	str r3, [r7, #0x50]
	ldr r0, [r6, #0x54]
	adds r2, r2, r0
	str r2, [r7, #0x54]
	ldr r0, _080517C4 @ =0x03000076
	adds r1, r4, r0
	ldrh r0, [r5]
	ldrh r1, [r1]
	adds r2, r0, r1
	ldr r1, _080517C8 @ =0x03000070
	adds r4, r4, r1
	strh r2, [r4]
	ldr r0, [r7, #0x50]
	asrs r3, r0, #8
	ldr r4, _080517CC @ =gCamera
	movs r5, #0
	ldrsh r0, [r4, r5]
	subs r0, r3, r0
	str r0, [sp, #8]
	ldr r0, [r7, #0x54]
	asrs r4, r0, #8
	ldr r6, _080517CC @ =gCamera
	movs r1, #2
	ldrsh r0, [r6, r1]
	subs r5, r4, r0
	ldr r6, _080517D0 @ =gPlayer
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0805173E
	ldr r6, [sp]
	ldr r0, [r6, #0x58]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805173E
	ldr r0, _080517D4 @ =0xFFFFC000
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x16
	mov r1, sp
	ldrh r1, [r1, #4]
	ands r2, r1
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	subs r1, r1, r0
	lsls r1, r1, #8
	rsbs r1, r1, #0
	asrs r1, r1, #0x10
	adds r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #1
	add r2, ip
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	subs r2, r2, r0
	lsls r2, r2, #8
	rsbs r2, r2, #0
	asrs r2, r2, #0x10
	adds r2, r4, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	ldr r3, _080517D0 @ =gPlayer
	bl sub_800BFEC
_0805173E:
	mov r0, sp
	ldrh r1, [r0, #8]
	mov r0, r8
	strh r1, [r0, #6]
	strh r5, [r0, #8]
	adds r0, r7, #0
	adds r0, #0x70
	ldrh r0, [r0]
	ldr r2, _080517D4 @ =0xFFFFC000
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x16
	mov r4, r8
	strh r0, [r4]
	mov r5, sb
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r2, _080517D8 @ =gOamMatrixIndex
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	mov r1, r8
	bl TransformSprite
	mov r0, sb
	bl DisplaySprite
	ldr r0, [sp]
	adds r0, #0x6e
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	bls _080517A2
	b _080518CA
_080517A2:
	lsls r0, r0, #2
	ldr r1, _080517DC @ =_080517E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080517AC: .4byte gCurTask
_080517B0: .4byte gExtraBossTaskData
_080517B4: .4byte 0x03000018
_080517B8: .4byte 0x0300000C
_080517BC: .4byte gSineTable
_080517C0: .4byte 0x000003FF
_080517C4: .4byte 0x03000076
_080517C8: .4byte 0x03000070
_080517CC: .4byte gCamera
_080517D0: .4byte gPlayer
_080517D4: .4byte 0xFFFFC000
_080517D8: .4byte gOamMatrixIndex
_080517DC: .4byte _080517E0
_080517E0: @ jump table
	.4byte _08051814 @ case 0
	.4byte _0805181E @ case 1
	.4byte _080518CA @ case 2
	.4byte _080518CA @ case 3
	.4byte _080518CA @ case 4
	.4byte _080518CA @ case 5
	.4byte _08051828 @ case 6
	.4byte _08051842 @ case 7
	.4byte _080518CA @ case 8
	.4byte _080518CA @ case 9
	.4byte _080518CA @ case 10
	.4byte _080518A8 @ case 11
	.4byte _080518BA @ case 12
_08051814:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #7
	b _08051838
_0805181E:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #2
	b _080518C2
_08051828:
	adds r0, r7, #0
	adds r0, #0x76
	mov r1, sl
	adds r1, #0x70
	ldrh r1, [r1]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
_08051838:
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	b _080518D8
_08051842:
	adds r0, r7, #0
	adds r0, #0x76
	mov r1, sl
	adds r1, #0x70
	ldrh r1, [r1]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	ldr r0, _08051898 @ =gStageTime
	ldr r0, [r0]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080518D8
	ldr r3, [r7, #0x50]
	ldr r0, [r7, #0x54]
	movs r6, #0xb8
	lsls r6, r6, #5
	adds r4, r0, r6
	ldr r2, _0805189C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080518A0 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080518A4 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r2, #0
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	bne _0805188C
	movs r2, #1
_0805188C:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_804A8A8
	b _080518D8
	.align 2, 0
_08051898: .4byte gStageTime
_0805189C: .4byte gPseudoRandom
_080518A0: .4byte 0x00196225
_080518A4: .4byte 0x3C6EF35F
_080518A8:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xb0
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_804CFE0
	b _080518D8
_080518BA:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
_080518C2:
	movs r1, #0
	bl sub_804CFE0
	b _080518D8
_080518CA:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
_080518D8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
