
.align 2, 0
	anim_data__0471_0:
		mGetPalette 0x1 16 0x0
		mGetTiles 0x18301 20
		.4byte	4, 0

		mGetTiles 0x18315 20
		.4byte	4, 1

		mGetTiles 0x18329 20
		.4byte	4, 2

		mAnimCmd4 


.align 2, 0
	anim_0471:
		.4byte anim_data__0471_0
