
.align 2, 0
	anim_data__0672_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB3F 25
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0672_1:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB3F 25
		.4byte	20, 0

		mGetTiles 0x1CB58 25
		.4byte	8, 1

		mGetTiles 0x1CB71 36
		.4byte	4, 2

		mGetTiles 0x1CB95 42
		mAnimCmd6 0x0 0x1AFDE8CB
		mAnimCmd6 0x1 0x8F2FDE7
		.4byte	12, 3

		mAnimCmd4 

	anim_data__0672_2:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB71 36
		.4byte	8, 2

		mGetTiles 0x1CB3F 25
		.4byte	10, 0

		mAnimCmd4 


.align 2, 0
	anim_0672:
		.4byte anim_data__0672_0
		.4byte anim_data__0672_1
		.4byte anim_data__0672_2
