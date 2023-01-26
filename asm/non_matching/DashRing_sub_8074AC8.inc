
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08074ADC @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08074AE4
	b _08074B5A
	.align 2, 0
_08074ADC: .4byte gPlayer
_08074AE0:
	movs r0, #1
	b _08074B5C
_08074AE4:
	ldr r3, [r7, #0x70]
	ldr r0, _08074B64 @ =gCamera
	ldr r4, [r0]
	subs r3, r3, r4     @ r3 = ringScreenX = ring->posX - gCamera.x
	ldr r2, [r7, #0x74]
	ldr r5, [r0, #4]
	subs r2, r2, r5     @ r2 = ringScreenY = ring->posY - gCamera.y
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0          @ playerScreenY
	movs r4, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10      @ r3 = ringScreenX
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10      @ r6 = ringScreenY
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10      @ r5 = playerScreenX
_08074B12:
	lsls r2, r4, #2
	adds r2, r7, r2
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r1, r3, r1
	subs r1, #0xc
	adds r2, #0x62
	ldrh r0, [r2]
	adds r0, r6, r0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10  @ r2 = someY
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10  @ r0 = someX
	cmp r0, r5
	bgt _08074B50
	adds r0, #0x18
	cmp r0, r5
	blt _08074B50
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08074B50
	adds r0, r2, #0
	adds r0, #0x18
	cmp r0, r1
	bge _08074AE0
_08074B50:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08074B12
_08074B5A:
	movs r0, #0
_08074B5C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074B64: .4byte gCamera

.syntax divided
