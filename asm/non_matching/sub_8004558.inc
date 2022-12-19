.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text

@ matched as sub_08153D78 in katam
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x21
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08004574
	ldrh r0, [r4, #0x1e]
	ldrh r1, [r4, #0xa]
	cmp r0, r1
	beq _0800458C
_08004574:
	movs r1, #0
	strh r1, [r4, #8]
	ldrb r0, [r2]
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x1e]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _0800459C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_0800458C:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080045A0
	movs r0, #0
	b _0800467A
	.align 2, 0
_0800459C: .4byte 0xFFFFBFFF
_080045A0:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080045B8
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, r1, r0
	strh r0, [r4, #0x1c]
	b _08004678
_080045B8:
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]                @ r1 = spriteTables
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]                @ r1 = animations
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0     
	ldr r0, [r3]
	adds r6, r1, #0
	cmp r0, #0          @ r0 = cmd
	bge _08004628
	ldr r7, _08004668 @ =gUnknown_080984AC
_080045E2:
	mvns r0, r0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #1
	beq _0800461C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800466C
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r5, r2, #0
_0800461C:
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	blt _080045E2
_08004628:
	ldr r0, [r3]            @r3 = cmd
	lsls r0, r0, #8
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r2, [r3, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08004670
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	b _08004672
	.align 2, 0
_08004664: .4byte gUnknown_03002794
_08004668: .4byte animCmdTable
_0800466C:
	adds r0, r1, #0
	b _0800467A
_08004670:
	str r2, [r4, #0xc]
_08004672:
	ldrh r0, [r4, #0x14]
	adds r0, #2
	strh r0, [r4, #0x14]
_08004678:
	movs r0, #1
_0800467A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
    	
.syntax divided
