

anim_data__0055_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x2DAB 64
	mAnimCmd6 0x0 0x1006F2FA
	.4byte	2, 0

	mGetTiles 0x2DEB 64
	.4byte	2, 1

	mJumpBack 0x10


anim_0055:
	.4byte anim_data__0055_0
