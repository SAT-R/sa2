
.align 2, 0
	anim_data__1032_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x271FD 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1032:
		.4byte anim_data__1032_0
