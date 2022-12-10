
.align 2, 0
	anim_data__1079_0:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28ECE 84
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1079_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28F22 75
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1079_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28F6D 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1079_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28F9D 68
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1079_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28FE1 68
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1079_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29025 68
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1079_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x29069 10
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1079_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29073 10
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1079_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x2907D 36
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1079_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x290A1 50
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_1079:
		.4byte anim_data__1079_0
		.4byte anim_data__1079_1
		.4byte anim_data__1079_2
		.4byte anim_data__1079_3
		.4byte anim_data__1079_4
		.4byte anim_data__1079_5
		.4byte anim_data__1079_6
		.4byte anim_data__1079_7
		.4byte anim_data__1079_8
		.4byte anim_data__1079_9
