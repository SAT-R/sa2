

anim_data__0377_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x147CC, 20
	mAnimCmd6 0x0, 0x806EEFA
	.4byte	2, 0

	mGetTiles 0x147E0, 25
	.4byte	2, 1

	mGetTiles 0x147F9, 24
	mAnimCmd6 0x0, 0x806EEFA
	.4byte	2, 2

	mGetTiles 0x14811, 24
	.4byte	2, 3

	mGetTiles 0x14829, 24
	.4byte	2, 4

	mJumpBack 0x12


anim_0377:
	.4byte anim_data__0377_0
