.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8071590
sub_8071590: @ 0x08071590
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	movs r5, #0
	ldr r0, _0807162C @ =gLoadedSaveGame
	mov sb, r0
_080715A6:
	lsls r6, r5, #0x10
	asrs r1, r6, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r2, sb
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r0, [r4]
	cmp sl, r0
	bne _08071630
	adds r1, r4, #4
	mov r0, r8
	movs r2, #6
	bl sub_807257C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08071630
	mov r1, sp
	adds r0, r4, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
	adds r1, r6, #0
	ldr r6, _0807162C @ =gLoadedSaveGame
	cmp r1, #0
	ble _08071616
	mov r8, r6
	movs r4, #0xab
	lsls r4, r4, #2
_080715EC:
	mov r3, r8
	ldr r2, [r3]
	asrs r3, r1, #0x10
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r2, r1
	subs r3, #1
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, r1, r4
	adds r2, r2, r4
	ldm r2!, {r0, r5, r7}
	stm r1!, {r0, r5, r7}
	ldm r2!, {r5, r7}
	stm r1!, {r5, r7}
	lsls r1, r3, #0x10
	cmp r1, #0
	bgt _080715EC
_08071616:
	ldr r1, [r6]
	movs r0, #0xab
	lsls r0, r0, #2
	adds r1, r1, r0
	mov r0, sp
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r5, r7}
	stm r1!, {r5, r7}
	b _080716D0
	.align 2, 0
_0807162C: .4byte gLoadedSaveGame
_08071630:
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080715A6
	movs r5, #9
	ldr r6, _080716E0 @ =gLoadedSaveGame
	mov ip, r6
	movs r4, #0xab
	lsls r4, r4, #2
_0807164A:
	mov r3, ip
	ldr r2, [r3]
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r2, r0
	subs r3, #1
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r2, r2, r1
	adds r0, r0, r4
	adds r2, r2, r4
	ldm r2!, {r1, r5, r7}
	stm r0!, {r1, r5, r7}
	ldm r2!, {r5, r7}
	stm r0!, {r5, r7}
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	cmp r3, #0
	bgt _0807164A
	ldr r0, [r6]
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r2, sl
	str r2, [r0]
	movs r5, #0
	adds r4, r6, #0
	movs r3, #0xac
	lsls r3, r3, #2
_0807168C:
	ldr r2, [r4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r2, r2, r3
	adds r2, r2, r1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0807168C
	ldr r0, [r6]
	movs r3, #0xaf
	lsls r3, r3, #2
	adds r0, r0, r3
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _080716E4 @ =0x000002BD
	adds r0, r0, r4
	strb r2, [r0]
	ldr r0, [r6]
	ldr r5, _080716E8 @ =0x000002BE
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r6]
	ldr r7, _080716EC @ =0x000002BF
	adds r0, r0, r7
	strb r2, [r0]
_080716D0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080716E0: .4byte gLoadedSaveGame
_080716E4: .4byte 0x000002BD
_080716E8: .4byte 0x000002BE
_080716EC: .4byte 0x000002BF

	thumb_func_start sub_80716F0
sub_80716F0: @ 0x080716F0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071720
	cmp r0, #1
	bgt _08071704
	cmp r0, #0
	beq _0807170A
	b _08071742
_08071704:
	cmp r0, #2
	beq _08071734
	b _08071742
_0807170A:
	ldr r0, _0807171C @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1c]
	b _08071742
	.align 2, 0
_0807171C: .4byte gLoadedSaveGame
_08071720:
	ldr r0, _08071730 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1d]
	b _08071742
	.align 2, 0
_08071730: .4byte gLoadedSaveGame
_08071734:
	ldr r0, _08071748 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x62
	bhi _08071742
	adds r0, #1
	strb r0, [r1, #0x1e]
_08071742:
	pop {r0}
	bx r0
	.align 2, 0
_08071748: .4byte gLoadedSaveGame
