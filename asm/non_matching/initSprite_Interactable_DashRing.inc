.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0              @ sb = ia
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ r4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10      @ r5 = spriteRegionY
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0              @ r8 = spriteY
	movs r0, #0
	str r0, [sp, #8]        @ sp08 = 0
	ldr r0, _08074898 @ =Task_Interactable_DashRing
	ldr r2, _0807489C @ =0x00002010
	ldr r1, _080748A0 @ =TaskDestructor_Interactable_DashRing
	str r1, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]       @ r6 = task->strcOffset
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r6, r0         @ r7 = ring
	mov r1, sb              @ r1 = ia
	movs r0, #3
	ldrsb r0, [r1, r0]
	ldr r2, _080748A4 @ =IWRAM_START + 0x6C
	adds r2, r2, r6
	mov sl, r2          @ sl = ring->orientation
	movs r3, #0         @ r3 = 0
	strh r0, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r7, #0x70]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r7, #0x74]
	ldrb r1, [r1]
	ldr r4, _080748A8 @ =IWRAM_START + 0x7C
	adds r0, r6, r4
	strb r1, [r0]
	ldr r1, _080748AC @ =IWRAM_START + 0x7D
	adds r0, r6, r1
	mov r2, r8
	strb r2, [r0]
	mov r4, sb
	str r4, [r7, #0x78]

	ldr r0, _080748B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #5
	bne _080746B2
	movs r0, #1
	str r0, [sp, #8]
_080746B2:
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r2, _080748B4 @ =IWRAM_START + 0x21
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r4, _080748B8 @ =IWRAM_START + 0x22
	adds r0, r6, r4
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #4
	adds r0, r6, r2
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]

	ldr r2, _080748BC @ =sAnimationInfoDashRing
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3     @r0 = r1*0xC*2
	ldr r1, [sp, #8]
	lsls r5, r1, #1
	adds r5, r5, r1
	lsls r5, r5, #6
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]

	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _080748C0 @ =IWRAM_START + 0x20
	adds r0, r6, r4
	strb r1, [r0]

	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl VramMalloc
	str r0, [r7, #4]

	mov r4, sl          @ r4 = orientation
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [sp, #0xc]
	adds r1, r2, #6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]

	ldr r0, _080748C4 @ =IWRAM_START + 0x30
	adds r4, r6, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]

	ldr r3, [sp, #0x10]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]

	ldr r3, _080748C8 @ =IWRAM_START + 0x51
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]

	ldr r1, _080748CC @ =IWRAM_START + 0x52
	adds r0, r6, r1
	movs r3, #0x10
	strb r3, [r0]

	adds r1, #3
	adds r0, r6, r1
	movs r3, #0
	strb r3, [r0]

	mov r0, r8
	str r0, [r4, #0x28]

	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r4, #0x10]

	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0xa]

	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0xe
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _080748D0 @ =IWRAM_START + 0x50
	adds r0, r6, r3
	strb r1, [r0]

	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	adds r1, r2, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #0xc]
	bl VramMalloc
	str r0, [r4, #4]

	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [sp, #0xc]
	adds r1, r2, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r4, #0x10]
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r7, #0
	bl sub_8074C20
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r1, sb          @ sb = ia
	strb r0, [r1]

	ldr r2, _080748D4 @ =sUnknown_080DFB90
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r4, _080748D8 @ =IWRAM_START + 0x60
	adds r0, r6, r4
	strh r1, [r0]
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _080748DC @ =IWRAM_START + 0x62
	adds r0, r6, r3
	strh r1, [r0]
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r6, r3
	strh r1, [r0]
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _080748E0 @ =IWRAM_START + 0x66
	adds r0, r6, r4
	strh r1, [r0]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r3, #4
	adds r0, r6, r3
	strh r1, [r0]
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0xa
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _080748E4 @ =IWRAM_START + 0x6A
	adds r0, r6, r2
	strh r1, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074898: .4byte Task_Interactable_DashRing
_0807489C: .4byte 0x00002010
_080748A0: .4byte TaskDestructor_Interactable_DashRing
_080748A4: .4byte IWRAM_START + 0x6C
_080748A8: .4byte IWRAM_START + 0x7C
_080748AC: .4byte IWRAM_START + 0x7D
_080748B0: .4byte gCurrentLevel
_080748B4: .4byte IWRAM_START + 0x21
_080748B8: .4byte IWRAM_START + 0x22
_080748BC: .4byte sAnimationInfoDashRing
_080748C0: .4byte IWRAM_START + 0x20
_080748C4: .4byte IWRAM_START + 0x30
_080748C8: .4byte IWRAM_START + 0x51
_080748CC: .4byte IWRAM_START + 0x52
_080748D0: .4byte IWRAM_START + 0x50
_080748D4: .4byte sUnknown_080DFB90
_080748D8: .4byte IWRAM_START + 0x60
_080748DC: .4byte IWRAM_START + 0x62
_080748E0: .4byte IWRAM_START + 0x66
_080748E4: .4byte IWRAM_START + 0x6A

.syntax divided
