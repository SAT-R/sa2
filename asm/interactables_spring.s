.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 1

	thumb_func_start initSprite_Interactable_Spring
initSprite_Interactable_Spring: @ 0x0800E19C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r1              @ sb = inEntity
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x18
	str r0, [sp, #8]        @ sp+8 = (dirType << 24)
	lsrs r0, r0, #0x18
	str r0, [sp, #4]        @ sp+4 = dirType
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ R4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10      @ R5 = spriteRegionY
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18      @ R6 = spriteY
	movs r1, #0
	mov sl, r1              @ springKind = 0
	ldr r0, _0800E290 @ =Task_Interactable_Spring
	ldr r2, _0800E294 @ =0x00002010
	ldr r1, _0800E298 @ =TaskDestructor_Interactable_Spring
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0              @ R8 = spring
	ldr r0, _0800E29C @ =IWRAM_START + 0xC
	adds r7, r2, r0         @ R7 = main
	movs r3, #0
	mov r1, r8
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	ldr r0, _0800E2A0 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800E2A4 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0800E2A8 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	strb r3, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r0, _0800E2AC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E256
	movs r2, #1
	mov sl, r2
_0800E256:
	cmp r0, #5
	bne _0800E25E
	movs r0, #2
	mov sl, r0
_0800E25E:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10      @ R2 = (s16)springKind
	adds r5, r0, #0         @ R5 = ((s16)springKind << 16)
	cmp r2, #1
	bne _0800E272
	ldr r1, [sp, #8]
	lsrs r0, r1, #0x19
	cmp r0, #0
	beq _0800E2B4
_0800E272:
	ldr r1, _0800E2B0 @ =gUnknown_080D52E0
	ldr r0, [sp, #4]
	lsls r4, r0, #3     
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	b _0800E2BC
	.align 2, 0
_0800E290: .4byte Task_Interactable_Spring
_0800E294: .4byte 0x00002010
_0800E298: .4byte TaskDestructor_Interactable_Spring
_0800E29C: .4byte IWRAM_START + 0xC
_0800E2A0: .4byte IWRAM_START + 0x2D
_0800E2A4: .4byte IWRAM_START + 0x2E
_0800E2A8: .4byte IWRAM_START + 0x31
_0800E2AC: .4byte gCurrentLevel
_0800E2B0: .4byte gUnknown_080D52E0
_0800E2B4:
	ldr r0, _0800E314 @ =0x06012980
	str r0, [r7, #4]
	ldr r1, [sp, #4]
	lsls r4, r1, #3
_0800E2BC:
	ldr r3, _0800E318 @ =gUnknown_080D52E0
	asrs r0, r5, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r2, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r3, #6
	adds r1, r1, r3
	ldrh r1, [r1]
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	mov r0, r8
	adds r0, #0x3c
	mov r2, sp
	ldrb r2, [r2, #4]
	strb r2, [r0]
	mov r0, sb
	ldrb r1, [r0, #3]
	movs r0, #3
	ands r0, r1
	mov r1, r8
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E314: .4byte 0x06012980
_0800E318: .4byte gUnknown_080D52E0

.endif
