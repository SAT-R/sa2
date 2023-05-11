.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
    
.if 0
	thumb_func_start initSprite_EggUtopia_Launcher
initSprite_EggUtopia_Launcher: @ 0x0807D9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0              @ r8 = me
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ r4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5              @ r5 = spriteRegionY
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0              @ sb = spriteY
	ldr r0, _0807DA8C @ =Task_807DE98
	ldr r2, _0807DA90 @ =0x00002010
	ldr r1, _0807DA94 @ =TaskDestructor_807DF38
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0              @ ip = launcher
	ldr r1, _0807DA98 @ =IWRAM_START + 0x44
	adds r3, r2, r1
	mov r5, sp
	ldrh r5, [r5, #0x30]
	strh r5, [r3]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	mov r5, ip
	str r0, [r5, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r5, sl
	lsls r1, r5, #8
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x40]
	mov r5, r8          @ r5 = me
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0807DA9C @ =IWRAM_START + 0x4C
	adds r7, r2, r1
	strh r0, [r7]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r5, _0807DAA0 @ =IWRAM_START + 0x4E
	adds r6, r2, r5
	strh r0, [r6]
	mov r1, r8
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	ldrh r5, [r7]
	adds r0, r0, r5
	ldr r5, _0807DAA4 @ =IWRAM_START + 0x50
	adds r1, r2, r5
	strh r0, [r1]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r6]
	adds r0, r0, r5
	ldr r5, _0807DAA8 @ =IWRAM_START + 0x52
	adds r2, r2, r5
	strh r0, [r2]
	mov r0, ip
	strh r4, [r0, #4]
	mov r4, sl
	strh r4, [r0, #6]
	mov r5, r8
	str r5, [r0]
	ldrb r0, [r5]
	mov r4, ip
	strb r0, [r4, #8]
	mov r5, sb
	strb r5, [r4, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DABC
	cmp r0, #1
	bgt _0807DAAC
	cmp r0, #0
	beq _0807DAB6
	b _0807DB0E
	.align 2, 0
_0807DA8C: .4byte Task_807DE98
_0807DA90: .4byte 0x00002010
_0807DA94: .4byte TaskDestructor_807DF38
_0807DA98: .4byte IWRAM_START + 0x44
_0807DA9C: .4byte IWRAM_START + 0x4C
_0807DAA0: .4byte IWRAM_START + 0x4E
_0807DAA4: .4byte IWRAM_START + 0x50
_0807DAA8: .4byte IWRAM_START + 0x52
_0807DAAC:
	cmp r0, #2
	beq _0807DAD8
	cmp r0, #3
	beq _0807DAF4
	b _0807DB0E
_0807DAB6:
	movs r0, #0
	ldrsh r1, [r1, r0]
	b _0807DAC0
_0807DABC:
	movs r5, #0
	ldrsh r1, [r7, r5]
_0807DAC0:
	mov r3, ip
	ldr r0, [r3, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x54]
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x58]
	b _0807DB0E
_0807DAD8:
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, ip
	ldr r0, [r2, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x54]
	movs r3, #0
	ldrsh r1, [r6, r3]
	ldr r0, [r2, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x58]
	b _0807DB0E
_0807DAF4:
	movs r4, #0
	ldrsh r1, [r7, r4]
	mov r5, ip
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x54]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x58]
_0807DB0E:
	movs r3, #0
	mov r4, ip          @ ip = launcher
	adds r4, #0xc       @ r4 = s
	mov r6, ip
	adds r6, #0x2d      @ r6 = launcher->s.unk21
	mov r7, ip
	adds r7, #0x2e      @ r7 = launcher->s.unk22
	movs r1, #0x31
	add r1, ip
	mov sb, r1          @ sb = launcher->s.focused
	movs r2, #0x2c
	add r2, ip
	mov sl, r2
	mov r5, ip
	adds r5, #0x44
	str r5, [sp, #0xc]
	mov r2, ip
	adds r2, #0x64
	mov r1, ip
	adds r1, #0x60
_0807DB36:
	mov r5, ip
	ldr r0, [r5, #0x54]
	str r0, [r1]
	ldr r0, [r5, #0x58]
	str r0, [r2]
	adds r2, #8
	adds r1, #8
	adds r3, #1
	cmp r3, #2
	bls _0807DB36
	adds r5, r4, #0
	movs r4, #0
	movs r1, #0
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	strb r0, [r6]
	movs r0, #0x10
	strb r0, [r7]
	mov r0, sb
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807DBA8 @ =0x00000266
	strh r0, [r5, #0xa]
	mov r1, sl
	strb r4, [r1]
	ldr r2, [sp, #0x30]     @ r2 = launcher->kind
	cmp r2, #0
	bne _0807DB94
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DB94:
	ldr r3, [sp, #0xc]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DBD0
	cmp r0, #1
	bgt _0807DBAC
	cmp r0, #0
	beq _0807DBB6
	b _0807DBD0
	.align 2, 0
_0807DBA8: .4byte 0x00000266
_0807DBAC:
	cmp r0, #2
	beq _0807DBBE
	cmp r0, #3
	beq _0807DBC6
	b _0807DBD0
_0807DBB6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807DBCC
_0807DBBE:
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	b _0807DBCC
_0807DBC6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
_0807DBCC:
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DBD0:
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif
