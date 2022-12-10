
.align 2, 0
	anim_data__1072_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2891D 22
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1072_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x28933 8
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1072:
		.4byte anim_data__1072_0
		.4byte anim_data__1072_1
