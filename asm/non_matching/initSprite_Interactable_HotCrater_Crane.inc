.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0              @ r8 = ia
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10      @ r4 = spriteRegionX
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10      @ r5 = spriteRegionY
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18      @ r6 = spriteY
	ldr r0, _08073970 @ =Task_8073AA8
	movs r1, #0xe6
	lsls r1, r1, #1
	ldr r2, _08073974 @ =0x00002010
	ldr r3, _08073978 @ =TaskDestructor_80743B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0         @ r7 = crane
	ldr r1, _0807397C @ =IWRAM_START + 0x1B8
	adds r0, r2, r1
	movs r3, #0
	str r3, [r0]
	mov r1, r8              @ r1 = ia
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r7]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r7, #4]
	ldr r4, _08073980 @ =IWRAM_START + 0x1C4
	adds r0, r2, r4
	str r1, [r0]
	ldrb r1, [r1]
	adds r4, #4
	adds r0, r2, r4
	strb r1, [r0]
	ldr r1, _08073984 @ =IWRAM_START + 0x1C9
	adds r0, r2, r1
	strb r6, [r0]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r1, r8
	strb r0, [r1]

	ldr r4, _08073988 @ =IWRAM_START + 0x8
	adds r5, r2, r4     @ r5 = cs
	ldr r0, _0807398C @ =IWRAM_START + 0x128
	adds r2, r2, r0
	str r2, [r5]
	movs r4, #0
	movs r0, #5
	strh r0, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #8]
	str r3, [r5, #0xc]
	str r3, [r5, #0x10]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	ldr r0, [r5]
	strh r3, [r0, #8]
	ldr r0, [r5]
	strh r3, [r0, #0x14]
	ldr r0, [r5]
	strh r3, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	strb r4, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073990 @ =0x06012BC0
	str r0, [r1, #4]
	ldr r0, _08073994 @ =0x00000235
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r4, [r0]
	ldr r0, [r5]
	bl sub_8004558
	movs r4, #0
	movs r1, #0
	mov r8, r1
	movs r6, #0
_08073952:
	lsls r0, r4, #5         @ i * 32
	adds r0, #0x28
	adds r5, r7, r0         @ r5 = crane->unk28[i]
	strh r6, [r5, #4]
	cmp r4, #0
	bne _08073998
	movs r0, #2
	strh r0, [r5, #4]
	str r4, [r5]
	strh r4, [r5, #8]
	movs r0, #0xb0
	lsls r0, r0, #6
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	b _08073A00
	.align 2, 0
_08073970: .4byte Task_8073AA8
_08073974: .4byte 0x00002010
_08073978: .4byte TaskDestructor_80743B8
_0807397C: .4byte IWRAM_START + 0x1B8
_08073980: .4byte IWRAM_START + 0x1C4
_08073984: .4byte IWRAM_START + 0x1C9
_08073988: .4byte IWRAM_START + 0x8
_0807398C: .4byte IWRAM_START + 0x128
_08073990: .4byte 0x06012BC0
_08073994: .4byte 0x00000235
_08073998:
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r1, r7, r0
	str r1, [r5]
	strh r6, [r5, #8]
	str r6, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r5, #0x10]
	cmp r4, #1
	bne _08073A00
	movs r0, #4
	strh r0, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	ldr r0, [r5]
	strh r6, [r0, #8]
	ldr r0, [r5]
	strh r6, [r0, #0x14]
	ldr r0, [r5]
	strh r6, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]

	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073AA0 @ =0x06012B80
	str r0, [r1, #4]
	movs r0, #0x8d
	lsls r0, r0, #2 @ SA2_ANIM_THROW_CRANE_HOOK
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r4, [r0]
	ldr r0, [r5]
	bl sub_8004558
_08073A00:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _08073952

    @ r7 = crane
	adds r5, r7, #0
	adds r5, #0xe8
	movs r4, #0xac
	lsls r4, r4, #1
	adds r1, r7, r4
	str r1, [r5]
	movs r2, #0
	movs r4, #0
	movs r0, #5
	strh r0, [r5, #4]
	adds r0, #0xfb
	strh r0, [r5, #8]
	str r4, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r5, #0x10]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	ldr r0, [r5]
	strh r4, [r0, #8]
	ldr r0, [r5]
	strh r4, [r0, #0x14]
	ldr r0, [r5]
	strh r4, [r0, #0x1c]
	ldr r0, [r5]
	adds r0, #0x21
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x25
	strb r2, [r0]
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldr r0, _08073AA4 @ =0x06012980
	str r0, [r1, #4]
	movs r0, #0x8d
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	ldr r0, [r5]
	adds r0, #0x20
	strb r2, [r0]
	ldr r0, [r5]
	bl sub_8004558
	movs r0, #0x84
	lsls r0, r0, #1
	adds r5, r7, r0
	str r4, [r5]
	movs r0, #2
	strh r0, [r5, #4]
	strh r4, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	adds r0, r7, #0
	bl sub_807447C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073AA0: .4byte 0x06012B80
_08073AA4: .4byte 0x06012980

.syntax divided
