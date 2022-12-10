
.align 2, 0
	anim_data__0638_0:
		mGetPalette 0x4B 16 0xA0
		mGetTiles 0x1BE0A 49
		mAnimCmd6 0x0 0x1010F0F0
		.4byte	4, 0

		mGetTiles 0x1BE3B 49
		mAnimCmd6 0x0 0x1817EDEB
		.4byte	4, 1

		mGetTiles 0x1BE6C 49
		mAnimCmd6 0x0 0x1615EFEB
		.4byte	4, 2

		mGetTiles 0x1BE9D 49
		mAnimCmd6 0x0 0x65006500
		.4byte	4, 3

		mGetTiles 0x1BECE 49
		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0638:
		.4byte anim_data__0638_0
