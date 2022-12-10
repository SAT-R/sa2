
.align 2, 0
	anim_data__1112_0:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABC2 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1112_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABD4 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1112_2:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABE6 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1112_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABF8 18
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1112_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2AC0A 18
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1112:
		.4byte anim_data__1112_0
		.4byte anim_data__1112_1
		.4byte anim_data__1112_2
		.4byte anim_data__1112_3
		.4byte anim_data__1112_4
