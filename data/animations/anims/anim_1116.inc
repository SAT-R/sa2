
.align 2, 0
	anim_data__1116_0:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B24B 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1116_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B28B 64
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1116_2:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B2CB 64
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1116_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B30B 64
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1116_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B34B 64
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1116_5:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B38B 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1116_6:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B3CB 64
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1116_7:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B40B 64
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1116_8:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B44B 64
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_1116:
		.4byte anim_data__1116_0
		.4byte anim_data__1116_1
		.4byte anim_data__1116_2
		.4byte anim_data__1116_3
		.4byte anim_data__1116_4
		.4byte anim_data__1116_5
		.4byte anim_data__1116_6
		.4byte anim_data__1116_7
		.4byte anim_data__1116_8
