
.align 2, 0
	anim_data__1065_0:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2875D 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1065_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28783 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1065_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287A9 26
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1065_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287C3 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1065_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287D9 28
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1065_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287F5 34
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1065_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28817 22
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_1065:
		.4byte anim_data__1065_0
		.4byte anim_data__1065_1
		.4byte anim_data__1065_2
		.4byte anim_data__1065_3
		.4byte anim_data__1065_4
		.4byte anim_data__1065_5
		.4byte anim_data__1065_6
