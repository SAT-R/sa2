

anim_data__0439_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x178CD 64
	mAnimCmd6 0x0 0x1306FDFA
	.4byte	2, 0

	mGetTiles 0x1790D 64
	.4byte	2, 1

	mGetTiles 0x1794D 64
	.4byte	2, 2

	mJumpBack 0x15


anim_0439:
	.4byte anim_data__0439_0
