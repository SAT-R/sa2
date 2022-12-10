
.align 2, 0
	anim_data__0068_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CAA 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0068_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CBE 16
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0068_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CCE 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0068_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CE2 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0068_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CF6 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0068_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D0A 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0068_6:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D1E 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0068_7:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D32 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0068_8:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D46 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0068_9:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D5A 16
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0068_10:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D6A 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 10

		mAnimCmd4 


.align 2, 0
	anim_0068:
		.4byte anim_data__0068_0
		.4byte anim_data__0068_1
		.4byte anim_data__0068_2
		.4byte anim_data__0068_3
		.4byte anim_data__0068_4
		.4byte anim_data__0068_5
		.4byte anim_data__0068_6
		.4byte anim_data__0068_7
		.4byte anim_data__0068_8
		.4byte anim_data__0068_9
		.4byte anim_data__0068_10
