.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
	ldr r1, _08059BD8 @ =gTailsEnabled
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08059BDC @ =gMultiplayerMissingHeartbeats
	movs r5, #0
	strb r5, [r0, #3]
	strb r5, [r0, #2]
	strb r5, [r0, #1]
	strb r5, [r0]
	bl sub_80535FC
	bl UiGfxStackInit
	ldr r1, _08059BE0 @ =gDispCnt
	movs r2, #0x92
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _08059BE4 @ =gBgCntRegs
	mov r8, r3
	ldr r0, _08059BE8 @ =0x00001907
	strh r0, [r3, #2]
	ldr r0, _08059BEC @ =gBgScrollRegs
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	ldr r0, _08059BF0 @ =Task_8059F9C
	movs r4, #0x80
	lsls r4, r4, #6
	str r5, [sp]
	movs r1, #0x3c
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r1, [sp, #0x34]
	movs r3, #3
	ands r1, r3
	lsls r0, r1, #8
	adds r0, r0, r4
	strh r0, [r7, #0x28]
	adds r1, #0x20
	ldr r4, _08059BF4 @ =0x0300002A
	adds r0, r2, r4
	strb r1, [r0]
	ldr r3, _08059BF8 @ =0x0300002B
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, #2
	adds r0, r2, r4
	movs r1, #0
	strb r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, #2
	adds r0, r2, r4
	strb r1, [r0]
	str r5, [r7, #0x24]
	ldr r0, _08059BFC @ =0x03000039
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08059C00 @ =0x0300002F
	adds r2, r2, r1
	movs r3, #0
	strb r3, [r2]
	strh r5, [r7]
	strh r5, [r7, #2]
	movs r4, #2
	strh r4, [r7, #4]
	strh r5, [r7, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #8]
	movs r4, #1
	strb r4, [r7, #0xa]
	ldr r6, _08059C04 @ =0x00002030
	str r5, [sp]
	ldr r0, _08059C08 @ =Task_nullsub_805B980
	movs r1, #0x20
	adds r2, r6, #0
	movs r3, #0
	bl TaskCreate
	adds r3, r0, #0
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0xa]
	movs r1, #0x40
	strh r1, [r0, #0xc]
	movs r1, #8
	strh r1, [r0, #0xe]
	strh r5, [r0, #0x10]
	movs r1, #0xf
	strh r1, [r0, #0x12]
	strb r4, [r0, #0x16]
	movs r1, #0x5a
	strh r1, [r0, #8]
	str r5, [r0, #0x18]
	ldrh r1, [r7, #0x28]
	strh r1, [r0, #0x1c]
	ldrh r1, [r7, #0x28]
	strh r1, [r0, #0x1e]
	str r3, [r7, #0x10]
	movs r2, #0x81
	lsls r2, r2, #6
	str r5, [sp]
	ldr r0, _08059C08 @ =Task_nullsub_805B980
	movs r1, #0x20
	movs r3, #0
	bl TaskCreate
	adds r3, r0, #0
	ldrh r0, [r3, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #0xa]
	movs r1, #0x28
	strh r1, [r0, #0xc]
	strh r4, [r0, #0xe]
	strh r4, [r0, #0x10]
	strh r5, [r0, #0x12]
	movs r2, #1
	strb r2, [r0, #0x16]
	strh r5, [r0, #8]
	str r5, [r0, #0x18]
	strh r5, [r0, #0x1c]
	str r3, [r7, #0x1c]
	str r5, [sp]
	ldr r0, _08059C08 @ =Task_nullsub_805B980
	movs r1, #0x20
	adds r2, r6, #0
	movs r3, #0
	bl TaskCreate
	adds r3, r0, #0
	ldrh r0, [r3, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r0, r0, r4
	strh r5, [r0, #0xa]
	movs r1, #0x54
	strh r1, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	movs r2, #2
	strh r2, [r0, #0x10]
	strh r5, [r0, #0x12]
	movs r4, #1
	strb r4, [r0, #0x16]
	movs r1, #0x14
	strh r1, [r0, #8]
	str r5, [r0, #0x18]
	strh r5, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	str r3, [r7, #0x18]
	str r5, [sp]
	ldr r0, _08059C08 @ =Task_nullsub_805B980
	movs r1, #0x44
	adds r2, r6, #0
	movs r3, #0
	bl TaskCreate
	adds r3, r0, #0
	ldrh r2, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r2, r1
	strb r4, [r0, #0x16]
	movs r4, #3
	strh r4, [r0, #0x10]
	strh r5, [r0, #0xa]
	movs r1, #0x38
	strh r1, [r0, #0xc]
	movs r1, #8
	strh r1, [r0, #0xe]
	strh r5, [r0, #0x12]
	movs r1, #0x78
	strh r1, [r0, #8]
	movs r4, #0x8c
	lsls r4, r4, #1
	strh r4, [r0, #0x22]
	movs r1, #0x3a
	strh r1, [r0, #0x24]
	movs r1, #9
	strh r1, [r0, #0x26]
	movs r4, #4
	strh r4, [r0, #0x28]
	strh r5, [r0, #0x2a]
	ldr r4, _08059C0C @ =0x0300002E
	adds r1, r2, r4
	movs r4, #1
	strb r4, [r1]
	movs r1, #0x64
	strh r1, [r0, #0x20]
	str r5, [r0, #0x38]
	str r5, [r0, #0x30]
	movs r1, #0x8c
	lsls r1, r1, #7
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	ldr r0, _08059C10 @ =0x03000040
	adds r2, r2, r0
	strh r5, [r2]
	str r3, [r7, #0x14]
	ldr r0, _08059C14 @ =Task_805B984
	ldr r2, _08059C18 @ =0x00002020
	str r5, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	adds r3, r0, #0
	ldrh r2, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r2, r1
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
	mov r0, r8
	ldrh r1, [r0, #2]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08059C1C @ =0x06000040
	adds r0, r0, r1
	str r0, [r4, #4]
	strh r5, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [r4, #0x10]
	strh r5, [r4, #0x16]
	strh r5, [r4, #0x18]
	strh r5, [r4, #0x1a]
	strh r5, [r4, #0x1c]
	ldr r0, _08059C20 @ =0x03000021
	adds r1, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08059C24 @ =0x03000022
	adds r0, r2, r1
	movs r1, #0x10
	strb r1, [r0]
	ldr r1, _08059C28 @ =0x03000025
	adds r0, r2, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08059C2C @ =0x000002D3
	strh r0, [r4, #0xa]
	ldr r0, _08059C30 @ =0x03000020
	adds r2, r2, r0
	strb r1, [r2]
	str r3, [r7, #0x20]
	adds r0, r4, #0
	bl UpdateSpriteAnimation_BG
	adds r0, r4, #0
	bl DisplaySprite_BG
	add r4, sp, #0x30
	movs r0, #0x27
	strb r0, [r4]
	mov r1, sp
	adds r1, #0x2f
	str r1, [sp, #0x3c]
	movs r2, #0
	strb r2, [r1]
	ldr r6, _08059C34 @ =gUiGraphics
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C38 @ =gUiGraphics + 0x4
	adds r0, r0, r3
	ldr r1, [sp, #0x34]
	lsls r1, r1, #1
	mov r8, r1
	ldr r2, [sp, #0x34]
	add r8, r2
	mov r3, r8
	lsls r1, r3, #1
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [sp, #0x24]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #0x1c]
	movs r1, #8
	str r1, [sp, #0x28]
	add r2, sp, #0x2c
	mov sb, r2
	movs r3, #0xf
	strb r3, [r2]
	ldr r0, _08059C3C @ =0x06010020
	str r0, [sp, #0x10]
	movs r0, #0x2e
	add r0, sp
	mov sl, r0
	movs r0, #0xd
	mov r1, sl
	strb r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08059C40 @ =gUiGraphics + 0x8
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C44 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C48 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C4C @ =gUiGraphics + 0x14
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C50 @ =gUiGraphics + 0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r2, #0x28
	strb r2, [r4]
	movs r0, #1
	ldr r3, [sp, #0x3c]
	strb r0, [r3]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C38 @ =gUiGraphics + 0x4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r2, #0x80
	lsls r2, r2, #3
	str r2, [sp, #0x1c]
	movs r3, #0x20
	str r3, [sp, #0x28]
	movs r1, #0
	mov r0, sb
	strb r1, [r0]
	ldr r0, _08059C54 @ =0x06010420
	str r0, [sp, #0x10]
	movs r0, #0xd
	mov r2, sl
	strb r0, [r2]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C40 @ =gUiGraphics + 0x8
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C44 @ =gUiGraphics + 0xC
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C48 @ =gUiGraphics + 0x10
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C4C @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C50 @ =gUiGraphics + 0x18
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x29
	strb r0, [r4]
	movs r1, #2
	ldr r0, [sp, #0x3c]
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r2, r8
	lsls r2, r2, #0xa
	mov r8, r2
	ldr r0, [r0]
	add r0, r8
	str r0, [sp, #0x18]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C38 @ =gUiGraphics + 0x4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, _08059C58 @ =0x06011120
	str r0, [sp, #0x10]
	movs r0, #0x20
	str r0, [sp, #0x28]
	movs r2, #0
	mov r1, sb
	strb r2, [r1]
	movs r0, #9
	mov r3, sl
	strb r0, [r3]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059C40 @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059C44 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	b _08059C5C
	.align 2, 0
_08059BD8: .4byte gTailsEnabled
_08059BDC: .4byte gMultiplayerMissingHeartbeats
_08059BE0: .4byte gDispCnt
_08059BE4: .4byte gBgCntRegs
_08059BE8: .4byte 0x00001907
_08059BEC: .4byte gBgScrollRegs
_08059BF0: .4byte Task_8059F9C
_08059BF4: .4byte 0x0300002A
_08059BF8: .4byte 0x0300002B
_08059BFC: .4byte 0x03000039
_08059C00: .4byte 0x0300002F
_08059C04: .4byte 0x00002030
_08059C08: .4byte Task_nullsub_805B980
_08059C0C: .4byte 0x0300002E
_08059C10: .4byte 0x03000040
_08059C14: .4byte Task_805B984
_08059C18: .4byte 0x00002020
_08059C1C: .4byte 0x06000040
_08059C20: .4byte 0x03000021
_08059C24: .4byte 0x03000022
_08059C28: .4byte 0x03000025
_08059C2C: .4byte 0x000002D3
_08059C30: .4byte 0x03000020
_08059C34: .4byte gUiGraphics
_08059C38: .4byte gUiGraphics + 0x4
_08059C3C: .4byte 0x06010020
_08059C40: .4byte gUiGraphics + 0x8
_08059C44: .4byte gUiGraphics + 0xC
_08059C48: .4byte gUiGraphics + 0x10
_08059C4C: .4byte gUiGraphics + 0x14
_08059C50: .4byte gUiGraphics + 0x18
_08059C54: .4byte 0x06010420
_08059C58: .4byte 0x06011120
_08059C5C:
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F10 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059F14 @ =gUiGraphics + 0x14
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F18 @ =gUiGraphics + 0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x2b
	strb r0, [r4]
	movs r3, #3
	ldr r2, [sp, #0x3c]
	strb r3, [r2]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [sp, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _08059F1C @ =0x06010820
	str r0, [sp, #0x10]
	movs r1, #0x20
	str r1, [sp, #0x28]
	movs r3, #0
	mov r2, sb
	strb r3, [r2]
	movs r1, #9
	mov r0, sl
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08059F20 @ =gUiGraphics + 0x8
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059F24 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F10 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059F14 @ =gUiGraphics + 0x14
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F18 @ =gUiGraphics + 0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	movs r0, #0x2a
	strb r0, [r4]
	movs r3, #4
	ldr r2, [sp, #0x3c]
	strb r3, [r2]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [sp, #0x18]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, _08059F28 @ =0x06010920
	str r0, [sp, #0x10]
	movs r0, #0x20
	str r0, [sp, #0x28]
	movs r2, #0
	mov r1, sb
	strb r2, [r1]
	movs r0, #9
	mov r3, sl
	strb r0, [r3]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F20 @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	add r2, sp, #4
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059F24 @ =gUiGraphics + 0xC
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08059F10 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08059F14 @ =gUiGraphics + 0x14
	adds r0, r0, r3
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08059F18 @ =gUiGraphics + 0x18
	adds r0, r0, r4
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	adds r0, r2, #0
	bl sub_80528AC
	ldr r2, _08059F2C @ =0x00002010
	str r5, [sp]
	ldr r0, _08059F30 @ =Task_nullsub_805B980
	movs r1, #0xcc
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	str r1, [sp, #0x38]
	ldr r3, _08059F34 @ =0x030000C0
	adds r1, r2, r3
	str r5, [r1]
	ldr r4, _08059F38 @ =0x030000C4
	adds r1, r2, r4
	strh r5, [r1]
	adds r3, #6
	adds r1, r2, r3
	movs r4, #0
	strb r4, [r1]
	adds r3, #2
	adds r1, r2, r3
	strb r4, [r1]
	str r0, [r7, #0xc]
	ldr r4, _08059F3C @ =0x03000030
	adds r1, r2, r4
	ldr r0, _08059F40 @ =0x06012520
	str r0, [r1, #4]
	strh r5, [r1, #8]
	str r5, [r1, #0x10]
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r1, #0x16]
	movs r3, #0x6e
	mov r8, r3
	mov r4, r8
	strh r4, [r1, #0x18]
	movs r6, #0xf8
	lsls r6, r6, #3
	strh r6, [r1, #0x1a]
	strh r5, [r1, #0x1c]
	ldr r0, _08059F44 @ =0x03000051
	adds r3, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r3]
	ldr r3, _08059F48 @ =0x03000052
	adds r0, r2, r3
	movs r4, #0x10
	strb r4, [r0]
	adds r3, #3
	adds r0, r2, r3
	movs r4, #0
	strb r4, [r0]
	ldr r4, _08059F4C @ =0x000002D2
	strh r4, [r1, #0xa]
	ldr r1, _08059F50 @ =0x03000050
	adds r0, r2, r1
	movs r3, #0
	strb r3, [r0]
	ldr r0, _08059F54 @ =0x06013920
	ldr r1, [sp, #0x38]
	str r0, [r1, #4]
	strh r5, [r1, #8]
	str r5, [r1, #0x10]
	ldr r0, _08059F58 @ =0x0000FFCE
	strh r0, [r1, #0x16]
	mov r3, r8
	strh r3, [r1, #0x18]
	strh r6, [r1, #0x1a]
	strh r5, [r1, #0x1c]
	ldr r0, _08059F5C @ =0x03000021
	adds r1, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08059F60 @ =0x03000022
	adds r0, r2, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r2, r1
	movs r3, #0
	strb r3, [r0]
	ldr r0, [sp, #0x38]
	strh r4, [r0, #0xa]
	subs r1, #5
	adds r0, r2, r1
	movs r3, #6
	strb r3, [r0]
	ldr r0, _08059F64 @ =0x03000060
	adds r1, r2, r0
	ldr r0, _08059F68 @ =0x06014D20
	str r0, [r1, #4]
	strh r5, [r1, #8]
	str r5, [r1, #0x10]
	movs r3, #0x91
	lsls r3, r3, #1
	strh r3, [r1, #0x16]
	mov r0, r8
	strh r0, [r1, #0x18]
	strh r6, [r1, #0x1a]
	strh r5, [r1, #0x1c]
	ldr r0, _08059F6C @ =0x03000081
	adds r3, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r3]
	ldr r3, _08059F70 @ =0x03000082
	adds r0, r2, r3
	movs r3, #0x10
	strb r3, [r0]
	ldr r3, _08059F74 @ =0x03000085
	adds r0, r2, r3
	movs r3, #0
	strb r3, [r0]
	strh r4, [r1, #0xa]
	ldr r4, _08059F78 @ =0x03000080
	adds r0, r2, r4
	movs r1, #2
	strb r1, [r0]
	ldr r3, _08059F7C @ =0x03000090
	adds r0, r2, r3
	ldr r1, _08059F80 @ =0x06016120
	str r1, [r0, #4]
	strh r5, [r0, #8]
	str r5, [r0, #0x10]
	movs r4, #0x91
	lsls r4, r4, #1
	strh r4, [r0, #0x16]
	mov r1, r8
	strh r1, [r0, #0x18]
	movs r1, #0xe0
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r5, [r0, #0x1c]
	ldr r4, _08059F84 @ =0x030000B1
	adds r3, r2, r4
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3]
	ldr r3, _08059F88 @ =0x030000B2
	adds r1, r2, r3
	movs r4, #0x10
	strb r4, [r1]
	adds r3, #3
	adds r1, r2, r3
	movs r4, #0
	strb r4, [r1]
	ldr r1, _08059F8C @ =0x000002DA
	strh r1, [r0, #0xa]
	ldr r1, _08059F90 @ =0x030000B0
	adds r2, r2, r1
	strb r4, [r2]
	bl UpdateSpriteAnimation
	ldr r0, _08059F94 @ =gBgSprites_Unknown1
	strb r4, [r0, #1]
	ldr r0, _08059F98 @ =gBgSprites_Unknown2
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	movs r2, #0x20
	strb r2, [r0, #7]
	movs r0, #3         @ MUS_CHARACTER_SELECTION
	bl m4aSongNumStartOrContinue
	adds r0, r7, #0
	bl sub_805423C
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059F10: .4byte gUiGraphics + 0x10
_08059F14: .4byte gUiGraphics + 0x14
_08059F18: .4byte gUiGraphics + 0x18
_08059F1C: .4byte 0x06010820
_08059F20: .4byte gUiGraphics + 0x8
_08059F24: .4byte gUiGraphics + 0xC
_08059F28: .4byte 0x06010920
_08059F2C: .4byte 0x00002010
_08059F30: .4byte Task_nullsub_805B980
_08059F34: .4byte 0x030000C0
_08059F38: .4byte 0x030000C4
_08059F3C: .4byte 0x03000030
_08059F40: .4byte 0x06012520
_08059F44: .4byte 0x03000051
_08059F48: .4byte 0x03000052
_08059F4C: .4byte 0x000002D2
_08059F50: .4byte 0x03000050
_08059F54: .4byte 0x06013920
_08059F58: .4byte 0x0000FFCE
_08059F5C: .4byte 0x03000021
_08059F60: .4byte 0x03000022
_08059F64: .4byte 0x03000060
_08059F68: .4byte 0x06014D20
_08059F6C: .4byte 0x03000081
_08059F70: .4byte 0x03000082
_08059F74: .4byte 0x03000085
_08059F78: .4byte 0x03000080
_08059F7C: .4byte 0x03000090
_08059F80: .4byte 0x06016120
_08059F84: .4byte 0x030000B1
_08059F88: .4byte 0x030000B2
_08059F8C: .4byte 0x000002DA
_08059F90: .4byte 0x030000B0
_08059F94: .4byte gBgSprites_Unknown1
_08059F98: .4byte gBgSprites_Unknown2

.syntax divided
