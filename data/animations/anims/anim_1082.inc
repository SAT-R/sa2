
.align 2, 0
	anim_data__1082_0:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29562 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1082_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x295BC 45
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1082_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x295E9 69
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1082_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2962E 68
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1082_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29672 68
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1082_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x296B6 68
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1082_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x296FA 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1082_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29703 15
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1082_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29712 46
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__1082_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29740 51
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_1082:
		.4byte anim_data__1082_0
		.4byte anim_data__1082_1
		.4byte anim_data__1082_2
		.4byte anim_data__1082_3
		.4byte anim_data__1082_4
		.4byte anim_data__1082_5
		.4byte anim_data__1082_6
		.4byte anim_data__1082_7
		.4byte anim_data__1082_8
		.4byte anim_data__1082_9
