.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	movs r1, #100
	bl Div
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805BCB8
	movs r0, #3
	str r0, [sp, #0x38]
	b _0805BCCE
_0805BCB8:
	ldr r0, [sp, #0x30]
	movs r1, #10
	bl Div
	lsls r0, r0, #0x18
	movs r1, #1
	str r1, [sp, #0x38]
	cmp r0, #0
	beq _0805BCCE
	movs r2, #2
	str r2, [sp, #0x38]
_0805BCCE:
	mov r3, sp
	adds r3, #0x2c
	str r3, [sp, #0x3c]
	movs r0, #0x32
	strb r0, [r3]
	mov r0, sp
	adds r0, #0x2b
	str r0, [sp, #0x40]
	movs r0, #4
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	ldr r7, _0805BE00 @ =gUiGraphics
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	movs r2, #0x20
	str r2, [sp, #0x24]
	add r3, sp, #0x28
	mov sl, r3
	movs r0, #6
	strb r0, [r3]
	ldr r0, _0805BE04 @ =0x06015DA0
	str r0, [sp, #0xc]
	mov r5, sp
	adds r5, #0x2a
	movs r1, #0xd
	strb r1, [r5]
	ldr r2, [sp, #0x3c]
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	ldr r3, [sp, #0x3c]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r0, #0x10
	ldr r1, [sp, #0x3c]
	strb r0, [r1]
	movs r0, #8
	ldr r2, [sp, #0x40]
	strb r0, [r2]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x18]
	movs r2, #0x20
	str r2, [sp, #0x24]
	movs r0, #6
	mov r3, sl
	strb r0, [r3]
	ldr r0, _0805BE08 @ =0x060177A0
	str r0, [sp, #0xc]
	movs r1, #0xd
	strb r1, [r5]
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r1, sp
	movs r3, #0xe6
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	strb r0, [r1, #8]
	adds r2, #8
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #9]
	adds r3, #8
	adds r0, r7, r3
	ldr r0, [r0]
	strb r0, [r1, #0xa]
	adds r2, #8
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	ldr r3, [sp, #0x38]
	cmp r3, #1
	bne _0805BE0C
	movs r0, #0x2f
	b _0805BE1C
	.align 2, 0
_0805BE00: .4byte gUiGraphics
_0805BE04: .4byte 0x06015DA0
_0805BE08: .4byte 0x060177A0
_0805BE0C:
	ldr r2, [sp, #0x38]
	cmp r2, #2
	bne _0805BE1A
	movs r0, #0x30
	add r3, sp, #0x2c
	strb r0, [r3]
	b _0805BE20
_0805BE1A:
	movs r0, #0x31
_0805BE1C:
	add r1, sp, #0x2c
	strb r0, [r1]
_0805BE20:
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x44]
	movs r0, #2
	strb r0, [r2]
	ldr r7, _0805C160 @ =gUiGraphics
	add r6, sp, #0x2c
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0xe0
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	movs r3, #0x20
	str r3, [sp, #0x24]
	mov r0, sp
	adds r0, #0x28
	str r0, [sp, #0x48]
	movs r1, #6
	strb r1, [r0]
	ldr r0, _0805C164 @ =0x060167A0
	str r0, [sp, #0xc]
	subs r2, #1
	str r2, [sp, #0x4c]
	movs r3, #0xd
	strb r3, [r2]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
	ldr r0, [sp, #0x38]
	cmp r0, #3
	beq _0805BED6
	b _0805C19C
_0805BED6:
	movs r1, #1
	str r1, [sp, #0x34]
	ldr r0, [sp, #0x30]
	movs r1, #100
	bl Div
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp, #0x30]
	movs r1, #100
	bl Mod
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	cmp r5, #0
	beq _0805BFB2
	movs r2, #0
	str r2, [sp, #0x34]
	movs r3, #0x20
	strb r3, [r6]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	lsls r4, r5, #7
	ldr r1, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [sp, #0x14]
	ldr r2, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r0, _0805C170 @ =0x060169E0
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r2, #6
	ldr r1, [sp, #0x48]
	strb r2, [r1]
	movs r0, #0xd
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	ldr r1, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	movs r0, #0xe5
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r2, _0805C180 @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r3, #0x20
	strb r3, [r6]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	ldr r1, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r2, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r0, _0805C184 @ =0x06016A60
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r2, #6
	ldr r1, [sp, #0x48]
	strb r2, [r1]
	movs r0, #0xd
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	ldr r1, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r2, _0805C180 @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
_0805BFB2:
	ldr r0, [sp, #0x30]
	movs r1, #10
	bl Div
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp, #0x30]
	movs r1, #10
	bl Mod
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	cmp r5, #0
	bne _0805BFD6
	ldr r3, [sp, #0x34]
	cmp r3, #0
	bne _0805C094
_0805BFD6:
	movs r0, #0
	str r0, [sp, #0x34]
	movs r1, #0x20
	strb r1, [r6]
	add r2, sp, #0x38
	ldrb r3, [r2]
	ldr r2, [sp, #0x44]
	strb r3, [r2]
	lsls r5, r5, #7
	mov sb, r5
	ldr r3, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r3]
	add r0, sb
	str r0, [sp, #0x14]
	ldr r1, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r1]
	str r0, [sp, #0x20]
	ldr r0, _0805C188 @ =0x06016BA0
	str r0, [sp, #0xc]
	movs r2, #0x40
	str r2, [sp, #0x18]
	movs r3, #0x20
	str r3, [sp, #0x24]
	movs r1, #6
	ldr r0, [sp, #0x48]
	strb r1, [r0]
	movs r3, #0xd
	ldr r2, [sp, #0x4c]
	strb r3, [r2]
	ldr r1, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	movs r0, #0xe5
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r7, r7, r2
	ldr r0, [r7]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r3, #0x20
	strb r3, [r6]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	ldr r1, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	add r0, sb
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r2, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r0, _0805C18C @ =0x06016C20
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r2, #6
	ldr r1, [sp, #0x48]
	strb r2, [r1]
	movs r0, #0xd
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	ldr r1, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r0, [r7]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
_0805C094:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0805C0A6
	ldr r2, [sp, #0x34]
	cmp r2, #0
	beq _0805C0A6
	b _0805C416
_0805C0A6:
	movs r3, #0x20
	add r0, sp, #0x2c
	strb r3, [r0]
	movs r1, #3
	movs r2, #0x2b
	add r2, sp
	strb r1, [r2]
	ldr r2, _0805C160 @ =gUiGraphics
	lsls r7, r5, #7
	ldr r3, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r3]
	adds r0, r0, r7
	str r0, [sp, #0x14]
	ldr r1, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r1]
	str r0, [sp, #0x20]
	ldr r0, _0805C190 @ =0x06016BE0
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r1, #6
	add r3, sp, #0x28
	strb r1, [r3]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	ldr r3, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r3]
	str r0, [sp, #4]
	mov r1, sp
	ldr r3, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r3]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	ldr r3, _0805C194 @ =gUiGraphics + ((32 * 0x1C) + 0x14)
	ldr r0, [r3]
	strb r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r5, r2, r0
	ldr r0, [r5]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0x20
	add r2, sp, #0x2c
	strb r1, [r2]
	movs r3, #3
	movs r0, #0x2b
	add r0, sp
	strb r3, [r0]
	ldr r1, _0805C168 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	adds r0, r0, r7
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r2, _0805C16C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r0, _0805C198 @ =0x06016C60
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r1, #6
	add r2, sp, #0x28
	strb r1, [r2]
	movs r3, #0xd
	movs r0, #0x2a
	add r0, sp
	strb r3, [r0]
	ldr r1, _0805C174 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C178 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C17C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	ldr r2, _0805C194 @ =gUiGraphics + ((32 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r0, [r5]
	b _0805C318
	.align 2, 0
_0805C160: .4byte gUiGraphics
_0805C164: .4byte 0x060167A0
_0805C168: .4byte gUiGraphics + ((32 * 0x1C) + 0)
_0805C16C: .4byte gUiGraphics + ((32 * 0x1C) + 4)
_0805C170: .4byte 0x060169E0
_0805C174: .4byte gUiGraphics + ((32 * 0x1C) + 8)
_0805C178: .4byte gUiGraphics + ((32 * 0x1C) + 0xC)
_0805C17C: .4byte gUiGraphics + ((32 * 0x1C) + 0x10)
_0805C180: .4byte gUiGraphics + ((32 * 0x1C) + 0x18)
_0805C184: .4byte 0x06016A60
_0805C188: .4byte 0x06016BA0
_0805C18C: .4byte 0x06016C20
_0805C190: .4byte 0x06016BE0
_0805C194: .4byte gUiGraphics + ((32 * 0x1C) + 0x14)
_0805C198: .4byte 0x06016C60
_0805C19C:
	ldr r3, [sp, #0x38]
	cmp r3, #2
	beq _0805C1A4
	b _0805C34C
_0805C1A4:
	ldr r0, [sp, #0x30]
	movs r1, #10
	bl Div
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp, #0x30]
	movs r1, #10
	bl Mod
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	movs r0, #0x20
	strb r0, [r6]
	movs r2, #3
	ldr r1, [sp, #0x44]
	strb r2, [r1]
	lsls r5, r5, #7
	mov r8, r5
	ldr r3, _0805C324 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r3]
	add r0, r8
	str r0, [sp, #0x14]
	ldr r1, _0805C328 @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r1]
	str r0, [sp, #0x20]
	ldr r0, _0805C32C @ =0x060169E0
	str r0, [sp, #0xc]
	movs r2, #0x40
	str r2, [sp, #0x18]
	movs r3, #0x20
	str r3, [sp, #0x24]
	movs r1, #6
	ldr r0, [sp, #0x48]
	strb r1, [r0]
	movs r3, #0xd
	ldr r2, [sp, #0x4c]
	strb r3, [r2]
	ldr r1, _0805C330 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C334 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C338 @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	movs r0, #0xe5
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r2, _0805C33C @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r3, #0x20
	strb r3, [r6]
	movs r1, #3
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	ldr r2, _0805C324 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r2]
	add r0, r8
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r3, _0805C328 @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r3]
	str r0, [sp, #0x20]
	ldr r0, _0805C340 @ =0x06016A60
	str r0, [sp, #0xc]
	movs r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x20
	str r1, [sp, #0x24]
	movs r3, #6
	ldr r2, [sp, #0x48]
	strb r3, [r2]
	movs r1, #0xd
	ldr r0, [sp, #0x4c]
	strb r1, [r0]
	ldr r2, _0805C330 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r3, _0805C334 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r3]
	strb r0, [r1, #8]
	ldr r2, _0805C338 @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r3, _0805C33C @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r3]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r0, #0x20
	strb r0, [r6]
	movs r2, #3
	ldr r1, [sp, #0x44]
	strb r2, [r1]
	ldr r3, [sp, #0x30]
	lsls r7, r3, #7
	ldr r1, _0805C324 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [sp, #0x14]
	ldr r2, _0805C328 @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r0, _0805C344 @ =0x06016BA0
	str r0, [sp, #0xc]
	movs r3, #0x40
	str r3, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r2, #6
	ldr r1, [sp, #0x48]
	strb r2, [r1]
	movs r0, #0xd
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	ldr r1, _0805C330 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _0805C334 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r3, _0805C338 @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r3]
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r2, _0805C33C @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r3, #0x20
	strb r3, [r6]
	movs r1, #3
	ldr r0, [sp, #0x44]
	strb r1, [r0]
	ldr r2, _0805C324 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r2]
	adds r0, r0, r7
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r3, _0805C328 @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r3]
	str r0, [sp, #0x20]
	ldr r0, _0805C348 @ =0x06016C20
	str r0, [sp, #0xc]
	movs r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x20
	str r1, [sp, #0x24]
	movs r3, #6
	ldr r2, [sp, #0x48]
	strb r3, [r2]
	movs r1, #0xd
	ldr r0, [sp, #0x4c]
	strb r1, [r0]
	ldr r2, _0805C330 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r3, _0805C334 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r3]
	strb r0, [r1, #8]
	ldr r2, _0805C338 @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r0, [r1, #0xa]
	ldr r3, _0805C33C @ =gUiGraphics + ((32 * 0x1C) + 0x18)
	ldr r0, [r3]
_0805C318:
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	b _0805C416
	.align 2, 0
_0805C324: .4byte gUiGraphics + ((32 * 0x1C) + 0)
_0805C328: .4byte gUiGraphics + ((32 * 0x1C) + 4)
_0805C32C: .4byte 0x060169E0
_0805C330: .4byte gUiGraphics + ((32 * 0x1C) + 8)
_0805C334: .4byte gUiGraphics + ((32 * 0x1C) + 0xC)
_0805C338: .4byte gUiGraphics + ((32 * 0x1C) + 0x10)
_0805C33C: .4byte gUiGraphics + ((32 * 0x1C) + 0x18)
_0805C340: .4byte 0x06016A60
_0805C344: .4byte 0x06016BA0
_0805C348: .4byte 0x06016C20
_0805C34C:
	ldr r0, [sp, #0x30]
	lsls r0, r0, #0x18
	str r0, [sp, #0x50]
	movs r1, #0x20
	add r2, sp, #0x2c
	strb r1, [r2]
	movs r3, #3
	movs r0, #0x2b
	add r0, sp
	strb r3, [r0]
	ldr r1, [sp, #0x50]
	lsrs r1, r1, #0x11
	str r1, [sp, #0x54]
	ldr r2, _0805C428 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r3, _0805C42C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r3]
	str r0, [sp, #0x20]
	ldr r0, _0805C430 @ =0x060169E0
	str r0, [sp, #0xc]
	movs r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x20
	str r1, [sp, #0x24]
	movs r2, #6
	add r3, sp, #0x28
	strb r2, [r3]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	ldr r2, _0805C434 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r3, _0805C438 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r3]
	strb r0, [r1, #8]
	ldr r2, _0805C43C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r3, _0805C440 @ =gUiGraphics + ((32 * 0x1C) + 0x14)
	ldr r0, [r3]
	strb r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [r5]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0x20
	add r2, sp, #0x2c
	strb r1, [r2]
	movs r3, #3
	movs r0, #0x2b
	add r0, sp
	strb r3, [r0]
	ldr r1, _0805C428 @ =gUiGraphics + ((32 * 0x1C) + 0)
	ldr r0, [r1]
	ldr r2, [sp, #0x54]
	adds r0, r0, r2
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r3, _0805C42C @ =gUiGraphics + ((32 * 0x1C) + 4)
	ldr r0, [r3]
	str r0, [sp, #0x20]
	ldr r0, _0805C444 @ =0x06016A60
	str r0, [sp, #0xc]
	movs r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x20
	str r1, [sp, #0x24]
	movs r2, #6
	add r3, sp, #0x28
	strb r2, [r3]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	ldr r2, _0805C434 @ =gUiGraphics + ((32 * 0x1C) + 8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r3, _0805C438 @ =gUiGraphics + ((32 * 0x1C) + 0xC)
	ldr r0, [r3]
	strb r0, [r1, #8]
	ldr r2, _0805C43C @ =gUiGraphics + ((32 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r3, _0805C440 @ =gUiGraphics + ((32 * 0x1C) + 0x14)
	ldr r0, [r3]
	strb r0, [r1, #0xa]
	ldr r0, [r5]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
_0805C416:
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C428: .4byte gUiGraphics + ((32 * 0x1C) + 0)
_0805C42C: .4byte gUiGraphics + ((32 * 0x1C) + 4)
_0805C430: .4byte 0x060169E0
_0805C434: .4byte gUiGraphics + ((32 * 0x1C) + 8)
_0805C438: .4byte gUiGraphics + ((32 * 0x1C) + 0xC)
_0805C43C: .4byte gUiGraphics + ((32 * 0x1C) + 0x10)
_0805C440: .4byte gUiGraphics + ((32 * 0x1C) + 0x14)
_0805C444: .4byte 0x06016A60

.syntax divided
