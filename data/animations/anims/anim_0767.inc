
.align 2, 0
	anim_data__0767_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1FB43 28
		.4byte	3, 0

		mGetTiles 0x1FB5F 28
		.4byte	3, 1

		mGetTiles 0x1FB7B 28
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0767_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1FB97 20
		.4byte	1, 3

		mGetTiles 0x1FBAB 24
		.4byte	1, 4

		mGetTiles 0x1FBC3 18
		.4byte	12, 5

		mGetTiles 0x1FBD5 24
		.4byte	2, 6

		mGetTiles 0x1FB97 20
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0767:
		.4byte anim_data__0767_0
		.4byte anim_data__0767_1
