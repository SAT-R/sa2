

anim_data__0491_0:
	mGetPalette 0x37 16 0xC0
	mGetTiles 0x198BF 1
	mAnimCmd6 0x0 0x303FDFD
	.4byte	3, 0

	mGetTiles 0x198C0 1
	.4byte	3, 1

	mJumpBack 0x10


anim_0491:
	.4byte anim_data__0491_0
