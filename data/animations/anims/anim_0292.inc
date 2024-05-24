

anim_data__0292_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xFDE1, 24
	mAnimCmd6 0x0, 0x610F8FA
	mAnimCmd6 0x1, 0x902F4F1
	.4byte	3, 0

	mGetTiles 0xFDF9, 24
	.4byte	3, 1

	mJumpBack 0x13


anim_0292:
	.4byte anim_data__0292_0
