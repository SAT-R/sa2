.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08042660 @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1         @ r1 = boss
	ldr r0, _08042664 @ =IWRAM_START + 0x18
	adds r4, r2, r0
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	ldr r0, [r4, #4]
	adds r0, r0, r5
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	adds r0, r0, r6
	str r0, [r4, #8]
	movs r3, #0
	ldr r0, _08042668 @ =IWRAM_START + 0x30
	adds r0, r0, r2
	mov ip, r0
	ldr r0, _0804266C @ =IWRAM_START + 0x34
	adds r7, r2, r0
_0804262A:
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	mov r0, ip
	adds r2, r0, r1
	ldr r0, [r2]
	adds r0, r0, r5
	str r0, [r2]
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0804262A
	ldr r0, [r4, #0x54]
	adds r0, r0, r5
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	adds r0, r0, r6
	str r0, [r4, #0x58]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042660: .4byte gActiveBossTask
_08042664: .4byte IWRAM_START + 0x18
_08042668: .4byte IWRAM_START + 0x30
_0804266C: .4byte IWRAM_START + 0x34

.syntax divided
