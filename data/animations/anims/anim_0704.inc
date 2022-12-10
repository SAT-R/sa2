
.align 2, 0
	anim_data__0704_0:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D32B 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0704_1:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D32B 64
		.4byte	2, 0

		mGetTiles 0x1D36B 64
		.4byte	2, 1

		mGetTiles 0x1D3AB 64
		.4byte	2, 2

		mGetTiles 0x1D3EB 64
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0704_2:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D42B 64
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0704:
		.4byte anim_data__0704_0
		.4byte anim_data__0704_1
		.4byte anim_data__0704_2
