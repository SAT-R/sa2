
.align 2, 0
	anim_data__1049_0:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274A3 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1049_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274BF 28
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1049_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274DB 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1049_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274FF 30
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1049_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2751D 28
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1049_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27539 22
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1049_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2754F 30
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1049_7:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2756D 26
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1049_8:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27587 30
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_1049:
		.4byte anim_data__1049_0
		.4byte anim_data__1049_1
		.4byte anim_data__1049_2
		.4byte anim_data__1049_3
		.4byte anim_data__1049_4
		.4byte anim_data__1049_5
		.4byte anim_data__1049_6
		.4byte anim_data__1049_7
		.4byte anim_data__1049_8
