

anim_data__0294_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xFE71, 15
	mAnimCmd6 0x0, 0x715FAFB
	mAnimCmd6 0x1, 0xA02F6F5
	.4byte	2, 0

	mGetTiles 0xFE80, 15
	.4byte	2, 1

	mJumpBack 0x13


anim_0294:
	.4byte anim_data__0294_0
