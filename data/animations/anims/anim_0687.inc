
.align 2, 0
	anim_data__0687_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CD3F 42
		mAnimCmd6 0x0 0x210E9F0
		mAnimCmd6 0x1 0x1617F6E9
		.4byte	3, 0

		mAnimCmd4 

	anim_data__0687_1:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CD69 42
		mAnimCmd6 0x0 0x210E9F0
		mAnimCmd6 0x1 0x1617F6E9
		.4byte	3, 1

		mGetTiles 0x1CD3F 42
		.4byte	3, 0

		mGetTiles 0x1CD93 42
		.4byte	3, 2

		mJumpBack 0x18


.align 2, 0
	anim_0687:
		.4byte anim_data__0687_0
		.4byte anim_data__0687_1
