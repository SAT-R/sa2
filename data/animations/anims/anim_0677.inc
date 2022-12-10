
.align 2, 0
	anim_data__0677_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBE3 2
		.4byte	3, 0

		mGetTiles 0x1CBE5 2
		.4byte	3, 1

		mGetTiles 0x1CBE7 2
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0677:
		.4byte anim_data__0677_0
