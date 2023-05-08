.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 00
	thumb_func_start initSprite_Interactable_SkyCanyon_SmallPropeller
initSprite_Interactable_SkyCanyon_SmallPropeller: @ 0x0807D2F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0         @ r7 = me
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #4]        @ sp04 = spriteRegionX
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0              @ r8 = spriteRegionY
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1              @ sb = spriteY
	ldr r0, _0807D430 @ =Task_Interactable_SkyCanyon_SmallPropeller
	ldr r2, _0807D434 @ =0x00002010
	ldr r1, _0807D438 @ =TaskDestructor_Interactable_SkyCanyon_SmallPropeller
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]       @ r4 = t
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2         @ r2 = prop
	ldr r3, _0807D43C @ =IWRAM_START + 0x44
	adds r0, r4, r3
	movs r5, #0
	mov sl, r5          @ sl = 0
	mov r6, sp
	ldrh r6, [r6, #0x28]    @ r6 = kind
	strh r6, [r0]
	ldr r0, _0807D440 @ =IWRAM_START + 0x52
	adds r1, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	ldr r3, [sp, #4]
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r5, r8
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r6, _0807D444 @ =IWRAM_START + 0x48
	adds r3, r4, r6
	strh r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r5, _0807D448 @ =IWRAM_START + 0x4A
	adds r1, r4, r5
	strh r0, [r1]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r6, [r3]
	adds r0, r0, r6
	ldr r6, _0807D44C @ =IWRAM_START + 0x4C
	adds r5, r4, r6
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r6, #2
	adds r1, r4, r6
	strh r0, [r1]
	ldrh r0, [r5]
	ldrh r1, [r3]
	subs r0, r0, r1
	ldr r3, _0807D450 @ =IWRAM_START + 0x50
	adds r1, r4, r3
	strh r0, [r1]
	mov r5, sp
	ldrh r5, [r5, #4]
	strh r5, [r2, #4]
	mov r6, r8
	strh r6, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, sb
	strb r0, [r2, #9]

	ldr r1, _0807D454 @ =IWRAM_START + 0xC
	adds r5, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	mov r3, sl
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r6, _0807D458 @ =IWRAM_START + 0x2D
	adds r1, r4, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807D45C @ =IWRAM_START + 0x2E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807D460 @ =IWRAM_START + 0x31
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807D464 @ =0x0000024F
	strh r0, [r5, #0xa]
	subs r6, #1
	adds r4, r4, r6
	movs r0, #2
	strb r0, [r4]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0807D40E
	cmp r0, #2
	bne _0807D418
_0807D40E:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807D418:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D430: .4byte Task_Interactable_SkyCanyon_SmallPropeller
_0807D434: .4byte 0x00002010
_0807D438: .4byte TaskDestructor_Interactable_SkyCanyon_SmallPropeller
_0807D43C: .4byte IWRAM_START + 0x44
_0807D440: .4byte IWRAM_START + 0x52
_0807D444: .4byte IWRAM_START + 0x48
_0807D448: .4byte IWRAM_START + 0x4A
_0807D44C: .4byte IWRAM_START + 0x4C
_0807D450: .4byte IWRAM_START + 0x50
_0807D454: .4byte IWRAM_START + 0xC
_0807D458: .4byte IWRAM_START + 0x2D
_0807D45C: .4byte IWRAM_START + 0x2E
_0807D460: .4byte IWRAM_START + 0x31
_0807D464: .4byte 0x0000024F
.endif
