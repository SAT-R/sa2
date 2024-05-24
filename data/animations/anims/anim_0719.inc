

anim_data__0719_0:
	mGetPalette 0x9D, 16, 0x80
	mGetTiles 0x1D8F2, 4
	mAnimCmd6 0x0, 0x404FCFC
	.4byte	2, 0

	mGetTiles 0x1D8F6, 4
	mAnimCmd6 0x0, 0x0
	.4byte	2, 1

	mJumpBack 0x13


anim_0719:
	.4byte anim_data__0719_0
