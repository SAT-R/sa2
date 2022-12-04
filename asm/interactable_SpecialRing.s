.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_SpecialRing
initSprite_Interactable_SpecialRing: @ 0x08080F28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _08080FE8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08080FDA
	ldr r0, _08080FEC @ =Task_Interactable_SpecialRing
	ldr r2, _08080FF0 @ =0x00004040
	ldr r1, _08080FF4 @ =TaskDestructor_Interactable_SpecialRing
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #0
	mov sb, r0
	movs r1, #0
	strh r6, [r2, #4]
	strh r4, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r0, _08080FF8 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _08080FFC @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08081000 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08081004 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08081008 @ =0x000002DA
	strh r0, [r4, #0xa]
	ldr r0, _0808100C @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	mov r1, sb
	strb r1, [r5]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
_08080FDA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080FE8: .4byte gGameMode
_08080FEC: .4byte Task_Interactable_SpecialRing
_08080FF0: .4byte 0x00004040
_08080FF4: .4byte TaskDestructor_Interactable_SpecialRing
_08080FF8: .4byte IWRAM_START + 0xC
_08080FFC: .4byte IWRAM_START + 0x2D
_08081000: .4byte IWRAM_START + 0x2E
_08081004: .4byte IWRAM_START + 0x31
_08081008: .4byte 0x000002DA
_0808100C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8081010
sub_8081010: @ 0x08081010
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08081040 @ =gUnknown_030056A4
	ldr r5, [r0]
	ldr r3, _08081044 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0808107C
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	bl sub_800DF38
	adds r3, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r3, r0
	cmp r3, #0
	beq _08081048
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081040: .4byte gUnknown_030056A4
_08081044: .4byte gPlayer
_08081048:
	ldr r1, [r5]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r4, #0x3c]
	subs r1, r1, r0
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	adds r0, #0x20
	ldr r2, [r4, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _0808107C
	cmp r0, #0x20
	bhi _0808107C
	ldr r0, _08081078 @ =gCurTask
	ldr r0, [r0]
	strb r3, [r0, #0x15]
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081078: .4byte gCurTask
_0808107C:
	movs r0, #0
_0808107E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_SpecialRing
Task_Interactable_SpecialRing: @ 0x08081084
	push {r4, lr}
	ldr r0, _080810C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _080810C4 @ =gPlayer
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080810AC
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	bl sub_80122DC
_080810AC:
	adds r0, r4, #0
	bl sub_8081010
	cmp r0, #0
	beq _080810C8
	adds r0, r4, #0
	bl sub_80810FC
	b _080810E2
	.align 2, 0
_080810C0: .4byte gCurTask
_080810C4: .4byte gPlayer
_080810C8:
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080810DC
	adds r0, r4, #0
	movs r1, #1
	bl sub_80811A0
	b _080810E2
_080810DC:
	adds r0, r4, #0
	bl sub_8081134
_080810E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable_SpecialRing
TaskDestructor_Interactable_SpecialRing: @ 0x080810E8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80810FC
sub_80810FC: @ 0x080810FC
	push {lr}
	ldr r2, _08081124 @ =gUnknown_030054F4
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	ldr r1, _08081128 @ =0x000002DA
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x95
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0808112C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08081130 @ =sub_80811BC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081124: .4byte gUnknown_030054F4
_08081128: .4byte 0x000002DA
_0808112C: .4byte gCurTask
_08081130: .4byte sub_80811BC

	thumb_func_start sub_8081134
sub_8081134: @ 0x08081134
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r1, [r0, #0x3c]
	ldr r3, _08081160 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081160: .4byte gCamera

	thumb_func_start sub_8081164
sub_8081164: @ 0x08081164
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08081194 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _0808118E
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08081198
_0808118E:
	movs r0, #1
	b _0808119A
	.align 2, 0
_08081194: .4byte gCamera
_08081198:
	movs r0, #0
_0808119A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80811A0
sub_80811A0: @ 0x080811A0
	push {lr}
	cmp r1, #0
	beq _080811AC
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
_080811AC:
	ldr r0, _080811B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080811B8: .4byte gCurTask

	thumb_func_start sub_80811BC
sub_80811BC: @ 0x080811BC
	push {r4, lr}
	ldr r0, _080811F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080811E4
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080811F4
_080811E4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80811A0
	b _080811FA
	.align 2, 0
_080811F0: .4byte gCurTask
_080811F4:
	adds r0, r4, #0
	bl sub_8081134
_080811FA:
	pop {r4}
	pop {r0}
	bx r0
