.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08073868 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0          @ r8 = kuraa
	ldr r0, _0807386C @ =0x0300000C
	adds r4, r1, r0     @ r4 = s
	mov r1, r8
	ldr r1, [r1]
	mov ip, r1          @ ip = r1 = me
	mov r5, r8
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0     @ r2 = worldX
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0     @ r1 = worldY
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10  @ r2 = worldX
	lsrs r7, r1, #0x10
	mov sl, r7          @ sl = r7 = worldY
	asrs r6, r1, #0x10
	ldr r0, [r5, #0x3c]
	asrs r0, r0, #8
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r5, _08073870 @ =gCamera
	ldrh r1, [r5]
	lsrs r7, r0, #0x10
	mov sb, r7
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldrh r0, [r5, #2]
	subs r0, r6, r0
	strh r0, [r4, #0x18]
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r1, r7
	cmp r2, r0
	bgt _08073834
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08073834
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r6, r0
	bgt _08073834
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	bge _08073874
_08073834:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08073858
	movs r5, #0x18
	ldrsh r0, [r4, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _08073858
	movs r7, #0x18
	ldrsh r1, [r4, r7]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08073874
_08073858:
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, ip
	strb r0, [r2]
	ldr r0, [r3]
	bl TaskDestroy
	b _08073974
	.align 2, 0
_08073868: .4byte gCurTask
_0807386C: .4byte 0x0300000C
_08073870: .4byte gCamera
_08073874:
	ldr r1, [r4, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08073928
	mov r5, sb
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r5, r0, r7
	ldr r2, _08073984 @ =gPlayer
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _08073988 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	mov sb, r2
	adds r6, r3, #0
	cmp r5, r1
	bgt _080738C2
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r5, r0
	cmp r0, r1
	bge _080738D6
	cmp r5, r1
	blt _08073928
_080738C2:
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r5
	blt _08073928
_080738D6:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r3, r4, #0
	adds r3, #0x2d
	movs r5, #0
	ldrsb r5, [r3, r5]
	adds r1, r0, r5
	mov r2, sb
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	adds r3, r6, #0
	adds r3, #0x39
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r3, r0, r2
	cmp r1, r3
	bgt _08073910
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	bge _08073922
	cmp r1, r3
	blt _08073928
_08073910:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08073928
_08073922:
	mov r0, sb
	bl Coll_DamagePlayer
_08073928:
	mov r1, r8
	adds r1, #0x42
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _08073950
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807398C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08073990 @ =Task_KuraaInit
	str r0, [r1, #8]
_08073950:
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl DisplaySprite
	ldr r0, [r4, #0x10]
	ldr r1, _08073994 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
_08073974:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073984: .4byte gPlayer
_08073988: .4byte gPlayerBodyPSI
_0807398C: .4byte gCurTask
_08073990: .4byte Task_KuraaInit
_08073994: .4byte 0xFFFFFBFF

.syntax divided
