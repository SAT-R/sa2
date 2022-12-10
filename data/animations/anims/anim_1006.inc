
.align 2, 0
	anim_data__1006_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26AC3 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1006_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26AEB 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1006_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26B13 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1006_3:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26B3B 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1006_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26B63 38
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1006:
		.4byte anim_data__1006_0
		.4byte anim_data__1006_1
		.4byte anim_data__1006_2
		.4byte anim_data__1006_3
		.4byte anim_data__1006_4
