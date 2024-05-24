

anim_data__0348_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12BFE, 64
	mAnimCmd6 0x0, 0x1007F7F9
	.4byte	2, 0

	mGetTiles 0x12C3E, 64
	.4byte	2, 1

	mGetTiles 0x12C7E, 64
	.4byte	2, 2

	mJumpBack 0x15


anim_0348:
	.4byte anim_data__0348_0
