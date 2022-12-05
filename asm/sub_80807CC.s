.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
    @ sub_80807CC has something to do with sprites.
    @ It is pointed to by 'gSpriteInits_PreStageEntry' inside data/data1_1.s
    @ Which itself is referenced by 'sub_800888C' inside data/entities_0.s.
    @ It is called on stage-entry of ONLY Sky Canyon Acts 1 & 2,
    @ the other pointers inside 'gSpriteInits_PreStageEntry' are empty.

	thumb_func_start sub_80807CC
sub_80807CC: @ 0x080807CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080808A0 @ =Task_80808DC
	ldr r2, _080808A4 @ =0x00002001
	movs r5, #0
	str r5, [sp]
	movs r1, #0x64
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _080808A8 @ =IWRAM_START + 0x60
	adds r1, r4, r2
	strh r5, [r1]
	adds r2, #2
	adds r1, r4, r2
	strh r5, [r1]
	movs r7, #0x90
	lsls r7, r7, #3
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	ldr r1, _080808AC @ =IWRAM_START + 0x21
	adds r2, r4, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r2, _080808B0 @ =IWRAM_START + 0x22
	adds r1, r4, r2
	movs r2, #0x10
	mov sl, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808B4 @ =IWRAM_START + 0x25
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	str r1, [r0, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	mov r8, r2
	str r2, [r0, #0x10]
	ldr r1, _080808B8 @ =0x06013040 @ Tiles of flying spring get preloaded into 0x06013040
	str r1, [r0, #4]
	ldr r1, _080808BC @ =0x0000024E @ SA2_ANIM_SPRING_FLYING
	strh r1, [r0, #0xa]
	ldr r2, _080808C0 @ =IWRAM_START + 0x20
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	bl sub_8004558
	ldr r1, _080808C4 @ =IWRAM_START + 0x30
	adds r0, r4, r1
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	adds r1, #0x21
	adds r2, r4, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	ldr r2, _080808C8 @ =IWRAM_START + 0x52
	adds r1, r4, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808CC @ =IWRAM_START + 0x55
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	mov r1, sb
	str r1, [r0, #0x28]
	mov r2, r8
	str r2, [r0, #0x10]
	ldr r1, _080808D0 @ =0x06012980
	str r1, [r0, #4]
	ldr r1, _080808D4 @ =0x0000024D
	strh r1, [r0, #0xa]
	ldr r1, _080808D8 @ =IWRAM_START + 0x50
	adds r4, r4, r1
	movs r2, #0
	strb r2, [r4]
	bl sub_8004558
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080808A0: .4byte Task_80808DC
_080808A4: .4byte 0x00002001
_080808A8: .4byte IWRAM_START + 0x60
_080808AC: .4byte IWRAM_START + 0x21
_080808B0: .4byte IWRAM_START + 0x22
_080808B4: .4byte IWRAM_START + 0x25
_080808B8: .4byte 0x06013040
_080808BC: .4byte 0x0000024E
_080808C0: .4byte IWRAM_START + 0x20
_080808C4: .4byte IWRAM_START + 0x30
_080808C8: .4byte IWRAM_START + 0x52
_080808CC: .4byte IWRAM_START + 0x55
_080808D0: .4byte 0x06012980
_080808D4: .4byte 0x0000024D
_080808D8: .4byte IWRAM_START + 0x50

	thumb_func_start Task_80808DC
Task_80808DC: @ 0x080808DC
	push {r4, r5, r6, lr}
	ldr r0, _08080918 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, #0
	beq _080808FA
	adds r0, r1, #0
	bl sub_8004558
_080808FA:
	movs r6, #0
	strh r6, [r5]
	ldr r1, _0808091C @ =IWRAM_START + 0x62
	adds r5, r4, r1
	ldrh r0, [r5]
	cmp r0, #0
	beq _08080910
	subs r1, #0x32
	adds r0, r4, r1
	bl sub_8004558
_08080910:
	strh r6, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080918: .4byte gCurTask
_0808091C: .4byte IWRAM_START + 0x62
