
.align 2, 0
	anim_data__1096_0:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A003 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1096_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x2A027 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1096_2:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A047 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1096_3:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A0EF 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1096:
		.4byte anim_data__1096_0
		.4byte anim_data__1096_1
		.4byte anim_data__1096_2
		.4byte anim_data__1096_3
