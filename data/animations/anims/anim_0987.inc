
.align 2, 0
	anim_data__0987_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x264FD 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0987_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2650D 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0987_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2651D 80
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0987_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2656D 42
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0987:
		.4byte anim_data__0987_0
		.4byte anim_data__0987_1
		.4byte anim_data__0987_2
		.4byte anim_data__0987_3
