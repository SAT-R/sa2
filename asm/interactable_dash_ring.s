.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_DashRing
initSprite_Interactable_DashRing: @ 0x0807462C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _08074898 @ =Task_Interactable_DashRing
	ldr r2, _0807489C @ =0x00002010
	ldr r1, _080748A0 @ =TaskDestructor_Interactable_DashRing
	str r1, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r6, r0
	mov r1, sb
	movs r0, #3
	ldrsb r0, [r1, r0]
	ldr r2, _080748A4 @ =IWRAM_START + 0x6C
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0
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
	ldr r2, _080748BC @ =gUnknown_080DFA10
	mov r4, sl
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
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
	mov r4, sl
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
	mov r1, sb
	strb r0, [r1]
	ldr r2, _080748D4 @ =gUnknown_080DFB90
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
_080748BC: .4byte gUnknown_080DFA10
_080748C0: .4byte IWRAM_START + 0x20
_080748C4: .4byte IWRAM_START + 0x30
_080748C8: .4byte IWRAM_START + 0x51
_080748CC: .4byte IWRAM_START + 0x52
_080748D0: .4byte IWRAM_START + 0x50
_080748D4: .4byte gUnknown_080DFB90
_080748D8: .4byte IWRAM_START + 0x60
_080748DC: .4byte IWRAM_START + 0x62
_080748E0: .4byte IWRAM_START + 0x66
_080748E4: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_80748E8
sub_80748E8: @ 0x080748E8
	push {lr}
	ldr r2, _0807491C @ =gPlayer
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0x18
	strb r1, [r3]
	ldr r1, [r0, #0x70]
	lsls r1, r1, #8
	str r1, [r2, #8]
	ldr r1, [r0, #0x74]
	lsls r1, r1, #8
	str r1, [r2, #0xc]
	adds r3, #5
	movs r1, #0x10
	strh r1, [r3]
	adds r0, #0x6c
	ldrh r0, [r0]
	cmp r0, #7
	bls _08074910
	b _08074AA6
_08074910:
	lsls r0, r0, #2
	ldr r1, _08074920 @ =_08074924
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807491C: .4byte gPlayer
_08074920: .4byte _08074924
_08074924: @ jump table
	.4byte _08074944 @ case 0
	.4byte _08074968 @ case 1
	.4byte _08074998 @ case 2
	.4byte _080749C4 @ case 3
	.4byte _080749F8 @ case 4
	.4byte _08074A1C @ case 5
	.4byte _08074A48 @ case 6
	.4byte _08074A74 @ case 7
_08074944:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074964 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074964: .4byte gSineTable
_08074968:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074994 @ =gSineTable
	movs r3, #0x90
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xe0
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074994: .4byte gSineTable
_08074998:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _080749C0 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	b _08074A9C
	.align 2, 0
_080749C0: .4byte gSineTable
_080749C4:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _080749F4 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	b _08074A9E
	.align 2, 0
_080749F4: .4byte gSineTable
_080749F8:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A18 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A18: .4byte gSineTable
_08074A1C:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08074A44 @ =gSineTable
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #2
	b _08074A9A
	.align 2, 0
_08074A44: .4byte gSineTable
_08074A48:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _08074A70 @ =gSineTable
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	b _08074A9A
	.align 2, 0
_08074A70: .4byte gSineTable
_08074A74:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	ldr r1, _08074AB8 @ =gSineTable
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x10]
	movs r0, #0xa0
	lsls r0, r0, #3
_08074A9A:
	adds r1, r1, r0
_08074A9C:
	ldrh r0, [r1]
_08074A9E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	strh r0, [r2, #0x12]
_08074AA6:
	ldr r0, _08074ABC @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _08074AC0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074AC4 @ =sub_8074BBC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08074AB8: .4byte gSineTable
_08074ABC: .4byte 0x00000115
_08074AC0: .4byte gCurTask
_08074AC4: .4byte sub_8074BBC

	thumb_func_start sub_8074AC8
sub_8074AC8: @ 0x08074AC8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08074ADC @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08074AE4
	b _08074B5A
	.align 2, 0
_08074ADC: .4byte gPlayer
_08074AE0:
	movs r0, #1
	b _08074B5C
_08074AE4:
	ldr r3, [r7, #0x70]
	ldr r0, _08074B64 @ =gCamera
	ldr r4, [r0]
	subs r3, r3, r4
	ldr r2, [r7, #0x74]
	ldr r5, [r0, #4]
	subs r2, r2, r5
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r4, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
_08074B12:
	lsls r2, r4, #2
	adds r2, r7, r2
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r1, r3, r1
	subs r1, #0xc
	adds r2, #0x62
	ldrh r0, [r2]
	adds r0, r6, r0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, r5
	bgt _08074B50
	adds r0, #0x18
	cmp r0, r5
	blt _08074B50
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08074B50
	adds r0, r2, #0
	adds r0, #0x18
	cmp r0, r1
	bge _08074AE0
_08074B50:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08074B12
_08074B5A:
	movs r0, #0
_08074B5C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074B64: .4byte gCamera

	thumb_func_start Task_Interactable_DashRing
Task_Interactable_DashRing: @ 0x08074B68
	push {r4, r5, lr}
	ldr r0, _08074B98 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	beq _08074B86
	adds r0, r4, #0
	bl sub_80748E8
_08074B86:
	adds r0, r4, #0
	bl sub_8074C48
	cmp r0, #0
	beq _08074B9C
	adds r0, r4, #0
	bl sub_8074C98
	b _08074BB0
	.align 2, 0
_08074B98: .4byte gCurTask
_08074B9C:
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r1, _08074BB8 @ =IWRAM_START + 0x30
	adds r0, r5, r1
	bl sub_80051E8
_08074BB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BB8: .4byte IWRAM_START + 0x30

	thumb_func_start sub_8074BBC
sub_8074BBC: @ 0x08074BBC
	push {r4, r5, r6, lr}
	ldr r6, _08074BF8 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	adds r0, r4, #0
	bl sub_8074C20
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08074BFC @ =IWRAM_START + 0x30
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_8074AC8
	cmp r0, #0
	bne _08074BF0
	ldr r1, [r6]
	ldr r0, _08074C00 @ =Task_Interactable_DashRing
	str r0, [r1, #8]
_08074BF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074BF8: .4byte gCurTask
_08074BFC: .4byte IWRAM_START + 0x30
_08074C00: .4byte Task_Interactable_DashRing

	thumb_func_start TaskDestructor_Interactable_DashRing
TaskDestructor_Interactable_DashRing: @ 0x08074C04
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8074C20
sub_8074C20: @ 0x08074C20
	ldr r2, [r0, #0x70]
	ldr r3, _08074C44 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r1, [r0, #0x74]
	ldr r3, [r3, #4]
	subs r1, r1, r3
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	ldr r1, [r0, #0x74]
	subs r1, r1, r3
	adds r0, #0x48
	strh r1, [r0]
	bx lr
	.align 2, 0
_08074C44: .4byte gCamera

	thumb_func_start sub_8074C48
sub_8074C48: @ 0x08074C48
	push {lr}
	ldr r1, [r0, #0x70]
	ldr r3, _08074C8C @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x74]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08074C86
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0xc
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08074C86
	subs r1, #0x18
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08074C90
_08074C86:
	movs r0, #1
	b _08074C92
	.align 2, 0
_08074C8C: .4byte gCamera
_08074C90:
	movs r0, #0
_08074C92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074C98
sub_8074C98: @ 0x08074C98
	push {lr}
	ldr r1, [r0, #0x78]
	adds r0, #0x7c
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074CB0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074CB0: .4byte gCurTask
