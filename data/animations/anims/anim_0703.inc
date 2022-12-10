
.align 2, 0
	anim_data__0703_0:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D1EB 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0703_1:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D1EB 64
		.4byte	2, 0

		mGetTiles 0x1D22B 64
		.4byte	2, 1

		mGetTiles 0x1D26B 64
		.4byte	2, 2

		mGetTiles 0x1D2AB 64
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0703_2:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D2EB 64
		mAnimCmd6 0x0 0x10001
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0703:
		.4byte anim_data__0703_0
		.4byte anim_data__0703_1
		.4byte anim_data__0703_2
