
.align 2, 0
	anim_data__0782_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x206B4 15
		.4byte	6, 0

		mGetTiles 0x206C3 16
		.4byte	8, 1

		mGetTiles 0x206D3 20
		.4byte	8, 2

		mGetTiles 0x206E7 16
		.4byte	12, 3

		mGetTiles 0x206E7 16
		.4byte	4, 3

		mGetTiles 0x206E7 16
		.4byte	14, 3

		mAnimCmd4 

	anim_data__0782_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x206E7 16
		.4byte	6, 3

		mGetTiles 0x206F7 16
		.4byte	6, 4

		mGetTiles 0x20707 20
		.4byte	16, 5

		mAnimCmd4 


.align 2, 0
	anim_0782:
		.4byte anim_data__0782_0
		.4byte anim_data__0782_1
