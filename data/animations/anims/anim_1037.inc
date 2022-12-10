
.align 2, 0
	anim_data__1037_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27287 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1037_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27291 10
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1037:
		.4byte anim_data__1037_0
		.4byte anim_data__1037_1
