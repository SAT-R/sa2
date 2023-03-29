.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08010F20 @ =Task_PlatformBreakParticlesMain
	ldr r2, _08010F24 @ =0x00002011
	ldr r1, _08010F28 @ =TaskDestructor_PlatformBreakParticles
	str r1, [sp]
	movs r1, #0xf4
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r1, _08010F2C @ =IWRAM_START + 0xC0
	adds r2, r5, r1
	ldr r3, _08010F30 @ =IWRAM_START + 0xF0
	adds r0, r5, r3
	movs r1, #0
	mov sl, r1
	mov r3, sl
	strh r3, [r0]
	ldr r0, _08010F34 @ =IWRAM_START + 0xF2
	adds r1, r5, r0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	lsls r4, r4, #0x10
	ldr r1, _08010F38 @ =0xFF800000
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	ldr r0, _08010F3C @ =0xFFCE0000
	add r8, r0
	mov r1, r8
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r3, _08010F40 @ =sPlatformBreakAnimations
	mov sb, r3
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08010F48 @ =IWRAM_START + 0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #8]
	strh r1, [r6, #0x14]
	strh r1, [r6, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08010F4C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x70
	str r0, [r6, #0x10]
	ldr r2, [sp, #4]
	mov r0, sl
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r4, [r2, #6]
	mov r1, r8
	strh r1, [r2, #8]
	adds r0, r6, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r4, _08010F50 @ =0x040000D4
	str r6, [r4]
	ldr r3, _08010F54 @ =IWRAM_START + 0x30
	adds r7, r5, r3
	str r7, [r4, #4]
	ldr r0, _08010F58 @ =0x80000018
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r1, _08010F5C @ =IWRAM_START + 0xCC
	adds r2, r5, r1
	str r2, [r4, #4]
	ldr r3, _08010F60 @ =0x80000006
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x71
	str r0, [r7, #0x10]
	mov r0, r8
	lsls r6, r0, #0x10
	asrs r6, r6, #0x10
	subs r6, #0x10
	strh r6, [r2, #8]
	subs r1, #0x6c
	adds r7, r5, r1
	str r2, [r4]
	ldr r3, _08010F64 @ =IWRAM_START + 0xD8
	adds r2, r5, r3
	str r2, [r4, #4]
	ldr r0, _08010F60 @ =0x80000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xa
	add sb, r1
	add r0, sb
	ldrh r1, [r0]
	ldr r3, _08010F68 @ =IWRAM_START + 0x80
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	mov r1, sl
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08010F6C @ =IWRAM_START + 0x82
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x72
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	mov r0, r8
	strh r0, [r2, #8]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	str r7, [r4]
	ldr r1, _08010F70 @ =IWRAM_START + 0x90
	adds r7, r5, r1
	str r7, [r4, #4]
	ldr r3, _08010F58 @ =0x80000018
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r0, _08010F74 @ =IWRAM_START + 0xE4
	adds r2, r5, r0
	str r2, [r4, #4]
	ldr r1, _08010F60 @ =0x80000006
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x73
	str r0, [r7, #0x10]
	strh r6, [r2, #8]
	adds r0, #0xa3
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F20: .4byte Task_PlatformBreakParticlesMain
_08010F24: .4byte 0x00002011
_08010F28: .4byte TaskDestructor_PlatformBreakParticles
_08010F2C: .4byte IWRAM_START + 0xC0
_08010F30: .4byte IWRAM_START + 0xF0
_08010F34: .4byte IWRAM_START + 0xF2
_08010F38: .4byte 0xFF800000
_08010F3C: .4byte 0xFFCE0000
_08010F40: .4byte sPlatformBreakAnimations
_08010F44: .4byte gCurrentLevel
_08010F48: .4byte IWRAM_START + 0x20
_08010F4C: .4byte IWRAM_START + 0x22
_08010F50: .4byte 0x040000D4
_08010F54: .4byte IWRAM_START + 0x30
_08010F58: .4byte 0x80000018
_08010F5C: .4byte IWRAM_START + 0xCC
_08010F60: .4byte 0x80000006
_08010F64: .4byte IWRAM_START + 0xD8
_08010F68: .4byte IWRAM_START + 0x80
_08010F6C: .4byte IWRAM_START + 0x82
_08010F70: .4byte IWRAM_START + 0x90
_08010F74: .4byte IWRAM_START + 0xE4

	
.syntax divided
