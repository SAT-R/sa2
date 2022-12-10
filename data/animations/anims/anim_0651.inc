

anim_data__0651_0:
	mGetPalette 0x8B 16 0x80
	mGetTiles 0x1C542 120
	mAnimCmd6 0x0 0xB31A9BE6
	mAnimCmd6 0x1 0x708B5F8
	.4byte	2, 0

	mGetTiles 0x1C5BA 120
	.4byte	2, 1

	mGetTiles 0x1C632 108
	.4byte	2, 2

	mJumpBack 0x18


anim_0651:
	.4byte anim_data__0651_0
