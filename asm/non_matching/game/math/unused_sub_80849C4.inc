

.syntax unified
.text
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084A20 @ =gSineTable
	movs r3, #0
_080849D4:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080849D4
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084A20: .4byte gSineTable
	
.syntax divided
