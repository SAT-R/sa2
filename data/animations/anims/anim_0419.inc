

anim_data__0419_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x164D2 64
	mAnimCmd6 0x0 0x1006F2F8
	.4byte	2, 0

	mGetTiles 0x16512 64
	mAnimCmd6 0x0 0x1006F2F8
	.4byte	2, 1

	mJumpBack 0x13


anim_0419:
	.4byte anim_data__0419_0
