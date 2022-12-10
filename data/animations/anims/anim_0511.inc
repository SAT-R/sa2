
.align 2, 0
	anim_data__0511_0:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A1E3 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0511_1:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A1FC 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	5, 1

		mGetTiles 0x1A215 25
		.4byte	5, 2

		mGetTiles 0x1A22E 25
		.4byte	5, 3

		mGetTiles 0x1A247 25
		.4byte	5, 4

		mAnimCmd4 

	anim_data__0511_2:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A247 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	2, 4

		mGetTiles 0x1A260 25
		.4byte	2, 5

		mGetTiles 0x1A279 25
		.4byte	2, 6

		mGetTiles 0x1A292 25
		.4byte	2, 7

		mJumpBack 0x1A

	anim_data__0511_3:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A247 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	5, 4

		mGetTiles 0x1A22E 25
		.4byte	5, 3

		mGetTiles 0x1A215 25
		.4byte	5, 2

		mGetTiles 0x1A1FC 25
		.4byte	5, 1

		mAnimCmd4 


.align 2, 0
	anim_0511:
		.4byte anim_data__0511_0
		.4byte anim_data__0511_1
		.4byte anim_data__0511_2
		.4byte anim_data__0511_3
